Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0309F8716
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482A710EDC5;
	Thu, 19 Dec 2024 21:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haMdfbhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729B910EDCD;
 Thu, 19 Dec 2024 21:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644123; x=1766180123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wNFPJqO00mVn9O2EQ9xYmLD8wrVHLaCeLw0kCzNtP34=;
 b=haMdfbhCcN8HK3FkMpUBpblSpWMRWMGkVzZla+41ytIbzGDPCaHcEW3D
 Rjd8lc1nBW+ZxPiM7EamCpl1UW9ZzWBHjfFc1khKGB2erbCG9CKZA/h6G
 Uni6wYsuho+Fkl+bwSDBvzOV41OKuGqxadIEpGJ+y+6VaYjtg0zy//aYE
 xpx1jGeqMW82Qzrh40H8Is3TfXC2HIRD0YarKDTLwanVUEShKBTv7JWCV
 +QN+H7KRycIV/1VrYTRBsZx16NdwB1S16aDScGRpEbZEeF3Pognw3piAO
 oQWvz3OxZ4i7mxn07rUBh2L/qEqkkmMgtS/Vou6wCYP4V7mgjtpIkLJuo g==;
X-CSE-ConnectionGUID: t0AmKlqOSBKCwuL0qXpUxQ==
X-CSE-MsgGUID: T05zrqbOTfauj9DQ9TSttQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52590382"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="52590382"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:20 -0800
X-CSE-ConnectionGUID: vLYx9jo5Sbewqz/A4rpBxw==
X-CSE-MsgGUID: UgeX0LsPR2yrKa9F1qkwiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="129146291"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 12/16] drm/i915/ddi: enable ACT handling for 128b/132b SST
Date: Thu, 19 Dec 2024 23:34:01 +0200
Message-Id: <90c3402b0b11f13600c700f07c103738413ae6f9.1734643485.git.jani.nikula@intel.com>
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

Add ACT handling for 128b/132b SST.

This is preparation for enabling 128b/132b SST. This path is not
reachable yet.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 91e6cd91e91f..7b739b9c5a06 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3486,6 +3486,19 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
 	/* Enable/Disable DP2.0 SDP split config before transcoder */
 	intel_audio_sdp_split_update(crtc_state);
 
+	/* 128b/132b SST */
+	if (intel_dp_is_uhbr(crtc_state)) {
+		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+
+		intel_ddi_clear_act_sent(encoder, crtc_state);
+
+		intel_de_rmw(display, TRANS_DDI_FUNC_CTL(display, cpu_transcoder), 0,
+			     TRANS_DDI_DP_VC_PAYLOAD_ALLOC);
+
+		intel_ddi_wait_for_act_sent(encoder, crtc_state);
+		drm_dp_dpcd_poll_act_handled(&intel_dp->aux, 0);
+	}
+
 	intel_enable_transcoder(crtc_state);
 
 	intel_ddi_wait_for_fec_status(encoder, crtc_state, true);
-- 
2.39.5

