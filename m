Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF17E708DEF
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 04:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEDC10E5AA;
	Fri, 19 May 2023 02:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE2A10E5A3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 02:38:59 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2af1ae3a21fso13059131fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684463937; x=1687055937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qu8TfAfbTDMHVon4KQrpF6qc6rVuGXeMRXKbecy+X30=;
 b=naROpzrPjJnLWAzB8COAp6wQKYsSlGwrcMU2uu7bW6SF30g6g9iXwfJFY2dUqTbBOg
 zHyp2ioM3nE1lMcMFu9mWFGo3tQaPcZH+Z5d3gO4grZiVSxSXsfxlCp6S/IKJsq3Q92X
 TTqrISI0NFMh38+XKzkbZCGxE4qO+M4USEYk0kP9YQZ9LgQeriwIAhzXQJ/7tOcn8Ejq
 CSFmitOF8uNB3uFKOh2MHS+RW/9GL4Y9gBEv71VCZQ0EMKGS944GKJIFCWrYMXfVwaVJ
 OsI2TABKDfhXdh/8pLXUP/Pv/x0zntRruYIrGGVypkNnRgxiVmi+hyvzAoC0WnXj+J96
 x6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684463937; x=1687055937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qu8TfAfbTDMHVon4KQrpF6qc6rVuGXeMRXKbecy+X30=;
 b=EEZ80+KiMHZJ2DVCBJwTh3bp3ZXJMY2WJVSIHHYMkv+lpEiMQr/INUwK4QwJX/4q3O
 TPs/jVwPaYP8O8AEnKGvWUZmV04pGUGMi4XJIgvmXTMB+ts+0GPXA0YeDDOd50pRTnuP
 d7AHCJUFfS6oiFE4RSNIVxoZahtJWxiSvqfZEMXaCG8ZjlDNlIxQlrHj4eUxQ2OK21pt
 S6Yg4i0jTofjvTqV04D5Um4AL2DMzfVAzPbpA8L290MgRijMhgwLopa2r7CC4KGHUPhI
 7WS344tuNJogRhTQDy1qSrpcp+cG25BDWlUVFY5gtRDpXWBpUl+QV79cCLIq8nZjYALH
 tS+w==
X-Gm-Message-State: AC+VfDze0WLAfG383yTdjKJL/AEUN45XqMmxEUpWq/waIItK23JiKEYx
 1TD/z0DD9tqsXRJoNiN1CQUxGA==
X-Google-Smtp-Source: ACHHUZ7FeCxOwObR1UoxFcyNk4eB1HSh8Wg88pSfh1LA2K0w6iLWDydNSI4nIPtr5rzSlDq4eXHg3Q==
X-Received: by 2002:a2e:2417:0:b0:2aa:3cee:c174 with SMTP id
 k23-20020a2e2417000000b002aa3ceec174mr147096ljk.13.1684463937208; 
 Thu, 18 May 2023 19:38:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 19:38:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/7] drm/msm/dpu: merge dpu_encoder_init() and
 dpu_encoder_setup()
Date: Fri, 19 May 2023 05:38:49 +0300
Message-Id: <20230519023855.3840907-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no reason to split the dpu_encoder interface into separate
_init() and _setup() phases. Merge them into a single function.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 55 +++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 14 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 87 ++++++++-------------
 3 files changed, 56 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b34416cbd0f5..32785cb1b079 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2377,7 +2377,8 @@ static const struct drm_encoder_funcs dpu_encoder_funcs = {
 		.early_unregister = dpu_encoder_early_unregister,
 };
 
-int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
+struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
+		int drm_enc_mode,
 		struct msm_display_info *disp_info)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -2386,7 +2387,23 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
 
-	dpu_enc = to_dpu_encoder_virt(enc);
+	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
+	if (!dpu_enc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
+			       drm_enc_mode, NULL);
+	if (ret) {
+		devm_kfree(dev->dev, dpu_enc);
+		return ERR_PTR(ret);
+	}
+
+	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
+
+	spin_lock_init(&dpu_enc->enc_spinlock);
+	dpu_enc->enabled = false;
+	mutex_init(&dpu_enc->enc_lock);
+	mutex_init(&dpu_enc->rc_lock);
 
 	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
 	if (ret)
@@ -2415,44 +2432,14 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 
 	DPU_DEBUG_ENC(dpu_enc, "created\n");
 
-	return ret;
+	return &dpu_enc->base;
 
 fail:
 	DPU_ERROR("failed to create encoder\n");
 	if (drm_enc)
 		dpu_encoder_destroy(drm_enc);
 
-	return ret;
-
-
-}
-
-struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
-		int drm_enc_mode)
-{
-	struct dpu_encoder_virt *dpu_enc = NULL;
-	int rc = 0;
-
-	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
-	if (!dpu_enc)
-		return ERR_PTR(-ENOMEM);
-
-
-	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
-							  drm_enc_mode, NULL);
-	if (rc) {
-		devm_kfree(dev->dev, dpu_enc);
-		return ERR_PTR(rc);
-	}
-
-	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
-
-	spin_lock_init(&dpu_enc->enc_spinlock);
-	dpu_enc->enabled = false;
-	mutex_init(&dpu_enc->enc_lock);
-	mutex_init(&dpu_enc->rc_lock);
-
-	return &dpu_enc->base;
+	return ERR_PTR(ret);
 }
 
 int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 6d14f84dd43f..90e1925d7770 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -130,20 +130,12 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
 /**
  * dpu_encoder_init - initialize virtual encoder object
  * @dev:        Pointer to drm device structure
+ * @drm_enc_mode: corresponding DRM_MODE_ENCODER_* constant
  * @disp_info:  Pointer to display information structure
  * Returns:     Pointer to newly created drm encoder
  */
