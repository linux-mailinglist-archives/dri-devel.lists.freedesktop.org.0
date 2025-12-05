Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5856FCA761C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F1910EAD2;
	Fri,  5 Dec 2025 11:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hw9Elcn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9A410EADE;
 Fri,  5 Dec 2025 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934118; x=1796470118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zO/59k9iScF8Gqdi92jOZyCG2x7pey6w4qt1TJtgUX4=;
 b=Hw9Elcn3OmQfoTmDd6Fy+03JG8IeeN1NlR0JFNXHCZy/6tw/a0i5MNft
 w8fR86U4tETPyaU/aic6MKHDZ/orppN7n6YiNc3gmIlTBo/55BGqIXhh3
 D1JA05uUMAF1OhQl9I4FtiEt56VSMb4qhcz+3Gaix/ZBVcZNjov2p84cZ
 OGMhDPbOnTXvnWEnuY39solLdaZfeu51HGTB1raNv6NOA3nmOE/Z5SaK6
 WvaPjC7anytjN8Ib433xMyVYhOkYr6Asj0yDDThaq8T25zSUV/vbcoUrk
 zWmfssh56s2ZIPuJVFB/m7cImSaz26fVP/oIF8xIX3PoAsCVY1J4/D5mc g==;
X-CSE-ConnectionGUID: 6VbukSjLRQezd9acGAl4FQ==
X-CSE-MsgGUID: cCTV+06kR9O9b04WOaV92A==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66861945"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66861945"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:37 -0800
X-CSE-ConnectionGUID: zuAHWrOZSnSZXoo1IbTSuw==
X-CSE-MsgGUID: Jn7d2S9OTq2LFHmJGnbNqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195188159"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 09/25] drm/vblank: pass vblank to drm_update_vblank_count()
Date: Fri,  5 Dec 2025 13:27:25 +0200
Message-ID: <25efe474f27710cdfecf864cdad7cdfbb5d5ebe8.1764933891.git.jani.nikula@intel.com>
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
code. Rename to drm_vblank_crtc_update_count().

v2: Rename the function (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index aeb931c825ca..da8ca8928232 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -292,10 +292,11 @@ static void drm_reset_vblank_timestamp(struct drm_device *dev, unsigned int pipe
  * Note: caller must hold &drm_device.vbl_lock since this reads & writes
  * device vblank fields.
  */
-static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
-				    bool in_vblank_irq)
+static void drm_vblank_crtc_update_count(struct drm_vblank_crtc *vblank,
+					 bool in_vblank_irq)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_device *dev = vblank->dev;
+	unsigned int pipe = vblank->pipe;
 	u32 cur_vblank, diff;
 	bool rc;
 	ktime_t t_vblank;
@@ -424,8 +425,8 @@ static u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
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
-	vblank = drm_vblank_count(dev, pipe);
+	drm_vblank_crtc_update_count(vblank, false);
+	vblank_count = drm_vblank_crtc_count(vblank);
 
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
+	drm_vblank_crtc_update_count(vblank, false);
 	__disable_vblank(dev, pipe);
 	vblank->enabled = false;
 
@@ -1199,11 +1200,12 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 		if (ret) {
 			atomic_dec(&vblank->refcount);
 		} else {
-			drm_update_vblank_count(dev, pipe, 0);
-			/* drm_update_vblank_count() includes a wmb so we just
-			 * need to ensure that the compiler emits the write
-			 * to mark the vblank as enabled after the call
-			 * to drm_update_vblank_count().
+			drm_vblank_crtc_update_count(vblank, 0);
+			/*
+			 * drm_vblank_crtc_update_count() includes a wmb so we
+			 * just need to ensure that the compiler emits the write
+			 * to mark the vblank as enabled after the call to
+			 * drm_vblank_crtc_update_count().
 			 */
 			WRITE_ONCE(vblank->enabled, true);
 		}
@@ -1959,7 +1961,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 		return false;
 	}
 
-	drm_update_vblank_count(dev, pipe, true);
+	drm_vblank_crtc_update_count(vblank, true);
 
 	spin_unlock(&dev->vblank_time_lock);
 
-- 
2.47.3

