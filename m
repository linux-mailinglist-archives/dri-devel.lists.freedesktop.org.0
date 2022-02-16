Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BE74B8EB6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8EE10E67F;
	Wed, 16 Feb 2022 17:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17F910E67F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 17:00:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so2126313wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=j+c9ijUG2XlktF2rmfFawLeMKieTkH0Wg03WPJ1eeFE=;
 b=EkAEl4DNL5wwrwhwh1LOSHCZQV7Bv721PqPYZDkDuG5mxtO08RpXIE89znLwvX/DlQ
 38mCnlMNxMkp2lroi6krbXsRShpkiDeznxugKGhEaeNCDddsDUSwLuVTZ+48cPwhSzN7
 2Ku2IEYSzcvFFsHVR42Qg2Q79xdS6nMRnjgQBXxN9lUiPmUmGJ79GVSeX3TuB2QpPRn9
 8/517d/Bkc7RiyvBmawAC8ANz89NeHPAk8xGq7/PI2GirCtCrTOlT/A+r3iZHueYKTc8
 YZhIRJ6E5tcojisoatKAioTgRCZyvltWHvDMjmNGmH9EmvLBisLZYgKtVmKyTCO4wTos
 mY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=j+c9ijUG2XlktF2rmfFawLeMKieTkH0Wg03WPJ1eeFE=;
 b=GrQnZiMPU5wnI8FdBLrxY+4oboDNhFEagnY5hy2srUM3lN6cqedNuMTmqpx1gpsGLW
 cS5KmqF0Do4XZZ93XFaHQV6GDT1ml606UHNwLktQkFN1SJcwx9I7+xYVzN056cHWa1On
 7wApCnTasH5KbzhagT5Y9S2WyPWiBojwHlTCAouT+R/LiB4NSj1ZakVlRLFAVNtBlJyC
 UfoPQnZ0ORtE26RLI9NJqS0zqeIYe6xCZEFVqEMARVxwBwf8tsgzTj8eaOPiJjPbQc2Z
 kt8JXCn/mJG/nb5ud0Wu3UMbcODDnXFRRrQ1LQrA/DKYzA4MZp873RY8B6iSojBnF4XF
 wq4A==
X-Gm-Message-State: AOAM5306pG8N7AdLwO+rkY1RryFsFbmwOKqANzcQcZ2BSnzkyvIomZop
 pCF/pNwr5A40AAtb5jxv4yNtYA==
X-Google-Smtp-Source: ABdhPJx4Kiq5xVXi85fjl0NnlZsXIKqkNwu3TzgIUKq2o4sbUCHCFSCpC9x3h4rXCUvQoRX5qGhbtQ==
X-Received: by 2002:a05:600c:1d87:b0:37b:fdd5:bca4 with SMTP id
 p7-20020a05600c1d8700b0037bfdd5bca4mr2436340wms.4.1645030816915; 
 Wed, 16 Feb 2022 09:00:16 -0800 (PST)
Received: from dave-VirtualBox.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id g8sm24059322wrd.9.2022.02.16.09.00.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Feb 2022 09:00:16 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Introduce DRM_BRIDGE_OP_UPSTREAM_FIRST to alter
 bridge init order
Date: Wed, 16 Feb 2022 16:59:43 +0000
Message-Id: <4c6511bd7f4ce52aa3323141b6f0a68ae2773787.1645029005.git.dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
In-Reply-To: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI sink devices typically want the DSI host powered up and configured
before they are powered up. pre_enable is the place this would normally
happen, but they are called in reverse order from panel/connector towards
the encoder, which is the "wrong" order.

Add a new flag DRM_BRIDGE_OP_UPSTREAM_FIRST that any bridge can set
to swap the order of pre_enable (and post_disable) so that any upstream
bridges are called first to create the desired state.

eg:
- Panel
- Bridge 1
- Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
- Bridge 3
- Encoder
Would result in pre_enable's being called as Panel, Bridge 1, Bridge 3,
Bridge 2.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/drm_bridge.c | 197 +++++++++++++++++++++++++++++++++++++------
 include/drm/drm_bridge.h     |   8 ++
 2 files changed, 180 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..7c24e8340efa 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -522,21 +522,58 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
  * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
  * encoder chain, starting from the first bridge to the last. These are called
  * after completing the encoder's prepare op.
+ * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the post_disable for
+ * that bridge will be called before the previous one to reverse the pre_enable
+ * calling direction.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
 {
 	struct drm_encoder *encoder;
+	struct drm_bridge *next, *limit;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+		limit = NULL;
+
+		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
+			next = list_next_entry(bridge, chain_node);
+
+			if (next->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
+				limit = next;
+
+				list_for_each_entry_from(next, &encoder->bridge_chain,
+							 chain_node) {
+					if (!(next->ops &
+						DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
+						next = list_prev_entry(next, chain_node);
+						limit = next;
+						break;
+					}
+				}
+
+				list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
+								 chain_node) {
+					if (next == bridge)
+						break;
+
+					if (next->funcs->post_disable)
+						next->funcs->post_disable(next);
+				}
+			}
+		}
+
 		if (bridge->funcs->post_disable)
 			bridge->funcs->post_disable(bridge);
+
+		if (limit)
+			bridge = limit;
 	}
+
 }
 EXPORT_SYMBOL(drm_bridge_chain_post_disable);
 
@@ -577,22 +614,53 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
  * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
  * chain, starting from the last bridge to the first. These are called
  * before calling the encoder's commit op.
+ * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
+ * the previous bridge will be called before pre_enable of this bridge.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
 {
 	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
+	struct drm_bridge *iter, *next, *limit;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
+
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
+		if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
+			next = iter;
+			limit = bridge;
+			list_for_each_entry_from_reverse(next,
+							 &encoder->bridge_chain,
+							 chain_node) {
+				if (next == bridge)
+					break;
+
+				if (!(next->ops &
+					DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
+					limit = list_prev_entry(next, chain_node);
+					break;
+				}
+			}
+
+			list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
+				if (next == iter)
+					break;
+
+				if (next->funcs->pre_enable)
+					next->funcs->pre_enable(next);
+			}
+		}
+
 		if (iter->funcs->pre_enable)
 			iter->funcs->pre_enable(iter);
 
+		if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
+			iter = limit;
+
 		if (iter == bridge)
 			break;
 	}
@@ -667,6 +735,25 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
+static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
+						struct drm_atomic_state *old_state)
+{
+	if (bridge->funcs->atomic_post_disable) {
+		struct drm_bridge_state *old_bridge_state;
+
+		old_bridge_state =
+			drm_atomic_get_old_bridge_state(old_state,
+							bridge);
+		if (WARN_ON(!old_bridge_state))
+			return;
+
+		bridge->funcs->atomic_post_disable(bridge,
+						   old_bridge_state);
+	} else if (bridge->funcs->post_disable) {
+		bridge->funcs->post_disable(bridge);
+	}
+}
+
 /**
  * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
  *					  in the encoder chain
@@ -677,6 +764,9 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
  * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
  * starting from the first bridge to the last. These are called after completing
  * &drm_encoder_helper_funcs.atomic_disable
+ * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the post_disable for
+ * that bridge will be called before the previous one to reverse the pre_enable
+ * calling direction.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
@@ -684,30 +774,69 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
+	struct drm_bridge *next, *limit;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
+
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->atomic_post_disable) {
-			struct drm_bridge_state *old_bridge_state;
+		limit = NULL;
+
+		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
+			next = list_next_entry(bridge, chain_node);
+
+			if (next->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
+				limit = next;
+
+				list_for_each_entry_from(next, &encoder->bridge_chain,
+							 chain_node) {
+					if (!(next->ops &
+						DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
+						next = list_prev_entry(next, chain_node);
+						limit = next;
+						break;
+					}
+				}
+
+				list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
+								 chain_node) {
+					if (next == bridge)
+						break;
+
+					drm_atomic_bridge_call_post_disable(next,
+									    old_state);
+				}
+			}
+		}
 
-			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
-								bridge);
-			if (WARN_ON(!old_bridge_state))
-				return;
+		drm_atomic_bridge_call_post_disable(bridge, old_state);
 
-			bridge->funcs->atomic_post_disable(bridge,
-							   old_bridge_state);
-		} else if (bridge->funcs->post_disable) {
-			bridge->funcs->post_disable(bridge);
-		}
+		if (limit)
+			bridge = limit;
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
 
+static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
+					      struct drm_atomic_state *old_state)
+{
+	if (bridge->funcs->atomic_pre_enable) {
+		struct drm_bridge_state *old_bridge_state;
+
+		old_bridge_state =
+			drm_atomic_get_old_bridge_state(old_state,
+							bridge);
+		if (WARN_ON(!old_bridge_state))
+			return;
+
+		bridge->funcs->atomic_pre_enable(bridge, old_bridge_state);
+	} else if (bridge->funcs->pre_enable) {
+		bridge->funcs->pre_enable(bridge);
+	}
+}
+
 /**
  * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
  *					the encoder chain
@@ -718,6 +847,8 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
  * &drm_bridge_funcs.pre_enable) op for all the bridges in the encoder chain,
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_enable
+ * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
+ * the previous bridge will be called before pre_enable of this bridge.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
@@ -725,26 +856,42 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 					struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
+	struct drm_bridge *iter, *next, *limit;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
+
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->atomic_pre_enable) {
-			struct drm_bridge_state *old_bridge_state;
+		if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
+			next = iter;
+			limit = bridge;
+			list_for_each_entry_from_reverse(next,
+							 &encoder->bridge_chain,
+							 chain_node) {
+				if (next == bridge)
+					break;
+
+				if (!(next->ops &
+					DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
+					limit = list_prev_entry(next, chain_node);
+					break;
+				}
+			}
+
+			list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
+				if (next == iter)
+					break;
+
+				drm_atomic_bridge_call_pre_enable(next, old_state);
+			}
+		}
 
-			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
-								iter);
-			if (WARN_ON(!old_bridge_state))
-				return;
+		drm_atomic_bridge_call_pre_enable(iter, old_state);
 
-			iter->funcs->atomic_pre_enable(iter, old_bridge_state);
-		} else if (iter->funcs->pre_enable) {
-			iter->funcs->pre_enable(iter);
-		}
+		if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
+			iter = limit;
 
 		if (iter == bridge)
 			break;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index f27b4060faa2..523ec9d8f3f8 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -725,6 +725,14 @@ enum drm_bridge_ops {
 	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
 	 */
 	DRM_BRIDGE_OP_MODES = BIT(3),
+	/**
+	 * @DRM_BRIDGE_OP_UPSTREAM_FIRST: The bridge can requires
+	 * that the upstream node pre_enable is called before its pre_enable,
+	 * and conversely for post_disables. This is most frequently a
+	 * requirement for DSI devices which need the host to be initialised
+	 * before them.
+	 */
+	DRM_BRIDGE_OP_UPSTREAM_FIRST = BIT(4),
 };
 
 /**
-- 
2.7.4

