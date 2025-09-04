Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37133B43FD0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EA310EA72;
	Thu,  4 Sep 2025 15:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rzYwqCaf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lBexduPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B7210EA6E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 15:00:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 46A2260204;
 Thu,  4 Sep 2025 15:00:53 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756998053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4GC1SGi24Bn/wyn7Qsyss4IpOX2xafhTnJ/NtquGGU=;
 b=rzYwqCafsvKzCEHO/JUbNyAGUYKuZIsk7LWS6mRHoM8tiy0QrulHPB3C9kK/16icNN9bnc
 djTLCzeRWGLMW13QgeqdYnsVbFj/vS7ztmnh40gsXCvGmeFDYhSE+r88zkVqFI4fCf8aid
 MKMgYqC0OlFGa8LIBMo1jfjNIMTbyvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756998053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4GC1SGi24Bn/wyn7Qsyss4IpOX2xafhTnJ/NtquGGU=;
 b=lBexduPzJiniUUpCiZ2+m9z6M5VnXTEYxvRF/oPJEKBUxAjmErdGfbFdtWVnlVRZicNB2r
 EXWJa0pJaDyrHgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DACB813ABB;
 Thu,  4 Sep 2025 15:00:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ABI8NKSpuWgcBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Sep 2025 15:00:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: louis.chauvet@bootlin.com, drawat.floss@gmail.com, hamohammed.sa@gmail.com,
 melissa.srw@gmail.com, mhklinux@outlook.com, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com, lyude@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/4] drm/vblank: Add vblank timer
Date: Thu,  4 Sep 2025 16:56:22 +0200
Message-ID: <20250904145806.430568-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904145806.430568-1-tzimmermann@suse.de>
References: <20250904145806.430568-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 TAGGED_RCPT(0.00)[]
X-Rspamd-Queue-Id: 46A2260204
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

The vblank timer simulates a vblank interrupt for hardware without
support. Rate-limits the display update frequency.

DRM drivers for hardware without vblank support apply display updates
ASAP. A vblank event informs DRM clients of the completed update.
Userspace compositors immediately schedule the next update, which
creates significant load on virtualization outputs. Display updates
are usually fast on virtualization outputs, as their framebuffers are
in regular system memory and there's no hardware vblank interrupt to
throttle the update rate.

The vblank timer is a HR timer that signals the vblank in software.
It limits the update frequency of a DRM driver similar to a hardware
vblank interrupt. The timer is not synchronized to the actual vblank
interval of the display.

