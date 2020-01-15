Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683513C1BB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B175F6E9C4;
	Wed, 15 Jan 2020 12:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804FF6E9C0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:52:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7B93AAFDF;
 Wed, 15 Jan 2020 12:52:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v2 1/4] drm: Document struct drm_crtc_state.no_vblank for
 faking VBLANK events
Date: Wed, 15 Jan 2020 13:52:23 +0100
Message-Id: <20200115125226.13843-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115125226.13843-1-tzimmermann@suse.de>
References: <20200115125226.13843-1-tzimmermann@suse.de>
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

Drivers for CRTC hardware without support for VBLANK interrupts can set
struct drm_crtc_state.no_vblank and let DRM's atomic commit helpers
generate the VBLANK events automatically. Document this in order to make
it official.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic_helper.c | 4 +++-
 include/drm/drm_crtc.h              | 9 +++++++--
 include/drm/drm_simple_kms_helper.h | 7 +++++--
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 4511c2e07bb9..ce30a37971e4 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2215,7 +2215,9 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_dependencies);
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
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 5e9b15a0e8c5..01caf5160596 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -179,7 +179,9 @@ struct drm_crtc_state {
 	 * In this case the VBLANK event is only generated when a job is queued
 	 * to the writeback connector, and we want the core to fake VBLANK
 	 * events when this part of the pipeline hasn't changed but others had
-	 * or when the CRTC and connectors are being disabled.
+	 * or when the CRTC and connectors are being disabled. In addition to
+	 * writeback connectors, this function can also fake VBLANK events for
+	 * CRTCs without VBLANK interrupt.
 	 *
 	 * __drm_atomic_helper_crtc_duplicate_state() will not reset the value
 	 * from the current state, the CRTC driver is then responsible for
@@ -335,7 +337,10 @@ struct drm_crtc_state {
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
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
