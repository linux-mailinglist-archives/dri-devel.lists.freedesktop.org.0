Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ACD5BB441
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 00:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0594710E1A2;
	Fri, 16 Sep 2022 22:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AFD10E35F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 22:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663365900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bsgwYpyrZTzeursZEdM0jTMhQla59h4anCtKP+6frM=;
 b=Esbk/QymtdQJZYBtP1FLR74VdNmbwNLxRdrUA/yPzSBxsg3Ojzhz+FKLiFfTZBavWUwYPl
 gOOez4IljmkZ5MwWRA3yY8Ei+eQmScv5c8DHVDs20E7avcbpP9R7Mk/Jvf0/+CkjQBecOe
 4O/12Dkn8nZynfaMjl9/fobGr3+xbmg=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-NhRvL675MziRfrKaXiNUvw-1; Fri, 16 Sep 2022 18:04:59 -0400
X-MC-Unique: NhRvL675MziRfrKaXiNUvw-1
Received: by mail-oo1-f71.google.com with SMTP id
 f6-20020a4a9206000000b0044e001dc716so11844191ooh.20
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 15:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-language:content-transfer-encoding:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4bsgwYpyrZTzeursZEdM0jTMhQla59h4anCtKP+6frM=;
 b=5yKEqq63TH60D9S09cxIvV2tpgAcHC33P9Ci9DZitd2082T4WfBTzV7QPImGKuOdLy
 X41PBAUl/DgRiBNVeNG36mSxI09km+TJvJJWYaUTHYV7lDdb1mpBc1Pd82XNnIPa/RRb
 ANSXhuwulN9YbKMgWdtcoJL3gfiIKAb/QK5KgX/sC+y9TVUgtN7TIie0rWikwcYXP4PP
 aMVWHziRYCHkp57oKlauJVjtL5+DKvk8PnVJZ0TwJV2AJNZQod11zKioWGqMKtDm7HNy
 7v8fnhgHHUB2uzMPMIiGtZz9FJHuHXr/l2FcKRgy/CFqjpV+/UFG+5NEQ7lMx5yhXlAI
 EoMg==
X-Gm-Message-State: ACgBeo0ux66Mm6jSzwmXxd786tkWri7SJ7b1zrLLB/VprvpZCK9HeWIg
 sVzq8IUYJwive8cZRL5Dm1qmnsgC9iTSKSuLNKUfB+q/fEree9oqAF1RJVz87GZ8an84kflRLaF
 fPQcyoRE5aKWh8mfFgmP7PfRUqzLG
X-Received: by 2002:a05:6808:1149:b0:34f:a5d0:1c86 with SMTP id
 u9-20020a056808114900b0034fa5d01c86mr7493453oiu.37.1663365898638; 
 Fri, 16 Sep 2022 15:04:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Jooc7dREFquq+xJ3PUG/IYN8Oe0ANatcrSVgbpva5lb0z2iz/4dYH+6IcXGw5WU2DsK4swQ==
X-Received: by 2002:a05:6808:1149:b0:34f:a5d0:1c86 with SMTP id
 u9-20020a056808114900b0034fa5d01c86mr7493438oiu.37.1663365898241; 
 Fri, 16 Sep 2022 15:04:58 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056871015400b0012784cb563dsm4087240oab.22.2022.09.16.15.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 15:04:57 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amd/display: Reduce number of arguments of
 dml314's CalculateWatermarksAndDRAMSpeedChangeSupport()
To: Nathan Chancellor <nathan@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20220916210658.3412450-1-nathan@kernel.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <79b70fc5-0b95-f3ac-1e4a-8bf0542012c2@redhat.com>
Date: Fri, 16 Sep 2022 15:04:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220916210658.3412450-1-nathan@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: "kernelci.org bot" <bot@kernelci.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/16/22 2:06 PM, Nathan Chancellor wrote:
> Most of the arguments are identical between the two call sites and they
> can be accessed through the 'struct vba_vars_st' pointer. This reduces
> the total amount of stack space that
> dml314_ModeSupportAndSystemConfigurationFull() uses by 240 bytes with
> LLVM 16 (2216 -> 1976), helping clear up the following clang warning:
>
>    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:4020:6: error: stack frame size (2216) exceeds limit (2048) in 'dml314_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>    void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>         ^
>    1 error generated.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1710
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Nathan,

I like this change but I don't think it goes far enough.

