Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A594CA7673
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EC510EAF7;
	Fri,  5 Dec 2025 11:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHVkTdai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE29010EAF6;
 Fri,  5 Dec 2025 11:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934176; x=1796470176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4SkzwpPuP5rofhCHD2nmuKKcvnA/gWVjy6fcSI/RT4w=;
 b=NHVkTdai6dm2N9vqV+VmoOtp5xaw+uz7QZl02MF3TQE9W9HVhQiIe3Ft
 TT2/jYe4zmfeIgTKmFMzn7fTIO9+Ej2StLzEmHZpLRiV8no/JbHuknUxy
 Y0pXwf4O8nM0Sj/e3+CA0bT3wHBkpzUYUy9R2KQJjD1e6mF2zMt+Vphxn
 yKEs9n+bzxzuqUPlOTpkXnA5qx7OcxM39/GSD80VIpkBEVCHwAXfn/51P
 dWiZwOSABwDBq2yeSXI/76aewcTXmMO9lgYGO0uXUcISopD/zV9+LhPXu
 D2srhSFCwRULmz96IzwSVySCPP9NgX8guDEPpBnCja8pzXwu1mpZZtIEx Q==;
X-CSE-ConnectionGUID: OPtkAJKKRYCzperju6Zv9A==
X-CSE-MsgGUID: OJeVutmLQ+G+UF+X01Me2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66902976"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66902976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:36 -0800
X-CSE-ConnectionGUID: J5yfwmBtQEm/2NPRCMCZpQ==
X-CSE-MsgGUID: VmmqJTNxQ4anlB8S32avJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199757624"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 20/25] drm/vblank: pass vblank to __get_vblank_counter()
 and drm_max_vblank_count()
Date: Fri,  5 Dec 2025 13:27:36 +0200
Message-ID: <e2a3f7ee7a54869eb6e01abe41ab82f93a224bcf.1764933891.git.jani.nikula@intel.com>
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

Use the vblank pointer instead of a dev, pipe pair to simplify
code. Rename the functions to drm_vblank_crtc_get_counter() and
drm_vblank_crtc_max_count().

v2: Rename (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index d43165ee594a..04c75cdbb916 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -209,27 +209,27 @@ static void drm_vblank_crtc_store(struct drm_vblank_crtc *vblank,
 	write_sequnlock(&vblank->seqlock);
 }
 
-static u32 drm_max_vblank_count(struct drm_device *dev, unsigned int pipe)
+static u32 drm_vblank_crtc_max_count(struct drm_vblank_crtc *vblank)
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
+static u32 drm_vblank_crtc_no_hw_counter(struct drm_vblank_crtc *vblank)
 {
-	drm_WARN_ON_ONCE(dev, drm_max_vblank_count(dev, pipe) != 0);
+	drm_WARN_ON_ONCE(vblank->dev, drm_vblank_crtc_max_count(vblank) != 0);
 	return 0;
 }
 
-static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
+static u32 drm_vblank_crtc_get_counter(struct drm_vblank_crtc *vblank)
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
+	return drm_vblank_crtc_no_hw_counter(vblank);
 }
 
 /*
@@ -266,9 +266,9 @@ static void drm_vblank_crtc_reset_timestamp(struct drm_vblank_crtc *vblank)
 	 * when drm_vblank_enable() applies the diff
 	 */
 	do {
-		cur_vblank = __get_vblank_counter(dev, pipe);
+		cur_vblank = drm_vblank_crtc_get_counter(vblank);
 		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
-	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
+	} while (cur_vblank != drm_vblank_crtc_get_counter(vblank) && --count > 0);
 
 	/*
 	 * Only reinitialize corresponding vblank timestamp if high-precision query
@@ -309,7 +309,7 @@ static void drm_vblank_crtc_update_count(struct drm_vblank_crtc *vblank,
 	ktime_t t_vblank;
 	int count = DRM_TIMESTAMP_MAXRETRIES;
 	int framedur_ns = vblank->framedur_ns;
-	u32 max_vblank_count = drm_max_vblank_count(dev, pipe);
+	u32 max_vblank_count = drm_vblank_crtc_max_count(vblank);
 
 	/*
 	 * Interrupts were disabled prior to this call, so deal with counter
@@ -324,9 +324,9 @@ static void drm_vblank_crtc_update_count(struct drm_vblank_crtc *vblank,
 	 * corresponding vblank timestamp.
 	 */
 	do {
-		cur_vblank = __get_vblank_counter(dev, pipe);
+		cur_vblank = drm_vblank_crtc_get_counter(vblank);
 		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, in_vblank_irq);
-	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
+	} while (cur_vblank != drm_vblank_crtc_get_counter(vblank) && --count > 0);
 
 	if (max_vblank_count) {
 		/* trust the hw counter when it's around */
@@ -1558,7 +1558,7 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 	u64 diff_ns;
 	u32 cur_vblank, diff = 1;
 	int count = DRM_TIMESTAMP_MAXRETRIES;
-	u32 max_vblank_count = drm_max_vblank_count(dev, pipe);
+	u32 max_vblank_count = drm_vblank_crtc_max_count(vblank);
 
 	drm_WARN_ON_ONCE(dev, !crtc->funcs->get_vblank_timestamp);
 	drm_WARN_ON_ONCE(dev, vblank->inmodeset);
@@ -1573,9 +1573,9 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 	framedur_ns = vblank->framedur_ns;
 
 	do {
-		cur_vblank = __get_vblank_counter(dev, pipe);
+		cur_vblank = drm_vblank_crtc_get_counter(vblank);
 		drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
-	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
+	} while (cur_vblank != drm_vblank_crtc_get_counter(vblank) && --count > 0);
 
 	diff_ns = ktime_to_ns(ktime_sub(t_vblank, vblank->time));
 	if (framedur_ns)
-- 
2.47.3

