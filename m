Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7AB1313AE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 15:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D9C6E047;
	Mon,  6 Jan 2020 14:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83C26E047
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 14:34:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so15488846wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 06:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R9AsflB95eipuMN97gQBIzrK504tnqgVKaCY3iN3qQA=;
 b=LDJvgEF3+pbKtuvn/ZgOiu9s3gsMpkVpKd4jLz8tJaDHyD7S+ZFCXTEV1TQ0u4A9rk
 F00QDIFvpFA7Hy2h+ZhX0FYL3MvFu1VEahdJW6Ea8I18D/5PLfKVizyDLBkmwhEwF4Ct
 cEqrWglTCfH7k1ohPhuS9i0VvzhI9YEbDZFIcOW21N7WtI5ZEE8Wny6algWtWcoSzQh/
 G+t39T2frgDOWmbdDkjGCOg6imVvvfj22XIMQVuiyStH0ZWJz2WwIV0F38A+WuVU2CCZ
 /H3IO9kzH7sJU9TivHtwcGBdwxN4U4MayUP9tS0wdh7jinUcnEqYY8KbK1SkTqbUzYGH
 rJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R9AsflB95eipuMN97gQBIzrK504tnqgVKaCY3iN3qQA=;
 b=JR4PJfFd+PErDUWmTFslKeExdWKRDNanlr+Y/wRkeGEvfuRSfXHs/GeptYESzxTcAj
 ZAkkzQPjDUbADSAatLX833zF6z6lwbzyuku2oKvE4GZsOokYiEESOIleLUQe5uKLpR1X
 ly9AhcBZds5mrMGQN+PDXFpCNKzdT4c6Uqo6t1htFrO52we3pFIhfeIcMqsqnhvtOs4C
 lYQsi2cFWn0zoC8ytvz5gEnt5pYPXr9xcQigh2Hp1P1SREQaU1PX1g5owdP9CCbIG61v
 LoyvYhWgYkfDxDX3DZ80lce5ve0nCQ3o4uJu8CbvwTW8oQ0+qB8MKAmTzhuNtIbTq8+Q
 2O4Q==
X-Gm-Message-State: APjAAAWqiN+I482WKtopnTawA1khk/lPyPeSI4uqaB9hKMSzWM5Hf/Da
 jSwh0HyZkeIQGOLkZ+6ryNKRbmfwV4bgyQ==
X-Google-Smtp-Source: APXvYqxAoadpXw0m9oUObe2lpfC6viLNMsbRH0esIM3ltJRc+dTymfD21dt27wG+YFbRlUlXgLg8QQ==
X-Received: by 2002:a1c:81ce:: with SMTP id c197mr35136282wmd.96.1578321255927; 
 Mon, 06 Jan 2020 06:34:15 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v17sm73297659wrt.91.2020.01.06.06.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 06:34:15 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/4] drm/bridge: Add a drm_bridge_state object
Date: Mon,  6 Jan 2020 15:34:06 +0100
Message-Id: <20200106143409.32321-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200106143409.32321-1-narmstrong@baylibre.com>
References: <20200106143409.32321-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Boris Brezillon <boris.brezillon@collabora.com>

One of the last remaining objects to not have its atomic state.

This is being motivated by our attempt to support runtime bus-format
negotiation between elements of the bridge chain.
This patch just paves the road for such a feature by adding a new
drm_bridge_state object inheriting from drm_private_obj so we can
re-use some of the existing state initialization/tracking logic.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes in v6:
* Made helpers private, removed doc and moved them to satisfy dependencies
* Renamed helpers to _default_

Changes in v5:
* Re-introduced the helpers from v4

Changes in v4:
* Fix the doc
* Kill default helpers (inlined)
* Fix drm_atomic_get_bridge_state() to check for an ERR_PTR()
* Add Neil's R-b

Changes in v3:
* None

