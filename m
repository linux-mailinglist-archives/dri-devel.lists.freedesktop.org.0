Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482AF6358FF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 11:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B6110E22B;
	Wed, 23 Nov 2022 10:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1959910E232;
 Wed, 23 Nov 2022 10:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669197955; x=1700733955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hq5A3SLLEP6GHJoz5Ag5otAP5agEzcZxZ3KjT1qa7Ik=;
 b=STZ/8T7MNocH9yXa72fdNwNCtq9NxruALAa1zeQlg+2pf9xCedau8Puh
 7vNl4xm8gkxBXK/FL1zWiBMQE6JRSsUBxYZ/IGT86EVNp/0iEHldhZ9CO
 Oou4WbaEb8anpE68j9i8rDO33yiFXrmofgTSGp6qJfs+FFAtt6aNCAM7z
 5CEOmTWy66fIlfDNukWQ00wW9Fhj9xVU/j3BHp1kefgUOAO6FKnpiyOA5
 7vzKR46E+K1DU0PxaBHihIRGV9BtNU6f2P2NEkMKQp9XNht0hhGEHHCEm
 LSsSoaaIXbPj9owTQkhBAvY4e0MYR+Fr6GGqZ5Pn4W8nvsBymqEkfCSZf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="340909333"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="340909333"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 02:05:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="747730476"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="747730476"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga002.fm.intel.com with ESMTP; 23 Nov 2022 02:05:52 -0800
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915: Extract VESA DSC bpp alignment to separate
 function
Date: Wed, 23 Nov 2022 12:05:51 +0200
Message-Id: <20221123100551.29080-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103132146.12759-1-stanislav.lisovskiy@intel.com>
References: <20221103132146.12759-1-stanislav.lisovskiy@intel.com>
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
v3: Rename intel_dp_dsc_nearest_vesa_bpp to intel_dp_dsc_nearest_valid_bpp
    to reflect its meaning more properly.
    (Manasi Navare)

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 50 +++++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.h     |  1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  1 -
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 44e2424a54c0..d78216fba0a2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -672,6 +672,36 @@ small_joiner_ram_size_bits(struct drm_i915_private *i915)
 		return 6144 * 8;
 }
 
+u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_private *i915, u32 bpp, u32 pipe_bpp)
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
@@ -680,7 +710,6 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 				u32 timeslots)
 {
 	u32 bits_per_pixel, max_bpp_small_joiner_ram;
-	int i;
 
 	/*
 	 * Available Link Bandwidth(Kbits/sec) = (NumberOfLanes)*
@@ -713,24 +742,7 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
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
+	bits_per_pixel = intel_dp_dsc_nearest_valid_bpp(i915, bits_per_pixel, pipe_bpp);
 
 	/*
 	 * Compressed BPP in U6.4 format so multiply by 16, for Gen 11,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index c6539a6915e9..e4faccf87370 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -120,6 +120,7 @@ static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 }
 
 u32 intel_dp_mode_to_fec_clock(u32 mode_clock);
+u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_private *i915, u32 bpp, u32 pipe_bpp);
 
 void intel_ddi_update_pipe(struct intel_atomic_state *state,
 			   struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 59f80af8d17d..b4f01c01dc1c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -115,7 +115,6 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 	return slots;
 }
 
-
 static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 					    struct intel_crtc_state *crtc_state,
 					    struct drm_connector_state *conn_state,
-- 
2.37.3

