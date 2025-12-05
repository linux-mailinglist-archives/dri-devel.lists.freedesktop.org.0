Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5FCCA768C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFBD10EB03;
	Fri,  5 Dec 2025 11:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DYeprmP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5705610EB02;
 Fri,  5 Dec 2025 11:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934197; x=1796470197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nnf3/MTv9qnHH2ZB+QNI/RLTuT/iAVDLYs0GAVCajDs=;
 b=DYeprmP+10nqGlAZa5Gy9iKgwG9davEpDmN/+JsMj+tOfUP3Wpp/R86G
 jmM1fkdvFJFo4rTivKtmLdShnU2Yr20C6NTiYskZrANots6aHahb8DDFB
 Rrg1XZyFyQg1fPCnQ7tQxkhxVbI9FvpNH8CSzF/ksLVnsVKh7mn+MOoYl
 frMFTD19hUPTLNHUPWv3o61zrlXSl2+IK2mvs8qOWkv5h4e7p5M29DP0Q
 0EtrdLLzvrdboW/0WG0h+XU6ASrVQm1A4x4PehlDwhU2xfXAFlh9Kg66t
 e81qY1h1nwEO3g8yzmgM1259hlaUhetIpKmlYxU6ccnnkDvhw8emtauro Q==;
X-CSE-ConnectionGUID: UNnU92asS4OFHS/ucfKkpw==
X-CSE-MsgGUID: GvppglSPR9SG6Z1OsNk8Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66902998"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66902998"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:57 -0800
X-CSE-ConnectionGUID: LhIjpFLWR0i+rfoVxZK+SA==
X-CSE-MsgGUID: Cwe4AcoQQ6ipUPeyNjsi0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199757772"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 24/25] drm/vblank: reduce pipe checks
Date: Fri,  5 Dec 2025 13:27:40 +0200
Message-ID: <ca69ec9b71ed29f7e5848fcf3ace69ec0dcd4374.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
References: <cover.1764933891.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Now that drm_vblank_crtc() is the only place that indexes dev->vblank[],
and its usage has reduced considerably, add the primary pipe
out-of-bounds check there, and return NULL. Expect callers to check it
and act accordingly.

In drm_crtc_vblank_crtc(), warn and return NULL, and let it go boom. If
the crtc->pipe is out of bounds, it's a driver error that needs to be
fixed.

Remove superfluous pipe checks all around.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 445b62b8b661..ba16981a5b1e 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -177,13 +177,22 @@ MODULE_PARM_DESC(timestamp_precision_usec, "Max. error on timestamps [usecs]");
 static struct drm_vblank_crtc *
 drm_vblank_crtc(struct drm_device *dev, unsigned int pipe)
 {
+	if (pipe >= dev->num_crtcs)
+		return NULL;
+
 	return &dev->vblank[pipe];
 }
 
 struct drm_vblank_crtc *
 drm_crtc_vblank_crtc(struct drm_crtc *crtc)
 {
-	return drm_vblank_crtc(crtc->dev, drm_crtc_index(crtc));
+	struct drm_vblank_crtc *vblank;
+
+	vblank = drm_vblank_crtc(crtc->dev, drm_crtc_index(crtc));
+	if (drm_WARN_ON(crtc->dev, !vblank))
+		return NULL;
+
+	return vblank;
 }
 EXPORT_SYMBOL(drm_crtc_vblank_crtc);
 
@@ -631,7 +640,6 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 				     const struct drm_display_mode *mode)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	int linedur_ns = 0, framedur_ns = 0;
 	int dotclock = mode->crtc_clock;
@@ -639,9 +647,6 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 	if (!drm_dev_has_vblank(dev))
 		return;
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
-
 	/* Valid dotclock? */
 	if (dotclock > 0) {
 		int frame_size = mode->crtc_htotal * mode->crtc_vtotal;
@@ -723,11 +728,6 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	int vpos, hpos, i;
 	int delta_ns, duration_ns;
 
-	if (pipe >= dev->num_crtcs) {
-		drm_err(dev, "Invalid crtc %u\n", pipe);
-		return false;
-	}
-
 	/* Scanout position query not supported? Should not happen. */
 	if (!get_scanout_position) {
 		drm_err(dev, "Called from CRTC w/o get_scanout_position()!?\n");
@@ -1342,9 +1342,6 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	ktime_t now;
 	u64 seq;
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
-
 	/*
 	 * Grab event_lock early to prevent vblank work from being scheduled
 	 * while we're in the middle of shutting down vblank interrupts
@@ -1483,9 +1480,6 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
-
 	spin_lock_irq(&dev->vbl_lock);
 	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
 		    pipe, vblank->enabled, vblank->inmodeset);
@@ -1767,10 +1761,9 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 		pipe = pipe_index;
 	}
 
-	if (pipe >= dev->num_crtcs)
-		return -EINVAL;
-
 	vblank = drm_vblank_crtc(dev, pipe);
+	if (!vblank)
+		return -EINVAL;
 
 	/* If the counter is currently enabled and accurate, short-circuit
 	 * queries to return the cached timestamp of the last vblank.
@@ -1905,14 +1898,15 @@ static void drm_vblank_crtc_handle_events(struct drm_vblank_crtc *vblank)
  */
 bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_vblank_crtc *vblank;
 	unsigned long irqflags;
 	bool disable_irq;
 
 	if (drm_WARN_ON_ONCE(dev, !drm_dev_has_vblank(dev)))
 		return false;
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
+	vblank = drm_vblank_crtc(dev, pipe);
+	if (drm_WARN_ON(dev, !vblank))
 		return false;
 
 	spin_lock_irqsave(&dev->event_lock, irqflags);
-- 
2.47.3

