Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DABC41F432
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34A96EEC0;
	Fri,  1 Oct 2021 17:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D366EEB3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:59:15 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id e24so12387397oig.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3QrQtMQo75wB67lbK50DoBtO/nNO7fO+JFiUoQTDZoI=;
 b=FlDcjY1usTvRYbavhtkjkcDtmRQzJbhqffgSi7z+8wu0x/bbN4NTfwoNiz/97YkawL
 a3UzO9qC7tPESUPybviFuq/lIGbksw4kJiE4tJtFVGwbMhufukuw19QBneloJr/ZIgCq
 X9U3x+0j28n86wpRr5NQJ1DUQz4zUomAZvgTnEVC7Yu/kZpKj1WcIdNa9ljr8WKn4N6u
 jj8VEn0aPD40qPMjqXJTlaRg93aBZ+WlRM5bfss4AGXczyWVXHN0rLS+0DgLsIl04uNl
 VcqibrDitnmNEw6Xr4BwQsKI9MHNIsjlteIUgqYwQPfQW+UQuz/G+OzdOUsCXmXJDNMH
 PJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3QrQtMQo75wB67lbK50DoBtO/nNO7fO+JFiUoQTDZoI=;
 b=4g/sSVmh8Da3eYTGTPBKEFW2JHRf0ZdpmCOBvDzuueJyvMA5t/LpgABWwE+ZqjQKDy
 5SPDSi3Lsj4OKkWyNT7cwkxKw6bngu5BpPZMJ0FmYeQ4Y+WCvn7i8a6pqhu2JESpJOI/
 wCD6zmkh/UC8GnvXNuYcm/jZLXxYEftm+EXxLOCCA/sB3z+pAEDYzEgBMDLC5KS2yUN2
 z1tMMqs5FQNygYn7ZKbsTyG7kEUr24xsB5uHcu/Ot8xpcl+DvsipBsEHfwZJdgwVfpMu
 OeJKOCM89nshvmAhCHIMUwO54s7eb0fCxwiPyewF1uVv/0VPsaq9NofZEHJvnGtANCuc
 euIQ==
X-Gm-Message-State: AOAM5309rXwQs+mYQu748y4I5DrOzCXeRSfDQJJhA5A4XoQiEUBOkViu
 AZvdrMgY/nl2PPDIUuavNCqNWA==
X-Google-Smtp-Source: ABdhPJys/7XqazYcco+Nzt9SqK6hMUAnnIZUTRhXhEolJorNdEakz6iwl5B+VAMuw5l9EJ6JWQkqRw==
X-Received: by 2002:aca:c641:: with SMTP id w62mr4676227oif.102.1633111154633; 
 Fri, 01 Oct 2021 10:59:14 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 w2sm1284798oof.23.2021.10.01.10.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:59:14 -0700 (PDT)
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
Subject: [PATCH v3 3/5] drm/msm/dp: Support up to 3 DP controllers
Date: Fri,  1 Oct 2021 11:00:56 -0700
Message-Id: <20211001180058.1021913-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
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

Lastly, bump the number of struct msm_dp instances carries by priv->dp
to 3, the currently known maximum number of controllers found in a
Qualcomm SoC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Added MSM_DRM_DP_COUNT to link the two 3s
- Moved NULL check for msm_dp_debugfs_init() to the call site
- Made struct dp_display_private->id unsigned

I also implemented added connector_type to each of the DP instances and
propagated this to dp_drm_connector_init() but later dropped this again per
Doug's suggestion that we'll base this on the presence/absence of a associated
drm bridge or panel.

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 66 +++++++++++--------
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  8 ++-
 drivers/gpu/drm/msm/dp/dp_display.c           | 44 ++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h                 |  4 +-
 5 files changed, 90 insertions(+), 34 deletions(-)

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
index 5d3ee5ef07c2..ff3477474c5d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -78,6 +78,8 @@ struct dp_display_private {
 	char *name;
 	int irq;
 
+	unsigned int id;
+
 	/* state variables */
 	bool core_initialized;
 	bool hpd_irq_on;
@@ -115,8 +117,18 @@ struct dp_display_private {
 	struct dp_audio *audio;
 };
 
+struct msm_dp_config {
+	phys_addr_t io_start[MSM_DRM_DP_COUNT];
+	size_t num_descs;
+};
+
+static const struct msm_dp_config sc7180_dp_cfg = {
+	.io_start = { 0x0ae90000 },
+	.num_descs = 1,
+};
+
 static const struct of_device_id dp_dt_match[] = {
-	{.compatible = "qcom,sc7180-dp"},
+	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
 	{}
 };
 
@@ -211,7 +223,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
 
 	dp->dp_display.drm_dev = drm;
 	priv = drm->dev_private;
-	priv->dp = &(dp->dp_display);
+	priv->dp[dp->id] = &(dp->dp_display);
 
 	rc = dp->parser->parse(dp->parser);
 	if (rc) {
@@ -249,7 +261,7 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
-	priv->dp = NULL;
+	priv->dp[dp->id] = NULL;
 }
 
 static const struct component_ops dp_display_comp_ops = {
@@ -1180,10 +1192,31 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 	return 0;
 }
 
+static int dp_display_find_id(struct platform_device *pdev)
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
+	for (i = 0; i < cfg->num_descs; i++) {
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
 	struct dp_display_private *dp;
+	int id;
 
 	if (!pdev || !pdev->dev.of_node) {
 		DRM_ERROR("pdev not found\n");
@@ -1194,8 +1227,13 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
+	id = dp_display_find_id(pdev);
+	if (id < 0)
+		return id;
+
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
+	dp->id = id;
 
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 8b005d1ac899..b20a6dd221f7 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -135,6 +135,8 @@ struct msm_drm_thread {
 	struct kthread_worker *worker;
 };
 
+#define MSM_DRM_DP_COUNT	3
+
 struct msm_drm_private {
 
 	struct drm_device *dev;
@@ -161,7 +163,7 @@ struct msm_drm_private {
 	/* DSI is shared by mdp4 and mdp5 */
 	struct msm_dsi *dsi[2];
 
-	struct msm_dp *dp;
+	struct msm_dp *dp[MSM_DRM_DP_COUNT];
 
 	/* when we have more than one 'msm_gpu' these need to be an array: */
 	struct msm_gpu *gpu;
-- 
2.29.2

