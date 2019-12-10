Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F211881D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDB66E8D5;
	Tue, 10 Dec 2019 12:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6706E8D5;
 Tue, 10 Dec 2019 12:31:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:32 -0800
X-IronPort-AV: E=Sophos;i="5.69,299,1571727600"; d="scan'208";a="363250052"
Received: from orilivne-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.68])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/atomic: convert to drm device based logging
Date: Tue, 10 Dec 2019 14:30:48 +0200
Message-Id: <20191210123050.8799-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210123050.8799-1-jani.nikula@intel.com>
References: <20191210123050.8799-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer drm_dbg_atomic().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_agpsupport.c |   4 +-
 drivers/gpu/drm/drm_atomic.c     | 187 +++++++++++++++++--------------
 2 files changed, 102 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
index 4c7ad46fdd21..cd675e58de50 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -330,8 +330,8 @@ int drm_agp_bind(struct drm_device *dev, struct drm_agp_binding *request)
 	if (retcode)
 		return retcode;
 	entry->bound = dev->agp->base + (page << PAGE_SHIFT);
-	DRM_DEBUG("base = 0x%lx entry->bound = 0x%lx\n",
-		  dev->agp->base, entry->bound);
+	drm_dbg_core(dev, "base = 0x%lx entry->bound = 0x%lx\n",
+		     dev->agp->base, entry->bound);
 	return 0;
 }
 EXPORT_SYMBOL(drm_agp_bind);
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 14aeaf736321..8494b1c29bf0 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -99,7 +99,7 @@ drm_atomic_state_init(struct drm_device *dev, struct drm_atomic_state *state)
 
 	state->dev = dev;
 
-	DRM_DEBUG_ATOMIC("Allocated atomic state %p\n", state);
+	drm_dbg_atomic(dev, "Allocated atomic state %p\n", state);
 
 	return 0;
 fail:
@@ -150,7 +150,7 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 	struct drm_mode_config *config = &dev->mode_config;
 	int i;
 
-	DRM_DEBUG_ATOMIC("Clearing atomic state %p\n", state);
+	drm_dbg_atomic(dev, "Clearing atomic state %p\n", state);
 
 	for (i = 0; i < state->num_connector; i++) {
 		struct drm_connector *connector = state->connectors[i].ptr;
@@ -256,11 +256,12 @@ EXPORT_SYMBOL(drm_atomic_state_clear);
 void __drm_atomic_state_free(struct kref *ref)
 {
 	struct drm_atomic_state *state = container_of(ref, typeof(*state), ref);
-	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_device *dev = state->dev;
+	struct drm_mode_config *config = &dev->mode_config;
 
 	drm_atomic_state_clear(state);
 
-	DRM_DEBUG_ATOMIC("Freeing atomic state %p\n", state);
+	drm_dbg_atomic(dev, "Freeing atomic state %p\n", state);
 
 	if (config->funcs->atomic_state_free) {
 		config->funcs->atomic_state_free(state);
@@ -290,8 +291,9 @@ struct drm_crtc_state *
 drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 			  struct drm_crtc *crtc)
 {
-	int ret, index = drm_crtc_index(crtc);
+	struct drm_device *dev = state->dev;
 	struct drm_crtc_state *crtc_state;
+	int ret, index = drm_crtc_index(crtc);
 
 	WARN_ON(!state->acquire_ctx);
 
@@ -313,8 +315,8 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 	state->crtcs[index].ptr = crtc;
 	crtc_state->state = state;
 
-	DRM_DEBUG_ATOMIC("Added [CRTC:%d:%s] %p state to %p\n",
-			 crtc->base.id, crtc->name, crtc_state, state);
+	drm_dbg_atomic(dev, "Added [CRTC:%d:%s] %p state to %p\n",
+		       crtc->base.id, crtc->name, crtc_state, state);
 
 	return crtc_state;
 }
@@ -324,6 +326,7 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 				 const struct drm_crtc_state *new_crtc_state)
 {
 	struct drm_crtc *crtc = new_crtc_state->crtc;
+	struct drm_device *dev = crtc->dev;
 
 	/* NOTE: we explicitly don't enforce constraints such as primary
 	 * layer covering entire screen, since that is something we want
@@ -334,25 +337,25 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 	 */
 
 	if (new_crtc_state->active && !new_crtc_state->enable) {
-		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] active without enabled\n",
-				 crtc->base.id, crtc->name);
+		drm_dbg_atomic(dev, "[CRTC:%d:%s] active without enabled\n",
+			       crtc->base.id, crtc->name);
 		return -EINVAL;
 	}
 
 	/* The state->enable vs. state->mode_blob checks can be WARN_ON,
 	 * as this is a kernel-internal detail that userspace should never
 	 * be able to trigger. */
