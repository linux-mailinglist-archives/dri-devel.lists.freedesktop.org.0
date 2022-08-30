Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71605A6E80
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 22:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653AD10E12F;
	Tue, 30 Aug 2022 20:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2784C10E12D;
 Tue, 30 Aug 2022 20:34:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8644B81D81;
 Tue, 30 Aug 2022 20:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE97C4347C;
 Tue, 30 Aug 2022 20:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661891680;
 bh=T13qHrNnUxbUDWhssZ9m9lTfcGa79RhWW97V8xxFWaM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LjiIV8l7VhSwbPBCzkgygncthngy5r/WJggyO1hXlGHM/gtDojn0lydXa5cqXhQN8
 zw77USOxemcReUbyMW8MIRiUC5WMKxWbQiC6Pxi2SaX1zIBSLHKbBtvJ/TJZuSp+Sp
 fzpaSDH91npRAS1HcHWeQrg9wOBMG8Qqo4Mc9plBXlO5LWxhbTaAY39V2FD98OW4C1
 aJCvXkpaozmBV0OKkl9Q8HsGiTRmEsnrkQYEjc8V9PLDiyL9kb2CYWTYvs1tPnD4KA
 sU54FxZAWOMyjK0zFguxkxRPZI9YQ4pT3YZQDKFvLk42ksMU6C1s8LLCJNjnHDHzP9
 fJi1LrdD8x+Iw==
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH 2/5] drm/amd/display: Reduce number of arguments of
 dml32_CalculatePrefetchSchedule()
Date: Tue, 30 Aug 2022 13:34:06 -0700
Message-Id: <20220830203409.3491379-3-nathan@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830203409.3491379-1-nathan@kernel.org>
References: <20220830203409.3491379-1-nathan@kernel.org>
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 amd-gfx@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several of the arguments are identical between the two call sites and
they can be accessed through the 'struct vba_vars_st' pointer. This
reduces the total amount of stack space that
dml32_ModeSupportAndSystemConfigurationFull() uses by 208 bytes with
LLVM 16 (1936 -> 1728), helping clear up the following clang warning:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1721:6: error: stack frame size (2152) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
  void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
       ^
  1 error generated.

Additionally, while modifying the arguments to
dml32_CalculatePrefetchSchedule(), use 'v' consistently, instead of 'v'
mixed with 'mode_lib->vba'.

Link: https://github.com/ClangBuiltLinux/linux/issues/1681
Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 .../dc/dml/dcn32/display_mode_vba_32.c        | 118 +++++++-----------
 .../dc/dml/dcn32/display_mode_vba_util_32.c   |  75 +++++------
 .../dc/dml/dcn32/display_mode_vba_util_32.h   |  18 +--
 3 files changed, 78 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index 7da90fba95fc..58c6cc58583a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -755,30 +755,18 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BytePerPixelY = v->BytePerPixelY[k];
 			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BytePerPixelC = v->BytePerPixelC[k];
 			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.ProgressiveToInterlaceUnitInOPP = mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
