Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20679F537
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 00:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2406010E1C2;
	Wed, 13 Sep 2023 22:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538F710E175;
 Wed, 13 Sep 2023 22:50:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyatSFNFfbX9imcenSKcMbHqILeJMj9zPgjf6fxQBPFjRIu+tJ8pO+ILUOVs9+reLTAnMPt5m9JnxRjcfJ6iCBW7mIm1UCt71io/tbq8DEOaZIO3A2QfQg0AURsqiwXmeZmSJx1KYcyi7aRcn7K19NgMmSeX72f6YIeA0fSyjWVMUNszwmuOkJCMhRX+FwSlfBr78ZwDkTTXPs3lMHADTUis4PlTwBFwgo5i9n1QFXxeqiLmiRoYSgqDOCpm0Zn5CR2uGknojn5uoBwGD0uo0FvlcTeyV6K3bVFKkUwQ9lwwm/R9cw7Nm2KVKp+8HzAmO9iwcgF3FKME+xogG1C0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvK+56dy0xe8CdVPiQd8Aug01z/HH8AD1cITaXrhOb0=;
 b=ZtF9+DmEHIYBmW5j8RxVOpcixmlJmOsqnY5okwvnax6CTwnNpQGY3jYdTsJUgZrgB3UGLGfnsv/RfEj3JCBsa55IcjSwzTH8+XH6IirfqvR3/ljpkSlvzKfduF3/bDOeSTHhFWuMdBOJy8HNcxdk64F1ZvcO3e4tDKv1KlVrHfQSAyiZgLhRYAuRxOeI20+Hh7zodxfBmL9QDxTtT/b/GTukGu4/bC/JU/JUsRjgouMEhWnXTS427riMx1OYuHKqDIxLwsZAF3HrQB0FAKM5V7c6PIxjqvzRFa0dlxx++g+EVX64xu7/YRg2nglyQPGwU19L+pmVu0HI1g9kEsI9HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvK+56dy0xe8CdVPiQd8Aug01z/HH8AD1cITaXrhOb0=;
 b=ZQSjVvhPqhl25+5c2S6LxEjc0V+2CkNzQLAoxtc0pZrfaMmFhBYKbKnx1a8Tl2uPisDEqR9ZOfDwpUrjorn+Is7PBST5OOvkJfwpe/r0nTKWqaYPOsXUFbgClusZkwAEOFc2KuVK+iaFpEml5Ol5QH2D3BxBQpD+/mZeMqRiQKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 13 Sep
 2023 22:50:34 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::30b2:5369:3468:696a]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::30b2:5369:3468:696a%4]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 22:50:34 +0000
