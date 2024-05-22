Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836888CC12B
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 14:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E8710ED0E;
	Wed, 22 May 2024 12:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="HAL+jQ5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0278F10ED1D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 12:24:44 +0000 (UTC)
Received: from fpc.intra.ispras.ru (unknown [10.10.165.15])
 by mail.ispras.ru (Postfix) with ESMTPSA id C31C74076723;
 Wed, 22 May 2024 12:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru C31C74076723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1716380681;
 bh=rUu2N2ra3UJOVujeAUs8p16HRSJ3CxlvSQFgHAEciJQ=;
 h=From:To:Cc:Subject:Date:From;
 b=HAL+jQ5B00d6NN5gqADYkmUDvs/AwYoXznpBcLvjjuk5ceUT40KCjExf2AMX94rWg
 qJS4NzODO20uMm0SQfeqo5JHLEPRZfgfR40ez2S52YcR7YBOMm5qqqT2XIVCQvqsQB
 d5S34/eA0XruF8UaVr57Jem/4C6SHQTdM6IMHHMU=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: [PATCH] dma-buf: handle testing kthreads creation failure
Date: Wed, 22 May 2024 15:23:26 +0300
Message-Id: <20240522122326.696928-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kthread creation may possibly fail inside race_signal_callback(). In
such case stop the already started threads and return with error code.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 2989f6451084 ("dma-buf: Add selftests for dma-fence")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/dma-buf/st-dma-fence.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index b7c6f7ea9e0c..ab1ec4631578 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -540,6 +540,12 @@ static int race_signal_callback(void *arg)
 			t[i].before = pass;
 			t[i].task = kthread_run(thread_signal_callback, &t[i],
 						"dma-fence:%d", i);
+			if (IS_ERR(t[i].task)) {
+				ret = PTR_ERR(t[i].task);
+				while (--i >= 0)
+					kthread_stop(t[i].task);
+				return ret;
+			}
 			get_task_struct(t[i].task);
 		}
 
-- 
2.39.2

