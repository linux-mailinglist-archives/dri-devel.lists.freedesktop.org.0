Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC90CBA84C
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 11:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6A210E3D5;
	Sat, 13 Dec 2025 10:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P9OJE7nN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513E110E3D4;
 Sat, 13 Dec 2025 10:58:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 32F4344265;
 Sat, 13 Dec 2025 10:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281E2C4CEFB;
 Sat, 13 Dec 2025 10:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765623515;
 bh=nDu2L4kTOY9IYvqrJ2s+SxSpZYg/Q8pM8WE6/jWuIRg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=P9OJE7nNfGN04a8qccHoJT6FIBKQjcPND/MdS4x54QKkiaKOhtbMF9wzw589R5KAW
 YE0+YO7DCsU1/M5k822xRRJt76PoGsqHx9jmjZRjfvzL1SXizc/po/DoYIvdGsNyHm
 C1er3sPSfWO8uK/evxcq4K5ipd6tzByhWCiO7cWakZcwx0srpcZCJYd7sxZRWVEmoZ
 mZ7Kh8i4ForuKOvfvyT+V8be8PPFzZvjeZoyl5eTNbwYKggwNVnTahmE7CfN6R6aNV
 +U41zj9kSMy15mb/o8cRspBD9XexVqJGhBAwdmx24oA9cl0IYhAa4DejyFaBf0wxT0
 ZFghRFqCFBRFA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 13 Dec 2025 19:58:11 +0900
Subject: [PATCH 2/2] drm/amd/display: Reduce number of arguments of dcn30's
 CalculateWatermarksAndDRAMSpeedChangeSupport()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-dml-dcn30-avoid-clang-frame-larger-than-v1-2-dd3d74b76a17@kernel.org>
References: <20251213-dml-dcn30-avoid-clang-frame-larger-than-v1-0-dd3d74b76a17@kernel.org>
In-Reply-To: <20251213-dml-dcn30-avoid-clang-frame-larger-than-v1-0-dd3d74b76a17@kernel.org>
To: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=22720; i=nathan@kernel.org;
 h=from:subject:message-id; bh=nDu2L4kTOY9IYvqrJ2s+SxSpZYg/Q8pM8WE6/jWuIRg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJm2bhcOuBxUn1l6cuU+Fa2lQSoLjjne1Vvg83Lm65uib
 o901mpf7ChlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATaX3DyNBgKi02+YNVP4vP
 5iWqAqqrxeeJ3xYvrc1oY3p3V/1Ifj/D/xzrm4Wf991Uaj2bdDZuv3GRvmkOS6HczAs/RVbz7Jt
 mzwwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

CalculateWatermarksAndDRAMSpeedChangeSupport() has a large number of
parameters, which must be passed on the stack. Most of the parameters
between the two callsites are the same, so they can be accessed through
the existing mode_lib pointer, instead of being passed as explicit
arguments. Doing this reduces the stack size of
dml30_ModeSupportAndSystemConfigurationFull() from 1912 bytes to 1840
bytes building for x86_64 with clang-22, helping stay under the 2048
byte limit for display_mode_vba_30.c.

