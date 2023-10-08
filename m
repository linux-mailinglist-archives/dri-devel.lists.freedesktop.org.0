Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281887BCF5A
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 19:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15F610E004;
	Sun,  8 Oct 2023 17:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at gabe;
 Sun, 08 Oct 2023 14:44:12 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD40510E0E3
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 14:44:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [85.89.126.105])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4C4ED40F1DEB;
 Sun,  8 Oct 2023 14:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 4C4ED40F1DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1696775817;
 bh=RoI0NzZPsRKEzf3D3JCemfXog6bSvCczYoK0HGBz6tk=;
 h=From:To:Cc:Subject:Date:From;
 b=Q8eNVonyqxFLuwSGdRKO3poe5TFCrbHZorXms5AfSGQK/RYBvjDy5T6lJiNKTtKEM
 hisIozg7H45+6TZ4xM8DJF6FYvAC9qaMwpwZqpNpB2BIEmZfmAvjT3znNBXzTMpn4m
 y6DKkfx+IMycG/5rg0CdUm8BDz8h7RMB1UfPG9cQ=
From: Pavel Sakharov <p.sakharov@ispras.ru>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] dma-buf: Fix NULL pointer dereference in sanitycheck()
Date: Sun,  8 Oct 2023 17:36:36 +0300
Message-ID: <20231008143637.113957-1-p.sakharov@ispras.ru>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Oct 2023 17:15:43 +0000
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
Cc: Pavel Sakharov <p.sakharov@ispras.ru>, lvc-project@linuxtesting.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Arvind Yadav <Arvind.Yadav@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If mock_chain() returns NULL, NULL pointer is dereferenced in
dma_fence_enable_sw_signaling().

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Pavel Sakharov <p.sakharov@ispras.ru>

Fixes: d62c43a953ce ("dma-buf: Enable signaling on fence for selftests")
---
 drivers/dma-buf/st-dma-fence-chain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index c0979c8049b5..661de4add4c7 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -84,11 +84,11 @@ static int sanitycheck(void *arg)
 		return -ENOMEM;
 
 	chain = mock_chain(NULL, f, 1);
-	if (!chain)
+	if (chain)
+		dma_fence_enable_sw_signaling(chain);
+	else
 		err = -ENOMEM;
 
-	dma_fence_enable_sw_signaling(chain);
-
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
-- 
2.42.0

