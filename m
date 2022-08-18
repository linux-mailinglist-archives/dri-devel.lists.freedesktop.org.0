Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29658598B10
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F7510E83F;
	Thu, 18 Aug 2022 18:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E28210E4E4;
 Thu, 18 Aug 2022 18:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHIU9lYgvxwuUbHVTxPlTMPwURHBF9Lx1PplmWHIqyoUqYJdPwT+ywTgUg6pigpWn46u6TDF+ebrrc46ZG7UhwF6WoX2DURgTG1VL9gk3n+kz/zNFAM3BK7po4R4Pq3T5+yIR/tPDAO5PMuC3m+bLYZu37mt81ukEhqWlIDMqFQLgLECbHw4QcfiqyDJGey0aD6JhjmxOVi1efpjexelfiKnz1W63yaqFUYmFa3g3pRA+707mBD0EJdiMM4GdDsXok6kkWrCCS6X8kpZMA0/HYBcvSOwqi0cncY6bKKUqeqebyK3P5h3jtcnYyNaiteIkHy/n5y+mMpPqwK4e9jPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdL7PKM2NT7OM09t7j6tpKm2Ms+z6AnNNp+RvcmvrdU=;
 b=BqDFtD6zLI9e5kIeEMwwCzSo/MWjpf4ASgyAZ4HCi2lvGL3JxR97BpCqnwsXi/jiS2N28n3XDJz7qnL5HY+q/gVnIQ09lSSTO+OSnyYrOZsuXHACF0I0d2OvrZVYwzZEJhzxAGoXC8NmRCmMQWX3jzEyP1tImTMpkUoN58d5tHV1MM1gLseJN/UrNQ1Lm9qbFTCOiOrrqzjXSkv83RYHQ/EnE3VEzvLawe0yCi5aEzb5mx0dF1LnWJnyqQliaQj4wcbtioUI3djbLQULB54kR/wiBpMf/uqkVlf1Dwc+peLZS9DZzfWCXf5I62lBy5QATZ9tmUw6C3fybihIWQkm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdL7PKM2NT7OM09t7j6tpKm2Ms+z6AnNNp+RvcmvrdU=;
 b=yd2L5xz/oBxD4v9J2OGSxAsR/Tv0Owj+ycdJd1aA5TKO6+BbsCRwR6kB7MfJYSznkiTeXJN+UqRMy/nbktr+vSm4okeEV6OuqibonFKdn7kHyFfjq5dV4v/lId+zk6kW8N2vFwtIeEVFg3ySLgaT5WCxDQ6PbHIM93A0UsZk8nA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by BY5PR12MB4001.namprd12.prod.outlook.com (2603:10b6:a03:1ac::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 18:25:56 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::35d6:d7e3:a2de:4f34]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::35d6:d7e3:a2de:4f34%8]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 18:25:55 +0000
Message-ID: <0db1ef14-c5d3-9634-0fb0-361a8d1efea2@amd.com>
Date: Thu, 18 Aug 2022 14:25:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/amd/display: fix i386 frame size warning
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org
References: <20220818164848.68729-1-hamza.mahfooz@amd.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20220818164848.68729-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0026.namprd22.prod.outlook.com
 (2603:10b6:208:238::31) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f8b4f1e-c243-4fe9-7a53-08da814716c5
