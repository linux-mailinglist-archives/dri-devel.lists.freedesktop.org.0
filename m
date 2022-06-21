Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706CB5528C3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 02:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A044110EAA0;
	Tue, 21 Jun 2022 00:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402B110E249;
 Tue, 21 Jun 2022 00:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655772648; x=1687308648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cX/VgRPeHGjBJXzGOR9q6DBazDAH9hjYSAXARpKUdBE=;
 b=DxTPlPeXla8kgjehoU9Ak3H5Jl2yB7bp9Vv9KbJ2MmJcSxbyr1KTfQ23
 2WJQ4zS7mjDQQ/Mj3+UMQIKyhUdZqas2gBXi9vRzHfx3JwkyOoeL3axvk
 0QFxejLa/ANWwznfQubfCseaW7JWhnMFSWh9w3bHmUalHAawTg2Qx1j70 c=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Jun 2022 17:50:47 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 17:50:47 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 17:50:46 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 1/4] drm/msm/dpu: Move LM CRC code into separate method
Date: Mon, 20 Jun 2022 17:50:31 -0700
Message-ID: <20220621005033.274-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621005033.274-1-quic_jesszhan@quicinc.com>
References: <20220621005033.274-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
- Move common bitmasks to dpu_hw_util.h
- Move common CRC methods to dpu_hw_util.c
- Update copyrights
- Change crcs array to a dynamically allocated array and added it as a
  member of crtc_state

Changes since V2:
- Put changes for hw_util into a separate commit
- Revert crcs array to a static array
- Add else case for set_crc_source to return EINVAL if no valid source
  is selected
- Add DPU_CRTC_MAX_CRC_ENTRIES macro

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 79 ++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  8 +++
 2 files changed, 56 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b56f777dbd0e..69a1257d3b6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -99,17 +100,32 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
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
@@ -146,16 +162,10 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
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
+	else
+		ret = -EINVAL;
 
 cleanup:
 	drm_modeset_unlock(&crtc->mutex);
@@ -174,34 +184,22 @@ static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
 	return dpu_encoder_get_vsync_count(encoder);
 }
 
-
-static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
+		struct dpu_crtc_state *crtc_state, u32 *crcs)
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
+		rc = lm->hw_lm->ops.collect_misr(lm->hw_lm, &crcs[i]);
 
 		if (rc) {
 			if (rc != -ENODATA)
@@ -214,6 +212,25 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 			drm_crtc_accurate_vblank_count(crtc), crcs);
 }
 
+static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+{
+	struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
+	u32 crcs[DPU_CRTC_MAX_CRC_ENTRIES];
+
+	/* Skip first 2 frames in case of "uncooked" CRCs */
+	if (crtc_state->crc_frame_skip_count < 2) {
+		crtc_state->crc_frame_skip_count++;
+		return 0;
+	}
+
+	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
+		BUILD_BUG_ON(ARRAY_SIZE(crcs) < ARRAY_SIZE(crtc_state->mixers));
+		return dpu_crtc_get_lm_crc(crtc, crtc_state, crcs);
+	}
+
+	return 0;
+}
+
 static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 					   bool in_vblank_irq,
 					   int *vpos, int *hpos,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b8785c394fcc..aa897ec28ad3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -69,6 +69,11 @@ struct dpu_crtc_smmu_state_data {
 	uint32_t transition_error;
 };
 
+/*
+ * Maximum CRC entries that can be in crcs entries array
+ */
+#define DPU_CRTC_MAX_CRC_ENTRIES	8
+
 /**
  * enum dpu_crtc_crc_source: CRC source
  * @DPU_CRTC_CRC_SOURCE_NONE: no source set
@@ -201,6 +206,9 @@ struct dpu_crtc {
  * @mixers        : List of active mixers
  * @num_ctls      : Number of ctl paths in use
  * @hw_ctls       : List of active ctl paths
+ * @crc_source    : CRC source
+ * @crc_frame_skip_count: Number of frames skipped before getting CRC
+ * @crcs          : Array to store CRC values
  */
 struct dpu_crtc_state {
 	struct drm_crtc_state base;
-- 
2.35.1

