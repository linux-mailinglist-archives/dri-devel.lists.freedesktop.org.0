Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55220CDA387
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B6110E291;
	Tue, 23 Dec 2025 18:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="ho4+fLFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADB410E24A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:03:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766513011; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VLwDTdRIidTUa7h2A5w+jyO9pR9fNf9BhARJmFd9IuLa4dpSYpQrfB1vyamwWzMfsZ82Wqv/TjuBFjqTCBw6vc6Q9mBv9UQ/UHcG7bv2x8oBNnnzjtZnHYLmxHuqn5DuQbohrAaQYSWhXoKUweF/sjWLabceFjtCXtH3To49x3s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766513011;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WD53Lxa+808lRIqs91fc6sEyJLFJkhKRNgFJjHtZ7yc=; 
 b=WBmCAvTRMSk6YqIcAuJjeDb8Y+iCva1DraP1A9UuXdV3KZUidTWX08Sr6uM3oOBM3NzZWVU1EnR5TzDOGLaMzMgZTVEk7febl5kPdMUTv3pQHrcCtqr9s7c/ydDxTPE/FeCrobaLSBrvXKN8S0x3cUngfEcKlnTzbZZc0Da72Yw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766513011; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=WD53Lxa+808lRIqs91fc6sEyJLFJkhKRNgFJjHtZ7yc=;
 b=ho4+fLFWZYVqZ0UJJbwEKj1/yLAq0ag8s4pRHUV3D9bRvcSAB32v3AX9Lst/E7aM
 COZxGWd9CPEfdK1xG1C3ARRxMI3Y0DG9fu0shT18Joivj7sWJef71eQkgyt1iRMRcvS
 ac1cs1fE/VRUc+/h2dNBjcR41rSHQdZvgGf1hrqU=
Received: by mx.zohomail.com with SMTPS id 1766513010043258.51287610776274;
 Tue, 23 Dec 2025 10:03:30 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:36 -0300
Subject: [PATCH v3 16/21] drm/mediatek: gamma: Support CRTC color pipeline API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-16-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=7442;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=3Rn0eJNbPddwyTHTW3U8YMV9xPhZPXWC8FFqd7vGECc=;
 b=P6CrP7f1eSCkRckNgrp1pDFRV6y2Vp+63t7DPGC8s+VETpso4XDgCfKtNeG9JkBh1uvc2OFwr
 8JAH4rv2IwCBKMtltxdzzFEbAZSgLkiinfLSjCYyjENywfotbp/fryH
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Implement the gamma_set_color_pipeline DDP component function to allow
configuring the gamma LUT through the CRTC color pipeline API.

The color pipeline API uses a 32-bit long, rather than 16-bit long, LUT,
so also update the functions to handle both cases.

Also make sure to enable or disable the LUT function depending on
whether the block should be bypassed or not.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |  3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 68 +++++++++++++++++++++++--------
 3 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 69eeb36609584..cf456ab3cf70f 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -327,7 +327,8 @@ static const struct mtk_ddp_comp_funcs ddp_gamma = {
 	.clk_enable = mtk_gamma_clk_enable,
 	.clk_disable = mtk_gamma_clk_disable,
 	.gamma_get_lut_size = mtk_gamma_get_lut_size,
-	.gamma_set = mtk_gamma_set,
+	.gamma_set = mtk_gamma_set_legacy,
+	.gamma_set_color_pipeline = mtk_gamma_set_color_pipeline,
 	.config = mtk_gamma_config,
 	.start = mtk_gamma_start,
 	.stop = mtk_gamma_stop,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index ac84cf579150f..7795aa5bc057f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -58,7 +58,8 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 unsigned int mtk_gamma_get_lut_size(struct device *dev);
-void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
+void mtk_gamma_set_legacy(struct device *dev, struct drm_crtc_state *state);
+void mtk_gamma_set_color_pipeline(struct device *dev, struct drm_color_lut32 *lut);
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 8afd15006df2a..efda0bbb0b09d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -87,13 +87,17 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return 0;
 }
 
-static bool mtk_gamma_lut_is_descending(struct drm_color_lut *lut, u32 lut_size)
+static bool mtk_gamma_lut_is_descending(void *lut, bool bits32, u32 lut_size)
 {
 	u64 first, last;
 	int last_entry = lut_size - 1;
+	struct drm_color_lut32 lut_first, lut_last;
 
-	first = lut[0].red + lut[0].green + lut[0].blue;
-	last = lut[last_entry].red + lut[last_entry].green + lut[last_entry].blue;
+	drm_color_lut_to_lut32(&lut_first, lut, 0, bits32);
+	drm_color_lut_to_lut32(&lut_last, lut, last_entry, bits32);
+
+	first = lut_first.red + lut_first.green + lut_first.blue;
+	last = lut_last.red + lut_last.green + lut_last.blue;
 
 	return !!(first > last);
 }