-struct drm_encoder *dpu_encoder_init(
-		struct drm_device *dev,
-		int drm_enc_mode);
-
-/**
- * dpu_encoder_setup - setup dpu_encoder for the display probed
- * @dev:		Pointer to drm device structure
- * @enc:		Pointer to the drm_encoder
- * @disp_info:	Pointer to the display info
- */
-int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
+struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
+		int drm_enc_mode,
 		struct msm_display_info *disp_info);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e1fd7b0f39cd..10bd0fd4ff48 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -535,15 +535,23 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		    !msm_dsi_is_master_dsi(priv->dsi[i]))
 			continue;
 
-		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
+		memset(&info, 0, sizeof(info));
+		info.intf_type = INTF_DSI;
+
+		info.h_tile_instance[info.num_of_h_tiles++] = i;
+		if (msm_dsi_is_bonded_dsi(priv->dsi[i]))
+			info.h_tile_instance[info.num_of_h_tiles++] = other;
+
+		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
+
+		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
+
+		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
 		if (IS_ERR(encoder)) {
 			DPU_ERROR("encoder init failed for dsi display\n");
 			return PTR_ERR(encoder);
 		}
 
-		memset(&info, 0, sizeof(info));
-		info.intf_type = INTF_DSI;
-
 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
@@ -551,11 +559,6 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			break;
 		}
 
-		info.h_tile_instance[info.num_of_h_tiles++] = i;
-		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
-
-		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
-
 		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
 			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
 			if (rc) {
@@ -563,14 +566,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 					other, rc);
 				break;
 			}
-
-			info.h_tile_instance[info.num_of_h_tiles++] = other;
 		}
-
-		rc = dpu_encoder_setup(dev, encoder, &info);
-		if (rc)
-			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-				  encoder->base.id, rc);
 	}
 
 	return rc;
@@ -589,29 +585,23 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		if (!priv->dp[i])
 			continue;
 
-		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+		memset(&info, 0, sizeof(info));
+		info.num_of_h_tiles = 1;
+		info.h_tile_instance[0] = i;
+		info.intf_type = INTF_DP;
+
+		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
 		if (IS_ERR(encoder)) {
 			DPU_ERROR("encoder init failed for dsi display\n");
 			return PTR_ERR(encoder);
 		}
 
-		memset(&info, 0, sizeof(info));
 		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			drm_encoder_cleanup(encoder);
 			return rc;
 		}
-
-		info.num_of_h_tiles = 1;
-		info.h_tile_instance[0] = i;
-		info.intf_type = INTF_DP;
-		rc = dpu_encoder_setup(dev, encoder, &info);
-		if (rc) {
-			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-				  encoder->base.id, rc);
-			return rc;
-		}
 	}
 
 	return 0;
@@ -629,13 +619,17 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 	if (!priv->hdmi)
 		return 0;
 
-	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+	memset(&info, 0, sizeof(info));
+	info.num_of_h_tiles = 1;
+	info.h_tile_instance[0] = i;
+	info.intf_type = INTF_HDMI;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
 	if (IS_ERR(encoder)) {
 		DPU_ERROR("encoder init failed for HDMI display\n");
 		return PTR_ERR(encoder);
 	}
 
-	memset(&info, 0, sizeof(info));
 	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
@@ -643,16 +637,6 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 		return rc;
 	}
 
-	info.num_of_h_tiles = 1;
-	info.h_tile_instance[0] = i;
-	info.intf_type = INTF_HDMI;
-	rc = dpu_encoder_setup(dev, encoder, &info);
-	if (rc) {
-		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-			  encoder->base.id, rc);
-		return rc;
-	}
-
 	return 0;
 }
 
@@ -664,14 +648,19 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 	struct msm_display_info info;
 	int rc;
 
-	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL);
+	memset(&info, 0, sizeof(info));
+
+	info.num_of_h_tiles = 1;
+	/* use only WB idx 2 instance for DPU */
+	info.h_tile_instance[0] = WB_2;
+	info.intf_type = INTF_WB;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL, &info);
 	if (IS_ERR(encoder)) {
 		DPU_ERROR("encoder init failed for dsi display\n");
 		return PTR_ERR(encoder);
 	}
 
-	memset(&info, 0, sizeof(info));
-
 	rc = dpu_writeback_init(dev, encoder, wb_formats,
 			n_formats);
 	if (rc) {
@@ -680,18 +669,6 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 		return rc;
 	}
 
-	info.num_of_h_tiles = 1;
-	/* use only WB idx 2 instance for DPU */
-	info.h_tile_instance[0] = WB_2;
-	info.intf_type = INTF_WB;
-
-	rc = dpu_encoder_setup(dev, encoder, &info);
-	if (rc) {
-		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-				  encoder->base.id, rc);
-		return rc;
-	}
-
 	return 0;
 }
 
-- 
2.39.2

