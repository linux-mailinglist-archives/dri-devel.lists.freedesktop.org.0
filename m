Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C621381E31B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 01:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC30D10E1A8;
	Tue, 26 Dec 2023 00:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7EB10E19F;
 Tue, 26 Dec 2023 00:21:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 257C2B80B68;
 Tue, 26 Dec 2023 00:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A56AC433C7;
 Tue, 26 Dec 2023 00:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703550114;
 bh=cv4WUXIqphIpmOPoJxccd5/RtHTWdT2jtGutA6Lu+6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GaLytztLBzAXztXQmz+XBDR2PEvGoPH+Jq2oPG15mp0BtqFYlcXb1xY8gg50SA1JJ
 HrXh5LiMp2mDtYo194b1qmCy0jcRMpuyf3NSvUOa1L+sPd2Vb3KuuEp14rKfS0RcrT
 W0vn8Pn05EwAlCduzCzIk5FYDIKMlObYRjFQIFinpG58rj85eY6bE/Hr8SDlDvNiB2
 xEIHi6XdItqn6MTyohT/g2raQ5a32UY691SeOrvZQ4QLPPoRFz11CQRx4mE55gvnBc
 pUQzfWvAR97pvthaZAOhW1RUxhrltKSCZhqnTFvgJe3KAMVc+GircLtOT5IRCRfF4y
 Y272Mpk3wkzuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 34/39] drm/amd/display: get dprefclk ss info from
 integration info table
Date: Mon, 25 Dec 2023 19:19:24 -0500
Message-ID: <20231226002021.4776-34-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002021.4776-1-sashal@kernel.org>
References: <20231226002021.4776-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.8
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
 sunran001@208suo.com, sunpeng.li@amd.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 tony.tascioglu@amd.com, drv@mailo.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 alvin.lee2@amd.com, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
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
index 484d62bcf2c2e..518c5672d3848 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -1015,13 +1015,20 @@ static enum bp_result get_ss_info_v4_5(
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
@@ -2826,6 +2833,8 @@ static enum bp_result get_integrated_info_v2_2(
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

