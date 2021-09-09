Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC2E4053A9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400416E86D;
	Thu,  9 Sep 2021 12:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6746E86C;
 Thu,  9 Sep 2021 12:52:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="220831449"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="220831449"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:52:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="548547800"
Received: from okozlyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.52])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:52:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [PATCH v3 07/13] drm/i915/dp: use 128b/132b TPS2 for UHBR+ link rates
Date: Thu,  9 Sep 2021 15:51:59 +0300
Message-Id: <723b29223dc570c8b63c3c6fe5fb772d9db06c0d.1631191763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1631191763.git.jani.nikula@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
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

128b/132b channel encoding has separate TPS1 and TPS2, although the DPCD
register values coincide with 8b/10b TPS1 and TPS2 values. Use 128b/132b
TPS2 for channel equalization.

v2: Use intel_dp_is_uhbr

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 508a514c5e37..36b35239da83 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -602,9 +602,9 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 }
 
 /*
- * Pick training pattern for channel equalization. Training pattern 4 for HBR3
- * or for 1.4 devices that support it, training Pattern 3 for HBR2
- * or 1.2 devices that support it, Training Pattern 2 otherwise.
+ * Pick Training Pattern Sequence (TPS) for channel equalization. 128b/132b TPS2
+ * for UHBR+, TPS4 for HBR3 or for 1.4 devices that support it, TPS3 for HBR2 or
+ * 1.2 devices that support it, TPS2 otherwise.
  */
 static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
 				     const struct intel_crtc_state *crtc_state,
@@ -612,6 +612,10 @@ static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
 {
 	bool source_tps3, sink_tps3, source_tps4, sink_tps4;
 
+	/* UHBR+ use separate 128b/132b TPS2 */
+	if (intel_dp_is_uhbr(crtc_state))
+		return DP_TRAINING_PATTERN_2;
+
 	/*
 	 * Intel platforms that support HBR3 also support TPS4. It is mandatory
 	 * for all downstream devices that support HBR3. There are no known eDP
-- 
2.30.2

