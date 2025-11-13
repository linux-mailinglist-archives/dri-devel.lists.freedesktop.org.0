Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554B0C5768D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 13:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7123010E80E;
	Thu, 13 Nov 2025 12:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnSsorCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0587510E7FA;
 Thu, 13 Nov 2025 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763036950; x=1794572950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9VQlFG16oF1hJCTqUHbW9Fd5MMJAZhTsvyrZTO4mNJ8=;
 b=dnSsorCYPZJ0mjHDk3sy87+7McxniVmsXTEPilguQbyyhRQlOwtFKRG/
 bd/coEnZIqIBJ1c1VMriHovF7Hh2/xqeKQ7V1uxMxFc0flt5LMCUk1ufU
 VptfxvXTFxpZLa77Sef+ErF2iajxC0RBvZX/RFEypRrHcGZ6zg4i0zHPt
 dxOwY0+e6hF6A+IgNZpSkOmPBTvj8TQ0ujx9Z/MLKJkfuouqTzoH9lpKh
 lAhm/BDdeIxuGLSwOyRCekE+FolmYwDfqNNkBWW4aeyfOkYfOfQPN8bt1
 rrnapX1/2RbM7EoICMqt4d15HhbJnEXG754itEcfj+evJ+dvkaNkxTGsP w==;
X-CSE-ConnectionGUID: QP411mZkToixCFP8738KVQ==
X-CSE-MsgGUID: KmtP0rNJRJW0ueLgf4fM9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="52677919"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="52677919"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:29:09 -0800
X-CSE-ConnectionGUID: /b2bKboaRHiZ6MKI2fIuvw==
X-CSE-MsgGUID: Hyq+9NrFRk666ed5T5XS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188757760"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 04:29:08 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 07/10] drm/i915/alpm: Program LTTPR count for DP 2.1 ALPM
Date: Thu, 13 Nov 2025 17:31:16 +0530
Message-Id: <20251113120119.1437955-8-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251113120119.1437955-1-animesh.manna@intel.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
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

Issue a AUX write transaction to DPCD DP_TOTAL_LTTPR_CNT (0xf000a)
with total number of LTTPR before link training.

v2: Cosmetic changes. [Suraj]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index aad5fe14962f..d694c2474159 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1624,6 +1624,20 @@ intel_dp_128b132b_link_train(struct intel_dp *intel_dp,
 	return passed;
 }
 
+static void intel_dp_update_lttpr_count(struct intel_dp *intel_dp,
+					int lttpr_count)
+{
+	/*
+	 * Program only for DP2.1 and return if LTTPR revison is less than 0x20
+	 * where 0:3 represents minor rev and 4:7 represent major rev
+	 */
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
@@ -1660,6 +1674,8 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 
 	intel_dp_prepare_link_train(intel_dp, crtc_state);
 
+	intel_dp_update_lttpr_count(intel_dp, lttpr_count);
+
 	if (intel_dp_is_uhbr(crtc_state))
 		passed = intel_dp_128b132b_link_train(intel_dp, crtc_state, lttpr_count);
 	else
-- 
2.29.0

