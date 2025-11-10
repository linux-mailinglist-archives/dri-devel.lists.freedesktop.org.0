Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA384C47DC8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2997110E446;
	Mon, 10 Nov 2025 16:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEO8ukYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461F110E443;
 Mon, 10 Nov 2025 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791511; x=1794327511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=82wHXwC8+WOrchr5rHAYJyUrUmFZLaJWSawXBMa6EHs=;
 b=JEO8ukYHGje/Zvc7whTlSN3rAsLdv639Yp7EF6LGnHTkwZgJn7UA5xPR
 vafVQRRLC04tS/5k0ShGDXT6T62MAuf6SXOmg4ot4Mv1NW2kSa+UQGelT
 TMgYYwzK7BGnf6SmqkskrZeN4nDjD9NLhBn52DuWVnck40wascjlH1P0+
 4UuSsaFksNP8abEgXYgTnqDKW5aok2CCpwhrKUvmUgD2j2aURkTly4Ww4
 KYmW438GmJG4pPd0NcfFL8cyfeSZMSE+FpK8M95Akw7MphYRJFTd90ax/
 YECUbZnoOa0jxBHEedwYgYpMYC2ob0GiClCecSwvAmyDXnExnH0AJfhFE w==;
X-CSE-ConnectionGUID: 4KrEcs01QXm9OxCjpesh0A==
X-CSE-MsgGUID: qp7UJ+zuSqKlZBkkYOnO7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67450215"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="67450215"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:30 -0800
X-CSE-ConnectionGUID: YFw8NynSR4G1SvIPM3Z7DA==
X-CSE-MsgGUID: DQxUbJNYRFShTDtrFkaSSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188954165"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/24] drm/vblank: pass vblank to drm_update_vblank_count()
Date: Mon, 10 Nov 2025 18:17:26 +0200
Message-ID: <47df78be44758526a967b4c04fcb010f9771eb82.1762791343.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_vblank.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 0ae34f848660..d2748ed01c34 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -292,10 +292,11 @@ static void drm_reset_vblank_timestamp(struct drm_device *dev, unsigned int pipe
  * Note: caller must hold &drm_device.vbl_lock since this reads & writes
  * device vblank fields.
  */
-static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
+static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
 				    bool in_vblank_irq)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_device *dev = vblank->dev;
+	unsigned int pipe = vblank->pipe;
 	u32 cur_vblank, diff;
 	bool rc;
 	ktime_t t_vblank;
@@ -424,8 +425,8 @@ static u64 _drm_vblank_count(struct drm_device *dev, unsigned int pipe)
 u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = drm_crtc_index(crtc);
-	u64 vblank;
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+	u64 vblank_count;
 	unsigned long flags;
 
 	drm_WARN_ONCE(dev, drm_debug_enabled(DRM_UT_VBL) &&
@@ -434,12 +435,12 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
 
 	spin_lock_irqsave(&dev->vblank_time_lock, flags);
 
-	drm_update_vblank_count(dev, pipe, false);
-	vblank = _drm_vblank_count(dev, pipe);
+	drm_update_vblank_count(vblank, false);
+	vblank_count = drm_vblank_count(vblank);
 
 	spin_unlock_irqrestore(&dev->vblank_time_lock, flags);
 
-	return vblank;
+	return vblank_count;
 }
 EXPORT_SYMBOL(drm_crtc_accurate_vblank_count);
 
@@ -490,7 +491,7 @@ void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
 	 * this time. This makes the count account for the entire time
 	 * between drm_crtc_vblank_on() and drm_crtc_vblank_off().
 	 */
-	drm_update_vblank_count(dev, pipe, false);
+	drm_update_vblank_count(vblank, false);
 	__disable_vblank(dev, pipe);
 	vblank->enabled = false;
 
@@ -1197,7 +1198,7 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 		if (ret) {
 			atomic_dec(&vblank->refcount);
 		} else {
-			drm_update_vblank_count(dev, pipe, 0);
+			drm_update_vblank_count(vblank, 0);
 			/* drm_update_vblank_count() includes a wmb so we just
 			 * need to ensure that the compiler emits the write
 			 * to mark the vblank as enabled after the call
@@ -1957,7 +1958,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 		return false;
 	}
 
-	drm_update_vblank_count(dev, pipe, true);
+	drm_update_vblank_count(vblank, true);
 
 	spin_unlock(&dev->vblank_time_lock);
 
-- 
2.47.3

