Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F34181E32F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 01:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C4C10E1A3;
	Tue, 26 Dec 2023 00:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD0F10E1A3;
 Tue, 26 Dec 2023 00:23:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9844660C86;
 Tue, 26 Dec 2023 00:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0E3C433C8;
 Tue, 26 Dec 2023 00:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703550234;
 bh=V9LLZOKMYg2cApF+yQE2TATMfBerVgJKTtP4pZS5U0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K3uHcbwFKiuxL1Xr33wSYGdsDx3+XIrUr72+nclapr+B0PvgKfqvparD0rwIMdoxi
 Fc1FTLL0LIM9PHbgvg6CoYQ8tAkJwWdAcXAr5mjCt+4OCT6yKBFpgJe88C70vv53A8
 8OMpqim2qYDti0mkBu/B2gOWqYIuIKfuTLOSxfqcPdJfV01hl4deQCodhqUCH5CQnT
 aCxuRC2O+IvRAsLFDAGhOrYyD8RKR2YZQqKXeHpdSNNisZVLinyVoGIMAsdsLRsX9T
 yREj+2nTVQtV25G+cOTalq890c82NTpfWvWfE58GQb3J/Ir4vX/ym3GjlOD/zvc3b1
 9WgD9IJlNwoPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 20/24] drm/amd/display: get dprefclk ss info from
 integration info table
Date: Mon, 25 Dec 2023 19:22:13 -0500
Message-ID: <20231226002255.5730-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002255.5730-1-sashal@kernel.org>
References: <20231226002255.5730-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.69
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <charlene.liu@amd.com>,
 sunran001@208suo.com, felipe.clark@amd.com, sunpeng.li@amd.com,
 airlied@gmail.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, tony.tascioglu@amd.com, drv@mailo.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, alvin.lee2@amd.com,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Charlene Liu <charlene.liu@amd.com>

[ Upstream commit 51e7b64690776a9981355428b537af9048308a95 ]

[why & how]
we have two SSC_En:
we get ssc_info from dce_info for MPLL_SSC_EN.
we used to call VBIOS cmdtbl's smu_info's SS persentage for DPRECLK SS info,
is used for DP AUDIO and VBIOS' smu_info table was from systemIntegrationInfoTable.

since dcn35 VBIOS removed smu_info, driver need to use integrationInfotable directly.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Charlene Liu <charlene.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/bios/bios_parser2.c    | 19 ++++++++++++++-----
 .../display/include/grph_object_ctrl_defs.h   |  2 ++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index e507d2e1410b7..93e40e0a15087 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -1018,13 +1018,20 @@ static enum bp_result get_ss_info_v4_5(
 		DC_LOG_BIOS("AS_SIGNAL_TYPE_HDMI ss_percentage: %d\n", ss_info->spread_spectrum_percentage);
 		break;
 	case AS_SIGNAL_TYPE_DISPLAY_PORT:
-		ss_info->spread_spectrum_percentage =
+		if (bp->base.integrated_info) {
+			DC_LOG_BIOS("gpuclk_ss_percentage (unit of 0.001 percent): %d\n", bp->base.integrated_info->gpuclk_ss_percentage);
+			ss_info->spread_spectrum_percentage =
+					bp->base.integrated_info->gpuclk_ss_percentage;
+			ss_info->type.CENTER_MODE =
+					bp->base.integrated_info->gpuclk_ss_type;
+		} else {
+			ss_info->spread_spectrum_percentage =
 				disp_cntl_tbl->dp_ss_percentage;
-		ss_info->spread_spectrum_range =
+			ss_info->spread_spectrum_range =
 				disp_cntl_tbl->dp_ss_rate_10hz * 10;
-		if (disp_cntl_tbl->dp_ss_mode & ATOM_SS_CENTRE_SPREAD_MODE)
-			ss_info->type.CENTER_MODE = true;
-
+			if (disp_cntl_tbl->dp_ss_mode & ATOM_SS_CENTRE_SPREAD_MODE)
+				ss_info->type.CENTER_MODE = true;
+		}
 		DC_LOG_BIOS("AS_SIGNAL_TYPE_DISPLAY_PORT ss_percentage: %d\n", ss_info->spread_spectrum_percentage);
 		break;
 	case AS_SIGNAL_TYPE_GPU_PLL:
@@ -2830,6 +2837,8 @@ static enum bp_result get_integrated_info_v2_2(
 	info->ma_channel_number = info_v2_2->umachannelnumber;
 	info->dp_ss_control =
 		le16_to_cpu(info_v2_2->reserved1);
+	info->gpuclk_ss_percentage = info_v2_2->gpuclk_ss_percentage;
+	info->gpuclk_ss_type = info_v2_2->gpuclk_ss_type;
 
 	for (i = 0; i < NUMBER_OF_UCHAR_FOR_GUID; ++i) {
 		info->ext_disp_conn_info.gu_id[i] =
diff --git a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
index bc96d02113608..813463ffe15c5 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
@@ -417,6 +417,8 @@ struct integrated_info {
 	/* V2.1 */
 	struct edp_info edp1_info;
 	struct edp_info edp2_info;
+	uint32_t gpuclk_ss_percentage;
+	uint32_t gpuclk_ss_type;
 };
 
 /*
-- 
2.43.0

