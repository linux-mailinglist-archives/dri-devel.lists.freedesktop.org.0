Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6C0373656
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 10:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEE16E0A5;
	Wed,  5 May 2021 08:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ED76E0E9;
 Wed,  5 May 2021 08:23:26 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 05 May 2021 01:17:23 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 May 2021 01:17:22 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
 by ironmsg01-blr.qualcomm.com with ESMTP; 05 May 2021 13:46:58 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
 id 84F6F21D5B; Wed,  5 May 2021 13:46:57 +0530 (IST)
From: Sankeerth Billakanti <sbillaka@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] drm/msm/disp/dpu1: add support for edp encoder
Date: Wed,  5 May 2021 13:46:19 +0530
Message-Id: <1620202579-19066-4-git-send-email-sbillaka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
References: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
X-Mailman-Approved-At: Wed, 05 May 2021 08:34:34 +0000
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
Cc: mkrishn@codeaurora.org, dianders@chromium.org, abhinavk@codeaurora.org,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, Sankeerth Billakanti <sbillaka@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change will enable dpu encoder support for the native
eDP interface on next generation snapdragon platforms.

Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 33 +++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8d94205..9f5185bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2075,7 +2075,12 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		intf_type = INTF_DSI;
 		break;
 	case DRM_MODE_ENCODER_TMDS:
-		intf_type = INTF_DP;
+		if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
+			intf_type = INTF_EDP;
+			/* PSR CMD mode not supported */
+			disp_info->capabilities = MSM_DISPLAY_CAP_VID_MODE;
+		} else
+			intf_type = INTF_DP;
 		break;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 88e9cc3..ecd7dc8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -499,6 +499,33 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 	return rc;
 }
 
+static int _dpu_kms_initialize_edp(struct drm_device *dev,
+				    struct msm_drm_private *priv,
+				    struct dpu_kms *dpu_kms)
+{
+	struct drm_encoder *encoder = NULL;
+	int rc = 0;
+
+	if (!priv->edp)
+		return rc;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(encoder)) {
+		DPU_ERROR("encoder init failed for eDP display\n");
+		return PTR_ERR(encoder);
+	}
+
+	rc = msm_edp_modeset_init(priv->edp, dev, encoder);
+	if (rc) {
+		DPU_ERROR("modeset_init failed for eDP, rc = %d\n", rc);
+		drm_encoder_cleanup(encoder);
+		return rc;
+	}
+
+	priv->encoders[priv->num_encoders++] = encoder;
+	return rc;
+}
+
 static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 					    struct msm_drm_private *priv,
 					    struct dpu_kms *dpu_kms)
@@ -546,6 +573,12 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 		return rc;
 	}
 
+	rc = _dpu_kms_initialize_edp(dev, priv, dpu_kms);
+	if (rc) {
+		DPU_ERROR("initialize_eDP failed, rc = %d\n", rc);
+		return rc;
+	}
+
 	rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms);
 	if (rc) {
 		DPU_ERROR("initialize_DP failed, rc = %d\n", rc);
-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
