Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3B7957794
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 00:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764C210E144;
	Mon, 19 Aug 2024 22:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NzZEL/Bz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1117E10E144
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 22:38:40 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20223b5c1c0so14578985ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724107119; x=1724711919;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4epShKXY+hj6izJiuYDlNYe3lRcBUUzUpZVsUSgXYg=;
 b=NzZEL/BzgL1+MA58NVg4s6nYezZLbbwMho6Mf1Uvy2wgSr+e2ob3D63fg/PCl0cfzb
 Q3PdMznvEOh7Nu+BfA4MAkZsex3dgVxzTXsXi9hR/WgYU5fAXuQG9+pKkRP2o49Ye122
 Gq23KmxXwAgHHLjeTxCCatAxIpnE2GWJ1qI/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724107119; x=1724711919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4epShKXY+hj6izJiuYDlNYe3lRcBUUzUpZVsUSgXYg=;
 b=LJVRDswDF3u9oM0/HBHkxg90TjpYuhBZp20JQ621C2g7D1k71946qnVYvUuRA6n3uX
 mSKty+GrQzjQqN20vgpDtTWbh7gsWAqlDJwt2puduYVuf652zqsM5zP3JbjJAFHrHIJj
 p2paFITaw57GT+ga7QURYRbq27N7fpwHlFk4lL+Vbb3XdiDfdU1QU3EQjbQ3I1VENVkf
 ai2OUr2vJb6gE866IEKEOZ5BjS2ikgWwiOHHclZrdRYeeTJxeRb+0AiyBiCapfg2XtyV
 GcJU+nnKSPQaIncXV9k/X4P2kmrGRzifwkRZ1PEdsz6sKCkW2pqHPsuIsyi40A5MQCVd
 F4mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV0sYtBjXeTJ4dbLsrbbhBhCM+1bZm3v13OqBs3oSUdl61UaZehKGwUwMfExfBMN1ExLknw7n0cpw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzc9NRnybAYjA/iWGQuKoL5PWmTpbaHktEI1r/x8tJAxbWNb/x
 O/4lPLuhXyasm8SsH2ofdCY6ONCDLvkLa1MB+me+TqyqjmVuId5kIz0pIkbETw==
X-Google-Smtp-Source: AGHT+IGpA/LzfoLsEqsJMHJfcUpzeVMRHpRXXvAFjX+lnlP4tWIDSijdKOHcbbCm+Y0fYngKipaQHw==
X-Received: by 2002:a17:902:f547:b0:1fb:a077:a846 with SMTP id
 d9443c01a7336-20203e4f350mr122296765ad.3.1724107119275; 
 Mon, 19 Aug 2024 15:38:39 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-201f02fff75sm67248655ad.13.2024.08.19.15.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 15:38:38 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 01/17] drm/atomic-helper: Introduce lane remapping support
 to bridges
Date: Mon, 19 Aug 2024 15:38:15 -0700
Message-ID: <20240819223834.2049862-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819223834.2049862-1-swboyd@chromium.org>
References: <20240819223834.2049862-1-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support to the DRM atomic logic to support lane remapping between
bridges, encoders and connectors. Typically lane mapping is handled
statically in firmware, e.g. on DT we use the data-lanes property to
assign lanes when connecting display bridges. Lane assignment is dynamic
with USB-C DisplayPort altmodes, e.g. pin conf D assigns 2 lanes of DP
to pins on the USB-C connector while pin conf C assigns 4 lanes of DP to
pins on the USB-C connector. The lane assignment can't be set statically
because the DP altmode repurposes USB-C pins for the DP lanes while also
limiting the number of DP lanes or their pin assignment at runtime.

