Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C425B646
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 00:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793208977A;
	Wed,  2 Sep 2020 22:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F7C8977A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 22:06:03 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7633C20767;
 Wed,  2 Sep 2020 22:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599084363;
 bh=o4jmNbgqxIlHHhWKN1PTp11DdjWkhb+PE+ngof2jF9s=;
 h=From:To:Cc:Subject:Date:From;
 b=KethZPFV/wkeAlEl57HkIS9LLug2iKpcHDa2/uRm7L01q52opeDOK/5UHX+f7oUtb
 oDS1ZP52R4NVUe5qQWh2XK7f31uoqaTxbE0pfecQgVmG2Xu6T0HtozIdmXRIpMRgRD
 sgr/dTLvYfLy88HPOsuKjOE3CbZsb26PbGdVaINY=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Use CPU when fail to get cmdq event
Date: Thu,  3 Sep 2020 06:05:42 +0800
Message-Id: <20200902220542.60-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: David Airlie <airlied@linux.ie>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though cmdq client is created successfully, without the cmdq event,
cmdq could not work correctly, so use CPU when fail to get cmdq event.

Fixes: 60fa8c13ab1a ("drm/mediatek: Move gce event property to mutex device node")
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 3fc5511330b9..4d29568be3f5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -831,13 +831,19 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			drm_crtc_index(&mtk_crtc->base));
 		mtk_crtc->cmdq_client = NULL;
 	}
-	ret = of_property_read_u32_index(priv->mutex_node,
-					 "mediatek,gce-events",
-					 drm_crtc_index(&mtk_crtc->base),
-					 &mtk_crtc->cmdq_event);
-	if (ret)
-		dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
-			drm_crtc_index(&mtk_crtc->base));
+
+	if (mtk_crtc->cmdq_client) {
+		ret = of_property_read_u32_index(priv->mutex_node,
+						 "mediatek,gce-events",
+						 drm_crtc_index(&mtk_crtc->base),
+						 &mtk_crtc->cmdq_event);
+		if (ret) {
+			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
+				drm_crtc_index(&mtk_crtc->base));
+			cmdq_mbox_destroy(mtk_crtc->cmdq_client);
+			mtk_crtc->cmdq_client = NULL;
+		}
+	}
 #endif
 	return 0;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