The code has been adopted from vkms, which added the funtionality
in commit 3a0709928b17 ("drm/vkms: Add vblank events simulated by
hrtimers").

The new implementation is part of the existing vblank support,
which sets up the timer automatically. Drivers only have to start
and cancel the vblank timer as part of enabling and disabling the
CRTC. The new vblank helper library provides callbacks for struct
drm_crtc_funcs.

The standard way for handling vblank is to call drm_crtc_handle_vblank().
Drivers that require additional processing, such as vkms, can init
handle_vblank_timeout in struct drm_crtc_helper_funcs to refer to
their timeout handler.

There's a possible deadlock between drm_crtc_handle_vblank() and
hrtimer_cancel(). [1] The implementation avoids to call hrtimer_cancel()
directly and instead signals to the timer function to not restart
itself.

v3:
- avoid deadlock when cancelling timer (Ville, Lyude)
v2:
- implement vblank timer entirely in vblank helpers
- downgrade overrun warning to debug
- fix docs

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://lore.kernel.org/all/20250510094757.4174662-1-zengheng4@huawei.com/ # [1]
---
 Documentation/gpu/drm-kms-helpers.rst    |  12 ++
 drivers/gpu/drm/Makefile                 |   3 +-
 drivers/gpu/drm/drm_vblank.c             | 161 ++++++++++++++++++++++-
 drivers/gpu/drm/drm_vblank_helper.c      |  96 ++++++++++++++
 include/drm/drm_modeset_helper_vtables.h |  12 ++
 include/drm/drm_vblank.h                 |  32 +++++
 include/drm/drm_vblank_helper.h          |  33 +++++
 7 files changed, 346 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_vblank_helper.c
 create mode 100644 include/drm/drm_vblank_helper.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 5139705089f2..781129f78b06 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -92,6 +92,18 @@ GEM Atomic Helper Reference
 .. kernel-doc:: drivers/gpu/drm/drm_gem_atomic_helper.c
    :export:
 
+VBLANK Helper Reference
+-----------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_vblank_helper.c
+   :doc: overview
+
+.. kernel-doc:: include/drm/drm_vblank_helper.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_vblank_helper.c
+   :export:
+
 Simple KMS Helper Reference
 ===========================
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4dafbdc8f86a..5ba4ffdb8055 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -150,7 +150,8 @@ drm_kms_helper-y := \
 	drm_plane_helper.o \
 	drm_probe_helper.o \
 	drm_self_refresh_helper.o \
-	drm_simple_kms_helper.o
+	drm_simple_kms_helper.o \
+	drm_vblank_helper.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 46f59883183d..364f5ba969d0 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -136,8 +136,17 @@
  * vblanks after a timer has expired, which can be configured through the
  * ``vblankoffdelay`` module parameter.
  *
- * Drivers for hardware without support for vertical-blanking interrupts
- * must not call drm_vblank_init(). For such drivers, atomic helpers will
+ * Drivers for hardware without support for vertical-blanking interrupts can
+ * use DRM vblank timers to send vblank events at the rate of the current
+ * display mode's refresh. While not synchronized to the hardware's
+ * vertical-blanking regions, the timer helps DRM clients and compositors to
+ * adapt their update cycle to the display output. Drivers should set up
+ * vblanking as usual, but call drm_crtc_vblank_start_timer() and
+ * drm_crtc_vblank_cancel_timer() as part of their atomic mode setting.
+ * See also DRM vblank helpers for more information.
+ *
+ * Drivers without support for vertical-blanking interrupts nor timers must
+ * not call drm_vblank_init(). For these drivers, atomic helpers will
  * automatically generate fake vblank events as part of the display update.
  * This functionality also can be controlled by the driver by enabling and
  * disabling struct drm_crtc_state.no_vblank.
@@ -508,6 +517,9 @@ static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
 	drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
 		    drm_core_check_feature(dev, DRIVER_MODESET));
 
+	if (vblank->vblank_timer.crtc)
+		hrtimer_cancel(&vblank->vblank_timer.timer);
+
 	drm_vblank_destroy_worker(vblank);
 	timer_delete_sync(&vblank->disable_timer);
 }
