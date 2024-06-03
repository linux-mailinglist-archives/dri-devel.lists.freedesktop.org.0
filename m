Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE68D7B2D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 07:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EDA10E2BD;
	Mon,  3 Jun 2024 05:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F56ECN6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6663710E289;
 Mon,  3 Jun 2024 05:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717394375; x=1748930375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zdkCBCazi/qdpu9yOeKv2bUMIxhAPrM+4GCDr8q3ESU=;
 b=F56ECN6ERiiROOMWWd13L9apLVCSRsWakfFq5fGkSKe0pAg6JGo22TxI
 GkUSVeQayTuXF1UeoFu49hvHIv5hImWFJ7NqZrSsJKxZ6mSzyoyWPa7IN
 0TBgJ/h8geDWOPpnLz83BkLhgPp7JMp3fAK7qrankKPsJ/AO3CdzEJZFN
 wZHndgSzYWd6v2Y1An15AFHTE+Sd/Kid3fk6Zp5Xe94W84bEF72PCvbk9
 ph38xdsv1I6K6bonBLkE80aNjRTkENNVrCRQYcAjd79iHXYkKvWU+ygEe
 7NdStTxirmtUyvB+YIZitnSVzLD0PNLpXi0NfElxdjdpW4+BcWsJS/B3K A==;
X-CSE-ConnectionGUID: 9RlSDsP4Q6awBpXqrumq/Q==
X-CSE-MsgGUID: yBS/U5ikTvag2IFMAAZOsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24527525"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="24527525"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 22:59:35 -0700
X-CSE-ConnectionGUID: iniMgeVTRbCYFyQXclx5JQ==
X-CSE-MsgGUID: b1HDt23CR3aBKS7mzzaAhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="67616499"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 02 Jun 2024 22:59:34 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v11 6/8] drm/i915/display: Compute Adaptive sync SDP params
Date: Mon,  3 Jun 2024 11:19:02 +0530
Message-Id: <20240603054904.222589-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
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

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ac81b172b1ec..be3b9ba943a5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2637,11 +2637,20 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
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
+		as_sdp->target_rr = DIV_ROUND_UP(adjusted_mode->clock * 1000,
+						 adjusted_mode->htotal * adjusted_mode->vtotal);
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

