Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7D52E2210
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 22:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A00F6E884;
	Wed, 23 Dec 2020 21:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F13E89861
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 21:30:04 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net
 [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3B18120002;
 Wed, 23 Dec 2020 21:30:02 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/4] NOTFORMERGE: drm/logicvc: Add plane colorkey support
Date: Wed, 23 Dec 2020 22:29:47 +0100
Message-Id: <20201223212947.160565-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
References: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.h   |   3 +
 drivers/gpu/drm/logicvc/logicvc_layer.c | 150 +++++++++++++++++++++++-
 drivers/gpu/drm/logicvc/logicvc_layer.h |   7 ++
 3 files changed, 154 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.h b/drivers/gpu/drm/logicvc/logicvc_drm.h
index 68bbac6c4ab9..d69a686ab0f1 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.h
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.h
@@ -59,6 +59,9 @@ struct logicvc_drm {
 	struct list_head layers_list;
 	struct logicvc_crtc *crtc;
 	struct logicvc_interface *interface;
+
+	struct drm_property *colorkey_enabled_property;
+	struct drm_property *colorkey_value_property;
 };
 
 #endif
diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 313043d29128..e2c3140926f1 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -23,6 +23,8 @@
 
 #define logicvc_layer(p) \
 	container_of(p, struct logicvc_layer, drm_plane)
+#define logicvc_layer_state(p) \
+	container_of(p, struct logicvc_layer_state, drm_plane_state)
 
 static uint32_t logicvc_layer_formats_rgb16[] = {
 	DRM_FORMAT_RGB565,
@@ -138,6 +140,7 @@ static void logicvc_plane_atomic_update(struct drm_plane *drm_plane,
 	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
 	struct drm_device *drm_dev = &logicvc->drm_dev;
 	struct drm_plane_state *state = drm_plane->state;
+	struct logicvc_layer_state *layer_state = logicvc_layer_state(state);
 	struct drm_crtc *drm_crtc = &logicvc->crtc->drm_crtc;
 	struct drm_display_mode *mode = &drm_crtc->state->adjusted_mode;
 	struct drm_framebuffer *fb = state->fb;
@@ -214,6 +217,15 @@ static void logicvc_plane_atomic_update(struct drm_plane *drm_plane,
 			     alpha);
 	}
 
+	/* Layer colorkey */
+
+	if (layer_state->colorkey_enabled) {
+		reg = layer_state->colorkey_value;
+
+		regmap_write(logicvc->regmap,
+			     LOGICVC_LAYER_COLOR_KEY_REG(index), reg);
+	}
+
 	/* Layer control */
 
 	reg = LOGICVC_LAYER_CTRL_ENABLE;
@@ -221,7 +233,8 @@ static void logicvc_plane_atomic_update(struct drm_plane *drm_plane,
 	if (logicvc_layer_format_inverted(fb->format->format))
 		reg |= LOGICVC_LAYER_CTRL_PIXEL_FORMAT_INVERT;
 
-	reg |= LOGICVC_LAYER_CTRL_COLOR_KEY_DISABLE;
+	if (!layer_state->colorkey_enabled)
+		reg |= LOGICVC_LAYER_CTRL_COLOR_KEY_DISABLE;
 
 	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), reg);
 }
@@ -242,13 +255,109 @@ static struct drm_plane_helper_funcs logicvc_plane_helper_funcs = {
 	.atomic_disable		= logicvc_plane_atomic_disable,
 };
 
+static void logicvc_plane_reset(struct drm_plane *drm_plane)
+{
+	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
+	struct device *dev = logicvc->drm_dev.dev;
+	struct logicvc_layer_state *layer_state;
+
+	if (drm_plane->state) {
+		layer_state = logicvc_layer_state(drm_plane->state);
+		__drm_atomic_helper_plane_destroy_state(drm_plane->state);
+		devm_kfree(dev, layer_state);
+		drm_plane->state = NULL;
+	}
+
+	layer_state = devm_kzalloc(dev, sizeof(*layer_state), GFP_KERNEL);
+	if (!layer_state)
+		return;
+
+	__drm_atomic_helper_plane_reset(drm_plane,
+					&layer_state->drm_plane_state);
+}
+
+static struct drm_plane_state *
+logicvc_plane_atomic_duplicate_state(struct drm_plane *drm_plane)
+{
+	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
+	struct device *dev = logicvc->drm_dev.dev;
+	struct logicvc_layer_state *layer_state_current;
+	struct logicvc_layer_state *layer_state;
+
+	if (WARN_ON(!drm_plane->state))
+		return NULL;
+
+	layer_state_current = logicvc_layer_state(drm_plane->state);
+	layer_state = devm_kzalloc(dev, sizeof(*layer_state), GFP_KERNEL);
+	if (!layer_state)
+		return NULL;
+
+	layer_state->colorkey_enabled = layer_state_current->colorkey_enabled;
+	layer_state->colorkey_value = layer_state_current->colorkey_value;
+
+	__drm_atomic_helper_plane_duplicate_state(drm_plane,
+						  &layer_state->drm_plane_state);
+
+	return &layer_state->drm_plane_state;
+}
+
+static void logicvc_plane_destroy_state(struct drm_plane *drm_plane,
+					struct drm_plane_state *state)
+{
+	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
+	struct device *dev = logicvc->drm_dev.dev;
+	struct logicvc_layer_state *layer_state = logicvc_layer_state(state);
+
+	__drm_atomic_helper_plane_destroy_state(&layer_state->drm_plane_state);
+
+	devm_kfree(dev, layer_state);
+}
+
+static int logicvc_plane_atomic_set_property(struct drm_plane *drm_plane,
+					     struct drm_plane_state *state,
+					     struct drm_property *property,
+					     uint64_t value)
+{
+	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
+	struct logicvc_layer_state *layer_state = logicvc_layer_state(state);
+
+	if (property == logicvc->colorkey_enabled_property)
+		layer_state->colorkey_enabled = !!value;
+	else if (property == logicvc->colorkey_value_property)
+		layer_state->colorkey_value = (uint32_t)value;
+	else
+		return -ENOENT;
+
+	return 0;
+}
+
+static int logicvc_plane_atomic_get_property(struct drm_plane *drm_plane,
+					     const struct drm_plane_state *state,
+					     struct drm_property *property,
+					     uint64_t *value)
+{
+	struct logicvc_drm *logicvc = logicvc_drm(drm_plane->dev);
+	struct logicvc_layer_state *layer_state = logicvc_layer_state(state);
+
+	if (property == logicvc->colorkey_enabled_property)
+		*value = layer_state->colorkey_enabled;
+	else if (property == logicvc->colorkey_value_property)
+		*value = layer_state->colorkey_value;
+	else
+		return -ENOENT;
+
+	return 0;
+}
+
 static const struct drm_plane_funcs logicvc_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.destroy		= drm_plane_cleanup,
