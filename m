Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 707027CBB9A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 08:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A8E10E24E;
	Tue, 17 Oct 2023 06:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D36F10E0C4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 06:47:26 +0000 (UTC)
X-UUID: 058d57e66cb911ee8051498923ad61e6-20231017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=C/hHtKyIgOB37NkGUiMEgmm5qd2W6DQwFbHNe1iREac=; 
 b=PfZyWq7esZFaUp99sYpJcG+Q1eOxsnu0AmKC1S7sm3lY7zrbXdKTRhwvnetYtJvoqR1h7KgFFcVCMmfOPLaU7r0p+UKIaceSoRnoW1U46m5rM9KdyTCW2INO6mPWsqiyYmiami44AGisGVxqBjHblEE3YnPzwBzPl8TTm/yDo8o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:698df349-33b6-4033-b149-092477cd461b, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:d9b905c0-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 058d57e66cb911ee8051498923ad61e6-20231017
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1080256243; Tue, 17 Oct 2023 14:47:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 17 Oct 2023 14:47:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 17 Oct 2023 14:47:19 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v3 10/11] drm/mediatek: Support CRC in VDOSYS0
Date: Tue, 17 Oct 2023 14:47:16 +0800
Message-ID: <20231017064717.21616-11-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231017064717.21616-1-shawn.sung@mediatek.com>
References: <20231017064717.21616-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.669000-8.000000
X-TMASE-MatchedRID: HqqZ39pjvSi/gdQC9NfM37dQIb8hCnY+Xru95hSuhjTFHcwKL6UE/8CS
 2AMm1nQC2xDStkOROV9uXpR8O0I9A+BX8Ypq0C8lj2FGM19l45eUNBZ1nwIVNEDIf3ubt7Y1BgH
 mCxujQvwZB0R4cFpbTeKOmN63egZIZ28ZQS4q9JwVglQa/gMvfHnUZqRb3abm1yGUyFK3oV4wKY
 tIU69m3cy2kfzaZ5ik5uxxxxIslOWeHTkwQi/s15fOGL7sa1Cy7f6JAS2hKPjjud2x7TPVtzFaT
 Rf5dTetI8xfD3DjNcUiiPRXRdfDOlsMw6s/MEEasQpfTaytNchl0qH7/7HRjkdmDSBYfnJRkOkX
 3BpY1o8ULfbRmZ/onPVTqzK3F0T1Ig67HHizFeHKl4yJoI+fG47u1T4G/rnNmyiLZetSf8mfop0
 ytGwvXiq2rl3dzGQ15mYVuB2ZklKG9CjyZTMuz61XIzjF142iao3lHPvMHGhaFJH3C2TwKg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.669000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3F26785F73EF3C325E62D9D178492F318D77C9CEB3306B31B8122EC34AFADDCC2000:8
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
Cc: devicetree@vger.kernel.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Chen-Yu
 Tsai <wenst@chromium.org>, Nancy Lin <nancy.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We choose OVL as CRC generator from other hardware
components that are also capable of calculating CRCs,
since its frame done event triggers vblanks, it can be
used as a signal to know when is safe to retrieve CRC of
the frame.

Please note that position of the hardware component
that is chosen as CRC generator in the display path is
significant. For example, while OVL is the first module
in VDOSYS0, its CRC won't be affected by the modules
after it, which means effects applied by PQ, Gamma,
Dither or any other components after OVL won't be
calculated in CRC generation.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   3 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 111 ++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   3 +
 3 files changed, 109 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index c44f5b31bab5..08cc2d2fef9f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -102,6 +102,9 @@ void mtk_ovl_enable_vblank(struct device *dev);
 void mtk_ovl_disable_vblank(struct device *dev);
 const u32 *mtk_ovl_get_formats(struct device *dev);
 size_t mtk_ovl_get_num_formats(struct device *dev);
+size_t mtk_ovl_crc_cnt(struct device *dev);
+u32 *mtk_ovl_crc_entry(struct device *dev);
+void mtk_ovl_crc_read(struct device *dev);
 
 void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex);
 void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 75de1350e337..ecc38932fd44 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -25,6 +25,13 @@
 #define OVL_FME_CPL_INT					BIT(1)
 #define DISP_REG_OVL_INTSTA			0x0008
 #define DISP_REG_OVL_EN				0x000c
+#define OVL_EN						BIT(0)
+#define OVL_OP_8BIT_MODE				BIT(4)
+#define OVL_HG_FOVL_CK_ON				BIT(8)
+#define OVL_HF_FOVL_CK_ON				BIT(10)
+#define DISP_REG_OVL_TRIG			0x0010
+#define OVL_CRC_EN					BIT(8)
+#define OVL_CRC_CLR					BIT(9)
 #define DISP_REG_OVL_RST			0x0014
 #define DISP_REG_OVL_ROI_SIZE			0x0020
 #define DISP_REG_OVL_DATAPATH_CON		0x0024
@@ -44,6 +51,8 @@
 #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
+#define DISP_REG_OVL_CRC			0x0270
+#define OVL_CRC_OUT_MASK				GENMASK(30, 0)
 #define DISP_REG_OVL_CLRFMT_EXT			0x02D0
 #define DISP_REG_OVL_CLRFMT_EXT1		0x02D8
 #define OVL_CLRFMT_EXT1_CSC_EN(n)			(1 << (((n) * 4) + 1))
