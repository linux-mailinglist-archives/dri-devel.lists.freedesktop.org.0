Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C873BFA30
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB91C89FCC;
	Thu,  8 Jul 2021 12:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D56E89FCC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:28:49 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id p1so14898131lfr.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DI9Ts9dnxWaDfjxioQ9DRLR5i4GIHC8m37WULWm3o7s=;
 b=kdkdVBUJhLeNVm29nmbQt7loys4OXtPPNVmWKhYsDMIa4jiGf2nnaZcGdu73I6wG+P
 nHcIaYoRVVb5jcLKb323eig6XEhQTVf6wU9Q5IDI3xuAgzV9VvXOFBny8Hbk8CRoKp/n
 4Da6WsGRyVHx2sZ37C6rZWOyBJs1I7t0dlWOHyF7J/3YZC3u2orlACTokxwE4W8wvG46
 2HSMhRNDQo+UVQegAgEQAHtVud9QmJ+BgBhB4Ku9cGGydDOU+up1D9T5FWT/cC6+UCxC
 46tVJfZFWeDTHwqW1HADhOUSEXiE2q29JnXYZad7D7fer04Y6B4TkfFUAD3T/ETjiGan
 pKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DI9Ts9dnxWaDfjxioQ9DRLR5i4GIHC8m37WULWm3o7s=;
 b=AkRD2/LvN5vdPXq9bmoOsthd94Wp8+ehyditGdLwZVCSWTqvT3bQFXx8wEcat4SOcD
 toH8+70UzFKZ30+CdmY3FPs0k8LHl5MGCi2nqztAfyoth/2uxYb6t4CCwnqJHo6SwE7o
 BAlzz5oEhD7ZB1pCg5pB573WgJ6iKDQCpM9NkTCyjeSgN1qo9qfK4hgx/HEiC8HPlrr/
 cuBb6eveto2Ch6sivoBRkuOyPas1Vkq2Jn+VxW4iW8kjIkWR0/t5NtNGBSM7hFWqijYl
 UUGhM1FHhpIFyrt+5FxLhEybhUiYr0uAOJEOOzzdg8cRXpPpT+bH4kJ3Kta7khyb9Kw6
 6JgQ==
X-Gm-Message-State: AOAM533Redw9lUx491m8D8a2+ktiNTCtayqrPclckYUKrqmHl53cWq1b
 ySsz/qXCKcTtLDBVfl5PP6SpHQ==
X-Google-Smtp-Source: ABdhPJwtCLthbTkR3mdujhpzVq0xefLxRzVvMRl30C4u5ewmA/rZGTbcP9afiDgJ3NfijzPxCvTKLQ==
X-Received: by 2002:a05:6512:1315:: with SMTP id
 x21mr23652460lfu.87.1625747327892; 
 Thu, 08 Jul 2021 05:28:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 05:28:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v1 3/7] drm/msm/dpu: support setting up two independent DSI
 connectors
Date: Thu,  8 Jul 2021 15:28:29 +0300
Message-Id: <20210708122833.363451-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 102 +++++++++++++-----------
 1 file changed, 57 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1d3a4f395e74..8459da36174e 100644
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
+	 *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
+	 */
 	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
 		if (!priv->dsi[i])
 			continue;
 
+		if (!encoder) {
+			encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
+			if (IS_ERR(encoder)) {
+				DPU_ERROR("encoder init failed for dsi display\n");
+				return PTR_ERR(encoder);
+			}
+
+			priv->encoders[priv->num_encoders++] = encoder;
+
+			memset(&info, 0, sizeof(info));
+			info.intf_type = encoder->encoder_type;
+			info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
+				MSM_DISPLAY_CAP_CMD_MODE :
+				MSM_DISPLAY_CAP_VID_MODE;
+		}
+
 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
 				i, rc);
 			break;
 		}
+
+		info.h_tile_instance[info.num_of_h_tiles++] = i;
+
+		/* Register non-bonded encoder here. If the encoder is bonded,
+		 * it will be registered later, when both DSI hosts are
+		 * initialized.
+		 */
+		if (!msm_dsi_is_bonded_dsi(priv->dsi[i])) {
+			rc = dpu_encoder_setup(dev, encoder, &info);
+			if (rc)
+				DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+					  encoder->base.id, rc);
+			encoder = NULL;
+		}
+	}
+
+	/* Register bonded encoder here, when both DSI hosts are initialized */
+	if (encoder) {
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

