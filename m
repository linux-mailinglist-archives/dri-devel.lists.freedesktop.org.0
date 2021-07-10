Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839493C3717
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 00:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB66B6EB6D;
	Sat, 10 Jul 2021 22:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC046EB69
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 22:20:12 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q4so15191553ljp.13
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 15:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQMq/PXjFh01Zg45lwJ/ndr+JEXl8DM289maUYXwicQ=;
 b=A8OECL/cTlw/viR0keHYRZWbDYYQFcvRc0wZTR6xn9Jmh04fR43sVtbvx4f7RSal/A
 FGmGtT55m2TjK/zSr8HNJj1XejuPqD5h0/94nYMgqMV4qzGLn5hCZ5YtTX85m2o5DroR
 sYC1IN0UalTJD2Kv/YOpse4hZWD6lsb7+eekMSsZ7xO139z20HZWFOBviypM4MLpYlgA
 MMMTBfL4EgPrQQeCdOP0mhsNSpzAl8MWjxD2CCyxkgTlLOYuJUGdHDNk56Hp1l/cUpbB
 95NoGEU84Bqhe1Ix5V6ihFnHKAuasakuFtySJuH7fPhbxwKWyZN/N6v8l64d26ATooA/
 tMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQMq/PXjFh01Zg45lwJ/ndr+JEXl8DM289maUYXwicQ=;
 b=NYJnt6OxqtDFQPD5sGvj38dRI7TqnWy1KS4cegfsYkVn4aSea2XDCttzXfk/zt6ZDQ
 2JL+z2CsZyUO6TVp6Egs6XW7kDa9bq2FAeQ8FoFcWkayy6jOfPv+G04TCrOkxvQpaZzC
 46kaY9ZVgtAZctWj0K7e0gou8aOSaUKOmaLUxPmis5zUaEiWDqkkZWMmvQkN1janTKnH
 usDAA4zV3lD0vDyoM2vmKAwUiZrxQzZ/6cay6q7Jq7Pi+HYyQSuthCo2C6CorzyUU3EL
 dVf+ZtOca/s5P0XPOqhNYzbWHah/lArUro7MCiBIcjIOSc+795coBGWs2OBagXf7qX+D
 h8QA==
X-Gm-Message-State: AOAM531Ho9J0wkFmOJqaSxLV3wkbiTU8LcL8A1CVN4TprOqrZuJxOXfX
 pAiZYLNWkVcO2km1s177q3MYjA==
X-Google-Smtp-Source: ABdhPJy6Z914t0NDD9qcAJwM6i75xqBL102P2jU1hd9UZ/+vkdlcmkQTFRWkUnpIsE3qOeIT3Cs/rw==
X-Received: by 2002:a2e:9c52:: with SMTP id t18mr35312195ljj.348.1625955610927; 
 Sat, 10 Jul 2021 15:20:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 15:20:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v3 3/7] drm/msm/dpu: support setting up two independent DSI
 connectors
Date: Sun, 11 Jul 2021 01:20:01 +0300
Message-Id: <20210710222005.1334734-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
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

