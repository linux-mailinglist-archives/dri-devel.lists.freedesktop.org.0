Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B175CDA37B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED4A10E263;
	Tue, 23 Dec 2025 18:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="TfZvSEEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8305E10E28C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:03:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766512999; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S7s8afHhtZsF+JR1mnG2vs5X9UDIKDL8LcTvdqxeNHIVw2rb3csJc0ahgKo8BoAYjoyWXZ7N6ijCk85BRxMYucvoSJQoJ+haTd5dbHvHKvc6DZ3/O3aTT/ttk4naXTGYMjPesm/fa3F/MhL2jOLfPOrJGfQ7B4Y2NEtrYRKrtDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766512999;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hfYA+fVOL+a8SO2oNBLNbIsAD/guLeNHzfygNpHBkHc=; 
 b=gztJAeMMM5XMtQvQriCw5Mlzw3ZSsEHEIFJLBVsXHKsmUPSWtRLLUOluy6lHJXQmD5YzP3jg+OhpJ3q7CiligHNw76VE+hkEAb7CG6d801aA1plvwOF8WhmDrqEo9BoxE7PwS7RlyyaViYtpB/30hrFBLhqj6AxV2k+vlTigf7U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512999; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=hfYA+fVOL+a8SO2oNBLNbIsAD/guLeNHzfygNpHBkHc=;
 b=TfZvSEELIa1KiOq4mRUTE2h6oQ6fBgG7UV5SNa5ltqne/tdTv9Z6RXdY7eb61N27
 sghzcjqiw3lmHEnZtCGyLzROATn5Mrz/0SAa+FpZXFMuThE1ap8JLMq6BR/zuC0SPQb
 7j4ShNasDoOiYCwATQZUox2QzOzvWSR/x/fUI/Oc=
Received: by mx.zohomail.com with SMTPS id 17665129973381003.9662016024737;
 Tue, 23 Dec 2025 10:03:17 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:34 -0300
Subject: [PATCH v3 14/21] drm/mediatek: ccorr: Support CRTC color pipeline API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-14-7d969f9a37a0@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=6744;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=bVtBy+vJLyKASPZeIhRnivNNixPjniXmL7OSooko3zk=;
 b=J57pdVTE2PQvT/RMzQvbI8Rx8MWTtVOIpgtTnDR8L1lnfhRnWo7QuZraw9z1Rn/7e0z1ZOtf+
 yBI0Qul4zujANX8Ix0A6JYnglzlCnJIzrjKvaMqZV4nBkDnngbVXjJg
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

Implement the ctm_set_color_pipeline DDP component function to allow
configuring the CTM through the color pipeline API.

The color pipeline API only defines a 3x4 matrix, while the driver
currently only supports setting the coefficients for a 3x3 matrix.
However the underlying hardware does support setting the offset
coefficients that make up a 3x4 matrix, so implement support for setting
them so the 3x4 matrix structure for the API can be used as is.

