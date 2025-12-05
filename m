Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F7CA7661
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2214B10EAF2;
	Fri,  5 Dec 2025 11:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgxU0xMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B79110EADF;
 Fri,  5 Dec 2025 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934171; x=1796470171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c+3E0gutFoilRs0DQUJEVJYfstm3gaSVs+enIILQQ+M=;
 b=UgxU0xMjhKAGWoyGaWi/7xpjkUux8hYRLx2L5ax1O8JTVMS2BrmPtsb+
 jeqhWYglH4B/jQDjHyix5audYic58aIXl+JDa8WVWX1vg2+mufxyiEzji
 ma5H6DKGw4DqhUHGtMFLUE/nzdNCvK6X8dR17K6pxmNDBYMrpA5fZk6DR
 zfO2Mcih3gHm/+F12yOj2MUVjMUVrjqL8BYJ2b9PEaY1Ubs7U0PKiLC3d
 HP5IFx13nmozI7Eq9WhltruSNHzS1XtRXIB+z9SwSFamokmZqydgwDYHz
 zFBLD/5zDQKaDjqlECT6/FAcC5EnvqaPfXKMGrl9fpCULSHBxijXzeo8i Q==;
X-CSE-ConnectionGUID: GGhPFRZ/RYKz/MFf6zvZXQ==
X-CSE-MsgGUID: l5xXdTC0S+CYfsAq/jF0EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66902967"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66902967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:30 -0800
X-CSE-ConnectionGUID: ylj5pXdwTgGd92nBxOTDVw==
X-CSE-MsgGUID: 5uZaAQ7WRzioGlUkF7HwVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199757574"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 19/25] drm/vblank: add drm_crtc_from_vblank() helper
Date: Fri,  5 Dec 2025 13:27:35 +0200
Message-ID: <0142a645d800810f25308a4b6a2adf8da5594aed.1764933891.git.jani.nikula@intel.com>
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

We have a handful of places where we need to get the crtc from the
vblank. Add a small helper for it.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index ad44fea4ff67..d43165ee594a 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -188,6 +188,11 @@ drm_crtc_vblank_crtc(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_crtc);
 
+static struct drm_crtc *drm_crtc_from_vblank(struct drm_vblank_crtc *vblank)
+{
+	return drm_crtc_from_index(vblank->dev, vblank->pipe);
+}
+
 static void drm_vblank_crtc_store(struct drm_vblank_crtc *vblank,
 				  u32 vblank_count_inc,
 				  ktime_t t_vblank, u32 last)
@@ -1608,7 +1613,7 @@ static int drm_vblank_crtc_queue_event(struct drm_vblank_crtc *vblank,
 	e->event.vbl.user_data = vblwait->request.signal;
 	e->event.vbl.crtc_id = 0;
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
+		struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
 
 		if (crtc)
 			e->event.vbl.crtc_id = crtc->base.id;
@@ -1858,7 +1863,7 @@ static void drm_vblank_crtc_handle_events(struct drm_vblank_crtc *vblank)
 {
 	struct drm_device *dev = vblank->dev;
 	unsigned int pipe = vblank->pipe;
-	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
+	struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
 	bool high_prec = false;
 	struct drm_pending_vblank_event *e, *t;
 	ktime_t now;
-- 
2.47.3

