Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA0786730
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 07:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6621010E0F6;
	Thu, 24 Aug 2023 05:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 458 seconds by postgrey-1.36 at gabe;
 Wed, 23 Aug 2023 13:23:53 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A0B10E423
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 13:23:53 +0000 (UTC)
Received: from lvc-arm12.ispras.local (unknown [83.149.199.126])
 by mail.ispras.ru (Postfix) with ESMTPSA id ABAB840F1DF0;
 Wed, 23 Aug 2023 13:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru ABAB840F1DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1692796572;
 bh=sV7vYQTyiAy3nWGgqxmiyOUH3WUFfyCP18D7p2WE0W4=;
 h=From:To:Cc:Subject:Date:From;
 b=lr9dSMDK0+Z2UduJ9y/kFVIhW9+SRTiDbNkUlken3blmfvBYbdbLOJWl/PBxt7iqE
 MGWQwTw0lnclYj86DXDWr+nQ/YN5DDFdBqChE93J8wQbiMY2SaNHxhYtd43m+vJlUr
 all6a9W/shqONNfNY+r9Xpm5eAn0aUhf5xK9Gv4I=
From: Katya Orlova <e.orlova@ispras.ru>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: mtk_drm_crtc: Avoid inappropriate kfree() in
Date: Wed, 23 Aug 2023 16:15:38 +0300
Message-Id: <20230823131538.29222-1-e.orlova@ispras.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Aug 2023 05:31:50 +0000
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Katya Orlova <e.orlova@ispras.ru>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mtk_drm_crtc_create() and mtk_drm_cmdq_pkt_destroy() are called with
argument 'pkt' pointed to a field 'cmdq_handle' of 'mtk_crtc' structure.
There is no need to kfree it.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
Signed-off-by: Katya Orlova <e.orlova@ispras.ru>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..ba7307efa675 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -117,7 +117,6 @@ static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *
 
 	pkt->va_base = kzalloc(size, GFP_KERNEL);
 	if (!pkt->va_base) {
-		kfree(pkt);
 		return -ENOMEM;
 	}
 	pkt->buf_size = size;
@@ -129,7 +128,6 @@ static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *
 	if (dma_mapping_error(dev, dma_addr)) {
 		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
 		kfree(pkt->va_base);
-		kfree(pkt);
 		return -ENOMEM;
 	}
 
@@ -145,7 +143,6 @@ static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
 	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
 			 DMA_TO_DEVICE);
 	kfree(pkt->va_base);
-	kfree(pkt);
 }
 #endif
 
-- 
2.30.2

