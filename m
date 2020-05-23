Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27DD1DF569
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 09:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013B86E123;
	Sat, 23 May 2020 07:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E686E123
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 07:12:36 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l15so14963755lje.9
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 00:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pBc8J8pdVMFgyQiPFx3aws5K5RvKH9g/B1M+/kwS5Zo=;
 b=PMblWIOFM2svLFNuuzH4zuWzP+6hz24B+Ri/xddGawZAvdCFw9oBB8z3T0OHITjzNS
 fFkTvTNyEFrQCzX8tb2xomzajARgYxWROqGKGV8hCuaC4ksjxmzSlHf3soFPP5FHRlql
 Frf+rH4+Xzptr3DWvfWymI8SQvojK4ODD4bUkcoM5jF4GfSmbFO8NrAa0CoKdAWslQzu
 LtYY4qq4K17AIVzNsVJKy+ML8PjFhgUSAAncgOOxvvVRnBEVxVNo8LV3msQq29Kg93Mi
 kxiIHrFLKXF6sti420BB/GCeBFW8x3GRm0pK8lpsotsEVn+fOpEVJyIxNtUPj/agl9R0
 9GiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pBc8J8pdVMFgyQiPFx3aws5K5RvKH9g/B1M+/kwS5Zo=;
 b=qs6Us+0wE860pWExZFmkrzuwOyZmRKDfqi/HShIgsBLz2qrm5U2cp6aOT4pdZ5ZuC3
 lkxu/Jj9IYs6RrvTvSp4PU80GeFfNnr+4DfnJSH7qt193/EBlGete3iOre7Y8NBqM0Eb
 mWXVRBaFIFRn0anQVYCVgA95pYrVf9MT9BU43Iz+aZaOu/w+5UqJQ5YZ8XqkZLluDvRf
 cNxPOKKc72TwpyYQIKiR+zQ+YGnesMVcB4Be9ltYAb2+6sEth9NwmAIUFyFZ9tYc+mGO
 Co7e6EaKkhwKP4uzycQUr4TesglXv8M52/HN1KkZX6l6Y5yq8ZTACk86tBmIWhNljAUg
 AEng==
X-Gm-Message-State: AOAM531Cvrrb9gsUYWbTPV0xvsxEGlKhd9ZEZbXmJZvlKtvZyKHQyABC
 kSv8REgSW+yiXiCZLKFCR0w=
X-Google-Smtp-Source: ABdhPJyXX3xE8yupGOY2O345LpfEVQsJhgKZbDp9mrgQf9v1qtRJHlf/ikw+TpAuGpVyMDkpCgsJYA==
X-Received: by 2002:a2e:7004:: with SMTP id l4mr8897729ljc.208.1590217954494; 
 Sat, 23 May 2020 00:12:34 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:a998:8970:e934:d643])
 by smtp.gmail.com with ESMTPSA id m13sm2887730lfk.12.2020.05.23.00.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 00:12:34 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/2] drm/vblank: use drm_* functions for logging
Date: Sat, 23 May 2020 09:12:23 +0200
Message-Id: <20200523071224.1716837-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200523071224.1716837-1-sam@ravnborg.org>
References: <20200523071224.1716837-1-sam@ravnborg.org>
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
Cc: Y David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace all DRM_* logging functions with their drm_ counterparts.
checkpatch emits a few "quoted string split across lines",
which is left as is. The strings was already split in the original code
base and it would not increase readability to fix them.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_vblank.c | 130 ++++++++++++++++++++---------------
 1 file changed, 73 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 8837bebc7e13..631d7d60e72f 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -311,15 +311,15 @@ static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
 		 * frame/field duration.
 		 */
 
-		DRM_DEBUG_VBL("crtc %u: Calculating number of vblanks."
-			      " diff_ns = %lld, framedur_ns = %d)\n",
-			      pipe, (long long) diff_ns, framedur_ns);
+		drm_dbg_vbl(dev, "crtc %u: Calculating number of vblanks."
+			    " diff_ns = %lld, framedur_ns = %d)\n",
+			    pipe, (long long)diff_ns, framedur_ns);
 
 		diff = DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
 
 		if (diff == 0 && in_vblank_irq)
