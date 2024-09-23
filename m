Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916397AD28
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 10:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886DF10E43C;
	Tue, 17 Sep 2024 08:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BJoY7kvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E195510E43C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 08:53:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85DE124000F;
 Tue, 17 Sep 2024 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726563201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWWypgKRB8PzJi/zpHcCz4egF/NFlS15AogNtOzFzH8=;
 b=BJoY7kvfpFe1zSibqxQQNoKTYHNxxjT6wRGANCnxMw9l7S7rFpSQxG84DayuEhby1UaiP3
 DfiYsGJKo4tWhBKLv9J/4X+/JkhNuI+bUGgzaGj+vj5U4k0WnuGMGliEPvdvcBhVHlbskB
 zyfDCTWRja3Qei9vXfn0Nng0aUAFesbTZxEETB75ax1YAcpDauVKJPCUkzz7UqRpDRJfEc
 RBxhRIwAnlVi0wBmJkUoIDj8ohXeOe/+T2a790TJ5dd7plwcEW6A8FwkvnIh9/14SH11B3
 qMwb3LuFegweEC6Q4amanAs1bHZf/MmIOrZOSS4Qrcc38lgTeaj6d/GFu4W2NA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 17 Sep 2024 10:53:06 +0200
Subject: [PATCH v4 2/8] drm/bridge: allow bridges to be informed about
 added and removed bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-hotplug-drm-bridge-v4-2-bc4dfee61be6@bootlin.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
In-Reply-To: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: luca.ceresoli@bootlin.com
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

In preparation for allowing bridges to be added to and removed from a DRM
card without destroying the whole card, add a new DRM bridge function
called on addition and removal of bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++++++++
 include/drm/drm_bridge.h     | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d44f055dbe3e..c98117f1abec 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -205,8 +205,14 @@ static LIST_HEAD(bridge_list);
  */
 void drm_bridge_add(struct drm_bridge *bridge)
 {
+	struct drm_bridge *br, *tmp;
+
 	mutex_init(&bridge->hpd_mutex);
 
+	list_for_each_entry_safe(br, tmp, &bridge_list, list)
+		if (br->funcs->bridge_event_notify)
+			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_ADD, bridge);
+
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);
@@ -243,10 +249,16 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {
+	struct drm_bridge *br, *tmp;
+
 	mutex_lock(&bridge_lock);
 	list_del_init(&bridge->list);
 	mutex_unlock(&bridge_lock);
 
+	list_for_each_entry_safe(br, tmp, &bridge_list, list)
+		if (br->funcs->bridge_event_notify)
+			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_REMOVE, bridge);
+
 	mutex_destroy(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL(drm_bridge_remove);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 75019d16be64..635cc24bdeba 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -54,6 +54,11 @@ enum drm_bridge_attach_flags {
 	DRM_BRIDGE_ATTACH_NO_CONNECTOR = BIT(0),
 };
 
+enum drm_bridge_event_type {
+	DRM_EVENT_BRIDGE_ADD,
+	DRM_EVENT_BRIDGE_REMOVE,
+};
+
 /**
  * struct drm_bridge_funcs - drm_bridge control functions
  */
@@ -676,6 +681,24 @@ struct drm_bridge_funcs {
 				    enum hdmi_infoframe_type type,
 				    const u8 *buffer, size_t len);
 
+	/**
+	 * @bridge_event_notify:
+	 *
+	 * Notify that another bridge is being added or removed.
+	 *
+	 * This callback is optional. Bridges implementing it must always
+	 * check whether the event refers to a bridge they actually need to
+	 * interact with.
+	 *
+	 * @bridge: bridge being notified
+	 * @event: event happened (add/remove bridge)
+	 * @new_bridge: the bridge mentioned by the event (i.e. the bridge
+	 *              being added or removed)
+	 */
+	void (*bridge_event_notify)(struct drm_bridge *bridge,
+				    enum drm_bridge_event_type event,
+				    struct drm_bridge *event_bridge);
+
 	/**
 	 * @debugfs_init:
 	 *

-- 
2.34.1