Additionally, now that there is a pointer to mode_lib->vba available,
use 'v' consistently throughout the entire function.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c | 287 +++++----------------
 1 file changed, 66 insertions(+), 221 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 2d19bb8de59c..1df3412be346 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -265,62 +265,23 @@ static void CalculateDynamicMetadataParameters(
 static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		struct display_mode_lib *mode_lib,
 		unsigned int PrefetchMode,
-		unsigned int NumberOfActivePlanes,
-		unsigned int MaxLineBufferLines,
-		unsigned int LineBufferSize,
-		unsigned int DPPOutputBufferPixels,
-		unsigned int DETBufferSizeInKByte,
-		unsigned int WritebackInterfaceBufferSize,
 		double DCFCLK,
 		double ReturnBW,
-		bool GPUVMEnable,
-		unsigned int dpte_group_bytes[],
-		unsigned int MetaChunkSize,
 		double UrgentLatency,
 		double ExtraLatency,
-		double WritebackLatency,
-		double WritebackChunkSize,
 		double SOCCLK,
-		double DRAMClockChangeLatency,
-		double SRExitTime,
-		double SREnterPlusExitTime,
 		double DCFCLKDeepSleep,
 		unsigned int DPPPerPlane[],
-		bool DCCEnable[],
 		double DPPCLK[],
 		unsigned int DETBufferSizeY[],
 		unsigned int DETBufferSizeC[],
 		unsigned int SwathHeightY[],
 		unsigned int SwathHeightC[],
-		unsigned int LBBitPerPixel[],
 		double SwathWidthY[],
 		double SwathWidthC[],
-		double HRatio[],
-		double HRatioChroma[],
-		unsigned int vtaps[],
-		unsigned int VTAPsChroma[],
-		double VRatio[],
-		double VRatioChroma[],
-		unsigned int HTotal[],
-		double PixelClock[],
-		unsigned int BlendingAndTiming[],
 		double BytePerPixelDETY[],
 		double BytePerPixelDETC[],
-		double DSTXAfterScaler[],
-		double DSTYAfterScaler[],
-		bool WritebackEnable[],
-		enum source_format_class WritebackPixelFormat[],
-		double WritebackDestinationWidth[],
-		double WritebackDestinationHeight[],
-		double WritebackSourceHeight[],
-		enum clock_change_support *DRAMClockChangeSupport,
-		double *UrgentWatermark,
-		double *WritebackUrgentWatermark,
-		double *DRAMClockChangeWatermark,
-		double *WritebackDRAMClockChangeWatermark,
-		double *StutterExitWatermark,
-		double *StutterEnterPlusExitWatermark,
-		double *MinActiveDRAMClockChangeLatencySupported);
+		enum clock_change_support *DRAMClockChangeSupport);
 static void CalculateDCFCLKDeepSleep(
 		struct display_mode_lib *mode_lib,
 		unsigned int NumberOfActivePlanes,
@@ -2646,62 +2607,23 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 		CalculateWatermarksAndDRAMSpeedChangeSupport(
 			mode_lib,
 			PrefetchMode,
-			v->NumberOfActivePlanes,
-			v->MaxLineBufferLines,
-			v->LineBufferSize,
-			v->DPPOutputBufferPixels,
-			v->DETBufferSizeInKByte[0],
-			v->WritebackInterfaceBufferSize,
 			v->DCFCLK,
 			v->ReturnBW,
-			v->GPUVMEnable,
-			v->dpte_group_bytes,
-			v->MetaChunkSize,
 			v->UrgentLatency,
 			v->UrgentExtraLatency,
-			v->WritebackLatency,
-			v->WritebackChunkSize,
 			v->SOCCLK,
-			v->FinalDRAMClockChangeLatency,
-			v->SRExitTime,
-			v->SREnterPlusExitTime,
 			v->DCFCLKDeepSleep,
 			v->DPPPerPlane,
-			v->DCCEnable,
 			v->DPPCLK,
 			v->DETBufferSizeY,
 			v->DETBufferSizeC,
 			v->SwathHeightY,
 			v->SwathHeightC,
-			v->LBBitPerPixel,
 			v->SwathWidthY,
 			v->SwathWidthC,
-			v->HRatio,
-			v->HRatioChroma,
-			v->vtaps,
-			v->VTAPsChroma,
-			v->VRatio,
-			v->VRatioChroma,
-			v->HTotal,
-			v->PixelClock,
-			v->BlendingAndTiming,
 			v->BytePerPixelDETY,
 			v->BytePerPixelDETC,
-			v->DSTXAfterScaler,
-			v->DSTYAfterScaler,
-			v->WritebackEnable,
-			v->WritebackPixelFormat,
-			v->WritebackDestinationWidth,
-			v->WritebackDestinationHeight,
-			v->WritebackSourceHeight,
-			&DRAMClockChangeSupport,
-			&v->UrgentWatermark,
-			&v->WritebackUrgentWatermark,
-			&v->DRAMClockChangeWatermark,
-			&v->WritebackDRAMClockChangeWatermark,
-			&v->StutterExitWatermark,
-			&v->StutterEnterPlusExitWatermark,
-			&v->MinActiveDRAMClockChangeLatencySupported);
+			&DRAMClockChangeSupport);
 
 		for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 			if (v->WritebackEnable[k] == true) {
@@ -4895,62 +4817,23 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			CalculateWatermarksAndDRAMSpeedChangeSupport(
 					mode_lib,
 					v->PrefetchModePerState[i][j],
-					v->NumberOfActivePlanes,
-					v->MaxLineBufferLines,
-					v->LineBufferSize,
-					v->DPPOutputBufferPixels,
-					v->DETBufferSizeInKByte[0],
-					v->WritebackInterfaceBufferSize,
 					v->DCFCLKState[i][j],
 					v->ReturnBWPerState[i][j],
-					v->GPUVMEnable,
-					v->dpte_group_bytes,
-					v->MetaChunkSize,
 					v->UrgLatency[i],
 					v->ExtraLatency,
-					v->WritebackLatency,
-					v->WritebackChunkSize,
 					v->SOCCLKPerState[i],
-					v->FinalDRAMClockChangeLatency,
-					v->SRExitTime,
-					v->SREnterPlusExitTime,
 					v->ProjectedDCFCLKDeepSleep[i][j],
 					v->NoOfDPPThisState,
-					v->DCCEnable,
 					v->RequiredDPPCLKThisState,
 					v->DETBufferSizeYThisState,
 					v->DETBufferSizeCThisState,
 					v->SwathHeightYThisState,
 					v->SwathHeightCThisState,
-					v->LBBitPerPixel,
 					v->SwathWidthYThisState,
 					v->SwathWidthCThisState,
-					v->HRatio,
-					v->HRatioChroma,
-					v->vtaps,
-					v->VTAPsChroma,
-					v->VRatio,
-					v->VRatioChroma,
-					v->HTotal,
-					v->PixelClock,
-					v->BlendingAndTiming,
 					v->BytePerPixelInDETY,
 					v->BytePerPixelInDETC,
-					v->DSTXAfterScaler,
-					v->DSTYAfterScaler,
-					v->WritebackEnable,
-					v->WritebackPixelFormat,
-					v->WritebackDestinationWidth,
-					v->WritebackDestinationHeight,
-					v->WritebackSourceHeight,
-					&v->DRAMClockChangeSupport[i][j],
-					&v->UrgentWatermark,
-					&v->WritebackUrgentWatermark,
-					&v->DRAMClockChangeWatermark,
-					&v->WritebackDRAMClockChangeWatermark,
-					&v->StutterExitWatermark,
-					&v->StutterEnterPlusExitWatermark,
-					&v->MinActiveDRAMClockChangeLatencySupported);
+					&v->DRAMClockChangeSupport[i][j]);
 		}
 	}
 
