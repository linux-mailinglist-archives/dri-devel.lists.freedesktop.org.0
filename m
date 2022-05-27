Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D253672E
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 20:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296A610EC20;
	Fri, 27 May 2022 18:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1751D10EED6;
 Fri, 27 May 2022 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653677679; x=1685213679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VLey8LQjTgFeEPJu1MqxFPRJ7C4curDCGIeGWS63p08=;
 b=MkIisHeAFHZ9HRKxJYZNjpFX8W15CuppzWlRSDPW6HSZrF8b5qXiTmwy
 ofFO35XDoIr3kvkpDs2DBM3miHMTqR0P2bJJ0h1lHuj3GJiDD1EpEE3G4
 B/VM669Anv29910NVDeygzhbGqFX+7UwD/3Kft3LVZh/UAj9CUpSMxe39 E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 May 2022 11:54:38 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 11:54:38 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 27 May 2022 11:54:37 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/msm/dpu: Add interface support for CRC debugfs
Date: Fri, 27 May 2022 11:54:07 -0700
Message-ID: <20220527185407.162-4-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527185407.162-1-quic_jesszhan@quicinc.com>
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
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

Add support for writing CRC values for the interface block to
the debugfs by calling the necessary MISR setup/collect methods.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 43 ++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 61 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 ++++++++
 4 files changed, 128 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ae09466663cf..e830fb1e910d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -79,6 +79,8 @@ static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
 	if (!strcmp(src_name, "auto") ||
 	    !strcmp(src_name, "lm"))
 		return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
+	if (!strcmp(src_name, "intf"))
+		return DPU_CRTC_CRC_SOURCE_INTF;
 
 	return DPU_CRTC_CRC_SOURCE_INVALID;
 }
@@ -94,8 +96,18 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
 		return -EINVAL;
 	}
 
-	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
+	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
 		*values_cnt = crtc_state->num_mixers;
+	} else if (source == DPU_CRTC_CRC_SOURCE_INTF) {
+		struct drm_encoder *drm_enc = get_encoder_from_crtc(crtc);
+
+		if (!drm_enc) {
+			DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
+			return -ENODATA;
+		}
+
+		*values_cnt = dpu_encoder_get_num_phys(drm_enc);
+	}
 
 	return 0;
 }
@@ -116,6 +128,18 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
 	}
 }
 
+static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
+{
+	struct drm_encoder *drm_enc = get_encoder_from_crtc(crtc);
+
+	if (!drm_enc) {
+		DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
+		return;
+	}
+
+	dpu_encoder_setup_misr(drm_enc);
+}
+
 static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
 	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
@@ -164,6 +188,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
 		dpu_crtc_setup_lm_misr(crtc_state);
+	else if (source == DPU_CRTC_CRC_SOURCE_INTF)
+		dpu_crtc_setup_encoder_misr(crtc);
 
 cleanup:
 	drm_modeset_unlock(&crtc->mutex);
@@ -212,6 +238,18 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc, struct dpu_crtc_state *crt
 			drm_crtc_accurate_vblank_count(crtc), crcs);
 }
 
+static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc)
+{
+	struct drm_encoder *drm_enc =  get_encoder_from_crtc(crtc);
+
+	if (!drm_enc) {
+		DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
+		return -EINVAL;
+	}
+
+	return dpu_encoder_get_crc(drm_enc);
+}
+
 static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 {
 	struct dpu_crtc_state *crtc_state;
@@ -227,6 +265,9 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
 		return dpu_crtc_get_lm_crc(crtc, crtc_state);
 
+	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_INTF)
+		return dpu_crtc_get_encoder_crc(crtc);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b8785c394fcc..a60af034905d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -73,11 +74,13 @@ struct dpu_crtc_smmu_state_data {
  * enum dpu_crtc_crc_source: CRC source
  * @DPU_CRTC_CRC_SOURCE_NONE: no source set
  * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
+ * @DPU_CRTC_CRC_SOURCE_INTF: CRC in phys interface
  * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
  */
 enum dpu_crtc_crc_source {
 	DPU_CRTC_CRC_SOURCE_NONE = 0,
 	DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
+	DPU_CRTC_CRC_SOURCE_INTF,
 	DPU_CRTC_CRC_SOURCE_MAX,
 	DPU_CRTC_CRC_SOURCE_INVALID = -1
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 52516eb20cb8..7740515f462d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
+#include <drm/drm_vblank.h>
 #include <drm/drm_probe_helper.h>
 
 #include "msm_drv.h"
@@ -225,6 +226,66 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 	return dpu_enc->wide_bus_en;
 }
 
+int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	return dpu_enc->num_phys_encs;
+}
+
+void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+
+	int i;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
+			continue;
+
+		phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
+	}
+}
+
+int dpu_encoder_get_crc(const struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	u32 crcs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
+
+	int i, rc;
+
+	if (!drm_enc->crtc) {
+		DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
+		return -EINVAL;
+	}
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
+			continue;
+
+		rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[i]);
+
+		if (rc) {
+			if (rc != -ENODATA)
+				DRM_DEBUG_DRIVER("MISR read failed\n");
+			return rc;
+		}
+	}
+
+	return drm_crtc_add_crc_entry(drm_enc->crtc, true,
+			drm_crtc_accurate_vblank_count(drm_enc->crtc), crcs);
+}
+
 static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
 {
 	struct dpu_hw_dither_cfg dither_cfg = { 0 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 781d41c91994..8345599dd01a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -174,6 +175,27 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_get_num_phys - get number of physical encoders contained in virtual
+ *                            encoder
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * Returns:	Number of physical encoders for given drm encoder
+ */
+int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc);
+
+/**
+ * dpu_encoder_setup_misr - enable misr calculations
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
+void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
+
+/**
+ * dpu_encoder_get_crc - get the crc value from interface blocks
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * Returns:     0 on success, error otherwise
+ */
+int dpu_encoder_get_crc(const struct drm_encoder *drm_enc);
+
 /**
  * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
  * @drm_enc:    Pointer to previously created drm encoder structure
-- 
2.35.1

