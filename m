Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E28DB826B7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 02:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338A710E5CC;
	Thu, 18 Sep 2025 00:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bYIDfJT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A34810E5CD;
 Thu, 18 Sep 2025 00:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758156312;
 bh=AeLBQl03qAG/0Pv36jLJWBzJBntn596lkNvH2nd0VLc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bYIDfJT00GucC0EwmTtTdzTFuVVPsx1f+fzkoTrJ45tOjz7pBaoS1to6gcapNZ1N6
 LOCpMYPZBy7n/VwxDztfDbH+mTq9iyZ5tyJ30yO8EKKE7P8YBU8IjkMxT9bRPWoRpy
 MXNo2n9h+7Ijh9rYK8UI4XF+nORZu2hUhyGXgAUL4DhPWnKhsXbWHAJN40rFyeqbLZ
 MGnGbPX5+RNj4Br+Xp8VOYx6O6oh7/Bg+wblfDXsoGXCVi3p5vW7yr/GNHPkkhQdmK
 7E8Y+vlmso5ggQnTX5I2bpXRmqOHNk8t5QKSobARKJWl0fu5aFK+Ui3Ih145jVb5q1
 SI2E/YkgjNe0g==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E9B417E130F;
 Thu, 18 Sep 2025 02:45:04 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:24 -0400
Subject: [PATCH RFC v2 15/20] drm/mediatek: gamma: Support post-blend color
 pipeline API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-15-ac4471b44758@collabora.com>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com, 
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
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

Implement the gamma_set_color_pipeline DDP component function to allow
configuring the gamma LUT through the post-blend color pipeline API.

The color pipeline API uses a 32-bit long, rather than 16-bit long, LUT,
so also update the functions to handle both cases.

Also make sure to enable or disable the LUT function depending on
whether the block should be bypassed or not.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 107 +++++++++++++++++++++++++-----
 3 files changed, 94 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index c873b527423f51733058cbc3d0ad2a719e26bfe1..d253906546506ecf1f1e2a23123b80e774e981ae 100644
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
index ac84cf579150fd0535c79f43ad5942f8d412d450..7795aa5bc057fc09597cbd582f04e4dc76d3ecba 100644
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
index 8afd15006df2a21f3f52fe00eca3c5501f4fb76a..dec9eeb53cb8539e49ecc1087e037645c792ee3d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -87,13 +87,34 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return 0;
 }
 
-static bool mtk_gamma_lut_is_descending(struct drm_color_lut *lut, u32 lut_size)
+static bool mtk_gamma_lut_is_descending(void *lut, bool bits32, u32 lut_size)
 {
 	u64 first, last;
 	int last_entry = lut_size - 1;
+	u32 lutr_first, lutg_first, lutb_first, lutr_last, lutg_last, lutb_last;
+	struct drm_color_lut32 *lut32;
+	struct drm_color_lut *lut16;
+
+	if (bits32) {
+		lut32 = (struct drm_color_lut32 *)lut;
+		lutr_first = lut32[0].red;
+		lutg_first = lut32[0].green;
+		lutb_first = lut32[0].blue;
+		lutr_last = lut32[last_entry].red;
+		lutg_last = lut32[last_entry].green;
+		lutb_last = lut32[last_entry].blue;
+	} else {
+		lut16 = (struct drm_color_lut *)lut;
+		lutr_first = lut16[0].red;
+		lutg_first = lut16[0].green;
+		lutb_first = lut16[0].blue;
+		lutr_last = lut16[last_entry].red;
+		lutg_last = lut16[last_entry].green;
+		lutb_last = lut16[last_entry].blue;
+	}
 
-	first = lut[0].red + lut[0].green + lut[0].blue;
-	last = lut[last_entry].red + lut[last_entry].green + lut[last_entry].blue;
+	first = lutr_first + lutg_first + lutb_first;
+	last = lutr_last + lutg_last + lutb_last;
 
 	return !!(first > last);
 }
