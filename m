Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48488606044
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 14:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C4910EE37;
	Thu, 20 Oct 2022 12:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C3F10EE37;
 Thu, 20 Oct 2022 12:35:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbPPDxy0yTnzm7g3nGAHC/6T8it/wuqeQLJHoRXg4WAkIQaMngjhc/QFHgyVY6k/EvmuIGUP4iTyp7R8Xa5u5kdRXiuqBWXxCuDW5o1U6y0aOm4Q+eCrTMLXNm0B6sicLufgpF2xeeDfjaP5bgaefeq5hSTIk9vaZzz/chKiDJlL864GawYibNxWgVFARTrWf0WYLsZbtz3Gp6z1NlLVTm6ouE4t9O1wT6Y7/DC63Cp5xPwofu5ktC+D3w/Jg0JSFDiIHYoZw+jf/GCCLQUqBi1IF6eDP3xjIshnuNN/8x+LST75Uj4S5r85LhyFkAFPUbbxrqinPQdnvoNuYb4dXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdGS4KXe9XUKpLpxDALHM17c/IMunNGUpcyggSxe2YU=;
 b=d4DAV+/Eq4lwsLVA1fpHcJdYhWO2qiWvmr1H/s9vUzpgfM981CiKA8c7FvanRjMIt2K4OSpJNFpRDJKMuO7fU95j2K8GB6X/nDw7PDwIyMnN20cV9brzNYd+Re7vQH/yXFEtwLhqZbZYL5RP3Y3YOE6Thz1WmFgtC2XoSSBlM/36rTMil+q8JuHwD6HHeGwJLpxTItt0toRvuDR9Fh7bRM8s7eL3+KAFCo50gMpzCfpmJOzF2egxNnJr0ss/BZyd5K34zvQPtuE5aYWZl+lYkr0XWHrM7fPUvf/aTMUFDjOAq5xvW3N1XU4jEfPPhYzH2M4OOCuHUqn8/d6ZlCmOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdGS4KXe9XUKpLpxDALHM17c/IMunNGUpcyggSxe2YU=;
 b=YHEqvVNnXNH/XdpZknl5wlhuLwjR8l+Xdy6w6lBfU3pWYj3IOwGz9aWFcsgRJ/WMkYy012bVsQqwDXClgEt0OLDFly1TVhOGWxtZg1ymCqhnr0ip1mgGDlYzRHiRtH9lRtor+fyfDRejBIbGHpZDnSxDZi8UYHryrgtKiakF1h0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by PH8PR12MB7026.namprd12.prod.outlook.com (2603:10b6:510:1bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 12:35:25 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588f:c941:4f62:9d89]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588f:c941:4f62:9d89%3]) with mapi id 15.20.5723.026; Thu, 20 Oct 2022
 12:35:25 +0000
