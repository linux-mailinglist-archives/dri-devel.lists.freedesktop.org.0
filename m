Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1293E907ECC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDC610EBD5;
	Thu, 13 Jun 2024 22:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L+eqP1Wv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F1E10EBD4;
 Thu, 13 Jun 2024 22:22:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 644C1CE2850;
 Thu, 13 Jun 2024 22:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FE7C4AF1D;
 Thu, 13 Jun 2024 22:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718317347;
 bh=gsgZp/zLQXxsLcsX0w48MzOQoXDTkmCaYS2BNRa1als=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L+eqP1WvbCJ6bhKZu5eLyfZI+3I4fLUT4ZDpy8W9siN3K+rSjo039WjcC4w0O8Gfi
 4TxlB1wA6bYVmGBynN2DP8WtUlMh6KmeKZNGhmkyxwtQLWJAsFPMox9Lkn+m6yfUwu
 Rtr9PxiuZoFxsWcVY9ZmnhttWPMkwzQBhDFIO2l0eABsMSIi6zmiw2DL6PzWF3JBom
 Ct3Vz+fYpRvOr0Q6xG3TqHMTzncTQpD5/YhWTpeYJHtcETo8cwAiP8w8TKkTBBl9fu
 EjjvVFy9VKPULlssPG8zW+b8KuqMeCsEoioChRbSwhPhHaPqQoBi6qhuEeN21pfe37
 Zn01C3VRdkrRA==
Date: Thu, 13 Jun 2024 15:22:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Qingqing.Zhuo@amd.com, hamza.mahfooz@amd.com, chenhuacai@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/amd/display: Increase frame-larger-than warning limit
Message-ID: <20240613222225.GA1849801@thelio-3990X>
References: <20240603222948.GB1802995@thelio-3990X>
 <mhng-f1fc5ef0-9e72-4b12-9a28-145bbc8938d8@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="o++ymzHvANt/v2PT"
Content-Disposition: inline
In-Reply-To: <mhng-f1fc5ef0-9e72-4b12-9a28-145bbc8938d8@palmer-ri-x1c9a>
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


--o++ymzHvANt/v2PT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Palmer (and AMD folks),

On Tue, Jun 04, 2024 at 09:04:23AM -0700, Palmer Dabbelt wrote:
> On Mon, 03 Jun 2024 15:29:48 PDT (-0700), nathan@kernel.org wrote:
> > On Thu, May 30, 2024 at 07:57:42AM -0700, Palmer Dabbelt wrote:
> > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > > 
> > > I get a handful of build errors along the lines of
> > > 
> > >     linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: error: stack frame size (2352) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Werror,-Wframe-larger-than]
> > >     static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
> > >                 ^
> > >     linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1724:6: error: stack frame size (2096) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> > >     void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
> > >          ^
> > 
> > Judging from the message, this is clang/LLVM? What version?
> 
> Yes, LLVM.  Looks like I'm on 16.0.6.  Probably time for an update, so I'll
> give it a shot.

FWIW, I can reproduce this with tip of tree, I was just curious in case
that ended up mattering.

> > I assume
> > this showed up in 6.10-rc1 because of commit 77acc6b55ae4 ("riscv: add
> > support for kernel-mode FPU"), which allows this driver to be built for
> > RISC-V.
> 
> Seems reasonable.  This didn't show up until post-merge, not 100% sure why.
> I didn't really dig any farther.

Perhaps you fast forwarded your tree to include that commit?

> > Is this allmodconfig or some other configuration?
> 
> IIRC both "allmodconfig" and "allyesconfig" show it, but I don't have a
> build tree sitting around to be 100% sure.

Yeah, allmodconfig triggers it.

I was able to come up with a "trivial" reproducer using cvise (attached
to this mail if you are curious) that has worse stack usage by a rough
factor of 2:

  $ clang --target=riscv64-linux-gnu -O2 -Wall -Wframe-larger-than=512 -c -o /dev/null display_mode_vba_32.i
  display_mode_vba_32.i:598:6: warning: stack frame size (1264) exceeds limit (512) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]
    598 | void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() {
        |      ^
  1 warning generated.

  $ riscv64-linux-gcc -O2 -Wall -Wframe-larger-than=512 -c -o /dev/null display_mode_vba_32.i
  display_mode_vba_32.i: In function 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation':
  display_mode_vba_32.i:1729:1: warning: the frame size of 528 bytes is larger than 512 bytes [-Wframe-larger-than=]
   1729 | }
        | ^

I have not done too much further investigation but this is almost
certainly the same issue that has come up before [1][2] with the AMD
display code using functions with a large number of parameters, such
that they have to passed on the stack, coupled with inlining (if I
remember correctly, LLVM gives more of an inlining discount the less a
function is used in a file).

While clang does poorly with that code, I am not interested in
continuing to fix this code new hardware revision after new hardware
revision. We could just avoid this code like we do for arm64 for a
similar reason:

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 5fcd4f778dc3..64df713df878 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && (!ARM64 || !CC_IS_CLANG)
+	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && (!(ARM64 || RISCV) || !CC_IS_CLANG)
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and

[1]: https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/
[2]: https://lore.kernel.org/20220830203409.3491379-1-nathan@kernel.org/

Cheers,
Nathan

--o++ymzHvANt/v2PT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="display_mode_vba_32.i"

