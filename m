Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887483CC36D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 14:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48D96EA7B;
	Sat, 17 Jul 2021 12:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD356EA6D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 12:40:25 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id bn5so17584578ljb.10
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 05:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pY5tuMhqcs2nX4bIZTKuCC5v/MwQ9tPhYnoCq8ESggM=;
 b=RScO7UiSlmgt/wMghC9y9mRllC39zhSLpDPvwt34rVjRLBoDOEFQPlvvqmQpIQ/xdd
 s9ozE7UEGiTpZs61mfE/Slcs8qSb/ZQ8SKyOk/GYUYp5B481Y9hqxU9akZdCshcn7nb5
 89bwZMnbkVQJaLK/cInH1dsvL1GloR7m7j+XS/iNFgPzbGJtosqPbNqGUAMIjpqPpCk2
 46bWoPzyisvE5DdxavRLb4UcYnB86X37C8HGMpQiMrbez8TKTG/bWrqWXd+JalBgqKmu
 BFKpKYdl5FmaD7neWyrxi/zmFAXqdKGIhAZa1s7AcONS2LZDV4rq4aR3eLnVTV9ieGR4
 ctXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pY5tuMhqcs2nX4bIZTKuCC5v/MwQ9tPhYnoCq8ESggM=;
 b=hrdnOJeq/0wOH1mKu7GY+EW6g3SxacAOQ/BphPOwsOWm7TJ4jXMI7iP3mGf8HyMI/o
 7Bgh+fwly8IiPi3AbxH/iOnrd32pSEHgKOV/qzo+ocHJhZkxmHYvkGefZg3c0mxWMTtu
 iL9+j2G1s3sh19jqp7pZKG+S3dol7uQUaKgs93BFc4D5tcaCjJFwfn4aRwTxWJk3Jmx2
 P3yxBF5fMngCp8Lvaq79sSdn0wdIkD+qWKy/AcijUDNrPs8x5MR/H1q2j+zCHMsyvkQg
 LQnorgfshlheAacv/LiSs8aS9p60fnGdQI2Y59Gvbp4wcDXWQGCOZR09Ar5yX5zZhFZz
 Y1FQ==
X-Gm-Message-State: AOAM533Jut/9Jj+jaiRz8qgy6NlNuudyAdn2lbsUdX/Emf4jdRlPnaO6
 w3qtgBvy/HPT/oD7ntVhppEaqw==
X-Google-Smtp-Source: ABdhPJwjtEhU6eWR0JqVOF8uh4dVGY/qY126wt4S2Et0lwA5e5ciomjZPCgvTPINiH9WsflFRkwh+Q==
X-Received: by 2002:a2e:7a18:: with SMTP id v24mr619548ljc.420.1626525623657; 
 Sat, 17 Jul 2021 05:40:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f25sm794264ljo.126.2021.07.17.05.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 05:40:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v4 3/7] drm/msm/dpu: support setting up two independent DSI
 connectors
Date: Sat, 17 Jul 2021 15:40:12 +0300
Message-Id: <20210717124016.316020-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move setting up encoders from set_encoder_mode to
_dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
allows us to support not only "single DSI" and "bonded DSI" but also "two
independent DSI" configurations. In future this would also help adding
support for multiple DP connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 102 +++++++++++++-----------
 1 file changed, 57 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1d3a4f395e74..3cd2011e18d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -471,30 +471,68 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct dpu_kms *dpu_kms)
 {
 	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
 	int i, rc = 0;
 
 	if (!(priv->dsi[0] || priv->dsi[1]))
 		return rc;
 
-	/*TODO: Support two independent DSI connectors */
-	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
-	if (IS_ERR(encoder)) {
-		DPU_ERROR("encoder init failed for dsi display\n");
-		return PTR_ERR(encoder);
-	}
-
-	priv->encoders[priv->num_encoders++] = encoder;
-
+	/*
+	 * We support following confiurations:
+	 * - Single DSI host (dsi0 or dsi1)
+	 * - Two independent DSI hosts
+	 * - Bonded DSI0 and DSI1 hosts
+	 *
+	 * TODO: Support swapping DSI0 and DSI1 in the bonded setup.
+	 */
 	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+		int other = (i + 1) % 2;
+
 		if (!priv->dsi[i])
 			continue;
 
+		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) &&
+		    !msm_dsi_is_master_dsi(priv->dsi[i]))
+			continue;
+
+		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
+		if (IS_ERR(encoder)) {
+			DPU_ERROR("encoder init failed for dsi display\n");
+			return PTR_ERR(encoder);
+		}
+
+		priv->encoders[priv->num_encoders++] = encoder;
+
+		memset(&info, 0, sizeof(info));
+		info.intf_type = encoder->encoder_type;
+
 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
 				i, rc);
 			break;
 		}
+
+		info.h_tile_instance[info.num_of_h_tiles++] = i;
+		info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
+			MSM_DISPLAY_CAP_CMD_MODE :
+			MSM_DISPLAY_CAP_VID_MODE;
+
+		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
+			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
+			if (rc) {
+				DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
+					other, rc);
+				break;
+			}
+
+			info.h_tile_instance[info.num_of_h_tiles++] = other;
+		}
+
+		rc = dpu_encoder_setup(dev, encoder, &info);
+		if (rc)
+			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+				  encoder->base.id, rc);
 	}
 
 	return rc;
@@ -505,6 +543,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 					    struct dpu_kms *dpu_kms)
 {
 	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
 	int rc = 0;
 
 	if (!priv->dp)
@@ -516,6 +555,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		return PTR_ERR(encoder);
 	}
 
+	memset(&info, 0, sizeof(info));
 	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
@@ -524,6 +564,14 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	}
 
 	priv->encoders[priv->num_encoders++] = encoder;
+
+	info.num_of_h_tiles = 1;
+	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
+	info.intf_type = encoder->encoder_type;
+	rc = dpu_encoder_setup(dev, encoder, &info);
+	if (rc)
+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+			  encoder->base.id, rc);
 	return rc;
 }
 
@@ -726,41 +774,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 	msm_kms_destroy(&dpu_kms->base);
 }
 
-static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
-				 struct drm_encoder *encoder,
-				 bool cmd_mode)
-{
-	struct msm_display_info info;
-	struct msm_drm_private *priv = encoder->dev->dev_private;
-	int i, rc = 0;
-
-	memset(&info, 0, sizeof(info));
-
-	info.intf_type = encoder->encoder_type;
-	info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
-			MSM_DISPLAY_CAP_VID_MODE;
-
-	switch (info.intf_type) {
-	case DRM_MODE_ENCODER_DSI:
-		/* TODO: No support for DSI swap */
-		for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
-			if (priv->dsi[i]) {
-				info.h_tile_instance[info.num_of_h_tiles] = i;
-				info.num_of_h_tiles++;
-			}
-		}
-		break;
-	case DRM_MODE_ENCODER_TMDS:
-		info.num_of_h_tiles = 1;
-		break;
-	}
-
-	rc = dpu_encoder_setup(encoder->dev, encoder, &info);
-	if (rc)
-		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-			encoder->base.id, rc);
-}
-
 static irqreturn_t dpu_irq(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -863,7 +876,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.get_format      = dpu_get_msm_format,
 	.round_pixclk    = dpu_kms_round_pixclk,
 	.destroy         = dpu_kms_destroy,
-	.set_encoder_mode = _dpu_kms_set_encoder_mode,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init    = dpu_kms_debugfs_init,
-- 
2.30.2