@@ -151,6 +160,24 @@ static const u32 mt8195_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+static const u32 mt8195_ovl_crc_ofs[] = {
+	DISP_REG_OVL_CRC,
+};
+
+/**
+ * struct mtk_disp_ovl_data - ovl driver data
+ * @addr: offset of the first layer (layer-0)
+ * @gmc_bits: gmc (gating memory clock) bit masks for adjusting positivity for ovl
+ * @layer_nr: layer numbers that ovl supports
+ * @fmt_rgb565_is_0: whether or not rgb565 is represented as 0
+ * @smi_id_en: determine if smi needs to be enabled
+ * @supports_afbc: determine if ovl supports afbc
+ * @formats: format table that ovl supports
+ * @num_formats: number of formats that ovl supports
+ * @supports_clrfmt_ext: whether the ovl supports clear format (for alpha blend)
+ * @crc_ofs: crc offset table
+ * @crc_cnt: count of crc registers (could be more than one bank)
+ */
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -161,12 +188,20 @@ struct mtk_disp_ovl_data {
 	const u32 *formats;
 	size_t num_formats;
 	bool supports_clrfmt_ext;
+	const u32 *crc_ofs;
+	size_t crc_cnt;
 };
 
-/*
+/**
  * struct mtk_disp_ovl - DISP_OVL driver structure
  * @crtc: associated crtc to report vblank events to
+ * @clk: clock of the ovl
+ * @regs: base address of the ovl register that can be accessed by cpu
+ * @cmdq_reg: register related info for cmdq (subsys, offset ...etc.)
  * @data: platform data
+ * @vblank_cb: callback function when vblank irq happened
+ * @vblank_cb_data: data to the callback function
+ * @crc: crc related information
  */
 struct mtk_disp_ovl {
 	struct drm_crtc			*crtc;
@@ -176,8 +211,30 @@ struct mtk_disp_ovl {
 	const struct mtk_disp_ovl_data	*data;
 	void				(*vblank_cb)(void *data);
 	void				*vblank_cb_data;
+	struct mtk_drm_crc		crc;
 };
 
+size_t mtk_ovl_crc_cnt(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->crc.cnt;
+}
+
+u32 *mtk_ovl_crc_entry(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->crc.va;
+}
+
+void mtk_ovl_crc_read(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	mtk_drm_crc_read(&ovl->crc, ovl->regs);
+}
+
 static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_ovl *priv = dev_id;
@@ -216,7 +273,7 @@ void mtk_ovl_enable_vblank(struct device *dev)
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
-	writel_relaxed(OVL_FME_CPL_INT, ovl->regs + DISP_REG_OVL_INTEN);
+	writel(OVL_FME_CPL_INT, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
 void mtk_ovl_disable_vblank(struct device *dev)
@@ -269,14 +326,30 @@ void mtk_ovl_start(struct device *dev)
 	 */
 	reg |= OVL_OUTPUT_CLAMP;
 
-	writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
-	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
+	writel(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+
+	reg = OVL_EN;
+
+	if (ovl->data->crc_cnt) {
+		/* enable crc */
+		writel(OVL_CRC_EN, ovl->regs + DISP_REG_OVL_TRIG);
+		/* enable crc related clocks */
+		reg |= OVL_OP_8BIT_MODE | OVL_HG_FOVL_CK_ON | OVL_HF_FOVL_CK_ON;
+	}
+	writel(reg, ovl->regs + DISP_REG_OVL_EN);
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_drm_crc_cmdq_start(&ovl->crc);
+#endif
 }
 
 void mtk_ovl_stop(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_drm_crc_cmdq_stop(&ovl->crc);
+#endif
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_EN);
 	if (ovl->data->smi_id_en) {
 		unsigned int reg;
@@ -689,15 +762,31 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to ioremap ovl\n");
 		return PTR_ERR(priv->regs);
 	}
+
+	priv->data = of_device_get_match_data(dev);
+	platform_set_drvdata(pdev, priv);
+
+	if (priv->data->crc_cnt) {
+		mtk_drm_crc_init(&priv->crc,
+				 priv->data->crc_ofs, priv->data->crc_cnt,
+				 DISP_REG_OVL_TRIG, OVL_CRC_CLR);
+	}
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
-
-	priv->data = of_device_get_match_data(dev);
-	platform_set_drvdata(pdev, priv);
 
+	if (priv->data->crc_cnt) {
+		if (of_property_read_u32_index(dev->of_node,
+					       "mediatek,gce-events", 0,
+					       &priv->crc.cmdq_event)) {
+			dev_warn(dev, "failed to get gce-events for crc\n");
+		}
+		priv->crc.cmdq_reg = &priv->cmdq_reg;
+		mtk_drm_crc_cmdq_create(dev, &priv->crc);
+	}
+#endif
 	ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
 			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
 	if (ret < 0) {
@@ -718,6 +807,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 
 static void mtk_disp_ovl_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	mtk_drm_crc_destroy(&ovl->crc);
 	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
 	pm_runtime_disable(&pdev->dev);
 }
@@ -788,6 +881,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.formats = mt8195_formats,
 	.num_formats = ARRAY_SIZE(mt8195_formats),
 	.supports_clrfmt_ext = true,
+	.crc_ofs = mt8195_ovl_crc_ofs,
+	.crc_cnt = ARRAY_SIZE(mt8195_ovl_crc_ofs),
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 9940909c7435..1118efcde98a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -349,6 +349,9 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.clk_enable = mtk_ovl_clk_enable,
 	.clk_disable = mtk_ovl_clk_disable,
 	.config = mtk_ovl_config,
+	.crc_cnt = mtk_ovl_crc_cnt,
+	.crc_entry = mtk_ovl_crc_entry,
+	.crc_read = mtk_ovl_crc_read,
 	.start = mtk_ovl_start,
 	.stop = mtk_ovl_stop,
 	.register_vblank_cb = mtk_ovl_register_vblank_cb,
-- 
2.18.0

