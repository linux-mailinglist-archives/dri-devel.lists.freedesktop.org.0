Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8E9599B42
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 13:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C2610E57A;
	Fri, 19 Aug 2022 11:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6399510E3FA;
 Fri, 19 Aug 2022 11:53:04 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4M8Krb3GW5z9tKV;
 Fri, 19 Aug 2022 11:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660909983; bh=8QucbOcvkNhWTY2kVSyMizI9tqQs9c3yrrlqW7F3DI0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pa/NpLqPKxw88sYEAjvC3UH/iuOdRM1m5TPvnDct7MArl/7r4WkWWn+1q0YGWh3hE
 ojLCUimFaaujZKtOEMTIuZ9x3Z9YNStSLqimTcBj9gfZ2skuP5uob9CQT/rIeYG75r
 9k2xnEpm68agYu4/228bWGEmp0M0fLx+7YQOmPJA=
X-Riseup-User-ID: 5AA46C779814B76761A5D63E5F0B5D96E2D835964D302A7931066C02051EB27E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4M8KrT2PhKz5vTJ;
 Fri, 19 Aug 2022 11:52:57 +0000 (UTC)
Message-ID: <3cdb3f6c-3891-a440-a92a-0e392c5f33fe@riseup.net>
Date: Fri, 19 Aug 2022 08:52:55 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amd/display: fix i386 frame size warning
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org
References: <20220818164848.68729-1-hamza.mahfooz@amd.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220818164848.68729-1-hamza.mahfooz@amd.com>
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Bing Guo <Bing.Guo@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hamza,

On 8/18/22 13:48, Hamza Mahfooz wrote:
> Addresses the following warning:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3596:6: error: stack frame size (2092) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>      ^

Could you please specify how you generated this error? I was trying to
test the patch and I couldn't reproduce this error on i386.

I ran on amd-staging-drm-next without your patch:

$ make -skj"$(nproc)" ARCH=i386 LLVM=1 mrproper allmodconfig
drivers/gpu/drm/amd/amdgpu/

which didn't generated warnings on display_mode_vba_30.

Moreover, I applied your patch on amd-staging-drm-next and ran:

$ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper allmodconfig
drivers/gpu/drm/amd/amdgpu/

and I still get the warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3542:6:
error: stack frame size (2184) exceeds limit (2048) in
'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib
*mode_lib)
     ^
1 error generated.

Best Regards,
- Maíra Canal

