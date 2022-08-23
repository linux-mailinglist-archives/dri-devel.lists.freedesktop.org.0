Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B768859DAF1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 13:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF1211BBAE;
	Tue, 23 Aug 2022 11:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532C511A6B5;
 Tue, 23 Aug 2022 11:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661254262; x=1692790262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RIVu2TPn4w7Z9DgnTG78XKczUccr+4MnnZ5D6WCpEPk=;
 b=m5XYMaR8vYViAvxB08fkdOjF5TC/6QYT9GWHb5OunN2dijsAEQHYQFAy
 k3OofW3/t3HD7X6DvYoVph1T2c5NdqX8LxEluWdt4HxH8goarMTCyaDKe
 J0pBO1PH0JvmzpVjh503JbOQ9EI5WpEJkgRc3gFHAntwt4Y5u796EXjB/
 ugFRXj8DqcK1SiePyKYjiziWf/uK+fEALmVPYxvpu32bycUGTwQygrUMo
 koyU7FkVPVWPnlhWC/SStSj/6LF96l5K8ee8Rfn/VrOi88Od23E8eJvig
 cXokAtJcQeOPuzevH6WeLXVNBTpG/Yk1Io1c4oiUJu1szkGmm20L5kaaZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273415863"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="273415863"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:31:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="669990921"
Received: from fjohn-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.249.42.156])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:31:00 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/i915/display: Use drm helper instead of own loop
 for damage clips
Date: Tue, 23 Aug 2022 14:29:19 +0300
Message-Id: <20220823112920.352563-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823112920.352563-1-jouni.hogander@intel.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
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
index 16985de24019..0ce8076be000 100644
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
2.34.1

