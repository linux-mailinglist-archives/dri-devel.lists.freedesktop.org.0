Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531B14299ED
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 01:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A756E97B;
	Mon, 11 Oct 2021 23:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0723F6E97B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 23:42:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633995725; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=x49jqxX7el0L2THVuXp3QUU9RJugVljPgBNXB06LnWw=;
 b=Ne5h3OrX/n1tZanEJgR6Ngwu1/hUuasFnc2Gqfcjlqs71eyPXa3Dscz/VbKYS/L1WlWpGdBb
 l6v3ex+cvWBWBkYO38GRosqFImj1zpm+rYxLtHsmIQ0mJ3BhqS2n9dCjwUq5B9s25IUMeNh3
 ftIF1aGgCWz2WdMkguf602k6VBo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6164cbb7ab9da96e6467a491 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 23:41:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C2261C43616; Mon, 11 Oct 2021 23:41:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 801BFC4338F;
 Mon, 11 Oct 2021 23:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 801BFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jessica Zhang <jesszhan@codeaurora.org>
To: freedreno@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com,
 seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
 aravindh@codeaurora.org, khsieh@codeaurora.org,
 dmitry.baryshkov@linaro.org, abhinavk@codeaurora.org, markyacoub@google.com
Subject: [PATCH] drm/msm/dpu: Add CRC support for DPU
Date: Mon, 11 Oct 2021 16:41:23 -0700
Message-Id: <20211011234123.1033-1-jesszhan@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add CRC support to DPU, which is currently not supported by
this driver. Only supports CRC for CRTC for now, but will extend support
to other blocks later on.

Tested on Qualcomm RB3 (debian, sdm845)

Signed-off-by: Jessica Zhang <jesszhan@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 169 +++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  20 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  46 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |   9 +-
 5 files changed, 251 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 768012243b44..6ebf989c4e67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -70,6 +70,121 @@ static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 	return NULL;
 }
 
+static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
+{
+	if (!src_name || !strcmp(src_name, "none"))
+		return DPU_CRTC_CRC_SOURCE_NONE;
+	if (!strcmp(src_name, "auto") || !strcmp(src_name, "lm"))
+		return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
+
+	return DPU_CRTC_CRC_SOURCE_INVALID;
+}
+
+static bool dpu_crtc_is_valid_crc_source(enum dpu_crtc_crc_source source)
+{
+	return (source > DPU_CRTC_CRC_SOURCE_NONE &&
+		source < DPU_CRTC_CRC_SOURCE_MAX);
+}
+
+int dpu_crtc_verify_crc_source(struct drm_crtc *crtc, const char *src_name, size_t *values_cnt)
+{
+	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
+	struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
+
+	if (source < 0) {
+		DRM_DEBUG_DRIVER("Invalid source %s for CRTC%d\n", src_name, crtc->index);
+		return -EINVAL;
+	}
+
+	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
+		*values_cnt = crtc_state->num_mixers;
+
+	return 0;
+}
+
+int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
+{
+	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
+	enum dpu_crtc_crc_source current_source;
+	struct drm_crtc_commit *commit;
+	struct dpu_crtc_state *crtc_state;
+	struct drm_device *drm_dev = crtc->dev;
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	struct dpu_crtc_mixer *m;
+
+	bool was_enabled;
+	bool enable = false;
+	int i, ret = 0;
+
+	if (source < 0) {
+		DRM_DEBUG_DRIVER("Invalid CRC source %s for CRTC%d\n", src_name, crtc->index);
+		return -EINVAL;
+	}
+
+	ret = drm_modeset_lock(&crtc->mutex, NULL);
+
+	if (ret)
+		return ret;
+
+	/* Wait for any pending commits to finish */
+	spin_lock(&crtc->commit_lock);
+	commit = list_first_entry_or_null(&crtc->commit_list, struct drm_crtc_commit, commit_entry);
+
+	if (commit)
+		drm_crtc_commit_get(commit);
+	spin_unlock(&crtc->commit_lock);
+
+	if (commit) {
+		ret = wait_for_completion_interruptible_timeout(&commit->hw_done, 10 * HZ);
+
+		if (ret)
+			goto cleanup;
+	}
+
+	enable = dpu_crtc_is_valid_crc_source(source);
+	crtc_state = to_dpu_crtc_state(crtc->state);
+
+	spin_lock_irq(&drm_dev->event_lock);
+	current_source = dpu_crtc->crc_source;
+	spin_unlock_irq(&drm_dev->event_lock);
+
+	was_enabled = !(current_source == DPU_CRTC_CRC_SOURCE_NONE);
+
+	if (!was_enabled && enable) {
+		ret = drm_crtc_vblank_get(crtc);
+
+		if (ret)
+			goto cleanup;
+
+	} else if (was_enabled && !enable) {
+		drm_crtc_vblank_put(crtc);
+	}
+
+	spin_lock_irq(&drm_dev->event_lock);
+	dpu_crtc->crc_source = source;
+	spin_unlock_irq(&drm_dev->event_lock);
+
+	crtc_state->skip_count = 0;
+
+	for (i = 0; i < crtc_state->num_mixers; ++i) {
+		m = &crtc_state->mixers[i];
+
+		if (!m->hw_lm || !m->hw_lm->ops.collect_misr || !m->hw_lm->ops.setup_misr)
+			continue;
+
+		/* Calculate MISR over 1 frame */
+		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
+	}
+
+
+cleanup:
+	if (commit)
+		drm_crtc_commit_put(commit);
+	drm_modeset_unlock(&crtc->mutex);
+
+	return ret;
+}
+
 static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
