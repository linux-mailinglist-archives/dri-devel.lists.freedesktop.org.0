Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D305C47E42
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EA210E47E;
	Mon, 10 Nov 2025 16:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EO0kGMph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1239E10E47D;
 Mon, 10 Nov 2025 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791595; x=1794327595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ztoA21mj7hknjLuPULenTy2/JTs+3LanY+vVH50nH/I=;
 b=EO0kGMphazzQrB/LlEb8UcT6llBmyVwatDsb7v5Wxfjyyduks8Uy560L
 OdTkgXpgfaCTWnb3d0BXEvUcn/mqFlpLwv+t0O7A+YRlIJFaQcKe95Rx0
 zk9qi7VegR5iJJ/j6jQLQ7QxVCeeaMMOKSBUeFoLWRTN34VFNZM7Fjmo6
 Zz6pAl47uZC/r6ZPlFfcnt+tyriBXcyOsMD9MXhQ2hK3Tlj4z+pXT/kg5
 QP7khQPmwjRCMXxFvm+ynfajxHO5/mWvHHrKsR6GqDuDMz8J4YTnB4qu7
 Lw344Lq2i/KvUoWk9VikMPWqMI/mrdby2CsBGmL/SdeffgoNM93NZnJXu w==;
X-CSE-ConnectionGUID: VK+JjzjOR3ilcWAVrmOo/A==
X-CSE-MsgGUID: USt/2pEkR/GR8f1ouPoGrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64755628"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64755628"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:54 -0800
X-CSE-ConnectionGUID: 8cZdfxFEQ5KmdiFB128YnA==
X-CSE-MsgGUID: xtOoFcTOQouoC1x+Eu5tOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189433883"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 24/24] drm/vblank: clean up debug logging
Date: Mon, 10 Nov 2025 18:17:42 +0200
Message-ID: <ac70a7318a7b9d5e25f47e97df4b0fdb8b335e74.1762791343.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762791343.git.jani.nikula@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Use the usual [CRTC:%d:%s] when crtc is available. Start using a new
uniform [VBLANK:%u] prefix with the pipe when crtc is not
available. Remove extra line breaks. Use string choice helpers here and
there. Use %pe to decode error returns.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 109 ++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 7829e64e42b4..5ee132b3a6b5 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -27,6 +27,7 @@
 #include <linux/export.h>
 #include <linux/kthread.h>
 #include <linux/moduleparam.h>
+#include <linux/string_choices.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
@@ -347,14 +348,13 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
 		 * frame/field duration.
 		 */
 
