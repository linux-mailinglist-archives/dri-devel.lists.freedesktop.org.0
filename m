Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF6B836620
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 15:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47B010F29A;
	Mon, 22 Jan 2024 14:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFA510F29A;
 Mon, 22 Jan 2024 14:59:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 469C4CE0FFA;
 Mon, 22 Jan 2024 14:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F789C433A6;
 Mon, 22 Jan 2024 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935535;
 bh=J4gnxmlNZ29w29C4bJtmdBIP4o2ilD5vWDtLcyXP7Nc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KUBcj199z7irO5LlkILc5NHSK5LtXaz5zptpJKoAwArAPL1D/prmkdfBdXB0etPTo
 0vxWgQhBE2LuE8k8gxQ2DqM5UQlWQjbS7CgAS81nxdPdjdnRDDsNN2ErKjTgokh9if
 P+aledEX+S3qCS35LAsGY2Y98YRbtKqRq3IWisKgQSb6mnu6FojLT7F0F1JTVWYeoX
 dSOEdh0TRY/+zqna/ryZKmB1YLRv62/4l0lDBBVBaf/W+blm8ejnpJYXFdicX6DdtE
 QLWzYG8MwghxrHnts1NI94OvO+0KfzLvjX8sm37sULhoOQYeQe+0zBOF8d5GBUPGdF
 XvHRocipLvNBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 50/88] drm/amd/display: For prefetch mode > 0,
 extend prefetch if possible
Date: Mon, 22 Jan 2024 09:51:23 -0500
Message-ID: <20240122145608.990137-50-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: wenjing.liu@amd.com, dri-devel@lists.freedesktop.org,
 Jun Lei <jun.lei@amd.com>, airlied@gmail.com, Paul.Hsieh@amd.com,
 Sasha Levin <sashal@kernel.org>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 nevenko.stupar@amd.com, Alvin Lee <alvin.lee2@amd.com>, meera.patel@amd.com,
 Ilya.Bakoulin@amd.com, srinivasan.shanmugam@amd.com, sunpeng.li@amd.com,
 hanghong.ma@amd.com, Dillon.Varone@amd.com, drv@mailo.com,
 qingqing.zhuo@amd.com, Xinhui.Pan@amd.com, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <alvin.lee2@amd.com>

[ Upstream commit dd4e4bb28843393065eed279e869fac248d03f0f ]

[Description]
For mode programming we want to extend the prefetch as much as possible
(up to oto, or as long as we can for equ) if we're not already applying
the 60us prefetch requirement. This is to avoid intermittent underflow
issues during prefetch.

The prefetch extension is applied under the following scenarios:
1. We're in prefetch mode 1 (i.e. we don't support MCLK switch in blank)
2. We're using subvp or drr methods of p-state switch, in which case we
   we don't care if prefetch takes up more of the blanking time

Mode programming typically chooses the smallest prefetch time possible
(i.e. highest bandwidth during prefetch) presumably to create margin between
p-states / c-states that happen in vblank and prefetch. Therefore we only
apply this prefetch extension when p-state in vblank is not required (UCLK
p-states take up the most vblank time).

Reviewed-by: Jun Lei <jun.lei@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/dml/dcn32/display_mode_vba_32.c        |  3 ++
 .../dc/dml/dcn32/display_mode_vba_util_32.c   | 33 +++++++++++++++----
 .../dc/dml/dcn32/display_mode_vba_util_32.h   |  1 +
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index cbdfb762c10c..6c84b0fa40f4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -813,6 +813,8 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 					(v->DRAMSpeedPerState[mode_lib->vba.VoltageLevel] <= MEM_STROBE_FREQ_MHZ ||
 						v->DCFCLKPerState[mode_lib->vba.VoltageLevel] <= DCFCLK_FREQ_EXTRA_PREFETCH_REQ_MHZ) ?
 							mode_lib->vba.ip.min_prefetch_in_strobe_us : 0,
