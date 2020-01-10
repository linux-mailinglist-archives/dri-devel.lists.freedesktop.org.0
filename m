Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE531369F2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 10:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B826E9AA;
	Fri, 10 Jan 2020 09:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A946E9AA;
 Fri, 10 Jan 2020 09:21:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 67688B016;
 Fri, 10 Jan 2020 09:21:50 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 23/23] drm: Cleanup VBLANK callbacks in struct drm_driver
Date: Fri, 10 Jan 2020 10:21:27 +0100
Message-Id: <20200110092127.27847-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110092127.27847-1-tzimmermann@suse.de>
References: <20200110092127.27847-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All non-legacy users of VBLANK functions in struct drm_driver have been
converted to use the respective interfaces in struct drm_crtc_funcs. The
remaining users of VBLANK callbacks in struct drm_driver are legacy drivers
with userspace modesetting.

There are no users left of get_vblank_timestamp(), so the callback is
being removed. The other VBLANK callbacks are being moved to the legacy
section at the end of struct drm_driver.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_vblank.c |  39 +++++---------
 include/drm/drm_drv.h        | 101 ++---------------------------------
 2 files changed, 17 insertions(+), 123 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 7cf436a4b908..ceff68474d4d 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -138,10 +138,9 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 
 		if (crtc->funcs->get_vblank_counter)
 			return crtc->funcs->get_vblank_counter(crtc);
-	}
-
-	if (dev->driver->get_vblank_counter)
+	} else if (dev->driver->get_vblank_counter) {
 		return dev->driver->get_vblank_counter(dev, pipe);
+	}
 
 	return drm_vblank_no_hw_counter(dev, pipe);
 }
@@ -334,8 +333,7 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
 	unsigned long flags;
 
 	WARN_ONCE(drm_debug_enabled(DRM_UT_VBL) &&
-		  !crtc->funcs->get_vblank_timestamp &&
-		  !dev->driver->get_vblank_timestamp,
+		  !crtc->funcs->get_vblank_timestamp,
 		  "This function requires support for accurate vblank timestamps.");
 
 	spin_lock_irqsave(&dev->vblank_time_lock, flags);
@@ -357,13 +355,11 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
 		if (WARN_ON(!crtc))
 			return;
 
-		if (crtc->funcs->disable_vblank) {
+		if (crtc->funcs->disable_vblank)
 			crtc->funcs->disable_vblank(crtc);
-			return;
-		}
+	} else {
+		dev->driver->disable_vblank(dev, pipe);
 	}
-
-	dev->driver->disable_vblank(dev, pipe);
 }
 
 /*
@@ -791,9 +787,6 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
 
 		ret = crtc->funcs->get_vblank_timestamp(crtc, &max_error,
 							tvblank, in_vblank_irq);
-	} else if (dev->driver->get_vblank_timestamp && (max_error > 0)) {
-		ret = dev->driver->get_vblank_timestamp(dev, pipe, &max_error,
-							tvblank, in_vblank_irq);
 	}
 
 	/* GPU high precision timestamp query unsupported or failed.
@@ -1016,9 +1009,11 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
 
 		if (crtc->funcs->enable_vblank)
 			return crtc->funcs->enable_vblank(crtc);
+	} else if (dev->driver->enable_vblank) {
+		return dev->driver->enable_vblank(dev, pipe);
 	}
 
-	return dev->driver->enable_vblank(dev, pipe);
+	return -EINVAL;
 }
 
 static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
@@ -1109,13 +1104,10 @@ static bool __vblank_disable_immediate(struct drm_device *dev, unsigned int pipe
 		return false;
 
 	crtc = drm_crtc_from_index(dev, pipe);
-	if (crtc && crtc->funcs->get_vblank_timestamp)
-		return true;
-
-	if (dev->driver->get_vblank_timestamp)
-		return true;
+	if (!crtc || !crtc->funcs->get_vblank_timestamp)
+		return false;
 
-	return false;
+	return true;
 }
 
 static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
@@ -1798,7 +1790,6 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
 	struct drm_pending_vblank_event *e, *t;
 	ktime_t now;
 	u64 seq;
-	bool high_prec;
 
 	assert_spin_locked(&dev->event_lock);
 
@@ -1818,10 +1809,8 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
 		send_vblank_event(dev, e, seq, now);
 	}
 
-	high_prec = crtc->funcs->get_vblank_timestamp ||
-		    dev->driver->get_vblank_timestamp;
-
-	trace_drm_vblank_event(pipe, seq, now, high_prec);
+	trace_drm_vblank_event(pipe, seq, now,
+			       crtc->funcs->get_vblank_timestamp != NULL);
 }
 
 /**
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b704e252f3b2..e290b3aca6eb 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -268,104 +268,6 @@ struct drm_driver {
 	 */
 	void (*release) (struct drm_device *);
 
