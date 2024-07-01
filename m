Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5162191E753
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 20:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62C910E095;
	Mon,  1 Jul 2024 18:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p9NJI3qj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4138710E061
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 18:19:58 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52cdfb69724so4189463e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719857996; x=1720462796; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tfdgN7xrW/R6B0u6uKJvfbAFTMRYQPiCCKcLGsN0b/k=;
 b=p9NJI3qjXVjqeawW8mmiupq0CpYKP1r1tPHUt1OxZ2zXD3D6h6IzS8NSGg2I6M8wpI
 THlM+CL3dK/ucNNQ9IThVrNI4+lx7vjLJ16k41ctZPGJcrjnknkg+91o1eHK6EBbwoCA
 eSk+b6Mh8cZffE/qBZhn7TqJXS4vQ1NaC3HJ3ynbzgMHVGAYP1pCpugmyX5ePS78EDjc
 kHO2W+TWYY5MgvcOeO5ukKYTWBrNpExVEV0JeGoLi75fC04gamjhI3and5PBdt9SImZB
 5ZZVoRMRL9jcRFQnvE1pq/L8qYXoODumxp0bDI6CExIOxj3kNVwbav1CTf8kd0OGpMia
 yeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719857996; x=1720462796;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tfdgN7xrW/R6B0u6uKJvfbAFTMRYQPiCCKcLGsN0b/k=;
 b=e9S2Vg3CW/1/E6HHAUBBHGZ1FJ6SRWjHqHDB2Xn4MlcNV6vjzD6L3QlkyggOJoHCxC
 GdqbZrp/i17wj2DZAvk9p4zPmbs6cyc4bvfjxVf9q+pInsyWBbckiRAMI0Ndo/PIAdsq
 VmQ0ZVrQqLoQ+9Wa8dBs8XXYDboV8BwN3MNOQrNtpb/a+vFA9NJnTQpH+hW1VRLl+9Nk
 r30r1XAtb/uHu0XU+pa7qT45gI5UzKNv9L5JPTOYPq0HqpMB5w9yUN/YfGXquGErmBS4
 dthou1oElA2v/JGYrxez1VXsO0QF9AU1jHhmgXtnaZ3LiR0C3dAFFgGMl5/+Cplq/o16
 eDUw==
X-Gm-Message-State: AOJu0Yzrm3KG6KRUHbLWnewntCryolC9/A3PGNDWA/28stLbrRJXG4XX
 9fXc3kQfYBsaJpMrwA+tVY7aNq5G/Qc//M4ZGcRqlznxNfJmUX+Bx6wiOb8SLiE=
X-Google-Smtp-Source: AGHT+IF/IGns73MSGhgQayWQ8eqWzFmQGyxaZK4i8j/fzIlop+C9LAet3Q0Imb3kBOEar2guYXGQZQ==
X-Received: by 2002:a05:6512:158b:b0:52c:df8c:72cc with SMTP id
 2adb3069b0e04-52e82703ecbmr4528869e87.43.1719857996371; 
 Mon, 01 Jul 2024 11:19:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab2f8aasm1516931e87.236.2024.07.01.11.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:19:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Jul 2024 21:19:53 +0300
Subject: [PATCH 2/2] drm/bridge: lt9611uxc: drop support for
 !DRM_BRIDGE_ATTACH_NO_CONNECTOR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-lt9611uxc-next-bridge-v1-2-665bce5fdaaa@linaro.org>
References: <20240701-lt9611uxc-next-bridge-v1-0-665bce5fdaaa@linaro.org>
In-Reply-To: <20240701-lt9611uxc-next-bridge-v1-0-665bce5fdaaa@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5199;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3vwogvWVjSEg2amSgBHvcpUf/GAVj6civXHWgqF082c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmgvNKam6DiSkAgqx8cwxy8Xd9qmzmIt1gy9F02
 cFc/pcs7BmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZoLzSgAKCRCLPIo+Aiko
 1Xl0B/4rSGml/IY3ZJBGwK+3Ms6wCuiID9KbblxrxP5BkNnx8jdeAa01ihU0hkmqOMxPYdaItow
 M5i7nPuQmzIT1UOUeojlJ22FZyEg+r+8BcK01uk45vuio2bZGO3rRXecpP/I3LdAWQKBXnqyZmO
 E45pTHkzEkR9bseNlAYGPlMvh11LdL8yGORx6hzp3V8+CLjhhwGtynGfEgOqte6kJ2FxzW0Rjx8
 XLP681u4zEqWQFR4HJqSYCW+l9lZtxr/cI5aWTJWWmBal0R9kqvjy4PwAlZWt/MRTOMwMN9TYWM
 QE3HZ3qTAfJSW9ceP/r6m1aya/u46mvwEsiQEX2dRcLN1nWf
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

