Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B308E4B64F8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 09:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF16F10E3CB;
	Tue, 15 Feb 2022 08:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AC510E3EA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 08:01:59 +0000 (UTC)
X-UUID: f040adba2e9343cc8528165acfa3bb8f-20220215
X-UUID: f040adba2e9343cc8528165acfa3bb8f-20220215
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1090011818; Tue, 15 Feb 2022 16:01:53 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 15 Feb 2022 16:01:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Feb 2022 16:01:52 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Subject: [v2,6/6] drm/mediatek: add display support for MT8186
Date: Tue, 15 Feb 2022 15:59:53 +0800
Message-ID: <20220215075953.3310-7-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220215075953.3310-1-rex-bc.chen@mediatek.com>
References: <20220215075953.3310-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

- Add driver data for MT8186 in mtk_drm_drv.c.
- Add mtk-disp-ovl and mt-disp-ovl-2l support for MT8186.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 20 +++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 39 +++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2146299e5f52..5fa56c7b9f5f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -456,6 +456,22 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.fmt_rgb565_is_0 = true,
 };
 
+static const struct mtk_disp_ovl_data mt8186_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+};
+
+static const struct mtk_disp_ovl_data mt8186_ovl_2l_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 2,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+};
+
 static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
@@ -479,8 +495,12 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	  .data = &mt8173_ovl_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-ovl",
 	  .data = &mt8183_ovl_driver_data},
+	{ .compatible = "mediatek,mt8186-disp-ovl",
+	  .data = &mt8186_ovl_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
 	  .data = &mt8183_ovl_2l_driver_data},
+	{ .compatible = "mediatek,mt8186-disp-ovl-2l",
+	  .data = &mt8186_ovl_2l_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-ovl",
 	  .data = &mt8192_ovl_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6efb423ccc92..754b1be25d0d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -158,6 +158,24 @@ static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const enum mtk_ddp_comp_id mt8186_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_POSTMASK0,
+	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DSI0,
+};
+
+static const enum mtk_ddp_comp_id mt8186_mtk_ddp_ext[] = {
+	DDP_COMPONENT_OVL_2L0,
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
 static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
@@ -221,6 +239,13 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
+	.main_path = mt8186_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8186_mtk_ddp_main),
+	.ext_path = mt8186_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.main_path = mt8192_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
@@ -463,6 +488,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8183-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8186-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
@@ -475,14 +502,20 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8183-disp-ovl",
 	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8186-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8192-disp-ovl",
 	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
 	  .data = (void *)MTK_DISP_OVL_2L },
+	{ .compatible = "mediatek,mt8186-disp-ovl-2l",
+	  .data = (void *)MTK_DISP_OVL_2L },
 	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
 	  .data = (void *)MTK_DISP_OVL_2L },
 	{ .compatible = "mediatek,mt8192-disp-postmask",
 	  .data = (void *)MTK_DISP_POSTMASK },
+	{ .compatible = "mediatek,mt8186-disp-postmask",
+	  .data = (void *)MTK_DISP_POSTMASK},
 	{ .compatible = "mediatek,mt2701-disp-pwm",
 	  .data = (void *)MTK_DISP_BLS },
 	{ .compatible = "mediatek,mt8167-disp-pwm",
@@ -511,12 +544,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8183-dpi",
 	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8186-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8173-dsi",
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8183-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8186-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
@@ -533,6 +570,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8173_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8183-mmsys",
 	  .data = &mt8183_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8186-mmsys",
+	  .data = &mt8186_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
 	  .data = &mt8192_mmsys_driver_data},
 	{ }
-- 
2.18.0