@@ -2162,3 +2174,148 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
+/*
+ * VBLANK timer
+ */
+
+static enum hrtimer_restart drm_vblank_timer_function(struct hrtimer *timer)
+{
+	struct drm_vblank_crtc_timer *vtimer =
+		container_of(timer, struct drm_vblank_crtc_timer, timer);
+	struct drm_crtc *crtc = vtimer->crtc;
+	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
+	struct drm_device *dev = crtc->dev;
+	unsigned long flags;
+	ktime_t interval;
+	u64 ret_overrun;
+	bool succ;
+
+	spin_lock_irqsave(&vtimer->interval_lock, flags);
+	interval = vtimer->interval;
+	spin_unlock_irqrestore(&vtimer->interval_lock, flags);
+
+	if (!interval)
+		return HRTIMER_NORESTART;
+
+	ret_overrun = hrtimer_forward_now(&vtimer->timer, interval);
+	if (ret_overrun != 1)
+		drm_dbg_vbl(dev, "vblank timer overrun\n");
+
+	if (crtc_funcs->handle_vblank_timeout)
+		succ = crtc_funcs->handle_vblank_timeout(crtc);
+	else
+		succ = drm_crtc_handle_vblank(crtc);
+	if (!succ)
+		return HRTIMER_NORESTART;
+
+	return HRTIMER_RESTART;
+}
+
+/**
+ * drm_crtc_vblank_start_timer - Starts the vblank timer on the given CRTC
+ * @crtc: the CRTC
+ *
+ * Drivers should call this function from their CRTC's enable_vblank
+ * function to start a vblank timer. The timer will fire after the duration
+ * of a full frame. drm_crtc_vblank_cancel_timer() disables a running timer.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drm_crtc_vblank_start_timer(struct drm_crtc *crtc)
+{
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+	struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
+	unsigned long flags;
+
+	if (!vtimer->crtc) {
+		/*
+		 * Set up the data structures on the first invocation.
+		 */
+		vtimer->crtc = crtc;
+		spin_lock_init(&vtimer->interval_lock);
+		hrtimer_setup(&vtimer->timer, drm_vblank_timer_function,
+			      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	} else {
+		/*
+		 * Timer should not be active. If it is, wait for the
+		 * previous cancel operations to finish.
+		 */
+		while (hrtimer_active(&vtimer->timer))
+			hrtimer_try_to_cancel(&vtimer->timer);
+	}
+
+	drm_calc_timestamping_constants(crtc, &crtc->mode);
+
+	spin_lock_irqsave(&vtimer->interval_lock, flags);
+	vtimer->interval = ns_to_ktime(vblank->framedur_ns);
+	spin_unlock_irqrestore(&vtimer->interval_lock, flags);
+
+	hrtimer_start(&vtimer->timer, vtimer->interval, HRTIMER_MODE_REL);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_vblank_start_timer);
+
+/**
+ * drm_crtc_vblank_start_timer - Cancels the given CRTC's vblank timer
+ * @crtc: the CRTC
+ *
+ * Drivers should call this function from their CRTC's disable_vblank
+ * function to stop a vblank timer.
+ */
+void drm_crtc_vblank_cancel_timer(struct drm_crtc *crtc)
+{
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+	struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
+	unsigned long flags;
+
+	/*
+	 * Calling hrtimer_cancel() can result in a deadlock with DRM's
+	 * vblank_time_lime_lock and hrtimers' softirq_expiry_lock. So
+	 * clear interval and indicate cancellation. The timer function
+	 * will cancel itself on the next invocation.
+	 */
+
+	spin_lock_irqsave(&vtimer->interval_lock, flags);
+	vtimer->interval = 0;
+	spin_unlock_irqrestore(&vtimer->interval_lock, flags);
+
+	hrtimer_try_to_cancel(&vtimer->timer);
+}
+EXPORT_SYMBOL(drm_crtc_vblank_cancel_timer);
+
+/**
+ * drm_crtc_vblank_get_vblank_timeout - Returns the vblank timeout
+ * @crtc: The CRTC
+ * @vblank_time: Returns the next vblank timestamp
+ *
+ * The helper drm_crtc_vblank_get_vblank_timeout() returns the next vblank
+ * timestamp of the CRTC's vblank timer according to the timer's expiry
+ * time.
+ */
+void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_time)
+{
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+	struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
+
+	if (!READ_ONCE(vblank->enabled)) {
+		*vblank_time = ktime_get();
+		return;
+	}
+
+	*vblank_time = READ_ONCE(vtimer->timer.node.expires);
+
+	if (drm_WARN_ON(crtc->dev, !ktime_compare(*vblank_time, vblank->time)))
+		return; /* Already expired */
+
+	/*
+	 * To prevent races we roll the hrtimer forward before we do any
+	 * interrupt processing - this is how real hw works (the interrupt
+	 * is only generated after all the vblank registers are updated)
+	 * and what the vblank core expects. Therefore we need to always
+	 * correct the timestamp by one frame.
+	 */
+	*vblank_time = ktime_sub(*vblank_time, vtimer->interval);
+}
+EXPORT_SYMBOL(drm_crtc_vblank_get_vblank_timeout);
diff --git a/drivers/gpu/drm/drm_vblank_helper.c b/drivers/gpu/drm/drm_vblank_helper.c
new file mode 100644
index 000000000000..f94d1e706191
--- /dev/null
+++ b/drivers/gpu/drm/drm_vblank_helper.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: MIT
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_vblank_helper.h>
+
+/**
+ * DOC: overview
+ *
+ * The vblank helper library provides functions for supporting vertical
+ * blanking in DRM drivers.
+ *
+ * For vblank timers, several callback implementations are available.
+ * Drivers enable support for vblank timers by setting the vblank callbacks
+ * in struct &drm_crtc_funcs to the helpers provided by this library. The
+ * initializer macro DRM_CRTC_VBLANK_TIMER_FUNCS does this conveniently.
+ *
+ * Once the driver enables vblank support with drm_vblank_init(), each
+ * CRTC's vblank timer fires according to the programmed display mode. By
+ * default, the vblank timer invokes drm_crtc_handle_vblank(). Drivers with
+ * more specific requirements can set their own handler function in
+ * struct &drm_crtc_helper_funcs.handle_vblank_timeout.
+ */
+
+/*
+ * VBLANK timer
+ */
+
+/**
+ * drm_crtc_vblank_helper_enable_vblank_timer - Implements struct &drm_crtc_funcs.enable_vblank
+ * @crtc: The CRTC
+ *
+ * The helper drm_crtc_vblank_helper_enable_vblank_timer() implements
+ * enable_vblank of struct drm_crtc_helper_funcs for CRTCs that require
+ * a VBLANK timer. It sets up the timer on the first invocation. The
+ * started timer expires after the current frame duration. See struct
+ * &drm_vblank_crtc.framedur_ns.
+ *
+ * See also struct &drm_crtc_helper_funcs.enable_vblank.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drm_crtc_vblank_helper_enable_vblank_timer(struct drm_crtc *crtc)
+{
+	return drm_crtc_vblank_start_timer(crtc);
+}
+EXPORT_SYMBOL(drm_crtc_vblank_helper_enable_vblank_timer);
+
+/**
+ * drm_crtc_vblank_helper_disable_vblank_timer - Implements struct &drm_crtc_funcs.disable_vblank
+ * @crtc: The CRTC
+ *
+ * The helper drm_crtc_vblank_helper_disable_vblank_timer() implements
+ * disable_vblank of struct drm_crtc_funcs for CRTCs that require a
+ * VBLANK timer.
+ *
+ * See also struct &drm_crtc_helper_funcs.disable_vblank.
+ */
+void drm_crtc_vblank_helper_disable_vblank_timer(struct drm_crtc *crtc)
+{
+	drm_crtc_vblank_cancel_timer(crtc);
+}
+EXPORT_SYMBOL(drm_crtc_vblank_helper_disable_vblank_timer);
+
+/**
+ * drm_crtc_vblank_helper_get_vblank_timestamp_from_timer -
+ *	Implements struct &drm_crtc_funcs.get_vblank_timestamp
+ * @crtc: The CRTC
+ * @max_error: Maximum acceptable error
+ * @vblank_time: Returns the next vblank timestamp
+ * @in_vblank_irq: True is called from drm_crtc_handle_vblank()
+ *
+ * The helper drm_crtc_helper_get_vblank_timestamp_from_timer() implements
+ * get_vblank_timestamp of struct drm_crtc_funcs for CRTCs that require a
+ * VBLANK timer. It returns the timestamp according to the timer's expiry
+ * time.
+ *
+ * See also struct &drm_crtc_funcs.get_vblank_timestamp.
+ *
+ * Returns:
+ * True on success, or false otherwise.
+ */
+bool drm_crtc_vblank_helper_get_vblank_timestamp_from_timer(struct drm_crtc *crtc,
+							    int *max_error,
+							    ktime_t *vblank_time,
+							    bool in_vblank_irq)
+{
+	drm_crtc_vblank_get_vblank_timeout(crtc, vblank_time);
+
+	return true;
+}
+EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp_from_timer);
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index ce7c7aeac887..fe32854b7ffe 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -490,6 +490,18 @@ struct drm_crtc_helper_funcs {
 				     bool in_vblank_irq, int *vpos, int *hpos,
 				     ktime_t *stime, ktime_t *etime,
 				     const struct drm_display_mode *mode);
