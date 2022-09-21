Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ADC5C02C3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892CB10E9C7;
	Wed, 21 Sep 2022 15:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F6010E9B6;
 Wed, 21 Sep 2022 15:54:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD9FBB830D9;
 Wed, 21 Sep 2022 15:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D71EC433D6;
 Wed, 21 Sep 2022 15:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663775662;
 bh=kdciQqLL5+YcG6bYcS7WbJQgVlTedWlujEX0Q5tDIyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DwfUT0vMO7diUudv+gETQ4zCqktj2ht0SZnRc4cTZEv40HAcK/yicUOoa7fbRuZfF
 hP4BI9pM4420WSCMIC9sBnAeMXC3Ywp5O2zlNDo5UQwv7S+NV5h6hueelJqYZRop5L
 qvpiHPdZ7bcHSdtCcZbvR6/tUnLf8XgxhlUq+xMceZmTS7ea8Pf0M6n1wrE7eKBnXh
 V/5f4G+BQ3VHb/EZlL3XviK8HtWIN+M+AK66KOGckXeYyno21gfGQZoeQISvDVJEyy
 81RKeqr4ms7evkQ484bUeYoDgr2EYQFvYypzBuDAsiZcROpkViTmDRx8WkVmfQPi4N
 +amWYxEUHhUwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/10] drm/amd/display: Reduce number of
 arguments of dml31's CalculateFlipSchedule()
Date: Wed, 21 Sep 2022 11:54:05 -0400
Message-Id: <20220921155407.235132-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155407.235132-1-sashal@kernel.org>
References: <20220921155407.235132-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: airlied@linux.ie, llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>, mdaenzer@redhat.com,
 Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, chaitanya.dhere@amd.com, sunpeng.li@amd.com,
 Nathan Chancellor <nathan@kernel.org>,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>,
 Xinhui.Pan@amd.com, ndesaulniers@google.com, nicholas.kazlauskas@amd.com,
 Dmytro.Laktyushkin@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 21485d3da659b66c37d99071623af83ee1c6733d ]

Most of the arguments are identical between the two call sites and they
can be accessed through the 'struct vba_vars_st' pointer. This reduces
the total amount of stack space that
dml31_ModeSupportAndSystemConfigurationFull() uses by 112 bytes with
LLVM 16 (1976 -> 1864), helping clear up the following clang warning:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3908:6: error: stack frame size (2216) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
  void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
      ^
  1 error generated.

Link: https://github.com/ClangBuiltLinux/linux/issues/1681
Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Tested-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/dml/dcn31/display_mode_vba_31.c        | 172 +++++-------------
 1 file changed, 47 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index a6ce22d23b26..aa0507e01792 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -259,33 +259,13 @@ static void CalculateRowBandwidth(
 
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
@@ -2923,33 +2903,13 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
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
@@ -3669,61 +3629,43 @@ static void CalculateRowBandwidth(
 
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
@@ -3732,54 +3674,54 @@ static void CalculateFlipSchedule(
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
@@ -5405,33 +5347,13 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
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
2.35.1

