Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7155D43054D
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 00:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598966E8F7;
	Sat, 16 Oct 2021 22:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B966E8F0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 22:17:00 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id v77so14389843oie.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 15:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oaf7oKCKNt5zDVv32IQLkUx20SUfAMQskiBhw89xugs=;
 b=opqM9NK8EKbAMPW1hJ7g6jbkqyGoc5A7J0aM47gJC4d1X0T0LbSEXlZFOKJaV59MBz
 bDE9MJb2dSEZVJloT13ZYPe021OFIHRUINyP//VQmB4YbsqRsPWmCa+zLTM871Gvhb/Y
 TfYs9ok9AW2ndvrLgyz8mzm8fkLiKdIkXH/4SFlyZATd7Zs0ZhIsWW/IWptdvu9IKb/f
 8tubnjUtQe/gllbHcCJE4b9Y6/38h1Y5I3JiGas1YofcUzs1w/eDdeRXglLgk2j4iNI+
 fRh+mFF6450YkV3+Ea3grBt2YVfzDX9GTXeOERlah5bKPlCJjI8jbnX7V/fgaKZIbdCq
 hjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oaf7oKCKNt5zDVv32IQLkUx20SUfAMQskiBhw89xugs=;
 b=H0Z/vRvxKmR1RdbeBIz5g6GgcZVbgG1ZQpg8BHS5AsEKVLZWdrB2BvmmOocK9BWt/X
 p6IpSvPN61ofeWds1Y9ATiyv1nqqQRPhsaC8CtTzi4DoUWVxlhEw8ZGOVC2Vy3/wfs9z
 InMMWs5Un+fUiPSLTgBZmzgsycC5ZO9NWH5PItjMCHdmszUUIG+ykxuQEjDgp2Cnratm
 JYVUIS7D2m0WeYT3r/hDr1nhWt3T2cWAoRCazGVBfN/rIJ0lxuqwEKRtdXVNb3/V9D/4
 dWzf7PCeuaXS6JChcF5uU6GEl6vgbmIWzO00sweADK7SHfGzit1uiYXJrQPNwVCSOFLV
 ETKg==
X-Gm-Message-State: AOAM533H2GRxj6wIssWVVS3/47+J1DrpixE2HalNakmC6zR7mo540Jpm
 eNHTL+73vxjC0rOPpaMPuUiaJg==
X-Google-Smtp-Source: ABdhPJx9PkfMnEv68hP4+nSmjhra3EpfY4DsfVPC7WOn1Tgs8F++BjrSlkHWmejImnQB0tuNTKmU9A==
X-Received: by 2002:a05:6808:1248:: with SMTP id
 o8mr22991355oiv.151.1634422619825; 
 Sat, 16 Oct 2021 15:16:59 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 d15sm1747058oic.32.2021.10.16.15.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 15:16:59 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] drm/msm/dp: Support up to 3 DP controllers
Date: Sat, 16 Oct 2021 15:18:41 -0700
Message-Id: <20211016221843.2167329-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
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
each of the registered priv->dp[] and update the logic for associating
each struct msm_dp with the struct dpu_encoder_virt.

A new enum is introduced to document the connection between the
instances referenced in the dpu_intf_cfg array and the controllers in
the DP driver and sc7180 is updated.

Lastly, bump the number of struct msm_dp instances carries by priv->dp
to 3, the currently known maximum number of controllers found in a
Qualcomm SoC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- MSM_DP_CONTROLLER_n introduced to clarify the relationship between the intf
  specification and the indices of the msm_dp_desc
- Unnecessary parenthesis around dp->dp_display was dropped

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 66 +++++++++++--------
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  8 ++-
 drivers/gpu/drm/msm/dp/dp_display.c           | 20 ++++--
 drivers/gpu/drm/msm/msm_drv.h                 |  9 ++-
 6 files changed, 68 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b7f33da2799c..9cd9539a1504 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2173,7 +2173,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 				dpu_encoder_vsync_event_handler,
 				0);
 	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
