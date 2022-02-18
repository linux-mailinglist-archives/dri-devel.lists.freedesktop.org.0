Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E34BB656
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253C310F02E;
	Fri, 18 Feb 2022 10:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2C210F04B;
 Fri, 18 Feb 2022 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178737; x=1676714737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6hrcWO8pt/duDuZYb+yp9duBAmECMDPJwstgNFTeNb8=;
 b=HXEeznmCFimz2uKADUEnPIK2U+oUtw6ROb9AVP87f38fDzx1SwsnzpdF
 KTZRRmxixAaGcMpRorvI+o6bgqXgBkz4T7r2L5EFWOTSYHL3KI4deL0It
 rsFrg7eoaHT9vnA1KOM5Zy3WEOdjfpWNA26TiG2hqDdQTbDze2zziQ2Iy
 9qMIklqW523KCptc/IMpiaTi7IcOQEKgHTgHnl8e8ux9E3uSwUjfdnJ/J
 TopXSJ3eAtRa3taxdRZxrUszurEYEUFYc8yRTd3/4qb/A3l4NWHQf/Brc
 HKpo/6T9vaP54xppC75/7vrepm6H4FDuLE7iY5eO4gxjvV8JthIt7NvUy w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="231734295"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="231734295"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:05:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="546219681"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 18 Feb 2022 02:05:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:05:30 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 21/22] drm: Use drm_mode_init() for on-stack modes
Date: Fri, 18 Feb 2022 12:04:02 +0200
Message-Id: <20220218100403.7028-22-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Initialize on-stack modes with drm_mode_init() to guarantee
no stack garbage in the list head, or that we aren't copying
over another mode's list head.

Based on the following cocci script, with manual fixups:
@decl@
identifier M;
expression E;
@@
- struct drm_display_mode M = E;
+ struct drm_display_mode M;

@@
identifier decl.M;
expression decl.E;
statement S, S1;
@@
struct drm_display_mode M;
... when != S
+ drm_mode_init(&M, &E);
+
S1

@@
expression decl.E;
@@
- &*E
+ E

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 8 ++++----
 drivers/gpu/drm/drm_edid.c        | 8 ++++++--
 drivers/gpu/drm/drm_modes.c       | 4 +++-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index bff917531f33..a34aa009725f 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -297,8 +297,8 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 		return false;
 	}
 
-	saved_mode = crtc->mode;
-	saved_hwmode = crtc->hwmode;
+	drm_mode_init(&saved_mode, &crtc->mode);
+	drm_mode_init(&saved_hwmode, &crtc->hwmode);
 	saved_x = crtc->x;
 	saved_y = crtc->y;
 
@@ -411,8 +411,8 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 	drm_mode_destroy(dev, adjusted_mode);
 	if (!ret) {
 		crtc->enabled = saved_enabled;
-		crtc->mode = saved_mode;
-		crtc->hwmode = saved_hwmode;
+		drm_mode_copy(&crtc->mode, &saved_mode);
+		drm_mode_copy(&crtc->hwmode, &saved_hwmode);
 		crtc->x = saved_x;
 		crtc->y = saved_y;
 	}
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a7663f9a11d2..1156bfeabaf6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3476,9 +3476,11 @@ static u8 drm_match_cea_mode_clock_tolerance(const struct drm_display_mode *to_m
 		match_flags |= DRM_MODE_MATCH_ASPECT_RATIO;
 
 	for (vic = 1; vic < cea_num_vics(); vic = cea_next_vic(vic)) {
-		struct drm_display_mode cea_mode = *cea_mode_for_vic(vic);
+		struct drm_display_mode cea_mode;
 		unsigned int clock1, clock2;
 
+		drm_mode_init(&cea_mode, cea_mode_for_vic(vic));
+
 		/* Check both 60Hz and 59.94Hz */
 		clock1 = cea_mode.clock;
 		clock2 = cea_mode_alternate_clock(&cea_mode);
@@ -3515,9 +3517,11 @@ u8 drm_match_cea_mode(const struct drm_display_mode *to_match)
 		match_flags |= DRM_MODE_MATCH_ASPECT_RATIO;
 
 	for (vic = 1; vic < cea_num_vics(); vic = cea_next_vic(vic)) {
-		struct drm_display_mode cea_mode = *cea_mode_for_vic(vic);
+		struct drm_display_mode cea_mode;
 		unsigned int clock1, clock2;
 
+		drm_mode_init(&cea_mode, cea_mode_for_vic(vic));
+
 		/* Check both 60Hz and 59.94Hz */
 		clock1 = cea_mode.clock;
 		clock2 = cea_mode_alternate_clock(&cea_mode);
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 40d4ce4a1da4..86904d082ff2 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -788,7 +788,9 @@ EXPORT_SYMBOL(drm_mode_vrefresh);
 void drm_mode_get_hv_timing(const struct drm_display_mode *mode,
 			    int *hdisplay, int *vdisplay)
 {
-	struct drm_display_mode adjusted = *mode;
+	struct drm_display_mode adjusted;
+
+	drm_mode_init(&adjusted, mode);
 
 	drm_mode_set_crtcinfo(&adjusted, CRTC_STEREO_DOUBLE_ONLY);
 	*hdisplay = adjusted.crtc_hdisplay;
-- 
2.34.1