-	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
+	if (drm_core_check_feature(dev, DRIVER_ATOMIC) &&
 	    WARN_ON(new_crtc_state->enable && !new_crtc_state->mode_blob)) {
-		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] enabled without mode blob\n",
-				 crtc->base.id, crtc->name);
+		drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled without mode blob\n",
+			       crtc->base.id, crtc->name);
 		return -EINVAL;
 	}
 
-	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
+	if (drm_core_check_feature(dev, DRIVER_ATOMIC) &&
 	    WARN_ON(!new_crtc_state->enable && new_crtc_state->mode_blob)) {
-		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] disabled with mode blob\n",
-				 crtc->base.id, crtc->name);
+		drm_dbg_atomic(dev, "[CRTC:%d:%s] disabled with mode blob\n",
+			       crtc->base.id, crtc->name);
 		return -EINVAL;
 	}
 
@@ -368,8 +371,8 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 	 */
 	if (new_crtc_state->event &&
 	    !new_crtc_state->active && !old_crtc_state->active) {
-		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] requesting event but off\n",
-				 crtc->base.id, crtc->name);
+		drm_dbg_atomic(dev, "[CRTC:%d:%s] requesting event but off\n",
+			       crtc->base.id, crtc->name);
 		return -EINVAL;
 	}
 
@@ -402,6 +405,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
 static int drm_atomic_connector_check(struct drm_connector *connector,
 		struct drm_connector_state *state)
 {
+	struct drm_device *dev = connector->dev;
 	struct drm_crtc_state *crtc_state;
 	struct drm_writeback_job *writeback_job = state->writeback_job;
 	const struct drm_display_info *info = &connector->display_info;
@@ -414,8 +418,8 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 		return 0;
 
 	if (writeback_job->fb && !state->crtc) {
-		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] framebuffer without CRTC\n",
-				 connector->base.id, connector->name);
+		drm_dbg_atomic(dev, "[CONNECTOR:%d:%s] framebuffer without CRTC\n",
+			       connector->base.id, connector->name);
 		return -EINVAL;
 	}
 
@@ -424,16 +428,16 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 								state->crtc);
 
 	if (writeback_job->fb && !crtc_state->active) {
-		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] has framebuffer, but [CRTC:%d] is off\n",
-				 connector->base.id, connector->name,
-				 state->crtc->base.id);
+		drm_dbg_atomic(dev, "[CONNECTOR:%d:%s] has framebuffer, but [CRTC:%d] is off\n",
+			       connector->base.id, connector->name,
+			       state->crtc->base.id);
 		return -EINVAL;
 	}
 
 	if (!writeback_job->fb) {
 		if (writeback_job->out_fence) {
-			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] requesting out-fence without framebuffer\n",
-					 connector->base.id, connector->name);
+			drm_dbg_atomic(dev, "[CONNECTOR:%d:%s] requesting out-fence without framebuffer\n",
+				       connector->base.id, connector->name);
 			return -EINVAL;
 		}
 
