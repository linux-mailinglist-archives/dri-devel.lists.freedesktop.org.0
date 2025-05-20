Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE82ABD071
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C75E10E295;
	Tue, 20 May 2025 07:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nV0VEr8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBDC10E295;
 Tue, 20 May 2025 07:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747726291; x=1779262291;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Oin5F/ANnbaAaTVny8aI46R85G4La+cyGjjTojTOGEU=;
 b=nV0VEr8PP0CkyEeLX89lrFAOXvixyg+aAtAegSk04TpBk7V89Llc3HYI
 ApvGLdsP93ZCCcbqZnRD2HoSRIvs2NDVgNFRYKR767qeeIu0NND2k1E0C
 2QJCH86PSZ+7k9tTuGJkmdMg/zxNQkZ6Ja8Z4qE5uZ7uhKQ81gggud9md
 gGC0VmF1ks863khub27aj8TLIa+FeWBXQ21mfqz0kE8vgQG35HxdbWzUN
 ykfTjMU+NqiJJ9ff3OFZ3j79RISFY1flr78kKyOlGOzWNQUD7efKESK6q
 4c3/eGMdTgsINjuEQ8+qow1faMeatNIOYlMn0Y7MKXi95Y04An2nxWNoZ g==;
X-CSE-ConnectionGUID: VtA41KWZTPWeKpViZpWbzg==
X-CSE-MsgGUID: JzmJ/3gvS8S4KlXxA4Qn4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60282148"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60282148"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 00:31:28 -0700
X-CSE-ConnectionGUID: xZRLW7rMRl2AcT4dRGpY4A==
X-CSE-MsgGUID: cU06+jkbRWyg62WTytNEWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140512482"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 00:31:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/dp: Allow HBR3 without TPS4 support for eDP panels
Date: Tue, 20 May 2025 12:50:23 +0530
Message-ID: <20250520072023.1661211-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Commit 584cf613c24a ("drm/i915/dp: Reject HBR3 when sink doesn't support
TPS4") introduced a blanket rejection of HBR3 link rate when the sink does
not support TPS4. While this was intended to address instability observed
on certain eDP panels [1], the TPS4 requirement is only mandated for DPRX
and not for eDPRX.

This change inadvertently causes blank screens on some eDP panels that do
not advertise TPS4 support, and require HBR3 to operate at their fixed
native resolution.

To restore functionality for such panels do not reject HBR3 when sink
doesn't support TPS4. Instead reject HBR3 for specific panel that are
not able to handle HBR3 [1].

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5969

Fixes: 584cf613c24a ("drm/i915/dp: Reject HBR3 when sink doesn't support TPS4")
Cc: stable@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c |  2 ++
 drivers/gpu/drm/i915/display/intel_dp.c | 21 ++++++++++-----------
 include/drm/display/drm_dp_helper.h     |  7 +++++++
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f2a6559a2710..bf66489c9202 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2526,6 +2526,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
+	/* Novatek panel */
+	{ OUI(0x38, 0xEC, 0x11), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBR3) },
 };
 
 #undef OUI
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 21297bc4cc00..0bfc84cbd50d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -184,13 +184,13 @@ static int max_dprx_rate(struct intel_dp *intel_dp)
 		max_rate = drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
 
 	/*
-	 * Some broken eDP sinks illegally declare support for
-	 * HBR3 without TPS4, and are unable to produce a stable
-	 * output. Reject HBR3 when TPS4 is not available.
+	 * Some broken eDP sinks declare support for HBR3 but are unable to
+	 * produce a stable output. For these panel reject HBR3.
 	 */
-	if (max_rate >= 810000 && !drm_dp_tps4_supported(intel_dp->dpcd)) {
+	if (max_rate >= 810000 &&
+	    drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_HBR3)) {
 		drm_dbg_kms(display->drm,
-			    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
+			    "[ENCODER:%d:%s] Rejecting HBR3 due to DP_DPCD_QUIRK_HBR3\n",
 			    encoder->base.base.id, encoder->base.name);
 		max_rate = 540000;
 	}
@@ -4296,15 +4296,14 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 
 			if (rate == 0)
 				break;
-
 			/*
-			 * Some broken eDP sinks illegally declare support for
-			 * HBR3 without TPS4, and are unable to produce a stable
-			 * output. Reject HBR3 when TPS4 is not available.
+			 * Some broken eDP sinks declare support for HBR3 but are unable to
+			 * produce a stable output. For these panel reject HBR3.
 			 */
-			if (rate >= 810000 && !drm_dp_tps4_supported(intel_dp->dpcd)) {
+			if (rate >= 810000 &&
+			    drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_HBR3)) {
 				drm_dbg_kms(display->drm,
-					    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
+					    "[ENCODER:%d:%s] Rejecting HBR3 due to DP_DPCD_QUIRK_HBR3\n",
 					    encoder->base.base.id, encoder->base.name);
 				break;
 			}
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e4ca35143ff9..5e60a37b61ce 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -814,6 +814,13 @@ enum drm_dp_quirk {
 	 * requires enabling DSC.
 	 */
 	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
+
+	/**
+	 * @DP_DPCD_QUIRK_HBR3:
+	 *
+	 * The device supports HBR3 but is unable to produce stable output.
+	 */
+	DP_DPCD_QUIRK_HBR3,
 };
 
 /**
-- 
2.45.2