Also make sure to enable or disable the CTM function depending on
whether the block should be bypassed or not.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |  3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 88 ++++++++++++++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  3 +-
 3 files changed, 73 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 9672ea1f91a2b..69eeb36609584 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -284,7 +284,8 @@ static const struct mtk_ddp_comp_funcs ddp_ccorr = {
 	.config = mtk_ccorr_config,
 	.start = mtk_ccorr_start,
 	.stop = mtk_ccorr_stop,
-	.ctm_set = mtk_ccorr_ctm_set,
+	.ctm_set = mtk_ccorr_ctm_set_legacy,
+	.ctm_set_color_pipeline = mtk_ccorr_ctm_set_color_pipeline,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_color = {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 6d7bf4afa78d3..e2bd8010d22e5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -28,6 +28,11 @@
 #define DISP_CCORR_COEF_2			0x0088
 #define DISP_CCORR_COEF_3			0x008C
 #define DISP_CCORR_COEF_4			0x0090
+#define DISP_CCORR_OFFSET_0			0x0100
+#define CCORR_OFFSET_EN					BIT(31)
+#define DISP_CCORR_OFFSET_1			0x0104
+#define DISP_CCORR_OFFSET_2			0x0108
+#define DISP_CCORR_OFFSET_MASK				GENMASK(26, 14)
 
 struct mtk_disp_ccorr_data {
 	u32 matrix_bits;
@@ -80,36 +85,81 @@ void mtk_ccorr_stop(struct device *dev)
 	writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
 }
 
-void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
+static void mtk_ccorr_ctm_set(struct device *dev, struct cmdq_pkt *cmdq_pkt,
+			      void *ctm, bool ctm_3x4)
 {
 	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
-	struct drm_property_blob *blob = state->ctm;
-	struct drm_color_ctm *ctm;
-	const u64 *input;
-	uint16_t coeffs[9] = { 0 };
-	int i;
-	struct cmdq_pkt *cmdq_pkt = NULL;
 	u32 matrix_bits = ccorr->data->matrix_bits;
+	struct drm_color_ctm_3x4 coeffs;
+	u32 val;
+	int i;
 
-	if (!blob)
-		return;
+	drm_color_ctm_to_ctm_3x4(&coeffs, ctm, ctm_3x4);
 
-	ctm = (struct drm_color_ctm *)blob->data;
-	input = ctm->matrix;
+	for (i = 0; i < ARRAY_SIZE(coeffs.matrix); i++)
+		coeffs.matrix[i] =
+			drm_color_ctm_s31_32_to_qm_n(coeffs.matrix[i], 2, matrix_bits);
 
-	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
-		coeffs[i] = drm_color_ctm_s31_32_to_qm_n(input[i], 2, matrix_bits);
-
-	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
+	mtk_ddp_write(cmdq_pkt, coeffs.matrix[0] << 16 | coeffs.matrix[1],
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
-	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
+	mtk_ddp_write(cmdq_pkt, coeffs.matrix[2] << 16 | coeffs.matrix[4],
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_1);
-	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
+	mtk_ddp_write(cmdq_pkt, coeffs.matrix[5] << 16 | coeffs.matrix[6],
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_2);
-	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
+	mtk_ddp_write(cmdq_pkt, coeffs.matrix[8] << 16 | coeffs.matrix[9],
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_3);
-	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
+	mtk_ddp_write(cmdq_pkt, coeffs.matrix[10] << 16,
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_4);
+
+	if (ctm_3x4) {
+		val = CCORR_OFFSET_EN;
+		val |= FIELD_PREP(DISP_CCORR_OFFSET_MASK, coeffs.matrix[3]);
+		mtk_ddp_write(cmdq_pkt, val, &ccorr->cmdq_reg,
+			      ccorr->regs, DISP_CCORR_OFFSET_0);
+		val = FIELD_PREP(DISP_CCORR_OFFSET_MASK, coeffs.matrix[7]);
+		mtk_ddp_write(cmdq_pkt, val, &ccorr->cmdq_reg,
+			      ccorr->regs, DISP_CCORR_OFFSET_1);
+		val = FIELD_PREP(DISP_CCORR_OFFSET_MASK, coeffs.matrix[11]);
+		mtk_ddp_write(cmdq_pkt, val, &ccorr->cmdq_reg,
+			      ccorr->regs, DISP_CCORR_OFFSET_2);
+	} else {
+		mtk_ddp_write_mask(cmdq_pkt, 0, &ccorr->cmdq_reg,
+				   ccorr->regs, DISP_CCORR_OFFSET_0,
+				   CCORR_OFFSET_EN);
+	}
+
+	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &ccorr->cmdq_reg,
+		      ccorr->regs, DISP_CCORR_CFG);
+}
+
+void mtk_ccorr_ctm_set_legacy(struct device *dev, struct drm_crtc_state *state)
+{
+	struct drm_property_blob *blob = state->ctm;
+	struct cmdq_pkt *cmdq_pkt = NULL;
+	struct drm_color_ctm *ctm;
+
+	if (!blob)
+		return;
+
+	ctm = (struct drm_color_ctm *)blob->data;
+
+	mtk_ccorr_ctm_set(dev, cmdq_pkt, ctm, false);
+}
+
+void mtk_ccorr_ctm_set_color_pipeline(struct device *dev, struct drm_color_ctm_3x4 *ctm)
+{
+	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
+	struct cmdq_pkt *cmdq_pkt = NULL;
+
+	/* Configure block to be bypassed */
+	if (!ctm) {
+		mtk_ddp_write_mask(cmdq_pkt, CCORR_RELAY_MODE, &ccorr->cmdq_reg,
+				   ccorr->regs, DISP_CCORR_CFG,
+				   CCORR_RELAY_MODE | CCORR_ENGINE_EN);
+		return;
+	}
+
+	mtk_ccorr_ctm_set(dev, cmdq_pkt, ctm, true);
 }
 
 static int mtk_disp_ccorr_bind(struct device *dev, struct device *master,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 679d413bf10be..ac84cf579150f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -22,7 +22,8 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state);
 void mtk_aal_start(struct device *dev);
 void mtk_aal_stop(struct device *dev);
 
-void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state);
+void mtk_ccorr_ctm_set_legacy(struct device *dev, struct drm_crtc_state *state);
+void mtk_ccorr_ctm_set_color_pipeline(struct device *dev, struct drm_color_ctm_3x4 *ctm);
 int mtk_ccorr_clk_enable(struct device *dev);
 void mtk_ccorr_clk_disable(struct device *dev);
 void mtk_ccorr_config(struct device *dev, unsigned int w,

-- 
2.51.0

