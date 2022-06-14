Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A128F54BC95
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 23:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAF5112F27;
	Tue, 14 Jun 2022 21:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14888112F53;
 Tue, 14 Jun 2022 21:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655241231; x=1686777231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8MTAGoT60WIw5ns374UPtz4Bv5S/EO5HntB8c+LfneU=;
 b=sxranuZgPrBb4UptJuZYfztpPCRWUeuTIIeCXg7C5pe8x+W4DECJdU3r
 i3hOykLWpmUh9c9x7w953AmjXfhP73sY2oSr4PDlbnu0oIe2O/P3R7kfK
 me5AXs96osxcvP1whNrCKjNgxuWZzOZ+T1VephpNROPIaKi++FGM5a/yR s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Jun 2022 14:13:50 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 14:13:50 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 14 Jun 2022 14:13:50 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 1/3] drm/msm/dpu: Move LM CRC code into separate method
Date: Tue, 14 Jun 2022 14:13:26 -0700
Message-ID: <20220614211328.216-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614211328.216-1-quic_jesszhan@quicinc.com>
References: <20220614211328.216-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move layer mixer-specific section of dpu_crtc_get_crc() into a separate
helper method. This way, we can make it easier to get CRCs from other HW
blocks by adding other get_crc helper methods.

Changes since V1:
- Moved common bitmasks to dpu_hw_util.h
- Moved common CRC methods to dpu_hw_util.c
- Updated copyrights
- Changed crcs array to a dynamically allocated array and added it as a
  member of crtc_state

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 88 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 42 +---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 46 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 16 ++++
 5 files changed, 124 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b56f777dbd0e..16742a66878e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -88,6 +89,11 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
 	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
 	struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
 
+	if (crtc_state->crcs) {
+		kfree(crtc_state->crcs);
+		crtc_state->crcs = NULL;
+	}
+
 	if (source < 0) {
 		DRM_DEBUG_DRIVER("Invalid source %s for CRTC%d\n", src_name, crtc->index);
 		return -EINVAL;
@@ -96,20 +102,37 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
 	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
 		*values_cnt = crtc_state->num_mixers;
 
+	crtc_state->crcs = kcalloc(*values_cnt, sizeof(crtc_state->crcs), GFP_KERNEL);
+
 	return 0;
 }
 
+static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
+{
+	struct dpu_crtc_mixer *m;
+	int i;
+
+	for (i = 0; i < crtc_state->num_mixers; ++i) {
+		m = &crtc_state->mixers[i];
+
+		if (!m->hw_lm || !m->hw_lm->ops.setup_misr)
+			continue;
+
+		/* Calculate MISR over 1 frame */
+		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
+	}
+}
+
 static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
 	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
 	enum dpu_crtc_crc_source current_source;
 	struct dpu_crtc_state *crtc_state;
 	struct drm_device *drm_dev = crtc->dev;
-	struct dpu_crtc_mixer *m;
 
 	bool was_enabled;
 	bool enable = false;
-	int i, ret = 0;
+	int ret = 0;
 
 	if (source < 0) {
 		DRM_DEBUG_DRIVER("Invalid CRC source %s for CRTC%d\n", src_name, crtc->index);
@@ -137,6 +160,10 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 			goto cleanup;
 
 	} else if (was_enabled && !enable) {
+		if (crtc_state->crcs) {
+			kfree(crtc_state->crcs);
+			crtc_state->crcs = NULL;
+		}
 		drm_crtc_vblank_put(crtc);
 	}
 
@@ -146,16 +173,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	crtc_state->crc_frame_skip_count = 0;
 
-	for (i = 0; i < crtc_state->num_mixers; ++i) {
-		m = &crtc_state->mixers[i];
-
-		if (!m->hw_lm || !m->hw_lm->ops.setup_misr)
-			continue;
-
-		/* Calculate MISR over 1 frame */
-		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
-	}
-
+	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
+		dpu_crtc_setup_lm_misr(crtc_state);
 
 cleanup:
 	drm_modeset_unlock(&crtc->mutex);
@@ -174,34 +193,21 @@ static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
 	return dpu_encoder_get_vsync_count(encoder);
 }
 