@@ -113,7 +134,7 @@ static bool mtk_gamma_lut_is_descending(struct drm_color_lut *lut, u32 lut_size)
  *     - 12-bits LUT supported
  *     - 10-its LUT not supported
  */
-void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
+static void mtk_gamma_set(struct device *dev, void *lut, bool bits32)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 	void __iomem *lut0_base = gamma->regs + DISP_GAMMA_LUT;
@@ -121,19 +142,20 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	u32 cfg_val, data_mode, lbank_val, word[2];
 	u8 lut_bits = gamma->data->lut_bits;
 	int cur_bank, num_lut_banks;
-	struct drm_color_lut *lut;
 	unsigned int i;
-
-	/* If there's no gamma lut there's nothing to do here. */
-	if (!state->gamma_lut)
-		return;
+	struct drm_color_lut32 *lut32;
+	struct drm_color_lut *lut16;
 
 	num_lut_banks = gamma->data->lut_size / gamma->data->lut_bank_size;
-	lut = (struct drm_color_lut *)state->gamma_lut->data;
 
 	/* Switch to 12 bits data mode if supported */
 	data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(lut_bits == 12));
 
+	if (bits32)
+		lut32 = (struct drm_color_lut32 *)lut;
+	else
+		lut16 = (struct drm_color_lut *)lut;
+
 	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
 
 		/* Switch gamma bank and set data mode before writing LUT */
@@ -146,10 +168,21 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 		for (i = 0; i < gamma->data->lut_bank_size; i++) {
 			int n = cur_bank * gamma->data->lut_bank_size + i;
 			struct drm_color_lut diff, hwlut;
+			u32 lutr, lutg, lutb;
+
+			if (bits32) {
+				lutr = lut32[n].red;
+				lutg = lut32[n].green;
+				lutb = lut32[n].blue;
+			} else {
+				lutr = lut16[n].red;
+				lutg = lut16[n].green;
+				lutb = lut16[n].blue;
+			}
 
-			hwlut.red = drm_color_lut_extract(lut[n].red, lut_bits);
-			hwlut.green = drm_color_lut_extract(lut[n].green, lut_bits);
-			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
+			hwlut.red = drm_color_lut_extract(lutr, lut_bits);
+			hwlut.green = drm_color_lut_extract(lutg, lut_bits);
+			hwlut.blue = drm_color_lut_extract(lutb, lut_bits);
 
 			if (!gamma->data->lut_diff || (i % 2 == 0)) {
 				if (lut_bits == 12) {
@@ -162,13 +195,25 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
 				}
 			} else {
-				diff.red = lut[n].red - lut[n - 1].red;
+				u32 lutr_prev, lutg_prev, lutb_prev;
+
+				if (bits32) {
+					lutr_prev = lut32[n-1].red;
+					lutg_prev = lut32[n-1].green;
+					lutb_prev = lut32[n-1].blue;
+				} else {
+					lutr_prev = lut16[n-1].red;
+					lutg_prev = lut16[n-1].green;
+					lutb_prev = lut16[n-1].blue;
+				}
+
+				diff.red = lutr - lutr_prev;
 				diff.red = drm_color_lut_extract(diff.red, lut_bits);
 
-				diff.green = lut[n].green - lut[n - 1].green;
+				diff.green = lutg - lutg_prev;
 				diff.green = drm_color_lut_extract(diff.green, lut_bits);
 
-				diff.blue = lut[n].blue - lut[n - 1].blue;
+				diff.blue = lutb - lutb_prev;
 				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
 
 				if (lut_bits == 12) {
@@ -191,7 +236,7 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 
 	if (!gamma->data->has_dither) {
 		/* Descending or Rising LUT */
-		if (mtk_gamma_lut_is_descending(lut, gamma->data->lut_size - 1))
+		if (mtk_gamma_lut_is_descending(lut, bits32, gamma->data->lut_size - 1))
 			cfg_val |= FIELD_PREP(GAMMA_LUT_TYPE, 1);
 		else
 			cfg_val &= ~GAMMA_LUT_TYPE;
@@ -206,6 +251,34 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
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
2.50.1