-	/**
-	 * @get_vblank_counter:
-	 *
-	 * Driver callback for fetching a raw hardware vblank counter for the
-	 * CRTC specified with the pipe argument.  If a device doesn't have a
-	 * hardware counter, the driver can simply leave the hook as NULL.
-	 * The DRM core will account for missed vblank events while interrupts
-	 * where disabled based on system timestamps.
-	 *
-	 * Wraparound handling and loss of events due to modesetting is dealt
-	 * with in the DRM core code, as long as drivers call
-	 * drm_crtc_vblank_off() and drm_crtc_vblank_on() when disabling or
-	 * enabling a CRTC.
-	 *
-	 * This is deprecated and should not be used by new drivers.
-	 * Use &drm_crtc_funcs.get_vblank_counter instead.
-	 *
-	 * Returns:
-	 *
-	 * Raw vblank counter value.
-	 */
-	u32 (*get_vblank_counter) (struct drm_device *dev, unsigned int pipe);
-
-	/**
-	 * @enable_vblank:
-	 *
-	 * Enable vblank interrupts for the CRTC specified with the pipe
-	 * argument.
-	 *
-	 * This is deprecated and should not be used by new drivers.
-	 * Use &drm_crtc_funcs.enable_vblank instead.
-	 *
-	 * Returns:
-	 *
-	 * Zero on success, appropriate errno if the given @crtc's vblank
-	 * interrupt cannot be enabled.
-	 */
-	int (*enable_vblank) (struct drm_device *dev, unsigned int pipe);
-
-	/**
-	 * @disable_vblank:
-	 *
-	 * Disable vblank interrupts for the CRTC specified with the pipe
-	 * argument.
-	 *
-	 * This is deprecated and should not be used by new drivers.
-	 * Use &drm_crtc_funcs.disable_vblank instead.
-	 */
-	void (*disable_vblank) (struct drm_device *dev, unsigned int pipe);
-
-	/**
-	 * @get_vblank_timestamp:
-	 *
-	 * Called by drm_get_last_vbltimestamp(). Should return a precise
-	 * timestamp when the most recent VBLANK interval ended or will end.
-	 *
-	 * Specifically, the timestamp in @vblank_time should correspond as
-	 * closely as possible to the time when the first video scanline of
-	 * the video frame after the end of VBLANK will start scanning out,
-	 * the time immediately after end of the VBLANK interval. If the
-	 * @crtc is currently inside VBLANK, this will be a time in the future.
-	 * If the @crtc is currently scanning out a frame, this will be the
-	 * past start time of the current scanout. This is meant to adhere
-	 * to the OpenML OML_sync_control extension specification.
-	 *
-	 * Paramters:
-	 *
-	 * dev:
-	 *     dev DRM device handle.
-	 * pipe:
-	 *     crtc for which timestamp should be returned.
-	 * max_error:
-	 *     Maximum allowable timestamp error in nanoseconds.
-	 *     Implementation should strive to provide timestamp
-	 *     with an error of at most max_error nanoseconds.
-	 *     Returns true upper bound on error for timestamp.
-	 * vblank_time:
-	 *     Target location for returned vblank timestamp.
-	 * in_vblank_irq:
-	 *     True when called from drm_crtc_handle_vblank().  Some drivers
-	 *     need to apply some workarounds for gpu-specific vblank irq quirks
-	 *     if flag is set.
-	 *
-	 * Returns:
-	 *
-	 * True on success, false on failure, which means the core should
-	 * fallback to a simple timestamp taken in drm_crtc_handle_vblank().
-	 *
-	 * FIXME:
-	 *
-	 * We should move this hook to &struct drm_crtc_funcs like all the other
-	 * vblank hooks.
-	 */
-	bool (*get_vblank_timestamp) (struct drm_device *dev, unsigned int pipe,
-				     int *max_error,
-				     ktime_t *vblank_time,
-				     bool in_vblank_irq);
-
 	/**
 	 * @irq_handler:
 	 *
@@ -720,6 +622,9 @@ struct drm_driver {
 	int (*dma_ioctl) (struct drm_device *dev, void *data, struct drm_file *file_priv);
 	int (*dma_quiescent) (struct drm_device *);
 	int (*context_dtor) (struct drm_device *dev, int context);
+	u32 (*get_vblank_counter)(struct drm_device *dev, unsigned int pipe);
+	int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
+	void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
 	int dev_priv_size;
 };
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
