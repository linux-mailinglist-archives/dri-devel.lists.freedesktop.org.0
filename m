Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C7185F7F2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 13:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F52B10E90A;
	Thu, 22 Feb 2024 12:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTppD7bu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D84110E4C3;
 Thu, 22 Feb 2024 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708604360; x=1740140360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jBcuUYb0ozfFzf/6Q0UfXOZKr+9eXhT49ZGfIKCdGf8=;
 b=cTppD7bubSySt8BJ6GJD6zXfxDdg459IVlmOGiDG6HyYnb3zw4J4YPbN
 hPlNsl1vYUadrzzZHj7l5J5N8QlWId5OLSal52639eMK5u+M6Gv3azjMM
 Hrgdyoyv5WPrrMX0AqOaOKl3Z+d9kxemlgHs4isTzdim8KBVlZvwoFatu
 ztCbYNXWa//IsYjB3Xffl3x+sOnMOSSHK/EVT0zMPQB3YIgFas1uLo4G7
 f21VtWC0N5BVdJZRR+tPnNWIDCnINK2kUSBjApHNpuUHkk/uumSZ6AG8p
 8Xe3TsIn5fJJ2q8Qb7fa5egzQonVyzknCrBmpdkYVSXrk9bZnDAASej8p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20257337"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="20257337"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 04:19:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5682099"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 22 Feb 2024 04:19:17 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH 2/6] drm: Add Adaptive Sync SDP logging
Date: Thu, 22 Feb 2024 17:42:19 +0530
Message-Id: <20240222121223.2257958-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222121223.2257958-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240222121223.2257958-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add structure representing Adaptive Sync Secondary Data
Packet (AS SDP). Also, add Adaptive Sync SDP logging in
drm_dp_helper.c to facilitate debugging.

--v2:
- Update logging. [Jani, Ankit]
- use as_sdp instead of async [Ankit]
- Correct define placeholders to where it is being actually used. [Jani]
- Update members in as_sdp structure and make it uniform. [Jani]

--v3:
- Add changes dri-devel mail list. No code changes.

--v4:
- Instead of directly using operation mode, use enum to accommodate
all operation modes (Ankit).

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c       | 12 +++++++
 .../drm/i915/display/intel_crtc_state_dump.c  | 12 +++++++
 .../drm/i915/display/intel_display_types.h    |  1 +
 include/drm/display/drm_dp.h                  |  9 ++++++
 include/drm/display/drm_dp_helper.h           | 32 +++++++++++++++++++
 5 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 81c5507928f5..a5804c9c245d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2913,6 +2913,18 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
 }
 EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
 
+void drm_dp_as_sdp_log(struct drm_printer *p, const struct drm_dp_as_sdp *as_sdp)
+{
+	drm_printf(p, "DP SDP: AS_SDP, revision %u, length %u\n",
+		   as_sdp->revision, as_sdp->length);
+	drm_printf(p, "	vtotal: %d\n", as_sdp->vtotal);
+	drm_printf(p, "    target_rr: %d\n", as_sdp->target_rr);
+	drm_printf(p, "    duration_incr_ms: %d\n", as_sdp->duration_incr_ms);
+	drm_printf(p, "    duration_decr_ms: %d\n", as_sdp->duration_decr_ms);
+	drm_printf(p, "    operation_mode: %d\n", as_sdp->mode);
+}
+EXPORT_SYMBOL(drm_dp_as_sdp_log);
+
 /**
  * drm_dp_as_sdp_supported() - check if adaptive sync sdp is supported
  * @aux: DisplayPort AUX channel
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 4bcf446c75f4..26d77c2934e8 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -60,6 +60,15 @@ intel_dump_dp_vsc_sdp(struct drm_i915_private *i915,
 	drm_dp_vsc_sdp_log(&p, vsc);
 }
 
+static void
+intel_dump_dp_as_sdp(struct drm_i915_private *i915,
+		     const struct drm_dp_as_sdp *as_sdp)
+{
+	struct drm_printer p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, "AS_SDP");
+
+	drm_dp_as_sdp_log(&p, as_sdp);
+}
+
 static void
 intel_dump_buffer(struct drm_i915_private *i915,
 		  const char *prefix, const u8 *buf, size_t len)
@@ -299,6 +308,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
 		intel_dump_infoframe(i915, &pipe_config->infoframes.drm);
+	if (pipe_config->infoframes.enable &
+	    intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
+		intel_dump_dp_as_sdp(i915, &pipe_config->infoframes.as_sdp);
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
 		intel_dump_dp_vsc_sdp(i915, &pipe_config->infoframes.vsc);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0d4012097db1..a6991bc3f07b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1332,6 +1332,7 @@ struct intel_crtc_state {
 		union hdmi_infoframe hdmi;
 		union hdmi_infoframe drm;
 		struct drm_dp_vsc_sdp vsc;
+		struct drm_dp_as_sdp as_sdp;
 	} infoframes;
 
 	u8 eld[MAX_ELD_BYTES];
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 281afff6ee4e..537d6b7148af 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1578,10 +1578,12 @@ enum drm_dp_phy {
 #define DP_SDP_AUDIO_COPYMANAGEMENT	0x05 /* DP 1.2 */
 #define DP_SDP_ISRC			0x06 /* DP 1.2 */
 #define DP_SDP_VSC			0x07 /* DP 1.2 */
