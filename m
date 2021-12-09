Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58A46F003
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA9210E368;
	Thu,  9 Dec 2021 16:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42F0289CDD;
 Thu,  9 Dec 2021 16:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0BF772020C7;
 Thu,  9 Dec 2021 17:46:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id a9ZTL7EtT3jl; Thu,  9 Dec 2021 17:46:45 +0100 (CET)
Received: from kaveri (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 26FC82020B9;
 Thu,  9 Dec 2021 17:46:45 +0100 (CET)
Received: from daenzer by kaveri with local (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1mvMZA-006nzx-K3;
 Thu, 09 Dec 2021 17:46:44 +0100
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: [PATCH 1/2] drm/amd/display: Reduce stack size for
 dml31_ModeSupportAndSystemConfigurationFull
Date: Thu,  9 Dec 2021 17:46:43 +0100
Message-Id: <20211209164644.1622152-1-michel@daenzer.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michel Dänzer <mdaenzer@redhat.com>

Move code using the Pipe struct to a new helper function.

Works around[0] this warning (resulting in failure to build a RHEL debug
kernel with Werror enabled):

../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c: In function ‘dml31_ModeSupportAndSystemConfigurationFull’:
../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:5740:1: warning: the frame size of 2144 bytes is larger than 2048 bytes [-Wframe-larger-than=]

The culprit seems to be the Pipe struct, so pull the relevant block out
into its own sub-function. (This is porting
a62427ef9b55 "drm/amd/display: Reduce stack size for dml21_ModeSupportAndSystemConfigurationFull"
from dml31 to dml21)

[0] AFAICT this doesn't actually reduce the total amount of stack which
can be used, just moves some of it from
dml31_ModeSupportAndSystemConfigurationFull to the new helper function,
so the former happens to no longer exceed the limit for a single
function.

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 .../dc/dml/dcn31/display_mode_vba_31.c        | 185 ++++++++++--------
 1 file changed, 99 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 7e937bdcea00..8965f9af9d0a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -3949,6 +3949,102 @@ static double TruncToValidBPP(
 	return BPP_INVALID;
 }
 
+static noinline void CalculatePrefetchSchedulePerPlane(
+		struct display_mode_lib *mode_lib,
+		double HostVMInefficiencyFactor,
+		int i,
+		unsigned j,
+		unsigned k)
+{
+	struct vba_vars_st *v = &mode_lib->vba;
+	Pipe myPipe;
+
+	myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
+	myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
+	myPipe.PixelClock = v->PixelClock[k];
+	myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
+	myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
+	myPipe.ScalerEnabled = v->ScalerEnabled[k];
+	myPipe.SourceScan = v->SourceScan[k];
+	myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
+	myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
+	myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
+	myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
+	myPipe.InterlaceEnable = v->Interlace[k];
+	myPipe.NumberOfCursors = v->NumberOfCursors[k];
+	myPipe.VBlank = v->VTotal[k] - v->VActive[k];
+	myPipe.HTotal = v->HTotal[k];
+	myPipe.DCCEnable = v->DCCEnable[k];
+	myPipe.ODMCombineIsEnabled = v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
+		|| v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1;
+	myPipe.SourcePixelFormat = v->SourcePixelFormat[k];
+	myPipe.BytePerPixelY = v->BytePerPixelY[k];
+	myPipe.BytePerPixelC = v->BytePerPixelC[k];
+	myPipe.ProgressiveToInterlaceUnitInOPP = v->ProgressiveToInterlaceUnitInOPP;
+	v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
+		mode_lib,
+		HostVMInefficiencyFactor,
+		&myPipe,
+		v->DSCDelayPerState[i][k],
+		v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
+		v->DPPCLKDelaySCL,
+		v->DPPCLKDelaySCLLBOnly,
+		v->DPPCLKDelayCNVCCursor,
+		v->DISPCLKDelaySubtotal,
+		v->SwathWidthYThisState[k] / v->HRatio[k],
+		v->OutputFormat[k],
+		v->MaxInterDCNTileRepeaters,
+		dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
+		v->MaximumVStartup[i][j][k],
+		v->GPUVMMaxPageTableLevels,
+		v->GPUVMEnable,
+		v->HostVMEnable,
+		v->HostVMMaxNonCachedPageTableLevels,
+		v->HostVMMinPageSize,
+		v->DynamicMetadataEnable[k],
+		v->DynamicMetadataVMEnabled,
+		v->DynamicMetadataLinesBeforeActiveRequired[k],
+		v->DynamicMetadataTransmittedBytes[k],
+		v->UrgLatency[i],
+		v->ExtraLatency,
+		v->TimeCalc,
+		v->PDEAndMetaPTEBytesPerFrame[i][j][k],
+		v->MetaRowBytes[i][j][k],
+		v->DPTEBytesPerRow[i][j][k],
+		v->PrefetchLinesY[i][j][k],
+		v->SwathWidthYThisState[k],
+		v->PrefillY[k],
+		v->MaxNumSwY[k],
+		v->PrefetchLinesC[i][j][k],
+		v->SwathWidthCThisState[k],
+		v->PrefillC[k],
+		v->MaxNumSwC[k],
+		v->swath_width_luma_ub_this_state[k],
+		v->swath_width_chroma_ub_this_state[k],
+		v->SwathHeightYThisState[k],
+		v->SwathHeightCThisState[k],
+		v->TWait,
+		&v->DSTXAfterScaler[k],
+		&v->DSTYAfterScaler[k],
+		&v->LineTimesForPrefetch[k],
+		&v->PrefetchBW[k],
+		&v->LinesForMetaPTE[k],
+		&v->LinesForMetaAndDPTERow[k],
+		&v->VRatioPreY[i][j][k],
+		&v->VRatioPreC[i][j][k],
+		&v->RequiredPrefetchPixelDataBWLuma[i][j][k],
+		&v->RequiredPrefetchPixelDataBWChroma[i][j][k],
+		&v->NoTimeForDynamicMetadata[i][j][k],
+		&v->Tno_bw[k],
+		&v->prefetch_vmrow_bw[k],
+		&v->dummy7[k],
+		&v->dummy8[k],
+		&v->dummy13[k],
+		&v->VUpdateOffsetPix[k],
+		&v->VUpdateWidthPix[k],
+		&v->VReadyOffsetPix[k]);
+}
+
 void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
 {
 	struct vba_vars_st *v = &mode_lib->vba;
@@ -5276,92 +5372,9 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 						v->SREnterPlusExitTime);
 
 				for (k = 0; k < v->NumberOfActivePlanes; k++) {
-					Pipe myPipe;
-
-					myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
-					myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
-					myPipe.PixelClock = v->PixelClock[k];
-					myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
-					myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
-					myPipe.ScalerEnabled = v->ScalerEnabled[k];
-					myPipe.SourceScan = v->SourceScan[k];
-					myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
-					myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
-					myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
-					myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
-					myPipe.InterlaceEnable = v->Interlace[k];
-					myPipe.NumberOfCursors = v->NumberOfCursors[k];
-					myPipe.VBlank = v->VTotal[k] - v->VActive[k];
-					myPipe.HTotal = v->HTotal[k];
-					myPipe.DCCEnable = v->DCCEnable[k];
-					myPipe.ODMCombineIsEnabled = v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
-							|| v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1;
-					myPipe.SourcePixelFormat = v->SourcePixelFormat[k];
-					myPipe.BytePerPixelY = v->BytePerPixelY[k];
-					myPipe.BytePerPixelC = v->BytePerPixelC[k];
-					myPipe.ProgressiveToInterlaceUnitInOPP = v->ProgressiveToInterlaceUnitInOPP;
-					v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
-							mode_lib,
-							HostVMInefficiencyFactor,
-							&myPipe,
-							v->DSCDelayPerState[i][k],
-							v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
-							v->DPPCLKDelaySCL,
-							v->DPPCLKDelaySCLLBOnly,
-							v->DPPCLKDelayCNVCCursor,
-							v->DISPCLKDelaySubtotal,
-							v->SwathWidthYThisState[k] / v->HRatio[k],
-							v->OutputFormat[k],
-							v->MaxInterDCNTileRepeaters,
-							dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
-							v->MaximumVStartup[i][j][k],
-							v->GPUVMMaxPageTableLevels,
-							v->GPUVMEnable,
-							v->HostVMEnable,
-							v->HostVMMaxNonCachedPageTableLevels,
-							v->HostVMMinPageSize,
-							v->DynamicMetadataEnable[k],
-							v->DynamicMetadataVMEnabled,
-							v->DynamicMetadataLinesBeforeActiveRequired[k],
-							v->DynamicMetadataTransmittedBytes[k],
-							v->UrgLatency[i],
-							v->ExtraLatency,
-							v->TimeCalc,
-							v->PDEAndMetaPTEBytesPerFrame[i][j][k],
-							v->MetaRowBytes[i][j][k],
-							v->DPTEBytesPerRow[i][j][k],
-							v->PrefetchLinesY[i][j][k],
-							v->SwathWidthYThisState[k],
-							v->PrefillY[k],
-							v->MaxNumSwY[k],
-							v->PrefetchLinesC[i][j][k],
-							v->SwathWidthCThisState[k],
-							v->PrefillC[k],
-							v->MaxNumSwC[k],
-							v->swath_width_luma_ub_this_state[k],
-							v->swath_width_chroma_ub_this_state[k],
-							v->SwathHeightYThisState[k],
-							v->SwathHeightCThisState[k],
-							v->TWait,
-							&v->DSTXAfterScaler[k],
-							&v->DSTYAfterScaler[k],
-							&v->LineTimesForPrefetch[k],
-							&v->PrefetchBW[k],
-							&v->LinesForMetaPTE[k],
-							&v->LinesForMetaAndDPTERow[k],
-							&v->VRatioPreY[i][j][k],
-							&v->VRatioPreC[i][j][k],
-							&v->RequiredPrefetchPixelDataBWLuma[i][j][k],
-							&v->RequiredPrefetchPixelDataBWChroma[i][j][k],
-							&v->NoTimeForDynamicMetadata[i][j][k],
-							&v->Tno_bw[k],
-							&v->prefetch_vmrow_bw[k],
-							&v->dummy7[k],
-							&v->dummy8[k],
-							&v->dummy13[k],
-							&v->VUpdateOffsetPix[k],
-							&v->VUpdateWidthPix[k],
-							&v->VReadyOffsetPix[k]);
+					CalculatePrefetchSchedulePerPlane(mode_lib,
+									  HostVMInefficiencyFactor,
+									  i, j,	k);
 				}
 
 				for (k = 0; k < v->NumberOfActivePlanes; k++) {
-- 
2.34.1