Having no in-kernel devices that use !DRM_BRIDGE_ATTACH_NO_CONNECTOR
mode for the Lontium LT9611UXC bridge, drop the in-bridge implementation
of the drm_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 104 +++--------------------------
 1 file changed, 9 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 4d379d0d24d9..4d1d40e1f1b4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -36,7 +36,6 @@ struct lt9611uxc {
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
-	struct drm_connector connector;
 
 	struct regmap *regmap;
 	/* Protects all accesses to registers by stopping the on-chip MCU */
@@ -122,11 +121,6 @@ static struct lt9611uxc *bridge_to_lt9611uxc(struct drm_bridge *bridge)
 	return container_of(bridge, struct lt9611uxc, bridge);
 }
 
-static struct lt9611uxc *connector_to_lt9611uxc(struct drm_connector *connector)
-{
-	return container_of(connector, struct lt9611uxc, connector);
-}
-
 static void lt9611uxc_lock(struct lt9611uxc *lt9611uxc)
 {
 	mutex_lock(&lt9611uxc->ocm_lock);
@@ -173,20 +167,14 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
 	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
 	bool connected;
 
-	if (lt9611uxc->connector.dev) {
-		if (lt9611uxc->connector.dev->mode_config.funcs)
-			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
-	} else {
-
-		mutex_lock(&lt9611uxc->ocm_lock);
-		connected = lt9611uxc->hdmi_connected;
-		mutex_unlock(&lt9611uxc->ocm_lock);
+	mutex_lock(&lt9611uxc->ocm_lock);
+	connected = lt9611uxc->hdmi_connected;
+	mutex_unlock(&lt9611uxc->ocm_lock);
 
-		drm_bridge_hpd_notify(&lt9611uxc->bridge,
-				      connected ?
-				      connector_status_connected :
-				      connector_status_disconnected);
-	}
+	drm_bridge_hpd_notify(&lt9611uxc->bridge,
+			      connected ?
+			      connector_status_connected :
+			      connector_status_disconnected);
 }
 
 static void lt9611uxc_reset(struct lt9611uxc *lt9611uxc)
@@ -291,87 +279,13 @@ static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
 	return dsi;
 }
 
-static int lt9611uxc_connector_get_modes(struct drm_connector *connector)
-{
-	struct lt9611uxc *lt9611uxc = connector_to_lt9611uxc(connector);
-	const struct drm_edid *drm_edid;
-	int count;
-
-	drm_edid = drm_bridge_edid_read(&lt9611uxc->bridge, connector);
-	drm_edid_connector_update(connector, drm_edid);
-	count = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
-
-	return count;
-}
-
-static enum drm_connector_status lt9611uxc_connector_detect(struct drm_connector *connector,
-							    bool force)
-{
-	struct lt9611uxc *lt9611uxc = connector_to_lt9611uxc(connector);
-
-	return lt9611uxc->bridge.funcs->detect(&lt9611uxc->bridge);
-}
-
-static enum drm_mode_status lt9611uxc_connector_mode_valid(struct drm_connector *connector,
-							   struct drm_display_mode *mode)
-{
-	struct lt9611uxc_mode *lt9611uxc_mode = lt9611uxc_find_mode(mode);
-
-	return lt9611uxc_mode ? MODE_OK : MODE_BAD;
-}
-
-static const struct drm_connector_helper_funcs lt9611uxc_bridge_connector_helper_funcs = {
-	.get_modes = lt9611uxc_connector_get_modes,
-	.mode_valid = lt9611uxc_connector_mode_valid,
-};
-
-static const struct drm_connector_funcs lt9611uxc_bridge_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = lt9611uxc_connector_detect,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc *lt9611uxc)
-{
-	int ret;
-
-	lt9611uxc->connector.polled = DRM_CONNECTOR_POLL_HPD;
-
-	drm_connector_helper_add(&lt9611uxc->connector,
-				 &lt9611uxc_bridge_connector_helper_funcs);
-	ret = drm_connector_init(bridge->dev, &lt9611uxc->connector,
-				 &lt9611uxc_bridge_connector_funcs,
-				 DRM_MODE_CONNECTOR_HDMIA);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	return drm_connector_attach_encoder(&lt9611uxc->connector, bridge->encoder);
-}
-
 static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
 				   enum drm_bridge_attach_flags flags)
 {
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
-	int ret;
-
-	ret = drm_bridge_attach(bridge->encoder, lt9611uxc->next_bridge,
-				 bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret)
-		return ret;
 
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		ret = lt9611uxc_connector_init(bridge, lt9611uxc);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
+	return drm_bridge_attach(bridge->encoder, lt9611uxc->next_bridge,
+				 bridge, flags);
 }
 
 static enum drm_mode_status

-- 
2.39.2

