Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B5C47E1E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85410E46A;
	Mon, 10 Nov 2025 16:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wz00vKjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3254710E46A;
 Mon, 10 Nov 2025 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791566; x=1794327566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rN9uH3WVuJs2cSY9nh98mtOVScC9aybdMVr1fYnI5Lk=;
 b=Wz00vKjLrMWzoqq38aJVW1gIda5Y9Wilgvq5zKNW3tYvp4IcHjBCgjxi
 1qlzBH9lP8hsEmIruqxSb4p28L4pwX+kg3J76sbACr7dv4/Vue1trbB2g
 EIcBBDxnEFlZ+eOb98r7HsQTI6o7MwUxF9OhJF2QCIgaYmyGsO/nPnBhI
 hGSB6dq4motXMDYkRgfPGNQaqQKyrGJ5wwKDDJtKEyHxssCErePQAilon
 CxAMoYhMAWSUJdLKc+DvO9/Ethqtx/RaICqEX88bgieSB1Aw6Hsa2pLe0
 PbgURXGS9n0RCDwLiUp9DlJIH8bwiCM0vlAzGZxZIFWIJ+BmfV/92c2Bc g==;
X-CSE-ConnectionGUID: dJJUqhVnSpWtECRDIjoenA==
X-CSE-MsgGUID: vtReqDz4Q0GX7eSJuANYiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82471569"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="82471569"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:25 -0800
X-CSE-ConnectionGUID: rJfuOQ30QJieY5E30QqYjQ==
X-CSE-MsgGUID: 3a94mRZZRraHs/gZuC1s0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="187967321"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 19/24] drm/vblank: pass vblank to __get_vblank_counter() and
 drm_max_vblank_count()
Date: Mon, 10 Nov 2025 18:17:37 +0200
Message-ID: <c2e143b5c10f6f1e02840078a52e9fc467e9bc24.1762791343.git.jani.nikula@intel.com>
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

Use the vblank pointer instead of a dev, pipe pair to simplify code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 34d0b6939d52..955cea949d3d 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -209,27 +209,27 @@ static void store_vblank(struct drm_vblank_crtc *vblank,
 	write_sequnlock(&vblank->seqlock);
 }
 
-static u32 drm_max_vblank_count(struct drm_device *dev, unsigned int pipe)
+static u32 drm_max_vblank_count(struct drm_vblank_crtc *vblank)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
-
-	return vblank->max_vblank_count ?: dev->max_vblank_count;
+	return vblank->max_vblank_count ?: vblank->dev->max_vblank_count;
 }
 
 /*
  * "No hw counter" fallback implementation of .get_vblank_counter() hook,
  * if there is no usable hardware frame counter available.
  */
-static u32 drm_vblank_no_hw_counter(struct drm_device *dev, unsigned int pipe)
+static u32 drm_vblank_no_hw_counter(struct drm_vblank_crtc *vblank)
 {
-	drm_WARN_ON_ONCE(dev, drm_max_vblank_count(dev, pipe) != 0);
+	drm_WARN_ON_ONCE(vblank->dev, drm_max_vblank_count(vblank) != 0);
 	return 0;
 }
 
-static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
+static u32 __get_vblank_counter(struct drm_vblank_crtc *vblank)
 {
+	struct drm_device *dev = vblank->dev;
+
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
+		struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
 
 		if (drm_WARN_ON(dev, !crtc))
 			return 0;
@@ -238,7 +238,7 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 			return crtc->funcs->get_vblank_counter(crtc);
 	}
 
-	return drm_vblank_no_hw_counter(dev, pipe);
+	return drm_vblank_no_hw_counter(vblank);
 }
 
 /*
@@ -266,9 +266,9 @@ static void drm_reset_vblank_timestamp(struct drm_vblank_crtc *vblank)
 	 * when drm_vblank_enable() applies the diff
 	 */
 	do {
-		cur_vblank = __get_vblank_counter(dev, pipe);
+		cur_vblank = __get_vblank_counter(vblank);
 		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
-	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
+	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
 
 	/*
 	 * Only reinitialize corresponding vblank timestamp if high-precision query
@@ -309,7 +309,7 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
 	ktime_t t_vblank;
 	int count = DRM_TIMESTAMP_MAXRETRIES;
 	int framedur_ns = vblank->framedur_ns;
-	u32 max_vblank_count = drm_max_vblank_count(dev, pipe);
+	u32 max_vblank_count = drm_max_vblank_count(vblank);
 
 	/*
 	 * Interrupts were disabled prior to this call, so deal with counter
@@ -324,9 +324,9 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
 	 * corresponding vblank timestamp.
 	 */
 	do {
-		cur_vblank = __get_vblank_counter(dev, pipe);
+		cur_vblank = __get_vblank_counter(vblank);
 		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, in_vblank_irq);
-	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
+	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
 
 	if (max_vblank_count) {
 		/* trust the hw counter when it's around */
@@ -1555,7 +1555,7 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 	u64 diff_ns;
 	u32 cur_vblank, diff = 1;
 	int count = DRM_TIMESTAMP_MAXRETRIES;
-	u32 max_vblank_count = drm_max_vblank_count(dev, pipe);
+	u32 max_vblank_count = drm_max_vblank_count(vblank);
 
 	drm_WARN_ON_ONCE(dev, !crtc->funcs->get_vblank_timestamp);
 	drm_WARN_ON_ONCE(dev, vblank->inmodeset);
@@ -1570,9 +1570,9 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 	framedur_ns = vblank->framedur_ns;
 
 	do {
-		cur_vblank = __get_vblank_counter(dev, pipe);
+		cur_vblank = __get_vblank_counter(vblank);
 		drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
-	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
+	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
 
 	diff_ns = ktime_to_ns(ktime_sub(t_vblank, vblank->time));
 	if (framedur_ns)
-- 
2.47.3