-			v->ErrorResult[k] = dml32_CalculatePrefetchSchedule(v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.HostVMInefficiencyFactor,
-					&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe, v->DSCDelay[k],
-					mode_lib->vba.DPPCLKDelaySubtotal + mode_lib->vba.DPPCLKDelayCNVCFormater,
-					mode_lib->vba.DPPCLKDelaySCL,
-					mode_lib->vba.DPPCLKDelaySCLLBOnly,
-					mode_lib->vba.DPPCLKDelayCNVCCursor,
-					mode_lib->vba.DISPCLKDelaySubtotal,
-					(unsigned int) (v->SwathWidthY[k] / mode_lib->vba.HRatio[k]),
-					mode_lib->vba.OutputFormat[k],
-					mode_lib->vba.MaxInterDCNTileRepeaters,
+			v->ErrorResult[k] = dml32_CalculatePrefetchSchedule(
+					v,
+					k,
+					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.HostVMInefficiencyFactor,
+					&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe,
+					v->DSCDelay[k],
+					(unsigned int) (v->SwathWidthY[k] / v->HRatio[k]),
 					dml_min(v->VStartupLines, v->MaxVStartupLines[k]),
 					v->MaxVStartupLines[k],
-					mode_lib->vba.GPUVMMaxPageTableLevels,
-					mode_lib->vba.GPUVMEnable,
-					mode_lib->vba.HostVMEnable,
-					mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
-					mode_lib->vba.HostVMMinPageSize,
-					mode_lib->vba.DynamicMetadataEnable[k],
-					mode_lib->vba.DynamicMetadataVMEnabled,
-					mode_lib->vba.DynamicMetadataLinesBeforeActiveRequired[k],
-					mode_lib->vba.DynamicMetadataTransmittedBytes[k],
 					v->UrgentLatency,
 					v->UrgentExtraLatency,
-					mode_lib->vba.TCalc,
+					v->TCalc,
 					v->PDEAndMetaPTEBytesFrame[k],
 					v->MetaRowByte[k],
 					v->PixelPTEBytesPerRow[k],
@@ -792,8 +780,8 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 					v->MaxNumSwathC[k],
 					v->swath_width_luma_ub[k],
 					v->swath_width_chroma_ub[k],
-					mode_lib->vba.SwathHeightY[k],
-					mode_lib->vba.SwathHeightC[k],
+					v->SwathHeightY[k],
+					v->SwathHeightC[k],
 					TWait,
 					/* Output */
 					&v->DSTXAfterScaler[k],
@@ -3230,63 +3218,47 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 
 					mode_lib->vba.NoTimeForPrefetch[i][j][k] =
 						dml32_CalculatePrefetchSchedule(
+							v,
+							k,
 							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor,
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe,
-							mode_lib->vba.DSCDelayPerState[i][k],
-							mode_lib->vba.DPPCLKDelaySubtotal +
-								mode_lib->vba.DPPCLKDelayCNVCFormater,
-							mode_lib->vba.DPPCLKDelaySCL,
-							mode_lib->vba.DPPCLKDelaySCLLBOnly,
-							mode_lib->vba.DPPCLKDelayCNVCCursor,
-							mode_lib->vba.DISPCLKDelaySubtotal,
-							mode_lib->vba.SwathWidthYThisState[k] /
-								mode_lib->vba.HRatio[k],
-							mode_lib->vba.OutputFormat[k],
-							mode_lib->vba.MaxInterDCNTileRepeaters,
-							dml_min(mode_lib->vba.MaxVStartup,
-									mode_lib->vba.MaximumVStartup[i][j][k]),
-							mode_lib->vba.MaximumVStartup[i][j][k],
-							mode_lib->vba.GPUVMMaxPageTableLevels,
-							mode_lib->vba.GPUVMEnable, mode_lib->vba.HostVMEnable,
-							mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
-							mode_lib->vba.HostVMMinPageSize,
-							mode_lib->vba.DynamicMetadataEnable[k],
-							mode_lib->vba.DynamicMetadataVMEnabled,
-							mode_lib->vba.DynamicMetadataLinesBeforeActiveRequired[k],
-							mode_lib->vba.DynamicMetadataTransmittedBytes[k],
-							mode_lib->vba.UrgLatency[i],
-							mode_lib->vba.ExtraLatency,
-							mode_lib->vba.TimeCalc,
-							mode_lib->vba.PDEAndMetaPTEBytesPerFrame[i][j][k],
-							mode_lib->vba.MetaRowBytes[i][j][k],
-							mode_lib->vba.DPTEBytesPerRow[i][j][k],
-							mode_lib->vba.PrefetchLinesY[i][j][k],
-							mode_lib->vba.SwathWidthYThisState[k],
-							mode_lib->vba.PrefillY[k],
-							mode_lib->vba.MaxNumSwY[k],
-							mode_lib->vba.PrefetchLinesC[i][j][k],
-							mode_lib->vba.SwathWidthCThisState[k],
-							mode_lib->vba.PrefillC[k],
-							mode_lib->vba.MaxNumSwC[k],
-							mode_lib->vba.swath_width_luma_ub_this_state[k],
-							mode_lib->vba.swath_width_chroma_ub_this_state[k],
-							mode_lib->vba.SwathHeightYThisState[k],
-							mode_lib->vba.SwathHeightCThisState[k], mode_lib->vba.TWait,
+							v->DSCDelayPerState[i][k],
+							v->SwathWidthYThisState[k] / v->HRatio[k],
+							dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
+							v->MaximumVStartup[i][j][k],
+							v->UrgLatency[i],
+							v->ExtraLatency,
+							v->TimeCalc,
+							v->PDEAndMetaPTEBytesPerFrame[i][j][k],
+							v->MetaRowBytes[i][j][k],
+							v->DPTEBytesPerRow[i][j][k],
+							v->PrefetchLinesY[i][j][k],
+							v->SwathWidthYThisState[k],
+							v->PrefillY[k],
+							v->MaxNumSwY[k],
+							v->PrefetchLinesC[i][j][k],
+							v->SwathWidthCThisState[k],
+							v->PrefillC[k],
+							v->MaxNumSwC[k],
+							v->swath_width_luma_ub_this_state[k],
+							v->swath_width_chroma_ub_this_state[k],
+							v->SwathHeightYThisState[k],
+							v->SwathHeightCThisState[k], v->TWait,
 
 							/* Output */
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTXAfterScaler[k],
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTYAfterScaler[k],
-							&mode_lib->vba.LineTimesForPrefetch[k],
-							&mode_lib->vba.PrefetchBW[k],
-							&mode_lib->vba.LinesForMetaPTE[k],
-							&mode_lib->vba.LinesForMetaAndDPTERow[k],
-							&mode_lib->vba.VRatioPreY[i][j][k],
-							&mode_lib->vba.VRatioPreC[i][j][k],
-							&mode_lib->vba.RequiredPrefetchPixelDataBWLuma[0][0][k],
-							&mode_lib->vba.RequiredPrefetchPixelDataBWChroma[0][0][k],
-							&mode_lib->vba.NoTimeForDynamicMetadata[i][j][k],
-							&mode_lib->vba.Tno_bw[k],
-							&mode_lib->vba.prefetch_vmrow_bw[k],
+							&v->LineTimesForPrefetch[k],
+							&v->PrefetchBW[k],
+							&v->LinesForMetaPTE[k],
+							&v->LinesForMetaAndDPTERow[k],
+							&v->VRatioPreY[i][j][k],
+							&v->VRatioPreC[i][j][k],
+							&v->RequiredPrefetchPixelDataBWLuma[0][0][k],
+							&v->RequiredPrefetchPixelDataBWChroma[0][0][k],
+							&v->NoTimeForDynamicMetadata[i][j][k],
+							&v->Tno_bw[k],
+							&v->prefetch_vmrow_bw[k],
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[0],         // double *Tdmdl_vm
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[1],         // double *Tdmdl
 							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[2],         // double *TSetup
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 6c7b748ee62b..61be183a4036 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -3366,28 +3366,14 @@ double dml32_CalculateExtraLatency(
 } // CalculateExtraLatency
 
 bool dml32_CalculatePrefetchSchedule(
+		struct vba_vars_st *v,
+		unsigned int k,
 		double HostVMInefficiencyFactor,
 		DmlPipe *myPipe,
 		unsigned int DSCDelay,
-		double DPPCLKDelaySubtotalPlusCNVCFormater,
-		double DPPCLKDelaySCL,
-		double DPPCLKDelaySCLLBOnly,
-		double DPPCLKDelayCNVCCursor,
-		double DISPCLKDelaySubtotal,
 		unsigned int DPP_RECOUT_WIDTH,
-		enum output_format_class OutputFormat,
-		unsigned int MaxInterDCNTileRepeaters,
 		unsigned int VStartup,
 		unsigned int MaxVStartup,
-		unsigned int GPUVMPageTableLevels,
-		bool GPUVMEnable,
-		bool HostVMEnable,
-		unsigned int HostVMMaxNonCachedPageTableLevels,
-		double HostVMMinPageSize,
-		bool DynamicMetadataEnable,
-		bool DynamicMetadataVMEnabled,
-		int DynamicMetadataLinesBeforeActiveRequired,
-		unsigned int DynamicMetadataTransmittedBytes,
 		double UrgentLatency,
 		double UrgentExtraLatency,
 		double TCalc,
@@ -3428,6 +3414,7 @@ bool dml32_CalculatePrefetchSchedule(
 		double   *VUpdateWidthPix,
 		double   *VReadyOffsetPix)
 {
+	double DPPCLKDelaySubtotalPlusCNVCFormater = v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater;
 	bool MyError = false;
 	unsigned int DPPCycles, DISPCLKCycles;
 	double DSTTotalPixelsAfterScaler;
@@ -3464,27 +3451,27 @@ bool dml32_CalculatePrefetchSchedule(
 	double  Tsw_est1 = 0;
 	double  Tsw_est3 = 0;
 
-	if (GPUVMEnable == true && HostVMEnable == true)
-		HostVMDynamicLevelsTrips = HostVMMaxNonCachedPageTableLevels;
+	if (v->GPUVMEnable == true && v->HostVMEnable == true)
+		HostVMDynamicLevelsTrips = v->HostVMMaxNonCachedPageTableLevels;
 	else
 		HostVMDynamicLevelsTrips = 0;
 #ifdef __DML_VBA_DEBUG__
-	dml_print("DML::%s: GPUVMEnable = %d\n", __func__, GPUVMEnable);
-	dml_print("DML::%s: GPUVMPageTableLevels = %d\n", __func__, GPUVMPageTableLevels);
+	dml_print("DML::%s: v->GPUVMEnable = %d\n", __func__, v->GPUVMEnable);
+	dml_print("DML::%s: v->GPUVMMaxPageTableLevels = %d\n", __func__, v->GPUVMMaxPageTableLevels);
 	dml_print("DML::%s: DCCEnable = %d\n", __func__, myPipe->DCCEnable);
-	dml_print("DML::%s: HostVMEnable=%d HostVMInefficiencyFactor=%f\n",
-			__func__, HostVMEnable, HostVMInefficiencyFactor);
+	dml_print("DML::%s: v->HostVMEnable=%d HostVMInefficiencyFactor=%f\n",
+			__func__, v->HostVMEnable, HostVMInefficiencyFactor);
 #endif
 	dml32_CalculateVUpdateAndDynamicMetadataParameters(
-			MaxInterDCNTileRepeaters,
+			v->MaxInterDCNTileRepeaters,
 			myPipe->Dppclk,
 			myPipe->Dispclk,
 			myPipe->DCFClkDeepSleep,
 			myPipe->PixelClock,
 			myPipe->HTotal,
 			myPipe->VBlank,
-			DynamicMetadataTransmittedBytes,
-			DynamicMetadataLinesBeforeActiveRequired,
+			v->DynamicMetadataTransmittedBytes[k],
+			v->DynamicMetadataLinesBeforeActiveRequired[k],
 			myPipe->InterlaceEnable,
 			myPipe->ProgressiveToInterlaceUnitInOPP,
 			TSetup,
@@ -3499,19 +3486,19 @@ bool dml32_CalculatePrefetchSchedule(
 
 	LineTime = myPipe->HTotal / myPipe->PixelClock;
 	trip_to_mem = UrgentLatency;
-	Tvm_trips = UrgentExtraLatency + trip_to_mem * (GPUVMPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1);
+	Tvm_trips = UrgentExtraLatency + trip_to_mem * (v->GPUVMMaxPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1);
 
-	if (DynamicMetadataVMEnabled == true)
+	if (v->DynamicMetadataVMEnabled == true)
 		*Tdmdl = TWait + Tvm_trips + trip_to_mem;
 	else
 		*Tdmdl = TWait + UrgentExtraLatency;
 
 #ifdef __DML_VBA_ALLOW_DELTA__
-	if (DynamicMetadataEnable == false)
+	if (v->DynamicMetadataEnable[k] == false)
 		*Tdmdl = 0.0;
 #endif
 
-	if (DynamicMetadataEnable == true) {
+	if (v->DynamicMetadataEnable[k] == true) {
 		if (VStartup * LineTime < *TSetup + *Tdmdl + Tdmbf + Tdmec + Tdmsks) {
 			*NotEnoughTimeForDynamicMetadata = true;
 #ifdef __DML_VBA_DEBUG__
@@ -3531,17 +3518,17 @@ bool dml32_CalculatePrefetchSchedule(
 		*NotEnoughTimeForDynamicMetadata = false;
 	}
 
-	*Tdmdl_vm =  (DynamicMetadataEnable == true && DynamicMetadataVMEnabled == true &&
-			GPUVMEnable == true ? TWait + Tvm_trips : 0);
+	*Tdmdl_vm =  (v->DynamicMetadataEnable[k] == true && v->DynamicMetadataVMEnabled == true &&
+			v->GPUVMEnable == true ? TWait + Tvm_trips : 0);
 
 	if (myPipe->ScalerEnabled)
-		DPPCycles = DPPCLKDelaySubtotalPlusCNVCFormater + DPPCLKDelaySCL;
+		DPPCycles = DPPCLKDelaySubtotalPlusCNVCFormater + v->DPPCLKDelaySCL;
 	else
-		DPPCycles = DPPCLKDelaySubtotalPlusCNVCFormater + DPPCLKDelaySCLLBOnly;
+		DPPCycles = DPPCLKDelaySubtotalPlusCNVCFormater + v->DPPCLKDelaySCLLBOnly;
 
-	DPPCycles = DPPCycles + myPipe->NumberOfCursors * DPPCLKDelayCNVCCursor;
+	DPPCycles = DPPCycles + myPipe->NumberOfCursors * v->DPPCLKDelayCNVCCursor;
 
-	DISPCLKCycles = DISPCLKDelaySubtotal;
+	DISPCLKCycles = v->DISPCLKDelaySubtotal;
 
 	if (myPipe->Dppclk == 0.0 || myPipe->Dispclk == 0.0)
 		return true;
@@ -3567,7 +3554,7 @@ bool dml32_CalculatePrefetchSchedule(
 	dml_print("DML::%s: DSTXAfterScaler: %d\n", __func__,  *DSTXAfterScaler);
 #endif
 
-	if (OutputFormat == dm_420 || (myPipe->InterlaceEnable && myPipe->ProgressiveToInterlaceUnitInOPP))
+	if (v->OutputFormat[k] == dm_420 || (myPipe->InterlaceEnable && myPipe->ProgressiveToInterlaceUnitInOPP))
 		*DSTYAfterScaler = 1;
 	else
 		*DSTYAfterScaler = 0;
@@ -3584,13 +3571,13 @@ bool dml32_CalculatePrefetchSchedule(
 
 	Tr0_trips = trip_to_mem * (HostVMDynamicLevelsTrips + 1);
 
-	if (GPUVMEnable == true) {
+	if (v->GPUVMEnable == true) {
 		Tvm_trips_rounded = dml_ceil(4.0 * Tvm_trips / LineTime, 1.0) / 4.0 * LineTime;
 		Tr0_trips_rounded = dml_ceil(4.0 * Tr0_trips / LineTime, 1.0) / 4.0 * LineTime;
-		if (GPUVMPageTableLevels >= 3) {
+		if (v->GPUVMMaxPageTableLevels >= 3) {
 			*Tno_bw = UrgentExtraLatency + trip_to_mem *
-					(double) ((GPUVMPageTableLevels - 2) * (HostVMDynamicLevelsTrips + 1) - 1);
-		} else if (GPUVMPageTableLevels == 1 && myPipe->DCCEnable != true) {
+					(double) ((v->GPUVMMaxPageTableLevels - 2) * (HostVMDynamicLevelsTrips + 1) - 1);
+		} else if (v->GPUVMMaxPageTableLevels == 1 && myPipe->DCCEnable != true) {
 			Tr0_trips_rounded = dml_ceil(4.0 * UrgentExtraLatency / LineTime, 1.0) /
 					4.0 * LineTime; // VBA_ERROR
 			*Tno_bw = UrgentExtraLatency;
@@ -3625,7 +3612,7 @@ bool dml32_CalculatePrefetchSchedule(
 	min_Lsw = dml_max(min_Lsw, 1.0);
 	Lsw_oto = dml_ceil(4.0 * dml_max(prefetch_sw_bytes / prefetch_bw_oto / LineTime, min_Lsw), 1.0) / 4.0;
 
-	if (GPUVMEnable == true) {
+	if (v->GPUVMEnable == true) {
 		Tvm_oto = dml_max3(
 				Tvm_trips,
 				*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / prefetch_bw_oto,
@@ -3633,7 +3620,7 @@ bool dml32_CalculatePrefetchSchedule(
 	} else
 		Tvm_oto = LineTime / 4.0;
 
-	if ((GPUVMEnable == true || myPipe->DCCEnable == true)) {
+	if ((v->GPUVMEnable == true || myPipe->DCCEnable == true)) {
 		Tr0_oto = dml_max4(
 				Tr0_trips,
 				(MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / prefetch_bw_oto,
@@ -3836,7 +3823,7 @@ bool dml32_CalculatePrefetchSchedule(
 #endif
 
 			if (prefetch_bw_equ > 0) {
-				if (GPUVMEnable == true) {
+				if (v->GPUVMEnable == true) {
 					Tvm_equ = dml_max3(*Tno_bw + PDEAndMetaPTEBytesFrame *
 							HostVMInefficiencyFactor / prefetch_bw_equ,
 							Tvm_trips, LineTime / 4);
@@ -3844,7 +3831,7 @@ bool dml32_CalculatePrefetchSchedule(
 					Tvm_equ = LineTime / 4;
 				}
 
-				if ((GPUVMEnable == true || myPipe->DCCEnable == true)) {
+				if ((v->GPUVMEnable == true || myPipe->DCCEnable == true)) {
 					Tr0_equ = dml_max4((MetaRowByte + PixelPTEBytesPerRow *
 							HostVMInefficiencyFactor) / prefetch_bw_equ, Tr0_trips,
 							(LineTime - Tvm_equ) / 2, LineTime / 4);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
index 7cdf0418830a..3dbc9cf46aad 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
@@ -714,28 +714,14 @@ double dml32_CalculateExtraLatency(
 		unsigned int HostVMMaxNonCachedPageTableLevels);
 
 bool dml32_CalculatePrefetchSchedule(
+		struct vba_vars_st *v,
+		unsigned int k,
 		double HostVMInefficiencyFactor,
 		DmlPipe *myPipe,
 		unsigned int DSCDelay,
-		double DPPCLKDelaySubtotalPlusCNVCFormater,
-		double DPPCLKDelaySCL,
-		double DPPCLKDelaySCLLBOnly,
-		double DPPCLKDelayCNVCCursor,
-		double DISPCLKDelaySubtotal,
 		unsigned int DPP_RECOUT_WIDTH,
-		enum output_format_class OutputFormat,
-		unsigned int MaxInterDCNTileRepeaters,
 		unsigned int VStartup,
 		unsigned int MaxVStartup,
-		unsigned int GPUVMPageTableLevels,
-		bool GPUVMEnable,
-		bool HostVMEnable,
-		unsigned int HostVMMaxNonCachedPageTableLevels,
-		double HostVMMinPageSize,
-		bool DynamicMetadataEnable,
-		bool DynamicMetadataVMEnabled,
-		int DynamicMetadataLinesBeforeActiveRequired,
-		unsigned int DynamicMetadataTransmittedBytes,
 		double UrgentLatency,
 		double UrgentExtraLatency,
 		double TCalc,
-- 
2.37.2