Changes in v2:
* Use drm_for_each_bridge_in_chain()
* Rename helpers to be more consistent with the rest of the DRM API
* Improve/fix the doc
---
 drivers/gpu/drm/drm_atomic.c        |  39 ++++++++
 drivers/gpu/drm/drm_atomic_helper.c |  20 ++++
 drivers/gpu/drm/drm_bridge.c        | 139 ++++++++++++++++++++++++++--
 include/drm/drm_atomic.h            |   3 +
 include/drm/drm_bridge.h            | 114 +++++++++++++++++++++++
 5 files changed, 309 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index d33691512a8e..bf1b9c37d515 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -30,6 +30,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_uapi.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -1017,6 +1018,44 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 		connector->funcs->atomic_print_state(p, state);
 }
 
+/**
+ * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
+ * @state: atomic state
+ * @encoder: DRM encoder
+ *
+ * This function adds all bridges attached to @encoder. This is needed to add
+ * bridge states to @state and make them available when
+ * &bridge_funcs.atomic_{check,pre_enable,enable,disable_post_disable}() are
+ * called
+ *
+ * Returns:
+ * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
+ * then the w/w mutex code has detected a deadlock and the entire atomic
+ * sequence must be restarted. All other errors are fatal.
+ */
+int
+drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
+			       struct drm_encoder *encoder)
+{
+	struct drm_bridge_state *bridge_state;
+	struct drm_bridge *bridge;
+
+	if (!encoder)
+		return 0;
+
+	DRM_DEBUG_ATOMIC("Adding all bridges for [encoder:%d:%s] to %p\n",
+			 encoder->base.id, encoder->name, state);
+
+	drm_for_each_bridge_in_chain(encoder, bridge) {
+		bridge_state = drm_atomic_get_bridge_state(state, bridge);
+		if (IS_ERR(bridge_state))
+			return PTR_ERR(bridge_state);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_add_encoder_bridges);
+
 /**
  * drm_atomic_add_affected_connectors - add connectors for CRTC
  * @state: atomic state
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 4511c2e07bb9..ad8eae98d9e8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -730,6 +730,26 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			return ret;
 	}
 
+	/*
+	 * Iterate over all connectors again, and add all affected bridges to
+	 * the state.
+	 */
+	for_each_oldnew_connector_in_state(state, connector,
+					   old_connector_state,
+					   new_connector_state, i) {
+		struct drm_encoder *encoder;
+
+		encoder = old_connector_state->best_encoder;
+		ret = drm_atomic_add_encoder_bridges(state, encoder);
+		if (ret)
+			return ret;
+
+		encoder = new_connector_state->best_encoder;
+		ret = drm_atomic_add_encoder_bridges(state, encoder);
+		if (ret)
+			return ret;
+	}
+
 	ret = mode_valid(state);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c2cf0c90fa26..a213c9042f2c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -25,6 +25,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
 
@@ -89,6 +90,74 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_bridge_remove);
 
