Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8376C47DD9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0594910E44B;
	Mon, 10 Nov 2025 16:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUd7uG7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA8010E444;
 Mon, 10 Nov 2025 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791521; x=1794327521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e/892pneXblg6zqnaTnxQMjqYto7wXBeO+9zcw3t85I=;
 b=cUd7uG7RLO4J8uXUGSvXNwTJ0ZXtlPs1TqIOkQHwsMOP8s30vcnZY+rY
 4Xaudsta/7Z0MNRam/kS26z6/GfWhsyxYw7WyxdMCpUbHJwax2aLk13xh
 VQFL3iwPOlSJRRwt0kUJetnjnLMDW0VuN4/+9eE7OHMrp34u6aa6qIRCK
 jJQ8HpzIFPxXbafBh2c7zel+NnxEb0/ZEqpQpROsHGTV/hadNLVrVwZDz
 O+2jICDdNEJxui9ktaw3zJUkxcDm9J2QlM6rue90EdtoOmE+iMvv8weTo
 hjIXjkbYxTpSlkVeptFTzl8Q8H7eHMY3HDZKF3Qmd6JGYFB/sMEk6rVug Q==;
X-CSE-ConnectionGUID: s966YSIiT3+2kM0P4kIUzA==
X-CSE-MsgGUID: NLLyKoV/Sle8hlU5HO2ifw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75136544"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75136544"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:40 -0800
X-CSE-ConnectionGUID: 0xwlcObMSuSDbbU5ObqUpg==
X-CSE-MsgGUID: /ja8SigaQ+CDhmN8vJXB3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188552037"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/24] drm/vblank: use the vblank based interfaces more
Date: Mon, 10 Nov 2025 18:17:28 +0200
Message-ID: <5bc164f2dfe11bf9a2655797e17e420405261c21.1762791343.git.jani.nikula@intel.com>
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

With the prep work in place, we can get rid of _drm_vblank_get(),
_drm_vblank_put(), and _drm_vblank_count().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 44 ++++++++----------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 91bedf8e6ea8..1c0ade41a57f 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -403,14 +403,6 @@ u64 drm_vblank_count(struct drm_vblank_crtc *vblank)
 	return count;
 }
 
-static u64 _drm_vblank_count(struct drm_device *dev, unsigned int pipe)
-{
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return 0;
-
-	return drm_vblank_count(drm_vblank_crtc(dev, pipe));
-}
-
 /**
  * drm_crtc_accurate_vblank_count - retrieve the master vblank counter
  * @crtc: which counter to retrieve
@@ -940,7 +932,7 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
  */
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc)
 {
-	return _drm_vblank_count(crtc->dev, drm_crtc_index(crtc));
+	return drm_vblank_count(drm_crtc_vblank_crtc(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count);
 
@@ -1238,14 +1230,6 @@ int drm_vblank_get(struct drm_vblank_crtc *vblank)
 	return ret;
 }
 
-static int _drm_vblank_get(struct drm_device *dev, unsigned int pipe)
-{
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return -EINVAL;
-
-	return drm_vblank_get(drm_vblank_crtc(dev, pipe));
-}
-
 /**
  * drm_crtc_vblank_get - get a reference count on vblank events
  * @crtc: which CRTC to own
@@ -1258,7 +1242,7 @@ static int _drm_vblank_get(struct drm_device *dev, unsigned int pipe)
  */
 int drm_crtc_vblank_get(struct drm_crtc *crtc)
 {
-	return _drm_vblank_get(crtc->dev, drm_crtc_index(crtc));
+	return drm_vblank_get(drm_crtc_vblank_crtc(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_get);
 
@@ -1282,14 +1266,6 @@ void drm_vblank_put(struct drm_vblank_crtc *vblank)
 	}
 }
 
-static void _drm_vblank_put(struct drm_device *dev, unsigned int pipe)
-{
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
-
-	drm_vblank_put(drm_vblank_crtc(dev, pipe));
-}
-
 /**
  * drm_crtc_vblank_put - give up ownership of vblank events
  * @crtc: which counter to give up
@@ -1300,7 +1276,7 @@ static void _drm_vblank_put(struct drm_device *dev, unsigned int pipe)
  */
 void drm_crtc_vblank_put(struct drm_crtc *crtc)
 {
-	_drm_vblank_put(crtc->dev, drm_crtc_index(crtc));
+	drm_vblank_put(drm_crtc_vblank_crtc(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_put);
 
@@ -1401,7 +1377,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 			     "wanted %llu, current %llu\n",
 			     e->sequence, seq);
 		list_del(&e->base.link);
-		_drm_vblank_put(dev, pipe);
+		drm_vblank_put(vblank);
 		send_vblank_event(dev, e, seq, now);
 	}
 
@@ -1677,7 +1653,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 
 	e->sequence = req_seq;
 	if (drm_vblank_passed(seq, req_seq)) {
-		_drm_vblank_put(dev, pipe);
+		drm_vblank_put(vblank);
 		send_vblank_event(dev, e, seq, now);
 		vblwait->reply.sequence = seq;
 	} else {
@@ -1694,7 +1670,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 	spin_unlock_irq(&dev->event_lock);
 	kfree(e);
 err_put:
-	_drm_vblank_put(dev, pipe);
+	drm_vblank_put(vblank);
 	return ret;
 }
 
@@ -1812,14 +1788,14 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 		return 0;
 	}
 
-	ret = _drm_vblank_get(dev, pipe);
+	ret = drm_vblank_get(vblank);
 	if (ret) {
 		drm_dbg_core(dev,
 			     "crtc %d failed to acquire vblank counter, %d\n",
 			     pipe, ret);
 		return ret;
 	}
-	seq = _drm_vblank_count(dev, pipe);
+	seq = drm_vblank_count(vblank);
 
 	switch (vblwait->request.type & _DRM_VBLANK_TYPES_MASK) {
 	case _DRM_VBLANK_RELATIVE:
@@ -1855,7 +1831,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
 			     req_seq, pipe);
 		wait = wait_event_interruptible_timeout(vblank->queue,
-			drm_vblank_passed(_drm_vblank_count(dev, pipe), req_seq) ||
+			drm_vblank_passed(drm_vblank_count(vblank), req_seq) ||
 				      !READ_ONCE(vblank->enabled),
 			msecs_to_jiffies(3000));
 
@@ -1885,7 +1861,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	}
 
 done:
-	_drm_vblank_put(dev, pipe);
+	drm_vblank_put(vblank);
 	return ret;
 }
 
-- 
2.47.3