-		drm_dbg_vbl(dev, "crtc %u: Calculating number of vblanks."
-			    " diff_ns = %lld, framedur_ns = %d)\n",
+		drm_dbg_vbl(dev, "[VBLANK:%u] Calculating number of vblanks. diff_ns = %lld, framedur_ns = %d)\n",
 			    pipe, (long long)diff_ns, framedur_ns);
 
 		diff = DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
 
 		if (diff == 0 && in_vblank_irq)
-			drm_dbg_vbl(dev, "crtc %u: Redundant vblirq ignored\n",
+			drm_dbg_vbl(dev, "[VBLANK:%u] Redundant vblirq ignored\n",
 				    pipe);
 	} else {
 		/* some kind of default for drivers w/o accurate vbl timestamping */
@@ -372,13 +372,12 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
 	 */
 	if (diff > 1 && (vblank->inmodeset & 0x2)) {
 		drm_dbg_vbl(dev,
-			    "clamping vblank bump to 1 on crtc %u: diffr=%u"
-			    " due to pre-modeset.\n", pipe, diff);
+			    "[VBLANK:%u] clamping vblank bump to 1: diffr=%u due to pre-modeset.\n",
+			    pipe, diff);
 		diff = 1;
 	}
 
-	drm_dbg_vbl(dev, "updating vblank count on crtc %u:"
-		    " current=%llu, diff=%u, hw=%u hw_last=%u\n",
+	drm_dbg_vbl(dev, "[VBLANK:%u] updating vblank count: current=%llu, diff=%u, hw=%u hw_last=%u\n",
 		    pipe, (unsigned long long)atomic64_read(&vblank->count),
 		    diff, cur_vblank, vblank->last);
 
@@ -517,7 +516,7 @@ static void vblank_disable_fn(struct timer_list *t)
 
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
 	if (atomic_read(&vblank->refcount) == 0 && vblank->enabled) {
-		drm_dbg_core(dev, "disabling vblank on crtc %u\n", pipe);
+		drm_dbg_core(dev, "[VBLANK:%u] disabling vblank\n", pipe);
 		drm_vblank_disable_and_save(vblank);
 	}
 	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
@@ -665,8 +664,8 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 		if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 			framedur_ns /= 2;
 	} else {
-		drm_err(dev, "crtc %u: Can't calculate constants, dotclock = 0!\n",
-			crtc->base.id);
+		drm_err(dev, "[CRTC:%d:%s] Can't calculate constants, dotclock = 0!\n",
+			crtc->base.id, crtc->name);
 	}
 
 	vblank->linedur_ns  = linedur_ns;
@@ -674,11 +673,11 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 	drm_mode_copy(&vblank->hwmode, mode);
 
 	drm_dbg_core(dev,
-		     "crtc %u: hwmode: htotal %d, vtotal %d, vdisplay %d\n",
-		     crtc->base.id, mode->crtc_htotal,
+		     "[CRTC:%d:%s] hwmode: htotal %d, vtotal %d, vdisplay %d\n",
+		     crtc->base.id, crtc->name, mode->crtc_htotal,
 		     mode->crtc_vtotal, mode->crtc_vdisplay);
-	drm_dbg_core(dev, "crtc %u: clock %d kHz framedur %d linedur %d\n",
-		     crtc->base.id, dotclock, framedur_ns, linedur_ns);
+	drm_dbg_core(dev, "[CRTC:%d:%s] clock %d kHz framedur %d linedur %d\n",
+		     crtc->base.id, crtc->name, dotclock, framedur_ns, linedur_ns);
 }
 EXPORT_SYMBOL(drm_calc_timestamping_constants);
 
@@ -731,7 +730,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 
 	/* Scanout position query not supported? Should not happen. */
 	if (!get_scanout_position) {
-		drm_err(dev, "Called from CRTC w/o get_scanout_position()!?\n");
+		drm_err(dev, "[CRTC:%d:%s] Called from CRTC w/o get_scanout_position()!?\n",
+			crtc->base.id, crtc->name);
 		return false;
 	}
 
@@ -744,7 +744,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	 * Happens during initial modesetting of a crtc.
 	 */
 	if (mode->crtc_clock == 0) {
-		drm_dbg_core(dev, "crtc %u: Noop due to uninitialized mode.\n",
+		drm_dbg_core(dev, "[VBLANK:%u] Noop due to uninitialized mode.\n",
 			     pipe);
 		drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev));
 		return false;
@@ -769,9 +769,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 
 		/* Return as no-op if scanout query unsupported or failed. */
 		if (!vbl_status) {
-			drm_dbg_core(dev,
-				     "crtc %u : scanoutpos query failed.\n",
-				     pipe);
+			drm_dbg_core(dev, "[CRTC:%d:%s] scanoutpos query failed.\n",
+				     crtc->base.id, crtc->name);
 			return false;
 		}
 
@@ -785,9 +784,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 
 	/* Noisy system timing? */
 	if (i == DRM_TIMESTAMP_MAXRETRIES) {
-		drm_dbg_core(dev,
-			     "crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
-			     pipe, duration_ns / 1000, *max_error / 1000, i);
+		drm_dbg_core(dev, "[CRTC:%d:%s] Noisy timestamp %d us > %d us [%d reps].\n",
+			     crtc->base.id, crtc->name, duration_ns / 1000, *max_error / 1000, i);
 	}
 
 	/* Return upper bound of timestamp precision error. */
@@ -811,9 +809,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	ts_etime = ktime_to_timespec64(etime);
 	ts_vblank_time = ktime_to_timespec64(*vblank_time);
 