> 
> UseMinimumDCFCLK() is eating away at
> dml30_ModeSupportAndSystemConfigurationFull()'s stack space, so use a
> pointer to struct vba_vars_st instead of passing lots of large arrays
> as parameters by value.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  .../dc/dml/dcn30/display_mode_vba_30.c        | 295 ++++--------------
>  1 file changed, 63 insertions(+), 232 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index 876b321b30ca..b7fa003ffe06 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -396,64 +396,10 @@ static void CalculateUrgentBurstFactor(
>  
>  static void UseMinimumDCFCLK(
>  		struct display_mode_lib *mode_lib,
> -		int MaxInterDCNTileRepeaters,
> +		struct vba_vars_st *v,
>  		int MaxPrefetchMode,
> -		double FinalDRAMClockChangeLatency,
> -		double SREnterPlusExitTime,
> -		int ReturnBusWidth,
> -		int RoundTripPingLatencyCycles,
> -		int ReorderingBytes,
> -		int PixelChunkSizeInKByte,
> -		int MetaChunkSize,
> -		bool GPUVMEnable,
> -		int GPUVMMaxPageTableLevels,
> -		bool HostVMEnable,
> -		int NumberOfActivePlanes,
> -		double HostVMMinPageSize,
> -		int HostVMMaxNonCachedPageTableLevels,
> -		bool DynamicMetadataVMEnabled,
> -		enum immediate_flip_requirement ImmediateFlipRequirement,
> -		bool ProgressiveToInterlaceUnitInOPP,
> -		double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
> -		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
> -		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
> -		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
> -		int VTotal[],
> -		int VActive[],
> -		int DynamicMetadataTransmittedBytes[],
> -		int DynamicMetadataLinesBeforeActiveRequired[],
> -		bool Interlace[],
> -		double RequiredDPPCLK[][2][DC__NUM_DPP__MAX],
> -		double RequiredDISPCLK[][2],
> -		double UrgLatency[],
> -		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
> -		double ProjectedDCFCLKDeepSleep[][2],
> -		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
> -		double TotalVActivePixelBandwidth[][2],
> -		double TotalVActiveCursorBandwidth[][2],
> -		double TotalMetaRowBandwidth[][2],
> -		double TotalDPTERowBandwidth[][2],
> -		unsigned int TotalNumberOfActiveDPP[][2],
> -		unsigned int TotalNumberOfDCCActiveDPP[][2],
> -		int dpte_group_bytes[],
> -		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
> -		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
> -		unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
> -		unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
> -		int BytePerPixelY[],
> -		int BytePerPixelC[],
> -		int HTotal[],
> -		double PixelClock[],
> -		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
> -		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
> -		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
> -		bool DynamicMetadataEnable[],
> -		double VActivePixelBandwidth[][2][DC__NUM_DPP__MAX],
> -		double VActiveCursorBandwidth[][2][DC__NUM_DPP__MAX],
> -		double ReadBandwidthLuma[],
> -		double ReadBandwidthChroma[],
> -		double DCFCLKPerState[],
> -		double DCFCLKState[][2]);
> +		int ReorderingBytes);
> +
>  static void CalculatePixelDeliveryTimes(
>  		unsigned int NumberOfActivePlanes,
>  		double VRatio[],
> @@ -4692,66 +4638,7 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>  	}
>  
>  	if (v->UseMinimumRequiredDCFCLK == true) {
> -		UseMinimumDCFCLK(
> -				mode_lib,
> -				v->MaxInterDCNTileRepeaters,
> -				MaxPrefetchMode,
> -				v->FinalDRAMClockChangeLatency,
> -				v->SREnterPlusExitTime,
> -				v->ReturnBusWidth,
> -				v->RoundTripPingLatencyCycles,
> -				ReorderingBytes,
> -				v->PixelChunkSizeInKByte,
> -				v->MetaChunkSize,
> -				v->GPUVMEnable,
> -				v->GPUVMMaxPageTableLevels,
> -				v->HostVMEnable,
> -				v->NumberOfActivePlanes,
> -				v->HostVMMinPageSize,
> -				v->HostVMMaxNonCachedPageTableLevels,
> -				v->DynamicMetadataVMEnabled,
> -				v->ImmediateFlipRequirement[0],
> -				v->ProgressiveToInterlaceUnitInOPP,
> -				v->MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
> -				v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
> -				v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
> -				v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
> -				v->VTotal,
> -				v->VActive,
> -				v->DynamicMetadataTransmittedBytes,
> -				v->DynamicMetadataLinesBeforeActiveRequired,
> -				v->Interlace,
> -				v->RequiredDPPCLK,
> -				v->RequiredDISPCLK,
> -				v->UrgLatency,
> -				v->NoOfDPP,
> -				v->ProjectedDCFCLKDeepSleep,
> -				v->MaximumVStartup,
> -				v->TotalVActivePixelBandwidth,
> -				v->TotalVActiveCursorBandwidth,
> -				v->TotalMetaRowBandwidth,
> -				v->TotalDPTERowBandwidth,
> -				v->TotalNumberOfActiveDPP,
> -				v->TotalNumberOfDCCActiveDPP,
> -				v->dpte_group_bytes,
> -				v->PrefetchLinesY,
> -				v->PrefetchLinesC,
> -				v->swath_width_luma_ub_all_states,
> -				v->swath_width_chroma_ub_all_states,
> -				v->BytePerPixelY,
> -				v->BytePerPixelC,
> -				v->HTotal,
> -				v->PixelClock,
> -				v->PDEAndMetaPTEBytesPerFrame,
> -				v->DPTEBytesPerRow,
> -				v->MetaRowBytes,
> -				v->DynamicMetadataEnable,
> -				v->VActivePixelBandwidth,
> -				v->VActiveCursorBandwidth,
> -				v->ReadBandwidthLuma,
> -				v->ReadBandwidthChroma,
> -				v->DCFCLKPerState,
> -				v->DCFCLKState);
> +		UseMinimumDCFCLK(mode_lib, v, MaxPrefetchMode, ReorderingBytes);
>  
>  		if (v->ClampMinDCFCLK) {
>  			/* Clamp calculated values to actual minimum */
> @@ -6610,77 +6497,21 @@ static double CalculateUrgentLatency(
>  	return ret;
>  }
>  
> -
>  static void UseMinimumDCFCLK(
>  		struct display_mode_lib *mode_lib,
> -		int MaxInterDCNTileRepeaters,
> +		struct vba_vars_st *v,
>  		int MaxPrefetchMode,
> -		double FinalDRAMClockChangeLatency,
> -		double SREnterPlusExitTime,
> -		int ReturnBusWidth,
> -		int RoundTripPingLatencyCycles,
> -		int ReorderingBytes,
> -		int PixelChunkSizeInKByte,
> -		int MetaChunkSize,
> -		bool GPUVMEnable,
> -		int GPUVMMaxPageTableLevels,
> -		bool HostVMEnable,
> -		int NumberOfActivePlanes,
> -		double HostVMMinPageSize,
> -		int HostVMMaxNonCachedPageTableLevels,
> -		bool DynamicMetadataVMEnabled,
> -		enum immediate_flip_requirement ImmediateFlipRequirement,
> -		bool ProgressiveToInterlaceUnitInOPP,
> -		double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
> -		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData,
> -		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
> -		double PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly,
> -		int VTotal[],
> -		int VActive[],
> -		int DynamicMetadataTransmittedBytes[],
> -		int DynamicMetadataLinesBeforeActiveRequired[],
> -		bool Interlace[],
> -		double RequiredDPPCLK[][2][DC__NUM_DPP__MAX],
> -		double RequiredDISPCLK[][2],
> -		double UrgLatency[],
> -		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
> -		double ProjectedDCFCLKDeepSleep[][2],
> -		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
> -		double TotalVActivePixelBandwidth[][2],
> -		double TotalVActiveCursorBandwidth[][2],
> -		double TotalMetaRowBandwidth[][2],
> -		double TotalDPTERowBandwidth[][2],
> -		unsigned int TotalNumberOfActiveDPP[][2],
> -		unsigned int TotalNumberOfDCCActiveDPP[][2],
> -		int dpte_group_bytes[],
> -		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
> -		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
> -		unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
> -		unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
> -		int BytePerPixelY[],
> -		int BytePerPixelC[],
> -		int HTotal[],
> -		double PixelClock[],
> -		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
> -		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
> -		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
> -		bool DynamicMetadataEnable[],
> -		double VActivePixelBandwidth[][2][DC__NUM_DPP__MAX],
> -		double VActiveCursorBandwidth[][2][DC__NUM_DPP__MAX],
> -		double ReadBandwidthLuma[],
> -		double ReadBandwidthChroma[],
> -		double DCFCLKPerState[],
> -		double DCFCLKState[][2])
> +		int ReorderingBytes)
>  {
>  	double   NormalEfficiency = 0;
>  	double   PTEEfficiency = 0;
>  	double   TotalMaxPrefetchFlipDPTERowBandwidth[DC__VOLTAGE_STATES][2] = { { 0 } };
>  	unsigned int i, j, k;
>  
> -	NormalEfficiency =  (HostVMEnable == true ? PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData
> -			: PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly) / 100.0;
> -	PTEEfficiency =  (HostVMEnable == true ? PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly
> -			/ PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData : 1.0);
> +	NormalEfficiency =  (v->HostVMEnable == true ? v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData
> +			: v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly) / 100.0;
> +	PTEEfficiency =  (v->HostVMEnable == true ? v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly
> +			/ v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData : 1.0);
>  	for (i = 0; i < mode_lib->soc.num_states; ++i) {
>  		for (j = 0; j <= 1; ++j) {
>  			double PixelDCFCLKCyclesRequiredInPrefetch[DC__NUM_DPP__MAX] = { 0 };
> @@ -6698,58 +6529,58 @@ static void UseMinimumDCFCLK(
>  			double MinimumTvmPlus2Tr0 = 0;
>  
>  			TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = 0;
> -			for (k = 0; k < NumberOfActivePlanes; ++k) {
> +			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>  				TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = TotalMaxPrefetchFlipDPTERowBandwidth[i][j]
> -					+ NoOfDPP[i][j][k] * DPTEBytesPerRow[i][j][k] / (15.75 * HTotal[k] / PixelClock[k]);
> +					+ v->NoOfDPP[i][j][k] * v->DPTEBytesPerRow[i][j][k] / (15.75 * v->HTotal[k] / v->PixelClock[k]);
>  			}
>  
> -			for (k = 0; k <= NumberOfActivePlanes - 1; ++k) {
> -				NoOfDPPState[k] = NoOfDPP[i][j][k];
> +			for (k = 0; k <= v->NumberOfActivePlanes - 1; ++k) {
> +				NoOfDPPState[k] = v->NoOfDPP[i][j][k];
>  			}
>  
> -			MinimumTWait = CalculateTWait(MaxPrefetchMode, FinalDRAMClockChangeLatency, UrgLatency[i], SREnterPlusExitTime);
> -			NonDPTEBandwidth = TotalVActivePixelBandwidth[i][j] + TotalVActiveCursorBandwidth[i][j] + TotalMetaRowBandwidth[i][j];
> -			DPTEBandwidth =  (HostVMEnable == true || ImmediateFlipRequirement == dm_immediate_flip_required) ?
> -					TotalMaxPrefetchFlipDPTERowBandwidth[i][j] : TotalDPTERowBandwidth[i][j];
> -			DCFCLKRequiredForAverageBandwidth = dml_max3(ProjectedDCFCLKDeepSleep[i][j],
> -					(NonDPTEBandwidth + TotalDPTERowBandwidth[i][j]) / ReturnBusWidth / (MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation / 100),
> -					(NonDPTEBandwidth + DPTEBandwidth / PTEEfficiency) / NormalEfficiency / ReturnBusWidth);
> -
> -			ExtraLatencyBytes = CalculateExtraLatencyBytes(ReorderingBytes, TotalNumberOfActiveDPP[i][j], PixelChunkSizeInKByte, TotalNumberOfDCCActiveDPP[i][j],
> -					MetaChunkSize, GPUVMEnable, HostVMEnable, NumberOfActivePlanes, NoOfDPPState, dpte_group_bytes,
> -					PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData, PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
> -					HostVMMinPageSize, HostVMMaxNonCachedPageTableLevels);
> -			ExtraLatencyCycles = RoundTripPingLatencyCycles + 32 + ExtraLatencyBytes / NormalEfficiency / ReturnBusWidth;
> -			for (k = 0; k < NumberOfActivePlanes; ++k) {
> +			MinimumTWait = CalculateTWait(MaxPrefetchMode, v->FinalDRAMClockChangeLatency, v->UrgLatency[i], v->SREnterPlusExitTime);
> +			NonDPTEBandwidth = v->TotalVActivePixelBandwidth[i][j] + v->TotalVActiveCursorBandwidth[i][j] + v->TotalMetaRowBandwidth[i][j];
> +			DPTEBandwidth =  (v->HostVMEnable == true || v->ImmediateFlipRequirement[0] == dm_immediate_flip_required) ?
> +					TotalMaxPrefetchFlipDPTERowBandwidth[i][j] : v->TotalDPTERowBandwidth[i][j];
> +			DCFCLKRequiredForAverageBandwidth = dml_max3(v->ProjectedDCFCLKDeepSleep[i][j],
> +					(NonDPTEBandwidth + v->TotalDPTERowBandwidth[i][j]) / v->ReturnBusWidth / (v->MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation / 100),
> +					(NonDPTEBandwidth + DPTEBandwidth / PTEEfficiency) / NormalEfficiency / v->ReturnBusWidth);
> +
> +			ExtraLatencyBytes = CalculateExtraLatencyBytes(ReorderingBytes, v->TotalNumberOfActiveDPP[i][j], v->PixelChunkSizeInKByte, v->TotalNumberOfDCCActiveDPP[i][j],
> +					v->MetaChunkSize, v->GPUVMEnable, v->HostVMEnable, v->NumberOfActivePlanes, NoOfDPPState, v->dpte_group_bytes,
> +					v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData, v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly,
> +					v->HostVMMinPageSize, v->HostVMMaxNonCachedPageTableLevels);
> +			ExtraLatencyCycles = v->RoundTripPingLatencyCycles + 32 + ExtraLatencyBytes / NormalEfficiency / v->ReturnBusWidth;
> +			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>  				double DCFCLKCyclesRequiredInPrefetch = { 0 };
>  				double ExpectedPrefetchBWAcceleration = { 0 };
>  				double PrefetchTime = { 0 };
>  
> -				PixelDCFCLKCyclesRequiredInPrefetch[k] = (PrefetchLinesY[i][j][k] * swath_width_luma_ub_all_states[i][j][k] * BytePerPixelY[k]
> -					+ PrefetchLinesC[i][j][k] * swath_width_chroma_ub_all_states[i][j][k] * BytePerPixelC[k]) / NormalEfficiency / ReturnBusWidth;
> -				DCFCLKCyclesRequiredInPrefetch = 2 * ExtraLatencyCycles / NoOfDPPState[k] + PDEAndMetaPTEBytesPerFrame[i][j][k] / PTEEfficiency
> -					/ NormalEfficiency / ReturnBusWidth *  (GPUVMMaxPageTableLevels > 2 ? 1 : 0) + 2 * DPTEBytesPerRow[i][j][k] / PTEEfficiency
> -					/ NormalEfficiency / ReturnBusWidth + 2 * MetaRowBytes[i][j][k] / NormalEfficiency / ReturnBusWidth + PixelDCFCLKCyclesRequiredInPrefetch[k];
> -				PrefetchPixelLinesTime[k] = dml_max(PrefetchLinesY[i][j][k], PrefetchLinesC[i][j][k]) * HTotal[k] / PixelClock[k];
> -				ExpectedPrefetchBWAcceleration = (VActivePixelBandwidth[i][j][k] + VActiveCursorBandwidth[i][j][k]) / (ReadBandwidthLuma[k] + ReadBandwidthChroma[k]);
> -				DynamicMetadataVMExtraLatency[k] = (GPUVMEnable == true && DynamicMetadataEnable[k] == true && DynamicMetadataVMEnabled == true) ?
> -						UrgLatency[i] * GPUVMMaxPageTableLevels *  (HostVMEnable == true ? HostVMMaxNonCachedPageTableLevels + 1 : 1) : 0;
> -				PrefetchTime = (MaximumVStartup[i][j][k] - 1) * HTotal[k] / PixelClock[k] - MinimumTWait - UrgLatency[i] * ((GPUVMMaxPageTableLevels <= 2 ? GPUVMMaxPageTableLevels
> -						: GPUVMMaxPageTableLevels - 2) * (HostVMEnable == true ? HostVMMaxNonCachedPageTableLevels + 1 : 1) - 1) - DynamicMetadataVMExtraLatency[k];
> +				PixelDCFCLKCyclesRequiredInPrefetch[k] = (v->PrefetchLinesY[i][j][k] * v->swath_width_luma_ub_all_states[i][j][k] * v->BytePerPixelY[k]
> +					+ v->PrefetchLinesC[i][j][k] * v->swath_width_chroma_ub_all_states[i][j][k] * v->BytePerPixelC[k]) / NormalEfficiency / v->ReturnBusWidth;
> +				DCFCLKCyclesRequiredInPrefetch = 2 * ExtraLatencyCycles / NoOfDPPState[k] + v->PDEAndMetaPTEBytesPerFrame[i][j][k] / PTEEfficiency
> +					/ NormalEfficiency / v->ReturnBusWidth *  (v->GPUVMMaxPageTableLevels > 2 ? 1 : 0) + 2 * v->DPTEBytesPerRow[i][j][k] / PTEEfficiency
> +					/ NormalEfficiency / v->ReturnBusWidth + 2 * v->MetaRowBytes[i][j][k] / NormalEfficiency / v->ReturnBusWidth + PixelDCFCLKCyclesRequiredInPrefetch[k];
> +				PrefetchPixelLinesTime[k] = dml_max(v->PrefetchLinesY[i][j][k], v->PrefetchLinesC[i][j][k]) * v->HTotal[k] / v->PixelClock[k];
> +				ExpectedPrefetchBWAcceleration = (v->VActivePixelBandwidth[i][j][k] + v->VActiveCursorBandwidth[i][j][k]) / (v->ReadBandwidthLuma[k] + v->ReadBandwidthChroma[k]);
> +				DynamicMetadataVMExtraLatency[k] = (v->GPUVMEnable == true && v->DynamicMetadataEnable[k] == true && v->DynamicMetadataVMEnabled == true) ?
> +						v->UrgLatency[i] * v->GPUVMMaxPageTableLevels *  (v->HostVMEnable == true ? v->HostVMMaxNonCachedPageTableLevels + 1 : 1) : 0;
> +				PrefetchTime = (v->MaximumVStartup[i][j][k] - 1) * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - v->UrgLatency[i] * ((v->GPUVMMaxPageTableLevels <= 2 ? v->GPUVMMaxPageTableLevels
> +						: v->GPUVMMaxPageTableLevels - 2) * (v->HostVMEnable == true ? v->HostVMMaxNonCachedPageTableLevels + 1 : 1) - 1) - DynamicMetadataVMExtraLatency[k];
>  
>  				if (PrefetchTime > 0) {
>  					double ExpectedVRatioPrefetch = { 0 };
>  					ExpectedVRatioPrefetch = PrefetchPixelLinesTime[k] / (PrefetchTime * PixelDCFCLKCyclesRequiredInPrefetch[k] / DCFCLKCyclesRequiredInPrefetch);
>  					DCFCLKRequiredForPeakBandwidthPerPlane[k] = NoOfDPPState[k] * PixelDCFCLKCyclesRequiredInPrefetch[k] / PrefetchPixelLinesTime[k]
>  						* dml_max(1.0, ExpectedVRatioPrefetch) * dml_max(1.0, ExpectedVRatioPrefetch / 4) * ExpectedPrefetchBWAcceleration;
> -					if (HostVMEnable == true || ImmediateFlipRequirement == dm_immediate_flip_required) {
> +					if (v->HostVMEnable == true || v->ImmediateFlipRequirement[0] == dm_immediate_flip_required) {
>  						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKRequiredForPeakBandwidthPerPlane[k]
> -							+ NoOfDPPState[k] * DPTEBandwidth / PTEEfficiency / NormalEfficiency / ReturnBusWidth;
> +							+ NoOfDPPState[k] * DPTEBandwidth / PTEEfficiency / NormalEfficiency / v->ReturnBusWidth;
>  					}
>  				} else {
> -					DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKPerState[i];
> +					DCFCLKRequiredForPeakBandwidthPerPlane[k] = v->DCFCLKPerState[i];
>  				}
> -				if (DynamicMetadataEnable[k] == true) {
> +				if (v->DynamicMetadataEnable[k] == true) {
>  					double TsetupPipe = { 0 };
>  					double TdmbfPipe = { 0 };
>  					double TdmsksPipe = { 0 };
> @@ -6757,49 +6588,49 @@ static void UseMinimumDCFCLK(
>  					double AllowedTimeForUrgentExtraLatency = { 0 };
>  
>  					CalculateDynamicMetadataParameters(
> -							MaxInterDCNTileRepeaters,
> -							RequiredDPPCLK[i][j][k],
> -							RequiredDISPCLK[i][j],
> -							ProjectedDCFCLKDeepSleep[i][j],
> -							PixelClock[k],
> -							HTotal[k],
> -							VTotal[k] - VActive[k],
> -							DynamicMetadataTransmittedBytes[k],
> -							DynamicMetadataLinesBeforeActiveRequired[k],
> -							Interlace[k],
> -							ProgressiveToInterlaceUnitInOPP,
> +							v->MaxInterDCNTileRepeaters,
> +							v->RequiredDPPCLK[i][j][k],
> +							v->RequiredDISPCLK[i][j],
> +							v->ProjectedDCFCLKDeepSleep[i][j],
> +							v->PixelClock[k],
> +							v->HTotal[k],
> +							v->VTotal[k] - v->VActive[k],
> +							v->DynamicMetadataTransmittedBytes[k],
> +							v->DynamicMetadataLinesBeforeActiveRequired[k],
> +							v->Interlace[k],
> +							v->ProgressiveToInterlaceUnitInOPP,
>  							&TsetupPipe,
>  							&TdmbfPipe,
>  							&TdmecPipe,
>  							&TdmsksPipe);
> -					AllowedTimeForUrgentExtraLatency = MaximumVStartup[i][j][k] * HTotal[k] / PixelClock[k] - MinimumTWait - TsetupPipe
> +					AllowedTimeForUrgentExtraLatency = v->MaximumVStartup[i][j][k] * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - TsetupPipe
>  							- TdmbfPipe - TdmecPipe - TdmsksPipe - DynamicMetadataVMExtraLatency[k];
>  					if (AllowedTimeForUrgentExtraLatency > 0) {
>  						DCFCLKRequiredForPeakBandwidthPerPlane[k] = dml_max(DCFCLKRequiredForPeakBandwidthPerPlane[k],
>  								ExtraLatencyCycles / AllowedTimeForUrgentExtraLatency);
>  					} else {
> -						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKPerState[i];
> +						DCFCLKRequiredForPeakBandwidthPerPlane[k] = v->DCFCLKPerState[i];
>  					}
>  				}
>  			}
>  			DCFCLKRequiredForPeakBandwidth = 0;
> -			for (k = 0; k <= NumberOfActivePlanes - 1; ++k) {
> +			for (k = 0; k <= v->NumberOfActivePlanes - 1; ++k) {
>  				DCFCLKRequiredForPeakBandwidth = DCFCLKRequiredForPeakBandwidth + DCFCLKRequiredForPeakBandwidthPerPlane[k];
>  			}
> -			MinimumTvmPlus2Tr0 = UrgLatency[i] * (GPUVMEnable == true ? (HostVMEnable == true ?
> -					(GPUVMMaxPageTableLevels + 2) * (HostVMMaxNonCachedPageTableLevels + 1) - 1 : GPUVMMaxPageTableLevels + 1) : 0);
> -			for (k = 0; k < NumberOfActivePlanes; ++k) {
> +			MinimumTvmPlus2Tr0 = v->UrgLatency[i] * (v->GPUVMEnable == true ? (v->HostVMEnable == true ?
> +					(v->GPUVMMaxPageTableLevels + 2) * (v->HostVMMaxNonCachedPageTableLevels + 1) - 1 : v->GPUVMMaxPageTableLevels + 1) : 0);
> +			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>  				double MaximumTvmPlus2Tr0PlusTsw = { 0 };
> -				MaximumTvmPlus2Tr0PlusTsw = (MaximumVStartup[i][j][k] - 2) * HTotal[k] / PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
> +				MaximumTvmPlus2Tr0PlusTsw = (v->MaximumVStartup[i][j][k] - 2) * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
>  				if (MaximumTvmPlus2Tr0PlusTsw <= MinimumTvmPlus2Tr0 + PrefetchPixelLinesTime[k] / 4) {
> -					DCFCLKRequiredForPeakBandwidth = DCFCLKPerState[i];
> +					DCFCLKRequiredForPeakBandwidth = v->DCFCLKPerState[i];
>  				} else {
>  					DCFCLKRequiredForPeakBandwidth = dml_max3(DCFCLKRequiredForPeakBandwidth, 2 * ExtraLatencyCycles
>  							/ (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0 - PrefetchPixelLinesTime[k] / 4),
>  						(2 * ExtraLatencyCycles + PixelDCFCLKCyclesRequiredInPrefetch[k]) / (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0));
>  				}
>  			}
> -			DCFCLKState[i][j] = dml_min(DCFCLKPerState[i], 1.05 * (1 + mode_lib->vba.PercentMarginOverMinimumRequiredDCFCLK / 100)
> +			v->DCFCLKState[i][j] = dml_min(v->DCFCLKPerState[i], 1.05 * (1 + mode_lib->vba.PercentMarginOverMinimumRequiredDCFCLK / 100)
>  					* dml_max(DCFCLKRequiredForAverageBandwidth, DCFCLKRequiredForPeakBandwidth));
>  		}
>  	}
