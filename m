Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB7283671D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691AB10F2BD;
	Mon, 22 Jan 2024 15:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6129110F2BD;
 Mon, 22 Jan 2024 15:11:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCB6F6115A;
 Mon, 22 Jan 2024 15:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE40C43390;
 Mon, 22 Jan 2024 15:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936283;
 bh=PP7MnsU8r66tscKqn/gDwHVvvt4DQEWEcE/k6anhdSg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bf6d/CG3c/XATGFHzSzw6KsO9IcGVB2svprsKe0tybztvYUg8qESdt/w/AyN8+Yrl
 Dve1cukW7MDSa4ORtCYav9mkV1htGZFiYb0xPr4dtUKVFleNwMLkynolxrwDWd5CTd
 RTBpUh5I873MHcTaRfaMxJA8PqauXATVmVruBaSxWsrmaBlddYX4f+XMBTgBymieMX
 fz4naPwlcJFi2BiHvUzZSfzHOu0rockmfu+kw/quuVYQ4k6dSIYg3pi3cMNlOxn835
 7+5dFt7VWbFxGSUu14rvdolYtuCFMn5zhgBrm8xxD/NQEIBOcuTYtWIWOmheaSEEjB
 9Qun6hSDKBejw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 35/53] drm/amd/display: For prefetch mode > 0,
 extend prefetch if possible
Date: Mon, 22 Jan 2024 10:08:36 -0500
Message-ID: <20240122150949.994249-35-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150949.994249-1-sashal@kernel.org>
References: <20240122150949.994249-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.74
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
 nevenko.stupar@amd.com, Alvin Lee <alvin.lee2@amd.com>, Ilya.Bakoulin@amd.com,
 srinivasan.shanmugam@amd.com, sunpeng.li@amd.com, hanghong.ma@amd.com,
 Dillon.Varone@amd.com, drv@mailo.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
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
index 19f55657272e..cc8c1a48c5c4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -810,6 +810,8 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 					(v->DRAMSpeedPerState[mode_lib->vba.VoltageLevel] <= MEM_STROBE_FREQ_MHZ ||
 						v->DCFCLKPerState[mode_lib->vba.VoltageLevel] <= DCFCLK_FREQ_EXTRA_PREFETCH_REQ_MHZ) ?
 							mode_lib->vba.ip.min_prefetch_in_strobe_us : 0,
+					mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb] > 0 || mode_lib->vba.DRAMClockChangeRequirementFinal == false,
+
 					/* Output */
 					&v->DSTXAfterScaler[k],
 					&v->DSTYAfterScaler[k],
@@ -3291,6 +3293,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							v->SwathHeightCThisState[k], v->TWait,
 							(v->DRAMSpeedPerState[i] <= MEM_STROBE_FREQ_MHZ || v->DCFCLKState[i][j] <= DCFCLK_FREQ_EXTRA_PREFETCH_REQ_MHZ) ?
 									mode_lib->vba.ip.min_prefetch_in_strobe_us : 0,
+							mode_lib->vba.PrefetchModePerState[i][j] > 0 || mode_lib->vba.DRAMClockChangeRequirementFinal == false,
 
 							/* Output */
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTXAfterScaler[k],
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 23e4be2ad63f..7f4fc49be35c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -3418,6 +3418,7 @@ bool dml32_CalculatePrefetchSchedule(
 		unsigned int SwathHeightC,
 		double TWait,
 		double TPreReq,
+		bool ExtendPrefetchIfPossible,
 		/* Output */
 		double   *DSTXAfterScaler,
 		double   *DSTYAfterScaler,
@@ -3887,12 +3888,32 @@ bool dml32_CalculatePrefetchSchedule(
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
index 779c6805f599..1823434d8ede 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
@@ -744,6 +744,7 @@ bool dml32_CalculatePrefetchSchedule(
 		unsigned int SwathHeightC,
 		double TWait,
 		double TPreReq,
+		bool ExtendPrefetchIfPossible,
 		/* Output */
 		double   *DSTXAfterScaler,
 		double   *DSTYAfterScaler,
-- 
2.43.0