Message-ID: <1a512339-f67a-40ab-a588-bd44686cb980@amd.com>
Date: Wed, 13 Sep 2023 16:50:29 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/5] drm/amd/display: fill up DCN3 DPP color state
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 sunpeng.li@amd.com, alexander.deucher@amd.com, Xinhui.Pan@amd.com
References: <20230913164329.123687-1-mwen@igalia.com>
 <20230913164329.123687-3-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230913164329.123687-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN1PR12CA0017.namprd12.prod.outlook.com
 (2603:10b6:408:e1::22) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 629f84c7-c3fc-4e23-86fe-08dbb4abd6c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXaqPQDwxq1LZbAPbukma98OzY7jsF7dKDAm7UIap34q3+yDEXTZpfVhqZPNpYvq2FeoHzdzT+7kEV3KkX3dyDEHpiWIok5DNeF0QTXrWAqyMSOH7gAD85DJcrOby1GB9xNuvcQiVn3xDj+19hUSWwuuOxb+R9JZNo0qCP87L62QtmpDA4MDDHoOXj7T9S+A/1wjeEC6qEuSmIpA60jDbOfVELHUYHkbtZ+WnRUqShNhdBPaNFEfvwfY6aFMg4XZlgNaRjZ/pW1MIP73puRpJE/2yq17ctFWXxanebkIG9CfyRfoIPTM1IpAM17C93PhBrZgmYjkhlSSN5zfbpcy+EjQLxy6MTQLOuBDRumDwhA8KUXOx/Q199dHX0HXVsfFFn//NNTuS4LhhPeeqAZkTilB1LVtPuNbGxNr1JoMYlFmXOCEKJVpTlvCqsoVB1NlVvOZ3cTVGiBvfnSk0YCfqBOPbEhMJxMBBXkq1qiyLnKRkaFOh2V9NBi/005qRbp34O5Q43e1+L/ap8jhjjxHouR1wxP90qZHqBWfqCTBJS2mPf4c9w4Inqlq1vfxxzutFuuN/Q6HFKVN5kMJHH0NsQSdVzZHXM0Jdr6n3ZVKzVItNZJ4d+b04MH5MTDZ3OpCGXEhKXq39dCO4Y+2d902UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199024)(186009)(1800799009)(110136005)(38100700002)(86362001)(36756003)(31696002)(2906002)(6512007)(31686004)(6666004)(316002)(6506007)(53546011)(8676002)(8936002)(5660300002)(66556008)(54906003)(6486002)(41300700001)(4326008)(66476007)(66946007)(6636002)(478600001)(83380400001)(2616005)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGhHUFdRaXc1QzhGY3Z4aEhBVS9BTWlycllKYWVDckR4VGV2WFMyeXVWWENS?=
 =?utf-8?B?K1FFaEY3cUt2UVVvM01JNlloUWxkaG1MOTZuNDZPYURMWkVTUVpTVDhvNHVB?=
 =?utf-8?B?d2NPdGp4eEpUdlBieHVQZ0x2aWM5UVhvTm5PZGxJSXVCUkc0ZUVaV3VrZ3lq?=
 =?utf-8?B?UnBBTGoxb1Jjc2EzN1JZaXljUVRrYlkvajMxU2hVOHVGVlBleUtWYlJGMlFT?=
 =?utf-8?B?cjNXZjFwSGJKR1VnVTBOTmpIM1J6Ky9Hdm1MMUh5THNHbFhNeVZOZ3VZWW9L?=
 =?utf-8?B?UVpTWldaREdHc053UC94STBmVWxZQ0VEeTZocW9SZk93R1NOanplcG5kNnA1?=
 =?utf-8?B?bk9xYlM1SlAzR2RoQi81d0pDeFdqTmd3VkRWM0Y3WC9aMGtXRnl0T0tTQ2Rz?=
 =?utf-8?B?Wjkxa3hBOGNmdUFUaC94ZWhvVmZKL2RJRjdqaDNINmpzUHBVSFNsSkNmeUd1?=
 =?utf-8?B?bzdDWUpabXp0Rm90cWdvcDZhM1hvN1pLQ3laZmV4dTE3MzFlTWprNFZyT3k4?=
 =?utf-8?B?cUU1OGJzaG9zNW0vS1hYbnBhUytPVHB6RVU1RmZFWmFtNmFwTHNsNU13dlo4?=
 =?utf-8?B?VjJORjBWL1BmSVRqRVVEenNDdWdRTVpPaFYxdDF2MjFiYUU0TzVpUTV4QWly?=
 =?utf-8?B?VWxOdEc5L1l1a2RDa3ZESmUrUjUybTkwbCtMTVdQNERKMDkvekFGOVRDMFBv?=
 =?utf-8?B?RUNOK08xZlcrcENnNG5OcHh0MTU2dWlGZmMrVG1CdFozRldESDcwSDZNUmRs?=
 =?utf-8?B?NEVSZzlURnk2TFhjWWRrdGwzcGMxOXlGUndKMFF6QVFMQVJBT3FKQXZoRGdK?=
 =?utf-8?B?ZmRZaDJHcnVyNnNweTAwUUFGMEFZSVdHYzRNUnR3ZGZXa2o5RW1VdjV4TWNW?=
 =?utf-8?B?YzZRR3U4M05KeGhSNTJOMmg3VWFsYjQ4aVF1NGZNZzViR0ZKZEtYb0ZQTU9N?=
 =?utf-8?B?bFZWK0t6d3JjbXkvbXFDRlVPMlBJQklSVDFOSjcwck9wLzh4VGF4TU9QV2xX?=
 =?utf-8?B?M21NL1ZhRE5LdUZXbzU1S0tMVzhSR3I4SUNieEF3aSt2eVJ4T2ZCVzdGRUI4?=
 =?utf-8?B?cVN6L1Z2dFQ2Q0xUaXU0a3BuOXlkL3hGTzkvQUZGMVVpeEREcUY3ZmxmeDE3?=
 =?utf-8?B?UFJ3alJJeGZ2aThVWUppaDlSQ21kN01pcWhXRCtzbGlyNEd1SEhZdE5IUXVY?=
 =?utf-8?B?aGt1S29MblBOd04xbkM4ZmFWWllVTTE1K29BWW03ZXZrVWJjVHd1TlVWK0VD?=
 =?utf-8?B?UUhTVk1DTE5xeWc4U3hJcXV3N0dOcTZDeEM0b3l0ZlExVEVyS2owVXFhdWNP?=
 =?utf-8?B?YUZRQWxHQ2FON2Q5bG10ZW5wQXRFNlU2NHFLTGxDZTJ5Vi8wWjRDd3Zycksy?=
 =?utf-8?B?VnlMZm1RRDRPUEhZMFNFRVhTbnlOZldrcG5sbUdXTEZET0NrZTlVTHR1OGtK?=
 =?utf-8?B?Nm5GQW54OWRMTU9jN280ajAwVnlLWW9FaDBHcEhXTVZvRE9yOXVvbEZzSGli?=
 =?utf-8?B?Sk5ISnVsVFRVdVlVRHZ0UGRDUHczMlhTeTUzNHR0STdqSEpQaUJaaVV1RjZt?=
 =?utf-8?B?ZTlKN3ZJVm84eTcrKzVwRXllcVMzNVFxUW14YVdxb1pGOUxwZW9uWWNLZ1FJ?=
 =?utf-8?B?cVBjdzRJVCt4MVBIMndIOUpjMDhsMjlDV2xkdEdZeVh5OHA4VENVNEhMM2dN?=
 =?utf-8?B?bUdkalpqVEtPVklTenJEbUI5c0tISTJFcHNJdktNVVN0NFFmSzN3aU9xaGUv?=
 =?utf-8?B?U2toeEtqWjJXcWtaN2RWVzY2ZVlUczdnbEhVVHlSazhiVHJqTVViZitDWjlP?=
 =?utf-8?B?T2hLaldhUFhpaUZZQnhGYkFQUStVbmdGbHozeHlVOEdncVZndjJqVzV0WmJZ?=
 =?utf-8?B?cFhkbXFXUkwxeE5uZFU4NS85YUhxMGhFeEFMTUhZeU1DSDYyL0RsZGJ0dk1v?=
 =?utf-8?B?MkwySlZ6NTRTVkRIVUpPSUljR0xYL3B5cEQ0NHZ2dDlRSG56Y05WSFE0NGIw?=
 =?utf-8?B?dllmWGhHR1JqcFpjMUd0eWFHbzdPRXBGNGN1MjRNVzlBRmxGQnpvU3NsYWxS?=
 =?utf-8?B?ZkVVQ0R5aWM0cU1LeEZyVXpQSTIyc2RHM3Vud1BUNndqU1dhVk5BSTNRbWt2?=
 =?utf-8?Q?CNgOkBUSQMbOeHgvuRvmfsagv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629f84c7-c3fc-4e23-86fe-08dbb4abd6c6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 22:50:34.3074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Siln+JFUpdDhayQAI4AssEOOwCXD/x86FzfA9Qf7sUMluL0t1Ol/Lq9vVvLmtcfbVNOMDQw9L4xbszzovczqyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/13/23 10:43, Melissa Wen wrote:
> DCN3 DPP color state was uncollected and some state elements from DCN1
> doesn't fit DCN3. Create new elements according to DCN3 color caps and
> fill them up for DTN log output.
> 
> rfc-v2:
> - fix reading of gamcor and blnd gamma states
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  | 45 +++++++++++++++++--
>   drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  8 ++++
>   2 files changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> index 50dc83404644..a26b33c84ae0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> @@ -44,11 +44,50 @@
>   void dpp30_read_state(struct dpp *dpp_base, struct dcn_dpp_state *s)
>   {
>   	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
> +	uint32_t gamcor_lut_mode, rgam_lut_mode;
>   
>   	REG_GET(DPP_CONTROL,
> -			DPP_CLOCK_ENABLE, &s->is_enabled);
> -
> -	// TODO: Implement for DCN3
> +		DPP_CLOCK_ENABLE, &s->is_enabled);
> +	// Pre-degamma (ROM)
> +	REG_GET_2(PRE_DEGAM,
> +		  PRE_DEGAM_MODE, &s->pre_dgam_mode,
> +		  PRE_DEGAM_SELECT, &s->pre_dgam_select);

nitpick:
Add a new line before each comment in this function.

> +	// Gamma Correction (RAM)
> +	REG_GET(CM_GAMCOR_CONTROL,
> +		CM_GAMCOR_MODE_CURRENT, &s->gamcor_mode);
> +	if (s->gamcor_mode) {
> +		REG_GET(CM_GAMCOR_CONTROL, CM_GAMCOR_SELECT_CURRENT, &gamcor_lut_mode);
> +		if (!gamcor_lut_mode)
> +			s->gamcor_mode = LUT_RAM_A; // Otherwise, LUT_RAM_B
> +	}
> +	// Shaper LUT (RAM), 3D LUT (mode, bit-depth, size)
> +	REG_GET(CM_SHAPER_CONTROL,
> +		CM_SHAPER_LUT_MODE, &s->shaper_lut_mode);
> +	REG_GET(CM_3DLUT_MODE,
> +		CM_3DLUT_MODE_CURRENT, &s->lut3d_mode);
> +	REG_GET(CM_3DLUT_READ_WRITE_CONTROL,
> +		CM_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
> +	REG_GET(CM_3DLUT_MODE,
> +		CM_3DLUT_SIZE, &s->lut3d_size);
> +	// Gamut Remap Matrix (3x4)
> +	REG_GET(CM_GAMUT_REMAP_CONTROL,
> +		CM_GAMUT_REMAP_MODE, &s->gamut_remap_mode);
> +	if (s->gamut_remap_mode) {
> +		s->gamut_remap_c11_c12 = REG_READ(CM_GAMUT_REMAP_C11_C12);
> +		s->gamut_remap_c13_c14 = REG_READ(CM_GAMUT_REMAP_C13_C14);
> +		s->gamut_remap_c21_c22 = REG_READ(CM_GAMUT_REMAP_C21_C22);
> +		s->gamut_remap_c23_c24 = REG_READ(CM_GAMUT_REMAP_C23_C24);
> +		s->gamut_remap_c31_c32 = REG_READ(CM_GAMUT_REMAP_C31_C32);
> +		s->gamut_remap_c33_c34 = REG_READ(CM_GAMUT_REMAP_C33_C34);
> +	}
> +	// Blend/Out Gamma (RAM)
> +	REG_GET(CM_BLNDGAM_CONTROL,
> +		CM_BLNDGAM_MODE_CURRENT, &s->rgam_lut_mode);
> +	if (s->rgam_lut_mode){
> +		REG_GET(CM_BLNDGAM_CONTROL, CM_BLNDGAM_SELECT_CURRENT, &rgam_lut_mode);
> +		if (!rgam_lut_mode)
> +			s->rgam_lut_mode = LUT_RAM_A; // Otherwise, LUT_RAM_B
> +	}
>   }
>   /*program post scaler scs block in dpp CM*/
>   void dpp3_program_post_csc(
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> index f4aa76e02518..1dfe08dc4364 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> @@ -148,6 +148,14 @@ struct dcn_dpp_state {
>   	uint32_t gamut_remap_c23_c24;
>   	uint32_t gamut_remap_c31_c32;
>   	uint32_t gamut_remap_c33_c34;
> +	uint32_t shaper_lut_mode;
> +	uint32_t lut3d_mode;
> +	uint32_t lut3d_bit_depth;
> +	uint32_t lut3d_size;
> +	uint32_t blnd_lut_mode;
> +	uint32_t pre_dgam_mode;
> +	uint32_t pre_dgam_select;
> +	uint32_t gamcor_mode;
>   };
>   
>   struct CM_bias_params {