-			DRM_DEBUG_VBL("crtc %u: Redundant vblirq ignored\n",
-				      pipe);
+			drm_dbg_vbl(dev, "crtc %u: Redundant vblirq ignored\n",
+				    pipe);
 	} else {
 		/* some kind of default for drivers w/o accurate vbl timestamping */
 		diff = in_vblank_irq ? 1 : 0;
@@ -335,15 +335,16 @@ static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
 	 * random large forward jumps of the software vblank counter.
 	 */
 	if (diff > 1 && (vblank->inmodeset & 0x2)) {
-		DRM_DEBUG_VBL("clamping vblank bump to 1 on crtc %u: diffr=%u"
-			      " due to pre-modeset.\n", pipe, diff);
+		drm_dbg_vbl(dev,
+			    "clamping vblank bump to 1 on crtc %u: diffr=%u"
+			    " due to pre-modeset.\n", pipe, diff);
 		diff = 1;
 	}
 
-	DRM_DEBUG_VBL("updating vblank count on crtc %u:"
-		      " current=%llu, diff=%u, hw=%u hw_last=%u\n",
-		      pipe, (unsigned long long)atomic64_read(&vblank->count),
-		      diff, cur_vblank, vblank->last);
+	drm_dbg_vbl(dev, "updating vblank count on crtc %u:"
+		    " current=%llu, diff=%u, hw=%u hw_last=%u\n",
+		    pipe, (unsigned long long)atomic64_read(&vblank->count),
+		    diff, cur_vblank, vblank->last);
 
 	if (diff == 0) {
 		WARN_ON_ONCE(cur_vblank != vblank->last);
@@ -483,7 +484,7 @@ static void vblank_disable_fn(struct timer_list *t)
 
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
 	if (atomic_read(&vblank->refcount) == 0 && vblank->enabled) {
-		DRM_DEBUG("disabling vblank on crtc %u\n", pipe);
+		drm_dbg_core(dev, "disabling vblank on crtc %u\n", pipe);
 		drm_vblank_disable_and_save(dev, pipe);
 	}
 	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
@@ -628,18 +629,19 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 		if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 			framedur_ns /= 2;
 	} else
-		DRM_ERROR("crtc %u: Can't calculate constants, dotclock = 0!\n",
-			  crtc->base.id);
+		drm_err(dev, "crtc %u: Can't calculate constants, dotclock = 0!\n",
+			crtc->base.id);
 
 	vblank->linedur_ns  = linedur_ns;
 	vblank->framedur_ns = framedur_ns;
 	vblank->hwmode = *mode;
 
-	DRM_DEBUG("crtc %u: hwmode: htotal %d, vtotal %d, vdisplay %d\n",
-		  crtc->base.id, mode->crtc_htotal,
-		  mode->crtc_vtotal, mode->crtc_vdisplay);
-	DRM_DEBUG("crtc %u: clock %d kHz framedur %d linedur %d\n",
-		  crtc->base.id, dotclock, framedur_ns, linedur_ns);
+	drm_dbg_core(dev,
+		     "crtc %u: hwmode: htotal %d, vtotal %d, vdisplay %d\n",
+		     crtc->base.id, mode->crtc_htotal,
+		     mode->crtc_vtotal, mode->crtc_vdisplay);
+	drm_dbg_core(dev, "crtc %u: clock %d kHz framedur %d linedur %d\n",
+		     crtc->base.id, dotclock, framedur_ns, linedur_ns);
 }
 EXPORT_SYMBOL(drm_calc_timestamping_constants);
 
@@ -692,13 +694,13 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	int delta_ns, duration_ns;
 
 	if (pipe >= dev->num_crtcs) {
-		DRM_ERROR("Invalid crtc %u\n", pipe);
+		drm_err(dev, "Invalid crtc %u\n", pipe);
 		return false;
 	}
 
 	/* Scanout position query not supported? Should not happen. */
 	if (!get_scanout_position) {
-		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
+		drm_err(dev, "Called from CRTC w/o get_scanout_position()!?\n");
 		return false;
 	}
 