-	.reset			= drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.reset			= logicvc_plane_reset,
+	.atomic_duplicate_state	= logicvc_plane_atomic_duplicate_state,
+	.atomic_destroy_state	= logicvc_plane_destroy_state,
+	.atomic_set_property	= logicvc_plane_atomic_set_property,
+	.atomic_get_property	= logicvc_plane_atomic_get_property,
 };
 
 int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
@@ -345,7 +454,8 @@ int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
 	return 0;
 }
 
-static struct logicvc_layer_formats *logicvc_layer_formats_lookup(struct logicvc_layer *layer)
+static struct logicvc_layer_formats *
+logicvc_layer_formats_lookup(struct logicvc_layer *layer)
 {
 	bool alpha;
 	unsigned int i = 0;
@@ -364,7 +474,8 @@ static struct logicvc_layer_formats *logicvc_layer_formats_lookup(struct logicvc
 	return NULL;
 }
 
-static unsigned int logicvc_layer_formats_count(struct logicvc_layer_formats *formats)
+static unsigned int
+logicvc_layer_formats_count(struct logicvc_layer_formats *formats)
 {
 	unsigned int count = 0;
 
@@ -533,6 +644,11 @@ static int logicvc_layer_init(struct logicvc_drm *logicvc,
 
 	drm_plane_create_zpos_immutable_property(&layer->drm_plane, zpos);
 
+	drm_object_attach_property(&layer->drm_plane.base,
+				   logicvc->colorkey_enabled_property, 0);
+	drm_object_attach_property(&layer->drm_plane.base,
+				   logicvc->colorkey_value_property, 0);
+
 	drm_dbg_kms(drm_dev, "Registering layer #%d\n", index);
 
 	layer->formats = formats;
@@ -581,6 +697,17 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
 	struct logicvc_layer *next;
 	int ret = 0;
 
+	logicvc->colorkey_enabled_property =
+		drm_property_create_bool(drm_dev, 0, "colorkey_enabled");
+	if (!logicvc->colorkey_enabled_property)
+		goto error;
+
+	logicvc->colorkey_value_property =
+		drm_property_create_range(drm_dev, 0, "colorkey_value",
+					  0, 0xffffffff);
+	if (!logicvc->colorkey_value_property)
+		goto error;
+
 	layers_node = of_get_child_by_name(of_node, "layers");
 	if (!layers_node) {
 		drm_err(drm_dev, "No layers node found in the description\n");
@@ -620,5 +747,16 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
 	list_for_each_entry_safe(layer, next, &logicvc->layers_list, list)
 		logicvc_layer_fini(logicvc, layer);
 
+	if (logicvc->colorkey_value_property) {
+		drm_property_destroy(drm_dev, logicvc->colorkey_value_property);
+		logicvc->colorkey_value_property = NULL;
+	}
+
+	if (logicvc->colorkey_enabled_property) {
+		drm_property_destroy(drm_dev,
+				     logicvc->colorkey_enabled_property);
+		logicvc->colorkey_enabled_property = NULL;
+	}
+
 	return ret;
 }
diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.h b/drivers/gpu/drm/logicvc/logicvc_layer.h
index c5767c81f446..69bb208ad79c 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.h
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.h
@@ -39,6 +39,13 @@ struct logicvc_layer_formats {
 	uint32_t *formats;
 };
 
+struct logicvc_layer_state {
+	struct drm_plane_state drm_plane_state;
+
+	bool colorkey_enabled;
+	uint32_t colorkey_value;
+};
+
 struct logicvc_layer {
 	struct logicvc_layer_config config;
 	struct logicvc_layer_formats *formats;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