@@ -463,8 +467,9 @@ struct drm_plane_state *
 drm_atomic_get_plane_state(struct drm_atomic_state *state,
 			  struct drm_plane *plane)
 {
-	int ret, index = drm_plane_index(plane);
+	struct drm_device *dev = state->dev;
 	struct drm_plane_state *plane_state;
+	int ret, index = drm_plane_index(plane);
 
 	WARN_ON(!state->acquire_ctx);
 
@@ -491,8 +496,8 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 	state->planes[index].new_state = plane_state;
 	plane_state->state = state;
 
-	DRM_DEBUG_ATOMIC("Added [PLANE:%d:%s] %p state to %p\n",
-			 plane->base.id, plane->name, plane_state, state);
+	drm_dbg_atomic(dev, "Added [PLANE:%d:%s] %p state to %p\n",
+		       plane->base.id, plane->name, plane_state, state);
 
 	if (plane_state->crtc) {
 		struct drm_crtc_state *crtc_state;
@@ -539,6 +544,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 				  const struct drm_plane_state *new_plane_state)
 {
 	struct drm_plane *plane = new_plane_state->plane;
+	struct drm_device *dev = plane->dev;
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	const struct drm_framebuffer *fb = new_plane_state->fb;
 	unsigned int fb_width, fb_height;
@@ -548,12 +554,12 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 
 	/* either *both* CRTC and FB must be set, or neither */
 	if (crtc && !fb) {
-		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] CRTC set but no FB\n",
-				 plane->base.id, plane->name);
+		drm_dbg_atomic(dev, "[PLANE:%d:%s] CRTC set but no FB\n",
+			       plane->base.id, plane->name);
 		return -EINVAL;
 	} else if (fb && !crtc) {
-		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] FB set but no CRTC\n",
-				 plane->base.id, plane->name);
+		drm_dbg_atomic(dev, "[PLANE:%d:%s] FB set but no CRTC\n",
+			       plane->base.id, plane->name);
 		return -EINVAL;
 	}
 
@@ -563,9 +569,9 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 
 	/* Check whether this plane is usable on this CRTC */
 	if (!(plane->possible_crtcs & drm_crtc_mask(crtc))) {
-		DRM_DEBUG_ATOMIC("Invalid [CRTC:%d:%s] for [PLANE:%d:%s]\n",
-				 crtc->base.id, crtc->name,
-				 plane->base.id, plane->name);
+		drm_dbg_atomic(dev, "Invalid [CRTC:%d:%s] for [PLANE:%d:%s]\n",
+			       crtc->base.id, crtc->name,
+			       plane->base.id, plane->name);
 		return -EINVAL;
 	}
 
@@ -574,11 +580,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 					   fb->modifier);
 	if (ret) {
 		struct drm_format_name_buf format_name;
-		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid pixel format %s, modifier 0x%llx\n",
-				 plane->base.id, plane->name,
-				 drm_get_format_name(fb->format->format,
-						     &format_name),
-				 fb->modifier);
+		drm_dbg_atomic(dev, "[PLANE:%d:%s] invalid pixel format %s, modifier 0x%llx\n",
+			       plane->base.id, plane->name,
+			       drm_get_format_name(fb->format->format,
+						   &format_name),
+			       fb->modifier);
 		return ret;
 	}
 
@@ -587,10 +593,10 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	    new_plane_state->crtc_x > INT_MAX - (int32_t) new_plane_state->crtc_w ||
 	    new_plane_state->crtc_h > INT_MAX ||
 	    new_plane_state->crtc_y > INT_MAX - (int32_t) new_plane_state->crtc_h) {
-		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid CRTC coordinates %ux%u+%d+%d\n",
-				 plane->base.id, plane->name,
-				 new_plane_state->crtc_w, new_plane_state->crtc_h,
-				 new_plane_state->crtc_x, new_plane_state->crtc_y);
+		drm_dbg_atomic(dev, "[PLANE:%d:%s] invalid CRTC coordinates %ux%u+%d+%d\n",
+			       plane->base.id, plane->name,
+			       new_plane_state->crtc_w, new_plane_state->crtc_h,
+			       new_plane_state->crtc_x, new_plane_state->crtc_y);
 		return -ERANGE;
 	}
 
@@ -602,18 +608,18 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
 	    new_plane_state->src_h > fb_height ||
 	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
-		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid source coordinates "
-				 "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
-				 plane->base.id, plane->name,
-				 new_plane_state->src_w >> 16,
-				 ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
-				 new_plane_state->src_h >> 16,
-				 ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
-				 new_plane_state->src_x >> 16,
-				 ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
-				 new_plane_state->src_y >> 16,
-				 ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
-				 fb->width, fb->height);
+		drm_dbg_atomic(dev, "[PLANE:%d:%s] invalid source coordinates "
+			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
+			       plane->base.id, plane->name,
+			       new_plane_state->src_w >> 16,
+			       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
+			       new_plane_state->src_h >> 16,
+			       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
+			       new_plane_state->src_x >> 16,
+			       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
+			       new_plane_state->src_y >> 16,
+			       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
+			       fb->width, fb->height);
 		return -ENOSPC;
 	}
 
