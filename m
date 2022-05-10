Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBED522420
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991F710E221;
	Tue, 10 May 2022 18:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A5110E20D;
 Tue, 10 May 2022 18:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652207619; x=1683743619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=azreIronrxfuJvXhjQsXTuvqbQKAG1bIAKH0qaMlaFQ=;
 b=VBjOoflVnxWr5FEzbw/qAP0H82U1GjE6IiQKnYazpxmIE8PEhBPq81+T
 DtjuhdrP3vLSgkjy8EUvoccVGTOphsLaE+vt3BgesJYtjouy9rUQTXS7W
 LRzuoOJ1iUgakOMv1hplzbuhHNyFaHA4z+WX/uEgYiHIrn5cqNkB4xNcP
 ixiQKSmlNxwJYOzFr1Fe3K2x/sGtYIc2ygYgwyKaJg1+F+FrGZNkBXDIn
 Hx96YpG1gY/A3BQBa750prhrfdJI2iXV4BiJIc4gwgI2M+a0j3SLz3bjL
 mJWiSF2tblz84JMotms9QrWlsOxPi7HLEQhGjDfAyPNA4o9QQE0sF7u6C w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="267058503"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="267058503"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 11:33:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="593673600"
Received: from lengdahl-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.220.119])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 11:33:37 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/i915: Ensure damage clip area is within pipe area
Date: Tue, 10 May 2022 21:33:13 +0300
Message-Id: <20220510183313.1046628-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510183313.1046628-1-jouni.hogander@intel.com>
References: <20220510183313.1046628-1-jouni.hogander@intel.com>
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mark Pearson <markpearson@lenovo.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current update area calculation is not handling situation where
e.g. cursor plane is fully or partially outside pipe area.

Fix this by checking damage area against pipe_src area using
drm_rect_intersect.

v2: Set x1 and x2 in damaged_area initialization
v3: Move drm_rect_intersect into clip_area_update

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5440
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 3561c218cfb1..f4b4c1c83d2b 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1618,8 +1618,12 @@ static void psr2_man_trk_ctl_calc(struct intel_crtc_state *crtc_state,
 }
 
 static void clip_area_update(struct drm_rect *overlap_damage_area,
-			     struct drm_rect *damage_area)
+			     struct drm_rect *damage_area,
+			     struct drm_rect *draw_area)
 {
+	if (!drm_rect_intersect(damage_area, draw_area))
+		return;
+
 	if (overlap_damage_area->y1 == -1) {
 		overlap_damage_area->y1 = damage_area->y1;
 		overlap_damage_area->y2 = damage_area->y2;
@@ -1709,7 +1713,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	 */
 	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
 					     new_plane_state, i) {
-		struct drm_rect src, damaged_area = { .y1 = -1 };
+		struct drm_rect src, damaged_area = { .x1 = 0, .y1 = -1,
+						      .x2 = INT_MAX };
 		struct drm_atomic_helper_damage_iter iter;
 		struct drm_rect clip;
 
@@ -1736,20 +1741,23 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 			if (old_plane_state->uapi.visible) {
 				damaged_area.y1 = old_plane_state->uapi.dst.y1;
 				damaged_area.y2 = old_plane_state->uapi.dst.y2;
-				clip_area_update(&pipe_clip, &damaged_area);
+				clip_area_update(&pipe_clip, &damaged_area,
+						 &crtc_state->pipe_src);
 			}
 
 			if (new_plane_state->uapi.visible) {
 				damaged_area.y1 = new_plane_state->uapi.dst.y1;
 				damaged_area.y2 = new_plane_state->uapi.dst.y2;
-				clip_area_update(&pipe_clip, &damaged_area);
+				clip_area_update(&pipe_clip, &damaged_area,
+						 &crtc_state->pipe_src);
 			}
 			continue;
 		} else if (new_plane_state->uapi.alpha != old_plane_state->uapi.alpha) {
 			/* If alpha changed mark the whole plane area as damaged */
 			damaged_area.y1 = new_plane_state->uapi.dst.y1;
 			damaged_area.y2 = new_plane_state->uapi.dst.y2;
-			clip_area_update(&pipe_clip, &damaged_area);
+			clip_area_update(&pipe_clip, &damaged_area,
+					 &crtc_state->pipe_src);
 			continue;
 		}
 
@@ -1760,7 +1768,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 						   &new_plane_state->uapi);
 		drm_atomic_for_each_plane_damage(&iter, &clip) {
 			if (drm_rect_intersect(&clip, &src))
-				clip_area_update(&damaged_area, &clip);
+				clip_area_update(&damaged_area, &clip,
+						 &crtc_state->pipe_src);
 		}
 
 		if (damaged_area.y1 == -1)
@@ -1768,7 +1777,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 
 		damaged_area.y1 += new_plane_state->uapi.dst.y1 - src.y1;
 		damaged_area.y2 += new_plane_state->uapi.dst.y1 - src.y1;
-		clip_area_update(&pipe_clip, &damaged_area);
+
+		clip_area_update(&pipe_clip, &damaged_area, &crtc_state->pipe_src);
 	}
 
 	/*
-- 
2.25.1

