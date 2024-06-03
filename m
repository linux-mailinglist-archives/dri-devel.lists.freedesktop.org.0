Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95A8D7B29
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 07:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD4710E2AF;
	Mon,  3 Jun 2024 05:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPGfwmSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1397410E2A9;
 Mon,  3 Jun 2024 05:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717394377; x=1748930377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RmNfJqDKZbQEfzwy67D9xvQPiMvwjRMMC/LlKFL8GQ4=;
 b=RPGfwmStEtN+mt6E/I+6MRoURGxtreNwfYW4WRNyjEgYYJaLwL4Ka7oa
 opwk7kHjMhF8YUvVObPGSJ3Kj3kZN9puKPlN9w2RsX9Ge1pqZ3ixEzXIN
 xRkNyFT1Wzp5UOrWvw3g3eTo73wFFWcP24Md4afbF4ds7n4vG5Enkjg71
 naQpAc2mcf/UEanNLREoRjI3NnWc5eqWcSCqfrrhIgJ1+4YZ4sPpwNugv
 vUemyiHgySQXivZkwl5ofc4m2z0yDI5WsQVSx4HwoTylCc8uT18Q7csRM
 1IgemCXqpyqioTAKC0MN92GwlZjZX2QBORsdhaEESo3nLHxdRqF0lqhGi w==;
X-CSE-ConnectionGUID: PONlUxOTTB+HEvomXNi3Jw==
X-CSE-MsgGUID: 1ZksQU+ZTBqyX7RZHM4LIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24527526"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="24527526"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 22:59:37 -0700
X-CSE-ConnectionGUID: ySEcAIs7Ram2yIIXLGD+XA==
X-CSE-MsgGUID: oOknITzmQ/ygsbERBboHMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="67616502"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 02 Jun 2024 22:59:36 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v11 7/8] drm/i915/display: Compute vrr vsync params
Date: Mon,  3 Jun 2024 11:19:03 +0530
Message-Id: <20240603054904.222589-8-mitulkumar.ajitkumar.golani@intel.com>
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

Compute vrr vsync params in case of FAVT as well instead of
only to AVT mode of operation.

--v2:
- Remove redundant computation for vrr_vsync_start
and vrr_vsync_end(Ankit).

--v3:
- vrr.enable and cmrr.enable check together is not required as both
will be true at the same point in time. (Ankit)
- Replace vrr.enable flag to cmrr.enable, mistakenly added. (Ankit)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 19b364074de0..4ad99a54aa83 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -175,14 +175,15 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	if (crtc_state->uapi.vrr_enabled) {
 		crtc_state->vrr.enable = true;
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
-		if (intel_dp_as_sdp_supported(intel_dp)) {
-			crtc_state->vrr.vsync_start =
-				(crtc_state->hw.adjusted_mode.crtc_vtotal -
-					crtc_state->hw.adjusted_mode.vsync_start);
-			crtc_state->vrr.vsync_end =
-				(crtc_state->hw.adjusted_mode.crtc_vtotal -
-					crtc_state->hw.adjusted_mode.vsync_end);
-		}
+	}
+
+	if (intel_dp_as_sdp_supported(intel_dp)) {
+		crtc_state->vrr.vsync_start =
+			(crtc_state->hw.adjusted_mode.crtc_vtotal -
+			 crtc_state->hw.adjusted_mode.vsync_start);
+		crtc_state->vrr.vsync_end =
+			(crtc_state->hw.adjusted_mode.crtc_vtotal -
+			 crtc_state->hw.adjusted_mode.vsync_end);
 	}
 }
 
-- 
2.25.1

