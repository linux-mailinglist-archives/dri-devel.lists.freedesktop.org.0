Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C161612B4F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 16:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D91A10E107;
	Sun, 30 Oct 2022 15:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E31110E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 15:44:52 +0000 (UTC)
Received: from dimapc.. (unknown [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 539C7660225F;
 Sun, 30 Oct 2022 15:44:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667144690;
 bh=9L1UGeJdnkFYaRnE59XJ8gv48CnIdhLcIsE2uZ/nI0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NrgMQ4JJcS/wCdnXA8AG/2ltnRc/459pzQVz+tPEzTYMw+l7wUlkqJ3gZn7BQsjRv
 9EqSxbTZQnHVfP80TN7xvKFBhY/gqWfvUuzxwqLZJzFlY/fllOOfADR9n2UjVY/Ovw
 vC2W3JH7CUfTxnn47rZPq8ltpqZkp44vY1VcNNd7WV7ugzd5Wn+KLCw30/TaqhP6IR
 BTFkOYacsIhlK0YpHKh2lzNCdwaG/NrrN6UBYAaGFaRd+fLrIv1r9kp7pMPoIXazJr
 hYSBvQpvrwDbcLRpxvHRM31eY6ni/XCZvj9Zmntx78pHz5itR4y+dreooXnjBow/ia
 PZ8gz0SH1PJQg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 noralf@tronnes.org, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2 1/2] dma-buf: Make locking consistent in dma_buf_detach()
Date: Sun, 30 Oct 2022 18:44:11 +0300
Message-Id: <20221030154412.8320-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030154412.8320-1-dmitry.osipenko@collabora.com>
References: <20221030154412.8320-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dma_buf_detach() locks attach->dmabuf->resv and then unlocks
dmabuf->resv, which could be a two different locks from a static
code checker perspective. In particular this triggers Smatch to
report the "double unlock" error. Make the locking pointers consistent.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/dri-devel/Y1fLfsccW3AS%2Fo+%2F@kili/
Fixes: 809d9c72c2f8 ("dma-buf: Move dma_buf_attach() to dynamic locking specification")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index c40d72d318fd..13bfd2d09c56 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -995,10 +995,10 @@ static void __unmap_dma_buf(struct dma_buf_attachment *attach,
  */
 void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 {
-	if (WARN_ON(!dmabuf || !attach))
+	if (WARN_ON(!dmabuf || !attach || dmabuf != attach->dmabuf))
 		return;
 
-	dma_resv_lock(attach->dmabuf->resv, NULL);
+	dma_resv_lock(dmabuf->resv, NULL);
 
 	if (attach->sgt) {
 
-- 
2.37.3

