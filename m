Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E99040B6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 18:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2E710E69F;
	Tue, 11 Jun 2024 16:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="vMcuuFt/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6951710E6A2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718121749; bh=0XDwfJc/IwpzEz4wRvrO6aRIQFt9tGAc7Bg1rLoc9K0=;
 b=vMcuuFt/b/z+kEgfu2zmt1+8fpY0WtPIfOYAyRfr1ZQFS/XRP/313qGHt1+D5RuiEuC7cm095
 HEr/kTQHVeRHhOJKE8xnaLWE/6w476BYT7CibECAJSRjIEVjRvTv4yY59LdZlpEbAfrr/y8lgbo
 K4uKFPpVySgBrqg6YCrPQZsfLtB8UddLQUHj1RIyXa6FWcLynsULJgqfd/TrNmUvkbtheCst98K
 JwvPvBTfnCa1YwsUxwDUgplaXueLumTbKo5rVwI6i9wLgHI21A4hpVEs3bHGIflmfySy0nDPOPG
 LMOq0qXPYf5tsRutdcSS7ohJZHQDib/zvrktMfs3BQBw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] drm: bridge: dw_hdmi: Call poweron/poweroff from atomic
 enable/disable
Date: Tue, 11 Jun 2024 15:50:53 +0000
Message-ID: <20240611155108.1436502-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611155108.1436502-1-jonas@kwiboo.se>
References: <20240611155108.1436502-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66687277b913b04293b6dc30
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

Change to only call poweron/poweroff from atomic_enable/atomic_disable
ops instead of trying to keep a bridge_is_on state and poweron/off in
the hotplug irq handler.

A benefit of this is that drm mode_config mutex is always held at
poweron/off, something that may reduce the need for our own mutex.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 33 ++---------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 9f2bc932c371..34bc6f4754b8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -172,7 +172,6 @@ struct dw_hdmi {
 	enum drm_connector_force force;	/* mutex-protected force state */
 	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
 	bool disabled;			/* DRM has disabled our bridge */
-	bool bridge_is_on;		/* indicates the bridge is on */
 	bool rxsense;			/* rxsense state */
 	u8 phy_mask;			/* desired phy int mask settings */
 	u8 mc_clkdis;			/* clock disable register */
@@ -2383,8 +2382,6 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
 
 static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
 {
-	hdmi->bridge_is_on = true;
-
 	/*
 	 * The curr_conn field is guaranteed to be valid here, as this function
 	 * is only be called when !hdmi->disabled.
@@ -2398,30 +2395,6 @@ static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
 		hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
 		hdmi->phy.enabled = false;
 	}
-
-	hdmi->bridge_is_on = false;
-}
-
-static void dw_hdmi_update_power(struct dw_hdmi *hdmi)
-{
-	int force = hdmi->force;
-
-	if (hdmi->disabled) {
-		force = DRM_FORCE_OFF;
-	} else if (force == DRM_FORCE_UNSPECIFIED) {
-		if (hdmi->rxsense)
-			force = DRM_FORCE_ON;
-		else
-			force = DRM_FORCE_OFF;
-	}
-
-	if (force == DRM_FORCE_OFF) {
-		if (hdmi->bridge_is_on)
-			dw_hdmi_poweroff(hdmi);
-	} else {
-		if (!hdmi->bridge_is_on)
-			dw_hdmi_poweron(hdmi);
-	}
 }
 
 /*
@@ -2546,7 +2519,6 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->force = connector->force;
-	dw_hdmi_update_power(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	mutex_unlock(&hdmi->mutex);
 }
@@ -2955,7 +2927,7 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = true;
 	hdmi->curr_conn = NULL;
-	dw_hdmi_update_power(hdmi);
+	dw_hdmi_poweroff(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	handle_plugged_change(hdmi, false);
 	mutex_unlock(&hdmi->mutex);
@@ -2974,7 +2946,7 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = false;
 	hdmi->curr_conn = connector;
-	dw_hdmi_update_power(hdmi);
+	dw_hdmi_poweron(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	handle_plugged_change(hdmi, true);
 	mutex_unlock(&hdmi->mutex);
@@ -3073,7 +3045,6 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
 		if (hpd)
 			hdmi->rxsense = true;
 
-		dw_hdmi_update_power(hdmi);
 		dw_hdmi_update_phy_mask(hdmi);
 	}
 	mutex_unlock(&hdmi->mutex);
-- 
2.45.2

