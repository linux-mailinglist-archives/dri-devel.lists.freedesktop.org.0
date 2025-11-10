Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A906C47DA6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A9610E438;
	Mon, 10 Nov 2025 16:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m64Tv/WB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E0410E432;
 Mon, 10 Nov 2025 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791490; x=1794327490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z5IHqaZJyCAoSQ8SXKSsxs61AzGTxDk7PgeCnIoQwQ8=;
 b=m64Tv/WBQSCaHXVbVotEwQk4+/Av0BZN/NChc3jZBMvP8R6fJI+Zy79v
 gjApj1L2QkS/8woWjquhgSF5EES79V5UgnZuyYacxw5evMq6/pq9Y0ssg
 dA9z4hazFM9XrZqOL0w26ZWHhAQ3MC7KJEWbbEZU5Ee5YI5uG+wT2EGXn
 22qWYLaESA7mJTphHl8nL0KL79/vTkqNaId8LTMOOKEOwwj2JtBUivvhU
 qI4VT43qTWTA2bmQ/3RTIf1nxS8/gZEGKJY+cWoqzUhuS4Oz3oWd5titu
 XAZrMS24I/v+WHjkoy7tplC9AY5wg3j1AhRUdSinBxVt1KUG2BiNSRFvb w==;
X-CSE-ConnectionGUID: 2CILpSMYRSSKjwL+OrN1EQ==
X-CSE-MsgGUID: 5+rOyZvbSq6YVCOB8/MSFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64753255"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64753255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:10 -0800
X-CSE-ConnectionGUID: 51JnI6UQRLS7Sm1dDy8QFw==
X-CSE-MsgGUID: 3xuR78c1QZW8UMpvlcXf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="219368551"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/24] drm/vblank: add return value to
 drm_crtc_wait_one_vblank()
Date: Mon, 10 Nov 2025 18:17:22 +0200
Message-ID: <ff2bb588bb803935d2f9fa9d1216fec206f69299.1762791343.git.jani.nikula@intel.com>
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

Let drivers deal with the vblank wait failures if they so desire. If the
current warning backtrace gets toned down to a simple warning message,
the drivers may wish to add the backtrace themselves.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 8 ++++++--
 include/drm/drm_vblank.h     | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index f4d1fe182a4d..503eb23d38d2 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1293,8 +1293,10 @@ EXPORT_SYMBOL(drm_crtc_vblank_put);
  * This waits for one vblank to pass on @crtc, using the irq driver interfaces.
  * It is a failure to call this when the vblank irq for @crtc is disabled, e.g.
  * due to lack of driver support or because the crtc is off.
+ *
+ * Returns: 0 on success, negative error on failures.
  */
-void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
+int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	int pipe = drm_crtc_index(crtc);
@@ -1305,7 +1307,7 @@ void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 	ret = drm_vblank_get(dev, pipe);
 	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
 		     pipe, ret))
-		return;
+		return ret;
 
 	last = drm_vblank_count(dev, pipe);
 
@@ -1316,6 +1318,8 @@ void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
 
 	drm_vblank_put(dev, pipe);
+
+	return ret ? 0 : -ETIMEDOUT;
 }
 EXPORT_SYMBOL(drm_crtc_wait_one_vblank);
 
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 94ee09b48895..2fcef9c0f5b1 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -302,7 +302,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
 bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
 int drm_crtc_vblank_get(struct drm_crtc *crtc);
 void drm_crtc_vblank_put(struct drm_crtc *crtc);
-void drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
+int drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
 void drm_crtc_vblank_off(struct drm_crtc *crtc);
 void drm_crtc_vblank_reset(struct drm_crtc *crtc);
 void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
-- 
2.47.3

