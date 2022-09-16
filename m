Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3199B5BB3D3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 23:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAD610EDA9;
	Fri, 16 Sep 2022 21:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E8810EDA4;
 Fri, 16 Sep 2022 21:07:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 388DDB822FF;
 Fri, 16 Sep 2022 21:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F833C433B5;
 Fri, 16 Sep 2022 21:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663362428;
 bh=T9AV1SHDuLI4RTvWihFeMmckohdx2y3VF5VDfyqcdwg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZVodxiBls5fbufmR7/UdJsNxddHJexxyDEq3f/1QxBC6JnY3aj8biz8dkwzh4alPp
 19ACNihIx0EF1Vx5Q0mSAyn0DnlxZ1Moi4M0ekcCN5tZynnrqJuHIt3I4BVK7ef+2O
 dvwopF0v+moFA3fCf4q4fbvkop/p757h1deGz/SkJghmm/dJjPdyalsFRN9gViSH3I
 vn7sI156YQEvLaAFmSV4oZvZ9AGxbO7jEzW7cifMk58eEJaCp0B/WGVXqQFIYgBGlL
 nJhNHEzHlaxUORFb7CFW1nwDrPsxJUtWTAI3S0hyYbQSX0qjHNZHolkqWdtoRv71vq
 rZ9tbyC4q4Jlw==
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH 2/2] drm/amd/display: Reduce number of arguments of dml314's
 CalculateFlipSchedule()
Date: Fri, 16 Sep 2022 14:06:58 -0700
Message-Id: <20220916210658.3412450-2-nathan@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220916210658.3412450-1-nathan@kernel.org>
References: <20220916210658.3412450-1-nathan@kernel.org>
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
Cc: "kernelci.org bot" <bot@kernelci.org>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of the arguments are identical between the two call sites and they
can be accessed through the 'struct vba_vars_st' pointer. This reduces
the total amount of stack space that
dml314_ModeSupportAndSystemConfigurationFull() uses by 112 bytes with
LLVM 16 (1976 -> 1864), helping clear up the following clang warning:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:4020:6: error: stack frame size (2216) exceeds limit (2048) in 'dml314_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
  void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
       ^
  1 error generated.

Link: https://github.com/ClangBuiltLinux/linux/issues/1710
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

This is just commit 1dbec5b4b0ef ("drm/amd/display: Reduce number of
arguments of dml31's CalculateFlipSchedule()") applied to dml314.

 .../dc/dml/dcn314/display_mode_vba_314.c      | 172 +++++-------------
 1 file changed, 47 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 32ceb72f7a14..e4dfa714207a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -265,33 +265,13 @@ static void CalculateRowBandwidth(
 
 static void CalculateFlipSchedule(
 		struct display_mode_lib *mode_lib,
+		unsigned int k,
 		double HostVMInefficiencyFactor,
 		double UrgentExtraLatency,
 		double UrgentLatency,
-		unsigned int GPUVMMaxPageTableLevels,
-		bool HostVMEnable,
-		unsigned int HostVMMaxNonCachedPageTableLevels,
-		bool GPUVMEnable,
-		double HostVMMinPageSize,
 		double PDEAndMetaPTEBytesPerFrame,
 		double MetaRowBytes,
-		double DPTEBytesPerRow,
-		double BandwidthAvailableForImmediateFlip,
-		unsigned int TotImmediateFlipBytes,
-		enum source_format_class SourcePixelFormat,
-		double LineTime,
-		double VRatio,
-		double VRatioChroma,
-		double Tno_bw,
-		bool DCCEnable,
-		unsigned int dpte_row_height,
-		unsigned int meta_row_height,
-		unsigned int dpte_row_height_chroma,
-		unsigned int meta_row_height_chroma,
-		double *DestinationLinesToRequestVMInImmediateFlip,
-		double *DestinationLinesToRequestRowInImmediateFlip,
-		double *final_flip_bw,
-		bool *ImmediateFlipSupportedForPipe);
+		double DPTEBytesPerRow);
 static double CalculateWriteBackDelay(
 		enum source_format_class WritebackPixelFormat,
 		double WritebackHRatio,
@@ -2892,33 +2872,13 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 				CalculateFlipSchedule(
 						mode_lib,
+						k,
 						HostVMInefficiencyFactor,
 						v->UrgentExtraLatency,
 						v->UrgentLatency,
-						v->GPUVMMaxPageTableLevels,
-						v->HostVMEnable,
-						v->HostVMMaxNonCachedPageTableLevels,
-						v->GPUVMEnable,
-						v->HostVMMinPageSize,
 						v->PDEAndMetaPTEBytesFrame[k],
 						v->MetaRowByte[k],
-						v->PixelPTEBytesPerRow[k],
-						v->BandwidthAvailableForImmediateFlip,
-						v->TotImmediateFlipBytes,
-						v->SourcePixelFormat[k],
-						v->HTotal[k] / v->PixelClock[k],
-						v->VRatio[k],
-						v->VRatioChroma[k],
-						v->Tno_bw[k],
-						v->DCCEnable[k],
-						v->dpte_row_height[k],
-						v->meta_row_height[k],
-						v->dpte_row_height_chroma[k],
-						v->meta_row_height_chroma[k],
-						&v->DestinationLinesToRequestVMInImmediateFlip[k],
-						&v->DestinationLinesToRequestRowInImmediateFlip[k],
-						&v->final_flip_bw[k],
-						&v->ImmediateFlipSupportedForPipe[k]);
+						v->PixelPTEBytesPerRow[k]);
 			}
 
 			v->total_dcn_read_bw_with_flip = 0.0;
