Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2453473024
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 16:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C980F10E708;
	Mon, 13 Dec 2021 15:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050::465:201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DB310E708
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 15:08:51 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4JCPzN6RlRzQk9y;
 Mon, 13 Dec 2021 16:08:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639408125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mticgOcWJlkcE7zIkDjBM9fr+EReYA5gT4xWIaoqfU=;
 b=YUNae0mzzg6OlUhY6YEprO8lOGrCI9iqWHH1mS7ludx/8jv2caxTesKwdsIURC+7HrvkUM
 3CBKQQdiVVNMp4HyVCT1cl86jNtOysCWHyw7rB8+kUnoBn79Ug/q7QszawS93DrDGRd7bL
 tRz7dk6pWkmaMEs3QGN6BdU+d212NO6jHPsVMJ23ZRZ9tRaoxHU+30mgAuMR36O6XQyz4Z
 q+rMZGEiSMx779+92O0fMuJI2Ic6H58ubOS/5ahqrlkTG59NeIiJL1iqHXQ5qt8BlFT3B6
 b1tx+csMgxr9B18uJHowZp7i7a3NUuRK0OrOAIS3DdwthmriJWrHbXdb1X9Wtw==
Message-ID: <64013052-450e-62f0-9be1-394b947b09f5@mailbox.org>
Date: Mon, 13 Dec 2021 16:08:41 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm/amd/display: Reduce stack size for
 dml31_ModeSupportAndSystemConfigurationFull
Content-Language: en-CA
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20211209164644.1622152-1-michel@daenzer.net>
 <f513ac48-a2e3-dae9-56f1-ba50da34f6c4@amd.com>
 <5a770e69-ea65-1e61-dc8f-f044b418dead@daenzer.net>
 <9a9134ef-35ba-13ef-b28e-ec3a168d99fe@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <9a9134ef-35ba-13ef-b28e-ec3a168d99fe@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-13 15:22, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2021-12-13 4:46 a.m., Michel Dänzer wrote:
>> On 2021-12-11 13:20, Rodrigo Siqueira Jordao wrote:
>>>
>>>
>>> On 2021-12-09 11:46 a.m., Michel Dänzer wrote:
>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>
>>>> Move code using the Pipe struct to a new helper function.
>>>>
>>>> Works around[0] this warning (resulting in failure to build a RHEL debug
>>>> kernel with Werror enabled):
>>>>
>>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c: In function ‘dml31_ModeSupportAndSystemConfigurationFull’:
>>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:5740:1: warning: the frame size of 2144 bytes is larger than 2048 bytes [-Wframe-larger-than=]
>>>>
>>>> The culprit seems to be the Pipe struct, so pull the relevant block out
>>>> into its own sub-function. (This is porting
>>>> a62427ef9b55 "drm/amd/display: Reduce stack size for dml21_ModeSupportAndSystemConfigurationFull"
>>>> from dml31 to dml21)
>>>>
>>>> [0] AFAICT this doesn't actually reduce the total amount of stack which
>>>> can be used, just moves some of it from
>>>> dml31_ModeSupportAndSystemConfigurationFull to the new helper function,
>>>> so the former happens to no longer exceed the limit for a single
>>>> function.
>>>>
>>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>>> ---
>>>>    .../dc/dml/dcn31/display_mode_vba_31.c        | 185 ++++++++++--------
>>>>    1 file changed, 99 insertions(+), 86 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
>>>> index 7e937bdcea00..8965f9af9d0a 100644
>>>> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
>>>> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
>>>> @@ -3949,6 +3949,102 @@ static double TruncToValidBPP(
>>>>        return BPP_INVALID;
>>>>    }
>>>>    +static noinline void CalculatePrefetchSchedulePerPlane(
>>>> +        struct display_mode_lib *mode_lib,
>>>> +        double HostVMInefficiencyFactor,
>>>> +        int i,
>>>> +        unsigned j,
>>>> +        unsigned k)
>>>> +{
>>>> +    struct vba_vars_st *v = &mode_lib->vba;
>>>> +    Pipe myPipe;
>>>> +
>>>> +    myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
>>>> +    myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
>>>> +    myPipe.PixelClock = v->PixelClock[k];
>>>> +    myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
>>>> +    myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
>>>> +    myPipe.ScalerEnabled = v->ScalerEnabled[k];
>>>> +    myPipe.SourceScan = v->SourceScan[k];
>>>> +    myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
>>>> +    myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
>>>> +    myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
>>>> +    myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
>>>> +    myPipe.InterlaceEnable = v->Interlace[k];
>>>> +    myPipe.NumberOfCursors = v->NumberOfCursors[k];
>>>> +    myPipe.VBlank = v->VTotal[k] - v->VActive[k];
>>>> +    myPipe.HTotal = v->HTotal[k];
>>>> +    myPipe.DCCEnable = v->DCCEnable[k];
>>>> +    myPipe.ODMCombineIsEnabled = v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
>>>> +        || v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1;
>>>> +    myPipe.SourcePixelFormat = v->SourcePixelFormat[k];
>>>> +    myPipe.BytePerPixelY = v->BytePerPixelY[k];
>>>> +    myPipe.BytePerPixelC = v->BytePerPixelC[k];
>>>> +    myPipe.ProgressiveToInterlaceUnitInOPP = v->ProgressiveToInterlaceUnitInOPP;
>>>> +    v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
>>>> +        mode_lib,
>>>> +        HostVMInefficiencyFactor,
>>>> +        &myPipe,
>>>> +        v->DSCDelayPerState[i][k],
>>>> +        v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
>>>> +        v->DPPCLKDelaySCL,
>>>> +        v->DPPCLKDelaySCLLBOnly,
>>>> +        v->DPPCLKDelayCNVCCursor,
>>>> +        v->DISPCLKDelaySubtotal,
>>>> +        v->SwathWidthYThisState[k] / v->HRatio[k],
>>>> +        v->OutputFormat[k],
>>>> +        v->MaxInterDCNTileRepeaters,
>>>> +        dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
>>>> +        v->MaximumVStartup[i][j][k],
>>>> +        v->GPUVMMaxPageTableLevels,
>>>> +        v->GPUVMEnable,
>>>> +        v->HostVMEnable,
>>>> +        v->HostVMMaxNonCachedPageTableLevels,
>>>> +        v->HostVMMinPageSize,
>>>> +        v->DynamicMetadataEnable[k],
>>>> +        v->DynamicMetadataVMEnabled,
>>>> +        v->DynamicMetadataLinesBeforeActiveRequired[k],
>>>> +        v->DynamicMetadataTransmittedBytes[k],
>>>> +        v->UrgLatency[i],
>>>> +        v->ExtraLatency,
>>>> +        v->TimeCalc,
>>>> +        v->PDEAndMetaPTEBytesPerFrame[i][j][k],
>>>> +        v->MetaRowBytes[i][j][k],
>>>> +        v->DPTEBytesPerRow[i][j][k],
>>>> +        v->PrefetchLinesY[i][j][k],
>>>> +        v->SwathWidthYThisState[k],
>>>> +        v->PrefillY[k],
>>>> +        v->MaxNumSwY[k],
>>>> +        v->PrefetchLinesC[i][j][k],
>>>> +        v->SwathWidthCThisState[k],
>>>> +        v->PrefillC[k],
>>>> +        v->MaxNumSwC[k],
>>>> +        v->swath_width_luma_ub_this_state[k],
>>>> +        v->swath_width_chroma_ub_this_state[k],
>>>> +        v->SwathHeightYThisState[k],
>>>> +        v->SwathHeightCThisState[k],
>>>> +        v->TWait,
>>>> +        &v->DSTXAfterScaler[k],
>>>> +        &v->DSTYAfterScaler[k],
>>>> +        &v->LineTimesForPrefetch[k],
>>>> +        &v->PrefetchBW[k],
>>>> +        &v->LinesForMetaPTE[k],
>>>> +        &v->LinesForMetaAndDPTERow[k],
>>>> +        &v->VRatioPreY[i][j][k],
>>>> +        &v->VRatioPreC[i][j][k],
>>>> +        &v->RequiredPrefetchPixelDataBWLuma[i][j][k],
>>>> +        &v->RequiredPrefetchPixelDataBWChroma[i][j][k],
>>>> +        &v->NoTimeForDynamicMetadata[i][j][k],
>>>> +        &v->Tno_bw[k],
>>>> +        &v->prefetch_vmrow_bw[k],
>>>> +        &v->dummy7[k],
>>>> +        &v->dummy8[k],
>>>> +        &v->dummy13[k],
>>>> +        &v->VUpdateOffsetPix[k],
>>>> +        &v->VUpdateWidthPix[k],
>>>> +        &v->VReadyOffsetPix[k]);
>>>> +}
>>>> +
>>>>    void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>>>>    {
>>>>        struct vba_vars_st *v = &mode_lib->vba;
>>>> @@ -5276,92 +5372,9 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>>>>                            v->SREnterPlusExitTime);
>>>>                      for (k = 0; k < v->NumberOfActivePlanes; k++) {
>>>> -                    Pipe myPipe;
>>>> -
>>>> -                    myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
>>>> -                    myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
>>>> -                    myPipe.PixelClock = v->PixelClock[k];
>>>> -                    myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
>>>> -                    myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
>>>> -                    myPipe.ScalerEnabled = v->ScalerEnabled[k];
>>>> -                    myPipe.SourceScan = v->SourceScan[k];
>>>> -                    myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
>>>> -                    myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
>>>> -                    myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
>>>> -                    myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
>>>> -                    myPipe.InterlaceEnable = v->Interlace[k];
>>>> -                    myPipe.NumberOfCursors = v->NumberOfCursors[k];
>>>> -                    myPipe.VBlank = v->VTotal[k] - v->VActive[k];
>>>> -                    myPipe.HTotal = v->HTotal[k];
>>>> -                    myPipe.DCCEnable = v->DCCEnable[k];
>>>> -                    myPipe.ODMCombineIsEnabled = v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
>>>> -                            || v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1;
>>>> -                    myPipe.SourcePixelFormat = v->SourcePixelFormat[k];
>>>> -                    myPipe.BytePerPixelY = v->BytePerPixelY[k];
>>>> -                    myPipe.BytePerPixelC = v->BytePerPixelC[k];
>>>> -                    myPipe.ProgressiveToInterlaceUnitInOPP = v->ProgressiveToInterlaceUnitInOPP;
>>>> -                    v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
>>>> -                            mode_lib,
>>>> -                            HostVMInefficiencyFactor,
>>>> -                            &myPipe,
>>>> -                            v->DSCDelayPerState[i][k],
>>>> -                            v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
>>>> -                            v->DPPCLKDelaySCL,
>>>> -                            v->DPPCLKDelaySCLLBOnly,
>>>> -                            v->DPPCLKDelayCNVCCursor,
>>>> -                            v->DISPCLKDelaySubtotal,
>>>> -                            v->SwathWidthYThisState[k] / v->HRatio[k],
>>>> -                            v->OutputFormat[k],
>>>> -                            v->MaxInterDCNTileRepeaters,
>>>> -                            dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
>>>> -                            v->MaximumVStartup[i][j][k],
>>>> -                            v->GPUVMMaxPageTableLevels,
>>>> -                            v->GPUVMEnable,
>>>> -                            v->HostVMEnable,
>>>> -                            v->HostVMMaxNonCachedPageTableLevels,
>>>> -                            v->HostVMMinPageSize,
>>>> -                            v->DynamicMetadataEnable[k],
>>>> -                            v->DynamicMetadataVMEnabled,
>>>> -                            v->DynamicMetadataLinesBeforeActiveRequired[k],
>>>> -                            v->DynamicMetadataTransmittedBytes[k],
>>>> -                            v->UrgLatency[i],
>>>> -                            v->ExtraLatency,
>>>> -                            v->TimeCalc,
>>>> -                            v->PDEAndMetaPTEBytesPerFrame[i][j][k],
>>>> -                            v->MetaRowBytes[i][j][k],
>>>> -                            v->DPTEBytesPerRow[i][j][k],
>>>> -                            v->PrefetchLinesY[i][j][k],
>>>> -                            v->SwathWidthYThisState[k],
>>>> -                            v->PrefillY[k],
>>>> -                            v->MaxNumSwY[k],
>>>> -                            v->PrefetchLinesC[i][j][k],
>>>> -                            v->SwathWidthCThisState[k],
>>>> -                            v->PrefillC[k],
>>>> -                            v->MaxNumSwC[k],
>>>> -                            v->swath_width_luma_ub_this_state[k],
>>>> -                            v->swath_width_chroma_ub_this_state[k],
>>>> -                            v->SwathHeightYThisState[k],
>>>> -                            v->SwathHeightCThisState[k],
>>>> -                            v->TWait,
>>>> -                            &v->DSTXAfterScaler[k],
>>>> -                            &v->DSTYAfterScaler[k],
>>>> -                            &v->LineTimesForPrefetch[k],
>>>> -                            &v->PrefetchBW[k],
>>>> -                            &v->LinesForMetaPTE[k],
>>>> -                            &v->LinesForMetaAndDPTERow[k],
>>>> -                            &v->VRatioPreY[i][j][k],
>>>> -                            &v->VRatioPreC[i][j][k],
>>>> -                            &v->RequiredPrefetchPixelDataBWLuma[i][j][k],
>>>> -                            &v->RequiredPrefetchPixelDataBWChroma[i][j][k],
>>>> -                            &v->NoTimeForDynamicMetadata[i][j][k],
>>>> -                            &v->Tno_bw[k],
>>>> -                            &v->prefetch_vmrow_bw[k],
>>>> -                            &v->dummy7[k],
>>>> -                            &v->dummy8[k],
>>>> -                            &v->dummy13[k],
>>>> -                            &v->VUpdateOffsetPix[k],
>>>> -                            &v->VUpdateWidthPix[k],
>>>> -                            &v->VReadyOffsetPix[k]);
>>>> +                    CalculatePrefetchSchedulePerPlane(mode_lib,
>>>> +                                      HostVMInefficiencyFactor,
>>>> +                                      i, j,    k);
>>>>                    }
>>>>                      for (k = 0; k < v->NumberOfActivePlanes; k++) {
>>>>
>>>
>>> Hi Michel,
>>>
>>> Overwall I think this series is good. I also run it in our internal CI and everything looks fine.
>>>
>>> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>
>>> And applied to amd-staging-drm-next.
>>
>> Thanks!
>>
>> Are there any plans for actually reducing the combined amount of stack used by ModeSupportAndSystemConfigurationFull + CalculatePrefetchSchedulePerPlane?
> 
> Hi Michel,
> 
> Tbh, I'm not fully aware of the problem with the stack size used by "ModeSupportAndSystemConfigurationFull + CalculatePrefetchSchedulePerPlane". Could you help me to understand it better?

The warning which inspired this patch (and the corresponding change to dml21_ModeSupportAndSystemConfigurationFull) is about ModeSupportAndSystemConfigurationFull exceeding a threshold of stack usage. The patch moves some of that stack usage to the new CalculatePrefetchSchedulePerPlane helper function. However, since the former calls the latter, together they still use as much stack (possibly even slightly more, due to the function calling convention) as before. So while we've silenced the warning, we haven't actually improved the situation the warning is about.

> Could you provide some background? Also, could you help me better understand the impact of this stack size issue in the DML code? Any information will be helpful.

I don't know the exact reasons for the warning offhand. Presumably the fact that this warning is enabled indicates that stack usage should be minimized though, or at least stack shouldn't be lightly wasted.


>> Also, did you check that UseMinimumDCFCLK now modifying mode_lib->vba.DCFCLKState[i][j] and possibly other values in mode_lib->vba makes sense?
> 
> To check this patch, I submitted it to our Internal CI, where we ran a couple of IGT tests in multiple ASICs, and I conducted a simple smoke test using 5600XT and a Raven system. Everything was fine.
> 
> Finally, I checked Dmytro's opinion about this change, and he agreed that your patch is fine.

Great, thanks.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