@@ -628,9 +634,9 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		    clips->y1 < 0 ||
 		    clips->x2 > fb_width ||
 		    clips->y2 > fb_height) {
-			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
-					 plane->base.id, plane->name, clips->x1,
-					 clips->y1, clips->x2, clips->y2);
+			drm_dbg_atomic(dev, "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
+				       plane->base.id, plane->name, clips->x1,
+				       clips->y1, clips->x2, clips->y2);
 			return -EINVAL;
 		}
 		clips++;
@@ -638,8 +644,8 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	}
 
 	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
-		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] switching CRTC directly\n",
-				 plane->base.id, plane->name);
+		drm_dbg_atomic(dev, "[PLANE:%d:%s] switching CRTC directly\n",
+			       plane->base.id, plane->name);
 		return -EINVAL;
 	}
 
@@ -766,6 +772,7 @@ struct drm_private_state *
 drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 				 struct drm_private_obj *obj)
 {
+	struct drm_device *dev = state->dev;
 	int index, num_objs, i, ret;
 	size_t size;
 	struct __drm_private_objs_state *arr;
@@ -801,8 +808,8 @@ drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 
 	state->num_private_objs = num_objs;
 
-	DRM_DEBUG_ATOMIC("Added new private object %p state %p to %p\n",
-			 obj, obj_state, state);
+	drm_dbg_atomic(dev, "Added new private object %p state %p to %p\n",
+		       obj, obj_state, state);
 
 	return obj_state;
 }