@@ -5067,63 +4950,25 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		struct display_mode_lib *mode_lib,
 		unsigned int PrefetchMode,
-		unsigned int NumberOfActivePlanes,
-		unsigned int MaxLineBufferLines,
-		unsigned int LineBufferSize,
-		unsigned int DPPOutputBufferPixels,
-		unsigned int DETBufferSizeInKByte,
-		unsigned int WritebackInterfaceBufferSize,
 		double DCFCLK,
 		double ReturnBW,
-		bool GPUVMEnable,
-		unsigned int dpte_group_bytes[],
-		unsigned int MetaChunkSize,
 		double UrgentLatency,
 		double ExtraLatency,
-		double WritebackLatency,
-		double WritebackChunkSize,
 		double SOCCLK,
-		double DRAMClockChangeLatency,
-		double SRExitTime,
-		double SREnterPlusExitTime,
 		double DCFCLKDeepSleep,
 		unsigned int DPPPerPlane[],
-		bool DCCEnable[],
 		double DPPCLK[],
 		unsigned int DETBufferSizeY[],
 		unsigned int DETBufferSizeC[],
 		unsigned int SwathHeightY[],
 		unsigned int SwathHeightC[],
-		unsigned int LBBitPerPixel[],
 		double SwathWidthY[],
 		double SwathWidthC[],
-		double HRatio[],
-		double HRatioChroma[],
-		unsigned int vtaps[],
-		unsigned int VTAPsChroma[],
-		double VRatio[],
-		double VRatioChroma[],
-		unsigned int HTotal[],
-		double PixelClock[],
-		unsigned int BlendingAndTiming[],
 		double BytePerPixelDETY[],
 		double BytePerPixelDETC[],
