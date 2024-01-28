Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B899183F66B
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 17:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9DA1126DF;
	Sun, 28 Jan 2024 16:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CB11126DD;
 Sun, 28 Jan 2024 16:13:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D8DC61BAC;
 Sun, 28 Jan 2024 16:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6670C43390;
 Sun, 28 Jan 2024 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706458354;
 bh=XogrSb56wrP2lpzrqP5IohghA7bapdB86jrpjZwKRcE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b94lOI4zS2TD6GL+WF/+FXqyDI3lc7qH1vd0vzrBOmAf5Qmm0Nr9eNdZw2yEUx/Lo
 boUV7miiNEQG1tC+Czfcb2qecI7VC/+y8RKr/EsbwMc1nUepibyOzOrjqu3CaF6IYV
 AAHo6UfBGCZJB/GFrEUUSspLvhcfalxiUU4RdHYRmOnjHWzkfBUgDFh6rb1KxNVasd
 GfajZVQEx2ZtvpU9to3ZeMSUgAMJAt4sLBH5/iOuextcAh8namqZHID6/hclnJZNzF
 QsxNTP4sGFVv6FLUuQJkLdqXmB2jKIThnaKvt+FWT94u7gw5NedETAk4TU1jVBqD3v
 lLHPVA3o1YZDw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 27/39] Revert "drm/amd/display: Fix conversions
 between bytes and KB"
Date: Sun, 28 Jan 2024 11:10:47 -0500
Message-ID: <20240128161130.200783-27-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161130.200783-1-sashal@kernel.org>
References: <20240128161130.200783-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.2
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Miess <daniel.miess@amd.com>,
 josip.pavic@amd.com, Charlene Liu <charlene.liu@amd.com>, sunpeng.li@amd.com,
 airlied@gmail.com, Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, syed.hassan@amd.com, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, Roman.Li@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Miess <daniel.miess@amd.com>

[ Upstream commit bf282eb92b84709d99186ad5940b9997eb3c1ff2 ]

This reverts commit d0f639c5869399bf6dde4d694d5f8c0ab8c0ec46.

The previous commit causes failure to light up for 1080p
eDP + 8k HDMI panel combo.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Daniel Miess <daniel.miess@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/dml2/display_mode_core.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index b95bf27f2fe2..a6b938a12de1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -6229,7 +6229,7 @@ static void set_calculate_prefetch_schedule_params(struct display_mode_lib_st *m
 				CalculatePrefetchSchedule_params->GPUVMEnable = mode_lib->ms.cache_display_cfg.plane.GPUVMEnable;
 				CalculatePrefetchSchedule_params->HostVMEnable = mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
 				CalculatePrefetchSchedule_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
-				CalculatePrefetchSchedule_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
+				CalculatePrefetchSchedule_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes * 1024;
 				CalculatePrefetchSchedule_params->DynamicMetadataEnable = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataEnable[k];
 				CalculatePrefetchSchedule_params->DynamicMetadataVMEnabled = mode_lib->ms.ip.dynamic_metadata_vm_enabled;
 				CalculatePrefetchSchedule_params->DynamicMetadataLinesBeforeActiveRequired = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataLinesBeforeActiveRequired[k];
@@ -6329,7 +6329,7 @@ static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
 				mode_lib->ms.NoOfDPPThisState,
 				mode_lib->ms.dpte_group_bytes,
 				s->HostVMInefficiencyFactor,
-				mode_lib->ms.soc.hostvm_min_page_size_kbytes,
+				mode_lib->ms.soc.hostvm_min_page_size_kbytes * 1024,
 				mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels);
 
 		s->NextMaxVStartup = s->MaxVStartupAllPlanes[j];
@@ -6542,7 +6542,7 @@ static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
 						mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
 						mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels,
 						mode_lib->ms.cache_display_cfg.plane.GPUVMEnable,
-						mode_lib->ms.soc.hostvm_min_page_size_kbytes,
+						mode_lib->ms.soc.hostvm_min_page_size_kbytes * 1024,
 						mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k],
 						mode_lib->ms.MetaRowBytes[j][k],
 						mode_lib->ms.DPTEBytesPerRow[j][k],
