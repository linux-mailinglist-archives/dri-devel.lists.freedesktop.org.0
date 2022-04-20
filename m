Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6865093DC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 01:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C766910F2CE;
	Wed, 20 Apr 2022 23:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C59C10F2C5;
 Wed, 20 Apr 2022 23:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650498624; x=1682034624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=9qb3jeA6TCnARyxP8/h7OSS9GA6SY/hbwL9Rueqf4+A=;
 b=bgo9bCeexjQJXVwCWGv2SAHfzYhhivIxDvuYnc0tkp/FoDRWKLNtIArV
 DIfIRWa6pXQuNobvocKOrtkQbtV9+hWdHg+RHxEFv7lNkhSINCgylHtlB
 +e+E9fLMa5MOydKxAEJrb3NydikvM3okuvbCc0QmzDAAFdn45mKmVM9Po w=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 20 Apr 2022 16:50:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 16:50:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 16:50:11 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 16:50:11 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 16/18] drm/msm/dpu: initialize dpu encoder and connector
 for writeback
Date: Wed, 20 Apr 2022 16:49:45 -0700
Message-ID: <1650498587-14749-17-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize dpu encoder and connector for writeback if the
target supports it in the catalog.

changes in v2:
	- start initialing the encoder for writeback since we
	have migrated to using drm_writeback_connector_init_with_encoder()
	- instead of checking for WB_2 inside _dpu_kms_initialize_writeback
	call it only when its WB_2
	- rebase on tip of msm-next and remove usage of priv->encoders

changes in v3:
	- none

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 ++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 58 +++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 86bdd1a..65e44af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2090,7 +2090,7 @@ static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
 }
 
 static int dpu_encoder_virt_add_phys_encs(
-		u32 display_caps,
+		struct msm_display_info *disp_info,
 		struct dpu_encoder_virt *dpu_enc,
 		struct dpu_enc_phys_init_params *params)
 {
@@ -2109,7 +2109,7 @@ static int dpu_encoder_virt_add_phys_encs(
 		return -EINVAL;
 	}
 
-	if (display_caps & MSM_DISPLAY_CAP_VID_MODE) {
+	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
 		enc = dpu_encoder_phys_vid_init(params);
 
 		if (IS_ERR_OR_NULL(enc)) {
@@ -2122,7 +2122,7 @@ static int dpu_encoder_virt_add_phys_encs(
 		++dpu_enc->num_phys_encs;
 	}
 
-	if (display_caps & MSM_DISPLAY_CAP_CMD_MODE) {
+	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
 		enc = dpu_encoder_phys_cmd_init(params);
 
 		if (IS_ERR_OR_NULL(enc)) {
@@ -2135,6 +2135,19 @@ static int dpu_encoder_virt_add_phys_encs(
 		++dpu_enc->num_phys_encs;
 	}
 
+	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
+		enc = dpu_encoder_phys_wb_init(params);
+
+		if (IS_ERR_OR_NULL(enc)) {
+			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
+					PTR_ERR(enc));
+			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+		}
+
+		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
+		++dpu_enc->num_phys_encs;
+	}
+
 	if (params->split_role == ENC_ROLE_SLAVE)
 		dpu_enc->cur_slave = enc;
 	else
@@ -2233,9 +2246,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		}
 
 		if (!ret) {
-			ret = dpu_encoder_virt_add_phys_encs(disp_info->capabilities,
-												 dpu_enc,
-												 &phys_params);
+			ret = dpu_encoder_virt_add_phys_encs(disp_info,
+					dpu_enc, &phys_params);
 			if (ret)
 				DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
 		}
@@ -2352,8 +2364,9 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	if (!dpu_enc)
 		return ERR_PTR(-ENOMEM);
 
+
 	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
-			drm_enc_mode, NULL);
+							  drm_enc_mode, NULL);
 	if (rc) {
 		devm_kfree(dev->dev, dpu_enc);
 		return ERR_PTR(rc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c683cab..0a50509 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -15,6 +16,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_writeback.h>
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
@@ -29,6 +31,7 @@
 #include "dpu_kms.h"
 #include "dpu_plane.h"
 #include "dpu_vbif.h"
+#include "dpu_writeback.h"
 
 #define CREATE_TRACE_POINTS
 #include "dpu_trace.h"
@@ -648,6 +651,45 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	return 0;
 }
 
+static int _dpu_kms_initialize_writeback(struct drm_device *dev,
+		struct msm_drm_private *priv, struct dpu_kms *dpu_kms,
+		const u32 *wb_formats, int n_formats)
+{
+	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
+	int rc;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL);
+	if (IS_ERR(encoder)) {
+		DPU_ERROR("encoder init failed for dsi display\n");
+		return PTR_ERR(encoder);
+	}
+
+	memset(&info, 0, sizeof(info));
+
+	rc = dpu_writeback_init(dev, encoder, wb_formats,
+			n_formats);
+	if (rc) {
+		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
+		drm_encoder_cleanup(encoder);
+		return rc;
+	}
+
+	info.num_of_h_tiles = 1;
+	/* use only WB idx 2 instance for DPU */
+	info.h_tile_instance[0] = WB_2;
+	info.intf_type = encoder->encoder_type;
+
+	rc = dpu_encoder_setup(dev, encoder, &info);
+	if (rc) {
+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+				  encoder->base.id, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
 /**
  * _dpu_kms_setup_displays - create encoders, bridges and connectors
  *                           for underlying displays
@@ -661,6 +703,7 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 				    struct dpu_kms *dpu_kms)
 {
 	int rc = 0;
+	int i;
 
 	rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
 	if (rc) {
@@ -674,6 +717,21 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 		return rc;
 	}
 
+	/* Since WB isn't a driver check the catalog before initializing */
+	if (dpu_kms->catalog->wb_count) {
+		for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
+			if (dpu_kms->catalog->wb[i].id == WB_2) {
+				rc = _dpu_kms_initialize_writeback(dev, priv, dpu_kms,
+						dpu_kms->catalog->wb[i].format_list,
+						dpu_kms->catalog->wb[i].num_formats);
+				if (rc) {
+					DPU_ERROR("initialize_WB failed, rc = %d\n", rc);
+					return rc;
+				}
+			}
+		}
+	}
+
 	return rc;
 }
 
-- 
2.7.4

