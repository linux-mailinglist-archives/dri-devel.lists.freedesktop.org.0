Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3393857F58
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94E010EB63;
	Fri, 16 Feb 2024 14:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwSwoKh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3243910EB3C;
 Fri, 16 Feb 2024 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708093647; x=1739629647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5e9ddrJP0W5zIwEVzqCmG2vHEr4/YP74IgVGrKJDOxE=;
 b=dwSwoKh5UskZPzLLJl0B/ocIvZQGGDAYkOJE3LtJjlzt63KHSlZY9dBx
 wO+f7xbVha4rmDH6SCKTqpLdzxZOlFM5DBgKFxAEAGiQ3M2B+0rDDlt4H
 Mf3IDeOL7Gs+VaZVy9IFisxstL5+yxhaWr/CZcTc7a9E1V/OT67/AZ3Rl
 n2XWl44AAfq60i0Da5CqKbUMfLMc24TrTbqznTlsTblTVx4I3u/DNL9Nr
 LniUR46lHulVt6nj8bSwk+koWf0Npb164sIkMZy6t6UoXfVYhmfrDloqU
 dIZ37iuJTv7uRlo8qPkf+VT/ISUFvykXG8Y/YRMCzz8QwUioJ+MDcupXV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2076817"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2076817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 06:27:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3818353"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa010.fm.intel.com with ESMTP; 16 Feb 2024 06:27:25 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH 3/6] drm/i915/dp: Add Read/Write support for Adaptive Sync SDP
Date: Fri, 16 Feb 2024 19:50:21 +0530
Message-Id: <20240216142024.1884258-4-mitulkumar.ajitkumar.golani@intel.com>
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

Add the necessary structures and functions to handle reading and
unpacking Adaptive Sync Secondary Data Packets. Also add support
to write and pack AS SDP.

--v2:
- Correct use of REG_BIT and REG_GENMASK. [Jani]
- Use as_sdp instead of async. [Jani]
- Remove unrelated comments and changes. [Jani]
- Correct code indent. [Jani]

--v3:
- Update definition names for AS SDP which are starting from
HSW, as these defines are applicable for ADLP+.(Ankit)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 95 ++++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.c | 12 ++-
 drivers/gpu/drm/i915/i915_reg.h           |  8 ++
 include/drm/display/drm_dp.h              |  2 +-
 include/drm/display/drm_dp_helper.h       |  2 +
 5 files changed, 114 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 217196196e50..d68fb9d45054 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -95,7 +95,6 @@
 #define INTEL_DP_RESOLUTION_STANDARD	(2 << INTEL_DP_RESOLUTION_SHIFT_MASK)
 #define INTEL_DP_RESOLUTION_FAILSAFE	(3 << INTEL_DP_RESOLUTION_SHIFT_MASK)
 
-
 /* Constants for DP DSC configurations */
 static const u8 valid_dsc_bpp[] = {6, 8, 10, 12, 15};
 
@@ -4089,6 +4088,34 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
 	return false;
 }
 
+static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
+				    struct dp_sdp *sdp, size_t size)
+{
+	size_t length = sizeof(struct dp_sdp);
+
+	if (size < length)
+		return -ENOSPC;
+
+	memset(sdp, 0, size);
+
+	/* Prepare AS (Adaptive Sync) SDP Header */
+	sdp->sdp_header.HB0 = 0;
+	sdp->sdp_header.HB1 = as_sdp->sdp_type;
+	sdp->sdp_header.HB2 = 0x02;
+	sdp->sdp_header.HB3 = as_sdp->length;
+
+	/* Fill AS (Adaptive Sync) SDP Payload */
+	sdp->db[1] = 0x0;
+	sdp->db[1] = as_sdp->vtotal & 0xFF;
+	sdp->db[2] = (as_sdp->vtotal >> 8) & 0xF;
+	sdp->db[3] = 0x0;
+	sdp->db[4] = 0x0;
+	sdp->db[7] = 0x0;
+	sdp->db[8] = 0x0;
+
+	return length;
+}
+
 static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
 				     struct dp_sdp *sdp, size_t size)
 {
@@ -4256,6 +4283,10 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
 							       &crtc_state->infoframes.drm.drm,
 							       &sdp, sizeof(sdp));
 		break;
+	case DP_SDP_ADAPTIVE_SYNC:
+		len = intel_dp_as_sdp_pack(&crtc_state->infoframes.as_sdp, &sdp,
+					   sizeof(sdp));
+		break;
 	default:
 		MISSING_CASE(type);
 		return;
@@ -4276,7 +4307,8 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 	i915_reg_t reg = HSW_TVIDEO_DIP_CTL(crtc_state->cpu_transcoder);
 	u32 dip_enable = VIDEO_DIP_ENABLE_AVI_HSW | VIDEO_DIP_ENABLE_GCP_HSW |
 			 VIDEO_DIP_ENABLE_VS_HSW | VIDEO_DIP_ENABLE_GMP_HSW |
-			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK;
+			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK |
+			 VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
 	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
 
 	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
@@ -4298,6 +4330,40 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
 }
 
