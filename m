Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3F9C001F9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F1D10E375;
	Thu, 23 Oct 2025 09:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvqlZMRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891C910E375;
 Thu, 23 Oct 2025 09:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210553; x=1792746553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3pHRuTt954iCUGc2C6ONJ+TdLdzlfnXNM2pTaVMezTI=;
 b=BvqlZMRpAUrmz56ydUIouyX8tPdoSMm4LMPix7yc9LJmeOuVyHLSPl2W
 /YsTUfKuQmNJkCubNyczNquV3PGO8mr77gkb4BWpR6wu/17v1QqF45MMe
 nR8EYLLKB4KNh6jBTc4T78ToFYA0Kngwt4f0Gwc0FNqyM2OzHC9ucj0+r
 qQiUh903ntG4oPRyJ988wh48RNOHgkMOWGjE4INNRvtgQNrmHPJ5FMhOq
 51gtCPyFcsj++LNCbP7vdVPWZ4EY1nzAyxZ96TFLo2eczTfhTXvMuYZhW
 OuGrvHyyGSTq1l3kZv7w9DyDtiFqtHLbqztfgKLZJz07GWqbeO2n1A3Of Q==;
X-CSE-ConnectionGUID: dZ/OC1dBQMeSTIQVjmyHmA==
X-CSE-MsgGUID: NRNjXhwNRvC1rzBl6/LM1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67020686"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67020686"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:09:13 -0700
X-CSE-ConnectionGUID: nvA7ypI4RymBOe5To1BWGQ==
X-CSE-MsgGUID: EfTav1BERv2I95zXk/vpyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183329477"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa010.jf.intel.com with ESMTP; 23 Oct 2025 02:09:11 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 8/8] drm/i915/alpm: Program lttpr count for DP 2.1 alpm
Date: Thu, 23 Oct 2025 14:11:47 +0530
Message-Id: <20251023084147.572535-9-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251023084147.572535-1-animesh.manna@intel.com>
References: <20251023084147.572535-1-animesh.manna@intel.com>
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
index 27f3716bdc1f..b1e3ab3f8efc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1623,6 +1623,16 @@ intel_dp_128b132b_link_train(struct intel_dp *intel_dp,
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
@@ -1659,6 +1669,8 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 
 	intel_dp_prepare_link_train(intel_dp, crtc_state);
 
+	intel_dp_update_lttpr_count(intel_dp, lttpr_count);
+
 	if (intel_dp_is_uhbr(crtc_state))
 		passed = intel_dp_128b132b_link_train(intel_dp, crtc_state, lttpr_count);
 	else
-- 
2.29.0