-		double DSTXAfterScaler[],
-		double DSTYAfterScaler[],
-		bool WritebackEnable[],
-		enum source_format_class WritebackPixelFormat[],
-		double WritebackDestinationWidth[],
-		double WritebackDestinationHeight[],
-		double WritebackSourceHeight[],
-		enum clock_change_support *DRAMClockChangeSupport,
-		double *UrgentWatermark,
-		double *WritebackUrgentWatermark,
-		double *DRAMClockChangeWatermark,
-		double *WritebackDRAMClockChangeWatermark,
-		double *StutterExitWatermark,
-		double *StutterEnterPlusExitWatermark,
-		double *MinActiveDRAMClockChangeLatencySupported)
+		enum clock_change_support *DRAMClockChangeSupport)
 {
+	struct vba_vars_st *v = &mode_lib->vba;
 	double EffectiveLBLatencyHidingY = 0;
 	double EffectiveLBLatencyHidingC = 0;
 	double LinesInDETY[DC__NUM_DPP__MAX] = { 0 };
@@ -5142,101 +4987,101 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 	double WritebackDRAMClockChangeLatencyHiding = 0;
 	unsigned int k, j;
 
-	mode_lib->vba.TotalActiveDPP = 0;
-	mode_lib->vba.TotalDCCActiveDPP = 0;
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
-		mode_lib->vba.TotalActiveDPP = mode_lib->vba.TotalActiveDPP + DPPPerPlane[k];
-		if (DCCEnable[k] == true) {
-			mode_lib->vba.TotalDCCActiveDPP = mode_lib->vba.TotalDCCActiveDPP + DPPPerPlane[k];
+	v->TotalActiveDPP = 0;
+	v->TotalDCCActiveDPP = 0;
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		v->TotalActiveDPP = v->TotalActiveDPP + DPPPerPlane[k];
+		if (v->DCCEnable[k] == true) {
+			v->TotalDCCActiveDPP = v->TotalDCCActiveDPP + DPPPerPlane[k];
 		}
 	}
 
-	*UrgentWatermark = UrgentLatency + ExtraLatency;
+	v->UrgentWatermark = UrgentLatency + ExtraLatency;
 
-	*DRAMClockChangeWatermark = DRAMClockChangeLatency + *UrgentWatermark;
+	v->DRAMClockChangeWatermark = v->FinalDRAMClockChangeLatency + v->UrgentWatermark;
 
-	mode_lib->vba.TotalActiveWriteback = 0;
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
-		if (WritebackEnable[k] == true) {
-			mode_lib->vba.TotalActiveWriteback = mode_lib->vba.TotalActiveWriteback + 1;
+	v->TotalActiveWriteback = 0;
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->WritebackEnable[k] == true) {
+			v->TotalActiveWriteback = v->TotalActiveWriteback + 1;
 		}
 	}
 
-	if (mode_lib->vba.TotalActiveWriteback <= 1) {
-		*WritebackUrgentWatermark = WritebackLatency;
+	if (v->TotalActiveWriteback <= 1) {
+		v->WritebackUrgentWatermark = v->WritebackLatency;
 	} else {
-		*WritebackUrgentWatermark = WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+		v->WritebackUrgentWatermark = v->WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
 	}
 
-	if (mode_lib->vba.TotalActiveWriteback <= 1) {
-		*WritebackDRAMClockChangeWatermark = DRAMClockChangeLatency + WritebackLatency;
+	if (v->TotalActiveWriteback <= 1) {
+		v->WritebackDRAMClockChangeWatermark = v->FinalDRAMClockChangeLatency + v->WritebackLatency;
 	} else {
-		*WritebackDRAMClockChangeWatermark = DRAMClockChangeLatency + WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
+		v->WritebackDRAMClockChangeWatermark = v->FinalDRAMClockChangeLatency + v->WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
 	}
 
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 
-		mode_lib->vba.LBLatencyHidingSourceLinesY = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (vtaps[k] - 1);
+		v->LBLatencyHidingSourceLinesY = dml_min((double) v->MaxLineBufferLines, dml_floor(v->LineBufferSize / v->LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(v->HRatio[k], 1.0)), 1)) - (v->vtaps[k] - 1);
 
-		mode_lib->vba.LBLatencyHidingSourceLinesC = dml_min((double) MaxLineBufferLines, dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTAPsChroma[k] - 1);
+		v->LBLatencyHidingSourceLinesC = dml_min((double) v->MaxLineBufferLines, dml_floor(v->LineBufferSize / v->LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(v->HRatioChroma[k], 1.0)), 1)) - (v->VTAPsChroma[k] - 1);
 
