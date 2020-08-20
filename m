Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36AF24AFE7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935976E8D2;
	Thu, 20 Aug 2020 07:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEBBE6E8A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:05:49 +0000 (UTC)
X-UUID: a662d4e0ddeb49d6bf5e489485e3af98-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/+RTVTLtgOe6wM/AUNkPEowPtFWHKYkHG8kqDSwIerc=; 
 b=N474FhsSxb2Wp0FKrKIuVTdb5OrdTktZkyHnM1rTD1dERBfo5t+H517ks2Yw9Naa8uowMNIHTyegupDgR+OkXQWgA6AmDVXuJGqdtFXR/EFHpat2NUictccXXralYSojMhSIRHR9YqMNJnQZerNupsjP4FoKVdnJZVNqJjhFokE=;
X-UUID: a662d4e0ddeb49d6bf5e489485e3af98-20200820
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 177748748; Thu, 20 Aug 2020 14:05:46 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:44 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:44 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 13/21] drm/mediatek: add support for mediatek SOC MT8192
Date: Thu, 20 Aug 2020 14:04:10 +0800
Message-ID: <1597903458-8055-14-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add support for mediatek SOC MT8192

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c |  7 +++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 20 +++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  |  7 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c    | 35 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 48 +++++++++++++++++++++++++++++++
 5 files changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 3ae9c81..31918fa 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -152,11 +152,18 @@ static int mtk_disp_color_remove(struct platform_device *pdev)
 	.color_offset = DISP_COLOR_START_MT8173,
 };
 
+static const struct mtk_disp_color_data mt8192_color_driver_data = {
+	.color_offset = DISP_COLOR_START_MT8173,
+	.has_shadow = true,
+};
+
 static const struct of_device_id mtk_disp_color_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-color",
 	  .data = &mt2701_color_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = &mt8173_color_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-color",
+	  .data = &mt8192_color_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_color_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2506803..03eaadb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -447,6 +447,22 @@ static int mtk_disp_ovl_remove(struct platform_device *pdev)
 	.fmt_rgb565_is_0 = true,
 };
 
+static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.has_shadow = true,
+};
+
+static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 2,
+	.fmt_rgb565_is_0 = true,
+	.has_shadow = true,
+};
+
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-ovl",
 	  .data = &mt2701_ovl_driver_data},
@@ -456,6 +472,10 @@ static int mtk_disp_ovl_remove(struct platform_device *pdev)
 	  .data = &mt8183_ovl_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
 	  .data = &mt8183_ovl_2l_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-ovl",
+	  .data = &mt8192_ovl_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
+	  .data = &mt8192_ovl_2l_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 51f2a0c..0683bef 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -359,6 +359,11 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
 	.fifo_size = 5 * SZ_1K,
 };
 
+static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
+	.fifo_size = 5 * SZ_1K,
+	.has_shadow = true,
+};
+
 static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = &mt2701_rdma_driver_data},
@@ -366,6 +371,8 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
 	  .data = &mt8173_rdma_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-rdma",
 	  .data = &mt8183_rdma_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-rdma",
+	  .data = &mt8192_rdma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index de618a1..14105b3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -27,6 +27,18 @@
 
 #define INT_MUTEX				BIT(1)
 
+#define MT8192_MUTEX_MOD_DISP_OVL0		0
+#define MT8192_MUTEX_MOD_DISP_OVL0_2L		1
+#define MT8192_MUTEX_MOD_DISP_RDMA0		2
+#define MT8192_MUTEX_MOD_DISP_COLOR0		4
+#define MT8192_MUTEX_MOD_DISP_CCORR0		5
+#define MT8192_MUTEX_MOD_DISP_AAL0		6
+#define MT8192_MUTEX_MOD_DISP_GAMMA0		7
+#define MT8192_MUTEX_MOD_DISP_POSTMASK0		8
+#define MT8192_MUTEX_MOD_DISP_DITHER0		9
+#define MT8192_MUTEX_MOD_DISP_OVL2_2L		16
+#define MT8192_MUTEX_MOD_DISP_RDMA4		17
+
 #define MT8183_MUTEX_MOD_DISP_RDMA0		0
 #define MT8183_MUTEX_MOD_DISP_RDMA1		1
 #define MT8183_MUTEX_MOD_DISP_OVL0		9