@@ -3638,61 +3598,43 @@ static void CalculateRowBandwidth(
 
 static void CalculateFlipSchedule(
 		struct display_mode_lib *mode_lib,
+		unsigned int k,
 		double HostVMInefficiencyFactor,
 		double UrgentExtraLatency,
 		double UrgentLatency,
-		unsigned int GPUVMMaxPageTableLevels,
-		bool HostVMEnable,
-		unsigned int HostVMMaxNonCachedPageTableLevels,
-		bool GPUVMEnable,
-		double HostVMMinPageSize,
 		double PDEAndMetaPTEBytesPerFrame,
 		double MetaRowBytes,
-		double DPTEBytesPerRow,
-		double BandwidthAvailableForImmediateFlip,
-		unsigned int TotImmediateFlipBytes,
-		enum source_format_class SourcePixelFormat,
-		double LineTime,
-		double VRatio,
-		double VRatioChroma,
-		double Tno_bw,
-		bool DCCEnable,
-		unsigned int dpte_row_height,
-		unsigned int meta_row_height,
-		unsigned int dpte_row_height_chroma,
-		unsigned int meta_row_height_chroma,
-		double *DestinationLinesToRequestVMInImmediateFlip,
-		double *DestinationLinesToRequestRowInImmediateFlip,
-		double *final_flip_bw,
-		bool *ImmediateFlipSupportedForPipe)
+		double DPTEBytesPerRow)
 {
+	struct vba_vars_st *v = &mode_lib->vba;
 	double min_row_time = 0.0;
 	unsigned int HostVMDynamicLevelsTrips;
 	double TimeForFetchingMetaPTEImmediateFlip;
 	double TimeForFetchingRowInVBlankImmediateFlip;
 	double ImmediateFlipBW;
+	double LineTime = v->HTotal[k] / v->PixelClock[k];
 
-	if (GPUVMEnable == true && HostVMEnable == true) {
-		HostVMDynamicLevelsTrips = HostVMMaxNonCachedPageTableLevels;
+	if (v->GPUVMEnable == true && v->HostVMEnable == true) {
+		HostVMDynamicLevelsTrips = v->HostVMMaxNonCachedPageTableLevels;
 	} else {
 		HostVMDynamicLevelsTrips = 0;
 	}
 
-	if (GPUVMEnable == true || DCCEnable == true) {
-		ImmediateFlipBW = (PDEAndMetaPTEBytesPerFrame + MetaRowBytes + DPTEBytesPerRow) * BandwidthAvailableForImmediateFlip / TotImmediateFlipBytes;
+	if (v->GPUVMEnable == true || v->DCCEnable[k] == true) {
+		ImmediateFlipBW = (PDEAndMetaPTEBytesPerFrame + MetaRowBytes + DPTEBytesPerRow) * v->BandwidthAvailableForImmediateFlip / v->TotImmediateFlipBytes;
 	}
 
-	if (GPUVMEnable == true) {
+	if (v->GPUVMEnable == true) {
 		TimeForFetchingMetaPTEImmediateFlip = dml_max3(
-				Tno_bw + PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor / ImmediateFlipBW,
-				UrgentExtraLatency + UrgentLatency * (GPUVMMaxPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1),
+				v->Tno_bw[k] + PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor / ImmediateFlipBW,
+				UrgentExtraLatency + UrgentLatency * (v->GPUVMMaxPageTableLevels * (HostVMDynamicLevelsTrips + 1) - 1),
 				LineTime / 4.0);
 	} else {
 		TimeForFetchingMetaPTEImmediateFlip = 0;
 	}
 
-	*DestinationLinesToRequestVMInImmediateFlip = dml_ceil(4.0 * (TimeForFetchingMetaPTEImmediateFlip / LineTime), 1) / 4.0;
-	if ((GPUVMEnable == true || DCCEnable == true)) {
+	v->DestinationLinesToRequestVMInImmediateFlip[k] = dml_ceil(4.0 * (TimeForFetchingMetaPTEImmediateFlip / LineTime), 1) / 4.0;
+	if ((v->GPUVMEnable == true || v->DCCEnable[k] == true)) {
 		TimeForFetchingRowInVBlankImmediateFlip = dml_max3(
 				(MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / ImmediateFlipBW,
 				UrgentLatency * (HostVMDynamicLevelsTrips + 1),
@@ -3701,54 +3643,54 @@ static void CalculateFlipSchedule(
 		TimeForFetchingRowInVBlankImmediateFlip = 0;
 	}
 
-	*DestinationLinesToRequestRowInImmediateFlip = dml_ceil(4.0 * (TimeForFetchingRowInVBlankImmediateFlip / LineTime), 1) / 4.0;
+	v->DestinationLinesToRequestRowInImmediateFlip[k] = dml_ceil(4.0 * (TimeForFetchingRowInVBlankImmediateFlip / LineTime), 1) / 4.0;
 
-	if (GPUVMEnable == true) {
-		*final_flip_bw = dml_max(
-				PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor / (*DestinationLinesToRequestVMInImmediateFlip * LineTime),
-				(MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / (*DestinationLinesToRequestRowInImmediateFlip * LineTime));
-	} else if ((GPUVMEnable == true || DCCEnable == true)) {
-		*final_flip_bw = (MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / (*DestinationLinesToRequestRowInImmediateFlip * LineTime);
+	if (v->GPUVMEnable == true) {
+		v->final_flip_bw[k] = dml_max(
+				PDEAndMetaPTEBytesPerFrame * HostVMInefficiencyFactor / (v->DestinationLinesToRequestVMInImmediateFlip[k] * LineTime),
+				(MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / (v->DestinationLinesToRequestRowInImmediateFlip[k] * LineTime));
+	} else if ((v->GPUVMEnable == true || v->DCCEnable[k] == true)) {
+		v->final_flip_bw[k] = (MetaRowBytes + DPTEBytesPerRow * HostVMInefficiencyFactor) / (v->DestinationLinesToRequestRowInImmediateFlip[k] * LineTime);
 	} else {
-		*final_flip_bw = 0;
+		v->final_flip_bw[k] = 0;
 	}
 
-	if (SourcePixelFormat == dm_420_8 || SourcePixelFormat == dm_420_10 || SourcePixelFormat == dm_rgbe_alpha) {
-		if (GPUVMEnable == true && DCCEnable != true) {
-			min_row_time = dml_min(dpte_row_height * LineTime / VRatio, dpte_row_height_chroma * LineTime / VRatioChroma);
-		} else if (GPUVMEnable != true && DCCEnable == true) {
-			min_row_time = dml_min(meta_row_height * LineTime / VRatio, meta_row_height_chroma * LineTime / VRatioChroma);
+	if (v->SourcePixelFormat[k] == dm_420_8 || v->SourcePixelFormat[k] == dm_420_10 || v->SourcePixelFormat[k] == dm_rgbe_alpha) {
+		if (v->GPUVMEnable == true && v->DCCEnable[k] != true) {
+			min_row_time = dml_min(v->dpte_row_height[k] * LineTime / v->VRatio[k], v->dpte_row_height_chroma[k] * LineTime / v->VRatioChroma[k]);
+		} else if (v->GPUVMEnable != true && v->DCCEnable[k] == true) {
+			min_row_time = dml_min(v->meta_row_height[k] * LineTime / v->VRatio[k], v->meta_row_height_chroma[k] * LineTime / v->VRatioChroma[k]);
 		} else {
 			min_row_time = dml_min4(
-					dpte_row_height * LineTime / VRatio,
-					meta_row_height * LineTime / VRatio,
-					dpte_row_height_chroma * LineTime / VRatioChroma,
-					meta_row_height_chroma * LineTime / VRatioChroma);
+					v->dpte_row_height[k] * LineTime / v->VRatio[k],
+					v->meta_row_height[k] * LineTime / v->VRatio[k],
+					v->dpte_row_height_chroma[k] * LineTime / v->VRatioChroma[k],
+					v->meta_row_height_chroma[k] * LineTime / v->VRatioChroma[k]);
 		}
 	} else {
-		if (GPUVMEnable == true && DCCEnable != true) {
-			min_row_time = dpte_row_height * LineTime / VRatio;
-		} else if (GPUVMEnable != true && DCCEnable == true) {
-			min_row_time = meta_row_height * LineTime / VRatio;
+		if (v->GPUVMEnable == true && v->DCCEnable[k] != true) {
+			min_row_time = v->dpte_row_height[k] * LineTime / v->VRatio[k];
+		} else if (v->GPUVMEnable != true && v->DCCEnable[k] == true) {
+			min_row_time = v->meta_row_height[k] * LineTime / v->VRatio[k];
 		} else {
-			min_row_time = dml_min(dpte_row_height * LineTime / VRatio, meta_row_height * LineTime / VRatio);
+			min_row_time = dml_min(v->dpte_row_height[k] * LineTime / v->VRatio[k], v->meta_row_height[k] * LineTime / v->VRatio[k]);
 		}
 	}
 
-	if (*DestinationLinesToRequestVMInImmediateFlip >= 32 || *DestinationLinesToRequestRowInImmediateFlip >= 16
+	if (v->DestinationLinesToRequestVMInImmediateFlip[k] >= 32 || v->DestinationLinesToRequestRowInImmediateFlip[k] >= 16
 			|| TimeForFetchingMetaPTEImmediateFlip + 2 * TimeForFetchingRowInVBlankImmediateFlip > min_row_time) {
-		*ImmediateFlipSupportedForPipe = false;
+		v->ImmediateFlipSupportedForPipe[k] = false;
 	} else {
-		*ImmediateFlipSupportedForPipe = true;
+		v->ImmediateFlipSupportedForPipe[k] = true;
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml_print("DML::%s: DestinationLinesToRequestVMInImmediateFlip = %f\n", __func__, *DestinationLinesToRequestVMInImmediateFlip);
-	dml_print("DML::%s: DestinationLinesToRequestRowInImmediateFlip = %f\n", __func__, *DestinationLinesToRequestRowInImmediateFlip);
+	dml_print("DML::%s: DestinationLinesToRequestVMInImmediateFlip = %f\n", __func__, v->DestinationLinesToRequestVMInImmediateFlip[k]);
+	dml_print("DML::%s: DestinationLinesToRequestRowInImmediateFlip = %f\n", __func__, v->DestinationLinesToRequestRowInImmediateFlip[k]);
 	dml_print("DML::%s: TimeForFetchingMetaPTEImmediateFlip = %f\n", __func__, TimeForFetchingMetaPTEImmediateFlip);
 	dml_print("DML::%s: TimeForFetchingRowInVBlankImmediateFlip = %f\n", __func__, TimeForFetchingRowInVBlankImmediateFlip);
 	dml_print("DML::%s: min_row_time = %f\n", __func__, min_row_time);
-	dml_print("DML::%s: ImmediateFlipSupportedForPipe = %d\n", __func__, *ImmediateFlipSupportedForPipe);
+	dml_print("DML::%s: ImmediateFlipSupportedForPipe = %d\n", __func__, v->ImmediateFlipSupportedForPipe[k]);
 #endif
 
 }
@@ -5340,33 +5282,13 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
 					for (k = 0; k < v->NumberOfActivePlanes; k++) {
 						CalculateFlipSchedule(
 								mode_lib,
+								k,
 								HostVMInefficiencyFactor,
 								v->ExtraLatency,
 								v->UrgLatency[i],
-								v->GPUVMMaxPageTableLevels,
-								v->HostVMEnable,
-								v->HostVMMaxNonCachedPageTableLevels,
-								v->GPUVMEnable,
-								v->HostVMMinPageSize,
 								v->PDEAndMetaPTEBytesPerFrame[i][j][k],
 								v->MetaRowBytes[i][j][k],
-								v->DPTEBytesPerRow[i][j][k],
-								v->BandwidthAvailableForImmediateFlip,
-								v->TotImmediateFlipBytes,
-								v->SourcePixelFormat[k],
-								v->HTotal[k] / v->PixelClock[k],
-								v->VRatio[k],
-								v->VRatioChroma[k],
-								v->Tno_bw[k],
-								v->DCCEnable[k],
-								v->dpte_row_height[k],
-								v->meta_row_height[k],
-								v->dpte_row_height_chroma[k],
-								v->meta_row_height_chroma[k],
-								&v->DestinationLinesToRequestVMInImmediateFlip[k],
-								&v->DestinationLinesToRequestRowInImmediateFlip[k],
-								&v->final_flip_bw[k],
-								&v->ImmediateFlipSupportedForPipe[k]);
+								v->DPTEBytesPerRow[i][j][k]);
 					}
 					v->total_dcn_read_bw_with_flip = 0.0;
 					for (k = 0; k < v->NumberOfActivePlanes; k++) {
-- 
2.37.3

