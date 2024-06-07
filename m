Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22456900492
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAEB10EC30;
	Fri,  7 Jun 2024 13:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bRNMArzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5BB10EC2D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:23:10 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52bc274f438so437762e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717766589; x=1718371389; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AFLpao8lXVnpqLacJaIW38fnXT4yNr9NSglb0CNyDOg=;
 b=bRNMArzFGl+DyfY+/HaPU28CO75SKNkPuJP75KhELTSkTVUVseIEOO54zP/6kn0ACc
 K5UaEFxriemnMk1jem72KDlK4QyHU3iaSj5XyWdn6D+/qKEbJbtGms/5GDldSbixeNTG
 NN4/r+iO/8/8TGNuI5rHGI1noJUiEgarmsJe+n+XexwGGpj7XQPDbuSx2QU0bpvM60nG
 UMGlOYYV8F/T1VpNZAqfYAgEb0UPfSwvr9lI7cWxCtStFhBiHznEs8FCCVNKPcvEzc+d
 hJaH7sVs9QR/LzZ+jmpZsMD6hogslvK1N2NPu2zG+dW6C0TRtFtzOmU5PjTvFS53pLdi
 YfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717766589; x=1718371389;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFLpao8lXVnpqLacJaIW38fnXT4yNr9NSglb0CNyDOg=;
 b=dpakJYAVH5RP9yTnogJUeGel2AahwbudtUqRryWME1JYAl1t3Ql7Npb17izzYe1h0+
 6RT3ZtPyDX1mIqIPgjobSc47aU0QW2JXCk00Rpk/wQ5gUH6D0ogqOx2RdOcUkm6Uhw/Y
 P+C8mBHnTBHDFZsguHUGQzO89U/3WFq0dbyQTsSGGyUcmvT9A+TbT7+hyAqmqeXTafPw
 X2FQZdp3zsXUlENXuZ5pI8qvjLqaHrEB4gHqquBBq0i3VCDqZ5lg2X1Sq6pK7CqdoGek
 7De5gL+gBevb2HZrPunj9BzW+M4qeOeZf74IR/cDCtK3g93bFL5tx5C2azMgfNSEKhiw
 TMbQ==
X-Gm-Message-State: AOJu0YyG06BF9DCOiapQKTWVF2CkqNbXxa7BEEB4HEqMIusgcf2BTht+
 NUKUmCcAIbl16NPDZdDsFD25rnWTAnNK5y+ca3SeKbM5C4WM8WbENsNnQSZloj0=
X-Google-Smtp-Source: AGHT+IFwbCnkEttOX7Sj43f6XgZ+FrGjlJOw5VScJE8gXyX02Vm6NGSQvPT3847b3ujM3X6JFDYoGg==
X-Received: by 2002:ac2:4daf:0:b0:52a:d87f:60e3 with SMTP id
 2adb3069b0e04-52bb9fd29b6mr1599625e87.57.1717766588996; 
 Fri, 07 Jun 2024 06:23:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bc27640easm80944e87.104.2024.06.07.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:23:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Jun 2024 16:23:02 +0300
Subject: [PATCH v5 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-bridge-hdmi-connector-v5-5-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3533;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=q7d4WPEa5GdCsRctIQMjtDo9wt1M5AQaev+03cz0EHU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYwm2FehfWZH7hrOSzXh+wQjgiGhRZOnSWf0p8
 h6EXhtCIeCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmMJtgAKCRCLPIo+Aiko
 1YbgB/9oufFN9Cke5yMN4dRGnuGaFtH83zlgZqe1vA46MbXbxQ3xDNS09nm7k4pN9MevYR20acx
 z26y2Ip4LSnD/YO1IBfNAHyuY9HF3uiI1I1BAsXGVWrJ/NSOe8M19s2LBg7xCGLCLjwd6u8rTk0
 e25yIfzfj3Q5PIYR0RYbqPGXgRvtzXflyDWL3SviRo6KhOWU0LoSOdPak+oy/dogDToTr0cJyDv
 gqalGyvpta4XA14hFaKVcBEb+6lfZLyDWoVsfRJkrRx86kA5+4kckPhHrCHiPIrEBoYwtM6A9Hg
 m9jUkM6b1lMsZK3grSIjdKGQ0CkAw6zsKu4lMu5wFRgqKFnk
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

The mode_set callback is deprecated, it doesn't get the
drm_bridge_state, just mode-related argumetns. Turn it into the
atomic_enable callback as suggested by the documentation.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dc..f259d6268c0f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -129,12 +129,25 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct hdmi_phy *phy = hdmi->phy;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
 
 	DBG("power up");
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	mode = &crtc_state->adjusted_mode;
+
+	hdmi->pixclock = mode->clock * 1000;
+
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
@@ -177,18 +190,24 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	}
 }
 
-static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-		 const struct drm_display_mode *mode,
-		 const struct drm_display_mode *adjusted_mode)
+static void msm_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
 	int hstart, hend, vstart, vend;
 	uint32_t frame_ctrl;
 
-	mode = adjusted_mode;
-
-	hdmi->pixclock = mode->clock * 1000;
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	mode = &crtc_state->adjusted_mode;
 
 	hstart = mode->htotal - mode->hsync_start;
 	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
@@ -305,8 +324,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_enable = msm_hdmi_bridge_atomic_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
-	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,

-- 
2.39.2

