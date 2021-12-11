Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF674713C0
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 13:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BD110EC0C;
	Sat, 11 Dec 2021 12:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DBF10EC0C;
 Sat, 11 Dec 2021 12:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPwwRwcXEpHt4UG0b7fDukJuA2d8J6kj6kGfGdShdHMpoQ9MZzgS90WXjpCYv1pWwJQ9RrxtkpgkRGIuYd+oA8XbqChmfB5WBFoxWxe9BgI+F6Cc5TWemLJZi0+EZ536U1k2eJ7ipjGg7ddOJ1vbSUpbWgWuc8pZ5QuI+ii1tExBHVPywNwrXMNasi/Lcff3q/ICLbEAxgjBRu9qjNbN8FW3UdFUl5z5Ce+o9aXmhLMczZptyMNtxtWsOdEESr9T/ZqA4FzbjHFzLSNMmNUCKTWX5IKXo7clUP8oEyTcQFlKDqvfXVSy9l7PYpz9hIcxa8nKUHlDIIciO+q3Kdz04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C36hda2n/Gijcei3rC55Pj2mH0i75JlwPpId4wVngDc=;
 b=bf+F1OVpgbtTIYtp58+q8Qodn6bfvahfYkyGl8xfoetLgfkCofEGugSjcTeqSPqUW8Fs/GkcDov3IPq7bdRN6aQh5kHdu7O8wp6z/sLIRSaTID/2p+yg64B66V0KXfnvHwWPjNJE1CgFHzjZHRrW97PtKphkXvTlMfSA20D4/rzOK3PArUtFQNg+d6nv2LAkEgagmL7ojiBGfxW191Bgni5d62lkJWmZ4YRlJXIX85xpmLK/Z1ko6Nh9eNhpj90PGs+udcPTwujNTmwr8epvTAmAZgldD69npsoHZQdEbHeKbG8XtPWk15GuYvbBYanofxIYzi57n1QlqFnDvXNTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C36hda2n/Gijcei3rC55Pj2mH0i75JlwPpId4wVngDc=;
 b=gNvpsU2gvnHS+yilyxHJ8ALdNPOXClijefjRQ39cpASB+6WEwvuI8cHmK5dJgwQyWT0rVIPRthcIoEbpCKLDyc+cRiIYfHtHBBvlfAQcLTuesx+o5H6QV7R78DmYqK2YHYIyP0ahVwRmjPnHV3n+fEd+1pSEBt4+cn/mX/geOQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by MN2PR12MB3168.namprd12.prod.outlook.com (2603:10b6:208:af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Sat, 11 Dec
 2021 12:20:21 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3%7]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 12:20:21 +0000
