Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743038FD3B3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 19:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BA110E7A5;
	Wed,  5 Jun 2024 17:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2cRmL52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8668910E66C;
 Wed,  5 Jun 2024 17:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717607498; x=1749143498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SncylQLM++QqoofonL3MaVlwjiavXGQ3WnzHL8dHa54=;
 b=J2cRmL52w+Vq5y6esQxD6KsrZD40tNlwtC8zd8Y6ZwdZM+Voxy9hJYvV
 ddko/3k2IBAKw1zjdjXC3amx4a1MdzZ2pI2emQeQXW2/vIoOkM/gMKDQE
 JU1Q2DPA4djUFqX88qlc4yKGMXhndS8KdDKhaxIXXYhTqqWj8nSQ8Omjl
 Jwi/N2mjTiR1CDcMK+jNHZbxXJIAaPttF4mWSQ8mAssLC6C6e69B8Gi9p
 LT2YFKJS9G7D/OGHTj5dvqnKFCHUr1+tnPxRVHkZF6oLZVOpphkTLKJXM
 mrVCd8bSPdkjTqndphHbg0Vfp5q1BA3h85QXUNx9kY1UUDQ+6inkoxpR5 A==;
X-CSE-ConnectionGUID: JvE3iyNIRn2F5uY+KDzlZg==
X-CSE-MsgGUID: mlQM8oRSTb2IP8PQesmlFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14452454"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14452454"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:11:38 -0700
X-CSE-ConnectionGUID: alS3ZJuNReemtx5A4CRRmg==
X-CSE-MsgGUID: bsCNMK1NQ0eQb06KmVtuag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="60848413"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2024 10:11:37 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v13 7/9] drm/i915/display: Compute Adaptive sync SDP params
Date: Wed,  5 Jun 2024 22:31:09 +0530
Message-Id: <20240605170111.494784-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
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

Compute params for Adaptive Sync SDP when Fixed Average Vtotal
mode is enabled.

--v2:
Since vrr.enable is set in case of cmrr also, handle accordingly(Ankit).

--v3:
- Since vrr.enable is set in case of cmrr also, handle
accordingly(Ankit).
- check cmrr.enable when CMRR flags are set during intel_dp_compute_as_sdp.

--v4:
- Use drm_mode_vrefresh instead of manual calculation (Ankit).

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ac81b172b1ec..b5915c23302f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2637,11 +2637,19 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	/* Currently only DP_AS_SDP_AVT_FIXED_VTOTAL mode supported */
 	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
 	as_sdp->length = 0x9;
-	as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
-	as_sdp->vtotal = adjusted_mode->vtotal;
-	as_sdp->target_rr = 0;
 	as_sdp->duration_incr_ms = 0;
 	as_sdp->duration_incr_ms = 0;
+
+	if (crtc_state->cmrr.enable) {
+		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
+		as_sdp->vtotal = adjusted_mode->vtotal;
+		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
+		as_sdp->target_rr_divider = true;
+	} else {
+		as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
+		as_sdp->vtotal = adjusted_mode->vtotal;
+		as_sdp->target_rr = 0;
+	}
 }
 
 static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
-- 
2.25.1

