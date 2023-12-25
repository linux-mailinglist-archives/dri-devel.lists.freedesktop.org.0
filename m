Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10C281E0C6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Dec 2023 14:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BEC10E172;
	Mon, 25 Dec 2023 13:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894BC10E168
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 13:08:59 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ccbaea0a6cso11506741fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 05:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703509738; x=1704114538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/bY3cOQnuwB3eAWgf9usnK5Xs8FGiVWe7DMy14alrc=;
 b=LgGjKjNVG7SFM60oWzXMVsnNyJfyfBagPserx1VOtwS4GcKC+PIBJs3ln6j4KTacY6
 YWBgwf3nCDs30O5iL3f42YqZEoKjTZ3sHCIKGGE8BTdDhWgzEDd1TQN4yKnrAdDf1gvw
 MTc8U/48EFAqBcM8erSyeOCV8rGt6g4g4DvOHmTBeRy3jBRouTJnP+Ew1C2dCSZrMOqM
 ZeP44RRameqj/c+YVrveDRGAXDSMily4oBx8+LEPYq+z8vIu/NdFMe9YXby72Vg1ei4V
 EGRmDBmJzfWiCwXPBdRQ4QsCoyYiXNnt4EGm8qdhtFZzI6QIJBiYZ1ZLCrPKf5q8nWd5
 x/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703509738; x=1704114538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/bY3cOQnuwB3eAWgf9usnK5Xs8FGiVWe7DMy14alrc=;
 b=WSsTmdbMBaJR4KMduzr6Fxpn5y69jbc9fC3dqSXIWjz6DOias3LxcCzQVSeW6ob3Tu
 2txlaV0M4PtMuH8jajrTdlKEcMZm9tPbmnZQHfg1GnDh7BhOQ81B0o5VD0LEZOeGg/kK
 deSg1spT4GrXRy/50nyWrGS+BHZnoWOiimkw9YANmqv3NVdw6IHqgtxPWgbaki0+l3S8
 0oSAJ2n3gHXRa5S9gcca2n9X95uIb+de86IZThixy3EUADE5whieKee84moqlRUIqv2x
 d4maG4Zh0MEL34kuBwIPDs1OlET6e8xdd74n2UoPBMQ8Fsq3P6tV910Ubn20SlB5ykQN
 FrJg==
X-Gm-Message-State: AOJu0Yxzm9KCJpMG27oMPDka8KbyLorLgnojY1+VWj4MI3GVqJjhKMgS
 o8zsqIWcKZytNN33Z/43cchSi0Q8PPQkuw==
X-Google-Smtp-Source: AGHT+IHFY/1bs/4a/mE0IUKuV+Di9j7vkltG5l8Mf7t7z5slV2/5IIIPx12lsdm9ZGcP2lVPknqU2w==
X-Received: by 2002:a05:651c:552:b0:2cc:2025:5bd5 with SMTP id
 q18-20020a05651c055200b002cc20255bd5mr2338310ljp.51.1703509737797; 
 Mon, 25 Dec 2023 05:08:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a05651c015300b002c9f75a48fcsm1030207ljd.16.2023.12.25.05.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Dec 2023 05:08:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
Date: Mon, 25 Dec 2023 15:08:52 +0200
Message-Id: <20231225130853.3659424-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
Move corresponding checks to drm_writeback_connector's implementation
and drop the dpu_encoder_phys_wb_atomic_check() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
 4 files changed, 64 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index a0a28230fc31..8220cd920e6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -354,59 +354,6 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
 	}
 }
 
-/**
- * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
- * @phys_enc:	Pointer to physical encoder
- * @crtc_state:	Pointer to CRTC atomic state
- * @conn_state:	Pointer to connector atomic state
- */
-static int dpu_encoder_phys_wb_atomic_check(
-		struct dpu_encoder_phys *phys_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-	struct drm_framebuffer *fb;
-	const struct drm_display_mode *mode = &crtc_state->mode;
-
-	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
-			phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
-
-	if (!conn_state || !conn_state->connector) {
-		DPU_ERROR("invalid connector state\n");
-		return -EINVAL;
-	} else if (conn_state->connector->status !=
-			connector_status_connected) {
-		DPU_ERROR("connector not connected %d\n",
-				conn_state->connector->status);
-		return -EINVAL;
-	}
-
-	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
-		return 0;
-
-	fb = conn_state->writeback_job->fb;
-
-	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
-			fb->width, fb->height);
-
-	if (fb->width != mode->hdisplay) {
-		DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width,
-				mode->hdisplay);
-		return -EINVAL;
-	} else if (fb->height != mode->vdisplay) {
-		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height,
-				  mode->vdisplay);
-		return -EINVAL;
-	} else if (fb->width > phys_enc->hw_wb->caps->maxlinewidth) {
-		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
-				  fb->width, phys_enc->hw_wb->caps->maxlinewidth);
-		return -EINVAL;
-	}
-
-	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
-}
-
-
 /**
  * _dpu_encoder_phys_wb_update_flush - flush hardware update
  * @phys_enc:	Pointer to physical encoder
@@ -777,7 +724,6 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->is_master = dpu_encoder_phys_wb_is_master;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
-	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
 	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_wb_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_wb_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 723cc1d82143..48728be27e15 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -630,23 +630,26 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
+	const enum dpu_wb wb_idx = WB_2;
+	u32 maxlinewidth;
 	int rc;
 
 	memset(&info, 0, sizeof(info));
 
 	info.num_of_h_tiles = 1;
 	/* use only WB idx 2 instance for DPU */