Subject: Re: [PATCH 1/2] drm/amd/display: Reduce stack size for
 dml31_ModeSupportAndSystemConfigurationFull
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20211209164644.1622152-1-michel@daenzer.net>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <f513ac48-a2e3-dae9-56f1-ba50da34f6c4@amd.com>
Date: Sat, 11 Dec 2021 07:20:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211209164644.1622152-1-michel@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:208:32a::9) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02832412-be20-4f1c-3ce0-08d9bca099bd
X-MS-TrafficTypeDiagnostic: MN2PR12MB3168:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB316871E8D78E4F380B53EF5598729@MN2PR12MB3168.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 22esLWk/sYAlmK+oEtS/1lg1lch4M5IC7k5zNS0QVOAQrki1uEZHU4/2Y70x19dUAaz45olGrVEzhHoH7YIagx0uF7tPiJpkNADSQ9+0xXTiswfEFnG0yUIWdCG1734Rtuj38jY+Gg6A24IzwJFF9MIitiZ/cMkMqV3mcY+srJMoXo0ioyIYqgqCRP5oglmsrSorUz2IAu/JvQqCikNFTxEDRGiAszg5BBl57cU/s8I0ZZlxsVrGHODQNWodTkgbIQM9ZvGfGs0itgw2ARDWyGKdJIn/zCO1v90wqg/be9qbaVL5jOfTBR8mo0fhcIt7BsQ3QZbbaAgpPgbSPJWQOSqI8ogGGQSDE/aJLuwGjnt0axgsyy49/1UabkHvRGBfRsvaWMVYpqDkK3jFSv9GR+wara+kdzd334gmS2Fj12ZYHhypBPVUKgrJzgmWGM3at/+wFXvNg91qEnr4EhCmv6Vec9TkCOQGYEuePsRUabwO8KaU1wWVQoLMSyhWSDV401qlzaOzQ35NtyhKG7Q6IK5ZrfsqReLxYxzA/BLyTF9AYv2mHdbBxGbM9PeCK9QrGNfYnvWyNxbFd9q6FApgPza6+VmY0Mvhz1BFnqkL5yjr30DTDoG4oq41gzsHzU9wtUJLWkMl3iVE+h+NI0uCJrLDdqDNd+GOB0my1B4niDRz1yeSLj82zsYiAeApHp9pgeNoCAUsehhWbul9HAP6woTMzGk0WIkYUKZD4/qKCgQ/ASsKougOOob0ZaXkhjUMABwTzFZWV1QIpW5jJLlKfmkeJbvlqfzxbehmtZ4Ifyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(5660300002)(186003)(2906002)(31686004)(110136005)(31696002)(6636002)(19627235002)(36756003)(6666004)(66556008)(6512007)(66574015)(6486002)(8936002)(508600001)(53546011)(4326008)(83380400001)(316002)(8676002)(38100700002)(66946007)(6506007)(66476007)(213903007)(43740500002)(45980500001)(44824005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWQ3cEY2R3ltUFZ6bHA4QUpGNlNtdC9JZW8za3RxYVVaZG5WSk9LV0dmZ1RC?=
 =?utf-8?B?aE9abHJvNmFnZjVMbHFraVRCWmxEVVVqaHZMNUJsTmlBZVU3ZzhqMmlTRXpn?=
 =?utf-8?B?Z29KeHBoT1ZaaUg1RlhzekkyVGE3VzhKc09ZOTZqVVVWWm1qem9wdy9CYW45?=
 =?utf-8?B?L0RkNm1Sak9HNzBvNVorbXluMjBySHpYckhzS21Jb0NZdzMyMFFOVkZyWnBQ?=
 =?utf-8?B?c3F4V1QxK2NiNHdGdjIzdGhFd2w4S2plaVh4UTdmVXpseWQ1RGxqakFUQ0p4?=
 =?utf-8?B?TWM0NVNVZXJINWpUTEx6RWZHZUt5MklLNmV1QkZhYmR2OXVtT0UrekFET2Jn?=
 =?utf-8?B?azNUQzZoa2Z5dnlWcExvdEhSQ2RpQ3RUMWtSOEZlelZ6QXpuekRzQzlRV29U?=
 =?utf-8?B?amxwZHBzSWhsdHNSZkpBeGtRTE1OSG82MUF4eHZLL2lnMEx1MHNQandzaFZh?=
 =?utf-8?B?RmhmZUxKVHgwVjVCWUplRUJtTDcrcStrLzl5cTY2OHJYVHBtRHlwemRsREdZ?=
 =?utf-8?B?dWlSMEdtR0U4NFdXNUtoU29QV0d1a1JRU25IS053Wm4rU2RCRzFOQ3RRS1VZ?=
 =?utf-8?B?UnRpTFFjVVNNREQ0TFF0K3lTcjlvWGJwekVWSHZyRE8wTnp0UTBiTTlteXNB?=
 =?utf-8?B?ZzJyTktJUlR4eGFSMHE1bWQ3blA5Z2R0N0g1MjVFbTVGa2dLUm5GbFRrRnFl?=
 =?utf-8?B?eFR5L0ZNZmVXSEV4bGpYVHlHem0wODRydkhPZ1U2VlA1Q0Y1UE9EODNpSjVU?=
 =?utf-8?B?MnF4MHVGRHB2TmRoUzh3M2VnbVNZNm8zQ2EySTh1ZnRJeElSWmlRdFFVN011?=
 =?utf-8?B?b1ZEc3ZuNjMzMkZmeGg4MXdWRzZSdTdzRWNCM3BkMytjSXFMUTZDMlRYQ3Iy?=
 =?utf-8?B?dWY0TTNiaHQ4TE1DNUxubWVPbEZvYldZTmNKMVRnNHNoenhKUXMvQS9VMloy?=
 =?utf-8?B?bHVtNVM2Z21iRVU4SktKenM3STNPRlJrQVJSOWRKR3UwOFFQeWFUSFo3Y1BG?=
 =?utf-8?B?VXVkTGtCcVl2UENEUXFBL2ZyNUdJWjVFTFM3NHVicnREWHM4bXVSV01hQ2tG?=
 =?utf-8?B?VzQyVitWa3BEaWV2VENmZHg2Vi9iWjd0UlJLZWY3a1JUYzdySEdpdzMya3Zm?=
 =?utf-8?B?L29QMWQrSHl6MW02d0RYbTh4WU9HMnNZdmZNS3p4WDQyYnRBTVFzbkJSTjVZ?=
 =?utf-8?B?cHpNbDN3SzhlTnM0V3FPa1ErOTFTL3Z4V1h4aUc4ZzVjbUVaMGVVanZwTmdT?=
 =?utf-8?B?OTNqU0d5dWhJamZSWEdQRmVCNFRsWXp1VHcrQWZxcG9pdDJITkVqdG95TS9J?=
 =?utf-8?B?NWxnR2FOQkxKRkhnTEpGRlZrQitHN0Zja29wazNMQVlKdVBoUGQ4RUZ6M1d0?=
 =?utf-8?B?ZklsbDk0TGRXQ0tkZy9vVFc4dUZWZUtVQ3ZVWlFiL0lVc1JuUmdBaHFVdXFy?=
 =?utf-8?B?VStVUlIvVHoyOTVjVjRQM0w5U3VJS3QzNE9hMi8yWTNESWNyRUJ5QlJhYU1S?=
 =?utf-8?B?NGR3ZjNWWTBnTjlFNU5ocXZscG00aVRDUG1PUWU5aTd6WlZSK1N2ODFFYXVh?=
 =?utf-8?B?TkdGNVdqOHZxSFErSG51dG5QV3UzaytOK3U1TUQvMDJCYlZ4b252T3cxL0J3?=
 =?utf-8?B?dnJsOFdSWXBZbkhHV21mM1hUU2J2MWFOMWtpZ2RtcGVGSVkxVTRFY241UzBi?=
 =?utf-8?B?UmgzWm9iU2kwbysycHAxNitCU3BYeU44NlZ3UHYwMFpZVkZkMVFTOGlpSSt4?=
 =?utf-8?B?cGZENHR5YXZsc1FFYnZwYXNOWjNQWld6T1JvbTJreERTR29BVU5yeHEzWG5o?=
 =?utf-8?B?aG5zbTFzWmRPMzdiMDJXUTAraFNGNWowRy9Hb20ydkYrMTFzTktCYkdiRWEv?=
 =?utf-8?B?Z1lQL3Fvc3pORmd3Rldwa1pBMng1d1JET2ZuaFR1ZTVBbjBIbWpZK0dJdmFV?=
 =?utf-8?B?SEtnRHRudVNDdHdNV2wxUW9xRW9UN2xOYUszY2xZQUJVbmxIUEFhVzJJWHd5?=
 =?utf-8?B?cGFxazdObXhJVlYyejUvdm03SWtMWkZXY0tkZmFZMnIxU2ZoK1h6WmpycmlW?=
 =?utf-8?B?QzQ3aVk1MVJSWlh3dDJBc1Uxc1JINnN6eGtETEswL0w1dmdONlEyQ0x3MWVF?=
 =?utf-8?B?NXIvdjRyOVhTTEloNTN4MGhkL2xUdms3QmJaUjhSdmo2aWxwZ1IrSkVKUWds?=
 =?utf-8?B?WXpkRGdPc21wZzBoQ0psVzlWcGF5c1ZJWHRpYjZsTnBsVlpUMEZEaGtLd2Rh?=
 =?utf-8?Q?HdM5vL21L6IzRpG2Z8K3TS/njdMTLRfC9EzMFsgrHE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02832412-be20-4f1c-3ce0-08d9bca099bd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 12:20:21.2609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3J2vff9hNV4NE+jl2LCAlaimWUGMiJleMWZ14D4kWABbEQrt/uIBv92m0XaamQNWr3w3lU76KK1dxNlZg6kNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3168
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



On 2021-12-09 11:46 a.m., Michel Dänzer wrote:
> From: Michel Dänzer <mdaenzer@redhat.com>
> 
> Move code using the Pipe struct to a new helper function.
> 
> Works around[0] this warning (resulting in failure to build a RHEL debug
> kernel with Werror enabled):
> 
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c: In function ‘dml31_ModeSupportAndSystemConfigurationFull’:
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:5740:1: warning: the frame size of 2144 bytes is larger than 2048 bytes [-Wframe-larger-than=]
> 
> The culprit seems to be the Pipe struct, so pull the relevant block out
> into its own sub-function. (This is porting
> a62427ef9b55 "drm/amd/display: Reduce stack size for dml21_ModeSupportAndSystemConfigurationFull"
> from dml31 to dml21)
> 
> [0] AFAICT this doesn't actually reduce the total amount of stack which
> can be used, just moves some of it from
> dml31_ModeSupportAndSystemConfigurationFull to the new helper function,
> so the former happens to no longer exceed the limit for a single
> function.
> 
> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> ---
>   .../dc/dml/dcn31/display_mode_vba_31.c        | 185 ++++++++++--------
>   1 file changed, 99 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> index 7e937bdcea00..8965f9af9d0a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> @@ -3949,6 +3949,102 @@ static double TruncToValidBPP(
>   	return BPP_INVALID;
>   }
>   
> +static noinline void CalculatePrefetchSchedulePerPlane(
> +		struct display_mode_lib *mode_lib,
> +		double HostVMInefficiencyFactor,
> +		int i,
> +		unsigned j,
> +		unsigned k)
> +{
> +	struct vba_vars_st *v = &mode_lib->vba;
> +	Pipe myPipe;
> +
> +	myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
> +	myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
> +	myPipe.PixelClock = v->PixelClock[k];
> +	myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
> +	myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
> +	myPipe.ScalerEnabled = v->ScalerEnabled[k];
> +	myPipe.SourceScan = v->SourceScan[k];
> +	myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
> +	myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
> +	myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
> +	myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
> +	myPipe.InterlaceEnable = v->Interlace[k];
> +	myPipe.NumberOfCursors = v->NumberOfCursors[k];
> +	myPipe.VBlank = v->VTotal[k] - v->VActive[k];
> +	myPipe.HTotal = v->HTotal[k];
> +	myPipe.DCCEnable = v->DCCEnable[k];
> +	myPipe.ODMCombineIsEnabled = v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
> +		|| v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1;
> +	myPipe.SourcePixelFormat = v->SourcePixelFormat[k];
> +	myPipe.BytePerPixelY = v->BytePerPixelY[k];
> +	myPipe.BytePerPixelC = v->BytePerPixelC[k];
> +	myPipe.ProgressiveToInterlaceUnitInOPP = v->ProgressiveToInterlaceUnitInOPP;
> +	v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
> +		mode_lib,
> +		HostVMInefficiencyFactor,
> +		&myPipe,
> +		v->DSCDelayPerState[i][k],
> +		v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
> +		v->DPPCLKDelaySCL,
> +		v->DPPCLKDelaySCLLBOnly,
> +		v->DPPCLKDelayCNVCCursor,
> +		v->DISPCLKDelaySubtotal,
> +		v->SwathWidthYThisState[k] / v->HRatio[k],
> +		v->OutputFormat[k],
> +		v->MaxInterDCNTileRepeaters,
> +		dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
> +		v->MaximumVStartup[i][j][k],
> +		v->GPUVMMaxPageTableLevels,
> +		v->GPUVMEnable,
> +		v->HostVMEnable,
> +		v->HostVMMaxNonCachedPageTableLevels,
> +		v->HostVMMinPageSize,
> +		v->DynamicMetadataEnable[k],
> +		v->DynamicMetadataVMEnabled,
> +		v->DynamicMetadataLinesBeforeActiveRequired[k],
> +		v->DynamicMetadataTransmittedBytes[k],
> +		v->UrgLatency[i],
> +		v->ExtraLatency,
> +		v->TimeCalc,
> +		v->PDEAndMetaPTEBytesPerFrame[i][j][k],
> +		v->MetaRowBytes[i][j][k],
> +		v->DPTEBytesPerRow[i][j][k],
> +		v->PrefetchLinesY[i][j][k],
> +		v->SwathWidthYThisState[k],
> +		v->PrefillY[k],
> +		v->MaxNumSwY[k],
> +		v->PrefetchLinesC[i][j][k],
> +		v->SwathWidthCThisState[k],
> +		v->PrefillC[k],
> +		v->MaxNumSwC[k],
> +		v->swath_width_luma_ub_this_state[k],
> +		v->swath_width_chroma_ub_this_state[k],
> +		v->SwathHeightYThisState[k],
> +		v->SwathHeightCThisState[k],
> +		v->TWait,
> +		&v->DSTXAfterScaler[k],
> +		&v->DSTYAfterScaler[k],
> +		&v->LineTimesForPrefetch[k],
> +		&v->PrefetchBW[k],
> +		&v->LinesForMetaPTE[k],
> +		&v->LinesForMetaAndDPTERow[k],
> +		&v->VRatioPreY[i][j][k],
> +		&v->VRatioPreC[i][j][k],
> +		&v->RequiredPrefetchPixelDataBWLuma[i][j][k],
> +		&v->RequiredPrefetchPixelDataBWChroma[i][j][k],
> +		&v->NoTimeForDynamicMetadata[i][j][k],
> +		&v->Tno_bw[k],
> +		&v->prefetch_vmrow_bw[k],
> +		&v->dummy7[k],
> +		&v->dummy8[k],
> +		&v->dummy13[k],
> +		&v->VUpdateOffsetPix[k],
> +		&v->VUpdateWidthPix[k],
> +		&v->VReadyOffsetPix[k]);
> +}
> +
>   void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>   {
>   	struct vba_vars_st *v = &mode_lib->vba;
> @@ -5276,92 +5372,9 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   						v->SREnterPlusExitTime);
>   
>   				for (k = 0; k < v->NumberOfActivePlanes; k++) {
> -					Pipe myPipe;
> -
> -					myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
> -					myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
> -					myPipe.PixelClock = v->PixelClock[k];
> -					myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
> -					myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
> -					myPipe.ScalerEnabled = v->ScalerEnabled[k];
> -					myPipe.SourceScan = v->SourceScan[k];
> -					myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
> -					myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
> -					myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
> -					myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
> -					myPipe.InterlaceEnable = v->Interlace[k];
> -					myPipe.NumberOfCursors = v->NumberOfCursors[k];
> -					myPipe.VBlank = v->VTotal[k] - v->VActive[k];
> -					myPipe.HTotal = v->HTotal[k];
> -					myPipe.DCCEnable = v->DCCEnable[k];
> -					myPipe.ODMCombineIsEnabled = v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
> -							|| v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1;
> -					myPipe.SourcePixelFormat = v->SourcePixelFormat[k];
> -					myPipe.BytePerPixelY = v->BytePerPixelY[k];
> -					myPipe.BytePerPixelC = v->BytePerPixelC[k];
> -					myPipe.ProgressiveToInterlaceUnitInOPP = v->ProgressiveToInterlaceUnitInOPP;
> -					v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
> -							mode_lib,
> -							HostVMInefficiencyFactor,
> -							&myPipe,
> -							v->DSCDelayPerState[i][k],
> -							v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
> -							v->DPPCLKDelaySCL,
> -							v->DPPCLKDelaySCLLBOnly,
> -							v->DPPCLKDelayCNVCCursor,
> -							v->DISPCLKDelaySubtotal,
> -							v->SwathWidthYThisState[k] / v->HRatio[k],
> -							v->OutputFormat[k],
> -							v->MaxInterDCNTileRepeaters,
> -							dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
> -							v->MaximumVStartup[i][j][k],
> -							v->GPUVMMaxPageTableLevels,
> -							v->GPUVMEnable,
> -							v->HostVMEnable,
> -							v->HostVMMaxNonCachedPageTableLevels,
> -							v->HostVMMinPageSize,
> -							v->DynamicMetadataEnable[k],
> -							v->DynamicMetadataVMEnabled,
> -							v->DynamicMetadataLinesBeforeActiveRequired[k],
> -							v->DynamicMetadataTransmittedBytes[k],
> -							v->UrgLatency[i],
> -							v->ExtraLatency,
> -							v->TimeCalc,
> -							v->PDEAndMetaPTEBytesPerFrame[i][j][k],
> -							v->MetaRowBytes[i][j][k],
> -							v->DPTEBytesPerRow[i][j][k],
> -							v->PrefetchLinesY[i][j][k],
> -							v->SwathWidthYThisState[k],
> -							v->PrefillY[k],
> -							v->MaxNumSwY[k],
> -							v->PrefetchLinesC[i][j][k],
> -							v->SwathWidthCThisState[k],
> -							v->PrefillC[k],
> -							v->MaxNumSwC[k],
> -							v->swath_width_luma_ub_this_state[k],
> -							v->swath_width_chroma_ub_this_state[k],
> -							v->SwathHeightYThisState[k],
> -							v->SwathHeightCThisState[k],
> -							v->TWait,
> -							&v->DSTXAfterScaler[k],
> -							&v->DSTYAfterScaler[k],
> -							&v->LineTimesForPrefetch[k],
> -							&v->PrefetchBW[k],
> -							&v->LinesForMetaPTE[k],
> -							&v->LinesForMetaAndDPTERow[k],
> -							&v->VRatioPreY[i][j][k],
> -							&v->VRatioPreC[i][j][k],
> -							&v->RequiredPrefetchPixelDataBWLuma[i][j][k],
> -							&v->RequiredPrefetchPixelDataBWChroma[i][j][k],
> -							&v->NoTimeForDynamicMetadata[i][j][k],
> -							&v->Tno_bw[k],
> -							&v->prefetch_vmrow_bw[k],
> -							&v->dummy7[k],
> -							&v->dummy8[k],
> -							&v->dummy13[k],
> -							&v->VUpdateOffsetPix[k],
> -							&v->VUpdateWidthPix[k],
> -							&v->VReadyOffsetPix[k]);
> +					CalculatePrefetchSchedulePerPlane(mode_lib,
> +									  HostVMInefficiencyFactor,
> +									  i, j,	k);
>   				}
>   
>   				for (k = 0; k < v->NumberOfActivePlanes; k++) {
> 

Hi Michel,

Overwall I think this series is good. I also run it in our internal CI 
and everything looks fine.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

And applied to amd-staging-drm-next.

Thanks
