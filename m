Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F441DF56A
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 09:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6891D6E19C;
	Sat, 23 May 2020 07:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656646E19C
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 07:12:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a25so3679271ljp.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 00:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F7RXfvXnRfHdtgbXCxYGv5VVSGlKFUEKC7Z9L4lCot0=;
 b=dE56ePeOa77TaH1JlnurxrZAYTkn1gqmxvikUvjGifwi8olZsXStKRImLMMb8OsPIa
 3znlttr00NdsbEkfGV0ipa61QCcIxSa6RUWgLMzxdmQx+hA3WddTIIQCON6m3RGi9vjA
 3qL5b5on9se86czjLbVvHX4ReWc2ZifDQLCQOujSj4ALHeyxamMrWzes5WebaupoN6L1
 xqaxGnJkXEJslm2erXAQNPR8mAZNif8H04uEbd1VsWzMdxxR2F4SfR3UI+fzlG9XSoze
 o/MPAWu/GmRmhiG6N3CSKWMcV6Q69GUsF4Bpo0EACyUv2x9yAhEk3oxlkd4U9Ms/qhfP
 6unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F7RXfvXnRfHdtgbXCxYGv5VVSGlKFUEKC7Z9L4lCot0=;
 b=KwfExseLFRBgCHBjlN7zM9ceEqNhZGf5vC6cyMgW2TapJ6dS3KEAAAleHEDujc0DQV
 4fzzBDRe/7YbkQZKUDsqfGYEsgzoj33RCAbnJ43vlFheyQIYLVbNU/nq6CtO5geNNF4i
 0IQ5bNxFpuP2vcB45v/atj+3mOdix89XAwRRUwQq9UjpFDCeGK1qqiC0OkZTANS3wWNU
 l78DQ97Z86x9/b+tdvG7cBPPh2FbOQVy5VqoNR8CwPrqrRHp8EtsJBv3BzCPlDp+wJ7a
 gg5awICT8NyXuzKVFRvxiwavCm72Fp7csll+Jhk4krX3E45h1Ps5S1hvP9iTkmRau6Je
 d0/A==
X-Gm-Message-State: AOAM532zmL7HjkJ9wb2Xayo9HXSJfEwCItaGWMUZcqQRrsf4tU+BuP0F
 Og070B24TYoZTWWqn7lo+qOdBSWcokI=
X-Google-Smtp-Source: ABdhPJzPvPC7ZP2kpeo8Y7NcffXW54+xAj/nNRGbUodnwjA+O9Vw2MtdgGtZ9vbj4xpfgTpP/zRzRQ==
X-Received: by 2002:a2e:80c1:: with SMTP id r1mr8496256ljg.115.1590217956761; 
 Sat, 23 May 2020 00:12:36 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:a998:8970:e934:d643])
 by smtp.gmail.com with ESMTPSA id m13sm2887730lfk.12.2020.05.23.00.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 00:12:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/2] drm/vblank: use drm_WARN for all warnings
Date: Sat, 23 May 2020 09:12:24 +0200
Message-Id: <20200523071224.1716837-3-sam@ravnborg.org>
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

Replace all the WARN_* variants with their drm_WARN counterparts.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_vblank.c | 68 +++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 631d7d60e72f..69cca268a29a 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -194,7 +194,7 @@ static u32 drm_max_vblank_count(struct drm_device *dev, unsigned int pipe)
  */
 static u32 drm_vblank_no_hw_counter(struct drm_device *dev, unsigned int pipe)
 {
-	WARN_ON_ONCE(drm_max_vblank_count(dev, pipe) != 0);
+	drm_WARN_ON_ONCE(dev, drm_max_vblank_count(dev, pipe) != 0);
 	return 0;
 }
 
@@ -203,7 +203,7 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
 
-		if (WARN_ON(!crtc))
+		if (drm_WARN_ON(dev, !crtc))
 			return 0;
 
 		if (crtc->funcs->get_vblank_counter)
@@ -347,7 +347,7 @@ static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
 		    diff, cur_vblank, vblank->last);
 
 	if (diff == 0) {
-		WARN_ON_ONCE(cur_vblank != vblank->last);
+		drm_WARN_ON_ONCE(dev, cur_vblank != vblank->last);
 		return;
 	}
 
@@ -368,7 +368,7 @@ static u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	u64 count;
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return 0;
 
 	count = atomic64_read(&vblank->count);
@@ -403,9 +403,9 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
 	u64 vblank;
 	unsigned long flags;
 
-	WARN_ONCE(drm_debug_enabled(DRM_UT_VBL) &&
-		  !crtc->funcs->get_vblank_timestamp,
-		  "This function requires support for accurate vblank timestamps.");
+	drm_WARN_ONCE(dev, drm_debug_enabled(DRM_UT_VBL) &&
+		      !crtc->funcs->get_vblank_timestamp,
+		      "This function requires support for accurate vblank timestamps.");
 
 	spin_lock_irqsave(&dev->vblank_time_lock, flags);
 
@@ -423,7 +423,7 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
 
-		if (WARN_ON(!crtc))
+		if (drm_WARN_ON(dev, !crtc))
 			return;
 
 		if (crtc->funcs->disable_vblank)