There are many similar functions in this file and there other 
display_node_vba_*.c files that pass too many vba_vars_st elements.

I think most/all of the static functions should be refactored to pass 
vba_vars_st * or vba_vars_st **

fwiw, i found the calling function 
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation, 
hilariously long :)

I'll do the change if you want to pass this to me, I promise not to add 
to the above function name.

Tom

> ---
>
> This is just commit ab2ac59c32db ("drm/amd/display: Reduce number of
> arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()")
> applied to dml314.
>
>   .../dc/dml/dcn314/display_mode_vba_314.c      | 248 ++++--------------
>   1 file changed, 52 insertions(+), 196 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> index 2829f179f982..32ceb72f7a14 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> @@ -325,64 +325,28 @@ static void CalculateVupdateAndDynamicMetadataParameters(
>   static void CalculateWatermarksAndDRAMSpeedChangeSupport(
>   		struct display_mode_lib *mode_lib,
>   		unsigned int PrefetchMode,
> -		unsigned int NumberOfActivePlanes,
> -		unsigned int MaxLineBufferLines,
> -		unsigned int LineBufferSize,
> -		unsigned int WritebackInterfaceBufferSize,
>   		double DCFCLK,
>   		double ReturnBW,
> -		bool SynchronizedVBlank,
> -		unsigned int dpte_group_bytes[],
> -		unsigned int MetaChunkSize,
>   		double UrgentLatency,
>   		double ExtraLatency,
> -		double WritebackLatency,
> -		double WritebackChunkSize,
>   		double SOCCLK,
> -		double DRAMClockChangeLatency,
> -		double SRExitTime,
> -		double SREnterPlusExitTime,
> -		double SRExitZ8Time,
> -		double SREnterPlusExitZ8Time,
>   		double DCFCLKDeepSleep,
>   		unsigned int DETBufferSizeY[],
>   		unsigned int DETBufferSizeC[],
>   		unsigned int SwathHeightY[],
>   		unsigned int SwathHeightC[],
> -		unsigned int LBBitPerPixel[],
>   		double SwathWidthY[],
>   		double SwathWidthC[],
> -		double HRatio[],
> -		double HRatioChroma[],
> -		unsigned int vtaps[],
> -		unsigned int VTAPsChroma[],
> -		double VRatio[],
> -		double VRatioChroma[],
> -		unsigned int HTotal[],
> -		double PixelClock[],
> -		unsigned int BlendingAndTiming[],
>   		unsigned int DPPPerPlane[],
>   		double BytePerPixelDETY[],
>   		double BytePerPixelDETC[],
> -		double DSTXAfterScaler[],
> -		double DSTYAfterScaler[],
> -		bool WritebackEnable[],
> -		enum source_format_class WritebackPixelFormat[],
> -		double WritebackDestinationWidth[],
> -		double WritebackDestinationHeight[],
> -		double WritebackSourceHeight[],
>   		bool UnboundedRequestEnabled,
>   		unsigned int CompressedBufferSizeInkByte,
>   		enum clock_change_support *DRAMClockChangeSupport,
> -		double *UrgentWatermark,
> -		double *WritebackUrgentWatermark,
> -		double *DRAMClockChangeWatermark,
> -		double *WritebackDRAMClockChangeWatermark,
>   		double *StutterExitWatermark,
>   		double *StutterEnterPlusExitWatermark,
>   		double *Z8StutterExitWatermark,
> -		double *Z8StutterEnterPlusExitWatermark,
> -		double *MinActiveDRAMClockChangeLatencySupported);
> +		double *Z8StutterEnterPlusExitWatermark);
>   
>   static void CalculateDCFCLKDeepSleep(
>   		struct display_mode_lib *mode_lib,
> @@ -3041,64 +3005,28 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   		CalculateWatermarksAndDRAMSpeedChangeSupport(
>   				mode_lib,
>   				PrefetchMode,
> -				v->NumberOfActivePlanes,
> -				v->MaxLineBufferLines,
> -				v->LineBufferSize,
> -				v->WritebackInterfaceBufferSize,
>   				v->DCFCLK,
>   				v->ReturnBW,
> -				v->SynchronizedVBlank,
> -				v->dpte_group_bytes,
> -				v->MetaChunkSize,
>   				v->UrgentLatency,
>   				v->UrgentExtraLatency,
> -				v->WritebackLatency,
> -				v->WritebackChunkSize,
>   				v->SOCCLK,
> -				v->DRAMClockChangeLatency,
> -				v->SRExitTime,
> -				v->SREnterPlusExitTime,
> -				v->SRExitZ8Time,
> -				v->SREnterPlusExitZ8Time,
>   				v->DCFCLKDeepSleep,
>   				v->DETBufferSizeY,
>   				v->DETBufferSizeC,
>   				v->SwathHeightY,
>   				v->SwathHeightC,
> -				v->LBBitPerPixel,
>   				v->SwathWidthY,
>   				v->SwathWidthC,
> -				v->HRatio,
> -				v->HRatioChroma,
> -				v->vtaps,
> -				v->VTAPsChroma,
> -				v->VRatio,
> -				v->VRatioChroma,
> -				v->HTotal,
> -				v->PixelClock,
> -				v->BlendingAndTiming,
>   				v->DPPPerPlane,
>   				v->BytePerPixelDETY,
>   				v->BytePerPixelDETC,
> -				v->DSTXAfterScaler,
> -				v->DSTYAfterScaler,
> -				v->WritebackEnable,
> -				v->WritebackPixelFormat,
> -				v->WritebackDestinationWidth,
> -				v->WritebackDestinationHeight,
> -				v->WritebackSourceHeight,
>   				v->UnboundedRequestEnabled,
>   				v->CompressedBufferSizeInkByte,
>   				&DRAMClockChangeSupport,
> -				&v->UrgentWatermark,
> -				&v->WritebackUrgentWatermark,
> -				&v->DRAMClockChangeWatermark,
> -				&v->WritebackDRAMClockChangeWatermark,
>   				&v->StutterExitWatermark,
>   				&v->StutterEnterPlusExitWatermark,
>   				&v->Z8StutterExitWatermark,
> -				&v->Z8StutterEnterPlusExitWatermark,
> -				&v->MinActiveDRAMClockChangeLatencySupported);
> +				&v->Z8StutterEnterPlusExitWatermark);
>   
>   		for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>   			if (v->WritebackEnable[k] == true) {
> @@ -5496,64 +5424,28 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
>   			CalculateWatermarksAndDRAMSpeedChangeSupport(
>   					mode_lib,
>   					v->PrefetchModePerState[i][j],
> -					v->NumberOfActivePlanes,
> -					v->MaxLineBufferLines,
> -					v->LineBufferSize,
> -					v->WritebackInterfaceBufferSize,
>   					v->DCFCLKState[i][j],
>   					v->ReturnBWPerState[i][j],
> -					v->SynchronizedVBlank,
> -					v->dpte_group_bytes,
> -					v->MetaChunkSize,
>   					v->UrgLatency[i],
>   					v->ExtraLatency,
> -					v->WritebackLatency,
> -					v->WritebackChunkSize,
>   					v->SOCCLKPerState[i],
> -					v->DRAMClockChangeLatency,
> -					v->SRExitTime,
> -					v->SREnterPlusExitTime,
> -					v->SRExitZ8Time,
> -					v->SREnterPlusExitZ8Time,
>   					v->ProjectedDCFCLKDeepSleep[i][j],
>   					v->DETBufferSizeYThisState,
>   					v->DETBufferSizeCThisState,
>   					v->SwathHeightYThisState,
>   					v->SwathHeightCThisState,
> -					v->LBBitPerPixel,
>   					v->SwathWidthYThisState,
>   					v->SwathWidthCThisState,
> -					v->HRatio,
> -					v->HRatioChroma,
> -					v->vtaps,
> -					v->VTAPsChroma,
> -					v->VRatio,
> -					v->VRatioChroma,
> -					v->HTotal,
> -					v->PixelClock,
> -					v->BlendingAndTiming,
>   					v->NoOfDPPThisState,
>   					v->BytePerPixelInDETY,
>   					v->BytePerPixelInDETC,
> -					v->DSTXAfterScaler,
> -					v->DSTYAfterScaler,
> -					v->WritebackEnable,
> -					v->WritebackPixelFormat,
> -					v->WritebackDestinationWidth,
> -					v->WritebackDestinationHeight,
> -					v->WritebackSourceHeight,
>   					UnboundedRequestEnabledThisState,
>   					CompressedBufferSizeInkByteThisState,
>   					&v->DRAMClockChangeSupport[i][j],
> -					&v->UrgentWatermark,
> -					&v->WritebackUrgentWatermark,
> -					&v->DRAMClockChangeWatermark,
> -					&v->WritebackDRAMClockChangeWatermark,
> -					&dummy,
>   					&dummy,
>   					&dummy,
>   					&dummy,
> -					&v->MinActiveDRAMClockChangeLatencySupported);
> +					&dummy);
>   		}
>   	}
>   
> @@ -5679,64 +5571,28 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
>   static void CalculateWatermarksAndDRAMSpeedChangeSupport(
>   		struct display_mode_lib *mode_lib,
>   		unsigned int PrefetchMode,
> -		unsigned int NumberOfActivePlanes,
> -		unsigned int MaxLineBufferLines,
> -		unsigned int LineBufferSize,
> -		unsigned int WritebackInterfaceBufferSize,
>   		double DCFCLK,
>   		double ReturnBW,
> -		bool SynchronizedVBlank,
> -		unsigned int dpte_group_bytes[],
> -		unsigned int MetaChunkSize,
>   		double UrgentLatency,
>   		double ExtraLatency,
> -		double WritebackLatency,
> -		double WritebackChunkSize,
>   		double SOCCLK,
> -		double DRAMClockChangeLatency,
> -		double SRExitTime,
> -		double SREnterPlusExitTime,
> -		double SRExitZ8Time,
> -		double SREnterPlusExitZ8Time,
>   		double DCFCLKDeepSleep,
>   		unsigned int DETBufferSizeY[],
>   		unsigned int DETBufferSizeC[],
>   		unsigned int SwathHeightY[],
>   		unsigned int SwathHeightC[],
> -		unsigned int LBBitPerPixel[],
>   		double SwathWidthY[],
>   		double SwathWidthC[],
> -		double HRatio[],
> -		double HRatioChroma[],
> -		unsigned int vtaps[],
> -		unsigned int VTAPsChroma[],
> -		double VRatio[],
> -		double VRatioChroma[],
> -		unsigned int HTotal[],
> -		double PixelClock[],
> -		unsigned int BlendingAndTiming[],
>   		unsigned int DPPPerPlane[],
>   		double BytePerPixelDETY[],
>   		double BytePerPixelDETC[],
> -		double DSTXAfterScaler[],
> -		double DSTYAfterScaler[],
> -		bool WritebackEnable[],
> -		enum source_format_class WritebackPixelFormat[],
> -		double WritebackDestinationWidth[],
> -		double WritebackDestinationHeight[],
> -		double WritebackSourceHeight[],
>   		bool UnboundedRequestEnabled,
>   		unsigned int CompressedBufferSizeInkByte,
>   		enum clock_change_support *DRAMClockChangeSupport,
> -		double *UrgentWatermark,
> -		double *WritebackUrgentWatermark,
> -		double *DRAMClockChangeWatermark,
> -		double *WritebackDRAMClockChangeWatermark,
>   		double *StutterExitWatermark,
>   		double *StutterEnterPlusExitWatermark,
>   		double *Z8StutterExitWatermark,
> -		double *Z8StutterEnterPlusExitWatermark,
> -		double *MinActiveDRAMClockChangeLatencySupported)
> +		double *Z8StutterEnterPlusExitWatermark)
>   {
>   	struct vba_vars_st *v = &mode_lib->vba;
>   	double EffectiveLBLatencyHidingY;
> @@ -5756,103 +5612,103 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
>   	double TotalPixelBW = 0.0;
>   	int k, j;
>   
> -	*UrgentWatermark = UrgentLatency + ExtraLatency;
> +	v->UrgentWatermark = UrgentLatency + ExtraLatency;
>   
>   #ifdef __DML_VBA_DEBUG__
>   	dml_print("DML::%s: UrgentLatency = %f\n", __func__, UrgentLatency);
>   	dml_print("DML::%s: ExtraLatency = %f\n", __func__, ExtraLatency);
> -	dml_print("DML::%s: UrgentWatermark = %f\n", __func__, *UrgentWatermark);
> +	dml_print("DML::%s: UrgentWatermark = %f\n", __func__, v->UrgentWatermark);
>   #endif
>   
> -	*DRAMClockChangeWatermark = DRAMClockChangeLatency + *UrgentWatermark;
> +	v->DRAMClockChangeWatermark = v->DRAMClockChangeLatency + v->UrgentWatermark;
>   
>   #ifdef __DML_VBA_DEBUG__
> -	dml_print("DML::%s: DRAMClockChangeLatency = %f\n", __func__, DRAMClockChangeLatency);
> -	dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, *DRAMClockChangeWatermark);
> +	dml_print("DML::%s: v->DRAMClockChangeLatency = %f\n", __func__, v->DRAMClockChangeLatency);
> +	dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, v->DRAMClockChangeWatermark);
>   #endif
>   
>   	v->TotalActiveWriteback = 0;
> -	for (k = 0; k < NumberOfActivePlanes; ++k) {
> -		if (WritebackEnable[k] == true) {
> +	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> +		if (v->WritebackEnable[k] == true) {
>   			v->TotalActiveWriteback = v->TotalActiveWriteback + 1;
>   		}
>   	}
>   
>   	if (v->TotalActiveWriteback <= 1) {
> -		*WritebackUrgentWatermark = WritebackLatency;
> +		v->WritebackUrgentWatermark = v->WritebackLatency;
>   	} else {
> -		*WritebackUrgentWatermark = WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> +		v->WritebackUrgentWatermark = v->WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
>   	}
>   
>   	if (v->TotalActiveWriteback <= 1) {
> -		*WritebackDRAMClockChangeWatermark = DRAMClockChangeLatency + WritebackLatency;
> +		v->WritebackDRAMClockChangeWatermark = v->DRAMClockChangeLatency + v->WritebackLatency;
>   	} else {
> -		*WritebackDRAMClockChangeWatermark = DRAMClockChangeLatency + WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> +		v->WritebackDRAMClockChangeWatermark = v->DRAMClockChangeLatency + v->WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
>   	}
>   
> -	for (k = 0; k < NumberOfActivePlanes; ++k) {
> +	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>   		TotalPixelBW = TotalPixelBW
> -				+ DPPPerPlane[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] + SwathWidthC[k] * BytePerPixelDETC[k] * VRatioChroma[k])
> -						/ (HTotal[k] / PixelClock[k]);
> +				+ DPPPerPlane[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k] + SwathWidthC[k] * BytePerPixelDETC[k] * v->VRatioChroma[k])
> +						/ (v->HTotal[k] / v->PixelClock[k]);
>   	}
>   
> -	for (k = 0; k < NumberOfActivePlanes; ++k) {
> +	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>   		double EffectiveDETBufferSizeY = DETBufferSizeY[k];
>   
>   		v->LBLatencyHidingSourceLinesY = dml_min(
> -				(double) MaxLineBufferLines,
> -				dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (vtaps[k] - 1);
> +				(double) v->MaxLineBufferLines,
> +				dml_floor(v->LineBufferSize / v->LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(v->HRatio[k], 1.0)), 1)) - (v->vtaps[k] - 1);
>   
>   		v->LBLatencyHidingSourceLinesC = dml_min(
> -				(double) MaxLineBufferLines,
> -				dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTAPsChroma[k] - 1);
> +				(double) v->MaxLineBufferLines,
> +				dml_floor(v->LineBufferSize / v->LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(v->HRatioChroma[k], 1.0)), 1)) - (v->VTAPsChroma[k] - 1);
>   
> -		EffectiveLBLatencyHidingY = v->LBLatencyHidingSourceLinesY / VRatio[k] * (HTotal[k] / PixelClock[k]);
> +		EffectiveLBLatencyHidingY = v->LBLatencyHidingSourceLinesY / v->VRatio[k] * (v->HTotal[k] / v->PixelClock[k]);
>   
> -		EffectiveLBLatencyHidingC = v->LBLatencyHidingSourceLinesC / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
> +		EffectiveLBLatencyHidingC = v->LBLatencyHidingSourceLinesC / v->VRatioChroma[k] * (v->HTotal[k] / v->PixelClock[k]);
>   
>   		if (UnboundedRequestEnabled) {
>   			EffectiveDETBufferSizeY = EffectiveDETBufferSizeY
> -					+ CompressedBufferSizeInkByte * 1024 * SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] / (HTotal[k] / PixelClock[k]) / TotalPixelBW;
> +					+ CompressedBufferSizeInkByte * 1024 * SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k] / (v->HTotal[k] / v->PixelClock[k]) / TotalPixelBW;
>   		}
>   
>   		LinesInDETY[k] = (double) EffectiveDETBufferSizeY / BytePerPixelDETY[k] / SwathWidthY[k];
>   		LinesInDETYRoundedDownToSwath[k] = dml_floor(LinesInDETY[k], SwathHeightY[k]);
> -		FullDETBufferingTimeY = LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
> +		FullDETBufferingTimeY = LinesInDETYRoundedDownToSwath[k] * (v->HTotal[k] / v->PixelClock[k]) / v->VRatio[k];
>   		if (BytePerPixelDETC[k] > 0) {
>   			LinesInDETC = v->DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
>   			LinesInDETCRoundedDownToSwath = dml_floor(LinesInDETC, SwathHeightC[k]);
> -			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath * (HTotal[k] / PixelClock[k]) / VRatioChroma[k];
> +			FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath * (v->HTotal[k] / v->PixelClock[k]) / v->VRatioChroma[k];
>   		} else {
>   			LinesInDETC = 0;
>   			FullDETBufferingTimeC = 999999;
>   		}
>   
>   		ActiveDRAMClockChangeLatencyMarginY = EffectiveLBLatencyHidingY + FullDETBufferingTimeY
> -				- ((double) DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k] - *UrgentWatermark - *DRAMClockChangeWatermark;
> +				- ((double) v->DSTXAfterScaler[k] / v->HTotal[k] + v->DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k] - v->UrgentWatermark - v->DRAMClockChangeWatermark;
>   
> -		if (NumberOfActivePlanes > 1) {
> +		if (v->NumberOfActivePlanes > 1) {
>   			ActiveDRAMClockChangeLatencyMarginY = ActiveDRAMClockChangeLatencyMarginY
> -					- (1 - 1.0 / NumberOfActivePlanes) * SwathHeightY[k] * HTotal[k] / PixelClock[k] / VRatio[k];
> +					- (1 - 1.0 / v->NumberOfActivePlanes) * SwathHeightY[k] * v->HTotal[k] / v->PixelClock[k] / v->VRatio[k];
>   		}
>   
>   		if (BytePerPixelDETC[k] > 0) {
>   			ActiveDRAMClockChangeLatencyMarginC = EffectiveLBLatencyHidingC + FullDETBufferingTimeC
> -					- ((double) DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k] - *UrgentWatermark - *DRAMClockChangeWatermark;
> +					- ((double) v->DSTXAfterScaler[k] / v->HTotal[k] + v->DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k] - v->UrgentWatermark - v->DRAMClockChangeWatermark;
>   
> -			if (NumberOfActivePlanes > 1) {
> +			if (v->NumberOfActivePlanes > 1) {
>   				ActiveDRAMClockChangeLatencyMarginC = ActiveDRAMClockChangeLatencyMarginC
> -						- (1 - 1.0 / NumberOfActivePlanes) * SwathHeightC[k] * HTotal[k] / PixelClock[k] / VRatioChroma[k];
> +						- (1 - 1.0 / v->NumberOfActivePlanes) * SwathHeightC[k] * v->HTotal[k] / v->PixelClock[k] / v->VRatioChroma[k];
>   			}
>   			v->ActiveDRAMClockChangeLatencyMargin[k] = dml_min(ActiveDRAMClockChangeLatencyMarginY, ActiveDRAMClockChangeLatencyMarginC);
>   		} else {
>   			v->ActiveDRAMClockChangeLatencyMargin[k] = ActiveDRAMClockChangeLatencyMarginY;
>   		}
>   
> -		if (WritebackEnable[k] == true) {
> -			WritebackDRAMClockChangeLatencyHiding = WritebackInterfaceBufferSize * 1024
> -					/ (WritebackDestinationWidth[k] * WritebackDestinationHeight[k] / (WritebackSourceHeight[k] * HTotal[k] / PixelClock[k]) * 4);
> -			if (WritebackPixelFormat[k] == dm_444_64) {
> +		if (v->WritebackEnable[k] == true) {
> +			WritebackDRAMClockChangeLatencyHiding = v->WritebackInterfaceBufferSize * 1024
> +					/ (v->WritebackDestinationWidth[k] * v->WritebackDestinationHeight[k] / (v->WritebackSourceHeight[k] * v->HTotal[k] / v->PixelClock[k]) * 4);
> +			if (v->WritebackPixelFormat[k] == dm_444_64) {
>   				WritebackDRAMClockChangeLatencyHiding = WritebackDRAMClockChangeLatencyHiding / 2;
>   			}
>   			WritebackDRAMClockChangeLatencyMargin = WritebackDRAMClockChangeLatencyHiding - v->WritebackDRAMClockChangeWatermark;
> @@ -5862,14 +5718,14 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
>   
>   	v->MinActiveDRAMClockChangeMargin = 999999;
>   	PlaneWithMinActiveDRAMClockChangeMargin = 0;
> -	for (k = 0; k < NumberOfActivePlanes; ++k) {
> +	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>   		if (v->ActiveDRAMClockChangeLatencyMargin[k] < v->MinActiveDRAMClockChangeMargin) {
>   			v->MinActiveDRAMClockChangeMargin = v->ActiveDRAMClockChangeLatencyMargin[k];
> -			if (BlendingAndTiming[k] == k) {
> +			if (v->BlendingAndTiming[k] == k) {
>   				PlaneWithMinActiveDRAMClockChangeMargin = k;
>   			} else {
> -				for (j = 0; j < NumberOfActivePlanes; ++j) {
> -					if (BlendingAndTiming[k] == j) {
> +				for (j = 0; j < v->NumberOfActivePlanes; ++j) {
> +					if (v->BlendingAndTiming[k] == j) {
>   						PlaneWithMinActiveDRAMClockChangeMargin = j;
>   					}
>   				}
> @@ -5877,11 +5733,11 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
>   		}
>   	}
>   
> -	*MinActiveDRAMClockChangeLatencySupported = v->MinActiveDRAMClockChangeMargin + DRAMClockChangeLatency;
> +	v->MinActiveDRAMClockChangeLatencySupported = v->MinActiveDRAMClockChangeMargin + v->DRAMClockChangeLatency ;
>   
>   	SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = 999999;
> -	for (k = 0; k < NumberOfActivePlanes; ++k) {
> -		if (!((k == PlaneWithMinActiveDRAMClockChangeMargin) && (BlendingAndTiming[k] == k)) && !(BlendingAndTiming[k] == PlaneWithMinActiveDRAMClockChangeMargin)
> +	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> +		if (!((k == PlaneWithMinActiveDRAMClockChangeMargin) && (v->BlendingAndTiming[k] == k)) && !(v->BlendingAndTiming[k] == PlaneWithMinActiveDRAMClockChangeMargin)
>   				&& v->ActiveDRAMClockChangeLatencyMargin[k] < SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank) {
>   			SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = v->ActiveDRAMClockChangeLatencyMargin[k];
>   		}
> @@ -5889,25 +5745,25 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
>   
>   	v->TotalNumberOfActiveOTG = 0;
>   
> -	for (k = 0; k < NumberOfActivePlanes; ++k) {
> -		if (BlendingAndTiming[k] == k) {
> +	for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> +		if (v->BlendingAndTiming[k] == k) {
>   			v->TotalNumberOfActiveOTG = v->TotalNumberOfActiveOTG + 1;
>   		}
>   	}
>   
>   	if (v->MinActiveDRAMClockChangeMargin > 0 && PrefetchMode == 0) {
>   		*DRAMClockChangeSupport = dm_dram_clock_change_vactive;
> -	} else if ((SynchronizedVBlank == true || v->TotalNumberOfActiveOTG == 1
> +	} else if ((v->SynchronizedVBlank == true || v->TotalNumberOfActiveOTG == 1
>   			|| SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank > 0) && PrefetchMode == 0) {
>   		*DRAMClockChangeSupport = dm_dram_clock_change_vblank;
>   	} else {
>   		*DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
>   	}
>   
> -	*StutterExitWatermark = SRExitTime + ExtraLatency + 10 / DCFCLKDeepSleep;
> -	*StutterEnterPlusExitWatermark = (SREnterPlusExitTime + ExtraLatency + 10 / DCFCLKDeepSleep);
> -	*Z8StutterExitWatermark = SRExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
> -	*Z8StutterEnterPlusExitWatermark = SREnterPlusExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
> +	*StutterExitWatermark = v->SRExitTime + ExtraLatency + 10 / DCFCLKDeepSleep;
> +	*StutterEnterPlusExitWatermark = (v->SREnterPlusExitTime + ExtraLatency + 10 / DCFCLKDeepSleep);
> +	*Z8StutterExitWatermark = v->SRExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
> +	*Z8StutterEnterPlusExitWatermark = v->SREnterPlusExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
>   
>   #ifdef __DML_VBA_DEBUG__
>   	dml_print("DML::%s: StutterExitWatermark = %f\n", __func__, *StutterExitWatermark);
>
> base-commit: dacd2d2d9d800b7ab2ee2734578112532cba8105