+
+	/**
+	 * @handle_vblank_timeout: Handles timeouts of the vblank timer.
+	 *
+	 * Called by CRTC's the vblank timer on each timeout. Semantics is
+	 * equivalient to drm_crtc_handle_vblank(). Implementations should
+	 * invoke drm_crtc_handle_vblank() as part of processing the timeout.
+	 *
+	 * This callback is optional. If unset, the vblank timer invokes
+	 * drm_crtc_handle_vblank() directly.
+	 */
+	bool (*handle_vblank_timeout)(struct drm_crtc *crtc);
 };
 
 /**
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 151ab1e85b1b..ffa564d79638 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -25,6 +25,7 @@
 #define _DRM_VBLANK_H_
 
 #include <linux/seqlock.h>
+#include <linux/hrtimer.h>
 #include <linux/idr.h>
 #include <linux/poll.h>
 #include <linux/kthread.h>
@@ -103,6 +104,28 @@ struct drm_vblank_crtc_config {
 	bool disable_immediate;
 };
 
+/**
+ * struct drm_vblank_crtc_timer - vblank timer for a CRTC
+ */
+struct drm_vblank_crtc_timer {
+	/**
+	 * @timer: The vblank's high-resolution timer
+	 */
+	struct hrtimer timer;
+	/**
+	 * @interval_lock: Protects @interval
+	 */
+	spinlock_t interval_lock;
+	/**
+	 * @interval: Duration between two vblanks
+	 */
+	ktime_t interval;
+	/**
+	 * @crtc: The timer's CRTC
+	 */
+	struct drm_crtc *crtc;
+};
+
 /**
  * struct drm_vblank_crtc - vblank tracking for a CRTC
  *
@@ -254,6 +277,11 @@ struct drm_vblank_crtc {
 	 * cancelled.
 	 */
 	wait_queue_head_t work_wait_queue;