enum { false, true };
enum output_encoder_class { dm_dp2p0 };
enum output_format_class { dm_420 };
enum source_format_class { dm_444_32 };
enum scan_direction_class { dm_vert };
enum dm_swizzle_mode { dm_sw_linear };
enum clock_change_support { dm_std_cvt };
enum odm_combine_mode { dm_odm_combine_mode_2to1dm_odm_combine_mode_4to1 };
enum immediate_flip_requirement { dm_immediate_flip_not_required };
enum unbounded_requesting_policy { dm_unbounded_requesting_disable };
enum dm_rotation_angle { dm_rotation_270m };
enum dm_use_mall_for_pstate_change_mode {
  dm_use_mall_pstate_change_phantom_pipe
};
enum dm_use_mall_for_static_screen_mode { dm_use_mall_static_screen_optimize };
enum dm_fclock_change_support { dm_fclock_change_unsupported };
enum dm_prefetch_modes { dm_prefetch_support_uclk_fclk_and_stutter };
struct _vcs_dpi_soc_bounding_box_st {
  int num_states;
};
struct _vcs_dpi_ip_params_st {
  int rob_buffer_size_kbytes;
  int pixel_chunk_size_kbytes;
  double dsc_delay_factor_wa;
};
typedef struct {
  double StutterEnterPlusExitWatermark;
} Watermarks;
typedef struct {
  double PixelClock;
} DmlPipe;
typedef struct {
} SOCParametersList;
struct
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation {
  int dummy_integer_array[2][8];
  double dummy_single_array[2][8];
  int dummy_long_array[2][8];
  double dummy_double_array[2][8];
  _Bool dummy_boolean_array[8];
  enum output_encoder_class dummy_output_encoder_array[8];
  DmlPipe SurfaceParameters[8];
  _Bool dummy_boolean_array2[2][8];
  double HostVMInefficiencyFactor;
  DmlPipe myPipe;
  SOCParametersList mmSOCParameters;
  double dummy_unit_vector[8];
  double dummy_single[2];
  enum clock_change_support dummy_dramchange_support;
  enum dm_fclock_change_support dummy_fclkchange_support;
  _Bool dummy_USRRetrainingSupport;
};
struct dml32_ModeSupportAndSystemConfigurationFull {
  int dummy_integer_array[22][8];
  double dummy_double_array[2][8];
  enum odm_combine_mode dummy_odm_mode[8];
};
struct dummy_vars {
  struct DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation;
  struct dml32_ModeSupportAndSystemConfigurationFull
      dml32_ModeSupportAndSystemConfigurationFull;
};
struct vba_vars_st {
  struct _vcs_dpi_ip_params_st ip;
  struct _vcs_dpi_soc_bounding_box_st soc;
  int maxMpcComb;
  double MaxVRatioPre;
  double WritebackDISPCLK;
  double GlobalDPPCLK;
  int TotalActiveDPP;
  int TotalDCCActiveDPP;
  double StutterPeriod;
  enum dm_prefetch_modes AllowForPStateChangeOrStutterInVBlankFinal;
  _Bool ImmediateFlipSupported;
  int VStartupLines;
  double ActiveDRAMClockChangeLatencyMargin[8];
  double SRExitTime;
  double SREnterPlusExitTime;
  double UrgentLatencyPixelDataOnly;
  double UrgentLatencyPixelMixedWithVMData;
  double UrgentLatencyVMDataOnly;
  double UrgentLatency;
  double FCLKChangeLatency;
  int MALLAllocatedForDCNFinal;
  double ReturnBusWidth;
  double DISPCLKDPPCLKDSCCLKDownSpreading;
  double DISPCLKDPPCLKVCOSpeed;
  double RoundTripPingLatencyCycles;
  double DRAMClockChangeLatency;
  int ROBBufferSizeInKByte;
  int DETBufferSizeInKByte[8];
  int PixelChunkSizeInKByte;
  double ReturnBW;
  int GPUVMMaxPageTableLevels;
  int MetaChunkSize;
  int MinMetaChunkSizeBytes;
  double MaxDCHUBToPSCLThroughput;
  double MaxPSCLToLBThroughput;
  int PTEBufferSizeInRequestsLuma;
  int PTEBufferSizeInRequestsChroma;
  double DISPCLKRampingMargin;
  int CompressedBufferSegmentSizeInkByteFinal;
  int CompbufReservedSpace64B;
  int CompbufReservedSpaceZs;
  int DCCMetaBufferSizeBytes;
  int VoltageLevel;
  double FabricClock;
  double DRAMSpeed;
  double SOCCLK;
  double DCFCLK;
  int MaxTotalDETInKByte;
  int MinCompressedBufferSizeInKByte;
  int NumberOfActiveSurfaces;
  _Bool ViewportStationary[8];
  int GPUVMMinPageSizeKBytes[8];
  int ViewportXStartY[8];
  int ViewportXStartC[8];
  enum dm_rotation_angle SourceRotation[8];
  int NumberOfDSCSlices[8];
  int ViewportWidth[8];
  int ViewportHeight[8];
  int ViewportYStartY[8];
  int ViewportYStartC[8];
  double HRatio[8];
  double VRatio[8];
  int htaps[8];
  int vtaps[8];
  int HTAPsChroma[8];
  int VTAPsChroma[8];
  int HTotal[8];
  int VTotal[8];
  int DPPPerPlane[8];
  double PixelClock[8];
  double PixelClockBackEnd[8];
  _Bool DCCEnable[8];
  int DCCMetaPitchY[8];
  int DCCMetaPitchC[8];
  enum scan_direction_class SourceScan[8];
  enum source_format_class SourcePixelFormat[8];
  _Bool WritebackEnable[8];
  double WritebackDestinationWidth[8];
  double WritebackDestinationHeight[8];
  double WritebackSourceHeight[8];
  enum source_format_class WritebackPixelFormat[8];
  double WritebackHRatio[8];
  double WritebackVRatio[8];
  int HActive[8];
  int VActive[8];
  _Bool Interlace[8];
  enum dm_swizzle_mode SurfaceTiling[8];
  enum odm_combine_mode ODMCombineEnabled[8];
  int DSCInputBitPerComponent[8];
  enum output_format_class OutputFormat[8];
  enum output_encoder_class Output[8];
  int BlendingAndTiming[8];
  int NumberOfCursors[8];
  unsigned CursorWidth[8][2];
  unsigned CursorBPP[8][2];
  _Bool DisableUnboundRequestIfCompBufReservedSpaceNeedAdjustment;
  int DETBufferSizeY[8];
  int DETBufferSizeC[8];
  int SwathHeightY[8];
  int SwathHeightC[8];
  double TotalDataReadBandwidth;
  double BandwidthAvailableForImmediateFlip;
  int PrefetchModePerState[40][2];
  int MinPrefetchMode;
  int MaxPrefetchMode;
  double StutterEfficiency;
  double StutterEfficiencyNotIncludingVBlank;
  Watermarks Watermark;
  _Bool DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE;
  double DISPCLK_calculated;
  _Bool Use_One_Row_For_Frame[8];
  _Bool Use_One_Row_For_Frame_Flip[8];
  int VUpdateOffsetPix[8];
  double VUpdateWidthPix[8];
  double VReadyOffsetPix[8];
  int TotImmediateFlipBytes;
  double TCalc;
  double MaxDppclk[40];
  double CursorBufferSize;
  double total_dcn_read_bw_with_flip;
  double FractionOfUrgentBandwidth;
  double FractionOfUrgentBandwidthImmediateFlip;
  int NoOfDPPThisState[8];
  double RequiredDPPCLKThisState[8];
  double MinDPPCLKUsingSingleDPP[8];
  double BytePerPixelInDETY[8];
  double BytePerPixelInDETC[8];
  double OutputBppPerState[40][8];
  int Read256BlockHeightY[8];
  int Read256BlockWidthY[8];
  int Read256BlockHeightC[8];
  int Read256BlockWidthC[8];
  double ReadBandwidthLuma[8];
  double ReadBandwidthChroma[8];
  double cursor_bw[8];
  double cursor_bw_pre[8];
  double Tno_bw[8];
  double prefetch_vmrow_bw[8];
  double DestinationLinesToRequestVMInImmediateFlip[8];
  double DestinationLinesToRequestRowInImmediateFlip[8];
  double final_flip_bw[8];
  double WritebackDelay[40][8];
  int vm_group_bytes[8];
  int dpte_group_bytes[8];
  int dpte_row_height[8];
  int meta_req_height[8];
  int meta_req_width[8];
  int meta_row_height[8];
  int meta_row_width[8];
  int dpte_row_height_chroma[8];
  int meta_req_height_chroma[8];
  int meta_req_width_chroma[8];
  int meta_row_height_chroma[8];
  int meta_row_width_chroma[8];
  double meta_row_bw[8];
  double dpte_row_bw[8];
  double DisplayPipeLineDeliveryTimeLuma[8];
  double DisplayPipeLineDeliveryTimeChroma[8];
  double DisplayPipeRequestDeliveryTimeLuma[8];
  double DisplayPipeRequestDeliveryTimeChroma[8];
  _Bool MPCCombine[0][2][8];
  double MaximumSwathWidthLuma[8];
  double MaximumSwathWidthChroma[8];
  double PrefetchBandwidth[8];
  double VInitPreFillY[8];
  double VInitPreFillC[8];
  int MaxNumSwathY[8];
  int MaxNumSwathC[8];
  int VStartup[8];
  double DSTYAfterScaler[8];
  double DSTXAfterScaler[8];
  double VRatioPrefetchY[8];
  double VRatioPrefetchC[8];
  double DestinationLinesForPrefetch[8];
  double DestinationLinesToRequestVMInVBlank[8];
  double DestinationLinesToRequestRowInVBlank[8];
  double MinTTUVBlank[8];
  double BytePerPixelDETY[8];
  double BytePerPixelDETC[8];
  double SwathWidthY[8];
  double SwathWidthSingleDPPY[8];
  double CursorRequestDeliveryTime[8];
  double CursorRequestDeliveryTimePrefetch[8];
  double DisplayPipeLineDeliveryTimeLumaPrefetch[8];
  double DisplayPipeLineDeliveryTimeChromaPrefetch[8];
  double DisplayPipeRequestDeliveryTimeLumaPrefetch[8];
  double DisplayPipeRequestDeliveryTimeChromaPrefetch[8];
  double PixelPTEBytesPerRow[8];
  double PDEAndMetaPTEBytesFrame[8];
  double MetaRowByte[8];
  double PrefetchSourceLinesY[8];
  double RequiredPrefetchPixDataBWLuma[8];
  double RequiredPrefetchPixDataBWChroma[8];
  double PrefetchSourceLinesC[8];
  double PSCL_THROUGHPUT_LUMA[8];
  double PSCL_THROUGHPUT_CHROMA[8];
  int DSCDelay[8];
  int MaxVStartupLines[8];
  double DPPCLKUsingSingleDPP[8];
  double DPPCLK[8];
  int DCCYMaxUncompressedBlock[8];
  int DCCYMaxCompressedBlock[8];
  int BlockHeight256BytesY[8];
  int BlockHeight256BytesC[8];
  int BlockWidth256BytesY[8];
  int BlockWidth256BytesC[8];
  int dpte_row_width_luma_ub[8];
  int dpte_row_width_chroma_ub[8];
  double DST_Y_PER_PTE_ROW_NOM_L[8];
  double DST_Y_PER_PTE_ROW_NOM_C[8];
  double DST_Y_PER_META_ROW_NOM_L[8];
  double TimePerMetaChunkNominal[8];
  double TimePerMetaChunkVBlank[8];
  double TimePerMetaChunkFlip[8];
  int swath_width_luma_ub[8];
  int swath_width_chroma_ub[8];
  int PixelPTEReqWidthY[8];
  int PixelPTEReqHeightY[8];
  int PTERequestSizeY[8];
  int PixelPTEReqWidthC[8];
  int PixelPTEReqHeightC[8];
  int PTERequestSizeC[8];
  double time_per_pte_group_nom_luma[8];
  double time_per_pte_group_nom_chroma[8];
  double time_per_pte_group_vblank_luma[8];
  double time_per_pte_group_vblank_chroma[8];
  double time_per_pte_group_flip_luma[8];
  double time_per_pte_group_flip_chroma[8];
  double TimePerVMGroupVBlank[8];
  double TimePerVMGroupFlip[8];
  double TimePerVMRequestVBlank[8];
  double TimePerVMRequestFlip[8];
  int dpde0_bytes_per_frame_ub_l[8];
  int meta_pte_bytes_per_frame_ub_l[8];
  int dpde0_bytes_per_frame_ub_c[8];
  int meta_pte_bytes_per_frame_ub_c[8];
  double SwathWidthSingleDPPC[8];
  double SwathWidthC[8];
  int BytePerPixelY[8];
  int BytePerPixelC[8];
  double Tdmdl_vm[8];
  double Tdmdl[8];
  double TSetup[8];
  double DST_Y_PER_META_ROW_NOM_C[8];
  double TimePerChromaMetaChunkNominal[8];
  double TimePerChromaMetaChunkVBlank[8];
  double TimePerChromaMetaChunkFlip[8];
  int DCCCMaxUncompressedBlock[8];
  int DCCCMaxCompressedBlock[8];
  _Bool DoUrgentLatencyAdjustment;
  double UrgentLatencyAdjustmentFabricClockComponent;
  double UrgentLatencyAdjustmentFabricClockReference;
  int ViewportWidthChroma[8];
  int ViewportHeightChroma[8];
  double HRatioChroma[8];
  double VRatioChroma[8];
  int WritebackSourceWidth[8];
  int SurfaceWidthY[8];
  int SurfaceWidthC[8];
  int SurfaceHeightY[8];
  int SurfaceHeightC[8];
  int WritebackHTaps[8];
  int WritebackVTaps[8];
  double HostVMMinPageSize;
  int HostVMMaxNonCachedPageTableLevels;
  double WritebackLineBufferSize;
  double DCCRateLuma[8];
  double DCCRateChroma[8];
  enum immediate_flip_requirement ImmediateFlipRequirement[8];
  _Bool NoUrgentLatencyHidingPre[8];
  int DCCYIndependentBlock[8];
  int DCCCIndependentBlock[8];
  double SRExitZ8Time;
  double Z8StutterEnterPlusExitWatermark;
  double Z8StutterEfficiencyNotIncludingVBlank;
  double Z8StutterEfficiency;
  double DCCFractionOfZeroSizeRequestsLuma[8];
  double DCCFractionOfZeroSizeRequestsChroma[8];
  double UrgBurstFactorCursor[8];
  double UrgBurstFactorLuma[8];
  double UrgBurstFactorChroma[8];
  double UrgBurstFactorCursorPre[8];
  double UrgBurstFactorLumaPre[8];
  double UrgBurstFactorChromaPre[8];
  int MIN_DST_Y_NEXT_START[8];
  int ConfigReturnBufferSizeInKByte;
  enum unbounded_requesting_policy UseUnboundedRequesting;
  int CompressedBufferSizeInkByte;
  int MetaFIFOSizeInKEntries;
  int ZeroSizeBufferEntries;
  int NumberOfStutterBurstsPerFrame;
  int Z8NumberOfStutterBurstsPerFrame;
  double ReadBandwidthSurfaceLuma[8];
  double ReadBandwidthSurfaceChroma[8];
  double MinActiveFCLKChangeLatencySupported;
  int CompressedBufferSizeInkByteAllStates[0][2];
  int SurfaceSizeInMALL[8];
  _Bool PTE_BUFFER_MODE[8];
  int BIGK_FRAGMENT_SIZE[8];
  enum dm_use_mall_for_pstate_change_mode UsesMALLForPStateChange[8];
  _Bool SingleDPPViewportSizeSupportPerSurface[8];
  enum dm_use_mall_for_static_screen_mode UseMALLForStaticScreen[8];
  int DETSizeOverride[8];
  int nomDETInKByte;
  int RequiredSlots[0][8];
  _Bool UsesMALLForStaticScreen[8];
  double MaxActiveDRAMClockChangeLatencySupported[8];
  int dpte_row_height_linear[8];
  int dpte_row_height_linear_chroma[8];
  int BlockHeightY[8];
  int BlockHeightC[8];
  int BlockWidthY[8];
  int BlockWidthC[8];
  int SubViewportLinesNeededInMALL[8];
  struct dummy_vars dummy_vars;
} dml32_ModeSupportAndSystemConfigurationFull_v;
struct {
  struct vba_vars_st vba;
} *DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
    dml32_ModeSupportAndSystemConfigurationFull_mode_lib;
