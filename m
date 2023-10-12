Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC97C6A1B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E6510E488;
	Thu, 12 Oct 2023 09:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41FB10E484
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:57:51 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D3FCB6607356;
 Thu, 12 Oct 2023 10:57:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697104670;
 bh=QCs4wI96fPs5unPYTZSQukv443uPSWfhQ3mtjInGcpk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mDvO5LZUBOAR4HnZNh5431O7PsLGsP1VfJSAYoETc54G2JtzJ8zMV6BYPX65WzXH0
 zqaEWIhF7k32kjqlsDwjpnF702SSfcq7R4tyYC7PWmNkxQs8BIYcZtOhBFKV2c88FS
 eyhQaFMOS1FhOXtJAJIotxKUIIZ7IndYcm17JVcUH66JIPVJ657KVpBleiTg8LuN//
 dtiYGlTPsnDQmd01lDUNtPfJPxczyocxaYW7NXD2G99tJaCE5/0A3brAmYthcRTr0Z
 RJWvNgZDP7nCGXcRCuTbrLyye1/ElPBplfnXXhLnpe8w6Q9rdcRrg9aS+mY0gEvtau
 Uqdud4QWF666w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v11 08/16] drm/mediatek: De-commonize disp_aal/disp_gamma
 gamma_set functions
Date: Thu, 12 Oct 2023 11:57:28 +0200
Message-ID: <20231012095736.100784-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for adding a 12-bits gamma support for the DISP_GAMMA
IP, remove the mtk_gamma_set_common() function and move the relevant
bits in mtk_gamma_set() for DISP_GAMMA and mtk_aal_gamma_set() for
DISP_AAL: since the latter has no more support for gamma manipulation
(being moved to a different IP) in newer revisions, those functions
are about to diverge and it makes no sense to keep a common one (with
all the complications of passing common data and making exclusions
for device driver data) for just a few bits.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 41 +++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  1 -
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 34 ++++---------------
 3 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 05f9be23fa47..a618be9b3dba 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -17,10 +17,17 @@
 
 #define DISP_AAL_EN				0x0000
 #define AAL_EN						BIT(0)
+#define DISP_AAL_CFG				0x0020
+#define AAL_GAMMA_LUT_EN				BIT(1)
 #define DISP_AAL_SIZE				0x0030
 #define DISP_AAL_SIZE_HSIZE				GENMASK(28, 16)
 #define DISP_AAL_SIZE_VSIZE				GENMASK(12, 0)
 #define DISP_AAL_OUTPUT_SIZE			0x04d8
+#define DISP_AAL_GAMMA_LUT			0x0700
+#define DISP_AAL_GAMMA_LUT_R				GENMASK(29, 20)
+#define DISP_AAL_GAMMA_LUT_G				GENMASK(19, 10)
+#define DISP_AAL_GAMMA_LUT_B				GENMASK(9, 0)
+#define DISP_AAL_LUT_BITS			10
 #define DISP_AAL_LUT_SIZE			512
 
 struct mtk_disp_aal_data {
@@ -80,9 +87,39 @@ unsigned int mtk_aal_gamma_get_lut_size(struct device *dev)
 void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+	struct drm_color_lut *lut;
+	unsigned int i;
+	u32 cfg_val;
+
+	/* If gamma is not supported in AAL, go out immediately */
+	if (!(aal->data && aal->data->has_gamma))
+		return;
+
+	/* Also, if there's no gamma lut there's nothing to do here. */
+	if (!state->gamma_lut)
+		return;
+
+	lut = (struct drm_color_lut *)state->gamma_lut->data;
+	for (i = 0; i < DISP_AAL_LUT_SIZE; i++) {
+		struct drm_color_lut hwlut = {
+			.red = drm_color_lut_extract(lut[i].red, DISP_AAL_LUT_BITS),
+			.green = drm_color_lut_extract(lut[i].green, DISP_AAL_LUT_BITS),
+			.blue = drm_color_lut_extract(lut[i].blue, DISP_AAL_LUT_BITS)
+		};
+		u32 word;
+
+		word = FIELD_PREP(DISP_AAL_GAMMA_LUT_R, hwlut.red);
+		word |= FIELD_PREP(DISP_AAL_GAMMA_LUT_G, hwlut.green);
+		word |= FIELD_PREP(DISP_AAL_GAMMA_LUT_B, hwlut.blue);
+		writel(word, aal->regs + DISP_AAL_GAMMA_LUT + i * 4);
+	}
 
-	if (aal->data && aal->data->has_gamma)
-		mtk_gamma_set_common(NULL, aal->regs, state);
+	cfg_val = readl(aal->regs + DISP_AAL_CFG);
+
+	/* Enable the gamma table */
+	cfg_val |= FIELD_PREP(AAL_GAMMA_LUT_EN, 1);
+
+	writel(cfg_val, aal->regs + DISP_AAL_CFG);
 }
 
 void mtk_aal_start(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index ca377265e5eb..54d3712e2afd 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -56,7 +56,6 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 unsigned int mtk_gamma_get_lut_size(struct device *dev);
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
-void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state);
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 81c04518a5eb..0929f8830d6d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -69,41 +69,28 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return 0;
 }
 
-void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
+void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
-	struct mtk_disp_gamma *gamma;
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 	unsigned int i;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
-	bool lut_diff;
-	u16 lut_size;
 	u32 cfg_val, word;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
 		return;
 
-	/* If we're called from AAL, dev is NULL */
-	gamma = dev ? dev_get_drvdata(dev) : NULL;
-
-	if (gamma && gamma->data) {
-		lut_diff = gamma->data->lut_diff;
-		lut_size = gamma->data->lut_size;
-	} else {
-		lut_diff = false;
-		lut_size = 512;
-	}
-
-	lut_base = regs + DISP_GAMMA_LUT;
+	lut_base = gamma->regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
-	for (i = 0; i < lut_size; i++) {
+	for (i = 0; i < gamma->data->lut_size; i++) {
 		struct drm_color_lut diff, hwlut;
 
 		hwlut.red = drm_color_lut_extract(lut[i].red, 10);
 		hwlut.green = drm_color_lut_extract(lut[i].green, 10);
 		hwlut.blue = drm_color_lut_extract(lut[i].blue, 10);
 
-		if (!lut_diff || (i % 2 == 0)) {
+		if (!gamma->data->lut_diff || (i % 2 == 0)) {
 			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
@@ -124,19 +111,12 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		writel(word, (lut_base + i * 4));
 	}
 
-	cfg_val = readl(regs + DISP_GAMMA_CFG);
+	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
 
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
-	writel(cfg_val, regs + DISP_GAMMA_CFG);
-}
-
-void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
-{
-	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
-
-	mtk_gamma_set_common(dev, gamma->regs, state);
+	writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);
 }
 
 void mtk_gamma_config(struct device *dev, unsigned int w,
-- 
2.42.0

