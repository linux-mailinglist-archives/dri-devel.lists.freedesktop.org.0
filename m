Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C281E420A5B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 13:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A276E9C0;
	Mon,  4 Oct 2021 11:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468766E1B1;
 Mon,  4 Oct 2021 11:47:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="311596502"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="311596502"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 04:47:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="711168218"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 04 Oct 2021 04:47:19 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH v3] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Date: Mon,  4 Oct 2021 04:59:13 -0700
Message-Id: <20211004115913.23889-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case of a modeset where a mode gets split across mutiple CRTCs
in the driver specific implementation (bigjoiner in i915) we wrongly count
the affected CRTCs based on the drm_crtc_mask and indicate the stolen CRTC as
an affected CRTC in atomic_check_only().
This triggers a warning since affected CRTCs doent match requested CRTC.

To fix this in such bigjoiner configurations, we should only
increment affected crtcs if that CRTC is enabled in UAPI not
if it is just used internally in the driver to split the mode.

v3: Add the same uapi crtc_state->enable check in requested
crtc calc (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/drm_atomic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ff1416cd609a..a1e4c7905ebb 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1310,8 +1310,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 
 	DRM_DEBUG_ATOMIC("checking %p\n", state);
 
-	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
-		requested_crtc |= drm_crtc_mask(crtc);
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->enable)
+			requested_crtc |= drm_crtc_mask(crtc);
+	}
 
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
@@ -1360,8 +1362,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 		}
 	}
 
-	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
-		affected_crtc |= drm_crtc_mask(crtc);
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->enable)
+			affected_crtc |= drm_crtc_mask(crtc);
+	}
 
 	/*
 	 * For commits that allow modesets drivers can add other CRTCs to the
-- 
2.19.1

