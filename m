Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4A9F870C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C3210EDD3;
	Thu, 19 Dec 2024 21:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2VwMq6m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BC610EDD2;
 Thu, 19 Dec 2024 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644094; x=1766180094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ignB7Q81v16pvY7hkSaCc7ZSih3QLwvKBn9DPF/5ju4=;
 b=S2VwMq6m7Y1AuS2p1Xqh9ZpRPnBpJKof2bFdEa7Pc+HPQsgR1Ovx43G5
 Dt1rMCkWkGnzmEJ1+5iynZz6DzC8q4EMVu+FqrTh+3xVJzhAvkqrdSC5g
 ay0I8SzypsnwslrFYKFOwmb9F7+vAJgLU1ukX0NSze3OrjreMDseMuX3m
 J7OuWBqLa5YZGUMXr5upKQxdcn/Xm1xtok6DFHZjzHf001KlorZkkHVkR
 Fbqr3IAwQEsQaRqnyJpxalFI2Lcr1lQVtRqJzBYfcPbhMxfps6cnJQOcF
 CRW/RJCGAB2lveVTQQYV5Vb+WC4H2hBpYxZuLgyJQzz1LxEaRiCryCy8V w==;
X-CSE-ConnectionGUID: af0GyuO7SpGqHjE/HTMeIA==
X-CSE-MsgGUID: dWSYGmFfSJ63nFa5tIsjYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35330556"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35330556"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:54 -0800
X-CSE-ConnectionGUID: D4tRVaHgSfy1neSgs5gK/A==
X-CSE-MsgGUID: A8EASCYeSQOoh22WQ+w/PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98115647"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 07/16] drm/i915/mst: adapt intel_dp_mtp_tu_compute_config()
 for 128b/132b SST
Date: Thu, 19 Dec 2024 23:33:56 +0200
Message-Id: <d08257a340e685679a1ae89f180e6eadf5164bcc.1734643485.git.jani.nikula@intel.com>
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

Handle 128b/132b SST in intel_dp_mtp_tu_compute_config(). The remote
bandwidth overhead and time slot allocation are only relevant for MST;
SST only needs the local bandwidth and a check that 64 slots isn't
exceeded.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 109 +++++++++++---------
 1 file changed, 61 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index d08824d2fefe..3fbf9163272b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -257,10 +257,7 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 
 	for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
 		int local_bw_overhead;
-		int remote_bw_overhead;
 		int link_bpp_x16;
-		int remote_tu;
-		fixed20_12 pbn;
 
 		drm_dbg_kms(display->drm, "Trying bpp %d\n", bpp);
 
@@ -269,57 +266,73 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 
 		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
 							     false, dsc_slice_count, link_bpp_x16);
-		remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
-							      true, dsc_slice_count, link_bpp_x16);
-
 		intel_dp_mst_compute_m_n(crtc_state,
 					 local_bw_overhead,
 					 link_bpp_x16,
 					 &crtc_state->dp_m_n);
 
-		/*
-		 * The TU size programmed to the HW determines which slots in
-		 * an MTP frame are used for this stream, which needs to match
-		 * the payload size programmed to the first downstream branch
-		 * device's payload table.
-		 *
-		 * Note that atm the payload's PBN value DRM core sends via
-		 * the ALLOCATE_PAYLOAD side-band message matches the payload
-		 * size (which it calculates from the PBN value) it programs
-		 * to the first branch device's payload table. The allocation
-		 * in the payload table could be reduced though (to
-		 * crtc_state->dp_m_n.tu), provided that the driver doesn't
-		 * enable SSC on the corresponding link.
-		 */
-		pbn.full = dfixed_const(intel_dp_mst_calc_pbn(adjusted_mode->crtc_clock,
-							      link_bpp_x16,
-							      remote_bw_overhead));
-		remote_tu = DIV_ROUND_UP(pbn.full, pbn_div.full);
-
-		/*
-		 * Aligning the TUs ensures that symbols consisting of multiple
-		 * (4) symbol cycles don't get split between two consecutive
-		 * MTPs, as required by Bspec.
-		 * TODO: remove the alignment restriction for 128b/132b links
-		 * on some platforms, where Bspec allows this.
-		 */
-		remote_tu = ALIGN(remote_tu, 4 / crtc_state->lane_count);
-
-		/*
-		 * Also align PBNs accordingly, since MST core will derive its
-		 * own copy of TU from the PBN in drm_dp_atomic_find_time_slots().
-		 * The above comment about the difference between the PBN
-		 * allocated for the whole path and the TUs allocated for the
-		 * first branch device's link also applies here.
-		 */
-		pbn.full = remote_tu * pbn_div.full;
-
-		drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
-		crtc_state->dp_m_n.tu = remote_tu;
+		if (intel_dp->is_mst) {
+			int remote_bw_overhead;
+			int remote_tu;
+			fixed20_12 pbn;
+
+			remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
+								      true, dsc_slice_count, link_bpp_x16);
+
+			/*
+			 * The TU size programmed to the HW determines which slots in
+			 * an MTP frame are used for this stream, which needs to match
+			 * the payload size programmed to the first downstream branch
+			 * device's payload table.
+			 *
+			 * Note that atm the payload's PBN value DRM core sends via
+			 * the ALLOCATE_PAYLOAD side-band message matches the payload
+			 * size (which it calculates from the PBN value) it programs
+			 * to the first branch device's payload table. The allocation
+			 * in the payload table could be reduced though (to
+			 * crtc_state->dp_m_n.tu), provided that the driver doesn't
+			 * enable SSC on the corresponding link.
+			 */
+			pbn.full = dfixed_const(intel_dp_mst_calc_pbn(adjusted_mode->crtc_clock,
+								      link_bpp_x16,
+								      remote_bw_overhead));
+			remote_tu = DIV_ROUND_UP(pbn.full, pbn_div.full);
+
+			/*
+			 * Aligning the TUs ensures that symbols consisting of multiple
+			 * (4) symbol cycles don't get split between two consecutive
+			 * MTPs, as required by Bspec.
+			 * TODO: remove the alignment restriction for 128b/132b links
+			 * on some platforms, where Bspec allows this.
+			 */
+			remote_tu = ALIGN(remote_tu, 4 / crtc_state->lane_count);
+
+			/*
+			 * Also align PBNs accordingly, since MST core will derive its
+			 * own copy of TU from the PBN in drm_dp_atomic_find_time_slots().
+			 * The above comment about the difference between the PBN
+			 * allocated for the whole path and the TUs allocated for the
+			 * first branch device's link also applies here.
+			 */
+			pbn.full = remote_tu * pbn_div.full;
+
+			drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
+			crtc_state->dp_m_n.tu = remote_tu;
+
+			slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
+							      connector->port,
+							      dfixed_trunc(pbn));
+		} else {
+			/* Same as above for remote_tu */
+			crtc_state->dp_m_n.tu = ALIGN(crtc_state->dp_m_n.tu,
+						      4 / crtc_state->lane_count);
+
+			if (crtc_state->dp_m_n.tu <= 64)
+				slots = crtc_state->dp_m_n.tu;
+			else
+				slots = -EINVAL;
+		}
 
-		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
-						      connector->port,
-						      dfixed_trunc(pbn));
 		if (slots == -EDEADLK)
 			return slots;
 
-- 
2.39.5

