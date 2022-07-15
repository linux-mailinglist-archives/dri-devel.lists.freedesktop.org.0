Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05905576EBD
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F9D10EF61;
	Sat, 16 Jul 2022 14:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CD410E06A;
 Fri, 15 Jul 2022 14:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896879; x=1689432879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tfm7fLXko0VFkVs2FaNKlVY+3KA6M9MeYDvTEl20a1g=;
 b=Skeit//PV/pRG9GOpW7UwqmLu/DphiHIGC9y4S+/7LfvDOjh9YF7Vbx5
 pryMAyRd5A9IqLkOWVZbs55w2DnEr2SndoDAdhU65K5hk0b2RjMKRwHXh
 ZiT7Gwf9I2TXFKbXFx/kJJ04WPhr2dwGRKRNCLdnjwVk/cBXqPZXGyA15
 jQNixJbOte4W6AQ6QVI6bCQYn90lnTrgKRLdfuPvYJIhi9VmmZDaXxfTO
 LEn14oTKt7lS4lR0fCsVbZSyBCH4sCti5kFZNSUM7gF/YKmZOzarB43VW
 w6EXVN0kpUwv40HIG0vnyyumKJZLOuC8LxJhM8MWwr19fPC+IlYP4c71r w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="284558051"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="284558051"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 06:51:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="654340400"
Received: from jgrajkow-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.38.223])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 06:51:26 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/display: Use drm helper instead of own loop for
 damage clips
Date: Fri, 15 Jul 2022 16:49:58 +0300
Message-Id: <20220715134958.2605746-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715134958.2605746-1-jouni.hogander@intel.com>
References: <20220715134958.2605746-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use existing drm_atomic_helper_damage_merged from generic drm code
instead of implementing own loop to iterate over damage_clips.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 5c95e24dc8d6..d44662f19b53 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1721,8 +1721,6 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 					     new_plane_state, i) {
 		struct drm_rect src, damaged_area = { .x1 = 0, .y1 = -1,
 						      .x2 = INT_MAX };
-		struct drm_atomic_helper_damage_iter iter;
-		struct drm_rect clip;
 
 		if (new_plane_state->uapi.crtc != crtc_state->uapi.crtc)
 			continue;
@@ -1770,20 +1768,15 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		src = drm_plane_state_src(&new_plane_state->uapi);
 		drm_rect_fp_to_int(&src, &src);
 
-		drm_atomic_helper_damage_iter_init(&iter,
-						   &old_plane_state->uapi,
-						   &new_plane_state->uapi);
-		drm_atomic_for_each_plane_damage(&iter, &clip) {
-			if (drm_rect_intersect(&clip, &src))
-				clip_area_update(&damaged_area, &clip,
-						 &crtc_state->pipe_src);
-		}
-
-		if (damaged_area.y1 == -1)
+		if (!drm_atomic_helper_damage_merged(&old_plane_state->uapi,
+						     &new_plane_state->uapi, &damaged_area))
 			continue;
 
 		damaged_area.y1 += new_plane_state->uapi.dst.y1 - src.y1;
 		damaged_area.y2 += new_plane_state->uapi.dst.y1 - src.y1;
+		damaged_area.x1 += new_plane_state->uapi.dst.x1 - src.x1;
+		damaged_area.x2 += new_plane_state->uapi.dst.x1 - src.x1;
+
 		clip_area_update(&pipe_clip, &damaged_area, &crtc_state->pipe_src);
 	}
 
-- 
2.25.1