-	drm_dbg_vbl(dev,
-		    "crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep]\n",
-		    pipe, hpos, vpos,
+	drm_dbg_vbl(dev, "[CRTC:%d:%s] v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep]\n",
+		    crtc->base.id, crtc->name, hpos, vpos,
 		    (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
 		    (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
 		    duration_ns / 1000, i);
@@ -1188,7 +1185,7 @@ static int drm_vblank_enable(struct drm_vblank_crtc *vblank)
 		 * prevent double-accounting of same vblank interval.
 		 */
 		ret = __enable_vblank(vblank);
-		drm_dbg_core(dev, "enabling vblank on crtc %u, ret: %d\n",
+		drm_dbg_core(dev, "[VBLANK:%u] enabling vblank, ret: %d\n",
 			     pipe, ret);
 		if (ret) {
 			atomic_dec(&vblank->refcount);
@@ -1346,8 +1343,9 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	spin_lock_irq(&dev->event_lock);
 
 	spin_lock(&dev->vbl_lock);
-	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
-		    pipe, vblank->enabled, vblank->inmodeset);
+	drm_dbg_vbl(dev, "[CRTC:%d:%s] vblank %s, inmodeset: %s\n",
+		    crtc->base.id, crtc->name, str_enabled_disabled(vblank->enabled),
+		    str_yes_no(vblank->inmodeset));
 
 	/* Avoid redundant vblank disables without previous
 	 * drm_crtc_vblank_on(). */
@@ -1372,9 +1370,8 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
 		if (e->pipe != pipe)
 			continue;
-		drm_dbg_core(dev, "Sending premature vblank event on disable: "
-			     "wanted %llu, current %llu\n",
-			     e->sequence, seq);
+		drm_dbg_core(dev, "[CRTC:%d:%s] Sending premature vblank event on disable: wanted %llu, current %llu\n",
+			     crtc->base.id, crtc->name, e->sequence, seq);
 		list_del(&e->base.link);
 		drm_vblank_put(vblank);
 		send_vblank_event(dev, e, seq, now);
@@ -1474,12 +1471,12 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 			       const struct drm_vblank_crtc_config *config)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	spin_lock_irq(&dev->vbl_lock);
-	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
-		    pipe, vblank->enabled, vblank->inmodeset);
+	drm_dbg_vbl(dev, "[CRTC:%d:%s] vblank %s, inmodeset: %s\n",
+		    crtc->base.id, crtc->name, str_enabled_disabled(vblank->enabled),
+		    str_yes_no(vblank->inmodeset));
 
 	vblank->config = *config;
 
@@ -1573,8 +1570,8 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 		diff = DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
 
 
-	drm_dbg_vbl(dev,
-		    "missed %d vblanks in %lld ns, frame duration=%d ns, hw_diff=%d\n",
+	drm_dbg_vbl(dev, "[CRTC:%d:%s] missed %d vblanks in %lld ns, frame duration=%d ns, hw_diff=%d\n",
+		    crtc->base.id, crtc->name,
 		    diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
 	vblank->last = (cur_vblank - diff) & max_vblank_count;
 }
@@ -1631,8 +1628,8 @@ static int drm_queue_vblank_event(struct drm_vblank_crtc *vblank,
 
 	seq = drm_vblank_count_and_time(vblank, &now);
 
-	drm_dbg_core(dev, "event on vblank count %llu, current %llu, crtc %u\n",
-		     req_seq, seq, pipe);
+	drm_dbg_core(dev, "[VBLANK:%u] event on vblank count %llu, current %llu\n",
+		     pipe, req_seq, seq);
 
 	trace_drm_vblank_event_queued(file_priv, pipe, req_seq);
 
@@ -1728,8 +1725,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	if (vblwait->request.type &
 	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
 	      _DRM_VBLANK_HIGH_CRTC_MASK)) {
-		drm_dbg_core(dev,
-			     "Unsupported type value 0x%x, supported mask 0x%x\n",
+		drm_dbg_core(dev, "Unsupported type value 0x%x, supported mask 0x%x\n",
 			     vblwait->request.type,
 			     (_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
 			      _DRM_VBLANK_HIGH_CRTC_MASK));
@@ -1774,9 +1770,8 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 
 	ret = drm_vblank_get(vblank);
 	if (ret) {
-		drm_dbg_core(dev,
-			     "crtc %d failed to acquire vblank counter, %d\n",
-			     pipe, ret);
+		drm_dbg_core(dev, "[VBLANK:%u] failed to acquire vblank counter %pe\n",
+			     pipe, ERR_PTR(ret));
 		return ret;
 	}
 	seq = drm_vblank_count(vblank);
@@ -1812,8 +1807,8 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	if (req_seq != seq) {
 		int wait;
 
-		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
-			     req_seq, pipe);
+		drm_dbg_core(dev, "[VBLANK:%d] waiting on vblank count %llu\n",
+			     pipe, req_seq);
 		wait = wait_event_interruptible_timeout(vblank->queue,
 			drm_vblank_passed(drm_vblank_count(vblank), req_seq) ||
 				      !READ_ONCE(vblank->enabled),
@@ -1837,10 +1832,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	if (ret != -EINTR) {
 		drm_wait_vblank_reply(vblank, &vblwait->reply);
 
-		drm_dbg_core(dev, "crtc %d returning %u to client\n",
+		drm_dbg_core(dev, "[VBLANK:%u] returning %u to client\n",
 			     pipe, vblwait->reply.sequence);
 	} else {
-		drm_dbg_core(dev, "crtc %d vblank wait interrupted by signal\n",
+		drm_dbg_core(dev, "[VBLANK:%u] vblank wait interrupted by signal\n",
 			     pipe);
 	}
 
@@ -1869,8 +1864,8 @@ static void drm_handle_vblank_events(struct drm_vblank_crtc *vblank)
 		if (!drm_vblank_passed(seq, e->sequence))
 			continue;
 
-		drm_dbg_core(dev, "vblank event on %llu, current %llu\n",
-			     e->sequence, seq);
+		drm_dbg_core(dev, "[VBLANK:%u] vblank event on %llu, current %llu\n",
+			     pipe, e->sequence, seq);
 
 		list_del(&e->base.link);
 		drm_vblank_put(vblank);
@@ -1987,7 +1982,6 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_crtc *crtc;
 	struct drm_vblank_crtc *vblank;
-	int pipe;
 	struct drm_crtc_get_sequence *get_seq = data;
 	ktime_t now;
 	bool vblank_enabled;
@@ -2003,8 +1997,6 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 	if (!crtc)
 		return -ENOENT;
 
-	pipe = drm_crtc_index(crtc);
-
 	vblank = drm_crtc_vblank_crtc(crtc);
 	vblank_enabled = READ_ONCE(vblank->config.disable_immediate) &&
 		READ_ONCE(vblank->enabled);
@@ -2012,9 +2004,8 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 	if (!vblank_enabled) {
 		ret = drm_crtc_vblank_get(crtc);
 		if (ret) {
-			drm_dbg_core(dev,
-				     "crtc %d failed to acquire vblank counter, %d\n",
-				     pipe, ret);
+			drm_dbg_core(dev, "[CRTC:%d:%s] failed to acquire vblank counter %pe\n",
+				     crtc->base.id, crtc->name, ERR_PTR(ret));
 			return ret;
 		}
 	}
@@ -2079,9 +2070,8 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 
 	ret = drm_crtc_vblank_get(crtc);
 	if (ret) {
-		drm_dbg_core(dev,
-			     "crtc %d failed to acquire vblank counter, %d\n",
-			     pipe, ret);
+		drm_dbg_core(dev, "[CRTC:%d:%s] failed to acquire vblank counter %pe\n",
+			     crtc->base.id, crtc->name, ERR_PTR(ret));
 		goto err_free;
 	}
 
@@ -2166,7 +2156,8 @@ static enum hrtimer_restart drm_vblank_timer_function(struct hrtimer *timer)
 
 	ret_overrun = hrtimer_forward_now(&vtimer->timer, interval);
 	if (ret_overrun != 1)
-		drm_dbg_vbl(dev, "vblank timer overrun\n");
+		drm_dbg_vbl(dev, "[CRTC:%d:%s] vblank timer overrun\n",
+			    crtc->base.id, crtc->name);
 
 	if (crtc_funcs->handle_vblank_timeout)
 		succ = crtc_funcs->handle_vblank_timeout(crtc);
-- 
2.47.3