@@ -711,7 +713,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	 * Happens during initial modesetting of a crtc.
 	 */
 	if (mode->crtc_clock == 0) {
-		DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", pipe);
+		drm_dbg_core(dev, "crtc %u: Noop due to uninitialized mode.\n",
+			     pipe);
 		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
 		return false;
 	}
@@ -735,8 +738,9 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 
 		/* Return as no-op if scanout query unsupported or failed. */
 		if (!vbl_status) {
-			DRM_DEBUG("crtc %u : scanoutpos query failed.\n",
-				  pipe);
+			drm_dbg_core(dev,
+				     "crtc %u : scanoutpos query failed.\n",
+				     pipe);
 			return false;
 		}
 
@@ -750,8 +754,9 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 
 	/* Noisy system timing? */
 	if (i == DRM_TIMESTAMP_MAXRETRIES) {
-		DRM_DEBUG("crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
-			  pipe, duration_ns/1000, *max_error/1000, i);
+		drm_dbg_core(dev,
+			     "crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
+			     pipe, duration_ns / 1000, *max_error / 1000, i);
 	}
 
 	/* Return upper bound of timestamp precision error. */
@@ -775,11 +780,12 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	ts_etime = ktime_to_timespec64(etime);
 	ts_vblank_time = ktime_to_timespec64(*vblank_time);
 
