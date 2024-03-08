Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C68875E12
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 07:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96E410F852;
	Fri,  8 Mar 2024 06:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+hM9/tB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA8210F850;
 Fri,  8 Mar 2024 06:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709881015; x=1741417015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GsMRkDFySrr9zoTVli2t4/yPxp0sjJAdGEwjXFR3E2Q=;
 b=n+hM9/tBvP8aSbHHZQu7OFf6l97Oa9jf5iivxDHIabzS8vDspu8a521R
 bsJHGR7PYCdRkKjHfCCIvXGoMcZbsPZ4G4GFpZXAWf/DI1lolHubY7aQw
 W64Gp1GaE4vy8h415mU/aVu7o0M48BlMV/tOa1PrJDwwslHeO+3Ufwc6k
 45r1pRydnmHY3f81McA+yRWQGxhbWhMg547acDYpMkgTTvh5d3w4Jo7to
 CkcvceaMXWRJxaq8CUYwnOoogo5dU4m5ayZD7mFwjBqbUnySBo1kZhRAo
 8EYHoTOEn6jYyZcukQ52NfTPcTVQi+1Js6ovKD9TEzXftPpsXGYnx+R48 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="5186095"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="5186095"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 22:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10785465"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 22:56:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 22:56:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 22:56:53 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 22:56:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXmvB6LDEpTDcMk/GUcuylAEWyhFvoCuB1ahqsgDpGDUV0RgiD8lqX8IReQwecdf1EWtancEBFUzphKTjkM3e6QfBWz1o6thxxVRNX95BKyvrcWAxfCJa49wqd2v9uLrXy9uCfARYZILFy0j7L/bTb7wIaJdSbbOvP+EWGar3dQMEy7fggrjHmAmLIr/bkfJUgbCEhbu4W5ZGh0mpv9VHDMbBDym9Vg9rGF3lO8D0dko+icnevH7wt2om0k8bFw/nChGSbzbOvDGeve39yd3NgFSDdPiyF56mhjLhuXUnx/FyrV+YspMwztYUs561fNelvYMzW049GPpGh7Blgbi5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUVhZLVMwZxTage4Ca6FVIz2Zuu42J9bHLeVe19rUfs=;
 b=F2+os01qyaISNsJGAYcEzSH6D9hs/53d7blt5p+gQFpWhkUg2tjWvQ4Hk/iNQFIDtxCKPZCn55sdS1cVY1rcF2nAXliQwcnzI9KIKM3X5jpqUaBUcvLLNKkOPjLw/eo1zUZ5zV9/jvBuQaW7Ds0AVWFJ7UKgz6jTeeHbFUURfjeTo5rCYf4/r3Qt3uiZ3e1zll+bHyVGbzTQIIDZDYtz+I3lNsCM3a8kPwFo4gQSwnbUQ4KQePB8vnJdjp9CBetdtQClL0o+0N/vNYhDeFx9v5QTxENAWVWESxd2+F28QkHHtNKLm55WozjRXYdbjfiPOQc1YLhRN1JNCc30jbdoVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB6170.namprd11.prod.outlook.com (2603:10b6:208:3ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Fri, 8 Mar
 2024 06:56:46 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7386.005; Fri, 8 Mar 2024
 06:56:45 +0000
Message-ID: <d56d7d81-2bde-49df-a403-c0d7ffb1018c@intel.com>
Date: Fri, 8 Mar 2024 12:26:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 9/9] drm/i915/display: Read/Write Adaptive Sync SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240307055329.3238634-10-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240307055329.3238634-10-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::31) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d21b34-423e-421d-8957-08dc3f3ceaf1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CBrpf7VfkYvmoSwXP72hJA4DVRuPrYykHUCfAY8d6EfEWUUBwijagfwtpL/wBvGEwnwADFxwbuBQrrtotS2BGZhyoyaGSlBh8ZZyO3XIHxoZqV2ilN4C5nHR+XHgl3IOejKGP7HzVIGLxndVsN+Y2RORDLoSxsf3exk5WbX+2nnUsueYEsoDD3D+vn1rC5d6eZ2cZAAPz7vNSdo0/sUF4MgIxRFGl+FqcI4dvL0kHqd3WyBDRbBQOViwP/Gy4JmOf0+HQIOljDBmJDlkbf/YdcnnZBQvPqpdnuoQalSiKcZ7SAYgS0BOllPc05EzsHMR4LF0H2XCh5DHpNvu488gNurgQMUJckCzvvcZVQQ85Ak7ce2FsmE2fC0rQF7AKi0oDkUgUb2rRznFw4DImTOVYexmZwQWclHkBc8F9dLvvDFsreIkfC+/qkjTEx7qwW5cnHafHnZuMbXUEdvRvlsRcapp4YVu54gF/ibSwFOVq+Xcp4U2J375JiuZN8i9TlVqChyq1D8thaTHUfx0nuP6nq+tJ01Ns89cPaN0G3JAl3OqhTsYA13l1JtNYu1XSOsLYZXNC+qXE419Qy1hcS1z2Hqj8cHXdQ3NVzZlte2DSL8CR8KFcjsLGrCmgBBqv4TaXEKtNkY8A2NMB+1zH4PPcQKPwnwMv5RjVgM44lt4Ej4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGJIcVBNUXpRRHhaSmxjWVU1N3JDM1Azamh6MDFFRUdYdytMVWNWSDh5bkFz?=
 =?utf-8?B?VXBPRDV5SkFRNlVBMjUydDRITXVLaElyazZwNS9QTXE0d3I0Y3RNaXZGL0k0?=
 =?utf-8?B?akhjWXNnMFUxZ0dHMmlBUndlMGNoRXNtZWRMNnRIMUxMVXJOWWVJTXhLNHgx?=
 =?utf-8?B?M2IvaWI1M1dPckxuVWpscWFoTHRXbm04SnY1UllMYkgzNlBIQkFkNTBtektu?=
 =?utf-8?B?RjRUNE9vSEdrSWJGbEFSMGphNklKTFZ5c1lUSkZwU2E5MHRDdE1RclQ2LzYv?=
 =?utf-8?B?Wk1UMW53Y2VOdDF0M2dpQnhRVWM0cW5jUVV4N1BXOUJiUENoL3lpSEFyckFm?=
 =?utf-8?B?RlF0Skc1blhpMWx3UStsY2Z0cWhPZ2R0elRDOXJTdVBwRXlBeC9pelJ3SHFP?=
 =?utf-8?B?VkY5V2czczJrejFhUkgwSVhnc0ZZdE45TEloandoNHB4eS9sekFQckNUR1Rl?=
 =?utf-8?B?Y2hjZTh1QWFXL080Q21XaWhvM0lwOFJ1MlYrNENUb0VhT240VU43eG4vYzJK?=
 =?utf-8?B?cGY2eTFoK3JFQkZKQ0hTSzZrcTAzaThTUkowM2h5cmwzck1nYTlkYUQ0dFBI?=
 =?utf-8?B?NXFVbm5ORmtFWVVPOHRSRUF5eENHeUZQN0FCc1lmcmhCVzZvKy9sMEVCcXRh?=
 =?utf-8?B?NVFNU2R4SXg4ZTZVdHNSVE9qaHVhazFpTDZYNDJ4UTBkc0UrYk1EVjZQZlJy?=
 =?utf-8?B?aEFWb0x4WU5lMVNQYVVJYWhDMWd1YlhRRWMydFdRVnBiNWRldDdiQ0tuUnQr?=
 =?utf-8?B?Mmtub05xaFpqVWpBWnNKblJtSmxlZ24xV1gvQjQ0M0FQVWFXeFN1SnY1Mlhk?=
 =?utf-8?B?N3Ftek1CTG5hWWpramV1eng1M0RWSTRwa3Z5MVl1M2NjaEw5UWVFcUkrSGdi?=
 =?utf-8?B?c3dtd1o2NWZ3ZmdabzdxY3FOSnRLMWlMU1RFdjdMSVNPME9udUE1Mi9NUmwy?=
 =?utf-8?B?OHBYUEJpNDZRb1FWdEl0S1NmcXVaYm9SWEwrYTF6NnVIYzBTN3Z6QTBXWUVD?=
 =?utf-8?B?aWZNS0NLR0JQZDQxWHUrVGtzY2UyWW1aUUJHeGpaTlY1a3VjZUFibURoSDRG?=
 =?utf-8?B?Sy9LQmIrdFlIUnN5bkZsbTgrZGRsTTJENVk4T1BIMEc1T3BSTjUvLy9yRlFM?=
 =?utf-8?B?b2NtMmc4MytLVy9NWjFWVGRSL3VVeitPU2p2MTFDaHMvT0lYcEMwK2RleGtU?=
 =?utf-8?B?bnBKZUpBWmNJZEdSTkxZMW1JbFdEYTRvSFQyR2J0Mk9rZUh4S01FUVdGMmNW?=
 =?utf-8?B?alVYTGUyc0hoMUlpRzBWa1pVbWtUUERyK0xHTDhyTTZIUWl5c2FwL3ZXclNP?=
 =?utf-8?B?RE9qQWEvbFdMWXFYTXMvYjBXbTJRdGIzMXAydnZzYTlaSG9PSGVQN3ludnd5?=
 =?utf-8?B?b3Q0OEJNNkJ1VHNtVWx1ZDlQUkZ2QUh0YnlqSVpCenBNM3k2L2dZNTlYSHh1?=
 =?utf-8?B?WlNORjJJOFpBV2JNeVI3YldhVEgybjhmdEg2ekZZRDlzSC9qbGVIWGFCWGdh?=
 =?utf-8?B?UGI4dWE3QnByaVMvRzJ0akJtZnN1RHRsc21xZGo3dSt4a0kwb1BkV0FGOWJN?=
 =?utf-8?B?VUFpcUdOMnlhbi8xUG03R2lOUmUwTDEvNmZxZEw4c2d3Q1R5ZEFwYXpSYlRT?=
 =?utf-8?B?eDcrdkhlbjVYYVlZejhrM0QzanU2RmllYVlDQnFVQUs2dk4rTytsbm5iUnVE?=
 =?utf-8?B?aVJyR2hKS2Y0ZENDNE95ZTd6QnZRNEpvU2UwemY5TjlZUW14dkttamswM1Ro?=
 =?utf-8?B?aWptRGNzYUE3MlhLaFJ2R1BPOHo5VmsvVUNSYVNtZ0lPR3J3eERFcEdoa1FQ?=
 =?utf-8?B?TDVSNzZWOG8wUFIvZTVybG5qS3d2WFh5TWQ0LzFhaThlTU82YmNaaDRIL3Yz?=
 =?utf-8?B?KzF4TUhLeW43N0kvZ2dpT0JoQnZoUmgrK1pnM1NaNXgwdXRPSnJRTithRENK?=
 =?utf-8?B?QjJPWmVvNXdKWVJ5aDFFd3ZqWTFsR2FFWlc4OTJBai9KNmVsbjBoUUxGWFRC?=
 =?utf-8?B?WGFKQi9pTmx2VVFyTlIwUmtPZ3UydGRuQW9oV2pLTTRla3BqVXVVQWN5bUFH?=
 =?utf-8?B?YXZ5UWlWb2JSMHJjUFV0dDJXaHl3d0ZieDNhaXJWbVRYaHMzR2h6bHduQW5k?=
 =?utf-8?B?Q1FBSnVXMDl6UDZ3ZUg0YnlOUElhak5OSTVBd0svWWFtaFlNbmUyMy9SN1FL?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d21b34-423e-421d-8957-08dc3f3ceaf1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 06:56:45.5854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +p/g5ZIlMQW2TovGn/VZrXt74s3sFFBPKCXUeqYr9PKjpFmNrYLrHXhRZXb9dX9CBvBKjrWXm+l5/O0D50AzloGkJUE4nK5NL5XhN18RdrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6170
X-OriginatorOrg: intel.com
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


On 3/7/2024 11:23 AM, Mitul Golani wrote:
> Add read/write calls for Adaptive Sync SDP.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_ddi.c | 1 +
>   drivers/gpu/drm/i915/display/intel_dp.c  | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index c587a8efeafc..f164020a4773 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3972,6 +3972,7 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
>   
>   	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
> +	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
>   
>   	intel_audio_codec_get_config(encoder, pipe_config);
>   }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index cf89e69d2e7a..7f87876651e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4330,6 +4330,7 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   		return;
>   
>   	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_VSC);
> +	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_ADAPTIVE_SYNC);
>   


Though not related to this patch, but IMHO we can remove extra space 
between consecutive intel_write_dp_sdp.

In any case, patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>   	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   }