X-MS-TrafficTypeDiagnostic: BY5PR12MB4001:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sqn3s5CB5oxrS5EX67uIW8cMo4swqmdybHK9JCbRNx1hWIFGcJev+Cfb96u3+6pNQhOmNppyOuAJiOy8uY6dpXwqdrsakQ/fOaDRM4oI6XpxyvNnFx96xdPMJ3yctIoPKbqlZ9mGr8Kv384WVUya1JNG6MHPHKWCMSAUfVigxPp6MSbpzx8YaQZmQQ+LHMMG8EFqlq5db3Lmft36BZqzUZVdl9DdCmkNK7FuahyUnKB/njtJgg++KIxSGt/M3qIqdu/gpIKxqp9jIU9yDTkLXJBQqe17hZ/UnQLuMejMkYwyk8dnEyPbMbTlTIpehv6ByJCcjom+ma1qo9mAFi0J8HXFiDqjJrVFRXrjxdO+sL6kKa36U8Su9oaFxBSUy+iCiC7w/QutmhrTxVJepyLOOro7LCqSBSjgC6fA9I7hBy3Id3RiBfVobueAiz7390rCbskzvcpqYCpwY7nJmn1mk/0oe5AwNW+5QjZEXXkSzJgZUzghadDsbq5JthbJSZyPJryn0E8/xnf5Os03C4zQzC1vz8p60VawrY50enYsqr+vJyvCvYxODLH1ZFtvEOdv+67VywgnUgIFI7mq3hh2akK+JwnAsVAmkWpr810XydxgHFW7Rk8Fi6gWTWtKjYNbUm8voYbokOQ1gK1lGanszKYU8rR0RZm7pmy0fwscfMPH9o+0WPCVHr/qoTB9qFnWNNjBN2H/UzO3IKLTI4wtYxirvg63HFz3uQEXBaFW4sHjlgFWFXaA0N813qrwFn497G6k+6ZYsoKAES/n+M5SEDtN8eSxD4a+KdWFfRL10cE4wGoarVpTmU1TAwvHqv0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(30864003)(54906003)(19627235002)(478600001)(316002)(36756003)(41300700001)(2906002)(6666004)(2616005)(53546011)(5660300002)(6506007)(44832011)(8936002)(31686004)(186003)(6512007)(26005)(31696002)(86362001)(83380400001)(66946007)(6486002)(4326008)(66556008)(8676002)(66476007)(38100700002)(43740500002)(45980500001)(44824005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cURJclplb3BGR3VCMEwrYXNqYzVHNGtaK3M0MUdBSHBOMHJTS1VOVWUzUGJ1?=
 =?utf-8?B?S1dNK2ZKTmQ4SXFJYjlzTHFlcEJpWmJFRnF2MWI2OWZDMVFWdHhJN1V4MFhB?=
 =?utf-8?B?cmtrZGJCMUlUb2NqM3RjdjdNQXBqU2p5TnhPUElaR3A2UGJJUVY4OGZtMFpy?=
 =?utf-8?B?R2Ftbk8zemt2V0VHZXJDM1N4U3pMM2c1Y0gzaWtlNVlpS0ZmWWoyMUt4cWxD?=
 =?utf-8?B?bU5BTUFyNGdCYWxhRW8xdXp1UDhnWksyZ2RCaXlWMEdRczZXN0tGYjh0TDJo?=
 =?utf-8?B?M1ZQeDJ5N1lRa2pBNjl6eGQ5SUs1WWo1TFdJSTlWemo4am1LSU9aSU4venFN?=
 =?utf-8?B?UVd4QWpSNTF5OFhDWko3UTArS0ZIU2VLc0pMQmFyVldpUVRIbjkweVVyL1A0?=
 =?utf-8?B?Z0J3NWFCUStjZ0QxdkJUd1kxQ3V6a3pzcThJV0g3TnVyeTNwYm9LL3h5a2t1?=
 =?utf-8?B?TkhwWmFWU2xpZmt1cXdkUTdUdSthTFp2ZkNPR29FYXpIVDhubHk2Mkdnem9V?=
 =?utf-8?B?Y0VzQ0M5c3lwayswY3dPemNTWEJjSUpOS202amdXdjBMdXNRaGRLZGt1MWVz?=
 =?utf-8?B?aTFjaldqVTdtUWlKR2g1Ni9QYXNrbC9NQVM0U24xMmE2d3MwSDM2OFR5VkZw?=
 =?utf-8?B?cXVLRmRMaUdWWE5WbGJ1SW5jbExuTldlTG5VM3lZL2tjL21jVGJlb3B6QVVh?=
 =?utf-8?B?YXd6bVEzek5zS1B3L0xSSmlwbDQ3bUlyTGJ3K3RuUDZiV1VyTkZtdHJzODMv?=
 =?utf-8?B?VitRRjZlSTBxTEVDa094d3dyRWE3Sk5DeU5CWSttOE16eXlmNW9PSnFRQVNO?=
 =?utf-8?B?a2tDN3NDUS9rUVlOMFc3RDYydmVmM25zaS9HSDhHVVhMNEcwc0dSbGlMeXAw?=
 =?utf-8?B?OXEvSFBvellFRWhvcktRaFArQVlqMURHdDdOTWZ4QSthTE5pc2hCSFFBQnhR?=
 =?utf-8?B?ZU5nakpBZGRPb0tnSVZXZ2ZNRkw0UDJJZWRwTlBpM01kMTNPRDNqS1d3S3Zp?=
 =?utf-8?B?MUNYMHpsaUdMc0FrTjZFZG5LbkEzTnZCaUdyTUIrSXpsUkhkT1ZBRmRKeGdW?=
 =?utf-8?B?U3VhYTRVY3RzTTdGb1ZiWldySzZpaGk5T2l1aFhGbHJyQW8vQ3VVV0k1dWt2?=
 =?utf-8?B?SUx1R3lnTzFaK0tvb0JUck1UYXlPVGxVenRRWXAxSklkMTlJR0ZhQ3VtWEFX?=
 =?utf-8?B?c0tVMGNaNDNJemZUbkdMWWYrb292dG82Ukd2aWtpaWt3c0p5c1hrTFJEN2t3?=
 =?utf-8?B?MDNQaWxvS29MUlBYeUVqeVVrMHJvdWtoaGVvNUE4RmowZmtJYU9rUkx4R21S?=
 =?utf-8?B?cjBGOWR6aE1KYjR1QU56c0ZUZnoyWWpJdFVHUFl1WWF4QXFKckxTSGU0MEo4?=
 =?utf-8?B?R2hKNXhBNmZOVi9EdG1tQldXZ2xtaldnSncrRTloWUdGVlRreEwxOWM1TTZE?=
 =?utf-8?B?bkZaU2hrdVljSFcvT2ZIYVJzZ1N0RmFKY3V1SVE5ZFZVQUg0a0FvVDVTaVRa?=
 =?utf-8?B?cEtrSGFCM2RLUzNURDVZUUpsU2FRWUtlWEo1YjI5U1JDUE1zVkt5eDZNaEZ3?=
 =?utf-8?B?S2Z3eHpHbFpCekprZHo3TUlHM0QyZlVpeS9LWkROdldCL0pnTUsrMjMzWlo1?=
 =?utf-8?B?eTc5akZoZk9DQUxmQ1NkYXo3Vk9jUkVaeUdZMkRWaFhyUFFHNmpMMmwvSC9I?=
 =?utf-8?B?R3dzeUFmQWFJUTJTbzFvbVk3eG5UcjAxcW42ZVlYYlVJTUZSd216QUdieUxh?=
 =?utf-8?B?elBVZHBUK0dkQ2hDaVJGbUVGeG1iKzB1R3huMWhJOTlEankvN1ZZbGJ0S05G?=
 =?utf-8?B?SWU0YW1ldE9UOXRvRVFsYmpiQWxtMHVQOEh3QVVmRXlFUHRvYm5UTFAzdDVs?=
 =?utf-8?B?d2w1NmpNTS80d25qODg0VU94Y2svdFA2MzFOLzdEM2hPeWVXSVpiKy9nSzJR?=
 =?utf-8?B?Z3lhdUFjMFdKUkd4eEJ5QUFGSWpzVkpER0ZMQVVWcVpWWHR6REdNNHo4ZWVO?=
 =?utf-8?B?eTMvbk8xM1BWczEzZEdxeTgwTzJ4R05HdXhxa1N6aXFRazgzdTlLbVpvUkhE?=
 =?utf-8?B?REdUT0F1NWFYZ2N0NWs5UHB5M0p5UFU1RWxzTWdJUXdSZGVnQm1aZjYvb2V2?=
 =?utf-8?Q?2I9B7l6cq13LA5pL/68v2cKnJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8b4f1e-c243-4fe9-7a53-08da814716c5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 18:25:55.2766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChdsGUXw3ylME41ctaUQaS1dFuN8DrDTxOvCpsRobGLlMuOvYLeTIOWraz99DM0YEmkTFvS4c2uFhrfvK4tU/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4001
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
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bing Guo <Bing.Guo@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-18 12:48, Hamza Mahfooz wrote:
> Addresses the following warning:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3596:6: error: stack frame size (2092) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>       ^
> 
> UseMinimumDCFCLK() is eating away at
> dml30_ModeSupportAndSystemConfigurationFull()'s stack space, so use a
> pointer to struct vba_vars_st instead of passing lots of large arrays
> as parameters by value.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   .../dc/dml/dcn30/display_mode_vba_30.c        | 295 ++++--------------
>   1 file changed, 63 insertions(+), 232 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index 876b321b30ca..b7fa003ffe06 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -396,64 +396,10 @@ static void CalculateUrgentBurstFactor(
>   
>   static void UseMinimumDCFCLK(
>   		struct display_mode_lib *mode_lib,
> -		int MaxInterDCNTileRepeaters,
> +		struct vba_vars_st *v,
>   		int MaxPrefetchMode,
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
>   static void CalculatePixelDeliveryTimes(
>   		unsigned int NumberOfActivePlanes,
>   		double VRatio[],
> @@ -4692,66 +4638,7 @@ void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   	}
>   
>   	if (v->UseMinimumRequiredDCFCLK == true) {
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
>   		if (v->ClampMinDCFCLK) {
>   			/* Clamp calculated values to actual minimum */
> @@ -6610,77 +6497,21 @@ static double CalculateUrgentLatency(
>   	return ret;
>   }
>   
> -
>   static void UseMinimumDCFCLK(
>   		struct display_mode_lib *mode_lib,
> -		int MaxInterDCNTileRepeaters,
> +		struct vba_vars_st *v,
>   		int MaxPrefetchMode,
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
>   {
>   	double   NormalEfficiency = 0;
>   	double   PTEEfficiency = 0;
>   	double   TotalMaxPrefetchFlipDPTERowBandwidth[DC__VOLTAGE_STATES][2] = { { 0 } };
>   	unsigned int i, j, k;
>   
> -	NormalEfficiency =  (HostVMEnable == true ? PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData
> -			: PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly) / 100.0;
> -	PTEEfficiency =  (HostVMEnable == true ? PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly
> -			/ PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData : 1.0);
> +	NormalEfficiency =  (v->HostVMEnable == true ? v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData
> +			: v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelDataOnly) / 100.0;
> +	PTEEfficiency =  (v->HostVMEnable == true ? v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyVMDataOnly
> +			/ v->PercentOfIdealDRAMFabricAndSDPPortBWReceivedAfterUrgLatencyPixelMixedWithVMData : 1.0);
>   	for (i = 0; i < mode_lib->soc.num_states; ++i) {
>   		for (j = 0; j <= 1; ++j) {
>   			double PixelDCFCLKCyclesRequiredInPrefetch[DC__NUM_DPP__MAX] = { 0 };
> @@ -6698,58 +6529,58 @@ static void UseMinimumDCFCLK(
>   			double MinimumTvmPlus2Tr0 = 0;
>   
>   			TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = 0;
> -			for (k = 0; k < NumberOfActivePlanes; ++k) {
> +			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>   				TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = TotalMaxPrefetchFlipDPTERowBandwidth[i][j]
> -					+ NoOfDPP[i][j][k] * DPTEBytesPerRow[i][j][k] / (15.75 * HTotal[k] / PixelClock[k]);
> +					+ v->NoOfDPP[i][j][k] * v->DPTEBytesPerRow[i][j][k] / (15.75 * v->HTotal[k] / v->PixelClock[k]);
>   			}
>   
> -			for (k = 0; k <= NumberOfActivePlanes - 1; ++k) {
> -				NoOfDPPState[k] = NoOfDPP[i][j][k];
> +			for (k = 0; k <= v->NumberOfActivePlanes - 1; ++k) {
> +				NoOfDPPState[k] = v->NoOfDPP[i][j][k];
>   			}
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
>   				double DCFCLKCyclesRequiredInPrefetch = { 0 };
>   				double ExpectedPrefetchBWAcceleration = { 0 };
>   				double PrefetchTime = { 0 };
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
>   				if (PrefetchTime > 0) {
>   					double ExpectedVRatioPrefetch = { 0 };
>   					ExpectedVRatioPrefetch = PrefetchPixelLinesTime[k] / (PrefetchTime * PixelDCFCLKCyclesRequiredInPrefetch[k] / DCFCLKCyclesRequiredInPrefetch);
>   					DCFCLKRequiredForPeakBandwidthPerPlane[k] = NoOfDPPState[k] * PixelDCFCLKCyclesRequiredInPrefetch[k] / PrefetchPixelLinesTime[k]
>   						* dml_max(1.0, ExpectedVRatioPrefetch) * dml_max(1.0, ExpectedVRatioPrefetch / 4) * ExpectedPrefetchBWAcceleration;
> -					if (HostVMEnable == true || ImmediateFlipRequirement == dm_immediate_flip_required) {
> +					if (v->HostVMEnable == true || v->ImmediateFlipRequirement[0] == dm_immediate_flip_required) {
>   						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKRequiredForPeakBandwidthPerPlane[k]
> -							+ NoOfDPPState[k] * DPTEBandwidth / PTEEfficiency / NormalEfficiency / ReturnBusWidth;
> +							+ NoOfDPPState[k] * DPTEBandwidth / PTEEfficiency / NormalEfficiency / v->ReturnBusWidth;
>   					}
>   				} else {
> -					DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKPerState[i];
> +					DCFCLKRequiredForPeakBandwidthPerPlane[k] = v->DCFCLKPerState[i];
>   				}
> -				if (DynamicMetadataEnable[k] == true) {
> +				if (v->DynamicMetadataEnable[k] == true) {
>   					double TsetupPipe = { 0 };
>   					double TdmbfPipe = { 0 };
>   					double TdmsksPipe = { 0 };
> @@ -6757,49 +6588,49 @@ static void UseMinimumDCFCLK(
>   					double AllowedTimeForUrgentExtraLatency = { 0 };
>   
>   					CalculateDynamicMetadataParameters(
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
>   							&TsetupPipe,
>   							&TdmbfPipe,
>   							&TdmecPipe,
>   							&TdmsksPipe);
> -					AllowedTimeForUrgentExtraLatency = MaximumVStartup[i][j][k] * HTotal[k] / PixelClock[k] - MinimumTWait - TsetupPipe
> +					AllowedTimeForUrgentExtraLatency = v->MaximumVStartup[i][j][k] * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - TsetupPipe
>   							- TdmbfPipe - TdmecPipe - TdmsksPipe - DynamicMetadataVMExtraLatency[k];
>   					if (AllowedTimeForUrgentExtraLatency > 0) {
>   						DCFCLKRequiredForPeakBandwidthPerPlane[k] = dml_max(DCFCLKRequiredForPeakBandwidthPerPlane[k],
>   								ExtraLatencyCycles / AllowedTimeForUrgentExtraLatency);
>   					} else {
> -						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKPerState[i];
> +						DCFCLKRequiredForPeakBandwidthPerPlane[k] = v->DCFCLKPerState[i];
>   					}
>   				}
>   			}
>   			DCFCLKRequiredForPeakBandwidth = 0;
> -			for (k = 0; k <= NumberOfActivePlanes - 1; ++k) {
> +			for (k = 0; k <= v->NumberOfActivePlanes - 1; ++k) {
>   				DCFCLKRequiredForPeakBandwidth = DCFCLKRequiredForPeakBandwidth + DCFCLKRequiredForPeakBandwidthPerPlane[k];
>   			}
> -			MinimumTvmPlus2Tr0 = UrgLatency[i] * (GPUVMEnable == true ? (HostVMEnable == true ?
> -					(GPUVMMaxPageTableLevels + 2) * (HostVMMaxNonCachedPageTableLevels + 1) - 1 : GPUVMMaxPageTableLevels + 1) : 0);
> -			for (k = 0; k < NumberOfActivePlanes; ++k) {
> +			MinimumTvmPlus2Tr0 = v->UrgLatency[i] * (v->GPUVMEnable == true ? (v->HostVMEnable == true ?
> +					(v->GPUVMMaxPageTableLevels + 2) * (v->HostVMMaxNonCachedPageTableLevels + 1) - 1 : v->GPUVMMaxPageTableLevels + 1) : 0);
> +			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>   				double MaximumTvmPlus2Tr0PlusTsw = { 0 };
> -				MaximumTvmPlus2Tr0PlusTsw = (MaximumVStartup[i][j][k] - 2) * HTotal[k] / PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
> +				MaximumTvmPlus2Tr0PlusTsw = (v->MaximumVStartup[i][j][k] - 2) * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
>   				if (MaximumTvmPlus2Tr0PlusTsw <= MinimumTvmPlus2Tr0 + PrefetchPixelLinesTime[k] / 4) {
> -					DCFCLKRequiredForPeakBandwidth = DCFCLKPerState[i];
> +					DCFCLKRequiredForPeakBandwidth = v->DCFCLKPerState[i];
>   				} else {
>   					DCFCLKRequiredForPeakBandwidth = dml_max3(DCFCLKRequiredForPeakBandwidth, 2 * ExtraLatencyCycles
>   							/ (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0 - PrefetchPixelLinesTime[k] / 4),
>   						(2 * ExtraLatencyCycles + PixelDCFCLKCyclesRequiredInPrefetch[k]) / (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0));
>   				}
>   			}
> -			DCFCLKState[i][j] = dml_min(DCFCLKPerState[i], 1.05 * (1 + mode_lib->vba.PercentMarginOverMinimumRequiredDCFCLK / 100)
> +			v->DCFCLKState[i][j] = dml_min(v->DCFCLKPerState[i], 1.05 * (1 + mode_lib->vba.PercentMarginOverMinimumRequiredDCFCLK / 100)
>   					* dml_max(DCFCLKRequiredForAverageBandwidth, DCFCLKRequiredForPeakBandwidth));
>   		}
>   	}


Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