+static
+int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
+			   const void *buffer, size_t size)
+{
+	const struct dp_sdp *sdp = buffer;
+
+	if (size < sizeof(struct dp_sdp))
+		return -EINVAL;
+
+	memset(as_sdp, 0, sizeof(*as_sdp));
+
+	if (sdp->sdp_header.HB0 != 0)
+		return -EINVAL;
+
+	if (sdp->sdp_header.HB1 != DP_SDP_ADAPTIVE_SYNC)
+		return -EINVAL;
+
+	if (sdp->sdp_header.HB2 != 0x02)
+		return -EINVAL;
+
+	if ((sdp->sdp_header.HB3 & 0x3F) != 9)
+		return -EINVAL;
+
+	if ((sdp->db[0] & AS_SDP_OP_MODE) != 0x0)
+		return -EINVAL;
+
+	as_sdp->vtotal = ((u64)sdp->db[2] << 32) | (u64)sdp->db[1];
+	as_sdp->target_rr = 0;
+	as_sdp->duration_incr_ms = 0;
+	as_sdp->duration_decr_ms = 0;
+
+	return 0;
+}
+
 static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
 				   const void *buffer, size_t size)
 {
@@ -4368,6 +4434,27 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
 	return 0;
 }
 
+static int
+intel_read_dp_metadata_infoframe_as_sdp(struct intel_encoder *encoder,
+					struct intel_crtc_state *crtc_state,
+					struct drm_dp_as_sdp *as_sdp)
+{
+	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	unsigned int type = DP_SDP_ADAPTIVE_SYNC;
+	struct dp_sdp sdp = {};
+	int ret;
+
+	dig_port->read_infoframe(encoder, crtc_state, type, &sdp,
+				 sizeof(sdp));
+
+	ret = intel_dp_as_sdp_unpack(as_sdp, &sdp, sizeof(sdp));
+	if (ret)
+		drm_dbg_kms(&dev_priv->drm, "Failed to unpack DP AS SDP\n");
+
+	return ret;
+}
+
 static int
 intel_dp_hdr_metadata_infoframe_sdp_unpack(struct hdmi_drm_infoframe *drm_infoframe,
 					   const void *buffer, size_t size)
@@ -4474,6 +4561,10 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
 		intel_read_dp_hdr_metadata_infoframe_sdp(encoder, crtc_state,
 							 &crtc_state->infoframes.drm.drm);
 		break;
+	case DP_SDP_ADAPTIVE_SYNC:
+		intel_read_dp_metadata_infoframe_as_sdp(encoder, crtc_state,
+							&crtc_state->infoframes.as_sdp);
+		break;
 	default:
 		MISSING_CASE(type);
 		break;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 7020e5806109..69e0876f43aa 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -137,6 +137,8 @@ static u32 hsw_infoframe_enable(unsigned int type)
 		return VIDEO_DIP_ENABLE_GMP_HSW;
 	case DP_SDP_VSC:
 		return VIDEO_DIP_ENABLE_VSC_HSW;
+	case DP_SDP_ADAPTIVE_SYNC:
+		return VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
 	case DP_SDP_PPS:
 		return VDIP_ENABLE_PPS;
 	case HDMI_INFOFRAME_TYPE_AVI:
@@ -164,6 +166,8 @@ hsw_dip_data_reg(struct drm_i915_private *dev_priv,
 		return HSW_TVIDEO_DIP_GMP_DATA(cpu_transcoder, i);
 	case DP_SDP_VSC:
 		return HSW_TVIDEO_DIP_VSC_DATA(cpu_transcoder, i);
+	case DP_SDP_ADAPTIVE_SYNC:
+		return TVIDEO_DIP_AS_SDP_DATA(cpu_transcoder, i);
 	case DP_SDP_PPS:
 		return ICL_VIDEO_DIP_PPS_DATA(cpu_transcoder, i);
 	case HDMI_INFOFRAME_TYPE_AVI:
@@ -186,6 +190,8 @@ static int hsw_dip_data_size(struct drm_i915_private *dev_priv,
 	switch (type) {
 	case DP_SDP_VSC:
 		return VIDEO_DIP_VSC_DATA_SIZE;
+	case DP_SDP_ADAPTIVE_SYNC:
+		return VIDEO_DIP_ASYNC_DATA_SIZE;
 	case DP_SDP_PPS:
 		return VIDEO_DIP_PPS_DATA_SIZE;
 	case HDMI_PACKET_TYPE_GAMUT_METADATA:
@@ -558,7 +564,8 @@ static u32 hsw_infoframes_enabled(struct intel_encoder *encoder,
 
 	mask = (VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
 		VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
-		VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW);
+		VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
+		VIDEO_DIP_ENABLE_ADAPTIVE_SYNC);
 
 	if (DISPLAY_VER(dev_priv) >= 10)
 		mask |= VIDEO_DIP_ENABLE_DRM_GLK;
@@ -570,6 +577,7 @@ static const u8 infoframe_type_to_idx[] = {
 	HDMI_PACKET_TYPE_GENERAL_CONTROL,
 	HDMI_PACKET_TYPE_GAMUT_METADATA,
 	DP_SDP_VSC,
+	DP_SDP_ADAPTIVE_SYNC,
 	HDMI_INFOFRAME_TYPE_AVI,
 	HDMI_INFOFRAME_TYPE_SPD,
 	HDMI_INFOFRAME_TYPE_VENDOR,
@@ -1212,7 +1220,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
 	val &= ~(VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
 		 VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
 		 VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
-		 VIDEO_DIP_ENABLE_DRM_GLK);
+		 VIDEO_DIP_ENABLE_DRM_GLK | VIDEO_DIP_ENABLE_ADAPTIVE_SYNC);
 
 	if (!enable) {
 		intel_de_write(dev_priv, reg, val);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e00557e1a57f..c02ea07af4c2 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2312,6 +2312,7 @@
  * (Haswell and newer) to see which VIDEO_DIP_DATA byte corresponds to each byte
  * of the infoframe structure specified by CEA-861. */
 #define   VIDEO_DIP_DATA_SIZE	32
+#define   VIDEO_DIP_ASYNC_DATA_SIZE	36
 #define   VIDEO_DIP_GMP_DATA_SIZE	36
 #define   VIDEO_DIP_VSC_DATA_SIZE	36
 #define   VIDEO_DIP_PPS_DATA_SIZE	132
@@ -2350,6 +2351,8 @@
 #define   VIDEO_DIP_ENABLE_VS_HSW	(1 << 8)
 #define   VIDEO_DIP_ENABLE_GMP_HSW	(1 << 4)
 #define   VIDEO_DIP_ENABLE_SPD_HSW	(1 << 0)
+/* ADL and later: */
+#define   VIDEO_DIP_ENABLE_ADAPTIVE_SYNC	REG_BIT(23)
 
 /* Panel fitting */
 #define PFIT_CONTROL	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61230)
@@ -5040,6 +5043,7 @@
 #define _HSW_VIDEO_DIP_SPD_DATA_A	0x602A0
 #define _HSW_VIDEO_DIP_GMP_DATA_A	0x602E0
 #define _HSW_VIDEO_DIP_VSC_DATA_A	0x60320
+#define	_VIDEO_DIP_AS_SDP_DATA_A	0x60484
 #define _GLK_VIDEO_DIP_DRM_DATA_A	0x60440
 #define _HSW_VIDEO_DIP_AVI_ECC_A	0x60240
 #define _HSW_VIDEO_DIP_VS_ECC_A		0x60280
@@ -5054,6 +5058,7 @@
 #define _HSW_VIDEO_DIP_SPD_DATA_B	0x612A0
 #define _HSW_VIDEO_DIP_GMP_DATA_B	0x612E0
 #define _HSW_VIDEO_DIP_VSC_DATA_B	0x61320
+#define	_VIDEO_DIP_AS_SDP_DATA_B	0x61484
 #define _GLK_VIDEO_DIP_DRM_DATA_B	0x61440
 #define _HSW_VIDEO_DIP_BVI_ECC_B	0x61240
 #define _HSW_VIDEO_DIP_VS_ECC_B		0x61280
@@ -5083,6 +5088,9 @@
 #define GLK_TVIDEO_DIP_DRM_DATA(trans, i)	_MMIO_TRANS2(trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)
 #define ICL_VIDEO_DIP_PPS_DATA(trans, i)	_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)
 #define ICL_VIDEO_DIP_PPS_ECC(trans, i)		_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)
+/*ADLP and later: */
+#define TVIDEO_DIP_AS_SDP_DATA(trans, i)	_MMIO_TRANS2(trans,\
+							     _VIDEO_DIP_AS_SDP_DATA_A + (i) * 4)
 
 #define _HSW_STEREO_3D_CTL_A		0x70020
 #define   S3D_ENABLE			(1 << 31)
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index af6790fb4791..6f4a3e95906c 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1578,7 +1578,7 @@ enum drm_dp_phy {
 #define DP_SDP_AUDIO_COPYMANAGEMENT	0x05 /* DP 1.2 */
 #define DP_SDP_ISRC			0x06 /* DP 1.2 */
 #define DP_SDP_VSC			0x07 /* DP 1.2 */
-#define DP_SDP_ADAPTIVE_SYNC    0x22 /* DP 1.4 */
+#define DP_SDP_ADAPTIVE_SYNC		0x22 /* DP 1.4 */
 #define DP_SDP_CAMERA_GENERIC(i)	(0x08 + (i)) /* 0-7, DP 1.3 */
 #define DP_SDP_PPS			0x10 /* DP 1.4 */
 #define DP_SDP_VSC_EXT_VESA		0x20 /* DP 1.4 */
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8a692a86d8d6..a4e0b18bba3a 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -839,6 +839,8 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
 #define DRM_DP_BW_OVERHEAD_FEC		BIT(3)
 #define DRM_DP_BW_OVERHEAD_DSC		BIT(4)
 
+#define AS_SDP_OP_MODE				GENMASK(1, 0)
+
 int drm_dp_bw_overhead(int lane_count, int hactive,
 		       int dsc_slice_count,
 		       int bpp_x16, unsigned long flags);
-- 
2.25.1