-		EffectiveLBLatencyHidingY = mode_lib->vba.LBLatencyHidingSourceLinesY / VRatio[k] * (HTotal[k] / PixelClock[k]);
+		EffectiveLBLatencyHidingY = v->LBLatencyHidingSourceLinesY / v->VRatio[k] * (v->HTotal[k] / v->PixelClock[k]);
 
-		EffectiveLBLatencyHidingC = mode_lib->vba.LBLatencyHidingSourceLinesC / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
+		EffectiveLBLatencyHidingC = v->LBLatencyHidingSourceLinesC / v->VRatioChroma[k] * (v->HTotal[k] / v->PixelClock[k]);
 
 		LinesInDETY[k] = (double) DETBufferSizeY[k] / BytePerPixelDETY[k] / SwathWidthY[k];
 		LinesInDETYRoundedDownToSwath[k] = dml_floor(LinesInDETY[k], SwathHeightY[k]);
-		FullDETBufferingTimeY[k] = LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
+		FullDETBufferingTimeY[k] = LinesInDETYRoundedDownToSwath[k] * (v->HTotal[k] / v->PixelClock[k]) / v->VRatio[k];
 		if (BytePerPixelDETC[k] > 0) {
-			LinesInDETC = mode_lib->vba.DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
+			LinesInDETC = v->DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
 			LinesInDETCRoundedDownToSwath = dml_floor(LinesInDETC, SwathHeightC[k]);
-			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath * (HTotal[k] / PixelClock[k]) / VRatioChroma[k];
+			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath * (v->HTotal[k] / v->PixelClock[k]) / v->VRatioChroma[k];
 		} else {
 			LinesInDETC = 0;
 			FullDETBufferingTimeC = 999999;
 		}
 
-		ActiveDRAMClockChangeLatencyMarginY = EffectiveLBLatencyHidingY + FullDETBufferingTimeY[k] - *UrgentWatermark - (HTotal[k] / PixelClock[k]) * (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) - *DRAMClockChangeWatermark;
+		ActiveDRAMClockChangeLatencyMarginY = EffectiveLBLatencyHidingY + FullDETBufferingTimeY[k] - v->UrgentWatermark - (v->HTotal[k] / v->PixelClock[k]) * (v->DSTXAfterScaler[k] / v->HTotal[k] + v->DSTYAfterScaler[k]) - v->DRAMClockChangeWatermark;
 
-		if (NumberOfActivePlanes > 1) {
-			ActiveDRAMClockChangeLatencyMarginY = ActiveDRAMClockChangeLatencyMarginY - (1 - 1.0 / NumberOfActivePlanes) * SwathHeightY[k] * HTotal[k] / PixelClock[k] / VRatio[k];
+		if (v->NumberOfActivePlanes > 1) {
+			ActiveDRAMClockChangeLatencyMarginY = ActiveDRAMClockChangeLatencyMarginY - (1 - 1.0 / v->NumberOfActivePlanes) * SwathHeightY[k] * v->HTotal[k] / v->PixelClock[k] / v->VRatio[k];
 		}
 
 		if (BytePerPixelDETC[k] > 0) {
-			ActiveDRAMClockChangeLatencyMarginC = EffectiveLBLatencyHidingC + FullDETBufferingTimeC - *UrgentWatermark - (HTotal[k] / PixelClock[k]) * (DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) - *DRAMClockChangeWatermark;
+			ActiveDRAMClockChangeLatencyMarginC = EffectiveLBLatencyHidingC + FullDETBufferingTimeC - v->UrgentWatermark - (v->HTotal[k] / v->PixelClock[k]) * (v->DSTXAfterScaler[k] / v->HTotal[k] + v->DSTYAfterScaler[k]) - v->DRAMClockChangeWatermark;
 
-			if (NumberOfActivePlanes > 1) {
-				ActiveDRAMClockChangeLatencyMarginC = ActiveDRAMClockChangeLatencyMarginC - (1 - 1.0 / NumberOfActivePlanes) * SwathHeightC[k] * HTotal[k] / PixelClock[k] / VRatioChroma[k];
+			if (v->NumberOfActivePlanes > 1) {
+				ActiveDRAMClockChangeLatencyMarginC = ActiveDRAMClockChangeLatencyMarginC - (1 - 1.0 / v->NumberOfActivePlanes) * SwathHeightC[k] * v->HTotal[k] / v->PixelClock[k] / v->VRatioChroma[k];
 			}
-			mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k] = dml_min(ActiveDRAMClockChangeLatencyMarginY, ActiveDRAMClockChangeLatencyMarginC);
+			v->ActiveDRAMClockChangeLatencyMargin[k] = dml_min(ActiveDRAMClockChangeLatencyMarginY, ActiveDRAMClockChangeLatencyMarginC);
 		} else {
-			mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k] = ActiveDRAMClockChangeLatencyMarginY;
+			v->ActiveDRAMClockChangeLatencyMargin[k] = ActiveDRAMClockChangeLatencyMarginY;
 		}
 
