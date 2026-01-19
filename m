Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB44D3AA4B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C225710E45C;
	Mon, 19 Jan 2026 13:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OlX5pdX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D871A10E459
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768829161;
 bh=JIdBeKkyyfaeqnmELgpMUxe5PoZJqoizqiG21J8pAaY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OlX5pdX9sHS+Q6eGHZ+c4BXq3yped6QgMw3R1V+rKFw6IecF9ZPNezh3ImQUJut0J
 mVdW2KUtuoc+JouikCgLDbeJKmA4SDA/ERm3/3zQg7326mW1Z7135FbCXr1x/x5udO
 YuQ0pJF1pI9SSxKozrgwmhva0JwztwKGMhY6kXnt+hlm6wPUKkkexHQFUAckyx7NOu
 KKEE6LdpiF+XJH0/QYBP9cvnEG7VwoUmMnRbZjUwKvHpfwpSqnhS/JLOch1Y5GAWQK
 khb7X5sAf6MzAH/JUA9dNLp5FobOFDCgy+ZPaZGgnZArS0q2/XXICPBvY+8ZmPfCdv
 qbcyIyL3toxGw==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 52A1717E10F8;
 Mon, 19 Jan 2026 14:26:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 19 Jan 2026 15:25:58 +0200
Subject: [PATCH v3 2/4] drm/bridge-connector: Switch to using ->detect_ctx hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-dw-hdmi-qp-scramb-v3-2-bd8611730fc1@collabora.com>
References: <20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com>
In-Reply-To: <20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
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

In preparation to allow bridge drivers relying on the HDMI connector
framework to provide HDMI 2.0 support, make use of the atomic version of
drm_connector_funcs.detect() hook and invoke the newly introduced
drm_bridge_detect_ctx() helper.

In particular, this is going to be used for triggering an empty modeset
in drm_bridge_funcs.detect_ctx() callback, in order to manage SCDC
status lost on sink disconnects.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 73 ++++++++++++++------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index ba8ff113cff1..2bd835c53b65 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -208,39 +208,6 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
  * Bridge Connector Functions
  */
 
-static enum drm_connector_status
-drm_bridge_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct drm_bridge_connector *bridge_connector =
-		to_drm_bridge_connector(connector);
-	struct drm_bridge *detect = bridge_connector->bridge_detect;
-	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
-	enum drm_connector_status status;
-
-	if (detect) {
-		status = detect->funcs->detect(detect, connector);
-
-		if (hdmi)
-			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
-
-		drm_bridge_connector_hpd_notify(connector, status);
-	} else {
-		switch (connector->connector_type) {
-		case DRM_MODE_CONNECTOR_DPI:
-		case DRM_MODE_CONNECTOR_LVDS:
-		case DRM_MODE_CONNECTOR_DSI:
-		case DRM_MODE_CONNECTOR_eDP:
-			status = connector_status_connected;
-			break;
-		default:
-			status = connector_status_unknown;
-			break;
-		}
-	}
-
-	return status;
-}
-
 static void drm_bridge_connector_force(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
@@ -278,7 +245,6 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
-	.detect = drm_bridge_connector_detect,
 	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -291,6 +257,42 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
  * Bridge Connector Helper Functions
  */
 
+static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
+					   struct drm_modeset_acquire_ctx *ctx,
+					   bool force)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
+	int ret;
+
+	if (detect) {
+		ret = drm_bridge_detect_ctx(detect, connector, ctx);
+		if (ret < 0)
+			return ret;
+
+		if (hdmi)
+			drm_atomic_helper_connector_hdmi_hotplug(connector, ret);
+
+		drm_bridge_connector_hpd_notify(connector, ret);
+	} else {
+		switch (connector->connector_type) {
+		case DRM_MODE_CONNECTOR_DPI:
+		case DRM_MODE_CONNECTOR_LVDS:
+		case DRM_MODE_CONNECTOR_DSI:
+		case DRM_MODE_CONNECTOR_eDP:
+			ret = connector_status_connected;
+			break;
+		default:
+			ret = connector_status_unknown;
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
@@ -298,7 +300,7 @@ static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 	const struct drm_edid *drm_edid;
 	int n;
 
-	status = drm_bridge_connector_detect(connector, false);
+	status = drm_bridge_connector_detect_ctx(connector, NULL, false);
 	if (status != connector_status_connected)
 		goto no_edid;
 
@@ -384,6 +386,7 @@ static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
 
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
+	.detect_ctx = drm_bridge_connector_detect_ctx,
 	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,

-- 
2.52.0

