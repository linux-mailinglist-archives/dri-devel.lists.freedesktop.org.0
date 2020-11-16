Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B8E2B54CC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 00:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC766E088;
	Mon, 16 Nov 2020 23:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9DF6E08C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 23:14:30 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28CEE23A32;
 Mon, 16 Nov 2020 23:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605568470;
 bh=eUg16iMbYyzUK83g3LNvHzG2VMMUY4pbe/Vx5Nm9z/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DqYM+dWGiX2wOXr0iXF+kZLb23r7xuY6IPXTN7DfPvX7LAhhpAx6+RfjGNSBr8Exo
 rub1GolRoVCiz/bXUAbXzX63cn51+t3JEsdR4q6H4y8olqjSho2dwdM6dtT9/XuILh
 1/TcrogctE9f5+dIt3xvL8Q0JGfoOqODZeoRIx/8=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [RESEND PATCH 1/3] drm/mediatek: Separate mtk_mipi_tx to an
 independent module
Date: Tue, 17 Nov 2020 07:14:05 +0800
Message-Id: <20201116231407.94-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116231407.94-1-chunkuang.hu@kernel.org>
References: <20201116231407.94-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mtk_mipi_tx is a part of mtk_drm module, but phy driver should be an
independent module rather than be part of drm module, so separate the phy
driver to an independent module.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/Kconfig       | 8 ++++++++
 drivers/gpu/drm/mediatek/Makefile      | 9 ++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.h | 1 -
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c | 3 +++
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 65cd03a4be29..24c4890a6e65 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -13,6 +13,7 @@ config DRM_MEDIATEK
 	select DRM_PANEL
 	select MEMORY
 	select MTK_SMI
+	select PHY_MTK_MIPI_DSI
 	select VIDEOMODE_HELPERS
 	help
 	  Choose this option if you have a Mediatek SoCs.
@@ -27,3 +28,10 @@ config DRM_MEDIATEK_HDMI
 	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
+
+config PHY_MTK_MIPI_DSI
+	tristate "Mediatek MIPI-DSI-PHY Driver"
+	depends on ARCH_MEDIATEK && OF
+	select GENERIC_PHY
+	help
+	  Support MIPI DSI PHY for Mediatek SoCs.
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 77b0fd86063d..baa188000543 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -10,9 +10,6 @@ mediatek-drm-y := mtk_disp_color.o \
 		  mtk_drm_gem.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
-		  mtk_mipi_tx.o \
-		  mtk_mt8173_mipi_tx.o \
-		  mtk_mt8183_mipi_tx.o \
 		  mtk_dpi.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
@@ -22,3 +19,9 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi_ddc.o
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
+
+phy-mtk-mipi-dsi-drv-objs := mtk_mipi_tx.o \
+			     mtk_mt8173_mipi_tx.o \
+			     mtk_mt8183_mipi_tx.o
+
+obj-$(CONFIG_PHY_MTK_MIPI_DSI) += phy-mtk-mipi-dsi-drv.o
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 59c85c63b7cc..bad75c5be090 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -636,7 +636,6 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
 	&mtk_drm_platform_driver,
-	&mtk_mipi_tx_driver,
 	&mtk_dsi_driver,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index b5be63e53176..6ff98a68444b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -54,6 +54,5 @@ extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
-extern struct platform_driver mtk_mipi_tx_driver;
 
 #endif /* MTK_DRM_DRV_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
index 8cee2591e728..f2a892e16c27 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
@@ -242,4 +242,7 @@ struct platform_driver mtk_mipi_tx_driver = {
 		.of_match_table = mtk_mipi_tx_match,
 	},
 };
+module_platform_driver(mtk_mipi_tx_driver);
 
+MODULE_DESCRIPTION("MediaTek MIPI TX Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