@@ -497,8 +497,8 @@ static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
 	for (pipe = 0; pipe < dev->num_crtcs; pipe++) {
 		struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
-		WARN_ON(READ_ONCE(vblank->enabled) &&
-			drm_core_check_feature(dev, DRIVER_MODESET));
+		drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
+			    drm_core_check_feature(dev, DRIVER_MODESET));
 
 		del_timer_sync(&vblank->disable_timer);
 	}
@@ -608,7 +608,7 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 	if (!dev->num_crtcs)
 		return;
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
 	/* Valid dotclock? */
@@ -715,7 +715,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	if (mode->crtc_clock == 0) {
 		drm_dbg_core(dev, "crtc %u: Noop due to uninitialized mode.\n",
 			     pipe);
-		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
+		drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev));
 		return false;
 	}
 
@@ -929,7 +929,7 @@ static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
 	u64 vblank_count;
 	unsigned int seq;
 
-	if (WARN_ON(pipe >= dev->num_crtcs)) {
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs)) {
 		*vblanktime = 0;
 		return 0;
 	}
@@ -1087,7 +1087,7 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
 
-		if (WARN_ON(!crtc))
+		if (drm_WARN_ON(dev, !crtc))
 			return 0;
 
 		if (crtc->funcs->enable_vblank)
@@ -1146,7 +1146,7 @@ static int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 	if (!dev->num_crtcs)
 		return -EINVAL;
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return -EINVAL;
 
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
@@ -1184,10 +1184,10 @@ static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
-	if (WARN_ON(atomic_read(&vblank->refcount) == 0))
+	if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0))
 		return;
 
 	/* Last user schedules interrupt disable */
@@ -1232,11 +1232,12 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 	int ret;
 	u64 last;
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
 	ret = drm_vblank_get(dev, pipe);
-	if (WARN(ret, "vblank not available on crtc %i, ret=%i\n", pipe, ret))
+	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
+		     pipe, ret))
 		return;
 
 	last = drm_vblank_count(dev, pipe);
@@ -1245,7 +1246,7 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 				 last != drm_vblank_count(dev, pipe),
 				 msecs_to_jiffies(100));
 
-	WARN(ret == 0, "vblank wait timed out on crtc %i\n", pipe);
+	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
 
 	drm_vblank_put(dev, pipe);
 }
@@ -1287,7 +1288,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	unsigned long irqflags;
 	u64 seq;
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
 	spin_lock_irqsave(&dev->event_lock, irqflags);
@@ -1364,7 +1365,7 @@ void drm_crtc_vblank_reset(struct drm_crtc *crtc)
 	}
 	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
 
-	WARN_ON(!list_empty(&dev->vblank_event_list));
+	drm_WARN_ON(dev, !list_empty(&dev->vblank_event_list));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_reset);
 
@@ -1392,8 +1393,8 @@ void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
-	WARN_ON(dev->max_vblank_count);
-	WARN_ON(!READ_ONCE(vblank->inmodeset));
+	drm_WARN_ON(dev, dev->max_vblank_count);
+	drm_WARN_ON(dev, !READ_ONCE(vblank->inmodeset));
 
 	vblank->max_vblank_count = max_vblank_count;
 }
@@ -1416,7 +1417,7 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	unsigned long irqflags;
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
@@ -1436,7 +1437,7 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 	 * user wishes vblank interrupts to be enabled all the time.
 	 */
 	if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
-		WARN_ON(drm_vblank_enable(dev, pipe));
+		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
 	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
 }
 EXPORT_SYMBOL(drm_crtc_vblank_on);
@@ -1463,15 +1464,16 @@ void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
 	u32 cur_vblank, diff = 1;
 	int count = DRM_TIMESTAMP_MAXRETRIES;
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
 	assert_spin_locked(&dev->vbl_lock);
 	assert_spin_locked(&dev->vblank_time_lock);
 
 	vblank = &dev->vblank[pipe];
-	WARN_ONCE(drm_debug_enabled(DRM_UT_VBL) && !vblank->framedur_ns,
-		  "Cannot compute missed vblanks without frame duration\n");
+	drm_WARN_ONCE(dev,
+		      drm_debug_enabled(DRM_UT_VBL) && !vblank->framedur_ns,
+		      "Cannot compute missed vblanks without frame duration\n");
 	framedur_ns = vblank->framedur_ns;
 
 	do {
@@ -1516,7 +1518,7 @@ static void drm_legacy_vblank_pre_modeset(struct drm_device *dev,
 	if (!dev->num_crtcs)
 		return;
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
 	/*
@@ -1543,7 +1545,7 @@ static void drm_legacy_vblank_post_modeset(struct drm_device *dev,
 	if (!dev->num_crtcs)
 		return;
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
 	if (vblank->inmodeset) {
@@ -1907,10 +1909,10 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	unsigned long irqflags;
 	bool disable_irq;
 
-	if (WARN_ON_ONCE(!dev->num_crtcs))
+	if (drm_WARN_ON_ONCE(dev, !dev->num_crtcs))
 		return false;
 
-	if (WARN_ON(pipe >= dev->num_crtcs))
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return false;
 
 	spin_lock_irqsave(&dev->event_lock, irqflags);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
