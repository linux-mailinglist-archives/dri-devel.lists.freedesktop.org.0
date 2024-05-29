Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7FC8D41C7
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 01:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B13D88FAE;
	Wed, 29 May 2024 23:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GVLPOwk3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045E711A968
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:12:33 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5295e488248so264868e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717024351; x=1717629151; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
 b=GVLPOwk3x2BHk0UivWOPO96Ek7dVCA5K/Y9lfusDrHDHDk6XbL7aynKUbhhUtvdR1S
 JFAfeuajeB1xOb00KHAfXq0ieAIqSnnVc1hHSpP8F3GZ0BhxM9BCyinO9yqtSczYOpkJ
 8UDasV/x/x/lPLEw9hWReZEkSi/oEpTpaTU25bWWSQGrW9qQpa3P3Q8GSvKTJ4lfb1Mr
 wGQk7yPo2KdaZfoz81+OvBKLxihAzujxwOwcXi8CNhlrDo/kdfmmBW9+DF0QFnb7Gcvs
 2BgtARIXiFOxrK6dkFS36+anduhROMQmy0rDQPSf4WZlOHDufufvYiY7bX8MlVrp2tkh
 Hczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717024351; x=1717629151;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
 b=hQpIiXlhbw0hi4aOZfV2hJU/hxtXDMoTJAo6G7vQWwFOPk8u7z7+4trbLxDSSF/o0I
 WFnnCN0u97ByDcW/XAyqSG+eRV8v9dr59uJ7o5aZUgWUlNmbYcd+EIpzE0gAUCBev/Hc
 HFTi7eJ2Z0N5+UItSsLLC3O0P/jpslqfrnzJ3KUm3qVCt7tim4bDGCWLWb+hHhv7svzY
 OOkGSLKlOHI4cfGtjte4svc6CDlXHQy5WXBoVN4Tow7V8Bq4SPNgDsUX+ZFwP/n3UJpS
 YZjLFjmR62qbFraS2EB74ho0WdN2nUvPfnzXTlfnPBQAfTJic3NoHwDM3DAACsPgcF2I
 wPvA==
X-Gm-Message-State: AOJu0YzDb9xoEjeGjGF9NLh1r7bu8wxfDniTm4XRvob3zbSO6Gy0eIty
 al0fBwG1fQDWJBfUnrhMCCkQ/Y6MMCq2CbMy0qeIYuoRaLqRf1DOyk7UKfj6XwLVqBrISVbYNGx
 q
X-Google-Smtp-Source: AGHT+IED00Nm5mAxm/FX23Rm3CEi3WI/fVSCS88PVojYjAKG46K22pFDih1lMhk2JtVr9IDeDcpXHA==
X-Received: by 2002:ac2:5e8b:0:b0:52b:401e:1b5e with SMTP id
 2adb3069b0e04-52b7d4225c8mr266833e87.17.1717024351237; 
 Wed, 29 May 2024 16:12:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529acea1ea8sm1015998e87.276.2024.05.29.16.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 16:12:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 02:12:27 +0300
Subject: [PATCH v3 4/7] drm/msm/hdmi: switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-bridge-hdmi-connector-v3-4-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
In-Reply-To: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BLTMrmfRiYz+a4tS74ezbT2hZO40I+AiAHfNW/m4HPQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmV7Zb04aIt+1q301e04xSTt7Fn8NIuv7kWJOC2
 sA8qKwVOM6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZle2WwAKCRCLPIo+Aiko
 1cvQB/40zDY86KHpQQKKgrgHeU5s5ns13/oPw5qGupVySmwib3re/YXYqywaLQxoUxnWd/WUAiO
 5GAdLHL3m5ZynKBrIA+uYZDbeeTniF25BwWkOhkPV6Wcd/BdqBPKrP9dSclXgKs5Ea6uhzmiYL1
 sAY9pc65Ujne7ZlQ7fIkPeDLBDIf4CYxA6SFrQoPsrCyGrcX7sm/VTqChTU7mkO4qWIyfXfa/81
 4NyHjYl45+QPKaHssFr4t/3/WSsBj2g0ywnhSjR1WpKhETArPiX5VKI24ZEn8/7HcAdSMIgDafI
 38bQLf4xRGrpn3X73H6nsi9qtgm42DKC9vORHts4TvGS6F5q
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

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f..d839c71091dc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,7 +126,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -152,7 +153,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -299,8 +301,11 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.2