@@ -83,6 +198,52 @@ static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
 	return dpu_encoder_get_frame_count(encoder);
 }
 
+
+static void dpu_crtc_get_crc(struct drm_crtc *crtc)
+{
+	struct dpu_crtc *dpu_crtc;
+	struct dpu_crtc_state *crtc_state;
+	struct dpu_crtc_mixer *m;
+	u32 *crcs;
+
+	int i = 0;
+	int rc = 0;
+
+	if (!crtc) {
+		DPU_ERROR("Invalid crtc\n");
+		return;
+	}
+
+	crtc_state = to_dpu_crtc_state(crtc->state);
+	dpu_crtc = to_dpu_crtc(crtc);
+	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
+
+	/* Skip first 2 frames in case of "uncooked" CRCs */
+	if (crtc_state->skip_count < 2) {
+		crtc_state->skip_count++;
+		return;
+	}
+
+	for (i = 0; i < crtc_state->num_mixers; ++i) {
+
+		m = &crtc_state->mixers[i];
+
+		if (!m->hw_lm || !m->hw_lm->ops.collect_misr
+			|| !m->hw_lm->ops.setup_misr)
+			continue;
+
+		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
+
+		if (rc) {
+			DRM_DEBUG_DRIVER("MISR read failed\n");
+			return;
+		}
+	}
+
+	drm_crtc_add_crc_entry(crtc, true,
+			drm_crtc_accurate_vblank_count(crtc), crcs);
+}
+
 static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 					   bool in_vblank_irq,
 					   int *vpos, int *hpos,
@@ -389,6 +550,10 @@ void dpu_crtc_vblank_callback(struct drm_crtc *crtc)
 		dpu_crtc->vblank_cb_time = ktime_get();
 	else
 		dpu_crtc->vblank_cb_count++;
+
+	if (dpu_crtc_is_valid_crc_source(dpu_crtc->crc_source))
+		dpu_crtc_get_crc(crtc);
+
 	drm_crtc_handle_vblank(crtc);
 	trace_dpu_crtc_vblank_cb(DRMID(crtc));
 }
@@ -1332,6 +1497,8 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.atomic_destroy_state = dpu_crtc_destroy_state,
 	.late_register = dpu_crtc_late_register,
 	.early_unregister = dpu_crtc_early_unregister,
+	.verify_crc_source = dpu_crtc_verify_crc_source,
+	.set_crc_source = dpu_crtc_set_crc_source,
 	.enable_vblank  = msm_crtc_enable_vblank,
 	.disable_vblank = msm_crtc_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index cec3474340e8..e9940f1d5d15 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -69,6 +69,19 @@ struct dpu_crtc_smmu_state_data {
 	uint32_t transition_error;
 };
 