Message-ID: <ea5d60cd-8d0b-7018-425e-b91e5750a830@amd.com>
Date: Thu, 20 Oct 2022 08:35:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] drm/amd/display: Revert logic for plane modifiers
Content-Language: en-US
To: =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 harry.wentland@amd.com
References: <20221019151543.22753-1-samsagax@gmail.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20221019151543.22753-1-samsagax@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR11CA0008.namprd11.prod.outlook.com
 (2603:10b6:610:54::18) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|PH8PR12MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5152b3-bd35-42c7-f4e6-08dab2978fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1AHt/4VaX6eNsFsOT3O5Z+JHFU2YrFRlhJFQLSrtK2ZgXPV02P8hVlmJjLpJTNB61axam8ge6jwF5FQsM9aZA+HeFUT0noNW7zoA1LyIQGDDfxZAmo6V7RHcQFsaWPd+kuaAM0LirwYqsLkIRFe39QHxP64OtQopNUXia0tBVUdmnqbK1PhYBMH6tPkWSv3ABwb73yWXY03P0iC8d9O3TN3GCY9yqSnJkvPOROzeYSLov9aD174Ywi8KGu1ubjnJ0zYz/IUOmm081T/AlWJDJYRPBbsnoqC1j/yRQrgDR9kewZfp8tgw0rf78rBzdpHT0S2ybFMIudGVxLNreDZYd4y2YQrtuhTdAyXOoJl4MahHml67XYSyqEvFC06rcNK51JXtFeDA6OHgjs0lyTe28SLksmJDTqv84nVNGjTzhA+Csz3xMOKgQVvyX7PPvhFr9j7MW31GAAAPFfQ0oX180XHBTgjaTMKvDYjOFEOg9ggOGLRmMPjN3TWLBRWoNfGzJGhed5EzbOnWG9YmQcUejCoXsgwoqckvPDwxy0Z6zTqJALJibByKCgNwTonZYclbUBLC9YOp0w/ydKdocV40uwP3/pdDCEoEtGStOtAgKfL+UUGaYxH34PQYC2DfkRCtTtRZkElOuKRtvwarVXp0cmyH0zkVBHUKvgdarTvTcRD7XQX1zqrsgen7E2OIDvTXqXVC2BC84gtf+gozwYVbQbbS4L6FUoftvC+7SeMw6a2G3AIC+MWZt/DNEecgy8Gyt3dc9HiHeLV4xPcs1ElG02cEbV8XaYNTpfxI/ffl47dpFDtL9VGi09PmtJhwaa1L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(316002)(83380400001)(2906002)(31696002)(86362001)(38100700002)(478600001)(41300700001)(8676002)(66946007)(66556008)(66476007)(4326008)(5660300002)(6486002)(8936002)(6636002)(2616005)(186003)(53546011)(26005)(6512007)(4001150100001)(6506007)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2ZQSU1yTEw1VUNKOFpZZm95YVo2QzNIeTZ5SDdMK2lmN2IzOEpQeUlIOThk?=
 =?utf-8?B?SVRMQVU1a0gzNzY1RVhTd0tjbGF0UERESEF6cmJNSko5WFhRNktqRXZWNTB2?=
 =?utf-8?B?a1FGMGZ3NmliTHkwRHM1Tk0raUZOSDRPUXhia2lwWFNZS0RsU2NKZ3FwTG9X?=
 =?utf-8?B?SEs1cG9uQ0ZkbzViMzk5YytacGpsYnZta1BIVXVYQ2FjYmV4bldoMXRNb0hq?=
 =?utf-8?B?WEtZbklWb2MrMS9yOTcwNnB6MERJUVNtTTNxQU9MbkpkRytqaFBidnVRaGxT?=
 =?utf-8?B?cDhzNWlIUFg1ejMrOFhTYUFnaDVhRThaL0NranUxWlVTeXZvaklyWHB3TjVL?=
 =?utf-8?B?eU5ZNHY5cEFBM1ZnSW9qNjRPcTNEZG9wS3VPcWVLZWZGaE5FUXdjWCtZWWYy?=
 =?utf-8?B?aXNiVDRDZm9TMzFGT1REMDYzMU5QcmdlVWFvNm8rTDFqQWZwTGl4TEFkYlRj?=
 =?utf-8?B?V2ZOR3lUL0VOUW1OdTI3bWIwZU14WmE4bGptb3BSZklvMWlWUGl3OHR3Q3pZ?=
 =?utf-8?B?QTZwM3hUM0JhWlEyOEh6V0NNQ1MrK0k0VUF6RjAwVnI3M3Q0SU5rZGpZVWwz?=
 =?utf-8?B?ampYN0R0Y0JRR2dJUHNneDl1VkVrTnJVZjU2cmFnTFhsa1Z4V2FFS09qYWR0?=
 =?utf-8?B?SUVZcG5oM1JJenZkbEV3dFg1aC81NEZLMU1tc2F6Z1RvaDRDeDcxVUZ5K1Mv?=
 =?utf-8?B?SDhKTTFaS0k4MVhXeGttY01xQ2d2b0hpK1hadVlmanIvR28vZHdKY3pvU1dn?=
 =?utf-8?B?L2QvVGhQUm1LcWJlUU1ieG05SlBpVXFWS1dteElFdkwrOVZ2QnpZOC9uTHpx?=
 =?utf-8?B?aTFVU3YzTWFVaXN5T0VFUGtyNks1Z0EzQW9VOVpSQTl5dU1yNUNIdGd0cElS?=
 =?utf-8?B?VHdFUEZJUW1sd3M4a1hkQmVaYUZkTFBpZzY0NkVVT0c5OVhoOFExQmREdzlJ?=
 =?utf-8?B?OEhIWFF6NjdlTHVEcllXdnp6S1hleGFlOHd4VUgwMXdNNmtXMWcvbUx5eXlD?=
 =?utf-8?B?T0pSNk9LVytmRkNkK0Q5aWhodmNTb0xaMms3dk4rQTRpRFJQUm55SjJBU3A0?=
 =?utf-8?B?VDh0d3dVa1BQM2dCMmtlTHFhZUZDNnFYY0FrQUc1SHRHd1QrVVZvaVY2bnRn?=
 =?utf-8?B?dVFscWVoWXRWL1IwREwwYW5nRGVwWEhVT3ZjZ2w5cjZDY1hiYmhGSkRnZ3Nm?=
 =?utf-8?B?d1E5ZG9OZTIwV2VxeUhXWGlteDNoUXI4cUtQWG1OZGQ5Q1JwZHdkUEVITnhZ?=
 =?utf-8?B?ZHFOVENjd2g4d2VzNlY2cFMyeHZBQVROdVQ4S3MvSmI0SEhKcEsyRmlkNHZ0?=
 =?utf-8?B?OGp4K1JkSEtUWmlrMkJnSjdQb0t1bDVCZVpMZ0FIQ2JVTWNsanJ1RHVoTTl6?=
 =?utf-8?B?SVVhQkVsaVRIOU4wZUJBc3pyZ2FFcnMvZGI2YVNIejNhZUtNRURScEdVNy8w?=
 =?utf-8?B?RXhFTmEzaUw3NTNkRGVMNER4ZTdQMFhQQlB2bHJpYWxUNlI2Y1ZmZmptQVRL?=
 =?utf-8?B?RDBqS2RWZ0t2dmx4clk0SHVRR0piSFgxbmFWYWRUUU1HbE1NMVM3eVl1UVFt?=
 =?utf-8?B?NzZhTi9Rd3lYZFRJdHpkSnA4RnBqRjZCOXV5U05nZGhnYWd0dW9ZZUd2S1Ar?=
 =?utf-8?B?dDd2b0dmUEQwY1hTSkUxUmlyZFgwdlQzMzlhWmJ0VFhWU0Y5Z0lOejdrS2ZD?=
 =?utf-8?B?RTVSSExZNk1DeDJ6T25oNjlXdHZKcmVGTVFJMW1iMGRySDhXMGF5STgreitZ?=
 =?utf-8?B?em5VdWZ4SjhPYTFUaW8wTUtoaXJxSTZ2b2VVODhDQ1BOK2hMWm9yUGpwTCtk?=
 =?utf-8?B?U05oSXVNZWIzWlJNSGRVUUl1SXVMR3daTGMyTEYwekdiZmk2eEhMODkrSklT?=
 =?utf-8?B?WW5iTUNmZkF0NTZEcVBUckYvYnlCVUQvMmpnRGREd1plS0lQVzcwVTlpZ01t?=
 =?utf-8?B?cEcyeTFnUEFxWGhYanY0UXJndEVDaW5wMk5oeGZHY2lSMUtGQTJVQzdnUUl3?=
 =?utf-8?B?QUVyOVVNMDh5OFJ0Q2ZNYWtsZ0hKTjNPTGREbjVtWVFMakJ0aDlDQk5hMmRw?=
 =?utf-8?B?d2VXKzRvdHBKOGhMQjJSc0FiTnZFRUZOSkZrNWpWWXlRWVJ4RjdiOGJ3QUk4?=
 =?utf-8?Q?uFyMMOPs1qqHJ+tsaPLps6Rjx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5152b3-bd35-42c7-f4e6-08dab2978fbc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 12:35:25.1271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQ9gA7s3u3NarQPem5JMnZnnNAU6T/GjNoyMkMlBxhrJ9tfcuXxogxJue4Hdo3RpCfQ95IQMoJ3jXoVMwwCQTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7026
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-10-19 11:15, Joaquín Ignacio Aramendía wrote:
> This file was split in commit 5d945cbcd4b16a29d6470a80dfb19738f9a4319f
> ("drm/amd/display: Create a file dedicated to planes") the logic in
> dm_plane_format_mod_supported() function got changed by a switch logic.
> That change broke drm_plane modifiers setting on series 5000 APUs
> (tested on OXP mini AMD 5800U and HP Dev One 5850U PRO)
> leading to Gamescope not working as reproted on GitHub[1]
> 
> To reproduce the issue, enter a TTY and run:
> 
> $ gamescope -- vkcube
> 
> With said commit applied it will abort. This one restores the old logic,
> fixing the issue that affects Gamescope.
> 
> [1](https://github.com/Plagman/gamescope/issues/624>> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 50 +++----------------
>   1 file changed, 8 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index dfd3be49eac8..81c1fc9468b8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1371,6 +1371,8 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
>   	const struct drm_format_info *info = drm_format_info(format);
>   	struct hw_asic_id asic_id = adev->dm.dc->ctx->asic_id;

Hi,

First of all, thanks a lot for this patch.

You can drop asic_id since it is not used anymore.

Thanks
Siqueira

>   
> +	int i;
> +
>   	enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;
>   
>   	if (!info)
> @@ -1386,49 +1388,13 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
>   		return true;
>   	}
>   
> -	/* check if swizzle mode is supported by this version of DCN */
> -	switch (asic_id.chip_family) {
> -	case FAMILY_SI:
> -	case FAMILY_CI:
> -	case FAMILY_KV:
> -	case FAMILY_CZ:
> -	case FAMILY_VI:
> -		/* asics before AI does not have modifier support */
> -		return false;
> -	case FAMILY_AI:
> -	case FAMILY_RV:
> -	case FAMILY_NV:
> -	case FAMILY_VGH:
> -	case FAMILY_YELLOW_CARP:
> -	case AMDGPU_FAMILY_GC_10_3_6:
> -	case AMDGPU_FAMILY_GC_10_3_7:
> -		switch (AMD_FMT_MOD_GET(TILE, modifier)) {
> -		case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
> -		case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
> -		case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
> -		case AMD_FMT_MOD_TILE_GFX9_64K_D:
> -			return true;
> -		default:
> -			return false;
> -		}
> -		break;
> -	case AMDGPU_FAMILY_GC_11_0_0:
> -	case AMDGPU_FAMILY_GC_11_0_1:
> -		switch (AMD_FMT_MOD_GET(TILE, modifier)) {
> -		case AMD_FMT_MOD_TILE_GFX11_256K_R_X:
> -		case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
> -		case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
> -		case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
> -		case AMD_FMT_MOD_TILE_GFX9_64K_D:
> -			return true;
> -		default:
> -			return false;
> -		}
> -		break;
> -	default:
> -		ASSERT(0); /* Unknown asic */
> -		break;
> +	/* Check that the modifier is on the list of the plane's supported modifiers. */
> +	for (i = 0; i < plane->modifier_count; i++) {
> +		if (modifier == plane->modifiers[i])
> +			break;
>   	}
> +	if (i == plane->modifier_count)
> +		return false;
>   
>   	/*
>   	 * For D swizzle the canonical modifier depends on the bpp, so check

