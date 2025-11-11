Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C654C4E0C2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE9810E57D;
	Tue, 11 Nov 2025 13:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYDLN22Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B18810E57D;
 Tue, 11 Nov 2025 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762866666; x=1794402666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ZfnXODM6Sn4h8xdkC5jpLXJxtJDF8RHCEAa32MR9+M=;
 b=dYDLN22ZIBR07baM98aj9CgFBYXjwCUARbKgjZ1ga9W4S/MWEr0pvlfY
 cd+SOoTAqBB3FD9cdRG0lnzRQ56ltjnTXp45O8piMsgvXZOUUs0P1Ue/U
 YOYXbmm37rdtIMJLy4ZAJdXD/fbRgGYGqTstlL53Oor2D9BLBVgw79cA8
 eb3gWm/aRlgDBa3GvYirka347tJGiuWueUezW8n+/Y8QRbD68qFMy13g+
 KLR7CuyjEszkHHci6X89/5RE2fe+SQciq28a7WOI9NejmGu90ZuebylQ5
 2VjX261vM18Dt2I93eNQW+ww+EMQ6Z2lKVC/FHOK6j02k4nO7piVOjzoj w==;
X-CSE-ConnectionGUID: nBpA6icxRy2sXQmoo+8vsA==
X-CSE-MsgGUID: MI3YDShhQ7CKSrC+pqvLww==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64967478"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64967478"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 05:11:06 -0800
X-CSE-ConnectionGUID: 9RHwoCV0So+YCsS3ZzitAQ==
X-CSE-MsgGUID: dSFpWFomTaqP38DS8Cr5Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189129292"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 11 Nov 2025 05:11:04 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v3 07/10] drm/i915/alpm: Program lttpr count for DP 2.1 alpm
Date: Tue, 11 Nov 2025 18:13:13 +0530
Message-Id: <20251111124316.1421013-8-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251111124316.1421013-1-animesh.manna@intel.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Issue a aux write transaction to dpcd 0xf000a with total number of lttpr
before link traning.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index aad5fe14962f..cf25fd51f452 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1624,6 +1624,16 @@ intel_dp_128b132b_link_train(struct intel_dp *intel_dp,
 	return passed;
 }
 
+static void intel_dp_update_lttpr_count(struct intel_dp *intel_dp,
+					int lttpr_count)
+{
+	if (!intel_dp_is_edp(intel_dp) ||
+	    intel_dp->lttpr_common_caps[0] <= 0x20)
+		return;
+
+	drm_dp_dpcd_writeb(&intel_dp->aux, DP_TOTAL_LTTPR_CNT, lttpr_count);
+}
+
 /**
  * intel_dp_start_link_train - start link training
  * @state: Atomic state
@@ -1660,6 +1670,8 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 
 	intel_dp_prepare_link_train(intel_dp, crtc_state);
 
+	intel_dp_update_lttpr_count(intel_dp, lttpr_count);
+
 	if (intel_dp_is_uhbr(crtc_state))
 		passed = intel_dp_128b132b_link_train(intel_dp, crtc_state, lttpr_count);
 	else
-- 
2.29.0