double dml_max3_a, dml_max3_b, dml_max3_c, dml_max4_c, dml_max4_d,
    dml_floor_granularity,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_9,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_8,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_7,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_6,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_5,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_4,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_216_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_215_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_5,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_237_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_233_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_232_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_MaxTotalRDBandwidth,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_MaxTotalRDBandwidthNoUrgentBurst =
        0.0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_TWait,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_TotalWRBandwidth,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_WRBandwidth =
        0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_3;
_Bool
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_191_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_11,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_313_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_289_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_368_0_5,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_ImmediateFlipRequirementFinal,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_isInterlaceTiming,
    dml32_ModeSupportAndSystemConfigurationFull_v_368_1_2_1_0,
    dml32_ModeSupportAndSystemConfigurationFull_v_368_1_2_0_0,
    dml32_ModeSupportAndSystemConfigurationFull_CompBufReservedSpaceNeedAdjustment,
    dml32_ModeSupportAndSystemConfigurationFull_CompBufReservedSpaceNeedAdjustmentSingleDPP;
int DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_368_0_11,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_368_0_10,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_133,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_366_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_365_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_364_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_363_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_244_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_243_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_242_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_241_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_278_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_277_0,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_iteration,
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_NextPrefetchMode,
    dml32_ModeSupportAndSystemConfigurationFull_v_368_1_0_1_0,
    dml32_ModeSupportAndSystemConfigurationFull_v_368_1_0_0_0,
    dml32_ModeSupportAndSystemConfigurationFull_i,
    dml32_ModeSupportAndSystemConfigurationFull_j,
    dml32_ModeSupportAndSystemConfigurationFull_start_state,
    dml32_ModeSupportAndSystemConfigurationFull_k,
    dml32_ModeSupportAndSystemConfigurationFull_m,
    dml32_ModeSupportAndSystemConfigurationFull_MaximumMPCCombine,
    dml32_ModeSupportAndSystemConfigurationFull_NumberOfNonCombinedSurfaceOfMaximumBandwidth,
    dml32_ModeSupportAndSystemConfigurationFull_TotalSlots;
long
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___fortify_size =
        sizeof(DmlPipe);
float dcn_bw_min2();
double dml_min() { return dcn_bw_min2(); }
double dml_max(double a, double b) { return dcn_bw_min2(); }
double dml_max3() {
  double __trans_tmp_1 = dml_max3_b;
  return dml_max(__trans_tmp_1, dml_max3_c);
}
double dml_ceil(double a) { return a; }
double dml_floor(double a) { return dml_floor_granularity; }
void dml32_CalculateBytePerPixelAndBlockSizes(int *, int *, double *, double *,
                                              int *, int *, int *, int *, int *,
                                              int *, int *, int *);
void dml32_CalculateSinglePipeDPPCLKAndSCLThroughput(
    double, double, double, double, double, double, enum source_format_class,
    int, int, int, int, double *, double *, double *);