Bridge drivers should point their 'struct drm_bus_cfg::lanes' pointer to
an allocated array of 'struct drm_lane_cfg' structures and indicate the
size of this allocated array with 'struct drm_bus_cfg::num_lanes' in
their atomic_check() callback. The previous bridge in the bridge chain
can look at this information by calling
drm_bridge_next_bridge_lane_cfg() in their atomic_check() callback to
figure out what lanes need to be logically assigned to the physical
output lanes to satisfy the next bridge's lane assignment.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: <dri-devel@lists.freedesktop.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  2 ++
 drivers/gpu/drm/drm_bridge.c              | 34 +++++++++++++++++++++++
 include/drm/drm_atomic.h                  | 31 +++++++++++++++++++++
 include/drm/drm_bridge.h                  |  4 +++
 4 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb1095..12d574458e7b 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -779,6 +779,8 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
 void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
 					    struct drm_bridge_state *state)
 {
+	kfree(state->input_bus_cfg.lanes);
+	kfree(state->output_bus_cfg.lanes);
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d44f055dbe3e..bd18c1e91dee 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -822,6 +822,40 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
+/**
+ * drm_bridge_next_bridge_lane_cfg - get the lane configuration of the next bridge
+ * @bridge: bridge control structure
+ * @state: new atomic state
+ * @num_lanes: will contain the size of the returned array
+ *
+ * This function is typically called from &drm_bridge_funcs.atomic_check().
+ * The @bridge driver calls this function to determine what the next bridge in
+ * the bridge chain requires for the physical to logical lane assignments.
+ *
+ * Return: Lane configuration array of size @num_lanes for the next bridge
+ * after @bridge in the bridge chain, or NULL if the lane configuration is
+ * unchanged from the default.
+ */
+const struct drm_lane_cfg *
+drm_bridge_next_bridge_lane_cfg(struct drm_bridge *bridge,
+				struct drm_atomic_state *state,
+				u8 *num_lanes)
+{
+	const struct drm_bridge_state *next_bridge_state;
+	struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
+
+	next_bridge_state = drm_atomic_get_new_bridge_state(state, next_bridge);
+	if (!next_bridge_state) {
+		*num_lanes = 0;
+		return NULL;
+	}
+
+	*num_lanes = next_bridge_state->input_bus_cfg.num_lanes;
+
+	return next_bridge_state->input_bus_cfg.lanes;
+}
+EXPORT_SYMBOL(drm_bridge_next_bridge_lane_cfg);
+
 static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 4d7f4c5f2001..e1a38d0742f1 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1122,6 +1122,27 @@ drm_atomic_crtc_effectively_active(const struct drm_crtc_state *state)
 	return state->active || state->self_refresh_active;
 }
 
+/**
+ * struct drm_lane_cfg - lane configuration
+ *
+ * This structure stores the lane configuration of a physical bus between
+ * two components in an output pipeline, usually between two bridges, an
+ * encoder and a bridge, or a bridge and a connector.
+ *
+ * The lane configuration is stored in &drm_bus_cfg.
+ */
+struct drm_lane_cfg {
+	/**
+	 * @logical: Logical lane number
+	 */
+	u8 logical;
+
+	/**
+	 * @inverted: True if lane polarity is inverted, false otherwise
+	 */
+	bool inverted;
+};
+
 /**
  * struct drm_bus_cfg - bus configuration
  *
@@ -1152,6 +1173,16 @@ struct drm_bus_cfg {
 	 * @flags: DRM_BUS_* flags used on this bus
 	 */
 	u32 flags;
+
+	/**
+	 * @lanes: Lane mapping for this bus
+	 */
+	struct drm_lane_cfg *lanes;
+
+	/**
+	 * @num_lanes: Number of lanes in @lanes
+	 */
+	u8 num_lanes;
 };
 
 /**
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 75019d16be64..064d3c8600a9 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -963,6 +963,10 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 					struct drm_connector_state *conn_state,
 					u32 output_fmt,
 					unsigned int *num_input_fmts);
+const struct drm_lane_cfg *
+drm_bridge_next_bridge_lane_cfg(struct drm_bridge *bridge,
+				struct drm_atomic_state *state,
+				u8 *num_lanes);
 
 enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge);
 int drm_bridge_get_modes(struct drm_bridge *bridge,
-- 
https://chromeos.dev