@@ -185,6 +197,20 @@ struct mtk_ddp {
 	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
 };
 
+static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
+	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
+	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_DITHER] = MT8192_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_GAMMA] = MT8192_MUTEX_MOD_DISP_GAMMA0,
+	[DDP_COMPONENT_POSTMASK0] = MT8192_MUTEX_MOD_DISP_POSTMASK0,
+	[DDP_COMPONENT_OVL0] = MT8192_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_OVL_2L0] = MT8192_MUTEX_MOD_DISP_OVL0_2L,
+	[DDP_COMPONENT_OVL_2L2] = MT8192_MUTEX_MOD_DISP_OVL2_2L,
+	[DDP_COMPONENT_RDMA0] = MT8192_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
+};
+
 static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_DSI3 + 1] = {
 	[DDP_MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[DDP_MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
@@ -229,6 +255,13 @@ struct mtk_ddp {
 	.mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,
 };
 
+static const struct mtk_ddp_data mt8192_ddp_driver_data = {
+	.mutex_mod = mt8192_mutex_mod,
+	.mutex_sof = mt8183_mutex_sof,
+	.mutex_mod_reg = MT8183_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,
+};
+
 struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
 {
 	struct mtk_ddp *ddp = dev_get_drvdata(dev);
@@ -482,6 +515,8 @@ static int mtk_ddp_remove(struct platform_device *pdev)
 	  .data = &mt8173_ddp_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-mutex",
 	  .data = &mt8183_ddp_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-mutex",
+	  .data = &mt8192_ddp_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, ddp_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 267e91e..638346c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -137,6 +137,25 @@
 	DDP_COMPONENT_DPI0,
 };
 
+static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL_2L0,
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
+static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
+	DDP_COMPONENT_OVL_2L2,
+	DDP_COMPONENT_RDMA4,
+	DDP_COMPONENT_DPI0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -168,6 +187,13 @@
 	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
+	.main_path = mt8192_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
+	.ext_path = mt8192_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
+};
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -409,26 +435,42 @@ static void mtk_drm_unbind(struct device *dev)
 	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
 	  .data = (void *)MTK_DISP_OVL_2L },
+	{ .compatible = "mediatek,mt8192-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
+	  .data = (void *)MTK_DISP_OVL_2L },
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8183-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8192-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
 	  .data = (void *)MTK_DISP_WDMA },
 	{ .compatible = "mediatek,mt8183-disp-ccorr",
 	  .data = (void *)MTK_DISP_CCORR },
+	{ .compatible = "mediatek,mt8192-disp-ccorr",
+	  .data = (void *)MTK_DISP_CCORR },
 	{ .compatible = "mediatek,mt2701-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
+	{ .compatible = "mediatek,mt8192-disp-color",
+	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-aal",
 	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8192-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
+	{ .compatible = "mediatek,mt8192-disp-gamma",
+	  .data = (void *)MTK_DISP_GAMMA},
 	{ .compatible = "mediatek,mt8183-disp-dither",
 	  .data = (void *)MTK_DISP_DITHER },
+	{ .compatible = "mediatek,mt8192-disp-dither",
+	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt2701-dsi",
@@ -451,12 +493,16 @@ static void mtk_drm_unbind(struct device *dev)
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8183-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8192-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2701-disp-pwm",
 	  .data = (void *)MTK_DISP_BLS },
 	{ .compatible = "mediatek,mt8173-disp-pwm",
 	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt8192-disp-postmask",
+	  .data = (void *)MTK_DISP_POSTMASK },
 	{ }
 };
 
@@ -469,6 +515,8 @@ static void mtk_drm_unbind(struct device *dev)
 	  .data = &mt8173_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8183-mmsys",
 	  .data = &mt8183_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8192-mmsys",
+	 .data = &mt8192_mmsys_driver_data},
 	{ }
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