-		if (WritebackEnable[k] == true) {
+		if (v->WritebackEnable[k] == true) {
 
-			WritebackDRAMClockChangeLatencyHiding = WritebackInterfaceBufferSize * 1024 / (WritebackDestinationWidth[k] * WritebackDestinationHeight[k] / (WritebackSourceHeight[k] * HTotal[k] / PixelClock[k]) * 4);
-			if (WritebackPixelFormat[k] == dm_444_64) {
+			WritebackDRAMClockChangeLatencyHiding = v->WritebackInterfaceBufferSize * 1024 / (v->WritebackDestinationWidth[k] * v->WritebackDestinationHeight[k] / (v->WritebackSourceHeight[k] * v->HTotal[k] / v->PixelClock[k]) * 4);
+			if (v->WritebackPixelFormat[k] == dm_444_64) {
 				WritebackDRAMClockChangeLatencyHiding = WritebackDRAMClockChangeLatencyHiding / 2;
 			}
-			if (mode_lib->vba.WritebackConfiguration == dm_whole_buffer_for_single_stream_interleave) {
+			if (v->WritebackConfiguration == dm_whole_buffer_for_single_stream_interleave) {
 				WritebackDRAMClockChangeLatencyHiding = WritebackDRAMClockChangeLatencyHiding * 2;
 			}
-			WritebackDRAMClockChangeLatencyMargin = WritebackDRAMClockChangeLatencyHiding - mode_lib->vba.WritebackDRAMClockChangeWatermark;
-			mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k] = dml_min(mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k], WritebackDRAMClockChangeLatencyMargin);
+			WritebackDRAMClockChangeLatencyMargin = WritebackDRAMClockChangeLatencyHiding - v->WritebackDRAMClockChangeWatermark;
+			v->ActiveDRAMClockChangeLatencyMargin[k] = dml_min(v->ActiveDRAMClockChangeLatencyMargin[k], WritebackDRAMClockChangeLatencyMargin);
 		}
 	}
 
