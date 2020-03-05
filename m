Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0F017A0EE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D726EB94;
	Thu,  5 Mar 2020 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38DB6EB81
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 00:11:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583367106; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=60GY4LcYmcTFYPq9bYJ8yYXyuMgUxQzHcHWRRrqPOew=;
 b=XpD4QBNrlGkcFh9f7dKF/VWLOXVK1RJPbfRNeU5cj8bVHDPJJ3o+V4cyYQ3C8ef99dGx1e0e
 sljZMrRYd7+6eqIXcttT3JWjdZTsVrbwMJQlvCGuiFrjj2YKMxD+HnAVQYXWxdd5i8+ZmvYJ
 9MGYotvvS8Okpi3BzLcR+0A1W9U=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6043b6.7fe9ba61ff80-smtp-out-n02;
 Thu, 05 Mar 2020 00:11:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 322E0C447A6; Thu,  5 Mar 2020 00:11:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from displaysanity13-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: varar)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DBEEC4479F;
 Thu,  5 Mar 2020 00:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0DBEEC4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=varar@codeaurora.org
From: Vara Reddy <varar@codeaurora.org>
To: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, seanpaul@chromium.org
Subject: [DPU PATCH v4 5/5] drm/msm/dpu: add display port support in DPU
Date: Wed,  4 Mar 2020 16:10:28 -0800
Message-Id: <1583367028-19979-6-git-send-email-varar@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583367028-19979-1-git-send-email-varar@codeaurora.org>
References: <1583367028-19979-1-git-send-email-varar@codeaurora.org>
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: abhinavk@codeaurora.org, hoegsberg@google.com,
 dri-devel@lists.freedesktop.org, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jeykumar Sankaran <jsanka@codeaurora.org>

Add display port support in DPU by creating hooks
for DP encoder enumeration and encoder mode
initialization.

This change is based on the Snapdragon Display port
driver changes[1].

changes in v2:
	- rebase on [2] (Sean Paul)
	- remove unwanted error checks and
	  switch cases (Jordan Crouse)

[1] https://lwn.net/Articles/768265/
[2] https://lkml.org/lkml/2018/11/17/87

changes in V3:
-- Moved this change as part of the DP driver changes.
-- Addressed compilation issues on the latest code base.

Signed-off-by: Jeykumar Sankaran <jsanka@codeaurora.org>
Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  8 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 65 ++++++++++++++++++++++++-----
 2 files changed, 58 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b063243..7c95f72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2025,7 +2025,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 {
 	int ret = 0;
 	int i = 0;
-	enum dpu_intf_type intf_type;
+	enum dpu_intf_type intf_type = INTF_NONE;
 	struct dpu_enc_phys_init_params phys_params;
 
 	if (!dpu_enc) {
@@ -2047,9 +2047,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	case DRM_MODE_ENCODER_DSI:
 		intf_type = INTF_DSI;
 		break;
-	default:
-		DPU_ERROR_ENC(dpu_enc, "unsupported display interface type\n");
-		return -EINVAL;
+	case DRM_MODE_ENCODER_TMDS:
+		intf_type = INTF_DP;
+		break;
 	}
 
 	WARN_ON(disp_info->num_of_h_tiles < 1);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index cb08faf..4568706 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -421,6 +421,33 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 	return rc;
 }
 
+static int _dpu_kms_initialize_displayport(struct drm_device *dev,
+					    struct msm_drm_private *priv,
+					    struct dpu_kms *dpu_kms)
+{
+	struct drm_encoder *encoder = NULL;
+	int rc = 0;
+
+	if (!priv->dp)
+		return rc;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(encoder)) {
+		DPU_ERROR("encoder init failed for dsi display\n");
+		return PTR_ERR(encoder);
+	}
+
+	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
+	if (rc) {
+		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
+		drm_encoder_cleanup(encoder);
+		return rc;
+	}
+
+	priv->encoders[priv->num_encoders++] = encoder;
+	return rc;
+}
+
 /**
  * _dpu_kms_setup_displays - create encoders, bridges and connectors
  *                           for underlying displays
@@ -433,12 +460,21 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
 {
-	/**
-	 * Extend this function to initialize other
-	 * types of displays
-	 */
+	int rc = 0;
+
+	rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
+	if (rc) {
+		DPU_ERROR("initialize_dsi failed, rc = %d\n", rc);
+		return rc;
+	}
 
-	return _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
+	rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms);
+	if (rc) {
+		DPU_ERROR("initialize_DP failed, rc = %d\n", rc);
+		return rc;
+	}
+
+	return rc;
 }
 
 static void _dpu_kms_drm_obj_destroy(struct dpu_kms *dpu_kms)
@@ -626,13 +662,20 @@ static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
 	info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
 			MSM_DISPLAY_CAP_VID_MODE;
 
-	/* TODO: No support for DSI swap */
-	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
-		if (priv->dsi[i]) {
-			info.h_tile_instance[info.num_of_h_tiles] = i;
-			info.num_of_h_tiles++;
+	switch (info.intf_type) {
+	case DRM_MODE_ENCODER_DSI:
+		/* TODO: No support for DSI swap */
+		for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+			if (priv->dsi[i]) {
+				info.h_tile_instance[info.num_of_h_tiles] = i;
+				info.num_of_h_tiles++;
+			}
 		}
-	}
+		break;
+	case DRM_MODE_ENCODER_TMDS:
+		info.num_of_h_tiles = 1;
+		break;
+	};
 
 	rc = dpu_encoder_setup(encoder->dev, encoder, &info);
 	if (rc)
-- 
$(echo -e 'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project')
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
