Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B918CC628
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 20:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975FF10E2BB;
	Wed, 22 May 2024 18:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="PwQLBlMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CA910E2BB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 18:14:13 +0000 (UTC)
Received: from fpc.intra.ispras.ru (unknown [10.10.165.15])
 by mail.ispras.ru (Postfix) with ESMTPSA id 000114078505;
 Wed, 22 May 2024 18:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 000114078505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1716401651;
 bh=Imz5WELE7gK/KIIyH94s3uVtNby+XXwDNZ6i3Up+9+0=;
 h=From:To:Cc:Subject:Date:From;
 b=PwQLBlMzotLiAng0Y2FrLpGSywzTylbdpLcYvuBEyzGO+5gnFrxHojCLr7ct+78VE
 BzFqINVtD47vCYbX4L0MHhj+7MhSAVZOhRfwwYypmZcnRco90zR3GmuWErKqL3kiit
 uPz6LmvIw3lrJaC0BWvQq+ZfGf9IAoLr+hDtmHC0=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 lvc-project@linuxtesting.org, "T.J. Mercier" <tjmercier@google.com>,
 stable@vger.kernel.org
Subject: [PATCH v2] dma-buf: handle testing kthreads creation failure
Date: Wed, 22 May 2024 21:13:08 +0300
Message-Id: <20240522181308.841686-1-pchelkin@ispras.ru>
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
such a case stop the already started threads, put the already taken
references to them and return with error code.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 2989f6451084 ("dma-buf: Add selftests for dma-fence")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
v2: use kthread_stop_put() to actually put the last reference as
    T.J. Mercier noticed;
    link to v1: https://lore.kernel.org/lkml/20240522122326.696928-1-pchelkin@ispras.ru/

 drivers/dma-buf/st-dma-fence.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index b7c6f7ea9e0c..6a1bfcd0cc21 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -540,6 +540,12 @@ static int race_signal_callback(void *arg)
 			t[i].before = pass;
 			t[i].task = kthread_run(thread_signal_callback, &t[i],
 						"dma-fence:%d", i);
+			if (IS_ERR(t[i].task)) {
+				ret = PTR_ERR(t[i].task);
+				while (--i >= 0)
+					kthread_stop_put(t[i].task);
+				return ret;
+			}
 			get_task_struct(t[i].task);
 		}
 
-- 
2.39.2

