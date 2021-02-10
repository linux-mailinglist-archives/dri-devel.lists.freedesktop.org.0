Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B94315AA3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 01:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DB16EC07;
	Wed, 10 Feb 2021 00:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99C66EC07;
 Wed, 10 Feb 2021 00:09:10 +0000 (UTC)
IronPort-SDR: XMMzzlQgpEhK0qi7cWCnefzCPkU7TAbMnFd9lGw/+OZVUDPD3FQur1JlPyt2r6YiexDE481JYi
 XW+WdcEJjhDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182050938"
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; d="scan'208";a="182050938"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 16:09:09 -0800
IronPort-SDR: MLRc+tr1JlmUnE3lKjRDQyQ0NIud27SCcLL1Ih/IsbpqtRJHH2GT+fna1puTZV6rZeeRUVq8Da
 GjCYwbotMdTg==
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; d="scan'208";a="379542277"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 09 Feb 2021 16:09:07 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/atomic: document and enforce rules around
 "spurious" EBUSY"
Date: Tue,  9 Feb 2021 16:14:01 -0800
Message-Id: <20210210001401.463-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit fb6473a48b635c55d04eb94e579eede52ef39550.

These additional checks added to avoid EBUSY give unnecessary WARN_ON
in case of big joiner used in i915 in which case even if the modeset
is requested on a single pipe, internally another consecutive
pipe is stolen and used to drive half of the transcoder timings.
So in this case it is expected that requested crtc and affected crtcs
do not match. Hence the added WARN ON becomes irrelevant.
But there is no easy solution to get the bigjoiner information
here at drm level. So for now revert this until we work out
a better solution.

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/drm_atomic.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b1efa9322be2..48b2262d69f6 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -320,10 +320,6 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
  * needed. It will also grab the relevant CRTC lock to make sure that the state
  * is consistent.
  *
- * WARNING: Drivers may only add new CRTC states to a @state if
- * drm_atomic_state.allow_modeset is set, or if it's a driver-internal commit
- * not created by userspace through an IOCTL call.
- *
  * Returns:
  *
  * Either the allocated state or the error code encoded into the pointer. When
@@ -1306,15 +1302,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_connector *conn;
 	struct drm_connector_state *conn_state;
-	unsigned requested_crtc = 0;
-	unsigned affected_crtc = 0;
 	int i, ret = 0;
 
 	DRM_DEBUG_ATOMIC("checking %p\n", state);
 
-	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
-		requested_crtc |= drm_crtc_mask(crtc);
-
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
 		if (ret) {
@@ -1362,26 +1353,6 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 		}
 	}
 
-	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
-		affected_crtc |= drm_crtc_mask(crtc);
-
-	/*
-	 * For commits that allow modesets drivers can add other CRTCs to the
-	 * atomic commit, e.g. when they need to reallocate global resources.
-	 * This can cause spurious EBUSY, which robs compositors of a very
-	 * effective sanity check for their drawing loop. Therefor only allow
-	 * drivers to add unrelated CRTC states for modeset commits.
-	 *
-	 * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as an output
-	 * so compositors know what's going on.
-	 */
-	if (affected_crtc != requested_crtc) {
-		DRM_DEBUG_ATOMIC("driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
-				 requested_crtc, affected_crtc);
-		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
-		     requested_crtc, affected_crtc);
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_check_only);
-- 
2.19.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
