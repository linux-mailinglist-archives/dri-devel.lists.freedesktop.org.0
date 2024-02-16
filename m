Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE5A857F52
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D5A10EAFD;
	Fri, 16 Feb 2024 14:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUufZ5YW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5A010EAEE;
 Fri, 16 Feb 2024 14:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708093645; x=1739629645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JVa8m+SzsQhzx4Mp4ktIEX8XUK8uCBRL3IIlhmphuCU=;
 b=VUufZ5YWTKwgYbWM0J8BtIXI3Ot8dNmUVGdxDO75CsdPBTb44IF5hDsX
 XO5/xNvaBWoB3yY7hpc/uVjQ5x3iCp+Yuew6o+CzR092bw/NIMkSi3dCp
 KIGzwtcgzgW7empZ75fODDf7hAu2aNWSmT2bcp37IeYR1wYQsuz/0DA/Y
 bVKLxro1lDLKmfAVyy9jZt67F30RCq9n7jLE8P3XTR+pT5g3/B/hfj8tJ
 BBqlH7mVpqdnwxzOFNkDZ6FYOxPJFGVGNmA/201EaP9zBPyDNiQNfUv59
 MFl3q2YznPlz0mFtH3Lp3L/uyaRxPcsQV/1aMcuF9I4znB069QkpwIl5k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2076809"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2076809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 06:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3818343"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa010.fm.intel.com with ESMTP; 16 Feb 2024 06:27:23 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH 2/6] drm: Add Adaptive Sync SDP logging
Date: Fri, 16 Feb 2024 19:50:20 +0530
Message-Id: <20240216142024.1884258-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240216142024.1884258-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240216142024.1884258-1-mitulkumar.ajitkumar.golani@intel.com>
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

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c       | 12 ++++++++
 .../drm/i915/display/intel_crtc_state_dump.c  | 12 ++++++++
 .../drm/i915/display/intel_display_types.h    |  1 +
 include/drm/display/drm_dp.h                  |  2 ++
 include/drm/display/drm_dp_helper.h           | 30 +++++++++++++++++++
 5 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 81c5507928f5..5911b20de2ea 100644
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
+	drm_printf(p, "    operation_mode: %d\n", as_sdp->operation_mode);
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
index 281afff6ee4e..af6790fb4791 100644
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
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index a0356721de0f..8a692a86d8d6 100644
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
+	int operation_mode;
+};
+
+void drm_dp_as_sdp_log(struct drm_printer *p,
+		       const struct drm_dp_as_sdp *as_sdp);
+
 void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
 
 bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
-- 
2.25.1

