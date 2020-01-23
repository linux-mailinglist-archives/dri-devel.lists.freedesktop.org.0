Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A9146451
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 10:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835F86FB71;
	Thu, 23 Jan 2020 09:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41E26FB70
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 09:21:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F3885B1EE;
 Thu, 23 Jan 2020 09:21:25 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v4 01/15] drm: Initialize struct drm_crtc_state.no_vblank from
 device settings
Date: Thu, 23 Jan 2020 10:21:09 +0100
Message-Id: <20200123092123.28368-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123092123.28368-1-tzimmermann@suse.de>
References: <20200123092123.28368-1-tzimmermann@suse.de>
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
Cc: xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At the end of a commit, atomic helpers can generate a VBLANK event
automatically. Originally implemented for writeback connectors, the
functionality can be used by any driver and/or hardware without proper
VBLANK interrupt.

The patch updates the documentation to make this behaviour official:
settings struct drm_crtc_state.no_vblank to true enables automatic
VBLANK generation.

The new interface drm_dev_has_vblank() returns true if vblanking has
been initialized for a device, or false otherwise. This function will
be useful when initializing no_vblank in the CRTC state.

Atomic modesetting helper set the initial value of no_vblank in
drm_atomic_helper_check_modeset(). If vblanking has been initialized
for a device, no_blank is disabled. Otherwise it's enabled. Hence,
atomic helpers will automatically send out VBLANK events with any
driver that did not initialize vblanking.

v4:
	* replace drm_crtc_has_vblank() with drm_dev_has_vblank()
	* add drm_dev_crtc_has_vblank() in this patch
	* move driver changes into separate patches
v3:
	* squash all related changes patches into this patch

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 10 +++++++++-
 drivers/gpu/drm/drm_vblank.c        | 28 ++++++++++++++++++++++++++++
 include/drm/drm_crtc.h              | 27 ++++++++++++++++++++-------
 include/drm/drm_simple_kms_helper.h |  7 +++++--
 include/drm/drm_vblank.h            |  1 +
 5 files changed, 63 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 4511c2e07bb9..d7b73cd89b79 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -583,6 +583,7 @@ mode_valid(struct drm_atomic_state *state)
  * &drm_crtc_state.connectors_changed is set when a connector is added or
  * removed from the CRTC.  &drm_crtc_state.active_changed is set when
  * &drm_crtc_state.active changes, which is used for DPMS.
+ * &drm_crtc_state.no_vblank is set from the result of drm_dev_has_vblank().
  * See also: drm_atomic_crtc_needs_modeset()
  *
  * IMPORTANT:
@@ -649,6 +650,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 
 			return -EINVAL;
 		}
+
+		if (drm_dev_has_vblank(dev))
+			new_crtc_state->no_vblank = false;
+		else
+			new_crtc_state->no_vblank = true;
 	}
 
 	ret = handle_conflicting_encoders(state, false);
@@ -2215,7 +2221,9 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_dependencies);
  * when a job is queued, and any change to the pipeline that does not touch the
  * connector is leading to timeouts when calling
  * drm_atomic_helper_wait_for_vblanks() or
- * drm_atomic_helper_wait_for_flip_done().
+ * drm_atomic_helper_wait_for_flip_done(). In addition to writeback
+ * connectors, this function can also fake VBLANK events for CRTCs without
+ * VBLANK interrupt.
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1659b13b178c..433dec6230b1 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -69,6 +69,12 @@
  * &drm_driver.max_vblank_count. In that case the vblank core only disables the
  * vblanks after a timer has expired, which can be configured through the
  * ``vblankoffdelay`` module parameter.
