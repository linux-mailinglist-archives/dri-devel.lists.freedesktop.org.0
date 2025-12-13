Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1DDCBA846
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 11:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653C110E3D0;
	Sat, 13 Dec 2025 10:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ndq3XH+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D6810E3D0;
 Sat, 13 Dec 2025 10:58:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0191560209;
 Sat, 13 Dec 2025 10:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E75C113D0;
 Sat, 13 Dec 2025 10:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765623511;
 bh=Sy3XyoPZsr0Ky8MU2s/ctdEONGUoaJtCl9VqWngkH4Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ndq3XH+AtbyTmdMQkT37cQCS6us4A6qWAsd7pOyBt4X5Srj5Au+mEgM6bcBjJUJbT
 61j5aa1iVqTh1bIXMzeQ2dxQzaKY1gVcubHz1BkGwyMRgdDu8pEU/L1beDdK0NNUCg
 dwSelLicdXWXbMEllFQjHn/UwYOBqHu9pkgM3Lgql3fiOivZYkjDFpNyc1Pg/vnngt
 TNTUTWwdoInRrk372EdIFu9XVQpHQ8pEAbkuq/raEWObW5ZF7JUjaX4Vao6I7eVP5J
 qsTxAEEf1NSZHMQYu0oAY7WX9KnYxpT4MrInBFyhYJl1p1DCP3BRR7OeTDLTniAT06
 QjPM+teih54VQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 13 Dec 2025 19:58:10 +0900
Subject: [PATCH 1/2] drm/amd/display: Reduce number of arguments of dcn30's
 CalculatePrefetchSchedule()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-dml-dcn30-avoid-clang-frame-larger-than-v1-1-dd3d74b76a17@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=29063; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Sy3XyoPZsr0Ky8MU2s/ctdEONGUoaJtCl9VqWngkH4Y=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJm2bhfEog73bOGpEV35sf7oa95VXXP6/82xCJgk/GxKx
 EeRJdvtOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEDrIy/E/n2bfjf9Trux2L
 /ZYVS67N1lix/aXl9/ibsx6c6db/ZrCH4Z/a4wepD3k2dE6ZHaAoMXNBX1VnZ9KGTQvaz5hxzZr
 Sd5wJAA==
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

After an innocuous optimization change in clang-22,
dml30_ModeSupportAndSystemConfigurationFull() is over the 2048 byte
stack limit for display_mode_vba_30.c.

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3529:6: warning: stack frame size (2096) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
   3529 | void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^

With clang-21, this function was already close to the limit:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3529:6: warning: stack frame size (1912) exceeds limit (1586) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
   3529 | void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^

CalculatePrefetchSchedule() has a large number of parameters, which must
be passed on the stack. Most of the parameters between the two callsites
are the same, so they can be accessed through the existing mode_lib
pointer, instead of being passed as explicit arguments. Doing this
reduces the stack size of dml30_ModeSupportAndSystemConfigurationFull()
from 2096 bytes to 1912 bytes with clang-22.

