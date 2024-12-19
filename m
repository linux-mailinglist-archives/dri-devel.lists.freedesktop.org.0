Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB849F8702
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFE210EDC2;
	Thu, 19 Dec 2024 21:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLzzBBnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5F910EDBD;
 Thu, 19 Dec 2024 21:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644077; x=1766180077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z28yGT4/mZ7vdk+3Z3LTZqmOIA99jXKmtwQHYz2HOy8=;
 b=QLzzBBnE3OL/XFuXeM7WYdHJXL1mhDHWZ8srnMfSFrZrzeBrZJvkQMMD
 Z//UueLWJcyp4lvw44X6aSZck1MHYLZbpCqZJsIC4QtPGNl/S0M1wSIHk
 gVr/FeMXIuitQj27sRvZqNhs3DV3kAhYN3o3nCdygVT/Mjxff10wkKtN2
 Rz8gJymR0nSFE9zKxwR0Nu8Mt7jUr4eEQl2QWYcG5jbETafqdDXY3GRFQ
 SWAbrH3FcXRD0YBrDmSD57UiXW7wDxgqthg2BX89ONrZVWS58F29FwoQS
 cJu/aHPzIXHiJFsUWgGrVYdDdUs09K23UEJTD+axxMqjO4nujFP7xzZMz Q==;
X-CSE-ConnectionGUID: 6kcQ6nPBR6m65P8jHOjZfA==
X-CSE-MsgGUID: QyPBLZE0SW6Upb+mQb3I+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34900128"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="34900128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:37 -0800
X-CSE-ConnectionGUID: qCU4oOsmTXKW8u450019Yw==
X-CSE-MsgGUID: KNS3th5IQ1m7v5bnmxyBhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99140826"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 04/16] drm/i915/mst: change return value of
 mst_stream_find_vcpi_slots_for_bpp()
Date: Thu, 19 Dec 2024 23:33:53 +0200
Message-Id: <5c5db1f5bdbb90e896d4ac792586d2af6c60c68c.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
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

The callers of mst_stream_find_vcpi_slots_for_bpp() don't need the
returned slots for anything. On the contrary, they need to jump through
hoops to just distinguish between success and failure. Just return 0
instead of slots from mst_stream_find_vcpi_slots_for_bpp() for success,
and simplify the callers.

There's a pointless ret local variable that we can drop in the process.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 52 +++++++--------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index f52f9c968adb..f7b91cf32b5b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -226,7 +226,6 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
 	int bpp, slots = -EINVAL;
 	int dsc_slice_count = 0;
 	int max_dpt_bpp;
-	int ret = 0;
 
 	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
 	if (IS_ERR(mst_state))
@@ -340,23 +339,21 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
 		}
 	}
 
-	/* We failed to find a proper bpp/timeslots, return error */
-	if (ret)
-		slots = ret;
-
 	if (slots < 0) {
 		drm_dbg_kms(display->drm, "failed finding vcpi slots:%d\n",
 			    slots);
-	} else {
-		if (!dsc)
-			crtc_state->pipe_bpp = bpp;
-		else
-			crtc_state->dsc.compressed_bpp_x16 = fxp_q4_from_int(bpp);
-		drm_dbg_kms(display->drm, "Got %d slots for pipe bpp %d dsc %d\n",
-			    slots, bpp, dsc);
+		return slots;
 	}
 
-	return slots;
+	if (!dsc)
+		crtc_state->pipe_bpp = bpp;
+	else
+		crtc_state->dsc.compressed_bpp_x16 = fxp_q4_from_int(bpp);
+
+	drm_dbg_kms(display->drm, "Got %d slots for pipe bpp %d dsc %d\n",
+		    slots, bpp, dsc);
+
+	return 0;
 }
 
 static int mst_stream_compute_link_config(struct intel_dp *intel_dp,
@@ -364,22 +361,15 @@ static int mst_stream_compute_link_config(struct intel_dp *intel_dp,
 					  struct drm_connector_state *conn_state,
 					  struct link_config_limits *limits)
 {
-	int slots = -EINVAL;
-
 	/*
 	 * FIXME: allocate the BW according to link_bpp, which in the case of
 	 * YUV420 is only half of the pipe bpp value.
 	 */
-	slots = mst_stream_find_vcpi_slots_for_bpp(intel_dp, crtc_state,
-						   fxp_q4_to_int(limits->link.max_bpp_x16),
-						   fxp_q4_to_int(limits->link.min_bpp_x16),
-						   limits,
-						   conn_state, 2 * 3, false);
-
-	if (slots < 0)
-		return slots;
-
-	return 0;
+	return mst_stream_find_vcpi_slots_for_bpp(intel_dp, crtc_state,
+						  fxp_q4_to_int(limits->link.max_bpp_x16),
+						  fxp_q4_to_int(limits->link.min_bpp_x16),
+						  limits,
+						  conn_state, 2 * 3, false);
 }
 
 static int mst_stream_dsc_compute_link_config(struct intel_dp *intel_dp,
@@ -389,7 +379,6 @@ static int mst_stream_dsc_compute_link_config(struct intel_dp *intel_dp,
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	int slots = -EINVAL;
 	int i, num_bpc;
 	u8 dsc_bpc[3] = {};
 	int min_bpp, max_bpp, sink_min_bpp, sink_max_bpp;
@@ -451,14 +440,9 @@ static int mst_stream_dsc_compute_link_config(struct intel_dp *intel_dp,
 	min_compressed_bpp = intel_dp_dsc_nearest_valid_bpp(display, min_compressed_bpp,
 							    crtc_state->pipe_bpp);
 
-	slots = mst_stream_find_vcpi_slots_for_bpp(intel_dp, crtc_state, max_compressed_bpp,
-						   min_compressed_bpp, limits,
-						   conn_state, 1, true);
-
-	if (slots < 0)
-		return slots;
-
-	return 0;
+	return mst_stream_find_vcpi_slots_for_bpp(intel_dp, crtc_state, max_compressed_bpp,
+						  min_compressed_bpp, limits,
+						  conn_state, 1, true);
 }
 
 static int mst_stream_update_slots(struct intel_dp *intel_dp,
-- 
2.39.5