+static struct drm_bridge_state *
+drm_atomic_default_bridge_duplicate_state(struct drm_bridge *bridge)
+{
+	struct drm_bridge_state *new;
+
+	if (WARN_ON(!bridge->base.state))
+		return NULL;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (new)
+		__drm_atomic_helper_bridge_duplicate_state(bridge, new);
+
+	return new;
+}
+
+static struct drm_private_state *
+drm_bridge_atomic_duplicate_priv_state(struct drm_private_obj *obj)
+{
+	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
+	struct drm_bridge_state *state;
+
+	if (bridge->funcs->atomic_duplicate_state)
+		state = bridge->funcs->atomic_duplicate_state(bridge);
+	else
+		state = drm_atomic_default_bridge_duplicate_state(bridge);
+
+	return state ? &state->base : NULL;
+}
+
+static void
+drm_atomic_default_bridge_destroy_state(struct drm_bridge *bridge,
+					struct drm_bridge_state *state)
+{
+	/* Just a simple kfree() for now */
+	kfree(state);
+}
+
+static void
+drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
+				     struct drm_private_state *s)
+{
+	struct drm_bridge_state *state = drm_priv_to_bridge_state(s);
+	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
+
+	if (bridge->funcs->atomic_destroy_state)
+		bridge->funcs->atomic_destroy_state(bridge, state);
+	else
+		drm_atomic_default_bridge_destroy_state(bridge, state);
+}
+
+static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
+	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
+	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
+};
+
+static struct drm_bridge_state *
+drm_atomic_default_bridge_reset(struct drm_bridge *bridge)
+{
+	struct drm_bridge_state *bridge_state;
+
+	bridge_state = kzalloc(sizeof(*bridge_state), GFP_KERNEL);
+	if (!bridge_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_bridge_reset(bridge, bridge_state);
+	return bridge_state;
+}
+
 /**
  * drm_bridge_attach - attach the bridge to an encoder's chain
  *
@@ -114,6 +183,7 @@ EXPORT_SYMBOL(drm_bridge_remove);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous)
 {
+	struct drm_bridge_state *state;
 	int ret;
 
 	if (!encoder || !bridge)
@@ -135,15 +205,35 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 
 	if (bridge->funcs->attach) {
 		ret = bridge->funcs->attach(bridge);
-		if (ret < 0) {
-			list_del(&bridge->chain_node);
-			bridge->dev = NULL;
-			bridge->encoder = NULL;
-			return ret;
-		}
+		if (ret < 0)
+			goto err_reset_bridge;
 	}
 
+	if (bridge->funcs->atomic_reset)
+		state = bridge->funcs->atomic_reset(bridge);
+	else
+		state = drm_atomic_default_bridge_reset(bridge);
+
+	if (IS_ERR(state)) {
+		ret = PTR_ERR(state);
+		goto err_detach_bridge;
+	}
+
+	drm_atomic_private_obj_init(bridge->dev, &bridge->base,
+				    &state->base,
+				    &drm_bridge_priv_state_funcs);
+
 	return 0;
+
+err_detach_bridge:
+	if (bridge->funcs->detach)
+		bridge->funcs->detach(bridge);
+
+err_reset_bridge:
+	bridge->dev = NULL;
+	bridge->encoder = NULL;
+	list_del(&bridge->chain_node);
+	return ret;
 }
 EXPORT_SYMBOL(drm_bridge_attach);
 
@@ -155,6 +245,8 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (WARN_ON(!bridge->dev))
 		return;
 
+	drm_atomic_private_obj_fini(&bridge->base);
+
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
 
@@ -516,6 +608,41 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
+/**
+ * __drm_atomic_helper_bridge_reset() - Initialize a bridge state to its
+ *					default
+ * @bridge: the bridge this state is refers to
+ * @state: bridge state to initialize
+ *
+ * Initialize the bridge state to default values. This is meant to be* called
+ * by the bridge &drm_plane_funcs.reset hook for bridges that subclass the
+ * bridge state.
+ */
+void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
+				      struct drm_bridge_state *state)
+{
+	memset(state, 0, sizeof(*state));
+	state->bridge = bridge;
+}
+EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
+
+/**
+ * __drm_atomic_helper_bridge_duplicate_state() - Copy atomic bridge state
+ * @bridge: bridge object
+ * @state: atomic bridge state
+ *
+ * Copies atomic state from a bridge's current state and resets inferred values.
+ * This is useful for drivers that subclass the bridge state.
+ */
+void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
+						struct drm_bridge_state *state)
+{
+	__drm_atomic_helper_private_obj_duplicate_state(&bridge->base,
+							&state->base);
+	state->bridge = bridge;
+}
+EXPORT_SYMBOL(__drm_atomic_helper_bridge_duplicate_state);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 951dfb15c27b..ccce65e14917 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -669,6 +669,9 @@ __drm_atomic_get_current_plane_state(struct drm_atomic_state *state,
 	return plane->state;
 }
 
+int __must_check
+drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
+			       struct drm_encoder *encoder);
 int __must_check
 drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 				   struct drm_crtc *crtc);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 694e153a7531..fc7c71f4de55 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -25,6 +25,8 @@
 
 #include <linux/list.h>
 #include <linux/ctype.h>
+
+#include <drm/drm_atomic.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
@@ -33,6 +35,23 @@ struct drm_bridge;
 struct drm_bridge_timings;
 struct drm_panel;
 
+/**
+ * struct drm_bridge_state - Atomic bridge state object
+ * @base: inherit from &drm_private_state
+ * @bridge: the bridge this state refers to
+ */
+struct drm_bridge_state {
+	struct drm_private_state base;
+
+	struct drm_bridge *bridge;
+};
+
+static inline struct drm_bridge_state *
+drm_priv_to_bridge_state(struct drm_private_state *priv)
+{
+	return container_of(priv, struct drm_bridge_state, base);
+}
+
 /**
  * struct drm_bridge_funcs - drm_bridge control functions
  */