@@ -7687,7 +7687,7 @@ dml_bool_t dml_core_mode_support(struct display_mode_lib_st *mode_lib)
 		CalculateVMRowAndSwath_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
 		CalculateVMRowAndSwath_params->GPUVMMaxPageTableLevels = mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels;
 		CalculateVMRowAndSwath_params->GPUVMMinPageSizeKBytes = mode_lib->ms.cache_display_cfg.plane.GPUVMMinPageSizeKBytes;
-		CalculateVMRowAndSwath_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
+		CalculateVMRowAndSwath_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes * 1024;
 		CalculateVMRowAndSwath_params->PTEBufferModeOverrideEn = mode_lib->ms.cache_display_cfg.plane.PTEBufferModeOverrideEn;
 		CalculateVMRowAndSwath_params->PTEBufferModeOverrideVal = mode_lib->ms.cache_display_cfg.plane.PTEBufferMode;
 		CalculateVMRowAndSwath_params->PTEBufferSizeNotExceeded = mode_lib->ms.PTEBufferSizeNotExceededPerState;
@@ -7957,7 +7957,7 @@ dml_bool_t dml_core_mode_support(struct display_mode_lib_st *mode_lib)
 		UseMinimumDCFCLK_params->GPUVMMaxPageTableLevels = mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels;
 		UseMinimumDCFCLK_params->HostVMEnable = mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
 		UseMinimumDCFCLK_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
-		UseMinimumDCFCLK_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
+		UseMinimumDCFCLK_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes * 1024;
 		UseMinimumDCFCLK_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
 		UseMinimumDCFCLK_params->DynamicMetadataVMEnabled = mode_lib->ms.ip.dynamic_metadata_vm_enabled;
 		UseMinimumDCFCLK_params->ImmediateFlipRequirement = s->ImmediateFlipRequiredFinal;
@@ -8699,7 +8699,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 	CalculateVMRowAndSwath_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
 	CalculateVMRowAndSwath_params->GPUVMMaxPageTableLevels = mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels;
 	CalculateVMRowAndSwath_params->GPUVMMinPageSizeKBytes = mode_lib->ms.cache_display_cfg.plane.GPUVMMinPageSizeKBytes;
-	CalculateVMRowAndSwath_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
+	CalculateVMRowAndSwath_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes * 1024;
 	CalculateVMRowAndSwath_params->PTEBufferModeOverrideEn = mode_lib->ms.cache_display_cfg.plane.PTEBufferModeOverrideEn;
 	CalculateVMRowAndSwath_params->PTEBufferModeOverrideVal = mode_lib->ms.cache_display_cfg.plane.PTEBufferMode;
 	CalculateVMRowAndSwath_params->PTEBufferSizeNotExceeded = s->dummy_boolean_array[0];
@@ -8805,7 +8805,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 			mode_lib->ms.cache_display_cfg.hw.DPPPerSurface,
 			locals->dpte_group_bytes,
 			s->HostVMInefficiencyFactor,
-			mode_lib->ms.soc.hostvm_min_page_size_kbytes,
+			mode_lib->ms.soc.hostvm_min_page_size_kbytes * 1024,
 			mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels);
 
 	locals->TCalc = 24.0 / locals->DCFCLKDeepSleep;
@@ -8995,7 +8995,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 			CalculatePrefetchSchedule_params->GPUVMEnable = mode_lib->ms.cache_display_cfg.plane.GPUVMEnable;
 			CalculatePrefetchSchedule_params->HostVMEnable = mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
 			CalculatePrefetchSchedule_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
-			CalculatePrefetchSchedule_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
+			CalculatePrefetchSchedule_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes * 1024;
 			CalculatePrefetchSchedule_params->DynamicMetadataEnable = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataEnable[k];
 			CalculatePrefetchSchedule_params->DynamicMetadataVMEnabled = mode_lib->ms.ip.dynamic_metadata_vm_enabled;
 			CalculatePrefetchSchedule_params->DynamicMetadataLinesBeforeActiveRequired = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataLinesBeforeActiveRequired[k];
@@ -9240,7 +9240,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 						mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
 						mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels,
 						mode_lib->ms.cache_display_cfg.plane.GPUVMEnable,
-						mode_lib->ms.soc.hostvm_min_page_size_kbytes,
+						mode_lib->ms.soc.hostvm_min_page_size_kbytes * 1024,
 						locals->PDEAndMetaPTEBytesFrame[k],
 						locals->MetaRowByte[k],
 						locals->PixelPTEBytesPerRow[k],
-- 
2.43.0