Closes: https://github.com/ClangBuiltLinux/linux/issues/2117
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c | 258 ++++++---------------
 1 file changed, 73 insertions(+), 185 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 8d24763938ea..2d19bb8de59c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -77,32 +77,14 @@ static unsigned int dscceComputeDelay(
 static unsigned int dscComputeDelay(
 		enum output_format_class pixelFormat,
 		enum output_encoder_class Output);
-// Super monster function with some 45 argument
 static bool CalculatePrefetchSchedule(
 		struct display_mode_lib *mode_lib,
-		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
-		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		unsigned int k,
 		Pipe *myPipe,
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
@@ -116,7 +98,6 @@ static bool CalculatePrefetchSchedule(
 		unsigned int MaxNumSwathY,
 		double PrefetchSourceLinesC,
 		unsigned int SwathWidthC,
-		int BytePerPixelC,
 		double VInitPreFillC,
 		unsigned int MaxNumSwathC,
 		long swath_width_luma_ub,
@@ -124,9 +105,6 @@ static bool CalculatePrefetchSchedule(
 		unsigned int SwathHeightY,
 		unsigned int SwathHeightC,
 		double TWait,
-		bool ProgressiveToInterlaceUnitInOPP,
-		double *DSTXAfterScaler,
-		double *DSTYAfterScaler,
 		double *DestinationLinesForPrefetch,
 		double *PrefetchBandwidth,
 		double *DestinationLinesToRequestVMInVBlank,
@@ -135,14 +113,7 @@ static bool CalculatePrefetchSchedule(
 		double *VRatioPrefetchC,
 		double *RequiredPrefetchPixDataBWLuma,
 		double *RequiredPrefetchPixDataBWChroma,
-		bool *NotEnoughTimeForDynamicMetadata,
-		double *Tno_bw,
-		double *prefetch_vmrow_bw,
-		double *Tdmdl_vm,
-		double *Tdmdl,
-		unsigned int *VUpdateOffsetPix,
-		double *VUpdateWidthPix,
-		double *VReadyOffsetPix);
+		bool *NotEnoughTimeForDynamicMetadata);
 static double RoundToDFSGranularityUp(double Clock, double VCOSpeed);
 static double RoundToDFSGranularityDown(double Clock, double VCOSpeed);
 static void CalculateDCCConfiguration(
@@ -810,29 +781,12 @@ static unsigned int dscComputeDelay(enum output_format_class pixelFormat, enum o
 
 static bool CalculatePrefetchSchedule(
 		struct display_mode_lib *mode_lib,
-		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
-		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+		unsigned int k,
 		Pipe *myPipe,
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
@@ -846,7 +800,6 @@ static bool CalculatePrefetchSchedule(
 		unsigned int MaxNumSwathY,
 		double PrefetchSourceLinesC,
 		unsigned int SwathWidthC,
-		int BytePerPixelC,
 		double VInitPreFillC,
 		unsigned int MaxNumSwathC,
 		long swath_width_luma_ub,
@@ -854,9 +807,6 @@ static bool CalculatePrefetchSchedule(
 		unsigned int SwathHeightY,
 		unsigned int SwathHeightC,
 		double TWait,
-		bool ProgressiveToInterlaceUnitInOPP,
-		double *DSTXAfterScaler,
-		double *DSTYAfterScaler,
 		double *DestinationLinesForPrefetch,
 		double *PrefetchBandwidth,
 		double *DestinationLinesToRequestVMInVBlank,
@@ -865,15 +815,10 @@ static bool CalculatePrefetchSchedule(
 		double *VRatioPrefetchC,
 		double *RequiredPrefetchPixDataBWLuma,
 		double *RequiredPrefetchPixDataBWChroma,
-		bool *NotEnoughTimeForDynamicMetadata,
-		double *Tno_bw,
-		double *prefetch_vmrow_bw,
-		double *Tdmdl_vm,
-		double *Tdmdl,
-		unsigned int *VUpdateOffsetPix,
-		double *VUpdateWidthPix,
-		double *VReadyOffsetPix)
+		bool *NotEnoughTimeForDynamicMetadata)
 {
+	struct vba_vars_st *v = &mode_lib->vba;
+	double DPPCLKDelaySubtotalPlusCNVCFormater = v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater;
 	bool MyError = false;
 	unsigned int DPPCycles = 0, DISPCLKCycles = 0;
 	double DSTTotalPixelsAfterScaler = 0;
@@ -905,26 +850,26 @@ static bool CalculatePrefetchSchedule(
 	double Tdmec = 0;
 	double Tdmsks = 0;
 
-	if (GPUVMEnable == true && HostVMEnable == true) {
-		HostVMInefficiencyFactor = PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData / PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly;
-		HostVMDynamicLevelsTrips = HostVMMaxNonCachedPageTableLevels;
+	if (v->GPUVMEnable == true && v->HostVMEnable == true) {
+		HostVMInefficiencyFactor = v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData / v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly;
+		HostVMDynamicLevelsTrips = v->HostVMMaxNonCachedPageTableLevels;
 	} else {
 		HostVMInefficiencyFactor = 1;
 		HostVMDynamicLevelsTrips = 0;
 	}
 
 	CalculateDynamicMetadataParameters(
-			MaxInterDCNTileRepeaters,
+			v->MaxInterDCNTileRepeaters,
 			myPipe->DPPCLK,
 			myPipe->DISPCLK,
 			myPipe->DCFCLKDeepSleep,
 			myPipe->PixelClock,
 			myPipe->HTotal,
 			myPipe->VBlank,
-			DynamicMetadataTransmittedBytes,
-			DynamicMetadataLinesBeforeActiveRequired,
+			v->DynamicMetadataTransmittedBytes[k],
+			v->DynamicMetadataLinesBeforeActiveRequired[k],
 			myPipe->InterlaceEnable,
-			ProgressiveToInterlaceUnitInOPP,
+			v->ProgressiveToInterlaceUnitInOPP,
 			&Tsetup,
 			&Tdmbf,
 			&Tdmec,
@@ -932,16 +877,16 @@ static bool CalculatePrefetchSchedule(
 
 	LineTime = myPipe->HTotal / myPipe->PixelClock;
 	trip_to_mem = UrgentLatency;
-	Tvm_trips = UrgentExtraLatency + trip_to_mem * (GPUVMPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1);
+	Tvm_trips = UrgentExtraLatency + trip_to_mem * (v->GPUVMMaxPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1);
 
-	if (DynamicMetadataVMEnabled == true && GPUVMEnable == true) {
-		*Tdmdl = TWait + Tvm_trips + trip_to_mem;
+	if (v->DynamicMetadataVMEnabled == true && v->GPUVMEnable == true) {
+		v->Tdmdl[k] = TWait + Tvm_trips + trip_to_mem;
 	} else {
-		*Tdmdl = TWait + UrgentExtraLatency;
+		v->Tdmdl[k] = TWait + UrgentExtraLatency;
 	}
 
-	if (DynamicMetadataEnable == true) {
-		if (VStartup * LineTime < Tsetup + *Tdmdl + Tdmbf + Tdmec + Tdmsks) {
+	if (v->DynamicMetadataEnable[k] == true) {
+		if (VStartup * LineTime < Tsetup + v->Tdmdl[k] + Tdmbf + Tdmec + Tdmsks) {
 			*NotEnoughTimeForDynamicMetadata = true;
 		} else {
 			*NotEnoughTimeForDynamicMetadata = false;
@@ -949,39 +894,39 @@ static bool CalculatePrefetchSchedule(
 			dml_print("DML: Tdmbf: %fus - time for dmd transfer from dchub to dio output buffer\n", Tdmbf);
 			dml_print("DML: Tdmec: %fus - time dio takes to transfer dmd\n", Tdmec);
 			dml_print("DML: Tdmsks: %fus - time before active dmd must complete transmission at dio\n", Tdmsks);
-			dml_print("DML: Tdmdl: %fus - time for fabric to become ready and fetch dmd \n", *Tdmdl);
+			dml_print("DML: Tdmdl: %fus - time for fabric to become ready and fetch dmd \n", v->Tdmdl[k]);
 		}
 	} else {
 		*NotEnoughTimeForDynamicMetadata = false;
 	}
 
-	*Tdmdl_vm = (DynamicMetadataEnable == true && DynamicMetadataVMEnabled == true && GPUVMEnable == true ? TWait + Tvm_trips : 0);
+	v->Tdmdl_vm[k] = (v->DynamicMetadataEnable[k] == true && v->DynamicMetadataVMEnabled == true && v->GPUVMEnable == true ? TWait + Tvm_trips : 0);
 
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
 
 	if (myPipe->DPPCLK == 0.0 || myPipe->DISPCLK == 0.0)
 		return true;
 
-	*DSTXAfterScaler = DPPCycles * myPipe->PixelClock / myPipe->DPPCLK + DISPCLKCycles * myPipe->PixelClock / myPipe->DISPCLK
+	v->DSTXAfterScaler[k] = DPPCycles * myPipe->PixelClock / myPipe->DPPCLK + DISPCLKCycles * myPipe->PixelClock / myPipe->DISPCLK
 			+ DSCDelay;
 
-	*DSTXAfterScaler = *DSTXAfterScaler + ((myPipe->ODMCombineEnabled)?18:0) + (myPipe->DPPPerPlane - 1) * DPP_RECOUT_WIDTH;
+	v->DSTXAfterScaler[k] = v->DSTXAfterScaler[k] + ((myPipe->ODMCombineEnabled)?18:0) + (myPipe->DPPPerPlane - 1) * DPP_RECOUT_WIDTH;
 
-	if (OutputFormat == dm_420 || (myPipe->InterlaceEnable && ProgressiveToInterlaceUnitInOPP))
-		*DSTYAfterScaler = 1;
+	if (v->OutputFormat[k] == dm_420 || (myPipe->InterlaceEnable && v->ProgressiveToInterlaceUnitInOPP))
+		v->DSTYAfterScaler[k] = 1;
 	else
-		*DSTYAfterScaler = 0;
+		v->DSTYAfterScaler[k] = 0;
 
-	DSTTotalPixelsAfterScaler = *DSTYAfterScaler * myPipe->HTotal + *DSTXAfterScaler;
-	*DSTYAfterScaler = dml_floor(DSTTotalPixelsAfterScaler / myPipe->HTotal, 1);
-	*DSTXAfterScaler = DSTTotalPixelsAfterScaler - ((double) (*DSTYAfterScaler * myPipe->HTotal));
+	DSTTotalPixelsAfterScaler = v->DSTYAfterScaler[k] * myPipe->HTotal + v->DSTXAfterScaler[k];
+	v->DSTYAfterScaler[k] = dml_floor(DSTTotalPixelsAfterScaler / myPipe->HTotal, 1);
+	v->DSTXAfterScaler[k] = DSTTotalPixelsAfterScaler - ((double) (v->DSTYAfterScaler[k] * myPipe->HTotal));
 
 	MyError = false;
 
@@ -990,33 +935,33 @@ static bool CalculatePrefetchSchedule(
 	Tvm_trips_rounded = dml_ceil(4.0 * Tvm_trips / LineTime, 1) / 4 * LineTime;
 	Tr0_trips_rounded = dml_ceil(4.0 * Tr0_trips / LineTime, 1) / 4 * LineTime;
 
-	if (GPUVMEnable) {
-		if (GPUVMPageTableLevels >= 3) {
-			*Tno_bw = UrgentExtraLatency + trip_to_mem * ((GPUVMPageTableLevels - 2) - 1);
+	if (v->GPUVMEnable) {
+		if (v->GPUVMMaxPageTableLevels >= 3) {
+			v->Tno_bw[k] = UrgentExtraLatency + trip_to_mem * ((v->GPUVMMaxPageTableLevels - 2) - 1);
 		} else
-			*Tno_bw = 0;
+			v->Tno_bw[k] = 0;
 	} else if (!myPipe->DCCEnable)
-		*Tno_bw = LineTime;
+		v->Tno_bw[k] = LineTime;
 	else
-		*Tno_bw = LineTime / 4;
+		v->Tno_bw[k] = LineTime / 4;
 
-	dst_y_prefetch_equ = VStartup - (Tsetup + dml_max(TWait + TCalc, *Tdmdl)) / LineTime
-			- (*DSTYAfterScaler + *DSTXAfterScaler / myPipe->HTotal);
+	dst_y_prefetch_equ = VStartup - (Tsetup + dml_max(TWait + TCalc, v->Tdmdl[k])) / LineTime
+			- (v->DSTYAfterScaler[k] + v->DSTXAfterScaler[k] / myPipe->HTotal);
 	dst_y_prefetch_equ = dml_min(dst_y_prefetch_equ, 63.75); // limit to the reg limit of U6.2 for DST_Y_PREFETCH
 
 	Lsw_oto = dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC);
 	Tsw_oto = Lsw_oto * LineTime;
 
-	prefetch_bw_oto = (PrefetchSourceLinesY * swath_width_luma_ub * BytePerPixelY + PrefetchSourceLinesC * swath_width_chroma_ub * BytePerPixelC) / Tsw_oto;
+	prefetch_bw_oto = (PrefetchSourceLinesY * swath_width_luma_ub * BytePerPixelY + PrefetchSourceLinesC * swath_width_chroma_ub * v->BytePerPixelC[k]) / Tsw_oto;
 
-	if (GPUVMEnable == true) {
-		Tvm_oto = dml_max3(*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / prefetch_bw_oto,
+	if (v->GPUVMEnable == true) {
+		Tvm_oto = dml_max3(v->Tno_bw[k] + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / prefetch_bw_oto,
 				Tvm_trips,
 				LineTime / 4.0);
 	} else
 		Tvm_oto = LineTime / 4.0;
 
-	if ((GPUVMEnable == true || myPipe->DCCEnable == true)) {
+	if ((v->GPUVMEnable == true || myPipe->DCCEnable == true)) {
 		Tr0_oto = dml_max3(
 				(MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / prefetch_bw_oto,
 				LineTime - Tvm_oto, LineTime / 4);
@@ -1042,10 +987,10 @@ static bool CalculatePrefetchSchedule(
 	dml_print("DML: Tdmbf: %fus - time for dmd transfer from dchub to dio output buffer\n", Tdmbf);
 	dml_print("DML: Tdmec: %fus - time dio takes to transfer dmd\n", Tdmec);
 	dml_print("DML: Tdmsks: %fus - time before active dmd must complete transmission at dio\n", Tdmsks);
-	dml_print("DML: Tdmdl_vm: %fus - time for vm stages of dmd \n", *Tdmdl_vm);
-	dml_print("DML: Tdmdl: %fus - time for fabric to become ready and fetch dmd \n", *Tdmdl);
-	dml_print("DML: dst_x_after_scl: %f pixels - number of pixel clocks pipeline and buffer delay after scaler \n", *DSTXAfterScaler);
-	dml_print("DML: dst_y_after_scl: %d lines - number of lines of pipeline and buffer delay after scaler \n", (int)*DSTYAfterScaler);
+	dml_print("DML: Tdmdl_vm: %fus - time for vm stages of dmd \n", v->Tdmdl_vm[k]);
+	dml_print("DML: Tdmdl: %fus - time for fabric to become ready and fetch dmd \n", v->Tdmdl[k]);
+	dml_print("DML: dst_x_after_scl: %f pixels - number of pixel clocks pipeline and buffer delay after scaler \n", v->DSTXAfterScaler[k]);
+	dml_print("DML: dst_y_after_scl: %d lines - number of lines of pipeline and buffer delay after scaler \n", (int)v->DSTYAfterScaler[k]);
 
 	*PrefetchBandwidth = 0;
 	*DestinationLinesToRequestVMInVBlank = 0;
@@ -1059,26 +1004,26 @@ static bool CalculatePrefetchSchedule(
 		double PrefetchBandwidth3 = 0;
 		double PrefetchBandwidth4 = 0;
 
-		if (Tpre_rounded - *Tno_bw > 0)
+		if (Tpre_rounded - v->Tno_bw[k] > 0)
 			PrefetchBandwidth1 = (PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor + 2 * MetaRowByte
 					+ 2 * PixelPTEBytesPerRow * HostVMInefficiencyFactor
 					+ PrefetchSourceLinesY * swath_width_luma_ub * BytePerPixelY
-					+ PrefetchSourceLinesC * swath_width_chroma_ub * BytePerPixelC)
-					/ (Tpre_rounded - *Tno_bw);
+					+ PrefetchSourceLinesC * swath_width_chroma_ub * v->BytePerPixelC[k])
+					/ (Tpre_rounded - v->Tno_bw[k]);
 		else
 			PrefetchBandwidth1 = 0;
 
-		if (VStartup == MaxVStartup && (PrefetchBandwidth1 > 4 * prefetch_bw_oto) && (Tpre_rounded - Tsw_oto / 4 - 0.75 * LineTime - *Tno_bw) > 0) {
-			PrefetchBandwidth1 = (PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor + 2 * MetaRowByte + 2 * PixelPTEBytesPerRow * HostVMInefficiencyFactor) / (Tpre_rounded - Tsw_oto / 4 - 0.75 * LineTime - *Tno_bw);
+		if (VStartup == MaxVStartup && (PrefetchBandwidth1 > 4 * prefetch_bw_oto) && (Tpre_rounded - Tsw_oto / 4 - 0.75 * LineTime - v->Tno_bw[k]) > 0) {
+			PrefetchBandwidth1 = (PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor + 2 * MetaRowByte + 2 * PixelPTEBytesPerRow * HostVMInefficiencyFactor) / (Tpre_rounded - Tsw_oto / 4 - 0.75 * LineTime - v->Tno_bw[k]);
 		}
 
-		if (Tpre_rounded - *Tno_bw - 2 * Tr0_trips_rounded > 0)
+		if (Tpre_rounded - v->Tno_bw[k] - 2 * Tr0_trips_rounded > 0)
 			PrefetchBandwidth2 = (PDEAndMetaPTEBytesFrame *
 					HostVMInefficiencyFactor + PrefetchSourceLinesY *
 					swath_width_luma_ub * BytePerPixelY +
 					PrefetchSourceLinesC * swath_width_chroma_ub *
-					BytePerPixelC) /
-					(Tpre_rounded - *Tno_bw - 2 * Tr0_trips_rounded);
+					v->BytePerPixelC[k]) /
+					(Tpre_rounded - v->Tno_bw[k] - 2 * Tr0_trips_rounded);
 		else
 			PrefetchBandwidth2 = 0;
 
@@ -1086,7 +1031,7 @@ static bool CalculatePrefetchSchedule(
 			PrefetchBandwidth3 = (2 * MetaRowByte + 2 * PixelPTEBytesPerRow *
 					HostVMInefficiencyFactor + PrefetchSourceLinesY *
 					swath_width_luma_ub * BytePerPixelY + PrefetchSourceLinesC *
-					swath_width_chroma_ub * BytePerPixelC) / (Tpre_rounded -
+					swath_width_chroma_ub * v->BytePerPixelC[k]) / (Tpre_rounded -
 					Tvm_trips_rounded);
 		else
 			PrefetchBandwidth3 = 0;
@@ -1096,7 +1041,7 @@ static bool CalculatePrefetchSchedule(
 		}
 
 		if (Tpre_rounded - Tvm_trips_rounded - 2 * Tr0_trips_rounded > 0)
-			PrefetchBandwidth4 = (PrefetchSourceLinesY * swath_width_luma_ub * BytePerPixelY + PrefetchSourceLinesC * swath_width_chroma_ub * BytePerPixelC)
+			PrefetchBandwidth4 = (PrefetchSourceLinesY * swath_width_luma_ub * BytePerPixelY + PrefetchSourceLinesC * swath_width_chroma_ub * v->BytePerPixelC[k])
 					/ (Tpre_rounded - Tvm_trips_rounded - 2 * Tr0_trips_rounded);
 		else
 			PrefetchBandwidth4 = 0;
@@ -1107,7 +1052,7 @@ static bool CalculatePrefetchSchedule(
 			bool Case3OK;
 
 			if (PrefetchBandwidth1 > 0) {
-				if (*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth1
+				if (v->Tno_bw[k] + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth1
 						>= Tvm_trips_rounded && (MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / PrefetchBandwidth1 >= Tr0_trips_rounded) {
 					Case1OK = true;
 				} else {
@@ -1118,7 +1063,7 @@ static bool CalculatePrefetchSchedule(
 			}
 
 			if (PrefetchBandwidth2 > 0) {
-				if (*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth2
+				if (v->Tno_bw[k] + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth2
 						>= Tvm_trips_rounded && (MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / PrefetchBandwidth2 < Tr0_trips_rounded) {
 					Case2OK = true;
 				} else {
@@ -1129,7 +1074,7 @@ static bool CalculatePrefetchSchedule(
 			}
 
 			if (PrefetchBandwidth3 > 0) {
-				if (*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth3
+				if (v->Tno_bw[k] + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / PrefetchBandwidth3
 						< Tvm_trips_rounded && (MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / PrefetchBandwidth3 >= Tr0_trips_rounded) {
 					Case3OK = true;
 				} else {
@@ -1152,13 +1097,13 @@ static bool CalculatePrefetchSchedule(
 			dml_print("DML: prefetch_bw_equ: %f\n", prefetch_bw_equ);
 
 			if (prefetch_bw_equ > 0) {
-				if (GPUVMEnable) {
-					Tvm_equ = dml_max3(*Tno_bw + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / prefetch_bw_equ, Tvm_trips, LineTime / 4);
+				if (v->GPUVMEnable) {
+					Tvm_equ = dml_max3(v->Tno_bw[k] + PDEAndMetaPTEBytesFrame * HostVMInefficiencyFactor / prefetch_bw_equ, Tvm_trips, LineTime / 4);
 				} else {
 					Tvm_equ = LineTime / 4;
 				}
 
-				if ((GPUVMEnable || myPipe->DCCEnable)) {
+				if ((v->GPUVMEnable || myPipe->DCCEnable)) {
 					Tr0_equ = dml_max4(
 							(MetaRowByte + PixelPTEBytesPerRow * HostVMInefficiencyFactor) / prefetch_bw_equ,
 							Tr0_trips,
@@ -1227,7 +1172,7 @@ static bool CalculatePrefetchSchedule(
 			}
 
 			*RequiredPrefetchPixDataBWLuma = (double) PrefetchSourceLinesY / LinesToRequestPrefetchPixelData * BytePerPixelY * swath_width_luma_ub / LineTime;
-			*RequiredPrefetchPixDataBWChroma = (double) PrefetchSourceLinesC / LinesToRequestPrefetchPixelData * BytePerPixelC * swath_width_chroma_ub / LineTime;
+			*RequiredPrefetchPixDataBWChroma = (double) PrefetchSourceLinesC / LinesToRequestPrefetchPixelData * v->BytePerPixelC[k] * swath_width_chroma_ub / LineTime;
 		} else {
 			MyError = true;
 			dml_print("DML: MyErr set %s:%d\n", __FILE__, __LINE__);
@@ -1243,9 +1188,9 @@ static bool CalculatePrefetchSchedule(
 		dml_print("DML:  Tr0: %fus - time to fetch first row of data pagetables and first row of meta data (done in parallel)\n", TimeForFetchingRowInVBlank);
 		dml_print("DML:  Tr1: %fus - time to fetch second row of data pagetables and second row of meta data (done in parallel)\n", TimeForFetchingRowInVBlank);
 		dml_print("DML:  Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)LinesToRequestPrefetchPixelData * LineTime);
-		dml_print("DML: To: %fus - time for propagation from scaler to optc\n", (*DSTYAfterScaler + ((*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime);
+		dml_print("DML: To: %fus - time for propagation from scaler to optc\n", (v->DSTYAfterScaler[k] + ((v->DSTXAfterScaler[k]) / (double) myPipe->HTotal)) * LineTime);
 		dml_print("DML: Tvstartup - Tsetup - Tcalc - Twait - Tpre - To > 0\n");
-		dml_print("DML: Tslack(pre): %fus - time left over in schedule\n", VStartup * LineTime - TimeForFetchingMetaPTE - 2 * TimeForFetchingRowInVBlank - (*DSTYAfterScaler + ((*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime - TWait - TCalc - Tsetup);
+		dml_print("DML: Tslack(pre): %fus - time left over in schedule\n", VStartup * LineTime - TimeForFetchingMetaPTE - 2 * TimeForFetchingRowInVBlank - (v->DSTYAfterScaler[k] + ((v->DSTXAfterScaler[k]) / (double) myPipe->HTotal)) * LineTime - TWait - TCalc - Tsetup);
 		dml_print("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %d\n", PixelPTEBytesPerRow);
 
 	} else {
@@ -1276,7 +1221,7 @@ static bool CalculatePrefetchSchedule(
 			dml_print("DML: MyErr set %s:%d\n", __FILE__, __LINE__);
 		}
 
-		*prefetch_vmrow_bw = dml_max(prefetch_vm_bw, prefetch_row_bw);
+		v->prefetch_vmrow_bw[k] = dml_max(prefetch_vm_bw, prefetch_row_bw);
 	}
 
 	if (MyError) {
@@ -2437,30 +2382,12 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 			v->ErrorResult[k] = CalculatePrefetchSchedule(
 					mode_lib,
-					v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
-					v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+					k,
 					&myPipe,
 					v->DSCDelay[k],
-					v->DPPCLKDelaySubtotal
-							+ v->DPPCLKDelayCNVCFormater,
-					v->DPPCLKDelaySCL,
-					v->DPPCLKDelaySCLLBOnly,
-					v->DPPCLKDelayCNVCCursor,
-					v->DISPCLKDelaySubtotal,
 					(unsigned int) (v->SwathWidthY[k] / v->HRatio[k]),
-					v->OutputFormat[k],
-					v->MaxInterDCNTileRepeaters,
 					dml_min(v->VStartupLines, v->MaxVStartupLines[k]),
 					v->MaxVStartupLines[k],
-					v->GPUVMMaxPageTableLevels,
-					v->GPUVMEnable,
-					v->HostVMEnable,
-					v->HostVMMaxNonCachedPageTableLevels,
-					v->HostVMMinPageSize,
-					v->DynamicMetadataEnable[k],
-					v->DynamicMetadataVMEnabled,
-					v->DynamicMetadataLinesBeforeActiveRequired[k],
-					v->DynamicMetadataTransmittedBytes[k],
 					v->UrgentLatency,
 					v->UrgentExtraLatency,
 					v->TCalc,
@@ -2474,7 +2401,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 					v->MaxNumSwathY[k],
 					v->PrefetchSourceLinesC[k],
 					v->SwathWidthC[k],
-					v->BytePerPixelC[k],
 					v->VInitPreFillC[k],
 					v->MaxNumSwathC[k],
 					v->swath_width_luma_ub[k],
@@ -2482,9 +2408,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 					v->SwathHeightY[k],
 					v->SwathHeightC[k],
 					TWait,
-					v->ProgressiveToInterlaceUnitInOPP,
-					&v->DSTXAfterScaler[k],
-					&v->DSTYAfterScaler[k],
 					&v->DestinationLinesForPrefetch[k],
 					&v->PrefetchBandwidth[k],
 					&v->DestinationLinesToRequestVMInVBlank[k],
@@ -2493,14 +2416,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 					&v->VRatioPrefetchC[k],
 					&v->RequiredPrefetchPixDataBWLuma[k],
 					&v->RequiredPrefetchPixDataBWChroma[k],
-					&v->NotEnoughTimeForDynamicMetadata[k],
-					&v->Tno_bw[k],
-					&v->prefetch_vmrow_bw[k],
-					&v->Tdmdl_vm[k],
-					&v->Tdmdl[k],
-					&v->VUpdateOffsetPix[k],
-					&v->VUpdateWidthPix[k],
-					&v->VReadyOffsetPix[k]);
+					&v->NotEnoughTimeForDynamicMetadata[k]);
 			if (v->BlendingAndTiming[k] == k) {
 				double TotalRepeaterDelayTime = v->MaxInterDCNTileRepeaters * (2 / v->DPPCLK[k] + 3 / v->DISPCLK);
 				v->VUpdateWidthPix[k] = (14 / v->DCFCLKDeepSleep + 12 / v->DPPCLK[k] + TotalRepeaterDelayTime) * v->PixelClock[k];
@@ -4770,29 +4686,12 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 
 					v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
 							mode_lib,
-							v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
-							v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
+							k,
 							&myPipe,
 							v->DSCDelayPerState[i][k],
-							v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
-							v->DPPCLKDelaySCL,
-							v->DPPCLKDelaySCLLBOnly,
-							v->DPPCLKDelayCNVCCursor,
-							v->DISPCLKDelaySubtotal,
 							v->SwathWidthYThisState[k] / v->HRatio[k],
-							v->OutputFormat[k],
-							v->MaxInterDCNTileRepeaters,
 							dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
 							v->MaximumVStartup[i][j][k],
-							v->GPUVMMaxPageTableLevels,
-							v->GPUVMEnable,
-							v->HostVMEnable,
-							v->HostVMMaxNonCachedPageTableLevels,
-							v->HostVMMinPageSize,
-							v->DynamicMetadataEnable[k],
-							v->DynamicMetadataVMEnabled,
-							v->DynamicMetadataLinesBeforeActiveRequired[k],
-							v->DynamicMetadataTransmittedBytes[k],
 							v->UrgLatency[i],
 							v->ExtraLatency,
 							v->TimeCalc,
@@ -4806,7 +4705,6 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							v->MaxNumSwY[k],
 							v->PrefetchLinesC[i][j][k],
 							v->SwathWidthCThisState[k],
-							v->BytePerPixelC[k],
 							v->PrefillC[k],
 							v->MaxNumSwC[k],
 							v->swath_width_luma_ub_this_state[k],
@@ -4814,9 +4712,6 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							v->SwathHeightYThisState[k],
 							v->SwathHeightCThisState[k],
 							v->TWait,
-							v->ProgressiveToInterlaceUnitInOPP,
-							&v->DSTXAfterScaler[k],
-							&v->DSTYAfterScaler[k],
 							&v->LineTimesForPrefetch[k],
 							&v->PrefetchBW[k],
 							&v->LinesForMetaPTE[k],
@@ -4825,14 +4720,7 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							&v->VRatioPreC[i][j][k],
 							&v->RequiredPrefetchPixelDataBWLuma[i][j][k],
 							&v->RequiredPrefetchPixelDataBWChroma[i][j][k],
-							&v->NoTimeForDynamicMetadata[i][j][k],
-							&v->Tno_bw[k],
-							&v->prefetch_vmrow_bw[k],
-							&v->Tdmdl_vm[k],
-							&v->Tdmdl[k],
-							&v->VUpdateOffsetPix[k],
-							&v->VUpdateWidthPix[k],
-							&v->VReadyOffsetPix[k]);
+							&v->NoTimeForDynamicMetadata[i][j][k]);
 				}
 
 				for (k = 0; k <= v->NumberOfActivePlanes - 1; k++) {

-- 
2.52.0

