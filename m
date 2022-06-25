Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5755A57C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 02:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9E810F4CC;
	Sat, 25 Jun 2022 00:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB5C10F4BA
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 00:28:13 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so7199133pjr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eo8KDBuZXXGU61Q/REIAXbWL789r8BFDqM6ILHy0GQM=;
 b=X3EZN9OGPC6PS+9+mT48UmEgC+O2kwcm3I3xcESHkSVeR0ZbfV1oGLNfSg50WpINH9
 pSix1Le24zQAMuiNbXkz1lSEcs/tFo3W9sYE4+dqJj3o+j4DlXABR3Nwjp6Q2HwuHWm8
 B7Pm5hLJ5DcHSyTq8ryNVgyyu6ldZceSv94RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eo8KDBuZXXGU61Q/REIAXbWL789r8BFDqM6ILHy0GQM=;
 b=O1RGW429hA6j37N3ld/E6pig7kvvbv8NlT19H4hP/YGA86yiU2jdumUTXTVuOchbG9
 wrHTsj2gX5smS04rhQOnWqkVbQWMxl7BmzHCk6S7QA4YykP9U8I0IOsA1rnM+2D0dqkp
 IRkgu1dfiODPziEzE4+oO5fMiokzarNnCw7VLOizVlaA9mcBFM6Y50D4jCaVgcSt1v0C
 1A3Hp27uMxF/v0wQ2UCE3Nk6x5LNVj5y2Z0C+5oBfQsIwi2TA5e775ls7bANLnpOuhsd
 OBtHR8Q0uXZgIhmVSbh24qCNiiLSERGEHMX9lXWS4lj3XTH9zLZj+dJg8h8tGnpR25VV
 ZdRA==
X-Gm-Message-State: AJIora8qehBVFkJFkwxPN8UHikeQUZR66XYtDbULnS5GP8QPKAfOXZvU
 Cz4pRDiFLMUMsAF+QULdpFN6IA==
X-Google-Smtp-Source: AGRyM1sW3fUXJAX0S08UlrfgeD5PfIjD5YtbHF7C9U9Yi5lr+A5PUn8RqH648X/V5Iu4JmB007GB5w==
X-Received: by 2002:a17:902:9a8d:b0:167:77c3:4c86 with SMTP id
 w13-20020a1709029a8d00b0016777c34c86mr1732142plp.122.1656116893344; 
 Fri, 24 Jun 2022 17:28:13 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:b71b:2e04:d67e:178e])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a170902780400b0016760c06b76sm2367421pll.194.2022.06.24.17.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 17:28:12 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/dp: Remove encoder pointer from struct msm_dp
Date: Fri, 24 Jun 2022 17:28:11 -0700
Message-Id: <20220625002811.3225344-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't need to stash the encoder here. Instead we can simply pass it
around as an argument.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 +---
 drivers/gpu/drm/msm/dp/dp_display.h | 1 -
 drivers/gpu/drm/msm/dp/dp_drm.c     | 8 ++++----
 drivers/gpu/drm/msm/dp/dp_drm.h     | 2 +-
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index da5c03a8cc4c..798fd5398b48 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1621,8 +1621,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 		return ret;
 	}
 
-	dp_display->encoder = encoder;
-
 	ret = dp_display_get_next_bridge(dp_display);
 	if (ret)
 		return ret;
@@ -1638,7 +1636,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	priv->bridges[priv->num_bridges++] = dp_display->bridge;
 
-	dp_display->connector = dp_drm_connector_init(dp_display);
+	dp_display->connector = dp_drm_connector_init(dp_display, encoder);
 	if (IS_ERR(dp_display->connector)) {
 		ret = PTR_ERR(dp_display->connector);
 		DRM_DEV_ERROR(dev->dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 4f9fe4d7610b..dcedf021f7fe 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -15,7 +15,6 @@ struct msm_dp {
 	struct device *codec_dev;
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
-	struct drm_encoder *encoder;
 	struct drm_bridge *next_bridge;
 	bool is_connected;
 	bool audio_enabled;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 62d58b9c4647..6df25f7662e7 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -116,7 +116,7 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 	}
 
 	if (dp_display->next_bridge) {
-		rc = drm_bridge_attach(dp_display->encoder,
+		rc = drm_bridge_attach(encoder,
 					dp_display->next_bridge, bridge,
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (rc < 0) {
@@ -130,15 +130,15 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 }
 
 /* connector initialization */
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
 {
 	struct drm_connector *connector = NULL;
 
-	connector = drm_bridge_connector_init(dp_display->drm_dev, dp_display->encoder);
+	connector = drm_bridge_connector_init(dp_display->drm_dev, encoder);
 	if (IS_ERR(connector))
 		return connector;
 
-	drm_connector_attach_encoder(connector, dp_display->encoder);
+	drm_connector_attach_encoder(connector, encoder);
 
 	return connector;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index f4b1ed1e24f7..82035dbb0578 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -19,7 +19,7 @@ struct msm_dp_bridge {
 
 #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
 
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display);
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder);
 

base-commit: 24df12013853ac59c52cc726e9cbe51e38d09eda
-- 
https://chromeos.dev

