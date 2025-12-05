Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D67CA767F
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A0410EAFC;
	Fri,  5 Dec 2025 11:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmmpoFpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0399710EAFA;
 Fri,  5 Dec 2025 11:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934187; x=1796470187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=43LZUnskhGiQGpCiVuBWfYheMRbkeUexzdlPPyeTYfI=;
 b=KmmpoFpQ4wKtWOkb3dCDIfhqrw7H4ccV7AcrEMtAuzXz5NHg6I9h1vzO
 s7/gttxh/zxXP/BzdDLu2GSLpz0DbT4ZYLYiKKDejWHUHE6s6j316shUn
 /wGu/q+FC9N1IXdPURxwMfRrr5xjGw0NgNZjzD7/d2EfdVPczlp3ajMCg
 Eki9UCtRtJsZ9UQrkG53YBIVGaqyPvhJr3gGW//uIueqO0FdL6bN0cwan
 UlCJsUOUFPov4c+WyVD7bMr9UvmS5IshlOy69IWiFLovXdiytZxLbNztd
 ATEYNRrr4Cl2z+jRgEyG57lhmY/9vFo9XHqFS7EljOWB9cMDf3fUksOOO g==;
X-CSE-ConnectionGUID: kEk701IAQz2DZNC6cRSsNw==
X-CSE-MsgGUID: ESqXZLItQ7+xWJA/Lpe4kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66902991"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66902991"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:46 -0800
X-CSE-ConnectionGUID: f8GAEMaTSLiU0F4RKTpyOA==
X-CSE-MsgGUID: 526CbuUqROWU8Gy109GR5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199757712"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 22/25] drm/vblank: pass vblank to
 drm_get_last_vbltimestamp()
Date: Fri,  5 Dec 2025 13:27:38 +0200
Message-ID: <2bc71eb80db23bfb5c4aacd082cde3b12c20a63b.1764933891.git.jani.nikula@intel.com>
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
code. Rename to drm_vblank_crtc_get_last_timestamp().

v2: Rename (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 52fa4ca361e3..4a88cdea086d 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -162,9 +162,8 @@
  */
 #define DRM_REDUNDANT_VBLIRQ_THRESH_NS 1000000
 
-static bool
-drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
-			  ktime_t *tvblank, bool in_vblank_irq);
+static bool drm_vblank_crtc_get_last_timestamp(struct drm_vblank_crtc *vblank,
+					       ktime_t *tvblank, bool in_vblank_irq);
 
 static unsigned int drm_timestamp_precision = 20;  /* Default to 20 usecs. */
 
@@ -253,7 +252,6 @@ static u32 drm_vblank_crtc_get_counter(struct drm_vblank_crtc *vblank)
 static void drm_vblank_crtc_reset_timestamp(struct drm_vblank_crtc *vblank)
 {
 	struct drm_device *dev = vblank->dev;
-	unsigned int pipe = vblank->pipe;
 	u32 cur_vblank;
 	bool rc;
 	ktime_t t_vblank;
@@ -267,7 +265,7 @@ static void drm_vblank_crtc_reset_timestamp(struct drm_vblank_crtc *vblank)
 	 */
 	do {
 		cur_vblank = drm_vblank_crtc_get_counter(vblank);
-		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
+		rc = drm_vblank_crtc_get_last_timestamp(vblank, &t_vblank, false);
 	} while (cur_vblank != drm_vblank_crtc_get_counter(vblank) && --count > 0);
 
 	/*
@@ -325,7 +323,7 @@ static void drm_vblank_crtc_update_count(struct drm_vblank_crtc *vblank,
 	 */
 	do {
 		cur_vblank = drm_vblank_crtc_get_counter(vblank);
-		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, in_vblank_irq);
+		rc = drm_vblank_crtc_get_last_timestamp(vblank, &t_vblank, in_vblank_irq);
 	} while (cur_vblank != drm_vblank_crtc_get_counter(vblank) && --count > 0);
 
 	if (max_vblank_count) {
@@ -911,11 +909,10 @@ drm_crtc_get_last_vbltimestamp(struct drm_crtc *crtc, ktime_t *tvblank,
 	return ret;
 }
 
-static bool
-drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
-			  ktime_t *tvblank, bool in_vblank_irq)
+static bool drm_vblank_crtc_get_last_timestamp(struct drm_vblank_crtc *vblank,
+					       ktime_t *tvblank, bool in_vblank_irq)
 {
-	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
+	struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
 
 	return drm_crtc_get_last_vbltimestamp(crtc, tvblank, in_vblank_irq);
 }
@@ -1555,7 +1552,6 @@ EXPORT_SYMBOL(drm_crtc_vblank_on);
 void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	ktime_t t_vblank;
 	int framedur_ns;
@@ -1578,7 +1574,7 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 
 	do {
 		cur_vblank = drm_vblank_crtc_get_counter(vblank);
-		drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
+		drm_vblank_crtc_get_last_timestamp(vblank, &t_vblank, false);
 	} while (cur_vblank != drm_vblank_crtc_get_counter(vblank) && --count > 0);
 
 	diff_ns = ktime_to_ns(ktime_sub(t_vblank, vblank->time));
-- 
2.47.3

