Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A761AAA1A3
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969EA10E556;
	Mon,  5 May 2025 22:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UFkrQQhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0246610E555;
 Mon,  5 May 2025 22:50:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1E08B44033;
 Mon,  5 May 2025 22:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F33C4CEEF;
 Mon,  5 May 2025 22:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485402;
 bh=8SkChgjml+C5Zs0exWuTkkscnvyM/uWVZbm6XtSx5SE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UFkrQQhA6H2n4LOT9ZgexbTbyzmj1W/27IEEpk1aU5AgqpRX8cTlc8oYPKd8jp+UR
 3EsSNGZoaa2SnzPK4sa4hNoHyuSTyeggqsR1qpf/Rg483CTSyAj/912XtgrN/v7O5C
 8Kcezw87fetYW7V3+mwoY8byRLLlUcmQv4b3EiQeyA9iDd+yjYCee/JwsN1hUuwKTm
 zhnwdHKjoTTM84DORkUsTDvNXG2WAXfG8H98DquHCJI82RmPhSz4H9pLtSmkiNHHTs
 zqynfe7prbkUozd6Lkim4imJvM5pJCu/LN+//v7WaG2KfiDuEegdPEBzV4hksyBAt/
 ARlIoEZwl9+hQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, Roman Li <roman.li@amd.com>,
 Robert Mader <robert.mader@collabora.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, mario.limonciello@amd.com,
 alex.hung@amd.com, chiahsuan.chung@amd.com, sunil.khatri@amd.com,
 aurabindo.pillai@amd.com, Yilin.Chen@amd.com, mwen@igalia.com,
 Roman.Li@amd.com, siqueira@igalia.com, jack.chang@amd.com,
 Kun.Liu2@amd.com, Wayne.Lin@amd.com, Dillon.Varone@amd.com,
 alvin.lee2@amd.com, Leo.Zeng@amd.com, Iswara.Nagulendran@amd.com,
 zaeem.mohamed@amd.com, wenjing.liu@amd.com, Samson.Tam@amd.com,
 chris.park@amd.com, PeiChen.Huang@amd.com, peterson.guo@amd.com,
 Yihan.Zhu@amd.com, karthi.kandasamy@amd.com, Jerry.Zuo@amd.com,
 george.shen@amd.com, bpinnint@amd.com, Charlene.Liu@amd.com,
 swapnil.patel@amd.com, dmytro.laktyushkin@amd.com, moadhuri@amd.com,
 martin.leung@amd.com, harikrishna.revalla@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 302/486] drm/amd/display: Fix BT2020 YCbCr
 limited/full range input
Date: Mon,  5 May 2025 18:36:18 -0400
Message-Id: <20250505223922.2682012-302-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Ilya Bakoulin <Ilya.Bakoulin@amd.com>

[ Upstream commit 07bc2dcbcf403d47d6f305ef7f0d3d489491c5fb ]

[Why]
BT2020 YCbCr input is not handled properly when full range
quantization is used and limited range is not supported at all.

[How]
- Add enums for BT2020 YCbCr limited/full range
- Add limited range CSC matrix

Reviewed-by: Krunoslav Kovac <krunoslav.kovac@amd.com>
Signed-off-by: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Robert Mader <robert.mader@collabora.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 6 +++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/basics/dc_common.c           | 3 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c       | 5 +++--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c           | 4 ++--
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h                | 4 +++-
 drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c     | 3 ++-
 .../gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c | 3 ++-
 .../amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c   | 3 ++-
 .../amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c  | 3 ++-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h                 | 6 +++++-
 .../gpu/drm/amd/display/modules/info_packet/info_packet.c   | 4 ++--
 12 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f3cbff8615570..44ea320e4372c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5564,9 +5564,9 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
 	case DRM_COLOR_YCBCR_BT2020:
 		if (full_range)
-			*color_space = COLOR_SPACE_2020_YCBCR;
+			*color_space = COLOR_SPACE_2020_YCBCR_FULL;
 		else
-			return -EINVAL;
+			*color_space = COLOR_SPACE_2020_YCBCR_LIMITED;
 		break;
 
 	default:
@@ -6062,7 +6062,7 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB)
 			color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
 		else
-			color_space = COLOR_SPACE_2020_YCBCR;
+			color_space = COLOR_SPACE_2020_YCBCR_LIMITED;
 		break;
 	case DRM_MODE_COLORIMETRY_DEFAULT: // ITU601
 	default:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 98e88903d07d5..15d94d2a0e2fb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1145,7 +1145,7 @@ static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
 	case COLOR_SPACE_2020_RGB_FULLRANGE:
 		seq_puts(m, "BT2020_RGB");
 		break;
-	case COLOR_SPACE_2020_YCBCR:
+	case COLOR_SPACE_2020_YCBCR_LIMITED:
 		seq_puts(m, "BT2020_YCC");
 		break;
 	default:
diff --git a/drivers/gpu/drm/amd/display/dc/basics/dc_common.c b/drivers/gpu/drm/amd/display/dc/basics/dc_common.c
index b2fc4f8e64825..a51c2701da247 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/dc_common.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/dc_common.c
@@ -40,7 +40,8 @@ bool is_rgb_cspace(enum dc_color_space output_color_space)
 	case COLOR_SPACE_YCBCR709:
 	case COLOR_SPACE_YCBCR601_LIMITED:
 	case COLOR_SPACE_YCBCR709_LIMITED:
-	case COLOR_SPACE_2020_YCBCR:
+	case COLOR_SPACE_2020_YCBCR_LIMITED:
+	case COLOR_SPACE_2020_YCBCR_FULL:
 		return false;
 	default:
 		/* Add a case to switch */
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index ab6ed9dc5f4db..25d125036e8d4 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -176,7 +176,7 @@ static bool is_ycbcr2020_type(
 {
 	bool ret = false;
 
-	if (color_space == COLOR_SPACE_2020_YCBCR)
+	if (color_space == COLOR_SPACE_2020_YCBCR_LIMITED || color_space == COLOR_SPACE_2020_YCBCR_FULL)
 		ret = true;
 	return ret;
 }
@@ -247,7 +247,8 @@ void color_space_to_black_color(
 	case COLOR_SPACE_YCBCR709_BLACK:
 	case COLOR_SPACE_YCBCR601_LIMITED:
 	case COLOR_SPACE_YCBCR709_LIMITED:
-	case COLOR_SPACE_2020_YCBCR:
+	case COLOR_SPACE_2020_YCBCR_LIMITED:
+	case COLOR_SPACE_2020_YCBCR_FULL:
 		*black_color = black_color_format[BLACK_COLOR_FORMAT_YUV_CV];
 		break;
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index bfcbbea377298..6dbf139c51f72 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -4215,7 +4215,7 @@ static void set_avi_info_frame(
 		break;
 	case COLOR_SPACE_2020_RGB_FULLRANGE:
 	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
-	case COLOR_SPACE_2020_YCBCR:
+	case COLOR_SPACE_2020_YCBCR_LIMITED:
 		hdmi_info.bits.EC0_EC2 = COLORIMETRYEX_BT2020RGBYCBCR;
 		hdmi_info.bits.C0_C1   = COLORIMETRY_EXTENDED;
 		break;
@@ -4229,7 +4229,7 @@ static void set_avi_info_frame(
 		break;
 	}
 
-	if (pixel_encoding && color_space == COLOR_SPACE_2020_YCBCR &&
+	if (pixel_encoding && color_space == COLOR_SPACE_2020_YCBCR_LIMITED &&
 			stream->out_transfer_func.tf == TRANSFER_FUNCTION_GAMMA22) {
 		hdmi_info.bits.EC0_EC2 = 0;
 		hdmi_info.bits.C0_C1 = COLORIMETRY_ITU709;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index c10567ec1c819..715af635ca31f 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -641,7 +641,8 @@ enum dc_color_space {
 	COLOR_SPACE_YCBCR709_LIMITED,
 	COLOR_SPACE_2020_RGB_FULLRANGE,
 	COLOR_SPACE_2020_RGB_LIMITEDRANGE,
-	COLOR_SPACE_2020_YCBCR,
+	COLOR_SPACE_2020_YCBCR_LIMITED,
+	COLOR_SPACE_2020_YCBCR_FULL,
 	COLOR_SPACE_ADOBERGB,
 	COLOR_SPACE_DCIP3,
 	COLOR_SPACE_DISPLAYNATIVE,
@@ -649,6 +650,7 @@ enum dc_color_space {
 	COLOR_SPACE_APPCTRL,
 	COLOR_SPACE_CUSTOMPOINTS,
 	COLOR_SPACE_YCBCR709_BLACK,
+	COLOR_SPACE_2020_YCBCR = COLOR_SPACE_2020_YCBCR_LIMITED,
 };
 
 enum dc_dither_option {
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
index 5c2825bc9a876..654b919465f08 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
@@ -420,7 +420,7 @@ static void dce110_stream_encoder_dp_set_stream_attribute(
 			dynamic_range_rgb = 1; /*limited range*/
 			break;
 		case COLOR_SPACE_2020_RGB_FULLRANGE:
-		case COLOR_SPACE_2020_YCBCR:
+		case COLOR_SPACE_2020_YCBCR_LIMITED:
 		case COLOR_SPACE_XR_RGB:
 		case COLOR_SPACE_MSREF_SCRGB:
 		case COLOR_SPACE_ADOBERGB:
@@ -432,6 +432,7 @@ static void dce110_stream_encoder_dp_set_stream_attribute(
 		case COLOR_SPACE_APPCTRL:
 		case COLOR_SPACE_CUSTOMPOINTS:
 		case COLOR_SPACE_UNKNOWN:
+		default:
 			/* do nothing */
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c
index f496e952ceecb..f8f1e98f646e6 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c
@@ -393,7 +393,7 @@ void enc1_stream_encoder_dp_set_stream_attribute(
 		break;
 	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
 	case COLOR_SPACE_2020_RGB_FULLRANGE:
-	case COLOR_SPACE_2020_YCBCR:
+	case COLOR_SPACE_2020_YCBCR_LIMITED:
 	case COLOR_SPACE_XR_RGB:
 	case COLOR_SPACE_MSREF_SCRGB:
 	case COLOR_SPACE_ADOBERGB:
@@ -406,6 +406,7 @@ void enc1_stream_encoder_dp_set_stream_attribute(
 	case COLOR_SPACE_CUSTOMPOINTS:
 	case COLOR_SPACE_UNKNOWN:
 	case COLOR_SPACE_YCBCR709_BLACK:
+	default:
 		/* do nothing */
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
index 0a27e0942a123..0008816cf1553 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
@@ -634,7 +634,7 @@ void enc401_stream_encoder_dp_set_stream_attribute(
 		break;
 	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
 	case COLOR_SPACE_2020_RGB_FULLRANGE:
-	case COLOR_SPACE_2020_YCBCR:
+	case COLOR_SPACE_2020_YCBCR_LIMITED:
 	case COLOR_SPACE_XR_RGB:
 	case COLOR_SPACE_MSREF_SCRGB:
 	case COLOR_SPACE_ADOBERGB:
@@ -647,6 +647,7 @@ void enc401_stream_encoder_dp_set_stream_attribute(
 	case COLOR_SPACE_CUSTOMPOINTS:
 	case COLOR_SPACE_UNKNOWN:
 	case COLOR_SPACE_YCBCR709_BLACK:
+	default:
 		/* do nothing */
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c
index 678db949cfe3c..759b453385c46 100644
--- a/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c
@@ -323,7 +323,7 @@ static void dcn31_hpo_dp_stream_enc_set_stream_attribute(
 		break;
 	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
 	case COLOR_SPACE_2020_RGB_FULLRANGE:
-	case COLOR_SPACE_2020_YCBCR:
+	case COLOR_SPACE_2020_YCBCR_LIMITED:
 	case COLOR_SPACE_XR_RGB:
 	case COLOR_SPACE_MSREF_SCRGB:
 	case COLOR_SPACE_ADOBERGB:
@@ -336,6 +336,7 @@ static void dcn31_hpo_dp_stream_enc_set_stream_attribute(
 	case COLOR_SPACE_CUSTOMPOINTS:
 	case COLOR_SPACE_UNKNOWN:
 	case COLOR_SPACE_YCBCR709_BLACK:
+	default:
 		/* do nothing */
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index 0150f2581ee4c..0c5675d1c5936 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -119,10 +119,14 @@ static const struct dpp_input_csc_matrix __maybe_unused dpp_input_csc_matrix[] =
 		{ 0x39a6, 0x2568, 0,      0xe0d6,
 		  0xeedd, 0x2568, 0xf925, 0x9a8,
 		  0,      0x2568, 0x43ee, 0xdbb2 } },
-	{ COLOR_SPACE_2020_YCBCR,
+	{ COLOR_SPACE_2020_YCBCR_FULL,
 		{ 0x2F30, 0x2000, 0,      0xE869,
 		  0xEDB7, 0x2000, 0xFABC, 0xBC6,
 		  0,      0x2000, 0x3C34, 0xE1E6 } },
+	{ COLOR_SPACE_2020_YCBCR_LIMITED,
+		{ 0x35B9, 0x2543, 0,      0xE2B2,
+		  0xEB2F, 0x2543, 0xFA01, 0x0B1F,
+		  0,      0x2543, 0x4489, 0xDB42 } },
 	{ COLOR_SPACE_2020_RGB_LIMITEDRANGE,
 		{ 0x35E0, 0x255F, 0,      0xE2B3,
 		  0xEB20, 0x255F, 0xF9FD, 0xB1E,
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index a344e2e49b0ea..b3d55cac35694 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -383,10 +383,10 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
 				colorimetryFormat = ColorimetryYCC_DP_ITU709;
 			else if (cs == COLOR_SPACE_ADOBERGB)
 				colorimetryFormat = ColorimetryYCC_DP_AdobeYCC;
-			else if (cs == COLOR_SPACE_2020_YCBCR)
+			else if (cs == COLOR_SPACE_2020_YCBCR_LIMITED)
 				colorimetryFormat = ColorimetryYCC_DP_ITU2020YCbCr;
 
-			if (cs == COLOR_SPACE_2020_YCBCR && tf == TRANSFER_FUNC_GAMMA_22)
+			if (cs == COLOR_SPACE_2020_YCBCR_LIMITED && tf == TRANSFER_FUNC_GAMMA_22)
 				colorimetryFormat = ColorimetryYCC_DP_ITU709;
 			break;
 
-- 
2.39.5

