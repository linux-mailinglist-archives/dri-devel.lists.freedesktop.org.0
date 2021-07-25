Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F683D4BAE
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 06:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B055F737FC;
	Sun, 25 Jul 2021 04:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448FB737F8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 04:26:27 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id q6so6872065oiw.7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 21:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LmXuEYSYhB+2/Ibl9NiegecKtnpW+IZkNn1yz7Dmy3A=;
 b=WFc6LLpY1ukT6Pa7wvCPiVNKrsYkSCByoIim/wNuwB3QlvEkvIJ7wOTt1Ttrt+A8Ij
 1dxI1uTGgiqXFwedHnwxl+tF+S0I/s5iC+ikJa4bPJPH0JzbjlU4hvKX/e5UBsPHeZ2V
 9WlBmVGKcXQDeRMxH58VkuyQ4FIjRY/y3oxv9em1syMxq7H0Azr+MHmEWj4iwklxWJhk
 NrYcQzbr5qlzHqmzvw9qn4QqP/g/vlxzwPytLD6K3ql6g7HL2KbwgEGNcUQbAH4XXM9d
 O2fYSymglFoRmatM/IByBRoJ6KggUhAXmTdyQElYGpIuPUF+7FeyksaDD0isy7wp7n/b
 2hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LmXuEYSYhB+2/Ibl9NiegecKtnpW+IZkNn1yz7Dmy3A=;
 b=YP8Lyz+UujLbN/P/2RHxSsAX5Am6JW+sCKbf1DRpkb+m3lMBhFBOP06RGdtvJFBInu
 TCzGfpt4By344g0qV+3/7cZw78wZAOChshaTtEUghv+gUc0CPVxbGN8lUv/9v8nwVXvD
 aJV6TUQQfMiVQx4yLHV/h1fwTs58HHZpBMNAvIUOlYbpjWGq0M1AsSIk6A3bBBVbnfGL
 my/88n7ttLNBRsvEtbjrN2q3LBflrvBSksVMfnnMIjhBE/gz5aQ5uqDGbtNm9Zsy/tkr
 WxhtbuKQiV9vDTl8hLlUAXl84BOHz3oOWUbVGmfPlyR74aN6o6j09b020MmtUlq2zSUL
 V08Q==
X-Gm-Message-State: AOAM5328AfOl6PKlqFDYALa3dvBhUQJEffX08upL7uShJehYFmO1DHWN
 T9VJxT5WaHeJjbLu/ts3TlBJvw==
X-Google-Smtp-Source: ABdhPJwHP7CViU9ZbsfEzVt3ZOe/bA1EiXOM06Uh4N4ZwOYpM/QXB82FGl+mGaNYBP+efVkXdiPihw==
X-Received: by 2002:aca:c0c3:: with SMTP id q186mr2020961oif.39.1627187186596; 
 Sat, 24 Jul 2021 21:26:26 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:26:26 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [PATCH 3/5] drm/msm/dp: Support up to 3 DP controllers
Date: Sat, 24 Jul 2021 21:24:33 -0700
Message-Id: <20210725042436.3967173-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on the removal of the g_dp_display and the movement of the
priv->dp lookup into the DP code it's now possible to have multiple
DP instances.

In line with the other controllers in the MSM driver, introduce a
per-compatible list of base addresses which is used to resolve the
"instance id" for the given DP controller. This instance id is used as
index in the priv->dp[] array.

Then extend the initialization code to initialize struct drm_encoder for
each of the registered priv->dp[] and update the logic for finding a
struct msm_dp from a struct drm_encoder.

Lastly, bump the number of struct msm_dp instances carries by priv->dp
to 3, the currently known maximum number of controllers found in a
Qualcomm SoC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 60 +++++++++++--------
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  8 ++-
 drivers/gpu/drm/msm/dp/dp_display.c           | 59 ++++++++++++++++--
 drivers/gpu/drm/msm/msm_drv.h                 |  2 +-
 4 files changed, 95 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f655adbc2421..a793cc8a007e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -188,6 +188,7 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	struct dentry *entry;
 	struct drm_device *dev;
 	struct msm_drm_private *priv;
+	int i;
 
 	if (!p)
 		return -EINVAL;
@@ -203,8 +204,8 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	dpu_debugfs_vbif_init(dpu_kms, entry);
 	dpu_debugfs_core_irq_init(dpu_kms, entry);
 
-	if (priv->dp)
-		msm_dp_debugfs_init(priv->dp, minor);
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
+		msm_dp_debugfs_init(priv->dp[i], minor);
 
 	return dpu_core_perf_debugfs_init(dpu_kms, entry);
 }
@@ -545,33 +546,40 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
 	int rc = 0;
+	int i;
 
-	if (!priv->dp)
-		return rc;
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
+		if (!priv->dp[i])
+			continue;
 
-	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
-	if (IS_ERR(encoder)) {
-		DPU_ERROR("encoder init failed for dsi display\n");
-		return PTR_ERR(encoder);
-	}
+		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+		if (IS_ERR(encoder)) {
+			DPU_ERROR("encoder init failed for dsi display\n");
+			return PTR_ERR(encoder);
+		}
 
