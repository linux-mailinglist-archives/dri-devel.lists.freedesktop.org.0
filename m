Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D161AFB7A3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 17:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625F410E4DA;
	Mon,  7 Jul 2025 15:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izyk6A8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949F810E4D0;
 Mon,  7 Jul 2025 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751902882; x=1783438882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pSjyoPIOjtD7hCFlxKQDim4XG+8r2sSOvW6Eddf0eLg=;
 b=izyk6A8rBgXIZKvYfsRWoWqp5humbIgNTt6v0qM7m5ZRuiIM6Gp25wzx
 eevMTQzXGL5LvvhLmR/MU4uEOhkh2ZZjUiig70UcAhZYvg5TaJwCGDwrf
 iLCpmVwmL2hKJIT5VUX3R+od6RJVxm02Mc3FsDtgZaPIR3t4yrHjw42Fy
 ToJwKJ4Gj/MUyAYVOgTU3cxMHP8COMuouiMY/ekM6uq50jPaYdZy4Q+E1
 rvrXDnB+nRJ+nekWrpuczrp4trq6sVgP869/oVxyt6q9/Ntz1PbyvETZ9
 R+4/9twro5aqZR6Wvsp43m6zJOJno/iFgXlNkk4hKV+1H+GIQT2ZbcUpU A==;
X-CSE-ConnectionGUID: G9lyWYtFQKSuMx9Aaqzwgw==
X-CSE-MsgGUID: O06l5eGkTWOdZpWBrd2lQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="71706732"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="71706732"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 08:41:21 -0700
X-CSE-ConnectionGUID: TS6KnoLjTK+3CETXfljyOg==
X-CSE-MsgGUID: 6ISdcONlRjOdJzf8fnYRUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="155828149"
Received: from dut4398mtlh.fm.intel.com (HELO DUT4398MTLH..) ([10.105.10.84])
 by fmviesa008.fm.intel.com with ESMTP; 07 Jul 2025 08:41:21 -0700
From: Naveen Kumar <naveen1.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xaver.hugl@kde.org, mdaenzer@redhat.com,
 sebastian.wick@redhat.com, jadahl@gmail.com
Cc: naveen1.kumar@intel.com
Subject: [PATCH] drm/i915/display: Allow async flips on planes with no
 framebuffer changes
Date: Mon,  7 Jul 2025 15:41:20 +0000
Message-ID: <20250707154121.74969-1-naveen1.kumar@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
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

Allow asynchronous page flips on planes that either lack a framebuffer or
retain the same framebuffer, as long as no plane properties are modified.

This avoids unnecessary failures in async flip paths when the update is
effectively a no-op, improving compatibility with some compositors.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834
Signed-off-by: Naveen Kumar <naveen1.kumar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 +++++++++------
 drivers/gpu/drm/i915/display/intel_plane.c   | 24 ++++++++++++++++++++
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 456fc4b04cda..e0eb0de62ff4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5970,18 +5970,21 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 		 * this(vlv/chv and icl+) should be added when async flip is
 		 * enabled in the atomic IOCTL path.
 		 */
-		if (!plane->async_flip) {
+		if (!plane->async_flip && new_plane_state->uapi.fb) {
 			drm_dbg_kms(display->drm,
 				    "[PLANE:%d:%s] async flip not supported\n",
 				    plane->base.base.id, plane->base.name);
 			return -EINVAL;
 		}
 
-		if (!old_plane_state->uapi.fb || !new_plane_state->uapi.fb) {
-			drm_dbg_kms(display->drm,
-				    "[PLANE:%d:%s] no old or new framebuffer\n",
-				    plane->base.base.id, plane->base.name);
-			return -EINVAL;
+		if (plane->base.type != DRM_PLANE_TYPE_CURSOR &&
+		    plane->base.type != DRM_PLANE_TYPE_OVERLAY) {
+			if (!old_plane_state->uapi.fb || !new_plane_state->uapi.fb) {
+				drm_dbg_kms(display->drm,
+					    "[PLANE:%d:%s] no old or new framebuffer\n",
+					    plane->base.base.id, plane->base.name);
+				return -EINVAL;
+			}
 		}
 	}
 
@@ -6034,7 +6037,8 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 		 * an async flip. We should never get this far otherwise.
 		 */
 		if (drm_WARN_ON(display->drm,
-				new_crtc_state->do_async_flip && !plane->async_flip))
+				new_crtc_state->do_async_flip && !plane->async_flip &&
+				new_plane_state->hw.fb))
 			return -EINVAL;
 
 		/*
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 36fb07471deb..434be91b57df 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -1425,9 +1425,33 @@ static int intel_get_scanout_buffer(struct drm_plane *plane,
 	return 0;
 }
 
+static int
+intel_plane_atomic_async_check(struct drm_plane *plane,
+			       struct drm_atomic_state *_state, bool flip)
+{
+	struct intel_atomic_state *state = to_intel_atomic_state(_state);
+	struct intel_plane *intel_plane;
+	const struct intel_plane_state *old_plane_state;
+	struct intel_plane_state *new_plane_state;
+	int i;
+
+	for_each_oldnew_intel_plane_in_state(state, intel_plane, old_plane_state,
+					     new_plane_state, i) {
+		if (intel_plane->id != to_intel_plane(plane)->id)
+			continue;
+
+		/* no old or new framebuffer */
+		if (flip && !old_plane_state->uapi.fb && !new_plane_state->uapi.fb)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
 static const struct drm_plane_helper_funcs intel_plane_helper_funcs = {
 	.prepare_fb = intel_prepare_plane_fb,
 	.cleanup_fb = intel_cleanup_plane_fb,
+	.atomic_async_check = intel_plane_atomic_async_check,
 };
 
 static const struct drm_plane_helper_funcs intel_primary_plane_helper_funcs = {
-- 
2.48.1