+/**
+ * enum dpu_crtc_crc_source: CRC source
+ * @DPU_CRTC_CRC_SOURCE_NONE: no source set
+ * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
+ * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
+ */
+enum dpu_crtc_crc_source {
+	DPU_CRTC_CRC_SOURCE_NONE = 0,
+	DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
+	DPU_CRTC_CRC_SOURCE_MAX,
+	DPU_CRTC_CRC_SOURCE_INVALID = -1
+};
+
 /**
  * struct dpu_crtc_mixer: stores the map for each virtual pipeline in the CRTC
  * @hw_lm:	LM HW Driver context
@@ -139,6 +152,7 @@ struct dpu_crtc_frame_event {
  * @event_lock    : Spinlock around event handling code
  * @phandle: Pointer to power handler
  * @cur_perf      : current performance committed to clock/bandwidth driver
+ * @crc_source    : CRC source
  */
 struct dpu_crtc {
 	struct drm_crtc base;
@@ -171,8 +185,8 @@ struct dpu_crtc {
 	spinlock_t event_lock;
 
 	struct dpu_core_perf_params cur_perf;
-
 	struct dpu_crtc_smmu_state_data smmu_state;
+	enum dpu_crtc_crc_source crc_source;
 };
 
 #define to_dpu_crtc(x) container_of(x, struct dpu_crtc, base)
@@ -210,6 +224,8 @@ struct dpu_crtc_state {
 
 	u32 num_ctls;
 	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
+
+	int skip_count;
 };
 
 #define to_dpu_crtc_state(x) \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index cb6bb7a22c15..679b3728e891 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
 #include "dpu_kms.h"
@@ -24,6 +25,9 @@
 #define LM_BLEND0_FG_ALPHA               0x04
 #define LM_BLEND0_BG_ALPHA               0x08
 
+#define LM_MISR_CTRL                     0x310
+#define LM_MISR_SIGNATURE                0x314
+
 static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -96,6 +100,44 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 	}
 }
 
+static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	u32 config = 0;
+
+	DPU_REG_WRITE(c, LM_MISR_CTRL, MISR_CTRL_STATUS_CLEAR);
+
+	/* Clear MISR data */
+	wmb();
+
+	if (enable)
+		config = (frame_count & MISR_FRAME_COUNT_MASK) |
+			MISR_CTRL_ENABLE | INTF_MISR_CTRL_FREE_RUN_MASK;
+
+	DPU_REG_WRITE(c, LM_MISR_CTRL, config);
+}
+
+static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	u32 ctrl = 0;
+
+	if (!misr_value)
+		return -EINVAL;
+
+	ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
+
+	if (!(ctrl & MISR_CTRL_ENABLE))
+		return -EINVAL;
+
+	if (!(ctrl & MISR_CTRL_STATUS))
+		return -EINVAL;
+
+	*misr_value = DPU_REG_READ(c, LM_MISR_SIGNATURE);
+
+	return 0;
+}
+
 static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
 	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
 {
@@ -158,6 +200,8 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
 	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
 	ops->setup_border_color = dpu_hw_lm_setup_border_color;
+	ops->setup_misr = dpu_hw_lm_setup_misr;
+	ops->collect_misr = dpu_hw_lm_collect_misr;
 }
 
 struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 4a6b2de19ef6..d8052fb2d5da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_LM_H
@@ -53,6 +54,16 @@ struct dpu_hw_lm_ops {
 	void (*setup_border_color)(struct dpu_hw_mixer *ctx,
 		struct dpu_mdss_color *color,
 		u8 border_en);
+
+	/**
+	 * setup_misr: Enable/disable MISR
+	 */
+	void (*setup_misr)(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count);
+
+	/**
+	 * collect_misr: Read MISR signature
+	 */
+	int (*collect_misr)(struct dpu_hw_mixer *ctx, u32 *misr_value);
 };
 
 struct dpu_hw_mixer {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index ff3cffde84cd..506d4af7d018 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_UTIL_H
@@ -309,6 +310,12 @@ int dpu_reg_read(struct dpu_hw_blk_reg_map *c, u32 reg_off);
 #define DPU_REG_WRITE(c, off, val) dpu_reg_write(c, off, val, #off)
 #define DPU_REG_READ(c, off) dpu_reg_read(c, off)
 
+#define MISR_FRAME_COUNT_MASK           0xFF
+#define MISR_CTRL_ENABLE                BIT(8)
+#define MISR_CTRL_STATUS                BIT(9)
+#define MISR_CTRL_STATUS_CLEAR          BIT(10)
+#define INTF_MISR_CTRL_FREE_RUN_MASK    BIT(31)
+
 void *dpu_hw_util_get_dir(void);
 
 void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

