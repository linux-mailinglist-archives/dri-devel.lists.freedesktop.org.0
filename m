Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFF49A4932
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C8C10E9C5;
	Fri, 18 Oct 2024 21:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QEcosjA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D31610E9C3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:49:30 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e59dadebso3645600e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729288169; x=1729892969; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7DkvTcvtzrj+vI5w26rcakY7Zkomm18gg55vGgQd3cg=;
 b=QEcosjA6qDi6ZvrmZEV35cZoSuzELtl5xlVzWGsxFPpfU1TA/PScIr10TddkHKnnDs
 FQjznh4/cBfZSeUW6iWxIXHBin3e922H4mhTzrA4UOUK3Ug5hOARr6s6dmRUtNa8eBDv
 auQRiMS4Sz3MWXvEbLX3Ca2vfWySGTETF5QZ3lsEM4kMW03E/8+z0qq2KQ9iFIHi2Zor
 81otjeVyY2ch+WoT9JzGt1YCvuyaLmlq7hYg7nAODYFD8Gf/glSVsm+rxTNxeVawkoKe
 r7lslo1zplhlXFpG3DuDk9I3vCg2GM/rGl0bepddDDWJe9o08ekie0/PovfyFW04EAO7
 pogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729288169; x=1729892969;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DkvTcvtzrj+vI5w26rcakY7Zkomm18gg55vGgQd3cg=;
 b=wx3EQhxf1dhfz33HJ6NuqboY/eYmItEljjizAPvpbkijktPQuVAjC0ktGl8xBkx+sW
 kP+OWb2sALSwj+g1Is4/XLtfTluSv9YMbnRInFIPFVCREuH/2Lzali2YbiivE0kani0m
 Cl+i4cIKBGtASnMTcwW2Do1vwioLBTkO0uJEWfzfvk8cFGhTKOfS6D6mv1hqce1Hjhff
 DDnSPNq1FXtbAcrBLsxN1ObjT3v8vEcs+ls3r4TBNqdm0py0p6uKXPo5HpmqeQveQp0F
 0tFCfUSOmOoiAt0M9Yn8zv74FxoD6GNowNeYT79EN/KNmlGZO9Lh/07U7h++9ko1bbiJ
 dCtQ==
X-Gm-Message-State: AOJu0YwF0dwyhKBkWjoSs1YCf540oJXCBo1xW6Pkn8gznLDFnXknVJXJ
 VoGdPogYBQGNJ6GCzybLQxx7iEyo/Hat1OM6Q8rMRqvFPH0m+BoBFhCUFf30qb4=
X-Google-Smtp-Source: AGHT+IEdC8loWBskIO3ec47CgiS3ugrBsDjwPbv5xYeMyu2Akw/gZ0odKdi14u5bdzJYJeWuO3Cw1Q==
X-Received: by 2002:a05:6512:2396:b0:536:54df:bffa with SMTP id
 2adb3069b0e04-53a1544c1e8mr2768234e87.45.1729288168661; 
 Fri, 18 Oct 2024 14:49:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:49:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:49:16 +0300
Subject: [PATCH 5/6] drm/msm/dp: migrate the ycbcr_420_allowed to
 drm_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-bridge-yuv420-v1-5-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3851;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ugTosUslB7wYiUqpHQuS1lhI0s68LhvrkUMBV1pOZG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEtfdCMWS3IEeYl04oBE5MQmiiYn7fcPZlBXfM
 P3seFVF/PuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLX3QAKCRCLPIo+Aiko
 1YMjB/wMXVy2Q15F0LL8KfsS+vI2vd9tB7X/2igt44qCY9V/YD7aYTGLdxLWdbcDrxQN5u9Mcwh
 zw1Jv6DFYlV1pFvCsNZUscq3eBivP0SSQWq5ASyu5y3KpXIEb4LIrWQdCuo34zNSNp1O2VqZUXc
 aYJwBkRlnW3GxmOtYp9V2o4IjKVWglBgHxctzLV0EQQshkTvWjUwSb2YjpNllMgZrQy2BU3cARG
 2dxcJfnRCBNhorNeFbjps9ZBZo8NZXiehcXpL/MdalVwzWtwjA9OJjrheMeOKcDpuhRwk2hc/fC
 YODvL7pzINueMvI4JEybtw/B2labB9J/5nnSUiYnYiJ89NYl
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Instead of forcing the ycbcr_420_allowed flag to be set on the created
drm_connector, set it on the drm_bridge instance and allow
drm_bridge_connecgtor to propagate it to the drm_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
 drivers/gpu/drm/msm/dp/dp_drm.c     | 10 ++++------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  7 ++++---
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e1228fb093ee..0ddd8abca499 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1467,14 +1467,14 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
 
-	ret = dp_bridge_init(dp_display, dev, encoder);
+	ret = dp_bridge_init(dp_display, dev, encoder, yuv_supported);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dp bridge: %d\n", ret);
 		return ret;
 	}
 
-	dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
+	dp_display->connector = dp_drm_connector_init(dp_display, encoder);
 	if (IS_ERR(dp_display->connector)) {
 		ret = PTR_ERR(dp_display->connector);
 		DRM_DEV_ERROR(dev->dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 1b9be5bd97f1..7eb1621f9e7f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -289,7 +289,7 @@ static const struct drm_bridge_funcs edp_bridge_ops = {
 };
 
 int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
-			struct drm_encoder *encoder)
+		   struct drm_encoder *encoder, bool yuv_supported)
 {
 	int rc;
 	struct msm_dp_bridge *dp_bridge;
@@ -304,6 +304,7 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 	bridge = &dp_bridge->bridge;
 	bridge->funcs = dp_display->is_edp ? &edp_bridge_ops : &dp_bridge_ops;
 	bridge->type = dp_display->connector_type;
+	bridge->ycbcr_420_allowed = yuv_supported;
 
 	/*
 	 * Many ops only make sense for DP. Why?
@@ -351,8 +352,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 }
 
 /* connector initialization */
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
-					    bool yuv_supported)
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display,
+					    struct drm_encoder *encoder)
 {
 	struct drm_connector *connector = NULL;
 
@@ -363,9 +364,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
 	if (!dp_display->is_edp)
 		drm_connector_attach_dp_subconnector_property(connector);
 
-	if (yuv_supported)
-		connector->ycbcr_420_allowed = true;
-
 	drm_connector_attach_encoder(connector, encoder);
 
 	return connector;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 45e57ac25a4d..ae632fcc407c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -19,10 +19,11 @@ struct msm_dp_bridge {
 
 #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
 
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
-					    bool yuv_supported);
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display,
+					    struct drm_encoder *encoder);
 int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
-			struct drm_encoder *encoder);
+		   struct drm_encoder *encoder,
+		   bool yuv_supported);
 
 void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 			     struct drm_bridge_state *old_bridge_state);

-- 
2.39.5