+#define DP_SDP_ADAPTIVE_SYNC    0x22 /* DP 1.4 */
 #define DP_SDP_CAMERA_GENERIC(i)	(0x08 + (i)) /* 0-7, DP 1.3 */
 #define DP_SDP_PPS			0x10 /* DP 1.4 */
 #define DP_SDP_VSC_EXT_VESA		0x20 /* DP 1.4 */
 #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
+
 /* 0x80+ CEA-861 infoframe types */
 
 #define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b
@@ -1737,4 +1739,11 @@ enum dp_content_type {
 	DP_CONTENT_TYPE_GAME = 0x04,
 };
 
+enum operation_mode {
+	DP_AS_SDP_AVT_DYNAMIC_VTOTAL = 0x00,
+	DP_AS_SDP_AVT_FIXED_VTOTAL = 0x01,
+	DP_AS_SDP_FAVT_TRR_NOT_REACHED = 0x02,
+	DP_AS_SDP_FAVT_TRR_REACHED = 0x03
+};
+
 #endif /* _DRM_DP_H_ */
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index a0356721de0f..bd6205776272 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -98,6 +98,36 @@ struct drm_dp_vsc_sdp {
 	enum dp_content_type content_type;
 };
 
+/**
+ * struct drm_dp_as_sdp - drm DP Adaptive Sync SDP
+ *
+ * This structure represents a DP AS SDP of drm
+ * It is based on DP 2.1 spec [Table 2-126:  Adaptive-Sync SDP Header Bytes] and
+ * [Table 2-127: Adaptive-Sync SDP Payload for DB0 through DB8]
+ *
+ * @sdp_type: secondary-data packet type
+ * @length: number of valid data bytes
+ * @vmin: minimum vtotal
+ * @vmax: maximum vtotal
+ * @duration_incr_ms: Successive frame duration increase
+ * @duration_decr_ms: Successive frame duration decrease
+ * @operation_mode: Adaptive Sync Operation Mode
+ */
+
+struct drm_dp_as_sdp {
+	unsigned char sdp_type;
+	unsigned char revision;
+	unsigned char length;
+	int vtotal;
+	int target_rr;
+	int duration_incr_ms;
+	int duration_decr_ms;
+	enum operation_mode mode;
+};
+
+void drm_dp_as_sdp_log(struct drm_printer *p,
+		       const struct drm_dp_as_sdp *as_sdp);
+
 void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
 
 bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
@@ -809,6 +839,8 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
 #define DRM_DP_BW_OVERHEAD_FEC		BIT(3)
 #define DRM_DP_BW_OVERHEAD_DSC		BIT(4)
 
+#define AS_SDP_OP_MODE				GENMASK(1, 0)
+
 int drm_dp_bw_overhead(int lane_count, int hactive,
 		       int dsc_slice_count,
 		       int bpp_x16, unsigned long flags);
-- 
2.25.1

