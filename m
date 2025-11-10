Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76684C47E2D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4DC10E474;
	Mon, 10 Nov 2025 16:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UchcPMNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C1C10E471;
 Mon, 10 Nov 2025 16:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791578; x=1794327578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8S7admeIwYhYFFGN41A57VsReSXYPb7CrwNT+1iISk8=;
 b=UchcPMNIyypnNZ3aVJ8zUh+NKXlA5VyOsqVxaOsF/lyH1JsMJ6FN2RRU
 vjOqfWDTlWGabyUozIPez/JwWSaQj7m0223S95mMFHc26phtbnzNVAc7p
 WF57/5WIBYkoKOCxThi4BOltvHFixCD97yQTZiKHhnzf1ni+P6GuuVn4P
 /qV9LRvOziYm7NuQIdeS44xzkT1msqNneGgBeVmwg4iH7Exr8/nFGYyzh
 jRq161qIANF5lmu+ZVads5E0o0hzwPiPU7Towyx0cQeU0cxVySzVaGhzL
 ewEFxwlLQ8LE2EFLNnWjQxCor8gm+UmjPgx90rKEILoEkKaxxDiZvXKQa Q==;
X-CSE-ConnectionGUID: tT/Iwn5ITTaaUDKd+X4XZw==
X-CSE-MsgGUID: dBIdN7QfQ7e0ZzGgtwQwAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75950093"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75950093"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:37 -0800
X-CSE-ConnectionGUID: JiIeEJcJRw+fFBTSnbmL2w==
X-CSE-MsgGUID: tPBsHwVsQj6IG0VCsY/LWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="192819754"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 21/24] drm/vblank: pass vblank to drm_get_last_vbltimestamp()
Date: Mon, 10 Nov 2025 18:17:39 +0200
Message-ID: <37e6210dd475c9d4e53a1feadc5cb42fa1e0aeac.1762791343.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_vblank.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index a274b4a7b1c2..ee9355d5069b 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -162,9 +162,8 @@
  */
 #define DRM_REDUNDANT_VBLIRQ_THRESH_NS 1000000
 
-static bool
-drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
-			  ktime_t *tvblank, bool in_vblank_irq);
+static bool drm_get_last_vbltimestamp(struct drm_vblank_crtc *vblank,
+				      ktime_t *tvblank, bool in_vblank_irq);
 
 static unsigned int drm_timestamp_precision = 20;  /* Default to 20 usecs. */
 
@@ -253,7 +252,6 @@ static u32 __get_vblank_counter(struct drm_vblank_crtc *vblank)
 static void drm_reset_vblank_timestamp(struct drm_vblank_crtc *vblank)
 {
 	struct drm_device *dev = vblank->dev;
-	unsigned int pipe = vblank->pipe;
 	u32 cur_vblank;
 	bool rc;
 	ktime_t t_vblank;
@@ -267,7 +265,7 @@ static void drm_reset_vblank_timestamp(struct drm_vblank_crtc *vblank)
 	 */
 	do {
 		cur_vblank = __get_vblank_counter(vblank);
-		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
+		rc = drm_get_last_vbltimestamp(vblank, &t_vblank, false);
 	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
 
 	/*
@@ -325,7 +323,7 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
 	 */
 	do {
 		cur_vblank = __get_vblank_counter(vblank);
-		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, in_vblank_irq);
+		rc = drm_get_last_vbltimestamp(vblank, &t_vblank, in_vblank_irq);
 	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
 
 	if (max_vblank_count) {
@@ -909,11 +907,10 @@ drm_crtc_get_last_vbltimestamp(struct drm_crtc *crtc, ktime_t *tvblank,
 	return ret;
 }
 
-static bool
-drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
-			  ktime_t *tvblank, bool in_vblank_irq)
+static bool drm_get_last_vbltimestamp(struct drm_vblank_crtc *vblank,
+				      ktime_t *tvblank, bool in_vblank_irq)
 {
-	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
+	struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
 
 	return drm_crtc_get_last_vbltimestamp(crtc, tvblank, in_vblank_irq);
 }
@@ -1552,7 +1549,6 @@ EXPORT_SYMBOL(drm_crtc_vblank_on);
 void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	ktime_t t_vblank;
 	int framedur_ns;
@@ -1575,7 +1571,7 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 
 	do {
 		cur_vblank = __get_vblank_counter(vblank);
-		drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
+		drm_get_last_vbltimestamp(vblank, &t_vblank, false);
 	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
 
 	diff_ns = ktime_to_ns(ktime_sub(t_vblank, vblank->time));
-- 
2.47.3

