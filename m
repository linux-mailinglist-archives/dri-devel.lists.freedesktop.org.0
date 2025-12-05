Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B6CA7625
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8031D10EAE2;
	Fri,  5 Dec 2025 11:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWgcDSTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9CB10EADE;
 Fri,  5 Dec 2025 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934129; x=1796470129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LILcemefDZHx+e7se1u//5mC9S89rKOXlXODUQpA190=;
 b=LWgcDSTnxCqjk+NlQnCHfc/oegb8cT7Wfpq8yS/3oMezigoGpdgxHRjw
 B6LOfrBJgLqDLM2t1+bNYOLCSTi2S9RYgVMtQWN9dC3Bp26ragu7FU0+D
 9Sebx7rkgeoHi2t7QV3UHgc8vU9zQG7ytodDALZ1V+5P6NPpbv4tPEhwY
 xT+26r8tLNFYGtmbmku7nlc6udmhOX0hD01SrZR2iNEuDrIHsY35QXmhd
 8x0onBVnnc+s3NXQCClGs8gBOYDQWuwYwO9CnAKBhacKcbEySKe08nIY7
 xZRRwt74XGCxsdiqFHUPi/PUooh5zMrwk7HCuXKKMCqpogxqI/Lm9EIyB w==;
X-CSE-ConnectionGUID: 8y1tSHd7QnuEr7e88Soihg==
X-CSE-MsgGUID: rlj04SfFS26IYKwaZNdT/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66861973"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66861973"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:47 -0800
X-CSE-ConnectionGUID: M5oZDkt6Sgu9p3bhMshVQQ==
X-CSE-MsgGUID: KiR+YA3XRP6/44s91ALymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195188195"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 11/25] drm/vblank: use the vblank based interfaces more
Date: Fri,  5 Dec 2025 13:27:27 +0200
Message-ID: <a79ef156466d3ec1206b4175e4c5bdcd14ca6bf6.1764933891.git.jani.nikula@intel.com>
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

With the prep work in place, we can get rid of _drm_vblank_get(),
_drm_vblank_put(), and _drm_vblank_count().

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 44 ++++++++----------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 49b59af1512e..d0460cd5d345 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -403,14 +403,6 @@ u64 drm_vblank_crtc_count(struct drm_vblank_crtc *vblank)
 	return count;
 }
 
-static u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
-{
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return 0;
-
-	return drm_vblank_crtc_count(drm_vblank_crtc(dev, pipe));
-}
-
 /**
  * drm_crtc_accurate_vblank_count - retrieve the master vblank counter
  * @crtc: which counter to retrieve
@@ -942,7 +934,7 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
  */
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc)
 {
-	return drm_vblank_count(crtc->dev, drm_crtc_index(crtc));
+	return drm_vblank_crtc_count(drm_crtc_vblank_crtc(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count);
 
@@ -1241,14 +1233,6 @@ int drm_vblank_crtc_get(struct drm_vblank_crtc *vblank)
 	return ret;
 }
 
-static int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
-{
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return -EINVAL;
-
-	return drm_vblank_crtc_get(drm_vblank_crtc(dev, pipe));
-}
-
 /**
  * drm_crtc_vblank_get - get a reference count on vblank events
  * @crtc: which CRTC to own
@@ -1261,7 +1245,7 @@ static int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
  */
 int drm_crtc_vblank_get(struct drm_crtc *crtc)
 {
-	return drm_vblank_get(crtc->dev, drm_crtc_index(crtc));
+	return drm_vblank_crtc_get(drm_crtc_vblank_crtc(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_get);
 
@@ -1285,14 +1269,6 @@ void drm_vblank_crtc_put(struct drm_vblank_crtc *vblank)
 	}
 }
 
-static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
-{
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
-
-	drm_vblank_crtc_put(drm_vblank_crtc(dev, pipe));
-}
-
 /**
  * drm_crtc_vblank_put - give up ownership of vblank events
  * @crtc: which counter to give up
@@ -1303,7 +1279,7 @@ static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
  */
 void drm_crtc_vblank_put(struct drm_crtc *crtc)
 {
-	drm_vblank_put(crtc->dev, drm_crtc_index(crtc));
+	drm_vblank_crtc_put(drm_crtc_vblank_crtc(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_put);
 
@@ -1404,7 +1380,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 			     "wanted %llu, current %llu\n",
 			     e->sequence, seq);
 		list_del(&e->base.link);
-		drm_vblank_put(dev, pipe);
+		drm_vblank_crtc_put(vblank);
 		send_vblank_event(dev, e, seq, now);
 	}
 
@@ -1680,7 +1656,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 
 	e->sequence = req_seq;
 	if (drm_vblank_passed(seq, req_seq)) {
-		drm_vblank_put(dev, pipe);
+		drm_vblank_crtc_put(vblank);
 		send_vblank_event(dev, e, seq, now);
 		vblwait->reply.sequence = seq;
 	} else {
@@ -1697,7 +1673,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 	spin_unlock_irq(&dev->event_lock);
 	kfree(e);
 err_put:
-	drm_vblank_put(dev, pipe);
+	drm_vblank_crtc_put(vblank);
 	return ret;
 }
 
@@ -1815,14 +1791,14 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 		return 0;
 	}
 
-	ret = drm_vblank_get(dev, pipe);
+	ret = drm_vblank_crtc_get(vblank);
 	if (ret) {
 		drm_dbg_core(dev,
 			     "crtc %d failed to acquire vblank counter, %d\n",
 			     pipe, ret);
 		return ret;
 	}
-	seq = drm_vblank_count(dev, pipe);
+	seq = drm_vblank_crtc_count(vblank);
 
 	switch (vblwait->request.type & _DRM_VBLANK_TYPES_MASK) {
 	case _DRM_VBLANK_RELATIVE:
@@ -1858,7 +1834,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
 			     req_seq, pipe);
 		wait = wait_event_interruptible_timeout(vblank->queue,
-			drm_vblank_passed(drm_vblank_count(dev, pipe), req_seq) ||
+			drm_vblank_passed(drm_vblank_crtc_count(vblank), req_seq) ||
 				      !READ_ONCE(vblank->enabled),
 			msecs_to_jiffies(3000));
 
@@ -1888,7 +1864,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	}
 
 done:
-	drm_vblank_put(dev, pipe);
+	drm_vblank_crtc_put(vblank);
 	return ret;
 }
 
-- 
2.47.3