@@ -940,6 +947,7 @@ struct drm_connector_state *
 drm_atomic_get_connector_state(struct drm_atomic_state *state,
 			  struct drm_connector *connector)
 {
+	struct drm_device *dev = state->dev;
 	int ret, index;
 	struct drm_mode_config *config = &connector->dev->mode_config;
 	struct drm_connector_state *connector_state;
@@ -981,9 +989,9 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 	state->connectors[index].ptr = connector;
 	connector_state->state = state;
 
-	DRM_DEBUG_ATOMIC("Added [CONNECTOR:%d:%s] %p state to %p\n",
-			 connector->base.id, connector->name,
-			 connector_state, state);
+	drm_dbg_atomic(dev, "Added [CONNECTOR:%d:%s] %p state to %p\n",
+		       connector->base.id, connector->name,
+		       connector_state, state);
 
 	if (connector_state->crtc) {
 		struct drm_crtc_state *crtc_state;
@@ -1036,7 +1044,8 @@ int
 drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 				   struct drm_crtc *crtc)
 {
-	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_device *dev = state->dev;
+	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_connector_list_iter conn_iter;
@@ -1051,8 +1060,8 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 	if (ret)
 		return ret;
 
-	DRM_DEBUG_ATOMIC("Adding all current connectors for [CRTC:%d:%s] to %p\n",
-			 crtc->base.id, crtc->name, state);
+	drm_dbg_atomic(dev, "Adding all current connectors for [CRTC:%d:%s] to %p\n",
+		       crtc->base.id, crtc->name, state);
 
 	/*
 	 * Changed connectors are already in @state, so only need to look
@@ -1099,14 +1108,15 @@ int
 drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 			       struct drm_crtc *crtc)
 {
+	struct drm_device *dev = state->dev;
 	const struct drm_crtc_state *old_crtc_state =
 		drm_atomic_get_old_crtc_state(state, crtc);
 	struct drm_plane *plane;
 
 	WARN_ON(!drm_atomic_get_new_crtc_state(state, crtc));
 
-	DRM_DEBUG_ATOMIC("Adding all current planes for [CRTC:%d:%s] to %p\n",
-			 crtc->base.id, crtc->name, state);
+	drm_dbg_atomic(dev, "Adding all current planes for [CRTC:%d:%s] to %p\n",
+		       crtc->base.id, crtc->name, state);
 
 	drm_for_each_plane_mask(plane, state->dev, old_crtc_state->plane_mask) {
 		struct drm_plane_state *plane_state =
@@ -1144,13 +1154,13 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 	struct drm_connector_state *conn_state;
 	int i, ret = 0;
 
-	DRM_DEBUG_ATOMIC("checking %p\n", state);
+	drm_dbg_atomic(dev, "checking %p\n", state);
 
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
 		if (ret) {
-			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] atomic core check failed\n",
-					 plane->base.id, plane->name);
+			drm_dbg_atomic(dev, "[PLANE:%d:%s] atomic core check failed\n",
+				       plane->base.id, plane->name);
 			return ret;
 		}
 	}
@@ -1158,8 +1168,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		ret = drm_atomic_crtc_check(old_crtc_state, new_crtc_state);
 		if (ret) {
-			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] atomic core check failed\n",
-					 crtc->base.id, crtc->name);
+			drm_dbg_atomic(dev, "[CRTC:%d:%s] atomic core check failed\n",
+				       crtc->base.id, crtc->name);
 			return ret;
 		}
 	}
@@ -1167,8 +1177,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 	for_each_new_connector_in_state(state, conn, conn_state, i) {
 		ret = drm_atomic_connector_check(conn, conn_state);
 		if (ret) {
-			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] atomic core check failed\n",
-					 conn->base.id, conn->name);
+			drm_dbg_atomic(dev, "[CONNECTOR:%d:%s] atomic core check failed\n",
+				       conn->base.id, conn->name);
 			return ret;
 		}
 	}
@@ -1177,8 +1187,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 		ret = config->funcs->atomic_check(state->dev, state);
 
 		if (ret) {
-			DRM_DEBUG_ATOMIC("atomic driver check for %p failed: %d\n",
-					 state, ret);
+			drm_dbg_atomic(dev, "atomic driver check for %p failed: %d\n",
+				       state, ret);
 			return ret;
 		}
 	}
@@ -1186,8 +1196,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 	if (!state->allow_modeset) {
 		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
-				DRM_DEBUG_ATOMIC("[CRTC:%d:%s] requires full modeset\n",
-						 crtc->base.id, crtc->name);
+				drm_dbg_atomic(dev, "[CRTC:%d:%s] requires full modeset\n",
+					       crtc->base.id, crtc->name);
 				return -EINVAL;
 			}
 		}
@@ -1213,14 +1223,15 @@ EXPORT_SYMBOL(drm_atomic_check_only);
  */
 int drm_atomic_commit(struct drm_atomic_state *state)
 {
-	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_device *dev = state->dev;
+	struct drm_mode_config *config = &dev->mode_config;
 	int ret;
 
 	ret = drm_atomic_check_only(state);
 	if (ret)
 		return ret;
 
-	DRM_DEBUG_ATOMIC("committing %p\n", state);
+	drm_dbg_atomic(dev, "committing %p\n", state);
 
 	return config->funcs->atomic_commit(state->dev, state, false);
 }
@@ -1242,14 +1253,15 @@ EXPORT_SYMBOL(drm_atomic_commit);
  */
 int drm_atomic_nonblocking_commit(struct drm_atomic_state *state)
 {
-	struct drm_mode_config *config = &state->dev->mode_config;
+	struct drm_device *dev = state->dev;
+	struct drm_mode_config *config = &dev->mode_config;
 	int ret;
 
 	ret = drm_atomic_check_only(state);
 	if (ret)
 		return ret;
 
-	DRM_DEBUG_ATOMIC("committing %p nonblocking\n", state);
+	drm_dbg_atomic(dev, "committing %p nonblocking\n", state);
 
 	return config->funcs->atomic_commit(state->dev, state, true);
 }
@@ -1425,7 +1437,8 @@ EXPORT_SYMBOL(__drm_atomic_helper_set_config);
 
 void drm_atomic_print_state(const struct drm_atomic_state *state)
 {
-	struct drm_printer p = drm_info_printer(state->dev->dev);
+	struct drm_device *dev = state->dev;
+	struct drm_printer p = drm_info_printer(dev->dev);
 	struct drm_plane *plane;
 	struct drm_plane_state *plane_state;
 	struct drm_crtc *crtc;
@@ -1434,7 +1447,7 @@ void drm_atomic_print_state(const struct drm_atomic_state *state)
 	struct drm_connector_state *connector_state;
 	int i;
 
-	DRM_DEBUG_ATOMIC("checking %p\n", state);
+	drm_dbg_atomic(dev, "checking %p\n", state);
 
 	for_each_new_plane_in_state(state, plane, plane_state, i)
 		drm_atomic_plane_print_state(&p, plane_state);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