+					mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb] > 0 || mode_lib->vba.DRAMClockChangeRequirementFinal == false,
+
 					/* Output */
 					&v->DSTXAfterScaler[k],
 					&v->DSTYAfterScaler[k],
@@ -3317,6 +3319,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							v->SwathHeightCThisState[k], v->TWait,
 							(v->DRAMSpeedPerState[i] <= MEM_STROBE_FREQ_MHZ || v->DCFCLKState[i][j] <= DCFCLK_FREQ_EXTRA_PREFETCH_REQ_MHZ) ?
 									mode_lib->vba.ip.min_prefetch_in_strobe_us : 0,
+							mode_lib->vba.PrefetchModePerState[i][j] > 0 || mode_lib->vba.DRAMClockChangeRequirementFinal == false,
 
 							/* Output */
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTXAfterScaler[k],
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index d940dfa5ae43..80fccd4999a5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -3423,6 +3423,7 @@ bool dml32_CalculatePrefetchSchedule(
 		unsigned int SwathHeightC,
 		double TWait,
 		double TPreReq,
+		bool ExtendPrefetchIfPossible,
 		/* Output */
 		double   *DSTXAfterScaler,
 		double   *DSTYAfterScaler,
@@ -3892,12 +3893,32 @@ bool dml32_CalculatePrefetchSchedule(
 			/* Clamp to oto for bandwidth calculation */
 			LinesForPrefetchBandwidth = dst_y_prefetch_oto;
 		} else {
-			*DestinationLinesForPrefetch = dst_y_prefetch_equ;
-			TimeForFetchingMetaPTE = Tvm_equ;
-			TimeForFetchingRowInVBlank = Tr0_equ;
-			*PrefetchBandwidth = prefetch_bw_equ;
-			/* Clamp to equ for bandwidth calculation */
-			LinesForPrefetchBandwidth = dst_y_prefetch_equ;
+			/* For mode programming we want to extend the prefetch as much as possible
+			 * (up to oto, or as long as we can for equ) if we're not already applying
+			 * the 60us prefetch requirement. This is to avoid intermittent underflow
+			 * issues during prefetch.
+			 *
+			 * The prefetch extension is applied under the following scenarios:
+			 * 1. We're in prefetch mode > 0 (i.e. we don't support MCLK switch in blank)
+			 * 2. We're using subvp or drr methods of p-state switch, in which case we
+			 *    we don't care if prefetch takes up more of the blanking time
+			 *
+			 * Mode programming typically chooses the smallest prefetch time possible
+			 * (i.e. highest bandwidth during prefetch) presumably to create margin between
+			 * p-states / c-states that happen in vblank and prefetch. Therefore we only
+			 * apply this prefetch extension when p-state in vblank is not required (UCLK
+			 * p-states take up the most vblank time).
+			 */
+			if (ExtendPrefetchIfPossible && TPreReq == 0 && VStartup < MaxVStartup) {
+				MyError = true;
+			} else {
+				*DestinationLinesForPrefetch = dst_y_prefetch_equ;
+				TimeForFetchingMetaPTE = Tvm_equ;
+				TimeForFetchingRowInVBlank = Tr0_equ;
+				*PrefetchBandwidth = prefetch_bw_equ;
+				/* Clamp to equ for bandwidth calculation */
+				LinesForPrefetchBandwidth = dst_y_prefetch_equ;
+			}
 		}
 
 		*DestinationLinesToRequestVMInVBlank = dml_ceil(4.0 * TimeForFetchingMetaPTE / LineTime, 1.0) / 4.0;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
index 592d174df6c6..5d34735df83d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
@@ -747,6 +747,7 @@ bool dml32_CalculatePrefetchSchedule(
 		unsigned int SwathHeightC,
 		double TWait,
 		double TPreReq,
+		bool ExtendPrefetchIfPossible,
 		/* Output */
 		double   *DSTXAfterScaler,
 		double   *DSTYAfterScaler,
-- 
2.43.0

