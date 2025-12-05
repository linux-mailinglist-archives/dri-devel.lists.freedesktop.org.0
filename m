Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983A0CA7688
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD77210EB01;
	Fri,  5 Dec 2025 11:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvCf0DwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BFD10EAFF;
 Fri,  5 Dec 2025 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934192; x=1796470192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXU6CVN1T89Z4SpsegUzzkXsjav+CHYCpzMYnLS7fdo=;
 b=XvCf0DwY+7NaQ+DUi3btzXmZTbkETWQz+mLdEm2amd5MhzmsfuON7sSz
 jH7Ki/rTblBsLOteBFE0yWBPgTXHw5sAI3aDjLs7U8NAinKtlNbpN+H+4
 pnnTdluBlqxTvEHUWKWmciY11iF6et3dmJep0/qTFckbbOXc18CY4ZzDC
 NCCxetPUNTwwtcMxR1lriEXkO9H3+dqzeMdBKDkhriABW3neAoVIC4Us4
 hzcM66ZBoIUNSm5Nh2eIBUKNkR4ZkhjAgZnch90URWcjCKuAHeiQzLVm3
 0lL0sH01M8HSFohnyA4hOr4C/R2wtnxUsHHwc0UkhB+o3kwcs873gJCgo w==;
X-CSE-ConnectionGUID: 4CSHyTA8Rjar3zBuuCHQtA==
X-CSE-MsgGUID: JqRP6rmeRhmAKQY5m0Aj2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66902997"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66902997"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:52 -0800
X-CSE-ConnectionGUID: kIO4AN0xTHaHgdoKzmxzWQ==
X-CSE-MsgGUID: bDWP9sghREeFYifeSee1tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199757740"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 23/25] drm/vblank: pass vblank to
 drm_vblank_disable_and_save(), make static
Date: Fri,  5 Dec 2025 13:27:39 +0200
Message-ID: <595dcc5ad7e16da9ef895bd51affeb3ab43eef6c.1764933891.git.jani.nikula@intel.com>
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
code. Rename to drm_vblank_crtc_disable_and_save().

drm_vblank_disable_and_save() is also no longer used outside of
drm_vblank.c; make it static while at it.

v2: Rename (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_internal.h | 1 -
 drivers/gpu/drm/drm_vblank.c   | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 6e7ac5b16d92..4458221685f7 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -111,7 +111,6 @@ static inline bool drm_vblank_passed(u64 seq, u64 ref)
 	return (seq - ref) <= (1 << 23);
 }
 
-void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
 int drm_vblank_crtc_get(struct drm_vblank_crtc *vblank);
 void drm_vblank_crtc_put(struct drm_vblank_crtc *vblank);
 u64 drm_vblank_crtc_count(struct drm_vblank_crtc *vblank);
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 4a88cdea086d..445b62b8b661 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -462,9 +462,9 @@ static void __disable_vblank(struct drm_vblank_crtc *vblank)
  * are preserved, even if there are any spurious vblank irq's after
  * disable.
  */
-void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
+static void drm_vblank_crtc_disable_and_save(struct drm_vblank_crtc *vblank)
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
+		drm_vblank_crtc_disable_and_save(vblank);
 	}
 	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
 }
@@ -1358,7 +1358,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	/* Avoid redundant vblank disables without previous
 	 * drm_crtc_vblank_on(). */
 	if (drm_core_check_feature(dev, DRIVER_ATOMIC) || !vblank->inmodeset)
-		drm_vblank_disable_and_save(dev, pipe);
+		drm_vblank_crtc_disable_and_save(vblank);
 
 	wake_up(&vblank->queue);
 
-- 
2.47.3