-	info.h_tile_instance[0] = WB_2;
+	info.h_tile_instance[0] = wb_idx;
 	info.intf_type = INTF_WB;
 
+	maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
+
 	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL, &info);
 	if (IS_ERR(encoder)) {
 		DPU_ERROR("encoder init failed for dsi display\n");
 		return PTR_ERR(encoder);
 	}
 
-	rc = dpu_writeback_init(dev, encoder, wb_formats,
-			n_formats);
+	rc = dpu_writeback_init(dev, encoder, wb_formats, n_formats, maxlinewidth);
 	if (rc) {
 		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 2a5a68366582..232b5f410de8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_edid.h>
+#include <drm/drm_framebuffer.h>
 
 #include "dpu_writeback.h"
 
@@ -24,6 +25,57 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 			dev->mode_config.max_height);
 }
 
+static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
+				    struct drm_atomic_state *state)
+{
+	struct drm_writeback_connector *wb_conn = drm_connector_to_writeback(connector);
+	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(wb_conn);
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc *crtc = conn_state->crtc;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *fb;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	mode = &crtc_state->mode;
+
+	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
+		  connector->base.id, mode->name, mode->hdisplay, mode->vdisplay);
+
+	if (!conn_state || !conn_state->connector) {
+		DPU_ERROR("invalid connector state\n");
+		return -EINVAL;
+	} else if (conn_state->connector->status != connector_status_connected) {
+		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
+		return -EINVAL;
+	}
+
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+		return 0;
+
+	fb = conn_state->writeback_job->fb;
+
+	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id, fb->width, fb->height);
+
+	if (fb->width != mode->hdisplay) {
+		DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width, mode->hdisplay);
+		return -EINVAL;
+	} else if (fb->height != mode->vdisplay) {
+		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height, mode->vdisplay);
+		return -EINVAL;
+	} else if (fb->width > dpu_wb_conn->maxlinewidth) {
+		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
+			  fb->width, dpu_wb_conn->maxlinewidth);
+		return -EINVAL;
+	}
+
+	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
+}
+
 static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -59,12 +111,13 @@ static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
 
 static const struct drm_connector_helper_funcs dpu_wb_conn_helper_funcs = {
 	.get_modes = dpu_wb_conn_get_modes,
+	.atomic_check = dpu_wb_conn_atomic_check,
 	.prepare_writeback_job = dpu_wb_conn_prepare_job,
 	.cleanup_writeback_job = dpu_wb_conn_cleanup_job,
 };
 
 int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
-		const u32 *format_list, u32 num_formats)
+		const u32 *format_list, u32 num_formats, u32 maxlinewidth)
 {
 	struct dpu_wb_connector *dpu_wb_conn;
 	int rc = 0;
@@ -73,6 +126,8 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 	if (!dpu_wb_conn)
 		return -ENOMEM;
 
+	dpu_wb_conn->maxlinewidth = maxlinewidth;
+
 	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
 
 	/* DPU initializes the encoder and sets it up completely for writeback
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
index 5a75ea916101..4b11cca8014c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
@@ -18,6 +18,7 @@
 struct dpu_wb_connector {
 	struct drm_writeback_connector base;
 	struct drm_encoder *wb_enc;
+	u32 maxlinewidth;
 };
 
 static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_connector *conn)
@@ -26,6 +27,6 @@ static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_conne
 }
 
 int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
-		const u32 *format_list, u32 num_formats);
+		const u32 *format_list, u32 num_formats, u32 maxlinewidth);
 
 #endif /*_DPU_WRITEBACK_H */
-- 
2.39.2