+
+	/**
+	 * @vblank_timer: Holds the state of the vblank timer
+	 */
+	struct drm_vblank_crtc_timer vblank_timer;
 };
 
 struct drm_vblank_crtc *drm_crtc_vblank_crtc(struct drm_crtc *crtc);
@@ -290,6 +318,10 @@ wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc);
 void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
 				   u32 max_vblank_count);
 
+int drm_crtc_vblank_start_timer(struct drm_crtc *crtc);
+void drm_crtc_vblank_cancel_timer(struct drm_crtc *crtc);
+void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_time);
+
 /*
  * Helpers for struct drm_crtc_funcs
  */
diff --git a/include/drm/drm_vblank_helper.h b/include/drm/drm_vblank_helper.h
new file mode 100644
index 000000000000..74a971d0cfba
--- /dev/null
+++ b/include/drm/drm_vblank_helper.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _DRM_VBLANK_HELPER_H_
+#define _DRM_VBLANK_HELPER_H_
+
+#include <linux/hrtimer_types.h>
+#include <linux/types.h>
+
+struct drm_crtc;
+
+/*
+ * VBLANK timer
+ */
+
+int drm_crtc_vblank_helper_enable_vblank_timer(struct drm_crtc *crtc);
+void drm_crtc_vblank_helper_disable_vblank_timer(struct drm_crtc *crtc);
+bool drm_crtc_vblank_helper_get_vblank_timestamp_from_timer(struct drm_crtc *crtc,
+							    int *max_error,
+							    ktime_t *vblank_time,
+							    bool in_vblank_irq);
+
+/**
+ * DRM_CRTC_VBLANK_TIMER_FUNCS - Default implementation for VBLANK timers
+ *
+ * This macro initializes struct &drm_crtc_funcs to default helpers for
+ * VBLANK timers.
+ */
+#define DRM_CRTC_VBLANK_TIMER_FUNCS \
+	.enable_vblank = drm_crtc_vblank_helper_enable_vblank_timer, \
+	.disable_vblank = drm_crtc_vblank_helper_disable_vblank_timer, \
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp_from_timer
+
+#endif
-- 
2.50.1

