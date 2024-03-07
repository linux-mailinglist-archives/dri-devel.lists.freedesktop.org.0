Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D13E8747CD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 07:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C746110FDDD;
	Thu,  7 Mar 2024 06:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVPfOUxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639E110FBD7;
 Thu,  7 Mar 2024 06:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709791220; x=1741327220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nFp7xFzeGeR4YL0mIwts1iFPtEOAN6WnsBovRPm2xVo=;
 b=dVPfOUxe9GkJYie0twu4qyH4DMw/P1xVSJiIhiJY5wK1jl0Fci8C+eCq
 EAvf526L1Xq1FiILiRdBmL7VjHuQWCG5phZHljTOlwwIJ4FAXxzd0YSrA
 nAG/Z8li4qTX3pdmz5H53oE9x9RaDeIyNm69AvP15mIugrb4QD1aVRjvL
 ooKZnRW+m4C8Sql6MWuOCsJrOvwsp2fOIBmWxbvsDLI1EXHF4CLIUHTLu
 OvDPl4FpzWldI61zXZR0kuaPY6WTRoYH/AWkIRvDGTQKv4sgktrOs9p3b
 PNkbDURLYWtBdodpNSAuC7KQP8b+U1Khf0VnmQ8qeS/+Zvb/YpJNS0YcQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4313106"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4313106"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 22:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="10087056"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2024 22:00:18 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v16 4/9] drm/i915/dp: Add Read/Write support for Adaptive Sync
 SDP
Date: Thu,  7 Mar 2024 11:23:24 +0530
Message-Id: <20240307055329.3238634-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
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

--v4:
- Remove as_sdp_mode from crtc_state.
- Drop metadata keyword.
- For consistency, update ADL_ prefix or post fix as required.

--v5:
- Check if AS_SDP bit is set in crtc_state->infoframes.enable. If not
  return.
- Check for HAS_AS_SDP() before setting VIDEO_DIP_ENABLE_AS_ADL mask.

--v6:
- Rename intel_read_dp_infoframe_as_sdp to intel_read_dp_as_sdp.

--v7:
- Add read back for length and vtotal correction.

--v8:
- Use as_sdp->target_rr & 0xFF.
- Shift by 8 instead of 32, and drop casting to u64.
-  Remove changes which are does not belong to this patch.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 .../drm/i915/display/intel_display_device.h   |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 92 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++-
 drivers/gpu/drm/i915/i915_reg.h               |  8 ++
 4 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index fe4268813786..6399fbc6c738 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -68,6 +68,7 @@ struct drm_printer;
 #define HAS_TRANSCODER(i915, trans)	((DISPLAY_RUNTIME_INFO(i915)->cpu_transcoder_mask & \
 					  BIT(trans)) != 0)
 #define HAS_VRR(i915)			(DISPLAY_VER(i915) >= 11)
+#define HAS_AS_SDP(i915)		(DISPLAY_VER(i915) >= 13)
 #define INTEL_NUM_PIPES(i915)		(hweight8(DISPLAY_RUNTIME_INFO(i915)->pipe_mask))
 #define I915_HAS_HOTPLUG(i915)		(DISPLAY_INFO(i915)->has_hotplug)
 #define OVERLAY_NEEDS_PHYSICAL(i915)	(DISPLAY_INFO(i915)->overlay_needs_physical)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b485ec320085..4a8638502d04 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4127,6 +4127,32 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
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
+	sdp->db[0] = as_sdp->mode;
+	sdp->db[1] = as_sdp->vtotal & 0xFF;
+	sdp->db[2] = (as_sdp->vtotal >> 8) & 0xFF;
+	sdp->db[3] = as_sdp->target_rr & 0xFF;
+	sdp->db[4] = (as_sdp->target_rr >> 8) & 0x3;
+
+	return length;
+}
+
 static ssize_t
 intel_dp_hdr_metadata_infoframe_sdp_pack(struct drm_i915_private *i915,
 					 const struct hdmi_drm_infoframe *drm_infoframe,
@@ -4226,6 +4252,10 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
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
@@ -4247,6 +4277,10 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
 	u32 dip_enable = VIDEO_DIP_ENABLE_AVI_HSW | VIDEO_DIP_ENABLE_GCP_HSW |
 			 VIDEO_DIP_ENABLE_VS_HSW | VIDEO_DIP_ENABLE_GMP_HSW |
 			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK;
+
+	if (HAS_AS_SDP(dev_priv))
+		dip_enable |= VIDEO_DIP_ENABLE_AS_ADL;
+
 	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
 
 	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
@@ -4268,6 +4302,37 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
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
+	as_sdp->length = sdp->sdp_header.HB3 & DP_ADAPTIVE_SYNC_SDP_LENGTH;
+	as_sdp->mode = sdp->db[0] & DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE;
+	as_sdp->vtotal = (sdp->db[2] << 8) | sdp->db[1];
+	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
+
+	return 0;
+}
+
 static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
 				   const void *buffer, size_t size)
 {
@@ -4338,6 +4403,29 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
 	return 0;
 }
 