void dml32_CalculateSwathAndDETConfiguration(
    int[], enum dm_use_mall_for_pstate_change_mode[], int, int, int, double,
    int, int, enum unbounded_requesting_policy, _Bool, int, int, int,
    enum output_encoder_class[], double[], double[], double[], double[],
    enum dm_rotation_angle[], _Bool[], enum source_format_class[],
    enum dm_swizzle_mode[], int[], int[], int[], int[], int[], int[], int[],
    int[], int[], int[], int[], int[], int[], int[], enum odm_combine_mode[],
    int[], int[], int[], double[], double[], int[], double[], double[], int[],
    int[], int[], double[], double[], int[], int[], int[], int[], int[],
    _Bool *, int *, int *, _Bool *, _Bool[], _Bool *);
void dml32_CalculateSwathWidth(_Bool, int, enum source_format_class[],
                               enum dm_rotation_angle[], _Bool[], int[], int[],
                               int[], int[], int[], int[], int[], int[], int[],
                               int[], enum odm_combine_mode[], int[], int[],
                               int[], int[], int[], int[], int[], int[],
                               double[], int[], double[], double[], double[],
                               double[], int[], int[], int[], int[]);
double dml32_CalculateRequiredDispclk(enum odm_combine_mode, double, double,
                                      double, double, double);
void dml32_CalculateDPPCLK(int, double, double, double[], int[], double *,
                           double[]);
int dml32_DSCDelayRequirement(_Bool, enum odm_combine_mode, int, double, int,
                              int, int, enum output_format_class,
                              enum output_encoder_class, double, double,
                              double);
void dml32_CalculateSurfaceSizeInMall(int, int,
                                      enum dm_use_mall_for_static_screen_mode[],
                                      enum dm_use_mall_for_pstate_change_mode[],
                                      _Bool[], _Bool[], int[], int[], int[],
                                      int[], int[], int[], int[], int[], int[],
                                      int[], int[], int[], int[], int[], int[],
                                      int[], int[], int[], int[], int[], int[],
                                      int[], int[], int[], int[], _Bool *);
void dml32_CalculateVMRowAndSwath(
    int, DmlPipe[], int[], int, int, int,
    enum dm_use_mall_for_static_screen_mode[],
    enum dm_use_mall_for_pstate_change_mode[], int, double[], double[], _Bool,
    _Bool, int, int, int[], int, _Bool[], _Bool[], int[], int[], int[], int[],
    int[], int[], int[], int[], int[], int[], int[], int[], int[], int[], int[],
    int[], int[], int[], int[], int[], int[], int[], int[], int[], int[], int[],
    double[], double[], double[], double[], int[], int[], double[], double[],
    double[], double[], double[], _Bool[], _Bool[], _Bool[], _Bool[], int[]);
double dml32_CalculateUrgentLatency(double, double, double, _Bool, double,
                                    double, double);
void dml32_CalculateUrgentBurstFactor(enum dm_use_mall_for_pstate_change_mode,
                                      int, int, int, int, double, double,
                                      double, int, int, double, double, double,
                                      double, int, int, double *, double *,
                                      double *, _Bool *);
void dml32_CalculateDCFCLKDeepSleep(int, int[], int[], double[], double[],
                                    double[], double[], int[], double[],
                                    double[], double[], double[], double[],
                                    double[], double[], double[], int,
                                    double *);
double dml32_CalculateWriteBackDelay(enum source_format_class, double, double,
                                     int, int, int, int, int);
double dml32_CalculateTWait(int, enum dm_use_mall_for_pstate_change_mode, _Bool,
                            _Bool, double, double, double, double);
double dml32_get_return_bw_mbps_vm_only(struct _vcs_dpi_soc_bounding_box_st *,
                                        int, double, double, double);
double dml32_CalculateExtraLatency(int, int, double, int, int, int, int, double,
                                   _Bool, _Bool, int, int[], int[], double,
                                   double, int);
_Bool dml32_CalculatePrefetchSchedule(
    struct vba_vars_st *, int, double, DmlPipe *, int, int, int, int, double,
    double, double, int, int, int, double, int, int, int, double, int, int, int,
    int, int, int, int, double, double, _Bool, double *, double *, double *,
    double *, double *, double *, double *, double *, double *, double *,
    _Bool *, double *, double *, double *, double *, double *, int *, double *,
    double *);
void dml32_CalculateFlipSchedule(double, double, double, int, _Bool, int, _Bool,
                                 double, double, double, double, double, int,
                                 enum source_format_class, double, double,
                                 double, double, _Bool, int, int, int, int,
                                 _Bool, double *, double *, double *, _Bool *);
void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
    struct vba_vars_st *, int, double, double, SOCParametersList, double,
    double, int[], int[], int[], int[], double[], double[], int[], double[],
    double[], double[], double[], _Bool, int, enum clock_change_support *,
    double[], int[], enum dm_fclock_change_support *, double *, _Bool *,
    double[]);
double dml32_CalculateWriteBackDISPCLK(enum source_format_class, double, double,
                                       double, int, int, int, int, int, int,
                                       double);
void dml32_CalculateMinAndMaxPrefetchMode(enum dm_prefetch_modes, int *, int *);
void dml32_CalculatePixelDeliveryTimes(
    int, double[], double[], double[], double[], int[], int[], int[], double[],
    double[], double[], double[], double[], double[], int[],
    enum dm_rotation_angle[], int[], unsigned[][2], unsigned[][2], int[], int[],
    int[], int[], double[], double[], double[], double[], double[], double[],
    double[], double[], double[], double[]);
void dml32_CalculateMetaAndPTETimes(
    _Bool[], int, _Bool, int, int, int[], double[], double[], double[],
    double[], _Bool[], double[], int[], int[], enum dm_rotation_angle[], int[],
    int[], int[], int[], int[], int[], int[], int[], int[], int[], int[], int[],
    int[], int[], int[], int[], int[], int[], int[], double[], double[],
    double[], double[], double[], double[], double[], double[], double[],
    double[], double[], double[], double[], double[], double[], double[]);
void dml32_CalculateVMGroupAndRequestTimes(int, _Bool, int, int[], int[],
                                           double[], double[], _Bool[],
                                           double[], int[], int[], int[], int[],
                                           int[], int[], int[], double[],
                                           double[], double[], double[]);
void dml32_CalculateDCCConfiguration(_Bool, _Bool, enum source_format_class,
                                     int, int, int, int, int, int, int,
                                     enum dm_swizzle_mode, int, int, double,
                                     double, enum dm_rotation_angle, int *,
                                     int *, int *, int *, int *, int *);
void dml32_CalculateStutterEfficiency(
    int, enum dm_use_mall_for_pstate_change_mode[], _Bool, int, int, int, int,
    int, double, double, double, int, int, double, double, _Bool, int[], double,
    double, _Bool, _Bool[], double[], int[], int[], int[], double[], double[],
    int[], int[], double[], double[], double[], double[], int[], int[],
    double[], double[], enum dm_rotation_angle[], int[], int[], int[], int[],
    int[], int[], int[], _Bool[], _Bool[], double[], double[], double[],
    double[], double *, double *, int *, double *, double *, int *, double *,
    _Bool *);
void dml32_CalculatePrefetchBandwithSupport(
    int, double, _Bool[], double[], double[], double[], double[], double[],
    double[], double[], double[], double[], int[], double[], double[], double[],
    double[], double[], double[], double[], double[], double, double *,
    double *, _Bool *);
double dml32_CalculateBandwidthAvailableForImmediateFlip(
    int, double, double[], double[], double[], double[], double[], double[],
    int[], double[], double[], double[], double[], double[], double[]);
void dml32_CalculateImmediateFlipBandwithSupport(
    int, double, enum immediate_flip_requirement[], double[], double[],
    double[], double[], double[], double[], double[], double[], double[],
    double[], int[], double[], double[], double[], double[], double[], double[],
    double *, double *, _Bool *);
_Bool dml32_CalculateDETSwathFillLatencyHiding(
    int, double, double, int[], int[], int[], int[], double[], double[], int[],
    int[], int[], int[], double[], double[], double[],
    enum dm_use_mall_for_pstate_change_mode[],
    enum unbounded_requesting_policy);