-		dpu_enc->dp = priv->dp;
+		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 60eed3128b54..47d5d71eb5d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -900,7 +900,7 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f655adbc2421..875b07e7183d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -188,6 +188,7 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	struct dentry *entry;
 	struct drm_device *dev;
 	struct msm_drm_private *priv;
+	int i;
 
 	if (!p)
 		return -EINVAL;
@@ -203,8 +204,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	dpu_debugfs_vbif_init(dpu_kms, entry);
 	dpu_debugfs_core_irq_init(dpu_kms, entry);
 
-	if (priv->dp)
-		msm_dp_debugfs_init(priv->dp, minor);
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
+		if (priv->dp[i])
+			msm_dp_debugfs_init(priv->dp[i], minor);
+	}
 
 	return dpu_core_perf_debugfs_init(dpu_kms, entry);
 }
@@ -544,35 +547,42 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
-	int rc = 0;
+	int rc;
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
 
-	info.num_of_h_tiles = 1;
-	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
-	info.intf_type = encoder->encoder_type;
-	rc = dpu_encoder_setup(dev, encoder, &info);
-	if (rc)
-		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-			  encoder->base.id, rc);
-	return rc;
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
+
+	return 0;
 }
 
 /**
@@ -792,6 +802,7 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	int i;
 
 	if (!dpu_kms || !dpu_kms->dev)
 		return -EINVAL;
@@ -800,7 +811,8 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
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
index c663cd619925..d3c9d7273354 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -79,6 +79,8 @@ struct dp_display_private {
 	char *name;
 	int irq;
 
+	unsigned int id;
+
 	/* state variables */
 	bool core_initialized;
 	bool hpd_irq_on;
@@ -128,7 +130,7 @@ struct msm_dp_config {
 
 static const struct msm_dp_config sc7180_dp_cfg = {
 	.descs = (const struct msm_dp_desc[]) {
-		{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
 	},
 	.num_descs = 1,
 };
@@ -229,7 +231,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
 
 	dp->dp_display.drm_dev = drm;
 	priv = drm->dev_private;
-	priv->dp = &(dp->dp_display);
+	priv->dp[dp->id] = &dp->dp_display;
 
 	rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
 	if (rc) {
@@ -269,7 +271,7 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
-	priv->dp = NULL;
+	priv->dp[dp->id] = NULL;
 }
 
 static const struct component_ops dp_display_comp_ops = {
@@ -1200,7 +1202,8 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 	return 0;
 }
 
-static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev)
+static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev,
+						     unsigned int *id)
 {
 	const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
 	struct resource *res;
@@ -1210,9 +1213,12 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	if (!res)
 		return NULL;
 
-	for (i = 0; i < cfg->num_descs; i++)
-		if (cfg->descs[i].io_start == res->start)
+	for (i = 0; i < cfg->num_descs; i++) {
+		if (cfg->descs[i].io_start == res->start) {
+			*id = i;
 			return &cfg->descs[i];
+		}
+	}
 
 	dev_err(&pdev->dev, "unknown displayport instance\n");
 	return NULL;
@@ -1233,7 +1239,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
-	desc = dp_display_get_desc(pdev);
+	desc = dp_display_get_desc(pdev, &dp->id);
 	if (!desc)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 8b005d1ac899..bfd5022a9e6d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -68,6 +68,13 @@ enum msm_mdp_plane_property {
 	PLANE_PROP_MAX_NUM
 };
 
+enum msm_dp_controller {
+	MSM_DP_CONTROLLER_0,
+	MSM_DP_CONTROLLER_1,
+	MSM_DP_CONTROLLER_2,
+	MSM_DP_CONTROLLER_COUNT,
+};
+
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
@@ -161,7 +168,7 @@ struct msm_drm_private {
 	/* DSI is shared by mdp4 and mdp5 */
 	struct msm_dsi *dsi[2];
 
-	struct msm_dp *dp;
+	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
 
 	/* when we have more than one 'msm_gpu' these need to be an array: */
 	struct msm_gpu *gpu;
-- 
2.29.2