-
-static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc, struct dpu_crtc_state *crtc_state)
 {
-	struct dpu_crtc_state *crtc_state;
-	struct dpu_crtc_mixer *m;
-	u32 crcs[CRTC_DUAL_MIXERS];
+	struct dpu_crtc_mixer *lm;
 
-	int i = 0;
 	int rc = 0;
-
-	crtc_state = to_dpu_crtc_state(crtc->state);
-
-	BUILD_BUG_ON(ARRAY_SIZE(crcs) != ARRAY_SIZE(crtc_state->mixers));
-
-	/* Skip first 2 frames in case of "uncooked" CRCs */
-	if (crtc_state->crc_frame_skip_count < 2) {
-		crtc_state->crc_frame_skip_count++;
-		return 0;
-	}
+	int i;
 
 	for (i = 0; i < crtc_state->num_mixers; ++i) {
 
-		m = &crtc_state->mixers[i];
+		lm = &crtc_state->mixers[i];
 
-		if (!m->hw_lm || !m->hw_lm->ops.collect_misr)
+		if (!lm->hw_lm || !lm->hw_lm->ops.collect_misr)
 			continue;
 
-		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
+		rc = lm->hw_lm->ops.collect_misr(lm->hw_lm, &crtc_state->crcs[i]);
 
 		if (rc) {
 			if (rc != -ENODATA)
@@ -211,7 +217,25 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 	}
 
 	return drm_crtc_add_crc_entry(crtc, true,
-			drm_crtc_accurate_vblank_count(crtc), crcs);
+			drm_crtc_accurate_vblank_count(crtc), crtc_state->crcs);
+}
+
+static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+{
+	struct dpu_crtc_state *crtc_state;
+
+	crtc_state = to_dpu_crtc_state(crtc->state);
+
+	/* Skip first 2 frames in case of "uncooked" CRCs */
+	if (crtc_state->crc_frame_skip_count < 2) {
+		crtc_state->crc_frame_skip_count++;
+		return 0;
+	}
+
+	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
+		return dpu_crtc_get_lm_crc(crtc, crtc_state);
+
+	return 0;
 }
 
 static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b8785c394fcc..4bf45e3343ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -201,6 +201,9 @@ struct dpu_crtc {
  * @mixers        : List of active mixers
  * @num_ctls      : Number of ctl paths in use
  * @hw_ctls       : List of active ctl paths
+ * @crc_source    : CRC source
+ * @crc_frame_skip_count: Number of frames skipped before getting CRC
+ * @crcs          : Array to store CRC values
  */
 struct dpu_crtc_state {
 	struct drm_crtc_state base;
@@ -222,6 +225,7 @@ struct dpu_crtc_state {
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
+	u32 *crcs;
 };
 
 #define to_dpu_crtc_state(x) \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 462f5082099e..06b24d8d1419 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
@@ -27,11 +28,6 @@
 
 #define LM_MISR_CTRL                     0x310
 #define LM_MISR_SIGNATURE                0x314
-#define LM_MISR_FRAME_COUNT_MASK         0xFF
-#define LM_MISR_CTRL_ENABLE              BIT(8)
-#define LM_MISR_CTRL_STATUS              BIT(9)
-#define LM_MISR_CTRL_STATUS_CLEAR        BIT(10)
-#define LM_MISR_CTRL_FREE_RUN_MASK     BIT(31)
 
 
 static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
@@ -108,44 +104,12 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 
 static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
 {
-	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	u32 config = 0;
-
-	DPU_REG_WRITE(c, LM_MISR_CTRL, LM_MISR_CTRL_STATUS_CLEAR);
-
-	/* Clear old MISR value (in case it's read before a new value is calculated)*/
-	wmb();
-
-	if (enable) {
-		config = (frame_count & LM_MISR_FRAME_COUNT_MASK) |
-			LM_MISR_CTRL_ENABLE | LM_MISR_CTRL_FREE_RUN_MASK;
-
-		DPU_REG_WRITE(c, LM_MISR_CTRL, config);
-	} else {
-		DPU_REG_WRITE(c, LM_MISR_CTRL, 0);
-	}
-
+	dpu_hw_setup_misr(&ctx->hw, enable, frame_count, LM_MISR_CTRL);
 }
 
 static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
 {
-	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	u32 ctrl = 0;
-
-	if (!misr_value)
-		return -EINVAL;
-
-	ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
-
-	if (!(ctrl & LM_MISR_CTRL_ENABLE))
-		return -ENODATA;
-
-	if (!(ctrl & LM_MISR_CTRL_STATUS))
-		return -EINVAL;
-
-	*misr_value = DPU_REG_READ(c, LM_MISR_SIGNATURE);
-
-	return 0;
+	return dpu_hw_collect_misr(&ctx->hw, misr_value, LM_MISR_CTRL, LM_MISR_SIGNATURE);
 }
 
 static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 512316f25a51..244f2f90e99a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 
@@ -447,3 +449,45 @@ u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 
 	return 0;
 }
+
+void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, bool enable,
+		u32 frame_count, u32 misr_ctrl_offset)
+{
+	u32 config = 0;
+
+	DPU_REG_WRITE(c, misr_ctrl_offset, MISR_CTRL_STATUS_CLEAR);
+
+	/* Clear old MISR value (in case it's read before a new value is calculated)*/
+	wmb();
+
+	if (enable) {
+		config = (frame_count & MISR_FRAME_COUNT_MASK) |
+			MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
+
+		DPU_REG_WRITE(c, misr_ctrl_offset, config);
+	} else {
+		DPU_REG_WRITE(c, misr_ctrl_offset, 0);
+	}
+
+}
+
+int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c, u32 *misr_value,
+		u32 misr_ctrl_offset, u32 misr_signature_offset)
+{
+	u32 ctrl = 0;
+
+	if (!misr_value)
+		return -EINVAL;
+
+	ctrl = DPU_REG_READ(c, misr_ctrl_offset);
+
+	if (!(ctrl & MISR_CTRL_ENABLE))
+		return -ENODATA;
+
+	if (!(ctrl & MISR_CTRL_STATUS))
+		return -EINVAL;
+
+	*misr_value = DPU_REG_READ(c, misr_signature_offset);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index e4a65eb4f769..88df3a5c5d8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
@@ -12,6 +13,11 @@
 #include "dpu_hw_catalog.h"
 
 #define REG_MASK(n)                     ((BIT(n)) - 1)
+#define MISR_FRAME_COUNT_MASK         0xFF
+#define MISR_CTRL_ENABLE              BIT(8)
+#define MISR_CTRL_STATUS              BIT(9)
+#define MISR_CTRL_STATUS_CLEAR        BIT(10)
+#define MISR_CTRL_FREE_RUN_MASK     BIT(31)
 
 /*
  * This is the common struct maintained by each sub block
@@ -343,4 +349,14 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 		u32 total_fl);
 
+void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
+		bool enable,
+		u32 frame_count,
+		u32 misr_ctrl_offset);
+
+int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
+		u32 *misr_value,
+		u32 misr_ctrl_offset,
+		u32 misr_signature_offset);
+
 #endif /* _DPU_HW_UTIL_H */
-- 
2.35.1