void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() {
  struct vba_vars_st *v =
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
           ->vba;
  double v_176_0, v_175_0, v_325_0, v_324_0, v_323_0, v_127, v_126;
  _Bool v_312_0, v_368_0_6, v_337,
      DestinationLineTimesForPrefetchLessThan2 = false,
      VRatioPrefetchMoreThanMax = false;
  int v_334, k;
  for (k = 0; k; ++k) {
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_4 =
        dml32_CalculateWriteBackDISPCLK(
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.WritebackPixelFormat[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.PixelClock[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.WritebackHRatio[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.WritebackVRatio[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.WritebackHTaps[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.WritebackVTaps[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.WritebackSourceWidth[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.WritebackDestinationWidth[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.HTotal[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.WritebackLineBufferSize,
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.DISPCLKDPPCLKVCOSpeed);
  }
  {
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_5 =
        dml32_CalculateRequiredDispclk(
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.ODMCombineEnabled[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.PixelClock[k],
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.DISPCLKDPPCLKDSCCLKDownSpreading,
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.DISPCLKRampingMargin,
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.DISPCLKDPPCLKVCOSpeed,
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.MaxDppclk[v->soc.num_states]);
  }
  dml32_CalculateSinglePipeDPPCLKAndSCLThroughput(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HRatioChroma[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatio[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatioChroma[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.MaxDCHUBToPSCLThroughput,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.MaxPSCLToLBThroughput,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClock[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SourcePixelFormat[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.htaps[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HTAPsChroma[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.vtaps[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VTAPsChroma[k],
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_232_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_233_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_237_0);
  dml32_CalculateDPPCLK(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DISPCLKDPPCLKDSCCLKDownSpreading,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DISPCLKDPPCLKVCOSpeed,
      v->DPPCLKUsingSingleDPP,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DPPPerPlane,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_5,
      v->DPPCLK);
  dml32_CalculateBytePerPixelAndBlockSizes(
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_277_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_278_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_215_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_216_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_241_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_242_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_243_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_244_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_363_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_364_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_365_0,
      &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_366_0);
  dml32_CalculateSwathWidth(
      false,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SourcePixelFormat,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SourceRotation,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ViewportStationary,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ViewportWidth,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ViewportHeight,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ViewportXStartY,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ViewportYStartY,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ViewportXStartC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ViewportYStartC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SurfaceWidthY,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SurfaceWidthC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SurfaceHeightY,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SurfaceHeightC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ODMCombineEnabled,
      v->BytePerPixelY, v->BytePerPixelC, v->BlockHeight256BytesY,
      v->BlockHeight256BytesC, v->BlockWidth256BytesY, v->BlockWidth256BytesC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.BlendingAndTiming,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HActive,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HRatio,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DPPPerPlane,
      v->SwathWidthSingleDPPY, v->SwathWidthSingleDPPC, v->SwathWidthY,
      v->SwathWidthC,
      v->dummy_vars
          .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
          .dummy_integer_array[0],
      v->dummy_vars
          .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
          .dummy_integer_array[1],
      v->swath_width_luma_ub, v->swath_width_chroma_ub);
  for (
      ;
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces;
      ++DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.PixelClock[k])
    dml32_CalculateSwathAndDETConfiguration(
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DETSizeOverride,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.UsesMALLForPStateChange,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ConfigReturnBufferSizeInKByte,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.MaxTotalDETInKByte,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.MinCompressedBufferSizeInKByte,
        false,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.NumberOfActiveSurfaces,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.nomDETInKByte,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.UseUnboundedRequesting,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ip.pixel_chunk_size_kbytes,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ip.rob_buffer_size_kbytes,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.CompressedBufferSegmentSizeInkByteFinal,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_output_encoder_array,
        v->ReadBandwidthSurfaceLuma, v->ReadBandwidthSurfaceChroma,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_single_array[0],
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_single_array[1],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SourceRotation,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportStationary,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SourcePixelFormat,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SurfaceTiling,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportWidth,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportHeight,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportXStartY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportYStartY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportXStartC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportYStartC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SurfaceWidthY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SurfaceWidthC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SurfaceHeightY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SurfaceHeightC,
        v->BlockHeight256BytesY, v->BlockHeight256BytesC,
        v->BlockWidth256BytesY, v->BlockWidth256BytesC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ODMCombineEnabled,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.BlendingAndTiming,
        v->BytePerPixelY, v->BytePerPixelC, v->BytePerPixelDETY,
        v->BytePerPixelDETC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.HActive,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.HRatio,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.HRatioChroma,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DPPPerPlane,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_long_array[0],
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_long_array[1],
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_double_array[0],
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_double_array[1],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SwathHeightY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SwathHeightC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DETBufferSizeInKByte,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DETBufferSizeY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DETBufferSizeC,
        &v_337, &v_334,
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_133,
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_368_0_5,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_boolean_array,
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_368_0_5);
  dml32_CalculateDCFCLKDeepSleep(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces,
      v->BytePerPixelY, v->BytePerPixelC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatio,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatioChroma,
      v->SwathWidthY, v->SwathWidthC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DPPPerPlane,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HRatio,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HRatioChroma,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClock,
      v->PSCL_THROUGHPUT_LUMA, v->PSCL_THROUGHPUT_CHROMA,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DPPCLK,
      v->ReadBandwidthSurfaceLuma, v->ReadBandwidthSurfaceChroma,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ReturnBusWidth,
      &v_126);
  {}
  dml32_DSCDelayRequirement(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ODMCombineEnabled[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DSCInputBitPerComponent[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.OutputBppPerState
              [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                   ->vba.VoltageLevel][k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HActive[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HTotal[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfDSCSlices[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.OutputFormat[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.Output[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClock[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClockBackEnd[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ip.dsc_delay_factor_wa);
  for (
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j =
          0;
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j;
      ++DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j)
    dml32_CalculateSurfaceSizeInMall(
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.NumberOfActiveSurfaces,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.MALLAllocatedForDCNFinal,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.UseMALLForStaticScreen,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.UsesMALLForPStateChange,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DCCEnable,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportStationary,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportXStartY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportYStartY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportXStartC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportYStartC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportWidth,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportHeight,
        v->BytePerPixelY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportWidthChroma,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ViewportHeightChroma,
        v->BytePerPixelC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SurfaceWidthY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SurfaceWidthC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SurfaceHeightY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SurfaceHeightC,
        v->BlockWidth256BytesY, v->BlockWidth256BytesC, v->BlockHeight256BytesY,
        v->BlockHeight256BytesC, v->BlockWidthY, v->BlockWidthC,
        v->BlockHeightY, v->BlockHeightC,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DCCMetaPitchY,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DCCMetaPitchC,
        v->SurfaceSizeInMALL, &v_368_0_6);
  v->dummy_vars
      .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
      .SurfaceParameters[k]
      .PixelClock =
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClock[k];
  dml32_CalculateVMRowAndSwath(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces,
      v->dummy_vars
          .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
          .SurfaceParameters,
      v->SurfaceSizeInMALL,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PTEBufferSizeInRequestsLuma,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PTEBufferSizeInRequestsChroma,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DCCMetaBufferSizeBytes,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UseMALLForStaticScreen,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UsesMALLForPStateChange,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.MALLAllocatedForDCNFinal,
      v->SwathWidthY, v->SwathWidthC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HostVMMaxNonCachedPageTableLevels,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.GPUVMMaxPageTableLevels,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.GPUVMMinPageSizeKBytes,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HostVMMinPageSize,
      v->dummy_vars
          .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
          .dummy_boolean_array2[0],
      v->dummy_vars
          .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
          .dummy_boolean_array2[1],
      v->dpte_row_width_luma_ub, v->dpte_row_width_chroma_ub,
      v->dpte_row_height, v->dpte_row_height_chroma, v->dpte_row_height_linear,
      v->dpte_row_height_linear_chroma, v->meta_req_width,
      v->meta_req_width_chroma, v->meta_req_height, v->meta_req_height_chroma,
      v->meta_row_width, v->meta_row_width_chroma, v->meta_row_height,
      v->meta_row_height_chroma, v->vm_group_bytes, v->dpte_group_bytes,
      v->PixelPTEReqWidthY, v->PixelPTEReqHeightY, v->PTERequestSizeY,
      v->PixelPTEReqWidthC, v->PixelPTEReqHeightC, v->PTERequestSizeC,
      v->dpde0_bytes_per_frame_ub_l, v->meta_pte_bytes_per_frame_ub_l,
      v->dpde0_bytes_per_frame_ub_c, v->meta_pte_bytes_per_frame_ub_c,
      v->PrefetchSourceLinesY, v->PrefetchSourceLinesC, v->VInitPreFillY,
      v->VInitPreFillC, v->MaxNumSwathY, v->MaxNumSwathC, v->meta_row_bw,
      v->dpte_row_bw, v->PixelPTEBytesPerRow, v->PDEAndMetaPTEBytesFrame,
      v->MetaRowByte, v->Use_One_Row_For_Frame, v->Use_One_Row_For_Frame_Flip,
      v->UsesMALLForStaticScreen, v->PTE_BUFFER_MODE, v->BIGK_FRAGMENT_SIZE);
  DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_368_0_11 =
      dml32_get_return_bw_mbps_vm_only(
          &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
               ->vba.soc,
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.VoltageLevel,
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.DCFCLK,
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.FabricClock,
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.DRAMSpeed);
  v->dummy_vars
      .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
      .HostVMInefficiencyFactor =
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_368_0_11;
  {
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
        ->vba.TotalActiveDPP =
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DPPPerPlane[k];
  }
  v_127 = dml32_CalculateExtraLatency(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.RoundTripPingLatencyCycles,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_368_0_10,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DCFCLK,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.TotalActiveDPP,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelChunkSizeInKByte,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.TotalDCCActiveDPP,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.MetaChunkSize,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ReturnBW,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DPPPerPlane,
      v->dpte_group_bytes,
      v->dummy_vars
          .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
          .HostVMInefficiencyFactor,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HostVMMinPageSize,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HostVMMaxNonCachedPageTableLevels);
  for (
      ;
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces;) {
    dml32_CalculateWriteBackDelay(
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.WritebackPixelFormat[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.WritebackHRatio[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.WritebackVRatio[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.WritebackVTaps[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.WritebackDestinationWidth[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.WritebackDestinationHeight[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.WritebackSourceHeight[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.HTotal[k]);
    for (;;) {
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_6 = dml32_CalculateWriteBackDelay(
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.WritebackPixelFormat
                  [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j],
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.WritebackHRatio
                  [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j],
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.WritebackVRatio
                  [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j],
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.WritebackVTaps
                  [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j],
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.WritebackDestinationWidth
                  [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j],
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.WritebackDestinationHeight
                  [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j],
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.WritebackSourceHeight
                  [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_j],
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.HTotal[k]);
      dml_max(
          v->WritebackDelay
              [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                   ->vba.VoltageLevel][k],
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_6);
    }
  }
  dml32_CalculateUrgentLatency(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UrgentLatencyPixelDataOnly,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UrgentLatencyPixelMixedWithVMData,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UrgentLatencyVMDataOnly,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DoUrgentLatencyAdjustment,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UrgentLatencyAdjustmentFabricClockComponent,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UrgentLatencyAdjustmentFabricClockReference,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.FabricClock);
  dml32_CalculateUrgentBurstFactor(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UsesMALLForPStateChange[k],
      v->swath_width_luma_ub[k], v->swath_width_chroma_ub[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SwathHeightY[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SwathHeightC[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClock[k],
      v->UrgentLatency,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.CursorBufferSize,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.CursorWidth[k][0],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.CursorBPP[k][0],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatio[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatioChroma[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_215_0,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_216_0,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DETBufferSizeY[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DETBufferSizeC[k],
      &v_323_0, &v_324_0, &v_325_0, &v_312_0);
  dml32_CalculateDETSwathFillLatencyHiding(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ReturnBW,
      v->UrgentLatency,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SwathHeightY,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SwathHeightC,
      v->swath_width_luma_ub, v->swath_width_chroma_ub, v->BytePerPixelDETY,
      v->BytePerPixelDETC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DETBufferSizeY,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DETBufferSizeC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DPPPerPlane,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HTotal,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClock,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatio,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatioChroma,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UsesMALLForPStateChange,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UseUnboundedRequesting);
  {
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_7 =
        dml_ceil(
            v->WritebackDelay
                [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                     ->vba.VoltageLevel][k]);
    DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
        ? dml_floor(2.0)
        : DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___trans_tmp_7;
  }
  for (
      ;
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces;)
    dml32_CalculateMinAndMaxPrefetchMode(
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.AllowForPStateChangeOrStutterInVBlankFinal,
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
             ->vba.MinPrefetchMode,
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
             ->vba.MaxPrefetchMode);
  v->VStartupLines =
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_iteration =
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_NextPrefetchMode =
              DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                  ->vba.PrefetchModePerState
                      [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                           ->vba.VoltageLevel]
                      [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                           ->vba.maxMpcComb];
  {
    {
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_TWait =
          dml32_CalculateTWait(
              DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                  ->vba.PrefetchModePerState
                      [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                           ->vba.VoltageLevel]
                      [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                           ->vba.maxMpcComb],
              DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                  ->vba.UsesMALLForPStateChange[k],
              DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
              DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
              DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                  ->vba.DRAMClockChangeLatency,
              DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                  ->vba.FCLKChangeLatency,
              v->UrgentLatency,
              DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                  ->vba.SREnterPlusExitTime);
      {
        __builtin_memset(
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation,
            0,
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation___fortify_size);
      };
      dml32_CalculatePrefetchSchedule(
          v, k,
          v->dummy_vars
              .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
              .HostVMInefficiencyFactor,
          &v->dummy_vars
               .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
               .myPipe,
          v->DSCDelay[k], v->HRatio[k], dml_min(), v->MaxVStartupLines[k],
          v->UrgentLatency, v_127, v->TCalc, v->PDEAndMetaPTEBytesFrame[k],
          v->MetaRowByte[k], v->PixelPTEBytesPerRow[k],
          v->PrefetchSourceLinesY[k], v->SwathWidthY[k], v->VInitPreFillY[k],
          v->MaxNumSwathY[k], v->PrefetchSourceLinesC[k], v->SwathWidthC[k],
          v->VInitPreFillC[k], v->MaxNumSwathC[k], v->swath_width_luma_ub[k],
          v->swath_width_chroma_ub[k], v->SwathHeightY[k], v->SwathHeightC[k],
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_TWait,
          v || v,
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.PrefetchModePerState
                  [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                       ->vba.VoltageLevel]
                  [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                       ->vba.maxMpcComb],
          &v->DSTXAfterScaler[k], &v->DSTYAfterScaler[k],
          &v->DestinationLinesForPrefetch[k], &v->PrefetchBandwidth[k],
          &v->DestinationLinesToRequestVMInVBlank[k],
          &v->DestinationLinesToRequestRowInVBlank[k], &v->VRatioPrefetchY[k],
          &v->VRatioPrefetchC[k], &v->RequiredPrefetchPixDataBWLuma[k],
          &v->RequiredPrefetchPixDataBWChroma[k],
          &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_289_0,
          &v->Tno_bw[k], &v->prefetch_vmrow_bw[k], &v->Tdmdl_vm[k],
          &v->Tdmdl[k], &v->TSetup[k], &v->VUpdateOffsetPix[k],
          &v->VUpdateWidthPix[k], &v->VReadyOffsetPix[k]);
    }
    dml32_CalculateUrgentBurstFactor(
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.UsesMALLForPStateChange[k],
        v->swath_width_luma_ub[k], v->swath_width_chroma_ub[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SwathHeightY[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SwathHeightC[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.PixelClock[k],
        v->UrgentLatency,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.CursorBufferSize,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.CursorWidth[k][0],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.CursorBPP[k][0],
        v->VRatioPrefetchY[k], v->VRatioPrefetchC[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_215_0,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_216_0,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DETBufferSizeY[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DETBufferSizeC[k],
        &v->UrgBurstFactorCursorPre[k], &v->UrgBurstFactorLumaPre[k],
        &v->UrgBurstFactorChromaPre[k],
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_313_0);
    v->FractionOfUrgentBandwidth =
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_MaxTotalRDBandwidthNoUrgentBurst;
    dml32_CalculatePrefetchBandwithSupport(
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.NumberOfActiveSurfaces,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ReturnBW,
        v->NoUrgentLatencyHidingPre, v->ReadBandwidthSurfaceLuma,
        v->ReadBandwidthSurfaceChroma, v->RequiredPrefetchPixDataBWLuma,
        v->RequiredPrefetchPixDataBWChroma, v->cursor_bw, v->meta_row_bw,
        v->dpte_row_bw, v->cursor_bw_pre, v->prefetch_vmrow_bw,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DPPPerPlane,
        v->UrgBurstFactorLuma, v->UrgBurstFactorChroma, v->UrgBurstFactorCursor,
        v->UrgBurstFactorLumaPre, v->UrgBurstFactorChromaPre,
        v->UrgBurstFactorCursorPre, v->PrefetchBandwidth, v->VRatio,
        v->MaxVRatioPre,
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_MaxTotalRDBandwidth,
        &v->dummy_vars
             .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
             .dummy_single[0],
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_11);
    dml32_CalculatePrefetchBandwithSupport(
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.NumberOfActiveSurfaces,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ReturnBW,
        v->NoUrgentLatencyHidingPre, v->ReadBandwidthSurfaceLuma,
        v->ReadBandwidthSurfaceChroma, v->RequiredPrefetchPixDataBWLuma,
        v->RequiredPrefetchPixDataBWChroma, v->cursor_bw, v->meta_row_bw,
        v->dpte_row_bw, v->cursor_bw_pre, v->prefetch_vmrow_bw,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DPPPerPlane,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->PrefetchBandwidth, v->VRatio, v->MaxVRatioPre,
        &v->dummy_vars
             .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
             .dummy_single[0],
        &v->FractionOfUrgentBandwidth,
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_368_0_5);
    if (VRatioPrefetchMoreThanMax || DestinationLineTimesForPrefetchLessThan2)
      dml32_CalculateBandwidthAvailableForImmediateFlip(
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.NumberOfActiveSurfaces,
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.ReturnBW,
          v->ReadBandwidthSurfaceLuma, v->ReadBandwidthSurfaceChroma,
          v->RequiredPrefetchPixDataBWLuma, v->RequiredPrefetchPixDataBWChroma,
          v->cursor_bw, v->cursor_bw_pre,
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.DPPPerPlane,
          v->UrgBurstFactorLuma, v->UrgBurstFactorChroma,
          v->UrgBurstFactorCursor, v->UrgBurstFactorLumaPre,
          v->UrgBurstFactorChromaPre, v->UrgBurstFactorCursorPre);
    dml32_CalculateFlipSchedule(
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .HostVMInefficiencyFactor,
        v_127, v->UrgentLatency,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.GPUVMMaxPageTableLevels,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.HostVMMaxNonCachedPageTableLevels,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.HostVMMinPageSize,
        v->PDEAndMetaPTEBytesFrame[k], v->MetaRowByte[k],
        v->PixelPTEBytesPerRow[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.BandwidthAvailableForImmediateFlip,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.TotImmediateFlipBytes,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.SourcePixelFormat[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.PixelClock[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.VRatio[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.VRatioChroma[k],
        v->Tno_bw[k],
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
        v->dpte_row_height[k], v->meta_row_height[k],
        v->dpte_row_height_chroma[k], v->meta_row_height_chroma[k], v, &v_175_0,
        &v_176_0, &v->final_flip_bw[k],
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_191_0);
    dml32_CalculateImmediateFlipBandwithSupport(
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.NumberOfActiveSurfaces,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ReturnBW,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ImmediateFlipRequirement,
        v->final_flip_bw, v->ReadBandwidthSurfaceLuma,
        v->ReadBandwidthSurfaceChroma, v->RequiredPrefetchPixDataBWLuma,
        v->RequiredPrefetchPixDataBWChroma, v->cursor_bw, v->meta_row_bw,
        v->dpte_row_bw, v->cursor_bw_pre, v->prefetch_vmrow_bw,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DPPPerPlane,
        v->UrgBurstFactorLuma, v->UrgBurstFactorChroma, v->UrgBurstFactorCursor,
        v->UrgBurstFactorLumaPre, v->UrgBurstFactorChromaPre,
        v->UrgBurstFactorCursorPre, &v->total_dcn_read_bw_with_flip,
        &v->dummy_vars
             .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
             .dummy_single[0],
        &v->ImmediateFlipSupported);
    dml32_CalculateImmediateFlipBandwithSupport(
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.NumberOfActiveSurfaces,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ReturnBW,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.ImmediateFlipRequirement,
        v->final_flip_bw, v->ReadBandwidthSurfaceLuma,
        v->ReadBandwidthSurfaceChroma, v->RequiredPrefetchPixDataBWLuma,
        v->RequiredPrefetchPixDataBWChroma, v->cursor_bw, v->meta_row_bw,
        v->dpte_row_bw, v->cursor_bw_pre, v->prefetch_vmrow_bw,
        DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.DPPPerPlane,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        v->dummy_vars
            .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
            .dummy_unit_vector,
        &v->dummy_vars
             .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
             .dummy_single[1],
        &v->FractionOfUrgentBandwidthImmediateFlip,
        &DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_368_0_5);
  }
  dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
      v, v->PrefetchModePerState[v->VoltageLevel][v->maxMpcComb], v->DCFCLK,
      v->ReturnBW,
      v->dummy_vars
          .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
          .mmSOCParameters,
      v->SOCCLK, v_126, v->DETBufferSizeY, v->DETBufferSizeC, v->SwathHeightY,
      v->SwathHeightC, v->SwathWidthY, v->SwathWidthC, v->DPPPerPlane,
      v->BytePerPixelDETY, v->BytePerPixelDETC, v->DSTXAfterScaler,
      v->DSTYAfterScaler, v_337, v_334,
      &v->dummy_vars
           .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
           .dummy_dramchange_support,
      v->MaxActiveDRAMClockChangeLatencySupported,
      v->SubViewportLinesNeededInMALL,
      &v->dummy_vars
           .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
           .dummy_fclkchange_support,
      &v->MinActiveFCLKChangeLatencySupported,
      &v->dummy_vars
           .DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation
           .dummy_USRRetrainingSupport,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ActiveDRAMClockChangeLatencyMargin);
  dml32_CalculatePixelDeliveryTimes(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatio,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatioChroma,
      v->VRatioPrefetchY, v->VRatioPrefetchC, v->swath_width_luma_ub,
      v->swath_width_chroma_ub,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DPPPerPlane,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HRatio,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HRatioChroma,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClock,
      v->PSCL_THROUGHPUT_LUMA, v->PSCL_THROUGHPUT_CHROMA,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DPPCLK,
      v->BytePerPixelC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SourceRotation,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfCursors,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.CursorWidth,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.CursorBPP,
      v->BlockWidth256BytesY, v->BlockHeight256BytesY, v->BlockWidth256BytesC,
      v->BlockHeight256BytesC, v->DisplayPipeLineDeliveryTimeLuma,
      v->DisplayPipeLineDeliveryTimeChroma,
      v->DisplayPipeLineDeliveryTimeLumaPrefetch,
      v->DisplayPipeLineDeliveryTimeChromaPrefetch,
      v->DisplayPipeRequestDeliveryTimeLuma,
      v->DisplayPipeRequestDeliveryTimeChroma,
      v->DisplayPipeRequestDeliveryTimeLumaPrefetch,
      v->DisplayPipeRequestDeliveryTimeChromaPrefetch,
      v->CursorRequestDeliveryTime, v->CursorRequestDeliveryTimePrefetch);
  dml32_CalculateMetaAndPTETimes(
      v->Use_One_Row_For_Frame,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.MetaChunkSize,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.MinMetaChunkSizeBytes,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HTotal,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatio,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatioChroma,
      v->DestinationLinesToRequestRowInVBlank,
      v->DestinationLinesToRequestRowInImmediateFlip,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DCCEnable,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClock,
      v->BytePerPixelY, v->BytePerPixelC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SourceRotation,
      v->dpte_row_height, v->dpte_row_height_chroma, v->meta_row_width,
      v->meta_row_width_chroma, v->meta_row_height, v->meta_row_height_chroma,
      v->meta_req_width, v->meta_req_width_chroma, v->meta_req_height,
      v->meta_req_height_chroma, v->dpte_group_bytes, v->PTERequestSizeY,
      v->PTERequestSizeC, v->PixelPTEReqWidthY, v->PixelPTEReqHeightY,
      v->PixelPTEReqWidthC, v->PixelPTEReqHeightC, v->dpte_row_width_luma_ub,
      v->dpte_row_width_chroma_ub, v->DST_Y_PER_PTE_ROW_NOM_L,
      v->DST_Y_PER_PTE_ROW_NOM_C, v->DST_Y_PER_META_ROW_NOM_L,
      v->DST_Y_PER_META_ROW_NOM_C, v->TimePerMetaChunkNominal,
      v->TimePerChromaMetaChunkNominal, v->TimePerMetaChunkVBlank,
      v->TimePerChromaMetaChunkVBlank, v->TimePerMetaChunkFlip,
      v->TimePerChromaMetaChunkFlip, v->time_per_pte_group_nom_luma,
      v->time_per_pte_group_vblank_luma, v->time_per_pte_group_flip_luma,
      v->time_per_pte_group_nom_chroma, v->time_per_pte_group_vblank_chroma,
      v->time_per_pte_group_flip_chroma);
  dml32_CalculateVMGroupAndRequestTimes(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.GPUVMMaxPageTableLevels,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HTotal,
      v->BytePerPixelC, v->DestinationLinesToRequestVMInVBlank,
      v->DestinationLinesToRequestVMInImmediateFlip,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DCCEnable,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClock,
      v->dpte_row_width_luma_ub, v->dpte_row_width_chroma_ub, v->vm_group_bytes,
      v->dpde0_bytes_per_frame_ub_l, v->dpde0_bytes_per_frame_ub_c,
      v->meta_pte_bytes_per_frame_ub_l, v->meta_pte_bytes_per_frame_ub_c,
      v->TimePerVMGroupVBlank, v->TimePerVMGroupFlip, v->TimePerVMRequestVBlank,
      v->TimePerVMRequestFlip);
  for (
      ;
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib;
      ++DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
            ->vba.PrefetchModePerState
                [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                     ->vba.VoltageLevel]
                [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                     ->vba.maxMpcComb]) {
    {
    }
  }
  dml32_CalculateDCCConfiguration(
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SourcePixelFormat[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SurfaceWidthY[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SurfaceWidthC[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SurfaceHeightY[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SurfaceHeightC[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.nomDETInKByte,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_241_0,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_242_0,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SurfaceTiling[k],
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_277_0,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_278_0,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_215_0,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_v_216_0,
      (enum dm_rotation_angle)
          DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
              ->vba.SourceScan[k],
      &v->DCCYMaxUncompressedBlock[k], &v->DCCCMaxUncompressedBlock[k],
      &v->DCCYMaxCompressedBlock[k], &v->DCCCMaxCompressedBlock[k],
      &v->DCCYIndependentBlock[k], &v->DCCCIndependentBlock[k]);
  {
    v->MIN_DST_Y_NEXT_START[k] =
        v->WritebackDelay
            [DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                 ->vba.VoltageLevel][k] +
        dml_floor(
            DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
                ->vba.VStartup[k]);
  }
  dml32_CalculateStutterEfficiency(
      v_334,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.UsesMALLForPStateChange,
      v_337,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.MetaFIFOSizeInKEntries,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ZeroSizeBufferEntries,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelChunkSizeInKByte,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.NumberOfActiveSurfaces,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ROBBufferSizeInKByte,
      v->TotalDataReadBandwidth,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DCFCLK,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.ReturnBW,
      v->CompbufReservedSpace64B, v->CompbufReservedSpaceZs,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SRExitTime,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SRExitZ8Time,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.BlendingAndTiming,
      v->Watermark.StutterEnterPlusExitWatermark,
      v->Z8StutterEnterPlusExitWatermark,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.Interlace,
      v->MinTTUVBlank,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DPPPerPlane,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DETBufferSizeY,
      v->BytePerPixelY, v->BytePerPixelDETY, v->SwathWidthY,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SwathHeightY,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SwathHeightC,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DCCRateLuma,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DCCRateChroma,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DCCFractionOfZeroSizeRequestsLuma,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DCCFractionOfZeroSizeRequestsChroma,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.HTotal,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VTotal,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.PixelClock,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VRatio,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.SourceRotation,
      v->BlockHeight256BytesY, v->BlockWidth256BytesY, v->BlockHeight256BytesC,
      v->BlockWidth256BytesC, v->DCCYMaxUncompressedBlock,
      v->DCCCMaxUncompressedBlock,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.VActive,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.DCCEnable,
      DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation_mode_lib
          ->vba.WritebackEnable,
      v->ReadBandwidthSurfaceLuma, v->ReadBandwidthSurfaceChroma,
      v->meta_row_bw, v->dpte_row_bw, &v->StutterEfficiencyNotIncludingVBlank,
      &v->StutterEfficiency, &v->NumberOfStutterBurstsPerFrame,
      &v->Z8StutterEfficiencyNotIncludingVBlank, &v->Z8StutterEfficiency,
      &v->Z8NumberOfStutterBurstsPerFrame, &v->StutterPeriod,
      &v->DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE);
}
void dml32_ModeSupportAndSystemConfigurationFull() {
  dml32_CalculateSwathAndDETConfiguration(
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.DETSizeOverride,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .UsesMALLForPStateChange,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .ConfigReturnBufferSizeInKByte,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .MaxTotalDETInKByte,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .MinCompressedBufferSizeInKByte,
      1,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .NumberOfActiveSurfaces,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.nomDETInKByte,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .UseUnboundedRequesting,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .DisableUnboundRequestIfCompBufReservedSpaceNeedAdjustment,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.ip
          .pixel_chunk_size_kbytes,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.ip
          .rob_buffer_size_kbytes,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .CompressedBufferSegmentSizeInkByteFinal,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.Output,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .ReadBandwidthLuma,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .ReadBandwidthChroma,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .MaximumSwathWidthLuma,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .MaximumSwathWidthChroma,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.SourceRotation,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .ViewportStationary,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .SourcePixelFormat,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.SurfaceTiling,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.ViewportWidth,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.ViewportHeight,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.ViewportXStartY,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.ViewportYStartY,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.ViewportXStartC,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.ViewportYStartC,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.SurfaceWidthY,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.SurfaceWidthC,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.SurfaceHeightY,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.SurfaceHeightC,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .Read256BlockHeightY,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .Read256BlockHeightC,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .Read256BlockWidthY,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .Read256BlockWidthC,
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_odm_mode,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .BlendingAndTiming,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.BytePerPixelY,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.BytePerPixelC,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .BytePerPixelInDETY,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .BytePerPixelInDETC,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.HActive,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.HRatio,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.HRatioChroma,
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[0],
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[1],
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[2],
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_double_array[0],
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_double_array[1],
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[3],
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[4],
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[5],
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[6],
      dml32_ModeSupportAndSystemConfigurationFull_v.dummy_vars
          .dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[7],
      &dml32_ModeSupportAndSystemConfigurationFull_v_368_1_2_0_0,
      &dml32_ModeSupportAndSystemConfigurationFull_v_368_1_0_0_0,
      &dml32_ModeSupportAndSystemConfigurationFull_v_368_1_0_1_0,
      &dml32_ModeSupportAndSystemConfigurationFull_CompBufReservedSpaceNeedAdjustmentSingleDPP,
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
          .SingleDPPViewportSizeSupportPerSurface,
      &dml32_ModeSupportAndSystemConfigurationFull_v_368_1_2_1_0);
  for (;;) {
    if (0 &&
        dml32_ModeSupportAndSystemConfigurationFull_CompBufReservedSpaceNeedAdjustment) {
      dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.MPCCombine
          [dml32_ModeSupportAndSystemConfigurationFull_start_state][0]
          [dml32_ModeSupportAndSystemConfigurationFull_NumberOfNonCombinedSurfaceOfMaximumBandwidth] =
          true;
    }
    dml32_CalculateDPPCLK(
        dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
            .NumberOfActiveSurfaces,
        dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
            .DISPCLKDPPCLKDSCCLKDownSpreading,
        dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
            .DISPCLKDPPCLKVCOSpeed,
        dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
            .MinDPPCLKUsingSingleDPP,
        dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
            .NoOfDPPThisState,
        &dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.GlobalDPPCLK,
        dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
            .RequiredDPPCLKThisState);
  }
  for (;;)
    dml32_ModeSupportAndSystemConfigurationFull_TotalSlots =
        dml32_ModeSupportAndSystemConfigurationFull_TotalSlots +
        dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba.RequiredSlots
            [dml32_ModeSupportAndSystemConfigurationFull_start_state]
            [dml32_ModeSupportAndSystemConfigurationFull_j];
  for (; dml32_ModeSupportAndSystemConfigurationFull_m <=
         dml32_ModeSupportAndSystemConfigurationFull_i;
       dml32_ModeSupportAndSystemConfigurationFull_i--)
    dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
        .CompressedBufferSizeInkByte =
        dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
            .CompressedBufferSizeInkByteAllStates
                [dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
                     .VoltageLevel]
                [dml32_ModeSupportAndSystemConfigurationFull_MaximumMPCCombine];
  for (; dml32_ModeSupportAndSystemConfigurationFull_k <=
         dml32_ModeSupportAndSystemConfigurationFull_mode_lib.vba
             .NumberOfActiveSurfaces;)
    ;
}

--o++ymzHvANt/v2PT--