-	memset(&info, 0, sizeof(info));
-	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
-	if (rc) {
-		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
-		drm_encoder_cleanup(encoder);
-		return rc;
-	}
+		memset(&info, 0, sizeof(info));
+		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
+		if (rc) {
+			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
+			drm_encoder_cleanup(encoder);
+			return rc;
+		}
 
-	priv->encoders[priv->num_encoders++] = encoder;
+		priv->encoders[priv->num_encoders++] = encoder;
+
+		info.num_of_h_tiles = 1;
+		info.h_tile_instance[0] = i;
+		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
+		info.intf_type = encoder->encoder_type;
+		rc = dpu_encoder_setup(dev, encoder, &info);
+		if (rc) {
+			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+				  encoder->base.id, rc);
+			return rc;
+		}
+	}
 
-	info.num_of_h_tiles = 1;
-	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
-	info.intf_type = encoder->encoder_type;
-	rc = dpu_encoder_setup(dev, encoder, &info);
-	if (rc)
-		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-			  encoder->base.id, rc);
 	return rc;
 }
 
@@ -792,6 +800,7 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	int i;
 
 	if (!dpu_kms || !dpu_kms->dev)
 		return -EINVAL;
@@ -800,7 +809,8 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
 	if (!priv)
 		return -EINVAL;
 
-	msm_dp_irq_postinstall(priv->dp);
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
+		msm_dp_irq_postinstall(priv->dp[i]);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index cabe15190ec1..2e1acb1bc390 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -126,8 +126,12 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 	priv = drm_dev->dev_private;
 	kms = priv->kms;
 
-	if (priv->dp)
-		msm_dp_snapshot(disp_state, priv->dp);
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
+		if (!priv->dp[i])
+			continue;
+
+		msm_dp_snapshot(disp_state, priv->dp[i]);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
 		if (!priv->dsi[i])
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 59ffd6c8f41f..92b7646a1bb7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -79,6 +79,8 @@ struct dp_display_private {
 	char *name;
 	int irq;
 
+	int id;
+
 	/* state variables */
 	bool core_initialized;
 	bool hpd_irq_on;
@@ -116,8 +118,19 @@ struct dp_display_private {
 	struct dp_audio *audio;
 };
 
+
+struct msm_dp_config {
+	phys_addr_t io_start[3];
+	size_t num_dp;
+};
+
+static const struct msm_dp_config sc7180_dp_cfg = {
+	.io_start = { 0x0ae90000 },
+	.num_dp = 1,
+};
+
 static const struct of_device_id dp_dt_match[] = {
-	{.compatible = "qcom,sc7180-dp"},
+	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
 	{}
 };
 
@@ -217,7 +230,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
 
 	dp->dp_display.drm_dev = drm;
 	priv = drm->dev_private;
-	priv->dp = &(dp->dp_display);
+	priv->dp[dp->id] = &(dp->dp_display);
 
 	rc = dp->parser->parse(dp->parser);
 	if (rc) {
@@ -238,8 +251,11 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	}
 
 	rc = dp_register_audio_driver(dev, dp->audio);
-	if (rc)
+	if (rc) {
 		DRM_ERROR("Audio registration Dp failed\n");
+		goto end;
+	}
+
 
 end:
 	return rc;
@@ -259,7 +275,7 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
-	priv->dp = NULL;
+	priv->dp[dp->id] = NULL;
 }
 
 static const struct component_ops dp_display_comp_ops = {
@@ -1205,6 +1221,26 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 	return 0;
 }
 
+static int dp_display_get_id(struct platform_device *pdev)
+{
+	const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
+	struct resource *res;
+	int i;
+
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	for (i = 0; i < cfg->num_dp; i++) {
+		if (cfg->io_start[i] == res->start)
+			return i;
+	}
+
+	dev_err(&pdev->dev, "unknown displayport instance\n");
+	return -EINVAL;
+}
+
 static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1219,6 +1255,10 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
+	dp->id = dp_display_get_id(pdev);
+	if (dp->id < 0)
+		return -EINVAL;
+
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 
@@ -1386,6 +1426,9 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	struct device *dev;
 	int rc;
 
+	if (!dp_display)
+		return;
+
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 	dev = &dp->pdev->dev;
 
@@ -1435,8 +1478,12 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 static struct msm_dp *msm_dp_from_drm_encoder(struct msm_drm_private *priv,
 					      struct drm_encoder *encoder)
 {
-	if (priv->dp && priv->dp->encoder == encoder)
-		return priv->dp;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
+		if (priv->dp[i] && priv->dp[i]->encoder == encoder)
+			return priv->dp[i];
+	}
 
 	return NULL;
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e9232032b266..62d54ef6c2c4 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -161,7 +161,7 @@ struct msm_drm_private {
 	/* DSI is shared by mdp4 and mdp5 */
 	struct msm_dsi *dsi[2];
 
-	struct msm_dp *dp;
+	struct msm_dp *dp[3];
 
 	/* when we have more than one 'msm_gpu' these need to be an array: */
 	struct msm_gpu *gpu;
-- 
2.29.2