-	mode_lib->vba.MinActiveDRAMClockChangeMargin = 999999;
+	v->MinActiveDRAMClockChangeMargin = 999999;
 	PlaneWithMinActiveDRAMClockChangeMargin = 0;
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
-		if (mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k] < mode_lib->vba.MinActiveDRAMClockChangeMargin) {
-			mode_lib->vba.MinActiveDRAMClockChangeMargin = mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k];
-			if (BlendingAndTiming[k] == k) {
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->ActiveDRAMClockChangeLatencyMargin[k] < v->MinActiveDRAMClockChangeMargin) {
+			v->MinActiveDRAMClockChangeMargin = v->ActiveDRAMClockChangeLatencyMargin[k];
+			if (v->BlendingAndTiming[k] == k) {
 				PlaneWithMinActiveDRAMClockChangeMargin = k;
 			} else {
-				for (j = 0; j < NumberOfActivePlanes; ++j) {
-					if (BlendingAndTiming[k] == j) {
+				for (j = 0; j < v->NumberOfActivePlanes; ++j) {
+					if (v->BlendingAndTiming[k] == j) {
 						PlaneWithMinActiveDRAMClockChangeMargin = j;
 					}
 				}
@@ -5244,40 +5089,40 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
 		}
 	}
 
-	*MinActiveDRAMClockChangeLatencySupported = mode_lib->vba.MinActiveDRAMClockChangeMargin + DRAMClockChangeLatency;
+	v->MinActiveDRAMClockChangeLatencySupported = v->MinActiveDRAMClockChangeMargin + v->FinalDRAMClockChangeLatency;
 
 	SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = 999999;
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
-		if (!((k == PlaneWithMinActiveDRAMClockChangeMargin) && (BlendingAndTiming[k] == k)) && !(BlendingAndTiming[k] == PlaneWithMinActiveDRAMClockChangeMargin) && mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k] < SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank) {
-			SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = mode_lib->vba.ActiveDRAMClockChangeLatencyMargin[k];
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (!((k == PlaneWithMinActiveDRAMClockChangeMargin) && (v->BlendingAndTiming[k] == k)) && !(v->BlendingAndTiming[k] == PlaneWithMinActiveDRAMClockChangeMargin) && v->ActiveDRAMClockChangeLatencyMargin[k] < SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank) {
+			SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = v->ActiveDRAMClockChangeLatencyMargin[k];
 		}
 	}
 
-	mode_lib->vba.TotalNumberOfActiveOTG = 0;
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
-		if (BlendingAndTiming[k] == k) {
-			mode_lib->vba.TotalNumberOfActiveOTG = mode_lib->vba.TotalNumberOfActiveOTG + 1;
+	v->TotalNumberOfActiveOTG = 0;
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
+		if (v->BlendingAndTiming[k] == k) {
+			v->TotalNumberOfActiveOTG = v->TotalNumberOfActiveOTG + 1;
 		}
 	}
 
-	if (mode_lib->vba.MinActiveDRAMClockChangeMargin > 0) {
+	if (v->MinActiveDRAMClockChangeMargin > 0) {
 		*DRAMClockChangeSupport = dm_dram_clock_change_vactive;
-	} else if (((mode_lib->vba.SynchronizedVBlank == true || mode_lib->vba.TotalNumberOfActiveOTG == 1 || SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank > 0) && PrefetchMode == 0)) {
+	} else if (((v->SynchronizedVBlank == true || v->TotalNumberOfActiveOTG == 1 || SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank > 0) && PrefetchMode == 0)) {
 		*DRAMClockChangeSupport = dm_dram_clock_change_vblank;
 	} else {
 		*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
 	}
 
 	FullDETBufferingTimeYStutterCriticalPlane = FullDETBufferingTimeY[0];
-	for (k = 0; k < NumberOfActivePlanes; ++k) {
+	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 		if (FullDETBufferingTimeY[k] <= FullDETBufferingTimeYStutterCriticalPlane) {
 			FullDETBufferingTimeYStutterCriticalPlane = FullDETBufferingTimeY[k];
-			TimeToFinishSwathTransferStutterCriticalPlane = (SwathHeightY[k] - (LinesInDETY[k] - LinesInDETYRoundedDownToSwath[k])) * (HTotal[k] / PixelClock[k]) / VRatio[k];
+			TimeToFinishSwathTransferStutterCriticalPlane = (SwathHeightY[k] - (LinesInDETY[k] - LinesInDETYRoundedDownToSwath[k])) * (v->HTotal[k] / v->PixelClock[k]) / v->VRatio[k];
 		}
 	}
 
-	*StutterExitWatermark = SRExitTime +  ExtraLatency + 10 / DCFCLKDeepSleep;
-	*StutterEnterPlusExitWatermark = dml_max(SREnterPlusExitTime + ExtraLatency + 10 / DCFCLKDeepSleep, TimeToFinishSwathTransferStutterCriticalPlane);
+	v->StutterExitWatermark = v->SRExitTime +  ExtraLatency + 10 / DCFCLKDeepSleep;
+	v->StutterEnterPlusExitWatermark = dml_max(v->SREnterPlusExitTime + ExtraLatency + 10 / DCFCLKDeepSleep, TimeToFinishSwathTransferStutterCriticalPlane);
 
 }
 

-- 
2.52.0