@@ -338,6 +357,49 @@ struct drm_bridge_funcs {
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
 				    struct drm_atomic_state *old_state);
+
+	/**
+	 * @atomic_duplicate_state:
+	 *
+	 * Duplicate the current bridge state object (which is guaranteed to be
+	 * non-NULL).
+	 *
+	 * The atomic_duplicate_state() is optional. When not implemented the
+	 * core allocates a drm_bridge_state object and calls
+	 * &__drm_atomic_helper_bridge_duplicate_state() to initialize it.
+	 *
+	 * RETURNS:
+	 * A valid drm_bridge_state object or NULL if the allocation fails.
+	 */
+	struct drm_bridge_state *(*atomic_duplicate_state)(struct drm_bridge *bridge);
+
+	/**
+	 * @atomic_destroy_state:
+	 *
+	 * Destroy a bridge state object previously allocated by
+	 * &drm_bridge_funcs.atomic_duplicate_state().
+	 *
+	 * The atomic_destroy_state hook is optional. When not implemented the
+	 * core calls kfree() on the state.
+	 */
+	void (*atomic_destroy_state)(struct drm_bridge *bridge,
+				     struct drm_bridge_state *state);
+
+	/**
+	 * @atomic_reset:
+	 *
+	 * Reset the bridge to a predefined state (or retrieve its current
+	 * state) and return a &drm_bridge_state object matching this state.
+	 * This function is called at attach time.
+	 *
+	 * The atomic_reset hook is optional. When not implemented the core
+	 * allocates a new state and calls &__drm_atomic_helper_bridge_reset().
+	 *
+	 * RETURNS:
+	 * A valid drm_bridge_state object in case of success, an ERR_PTR()
+	 * giving the reason of the failure otherwise.
+	 */
+	struct drm_bridge_state *(*atomic_reset)(struct drm_bridge *bridge);
 };
 
 /**
@@ -380,6 +442,8 @@ struct drm_bridge_timings {
  * struct drm_bridge - central DRM bridge control structure
  */
 struct drm_bridge {
+	/** @base: inherit from &drm_private_object */
+	struct drm_private_obj base;
 	/** @dev: DRM device this bridge belongs to */
 	struct drm_device *dev;
 	/** @encoder: encoder to which this bridge is connected */
@@ -404,6 +468,12 @@ struct drm_bridge {
 	void *driver_private;
 };
 
+static inline struct drm_bridge *
+drm_priv_to_bridge(struct drm_private_obj *priv)
+{
+	return container_of(priv, struct drm_bridge, base);
+}
+
 void drm_bridge_add(struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
@@ -491,6 +561,50 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state);
 
+void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
+				      struct drm_bridge_state *state);
+void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
+						struct drm_bridge_state *new);
+
+static inline struct drm_bridge_state *
+drm_atomic_get_bridge_state(struct drm_atomic_state *state,
+			    struct drm_bridge *bridge)
+{
+	struct drm_private_state *obj_state;
+
+	obj_state = drm_atomic_get_private_obj_state(state, &bridge->base);
+	if (IS_ERR(obj_state))
+		return ERR_CAST(obj_state);
+
+	return drm_priv_to_bridge_state(obj_state);
+}
+
+static inline struct drm_bridge_state *
+drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
+				struct drm_bridge *bridge)
+{
+	struct drm_private_state *obj_state;
+
+	obj_state = drm_atomic_get_old_private_obj_state(state, &bridge->base);
+	if (!obj_state)
+		return NULL;
+
+	return drm_priv_to_bridge_state(obj_state);
+}
+
+static inline struct drm_bridge_state *
+drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
+				struct drm_bridge *bridge)
+{
+	struct drm_private_state *obj_state;
+
+	obj_state = drm_atomic_get_new_private_obj_state(state, &bridge->base);
+	if (!obj_state)
+		return NULL;
+
+	return drm_priv_to_bridge_state(obj_state);
+}
+
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
 struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
