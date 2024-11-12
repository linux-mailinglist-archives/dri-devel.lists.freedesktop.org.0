Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3E69C4C33
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 03:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C6D10E0FE;
	Tue, 12 Nov 2024 02:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="0FPZs0DN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C9410E0FE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 02:07:54 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A27B9893A5;
 Tue, 12 Nov 2024 03:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1731377272;
 bh=GK07/72rXxlvs8JlB4XrtxGC1E0KAqUfJ6jp0kyZIb0=;
 h=From:To:Cc:Subject:Date:From;
 b=0FPZs0DN+mjDvLXPrK4Rsorecp1cYdsuLBbuD2b0SdPYcqWfjJZ7aKBSSd4z+sFcp
 GmIE0Ih7vGcB8+Q4k67uhSuD3ekBZSVXfUi4FwyVlAq8ouSXHa53tSXqvibMXxqhRd
 0+DxkTm/Buo9EcRZHsUZns7KLMfDKjD0G90KWS78Wmw9hW8kungD9r/DxJgM4MtStV
 EhDNhdSr3zmXPmGG0OtfmoIMy2aEJDWPNb6g2WdloibNeIU6AHIjjYl1P3bqHYJZqT
 uYVm5sRZL8azLT47NIGQmdOJ0oXn3vsBcUZh8NOv7vUY6No4PQN/Yc9Glcfs/4ufbi
 LX1O8ISMc/lRQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/2] drm/bridge/panel: Add drm_bridge_get_panel to extract
 panel from last bridge
Date: Tue, 12 Nov 2024 03:05:36 +0100
Message-ID: <20241112020737.335297-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

Add drm_bridge_get_panel() function to extract drm_panel pointer from
panel_bridge. This can be used by bridges in the middle to look up and
access drm_panel at the end, and e.g. extract display_timings from it.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
V2: - New patch
---
 drivers/gpu/drm/bridge/panel.c | 18 ++++++++++++++++++
 include/drm/drm_bridge.h       |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6e88339dec0f5..0e5937dc7ab21 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -235,6 +235,24 @@ bool drm_bridge_is_panel(const struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_bridge_is_panel);
 
+/**
+ * drm_bridge_get_panel - Return panel if a drm_bridge is a panel_bridge.
+ *
+ * @bridge: The drm_bridge.
+ *
+ * Returns drm_panel pointer if the bridge is a panel bridge, or NULL otherwise.
+ */
+struct drm_panel *drm_bridge_get_panel(struct drm_bridge *bridge)
+{
+	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+
+	if (!drm_bridge_is_panel(bridge))
+		return NULL;
+
+	return panel_bridge->panel;
+}
+EXPORT_SYMBOL(drm_bridge_get_panel);
+
 /**
  * drm_panel_bridge_add - Creates a &drm_bridge and &drm_connector that
  * just calls the appropriate functions from &drm_panel.
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e8d735b7f6a48..4b64ab47c9d7f 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -984,6 +984,7 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);
+struct drm_panel *drm_bridge_get_panel(struct drm_bridge *bridge);
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
 struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 					      u32 connector_type);
@@ -1004,6 +1005,11 @@ static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
 	return false;
 }
 
+static struct drm_panel *drm_bridge_get_panel(struct drm_bridge *bridge)
+{
+	return NULL;
+}
+
 static inline int drm_panel_bridge_set_orientation(struct drm_connector *connector,
 						   struct drm_bridge *bridge)
 {
-- 
2.45.2