+ *
+ * Drivers for hardware without support for vertical-blanking interrupts
+ * must not call drm_vblank_init(). For such drivers, atomic helpers will
+ * automatically generate vblank events as part of the display update. This
+ * functionality also can be controlled by the driver by enabling and disabling
+ * struct drm_crtc_state.no_vblank.
  */
 
 /* Retry timestamp calculation up to 3 times to satisfy
@@ -501,6 +507,28 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 }
 EXPORT_SYMBOL(drm_vblank_init);
 
+/**
+ * drm_dev_has_vblank - test if vblanking has been initialized for
+ *                      a device
+ * @dev: the device
+ *
+ * Drivers may call this function to test if vblank support is
+ * initialized for a device. For most hardware this means that vblanking
+ * can also be enabled.
+ *
+ * Atomic helpers use this function to initialize
+ * &drm_crtc_state.no_vblank. See also drm_atomic_helper_check_modeset().
+ *
+ * Returns:
+ * True if vblanking has been initialized for the given device, false
+ * otherwise.
+ */
+bool drm_dev_has_vblank(const struct drm_device *dev)
+{
+	return dev->num_crtcs != 0;
+}
+EXPORT_SYMBOL(drm_dev_has_vblank);
+
 /**
  * drm_crtc_vblank_waitqueue - get vblank waitqueue for the CRTC
  * @crtc: which CRTC's vblank waitqueue to retrieve
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 5e9b15a0e8c5..5363e31c9abe 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -174,12 +174,22 @@ struct drm_crtc_state {
 	 * @no_vblank:
 	 *
 	 * Reflects the ability of a CRTC to send VBLANK events. This state
-	 * usually depends on the pipeline configuration, and the main usuage
-	 * is CRTCs feeding a writeback connector operating in oneshot mode.
-	 * In this case the VBLANK event is only generated when a job is queued
-	 * to the writeback connector, and we want the core to fake VBLANK
-	 * events when this part of the pipeline hasn't changed but others had
-	 * or when the CRTC and connectors are being disabled.
+	 * usually depends on the pipeline configuration. If set to true, DRM
+	 * atomic helpers will sendout a fake VBLANK event during display
+	 * updates.
+	 *
+	 * One usage is for drivers and/or hardware without support for VBLANK
+	 * interrupts. Such drivers typically do not initialize vblanking
+	 * (i.e., call drm_vblank_init() wit the number of CRTCs). For CRTCs
+	 * without initialized vblanking, the field is initialized to true and
+	 * a VBLANK event will be send out on each update of the display
+	 * pipeline.
+	 *
+	 * Another usage is CRTCs feeding a writeback connector operating in
+	 * oneshot mode. In this case the VBLANK event is only generated when
+	 * a job is queued to the writeback connector, and we want the core
+	 * to fake VBLANK events when this part of the pipeline hasn't changed
+	 * but others had or when the CRTC and connectors are being disabled.
 	 *
 	 * __drm_atomic_helper_crtc_duplicate_state() will not reset the value
 	 * from the current state, the CRTC driver is then responsible for
@@ -335,7 +345,10 @@ struct drm_crtc_state {
 	 *  - Events for disabled CRTCs are not allowed, and drivers can ignore
 	 *    that case.
 	 *
-	 * This can be handled by the drm_crtc_send_vblank_event() function,
+	 * For very simple hardware without VBLANK interrupt, enabling
+	 * &struct drm_crtc_state.no_vblank makes DRM's atomic commit helpers
+	 * send the event at an appropriate time. For more complex hardware this
+	 * can be handled by the drm_crtc_send_vblank_event() function,
 	 * which the driver should call on the provided event upon completion of
 	 * the atomic commit. Note that if the driver supports vblank signalling
 	 * and timestamping the vblank counters and timestamps must agree with
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index 15afee9cf049..e253ba7bea9d 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -100,8 +100,11 @@ struct drm_simple_display_pipe_funcs {
 	 * This is the function drivers should submit the
 	 * &drm_pending_vblank_event from. Using either
 	 * drm_crtc_arm_vblank_event(), when the driver supports vblank
-	 * interrupt handling, or drm_crtc_send_vblank_event() directly in case
-	 * the hardware lacks vblank support entirely.
+	 * interrupt handling, or drm_crtc_send_vblank_event() for more
+	 * complex case. In case the hardware lacks vblank support entirely,
+	 * drivers can set &struct drm_crtc_state.no_vblank in
+	 * &struct drm_simple_display_pipe_funcs.check and let DRM's
+	 * atomic helper fake a vblank event.
 	 */
 	void (*update)(struct drm_simple_display_pipe *pipe,
 		       struct drm_plane_state *old_plane_state);
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index c16c44052b3d..94275e93fd27 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -206,6 +206,7 @@ struct drm_vblank_crtc {
 };
 
 int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
+bool drm_dev_has_vblank(const struct drm_device *dev);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