-	DRM_DEBUG_VBL("crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep]\n",
-		      pipe, hpos, vpos,
-		      (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
-		      (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
-		      duration_ns / 1000, i);
+	drm_dbg_vbl(dev,
+		    "crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep]\n",
+		    pipe, hpos, vpos,
+		    (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
+		    (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
+		    duration_ns / 1000, i);
 
 	return true;
 }
@@ -1111,7 +1117,8 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 		 * prevent double-accounting of same vblank interval.
 		 */
 		ret = __enable_vblank(dev, pipe);
-		DRM_DEBUG("enabling vblank on crtc %u, ret: %d\n", pipe, ret);
+		drm_dbg_core(dev, "enabling vblank on crtc %u, ret: %d\n",
+			     pipe, ret);
 		if (ret) {
 			atomic_dec(&vblank->refcount);
 		} else {
@@ -1286,8 +1293,8 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	spin_lock_irqsave(&dev->event_lock, irqflags);
 
 	spin_lock(&dev->vbl_lock);
-	DRM_DEBUG_VBL("crtc %d, vblank enabled %d, inmodeset %d\n",
-		      pipe, vblank->enabled, vblank->inmodeset);
+	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
+		    pipe, vblank->enabled, vblank->inmodeset);
 
 	/* Avoid redundant vblank disables without previous
 	 * drm_crtc_vblank_on(). */
@@ -1312,9 +1319,9 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
 		if (e->pipe != pipe)
 			continue;
-		DRM_DEBUG("Sending premature vblank event on disable: "
-			  "wanted %llu, current %llu\n",
-			  e->sequence, seq);
+		drm_dbg_core(dev, "Sending premature vblank event on disable: "
+			     "wanted %llu, current %llu\n",
+			     e->sequence, seq);
 		list_del(&e->base.link);
 		drm_vblank_put(dev, pipe);
 		send_vblank_event(dev, e, seq, now);
@@ -1413,8 +1420,8 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 		return;
 
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
-	DRM_DEBUG_VBL("crtc %d, vblank enabled %d, inmodeset %d\n",
-		      pipe, vblank->enabled, vblank->inmodeset);
+	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
+		    pipe, vblank->enabled, vblank->inmodeset);
 
 	/* Drop our private "prevent drm_vblank_get" refcount */
 	if (vblank->inmodeset) {
@@ -1477,8 +1484,9 @@ void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
 		diff = DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
 
 
-	DRM_DEBUG_VBL("missed %d vblanks in %lld ns, frame duration=%d ns, hw_diff=%d\n",
-		      diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
+	drm_dbg_vbl(dev,
+		    "missed %d vblanks in %lld ns, frame duration=%d ns, hw_diff=%d\n",
+		    diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
 	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
 }
 EXPORT_SYMBOL(drm_vblank_restore);
@@ -1637,8 +1645,8 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 
 	seq = drm_vblank_count_and_time(dev, pipe, &now);
 
-	DRM_DEBUG("event on vblank count %llu, current %llu, crtc %u\n",
-		  req_seq, seq, pipe);
+	drm_dbg_core(dev, "event on vblank count %llu, current %llu, crtc %u\n",
+		     req_seq, seq, pipe);
 
 	trace_drm_vblank_event_queued(file_priv, pipe, req_seq);
 
@@ -1729,10 +1737,11 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	if (vblwait->request.type &
 	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
 	      _DRM_VBLANK_HIGH_CRTC_MASK)) {
-		DRM_DEBUG("Unsupported type value 0x%x, supported mask 0x%x\n",
-			  vblwait->request.type,
-			  (_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
-			   _DRM_VBLANK_HIGH_CRTC_MASK));
+		drm_dbg_core(dev,
+			     "Unsupported type value 0x%x, supported mask 0x%x\n",
+			     vblwait->request.type,
+			     (_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
+			      _DRM_VBLANK_HIGH_CRTC_MASK));
 		return -EINVAL;
 	}
 
@@ -1775,7 +1784,9 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 
 	ret = drm_vblank_get(dev, pipe);
 	if (ret) {
-		DRM_DEBUG("crtc %d failed to acquire vblank counter, %d\n", pipe, ret);
+		drm_dbg_core(dev,
+			     "crtc %d failed to acquire vblank counter, %d\n",
+			     pipe, ret);
 		return ret;
 	}
 	seq = drm_vblank_count(dev, pipe);
@@ -1811,8 +1822,8 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	if (req_seq != seq) {
 		int wait;
 
-		DRM_DEBUG("waiting on vblank count %llu, crtc %u\n",
-			  req_seq, pipe);
+		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
+			     req_seq, pipe);
 		wait = wait_event_interruptible_timeout(vblank->queue,
 			vblank_passed(drm_vblank_count(dev, pipe), req_seq) ||
 				      !READ_ONCE(vblank->enabled),
@@ -1836,10 +1847,11 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	if (ret != -EINTR) {
 		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
 
-		DRM_DEBUG("crtc %d returning %u to client\n",
-			  pipe, vblwait->reply.sequence);
+		drm_dbg_core(dev, "crtc %d returning %u to client\n",
+			     pipe, vblwait->reply.sequence);
 	} else {
-		DRM_DEBUG("crtc %d vblank wait interrupted by signal\n", pipe);
+		drm_dbg_core(dev, "crtc %d vblank wait interrupted by signal\n",
+			     pipe);
 	}
 
 done:
@@ -1865,8 +1877,8 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
 		if (!vblank_passed(seq, e->sequence))
 			continue;
 
-		DRM_DEBUG("vblank event on %llu, current %llu\n",
-			  e->sequence, seq);
+		drm_dbg_core(dev, "vblank event on %llu, current %llu\n",
+			     e->sequence, seq);
 
 		list_del(&e->base.link);
 		drm_vblank_put(dev, pipe);
@@ -2005,7 +2017,9 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 	if (!vblank_enabled) {
 		ret = drm_crtc_vblank_get(crtc);
 		if (ret) {
-			DRM_DEBUG("crtc %d failed to acquire vblank counter, %d\n", pipe, ret);
+			drm_dbg_core(dev,
+				     "crtc %d failed to acquire vblank counter, %d\n",
+				     pipe, ret);
 			return ret;
 		}
 	}
@@ -2071,7 +2085,9 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 
 	ret = drm_crtc_vblank_get(crtc);
 	if (ret) {
-		DRM_DEBUG("crtc %d failed to acquire vblank counter, %d\n", pipe, ret);
+		drm_dbg_core(dev,
+			     "crtc %d failed to acquire vblank counter, %d\n",
+			     pipe, ret);
 		goto err_free;
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