@@ -113,7 +117,7 @@ static bool mtk_gamma_lut_is_descending(struct drm_color_lut *lut, u32 lut_size)
  *     - 12-bits LUT supported
  *     - 10-its LUT not supported
  */
-void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
+static void mtk_gamma_set(struct device *dev, void *lut, bool bits32)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 	void __iomem *lut0_base = gamma->regs + DISP_GAMMA_LUT;
@@ -121,15 +125,9 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	u32 cfg_val, data_mode, lbank_val, word[2];
 	u8 lut_bits = gamma->data->lut_bits;
 	int cur_bank, num_lut_banks;
-	struct drm_color_lut *lut;
 	unsigned int i;
 
-	/* If there's no gamma lut there's nothing to do here. */
-	if (!state->gamma_lut)
-		return;
-
 	num_lut_banks = gamma->data->lut_size / gamma->data->lut_bank_size;
-	lut = (struct drm_color_lut *)state->gamma_lut->data;
 
 	/* Switch to 12 bits data mode if supported */
 	data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(lut_bits == 12));
@@ -145,11 +143,13 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 
 		for (i = 0; i < gamma->data->lut_bank_size; i++) {
 			int n = cur_bank * gamma->data->lut_bank_size + i;
-			struct drm_color_lut diff, hwlut;
+			struct drm_color_lut32 diff, hwlut, lut32;
+
+			drm_color_lut_to_lut32(&lut32, lut, n, bits32);
 
-			hwlut.red = drm_color_lut_extract(lut[n].red, lut_bits);
-			hwlut.green = drm_color_lut_extract(lut[n].green, lut_bits);
-			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
+			hwlut.red = drm_color_lut_extract(lut32.red, lut_bits);
+			hwlut.green = drm_color_lut_extract(lut32.green, lut_bits);
+			hwlut.blue = drm_color_lut_extract(lut32.blue, lut_bits);
 
 			if (!gamma->data->lut_diff || (i % 2 == 0)) {
 				if (lut_bits == 12) {
@@ -162,13 +162,17 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
 				}
 			} else {
-				diff.red = lut[n].red - lut[n - 1].red;
+				struct drm_color_lut32 lut_prev;
+
+				drm_color_lut_to_lut32(&lut_prev, lut, n-1, bits32);
+
+				diff.red = lut32.red - lut_prev.red;
 				diff.red = drm_color_lut_extract(diff.red, lut_bits);
 
-				diff.green = lut[n].green - lut[n - 1].green;
+				diff.green = lut32.green - lut_prev.green;
 				diff.green = drm_color_lut_extract(diff.green, lut_bits);
 
-				diff.blue = lut[n].blue - lut[n - 1].blue;
+				diff.blue = lut32.blue - lut_prev.blue;
 				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
 
 				if (lut_bits == 12) {
@@ -191,7 +195,7 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 
 	if (!gamma->data->has_dither) {
 		/* Descending or Rising LUT */
-		if (mtk_gamma_lut_is_descending(lut, gamma->data->lut_size - 1))
+		if (mtk_gamma_lut_is_descending(lut, bits32, gamma->data->lut_size - 1))
 			cfg_val |= FIELD_PREP(GAMMA_LUT_TYPE, 1);
 		else
 			cfg_val &= ~GAMMA_LUT_TYPE;
@@ -206,6 +210,34 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);
 }
 
+void mtk_gamma_set_legacy(struct device *dev, struct drm_crtc_state *state)
+{
+	struct drm_color_lut *lut = (struct drm_color_lut *)state->gamma_lut->data;
+
+	/* If there's no gamma lut there's nothing to do here. */
+	if (!state->gamma_lut)
+		return;
+
+	mtk_gamma_set(dev, lut, false);
+}
+
+void mtk_gamma_set_color_pipeline(struct device *dev, struct drm_color_lut32 *lut)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+	u32 cfg_val;
+
+	/* Configure block to be bypassed */
+	if (!lut) {
+		cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
+		cfg_val &= ~GAMMA_LUT_EN;
+		cfg_val |= GAMMA_RELAY_MODE;
+		writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);
+		return;
+	}
+
+	mtk_gamma_set(dev, lut, true);
+}
+
 void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)

-- 
2.51.0