+static void
+intel_read_dp_as_sdp(struct intel_encoder *encoder,
+		     struct intel_crtc_state *crtc_state,
+		     struct drm_dp_as_sdp *as_sdp)
+{
+	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	unsigned int type = DP_SDP_ADAPTIVE_SYNC;
+	struct dp_sdp sdp = {};
+	int ret;
+
+	if ((crtc_state->infoframes.enable &
+	     intel_hdmi_infoframe_enable(type)) == 0)
+		return;
+
+	dig_port->read_infoframe(encoder, crtc_state, type, &sdp,
+				 sizeof(sdp));
+
+	ret = intel_dp_as_sdp_unpack(as_sdp, &sdp, sizeof(sdp));
+	if (ret)
+		drm_dbg_kms(&dev_priv->drm, "Failed to unpack DP AS SDP\n");
+}
+
 static int
 intel_dp_hdr_metadata_infoframe_sdp_unpack(struct hdmi_drm_infoframe *drm_infoframe,
 					   const void *buffer, size_t size)
@@ -4444,6 +4532,10 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
 		intel_read_dp_hdr_metadata_infoframe_sdp(encoder, crtc_state,
 							 &crtc_state->infoframes.drm.drm);
 		break;
+	case DP_SDP_ADAPTIVE_SYNC:
+		intel_read_dp_as_sdp(encoder, crtc_state,
+				     &crtc_state->infoframes.as_sdp);
+		break;
 	default:
 		MISSING_CASE(type);
 		break;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 90d2236fede3..18c35dd43ecb 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -114,6 +114,8 @@ static u32 g4x_infoframe_enable(unsigned int type)
 		return VIDEO_DIP_ENABLE_GAMUT;
 	case DP_SDP_VSC:
 		return 0;
+	case DP_SDP_ADAPTIVE_SYNC:
+		return 0;
 	case HDMI_INFOFRAME_TYPE_AVI:
 		return VIDEO_DIP_ENABLE_AVI;
 	case HDMI_INFOFRAME_TYPE_SPD:
@@ -137,6 +139,8 @@ static u32 hsw_infoframe_enable(unsigned int type)
 		return VIDEO_DIP_ENABLE_GMP_HSW;
 	case DP_SDP_VSC:
 		return VIDEO_DIP_ENABLE_VSC_HSW;
+	case DP_SDP_ADAPTIVE_SYNC:
+		return VIDEO_DIP_ENABLE_AS_ADL;
 	case DP_SDP_PPS:
 		return VDIP_ENABLE_PPS;
 	case HDMI_INFOFRAME_TYPE_AVI:
@@ -164,6 +168,8 @@ hsw_dip_data_reg(struct drm_i915_private *dev_priv,
 		return HSW_TVIDEO_DIP_GMP_DATA(cpu_transcoder, i);
 	case DP_SDP_VSC:
 		return HSW_TVIDEO_DIP_VSC_DATA(cpu_transcoder, i);
+	case DP_SDP_ADAPTIVE_SYNC:
+		return ADL_TVIDEO_DIP_AS_SDP_DATA(cpu_transcoder, i);
 	case DP_SDP_PPS:
 		return ICL_VIDEO_DIP_PPS_DATA(cpu_transcoder, i);
 	case HDMI_INFOFRAME_TYPE_AVI:
@@ -186,6 +192,8 @@ static int hsw_dip_data_size(struct drm_i915_private *dev_priv,
 	switch (type) {
 	case DP_SDP_VSC:
 		return VIDEO_DIP_VSC_DATA_SIZE;
+	case DP_SDP_ADAPTIVE_SYNC:
+		return VIDEO_DIP_ASYNC_DATA_SIZE;
 	case DP_SDP_PPS:
 		return VIDEO_DIP_PPS_DATA_SIZE;
 	case HDMI_PACKET_TYPE_GAMUT_METADATA:
@@ -563,6 +571,9 @@ static u32 hsw_infoframes_enabled(struct intel_encoder *encoder,
 	if (DISPLAY_VER(dev_priv) >= 10)
 		mask |= VIDEO_DIP_ENABLE_DRM_GLK;
 
+	if (HAS_AS_SDP(dev_priv))
+		mask |= VIDEO_DIP_ENABLE_AS_ADL;
+
 	return val & mask;
 }
 
@@ -570,6 +581,7 @@ static const u8 infoframe_type_to_idx[] = {
 	HDMI_PACKET_TYPE_GENERAL_CONTROL,
 	HDMI_PACKET_TYPE_GAMUT_METADATA,
 	DP_SDP_VSC,
+	DP_SDP_ADAPTIVE_SYNC,
 	HDMI_INFOFRAME_TYPE_AVI,
 	HDMI_INFOFRAME_TYPE_SPD,
 	HDMI_INFOFRAME_TYPE_VENDOR,
@@ -1212,7 +1224,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
 	val &= ~(VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
 		 VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
 		 VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
-		 VIDEO_DIP_ENABLE_DRM_GLK);
+		 VIDEO_DIP_ENABLE_DRM_GLK | VIDEO_DIP_ENABLE_AS_ADL);
 
 	if (!enable) {
 		intel_de_write(dev_priv, reg, val);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e00557e1a57f..dce276236707 100644
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
+#define   VIDEO_DIP_ENABLE_AS_ADL	REG_BIT(23)
 
 /* Panel fitting */
 #define PFIT_CONTROL	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61230)
@@ -5040,6 +5043,7 @@
 #define _HSW_VIDEO_DIP_SPD_DATA_A	0x602A0
 #define _HSW_VIDEO_DIP_GMP_DATA_A	0x602E0
 #define _HSW_VIDEO_DIP_VSC_DATA_A	0x60320
+#define	_ADL_VIDEO_DIP_AS_DATA_A	0x60484
 #define _GLK_VIDEO_DIP_DRM_DATA_A	0x60440
 #define _HSW_VIDEO_DIP_AVI_ECC_A	0x60240
 #define _HSW_VIDEO_DIP_VS_ECC_A		0x60280
@@ -5054,6 +5058,7 @@
 #define _HSW_VIDEO_DIP_SPD_DATA_B	0x612A0
 #define _HSW_VIDEO_DIP_GMP_DATA_B	0x612E0
 #define _HSW_VIDEO_DIP_VSC_DATA_B	0x61320
+#define _ADL_VIDEO_DIP_AS_DATA_B	0x61484
 #define _GLK_VIDEO_DIP_DRM_DATA_B	0x61440
 #define _HSW_VIDEO_DIP_BVI_ECC_B	0x61240
 #define _HSW_VIDEO_DIP_VS_ECC_B		0x61280
@@ -5083,6 +5088,9 @@
 #define GLK_TVIDEO_DIP_DRM_DATA(trans, i)	_MMIO_TRANS2(trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)
 #define ICL_VIDEO_DIP_PPS_DATA(trans, i)	_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)
 #define ICL_VIDEO_DIP_PPS_ECC(trans, i)		_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)
+/*ADLP and later: */
+#define ADL_TVIDEO_DIP_AS_SDP_DATA(trans, i)	_MMIO_TRANS2(trans,\
+							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
 
 #define _HSW_STEREO_3D_CTL_A		0x70020
 #define   S3D_ENABLE			(1 << 31)
-- 
2.25.1

