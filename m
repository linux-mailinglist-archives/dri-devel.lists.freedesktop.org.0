Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8063C47E31
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AAF10E479;
	Mon, 10 Nov 2025 16:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMXz66qF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B43710E475;
 Mon, 10 Nov 2025 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791583; x=1794327583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fdMJepFvwfkTFAnSBGU8wy7EpqdY0hWjSCAugFTK6hs=;
 b=TMXz66qF3h5PW6fv/YB4kKA+2KPrGm6nA1ifKzKxlzXfQ/68sQceH1cT
 cbCDK1KAgFO4ty6DFEe4w3ZtzKUs63PMlBSxP/XMgX8t+i4rv05zDaMp2
 McZDf4s3lhs09NtdCUFknffvMmRMtqxVsWtPEvgm+cj5CCbDMIjiVl1vc
 lmpxSdQnEYvqgrdqQ2IzCK3OcobBh+lRLoIEHHxOnv344OLrLVjkKZ1tV
 vufjRyZ45uUZ5rVnZuiLUFktO+kHqPtD711fL0F1MMiEzziJ0icKvSTzt
 EcrkexqOZkFHKdDGThk3Y0xFCoXsIOKlm9TdtBdhAW1S6ho3I+ygrDL9o A==;
X-CSE-ConnectionGUID: NGXdFEBFSrWQYY5yUiktXA==
X-CSE-MsgGUID: uxjxwOKJR5CSwofuIHDuLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76295054"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="76295054"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:43 -0800
X-CSE-ConnectionGUID: kUrFuFbQTZ6fQie7xM5+VQ==
X-CSE-MsgGUID: vDz1LTeFT+GFR0PVh76r6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="219368820"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 22/24] drm/vblank: pass vblank to
 drm_vblank_disable_and_save(), make static
Date: Mon, 10 Nov 2025 18:17:40 +0200
Message-ID: <586b73b0373bb22c2a59aeff94ddbbe868c879fc.1762791343.git.jani.nikula@intel.com>
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

drm_vblank_disable_and_save() is also no longer used outside of
drm_vblank.c; make it static while at it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_internal.h | 1 -
 drivers/gpu/drm/drm_vblank.c   | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index e9c85c3681f1..6a7b53de03a8 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -100,7 +100,6 @@ static inline bool drm_vblank_passed(u64 seq, u64 ref)
 	return (seq - ref) <= (1 << 23);
 }
 
-void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
 int drm_vblank_get(struct drm_vblank_crtc *vblank);
 void drm_vblank_put(struct drm_vblank_crtc *vblank);
 u64 drm_vblank_count(struct drm_vblank_crtc *vblank);
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index ee9355d5069b..44fb8d225485 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -462,9 +462,9 @@ static void __disable_vblank(struct drm_vblank_crtc *vblank)
  * are preserved, even if there are any spurious vblank irq's after
  * disable.
  */
-void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
+static void drm_vblank_disable_and_save(struct drm_vblank_crtc *vblank)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_device *dev = vblank->dev;
 	unsigned long irqflags;
 
 	assert_spin_locked(&dev->vbl_lock);
@@ -509,7 +509,7 @@ static void vblank_disable_fn(struct timer_list *t)
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
 	if (atomic_read(&vblank->refcount) == 0 && vblank->enabled) {
 		drm_dbg_core(dev, "disabling vblank on crtc %u\n", pipe);
-		drm_vblank_disable_and_save(dev, pipe);
+		drm_vblank_disable_and_save(vblank);
 	}
 	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
 }
@@ -1355,7 +1355,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	/* Avoid redundant vblank disables without previous
 	 * drm_crtc_vblank_on(). */
 	if (drm_core_check_feature(dev, DRIVER_ATOMIC) || !vblank->inmodeset)
-		drm_vblank_disable_and_save(dev, pipe);
+		drm_vblank_disable_and_save(vblank);
 
 	wake_up(&vblank->queue);
 
-- 
2.47.3

