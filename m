Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46444725DA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8252210E40D;
	Mon, 13 Dec 2021 09:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id E8C8910E70C;
 Mon, 13 Dec 2021 09:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 39DBE202059;
 Mon, 13 Dec 2021 10:46:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id bSU9bMWm0Dyw; Mon, 13 Dec 2021 10:46:45 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 97729202025;
 Mon, 13 Dec 2021 10:46:35 +0100 (CET)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1mwhuk-000TEs-TX;
 Mon, 13 Dec 2021 10:46:34 +0100
Message-ID: <5a770e69-ea65-1e61-dc8f-f044b418dead@daenzer.net>
Date: Mon, 13 Dec 2021 10:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-CA
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20211209164644.1622152-1-michel@daenzer.net>
 <f513ac48-a2e3-dae9-56f1-ba50da34f6c4@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 1/2] drm/amd/display: Reduce stack size for
 dml31_ModeSupportAndSystemConfigurationFull
In-Reply-To: <f513ac48-a2e3-dae9-56f1-ba50da34f6c4@amd.com>
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
Reply-To: michel.daenzer@mailbox.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-11 13:20, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2021-12-09 11:46 a.m., Michel Dänzer wrote:
>> From: Michel Dänzer <mdaenzer@redhat.com>
>>
>> Move code using the Pipe struct to a new helper function.
>>
>> Works around[0] this warning (resulting in failure to build a RHEL debug
>> kernel with Werror enabled):
>>
>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c: In function ‘dml31_ModeSupportAndSystemConfigurationFull’:
>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:5740:1: warning: the frame size of 2144 bytes is larger than 2048 bytes [-Wframe-larger-than=]
>>
>> The culprit seems to be the Pipe struct, so pull the relevant block out
>> into its own sub-function. (This is porting
>> a62427ef9b55 "drm/amd/display: Reduce stack size for dml21_ModeSupportAndSystemConfigurationFull"
>> from dml31 to dml21)
>>
>> [0] AFAICT this doesn't actually reduce the total amount of stack which
>> can be used, just moves some of it from
>> dml31_ModeSupportAndSystemConfigurationFull to the new helper function,
>> so the former happens to no longer exceed the limit for a single
>> function.
>>
>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>> ---
>>   .../dc/dml/dcn31/display_mode_vba_31.c        | 185 ++++++++++--------
>>   1 file changed, 99 insertions(+), 86 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
>> index 7e937bdcea00..8965f9af9d0a 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
>> @@ -3949,6 +3949,102 @@ static double TruncToValidBPP(
>>       return BPP_INVALID;
>>   }
>>   +static noinline void CalculatePrefetchSchedulePerPlane(
>> +        struct display_mode_lib *mode_lib,
>> +        double HostVMInefficiencyFactor,
>> +        int i,
>> +        unsigned j,
>> +        unsigned k)
>> +{
>> +    struct vba_vars_st *v = &mode_lib->vba;
>> +    Pipe myPipe;
>> +
>> +    myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
>> +    myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
>> +    myPipe.PixelClock = v->PixelClock[k];
>> +    myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
>> +    myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
>> +    myPipe.ScalerEnabled = v->ScalerEnabled[k];
>> +    myPipe.SourceScan = v->SourceScan[k];
>> +    myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
>> +    myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
>> +    myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
>> +    myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
>> +    myPipe.InterlaceEnable = v->Interlace[k];
>> +    myPipe.NumberOfCursors = v->NumberOfCursors[k];
>> +    myPipe.VBlank = v->VTotal[k] - v->VActive[k];
>> +    myPipe.HTotal = v->HTotal[k];
>> +    myPipe.DCCEnable = v->DCCEnable[k];
>> +    myPipe.ODMCombineIsEnabled = v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
>> +        || v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1;
>> +    myPipe.SourcePixelFormat = v->SourcePixelFormat[k];
>> +    myPipe.BytePerPixelY = v->BytePerPixelY[k];
>> +    myPipe.BytePerPixelC = v->BytePerPixelC[k];
>> +    myPipe.ProgressiveToInterlaceUnitInOPP = v->ProgressiveToInterlaceUnitInOPP;
>> +    v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
>> +        mode_lib,
>> +        HostVMInefficiencyFactor,
>> +        &myPipe,
>> +        v->DSCDelayPerState[i][k],
>> +        v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
>> +        v->DPPCLKDelaySCL,
>> +        v->DPPCLKDelaySCLLBOnly,
>> +        v->DPPCLKDelayCNVCCursor,
>> +        v->DISPCLKDelaySubtotal,
>> +        v->SwathWidthYThisState[k] / v->HRatio[k],
>> +        v->OutputFormat[k],
>> +        v->MaxInterDCNTileRepeaters,
>> +        dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
>> +        v->MaximumVStartup[i][j][k],
>> +        v->GPUVMMaxPageTableLevels,
>> +        v->GPUVMEnable,
>> +        v->HostVMEnable,
>> +        v->HostVMMaxNonCachedPageTableLevels,
>> +        v->HostVMMinPageSize,
>> +        v->DynamicMetadataEnable[k],
>> +        v->DynamicMetadataVMEnabled,
>> +        v->DynamicMetadataLinesBeforeActiveRequired[k],
>> +        v->DynamicMetadataTransmittedBytes[k],
>> +        v->UrgLatency[i],
>> +        v->ExtraLatency,
>> +        v->TimeCalc,
>> +        v->PDEAndMetaPTEBytesPerFrame[i][j][k],
>> +        v->MetaRowBytes[i][j][k],
>> +        v->DPTEBytesPerRow[i][j][k],
>> +        v->PrefetchLinesY[i][j][k],
>> +        v->SwathWidthYThisState[k],
>> +        v->PrefillY[k],
>> +        v->MaxNumSwY[k],
>> +        v->PrefetchLinesC[i][j][k],
>> +        v->SwathWidthCThisState[k],
>> +        v->PrefillC[k],
>> +        v->MaxNumSwC[k],
>> +        v->swath_width_luma_ub_this_state[k],
>> +        v->swath_width_chroma_ub_this_state[k],
>> +        v->SwathHeightYThisState[k],
>> +        v->SwathHeightCThisState[k],
>> +        v->TWait,
>> +        &v->DSTXAfterScaler[k],
>> +        &v->DSTYAfterScaler[k],
>> +        &v->LineTimesForPrefetch[k],
>> +        &v->PrefetchBW[k],
>> +        &v->LinesForMetaPTE[k],
>> +        &v->LinesForMetaAndDPTERow[k],
>> +        &v->VRatioPreY[i][j][k],
>> +        &v->VRatioPreC[i][j][k],
>> +        &v->RequiredPrefetchPixelDataBWLuma[i][j][k],
>> +        &v->RequiredPrefetchPixelDataBWChroma[i][j][k],
>> +        &v->NoTimeForDynamicMetadata[i][j][k],
>> +        &v->Tno_bw[k],
>> +        &v->prefetch_vmrow_bw[k],
>> +        &v->dummy7[k],
>> +        &v->dummy8[k],
>> +        &v->dummy13[k],
>> +        &v->VUpdateOffsetPix[k],
>> +        &v->VUpdateWidthPix[k],
>> +        &v->VReadyOffsetPix[k]);
>> +}
>> +
>>   void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>>   {
>>       struct vba_vars_st *v = &mode_lib->vba;
>> @@ -5276,92 +5372,9 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>>                           v->SREnterPlusExitTime);
>>                     for (k = 0; k < v->NumberOfActivePlanes; k++) {
>> -                    Pipe myPipe;
>> -
>> -                    myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
>> -                    myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
>> -                    myPipe.PixelClock = v->PixelClock[k];
>> -                    myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
>> -                    myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
>> -                    myPipe.ScalerEnabled = v->ScalerEnabled[k];
>> -                    myPipe.SourceScan = v->SourceScan[k];
>> -                    myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
>> -                    myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
>> -                    myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
>> -                    myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
>> -                    myPipe.InterlaceEnable = v->Interlace[k];
>> -                    myPipe.NumberOfCursors = v->NumberOfCursors[k];
>> -                    myPipe.VBlank = v->VTotal[k] - v->VActive[k];
>> -                    myPipe.HTotal = v->HTotal[k];
>> -                    myPipe.DCCEnable = v->DCCEnable[k];
>> -                    myPipe.ODMCombineIsEnabled = v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
>> -                            || v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1;
>> -                    myPipe.SourcePixelFormat = v->SourcePixelFormat[k];
>> -                    myPipe.BytePerPixelY = v->BytePerPixelY[k];
>> -                    myPipe.BytePerPixelC = v->BytePerPixelC[k];
>> -                    myPipe.ProgressiveToInterlaceUnitInOPP = v->ProgressiveToInterlaceUnitInOPP;
>> -                    v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
>> -                            mode_lib,
>> -                            HostVMInefficiencyFactor,
>> -                            &myPipe,
>> -                            v->DSCDelayPerState[i][k],
>> -                            v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
>> -                            v->DPPCLKDelaySCL,
>> -                            v->DPPCLKDelaySCLLBOnly,
>> -                            v->DPPCLKDelayCNVCCursor,
>> -                            v->DISPCLKDelaySubtotal,
>> -                            v->SwathWidthYThisState[k] / v->HRatio[k],
>> -                            v->OutputFormat[k],
>> -                            v->MaxInterDCNTileRepeaters,
>> -                            dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
>> -                            v->MaximumVStartup[i][j][k],
>> -                            v->GPUVMMaxPageTableLevels,
>> -                            v->GPUVMEnable,
>> -                            v->HostVMEnable,
>> -                            v->HostVMMaxNonCachedPageTableLevels,
>> -                            v->HostVMMinPageSize,
>> -                            v->DynamicMetadataEnable[k],
>> -                            v->DynamicMetadataVMEnabled,
>> -                            v->DynamicMetadataLinesBeforeActiveRequired[k],
>> -                            v->DynamicMetadataTransmittedBytes[k],
>> -                            v->UrgLatency[i],
>> -                            v->ExtraLatency,
>> -                            v->TimeCalc,
>> -                            v->PDEAndMetaPTEBytesPerFrame[i][j][k],
>> -                            v->MetaRowBytes[i][j][k],
>> -                            v->DPTEBytesPerRow[i][j][k],
>> -                            v->PrefetchLinesY[i][j][k],
>> -                            v->SwathWidthYThisState[k],
>> -                            v->PrefillY[k],
>> -                            v->MaxNumSwY[k],
>> -                            v->PrefetchLinesC[i][j][k],
>> -                            v->SwathWidthCThisState[k],
>> -                            v->PrefillC[k],
>> -                            v->MaxNumSwC[k],
>> -                            v->swath_width_luma_ub_this_state[k],
>> -                            v->swath_width_chroma_ub_this_state[k],
>> -                            v->SwathHeightYThisState[k],
>> -                            v->SwathHeightCThisState[k],
>> -                            v->TWait,
>> -                            &v->DSTXAfterScaler[k],
>> -                            &v->DSTYAfterScaler[k],
>> -                            &v->LineTimesForPrefetch[k],
>> -                            &v->PrefetchBW[k],
>> -                            &v->LinesForMetaPTE[k],
>> -                            &v->LinesForMetaAndDPTERow[k],
>> -                            &v->VRatioPreY[i][j][k],
>> -                            &v->VRatioPreC[i][j][k],
>> -                            &v->RequiredPrefetchPixelDataBWLuma[i][j][k],
>> -                            &v->RequiredPrefetchPixelDataBWChroma[i][j][k],
>> -                            &v->NoTimeForDynamicMetadata[i][j][k],
>> -                            &v->Tno_bw[k],
>> -                            &v->prefetch_vmrow_bw[k],
>> -                            &v->dummy7[k],
>> -                            &v->dummy8[k],
>> -                            &v->dummy13[k],
>> -                            &v->VUpdateOffsetPix[k],
>> -                            &v->VUpdateWidthPix[k],
>> -                            &v->VReadyOffsetPix[k]);
>> +                    CalculatePrefetchSchedulePerPlane(mode_lib,
>> +                                      HostVMInefficiencyFactor,
>> +                                      i, j,    k);
>>                   }
>>                     for (k = 0; k < v->NumberOfActivePlanes; k++) {
>>
> 
> Hi Michel,
> 
> Overwall I think this series is good. I also run it in our internal CI and everything looks fine.
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> And applied to amd-staging-drm-next.

Thanks!

Are there any plans for actually reducing the combined amount of stack used by ModeSupportAndSystemConfigurationFull + CalculatePrefetchSchedulePerPlane?


Also, did you check that UseMinimumDCFCLK now modifying mode_lib->vba.DCFCLKState[i][j] and possibly other values in mode_lib->vba makes sense?


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
