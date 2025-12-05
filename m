Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10CCA764C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C315010EAF0;
	Fri,  5 Dec 2025 11:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qr7lSqML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526A710EAED;
 Fri,  5 Dec 2025 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934153; x=1796470153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1tTYLe34ZkuLBzTY8Ww63owLpoOPPEWoF7r4uwLaAME=;
 b=Qr7lSqMLrxis0GlPQkeE/6InAJvq/vEwf9PnnbJ1VArXrbDOSQ4BYZ3g
 D+rBTZp7iM6B82kRaaAcLgupSDBEOBoJurk4nV7Sntc7Wnvc+YBiJslZA
 RIP+sbm0yCfYfM+kEFv7csU/i5H3Lr6q7sT95Yw1lu/PvQdctz53m8isC
 O4C1DPHpmqu6lqeLXQGa/LK0Y6m+hjo4Y0a+V0K13lq5qs1lw0TAUsQzo
 Jk1mnfuTc6gWjECMrJQkra3imcQTZ//ZlS2sQBY1i/ZHBaEs4eQqN9ch+
 Zfr6kLiKrUTCTxeM/P8+koIb0ygrrzQoK9fsu7NbKQ0zvbI+Ah2wd5aR0 A==;
X-CSE-ConnectionGUID: r568GMhDTL66am4KfITB0g==
X-CSE-MsgGUID: zoIm1WaaSealbKPSds7Rog==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78431615"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="78431615"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:13 -0800
X-CSE-ConnectionGUID: 9hjfxgIhTFCVJyhWSJDS4A==
X-CSE-MsgGUID: Z8HA1O4BSNmYAERgu2CpAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195097568"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 16/25] drm/vblank: pass vblank to store_vblank()
Date: Fri,  5 Dec 2025 13:27:32 +0200
Message-ID: <201e0b64462b762f34fd2dfc19e5eb02e9059081.1764933891.git.jani.nikula@intel.com>
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
code. Rename to drm_vblank_crtc_store().

v2: Rename (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index ed4a589c408f..81224946df9d 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -188,11 +188,11 @@ drm_crtc_vblank_crtc(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_crtc);
 
-static void store_vblank(struct drm_device *dev, unsigned int pipe,
-			 u32 vblank_count_inc,
-			 ktime_t t_vblank, u32 last)
+static void drm_vblank_crtc_store(struct drm_vblank_crtc *vblank,
+				  u32 vblank_count_inc,
+				  ktime_t t_vblank, u32 last)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_device *dev = vblank->dev;
 
 	assert_spin_locked(&dev->vblank_time_lock);
 
@@ -277,7 +277,7 @@ static void drm_vblank_crtc_reset_timestamp(struct drm_vblank_crtc *vblank)
 	 * +1 to make sure user will never see the same
 	 * vblank counter value before and after a modeset
 	 */
-	store_vblank(dev, pipe, 1, t_vblank, cur_vblank);
+	drm_vblank_crtc_store(vblank, 1, t_vblank, cur_vblank);
 
 	spin_unlock(&dev->vblank_time_lock);
 }
@@ -384,7 +384,7 @@ static void drm_vblank_crtc_update_count(struct drm_vblank_crtc *vblank,
 	if (!rc && !in_vblank_irq)
 		t_vblank = 0;
 
-	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
+	drm_vblank_crtc_store(vblank, diff, t_vblank, cur_vblank);
 }
 
 u64 drm_vblank_crtc_count(struct drm_vblank_crtc *vblank)
@@ -395,8 +395,8 @@ u64 drm_vblank_crtc_count(struct drm_vblank_crtc *vblank)
 
 	/*
 	 * This read barrier corresponds to the implicit write barrier of the
-	 * write seqlock in store_vblank(). Note that this is the only place
-	 * where we need an explicit barrier, since all other access goes
+	 * write seqlock in drm_vblank_crtc_store(). Note that this is the only
+	 * place where we need an explicit barrier, since all other access goes
 	 * through drm_vblank_crtc_count_and_time(), which already has the
 	 * required read barrier curtesy of the read seqlock.
 	 */
-- 
2.47.3

