Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0436F2BB1
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 01:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610F410E0EB;
	Sun, 30 Apr 2023 23:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122FF10E088
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 23:57:36 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2a8b766322bso18827091fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 16:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682899054; x=1685491054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=orUSE8I+yzZS+P7HQKikdHeXoKnYRE4HN4coBYou6K4=;
 b=B7hj2Dify6WpKR+VYdOYJyWJYsm0Uk0c56oclYspryupctl2CgBYz0E8hPv5A1Aiwo
 znVn8V+Lhb5bMTSHmw497vbivvB8xuU2GjYpGLr/oK/1iKUHxKhedv1eRiCUQTXYDsS4
 pU32z26jMZtBNDrMg+pVlenezV2tEQnUR6h0OQ+/0aWDKqoc98ZW5JwXcVIv4iEckoUe
 2ZBU0THqJcPQvWv98hq0lUW6lWYmJ9YCTcJLLe4ECeIpKBn9IIPZ2l8jR+TlSs/GvS4R
 L7nQ8+0bjWUXPZ+tf26wbiJn7gju1saWYnE13M0aRA9/wRmhXM5SxYAXMt34rluJOyfr
 F8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682899054; x=1685491054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=orUSE8I+yzZS+P7HQKikdHeXoKnYRE4HN4coBYou6K4=;
 b=dKBRHR5l7ni6h10XXFvQqUUeZKWDujOW6R3ejo2OQ0tvXHZds3qVKVCSlpyvwgfRSi
 8NcjC5N9WCEVpbpngy6EnUF2njAlNH+turHtC9HCnWjHO9cXjKRC80CZbncASUUjTog5
 WCaWGmmU9le3MmgSkRq4fMdiHYGs1ZaKbdbMYwMSPtIdTkD78/wNKTLrB/HCAWI1QzNN
 rzO0rc4Wde2S9TGY03PXmA+c7x0eSMo2MJvMqwvWiO7SMX0HitQR3lKN39LEMqHeT4S6
 tCWSDRUUBVM6FwlZI3s4RMZbcCHhSh4C1zYhfP85ie6qpCySbgTdwWuBpIHYCfXZ/YWR
 fDJQ==
X-Gm-Message-State: AC+VfDyWJmRMexe6msMWc2IfOK/JyAi6RKhC672HpGhf5413tqQVDs60
 b0jt9xSIuy/0jHUvi/oBYaJh+A==
X-Google-Smtp-Source: ACHHUZ4Gh0KZBCIn10a5asK7pB9oHRo35zCMmPUPVtxe0WI7wQ9+5DOeymzBYBcbc4lsDgeO2aHTtg==
X-Received: by 2002:ac2:4353:0:b0:4ee:d4bd:3472 with SMTP id
 o19-20020ac24353000000b004eed4bd3472mr3268642lfl.35.1682899054039; 
 Sun, 30 Apr 2023 16:57:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 16:57:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/7] drm/msm/dpu: merge dpu_encoder_init() and
 dpu_encoder_setup()
Date: Mon,  1 May 2023 02:57:26 +0300
Message-Id: <20230430235732.3341119-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
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

