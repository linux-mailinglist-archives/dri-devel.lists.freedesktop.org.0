Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0447E7B53
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B434510E97B;
	Fri, 10 Nov 2023 10:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F072510E976;
 Fri, 10 Nov 2023 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699611402; x=1731147402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nu3PsmaJ6snSfDY+2+n36FGutMcqk7EMn5BpmW98X6g=;
 b=I0s5OG4hV5KDOAybU3SJQXmCswS00j62N8lbEwERpdYRO1XI6kEw1B6B
 BwdzQcGzm1jDC1J/S1O4XizeSUMmFXWZEUdbTKYcncxEUk7dCmVxwU0SE
 sLRPByZ5DeuKdgRaeSqoZ+viY2AJktvbpCuBEIc/b2JiLmsTbiEQgehPJ
 ktLM9p8i2g3lZ+jcbTP3Ehk7JUD3XD4QYz4Gmtm/gN4vyHs85SLFKyC1A
 t8ByuPocu4I7rz/ER57sFscm09dWgOPgIHgRfACq2xS7XN5Z9ieaJfkPA
 JyWBCDPmMcUeVCGfeulctWq8vqGp8Zx8uCCcEoBbcgF2N/iXzB8oM7WCk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11712838"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="11712838"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="4816444"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:39 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/11] drm/i915/dp_mst: Add support for forcing dsc fractional
 bpp via debugfs
Date: Fri, 10 Nov 2023 15:40:20 +0530
Message-Id: <20231110101020.4067342-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, suraj.kandpal@intel.com,
 suijingfeng@loongson.cn, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If force_dsc_fractional_bpp_en is set through debugfs allow DSC iff
compressed bpp is fractional. Continue if the computed compressed bpp
turns out to be a integer.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 322046bb7d42..26b51ba6871d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -172,6 +172,10 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 		struct intel_link_m_n remote_m_n;
 		int link_bpp_x16;
 
+		if (dsc && intel_dp->force_dsc_fractional_bpp_en &&
+		    !to_bpp_frac(bpp_x16))
+			continue;
+
 		drm_dbg_kms(&i915->drm, "Trying bpp " BPP_X16_FMT "\n", BPP_X16_ARGS(bpp_x16));
 
 		ret = intel_dp_mst_check_constraints(i915, bpp_x16, adjusted_mode, crtc_state, dsc);
@@ -225,12 +229,16 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
 			    slots);
 	} else {
-		if (!dsc)
-			crtc_state->pipe_bpp = to_bpp_int(bpp_x16);
-		else
+		if (dsc) {
 			crtc_state->dsc.compressed_bpp_x16 = bpp_x16;
+			if (intel_dp->force_dsc_fractional_bpp_en && to_bpp_frac(bpp_x16))
+				drm_dbg_kms(&i915->drm, "Forcing DSC fractional bpp\n");
+		} else {
+			crtc_state->pipe_bpp = to_bpp_int(bpp_x16);
+		}
 		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp " BPP_X16_FMT " dsc %d\n",
 			    slots, BPP_X16_ARGS(bpp_x16), dsc);
+
 	}
 
 	return slots;
-- 
2.40.1

