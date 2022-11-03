Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775EC617DC0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 14:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749BF10E289;
	Thu,  3 Nov 2022 13:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA87810E289;
 Thu,  3 Nov 2022 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667481710; x=1699017710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BeLvh++Al0uxYH6aNnb1lEP9v/jcVWjbaiaogkW0jsM=;
 b=LtrPrgVfnV/R0aR9HP1WC1982bZqK7xaNmktoRcNbNkA2JT1bvZDXjKs
 aKnvG2tcCQy8hoH0+6Fs0eXKjzVRePeuGDk5cPMm1B+7u64pNsQvY+SLG
 9i5HyuytmGXq2cIbmoffL2M3J7Er81MM5A/u2GSCHN+A2ByS2P+QIO+ow
 hmhY2ijHCbEXOYxtOwYCJ9YnDtCVA2ZQ59p/XPLLGqsSR7U0JfCAqvIeI
 GUKY7uOViqQZFulLETQ2/KnrJUikaDImyhgaJSYYj29wMnVKv8VrTFv18
 lSKkW9SnJRp03Vsfjd6mVFGwqjPR48VjJgFyC6p16TMhiIDffTOPvrisE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="308396074"
X-IronPort-AV: E=Sophos;i="5.96,235,1665471600"; d="scan'208";a="308396074"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 06:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="665963992"
X-IronPort-AV: E=Sophos;i="5.96,235,1665471600"; d="scan'208";a="665963992"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by orsmga008.jf.intel.com with ESMTP; 03 Nov 2022 06:21:47 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915: Extract VESA DSC bpp alignment to separate
 function
Date: Thu,  3 Nov 2022 15:21:46 +0200
Message-Id: <20221103132146.12759-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101094222.22091-6-stanislav.lisovskiy@intel.com>
References: <20221101094222.22091-6-stanislav.lisovskiy@intel.com>
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We might to use that function separately from intel_dp_dsc_compute_config
for DP DSC over MST case, because allocating bandwidth in that
case can be a bit more tricky. So in order to avoid code copy-pasta
lets extract this to separate function and reuse it for both SST
and MST cases.

v2: Removed multiple blank lines

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 50 +++++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.h     |  1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  1 -
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 70f4d6422795..8288a30dbd51 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -671,6 +671,36 @@ small_joiner_ram_size_bits(struct drm_i915_private *i915)
 		return 6144 * 8;
 }
 
+u32 intel_dp_dsc_nearest_vesa_bpp(struct drm_i915_private *i915, u32 bpp, u32 pipe_bpp)
+{
+	u32 bits_per_pixel = bpp;
+	int i;
+
+	/* Error out if the max bpp is less than smallest allowed valid bpp */
+	if (bits_per_pixel < valid_dsc_bpp[0]) {
+		drm_dbg_kms(&i915->drm, "Unsupported BPP %u, min %u\n",
+			    bits_per_pixel, valid_dsc_bpp[0]);
+		return 0;
+	}
+
+	/* From XE_LPD onwards we support from bpc upto uncompressed bpp-1 BPPs */
+	if (DISPLAY_VER(i915) >= 13) {
+		bits_per_pixel = min(bits_per_pixel, pipe_bpp - 1);
+	} else {
+		/* Find the nearest match in the array of known BPPs from VESA */
+		for (i = 0; i < ARRAY_SIZE(valid_dsc_bpp) - 1; i++) {
+			if (bits_per_pixel < valid_dsc_bpp[i + 1])
+				break;
+		}
+		drm_dbg_kms(&i915->drm, "Set dsc bpp from %d to VESA %d\n",
+			    bits_per_pixel, valid_dsc_bpp[i]);
+
+		bits_per_pixel = valid_dsc_bpp[i];
+	}
+
+	return bits_per_pixel;
+}
+
 u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 				u32 link_clock, u32 lane_count,
 				u32 mode_clock, u32 mode_hdisplay,
@@ -679,7 +709,6 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 				u32 timeslots)
 {
 	u32 bits_per_pixel, max_bpp_small_joiner_ram;
-	int i;
 
 	/*
 	 * Available Link Bandwidth(Kbits/sec) = (NumberOfLanes)*
@@ -712,24 +741,7 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
 	}
 
-	/* Error out if the max bpp is less than smallest allowed valid bpp */
-	if (bits_per_pixel < valid_dsc_bpp[0]) {
-		drm_dbg_kms(&i915->drm, "Unsupported BPP %u, min %u\n",
-			    bits_per_pixel, valid_dsc_bpp[0]);
-		return 0;
-	}
-
-	/* From XE_LPD onwards we support from bpc upto uncompressed bpp-1 BPPs */
-	if (DISPLAY_VER(i915) >= 13) {
-		bits_per_pixel = min(bits_per_pixel, pipe_bpp - 1);
-	} else {
-		/* Find the nearest match in the array of known BPPs from VESA */
-		for (i = 0; i < ARRAY_SIZE(valid_dsc_bpp) - 1; i++) {
-			if (bits_per_pixel < valid_dsc_bpp[i + 1])
-				break;
-		}
-		bits_per_pixel = valid_dsc_bpp[i];
-	}
+	bits_per_pixel = intel_dp_dsc_nearest_vesa_bpp(i915, bits_per_pixel, pipe_bpp);
 
 	/*
 	 * Compressed BPP in U6.4 format so multiply by 16, for Gen 11,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index c6539a6915e9..0fe10d93b75c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -120,6 +120,7 @@ static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 }
 
 u32 intel_dp_mode_to_fec_clock(u32 mode_clock);
+u32 intel_dp_dsc_nearest_vesa_bpp(struct drm_i915_private *i915, u32 bpp, u32 pipe_bpp);
 
 void intel_ddi_update_pipe(struct intel_atomic_state *state,
 			   struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 61b2bd504e80..8442eea27a57 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -114,7 +114,6 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 	return slots;
 }
 
-
 static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 					    struct intel_crtc_state *crtc_state,
 					    struct drm_connector_state *conn_state,
-- 
2.37.3

