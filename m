Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D147943A4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB64610E711;
	Wed,  6 Sep 2023 19:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B915B10E711;
 Wed,  6 Sep 2023 19:15:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJWEunIY+OxNn8FQTYrz9CUTyfxe3ycw+kBa4129cTIJ38qOf2j1Wl8HLyRM3P0S1oX6m+WPT5sR/jfEupDjPdB66fboSHbLDT/46OrN6dNfKSmPdxVXdYo5HLsBT3yI79zm+P0UmWWjkbOsoYW6owYpsMBfAF75GoBcL/EBM+Hws5DcN4QtChF8DFj8EO9oXTdB54P4aGuoW9yOT1ggc2v/OPGjLgzAUYXTfIvO3vWRdYXmo6UPF1vi4PE1Pg2YTpPhLbR68yXS4cks6OSTPTOI0vYG/W5OYKNSOz69eQyC8EV+cdmhYx9xvlMv7UBeDI9U/x7esKFBJSl3liFRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/i3lseQ+6ZA0Mla24sCjOV2syPTsliY5yHKMmEuC+pE=;
 b=UYmf+TaYNFdDk9fvIMnl0lptiTVYp8+hzSKH7y+7xylHUIQis5vw9wF6++cEnMqjI/huEC+UOwIDlcD0bErWSfHT7NvVPZGmFze3e68XaZI0ONdF8Yt1KiBApBz8LA5N3dd4u1aPMWvzrEeYgJ0smUMiQ76+oobmStZmr5lzF9lESpqIv6noZEnQ0QaG20xOAVmLkN77ptK9NqyR24QIXs7nucQii0RmLBrd212IBMiFHQ3f5udNJXaGUthPddXsIu6gje9SDsutj6Uqzvc3+Nwx0gL8k6nEIBhGLlQQc3L4EPncyjME8twppJSyxgE0MIn2GlpZXm9iFzLRd8kXxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/i3lseQ+6ZA0Mla24sCjOV2syPTsliY5yHKMmEuC+pE=;
 b=uFmGGGXEkHc3HYt36L9KktQQVhGWi4LPDnMNS7WzGiS3E7N8mzaDdLSwuprMbkerjFFK5v6UhRexJh+tgYf1EVy9J2zcl2E76vOQot1Ejz7qg10/ofvOkvhTkrRDYE4aLNuXYM/bquq2NmcF27cToe/1WohkzJOMofHDr09Z6GM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL1PR12MB5302.namprd12.prod.outlook.com (2603:10b6:208:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 19:15:07 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 19:15:07 +0000
Message-ID: <7e11c23d-2824-4f32-b863-13cc631a6d40@amd.com>
Date: Wed, 6 Sep 2023 15:15:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/34] drm/amd/display: fix segment distribution for
 linear LUTs
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-2-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230810160314.48225-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0458.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL1PR12MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2dd472-4b9d-4658-43dd-08dbaf0d9525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tybc1Wtoxnz12sLJxJXjP7F9NIfQ1a4i3GCz1deXtDFLqOfAaQzPT4H5Ro3w+kFR9l/Q5F5j9axjqRuOnv2EuwPoDZCXuQlwinZ0/1yNJR7y4xdYgxdIw8OsGxAEGMtPmCAnieVCHX7HzlvrSm1p3b0xeFu0TgX4zQqxBfEVKGl0UI193RkKrnINLPCNwuCTL+NqaAExkJzFZbi9UzHpXHjNBkESheb23iALeoEmn8AVV2Zc7joeXsLT9AipE3mA9kyqMTOLDwNZQA1d0mhhzBH7ETcLTWcjCgoQ4W2QKxv04HljWcGvinc9XvZSkxJFeDjXY8vMX1x0MAZ9ohvBKqeg0IAQrC/HyW+vIbXcc4XS7ILtKHbfo2eP5oesOaODer7Hj9D/5pnVRACHJb55TJ/ZcBw4aaGwlkS9VQKQYvlHiEPMiruZhfVoAbMhtVZ7Npp56JBG8cCk06anhg2f3tTySIy+qhPeZPLJ0GlgIjXE5aS41X0J567/S4R2bACmb5m3gITZ9DRsPo8QXwAW4RnpUipoXBUeNASDqyY4nwAgQ27LfD0HBRjVP8XDzxcCfI/Fqvw1Y+b0RTmdGba+ssqtYRcI71u6WlArMZh7Ug8QJxZN4KbwnnMCI6Axm6g/RBz/BKGcjL25Vluc+MsFCsMD5jFFjvDEjbejGAcBdz4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(186009)(1800799009)(451199024)(7416002)(478600001)(83380400001)(38100700002)(66899024)(36756003)(2906002)(921005)(6512007)(41300700001)(54906003)(316002)(66556008)(110136005)(66476007)(86362001)(31696002)(66946007)(31686004)(6506007)(6486002)(53546011)(4326008)(8936002)(5660300002)(8676002)(2616005)(44832011)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGcvaGFtR2s5WHZzUlZ5bUl1UnR5bFRVNk1rbEx5Q0RBMEsrbjduWFRJMnVi?=
 =?utf-8?B?ME9FUVZNMjVDbnZ6SUJuNkZhejU2MEZwTElpZ0V3OHJYN1p2bFVCRkw3V2xY?=
 =?utf-8?B?eDhkMEhvVlhMaWF4VW1YcmtMSnVpakdNb1dsOXlVbmY3OVFZVE1tcHBOblhZ?=
 =?utf-8?B?aE8wQTV3UHZRL3ZubEhCVWJkeG4rTnVlWm1QbFRtbjE3bEpMdU1WZlRMeWZN?=
 =?utf-8?B?WUJKM2tOZWQyZDVKaEFoZ2JZSERUQUpubWZZMVJJMnpvMTZtR2ptVzU1K1N3?=
 =?utf-8?B?ejdNOGF6WThNdXlmOUE4ZnpxUnZPMDBPWnFYQ0tPdmlMeFc0VGRNTURDdFFz?=
 =?utf-8?B?WVpnaTNxL1piVEQ5b0RneW8xSGt3dGVtM28zRzFocEYzVW1sNUNKV2xpVnFk?=
 =?utf-8?B?MGREM3FqTllURUNLcEtoMVkwQjNWb0RqTXo2NXZZWTBMVmJ6L3ovTXY5NlRJ?=
 =?utf-8?B?S3JjTW1jK3RvNlhzL1JvWFRyZ1A5ZnFKNFI3RU1yU1o0ZHQyVWIxOTdmS0lq?=
 =?utf-8?B?cUVRbHJ0T1daeVpXeGlRNVQwaFc5QVlGRTMrdDVlYW5VZm1hd3NoVWpxcnpS?=
 =?utf-8?B?cmJmZUk2bnRWV0J0Sis5MDEwZEgxVXpSd3QzWDlFSzNOb2tCUEM4Ym8rMmxv?=
 =?utf-8?B?Uk5PRWJtdkF4Mk5ORk9LU2JUMXVrYWJyWkpZUWgxT0JzdHBqaFFtb3p5SERy?=
 =?utf-8?B?OHhEcllnR2JLemZXMHJsaTdoeTJES2ZBSkJTdjZ3aTIyTUtlaUs2U1hlSDB3?=
 =?utf-8?B?VEVFQVZrWk0rRlV3Q2xPRkl4MXR6b29nZFRmeXVmQnhnaTR5Q1VVS0c4SDB5?=
 =?utf-8?B?UmNTQXp6SWh1ZXZiN21VS2pTTHk2T2J0VlMrT3dsZlByN0l1WUxyMG9CVEJq?=
 =?utf-8?B?YVI5OFNnM0VHQkJmVnZlcWRIUXdxeVZXNXZ2VWpnalJlZjJJYW80WFVPOHQ1?=
 =?utf-8?B?UXhSYy9PM1VqN2lxeUxHTlM4VnVuWFhUaGZiT21PU0VtWHdWVnFWUTNqL21n?=
 =?utf-8?B?MDVqdzY4QTdMWEhibktsckoyZ2hEWGYzaFVBODIwMlk3RWNVWFdNNTRxZ1JN?=
 =?utf-8?B?N1JobUV4RkdxcjV4d1JGc1Qrb3dNQ09kYjlOdzBDSlNvdnA3TVRKbkdydU0v?=
 =?utf-8?B?ZWUrNys2elQrT0ZrRHdDQ0FLdzFkMzErRUV2M1ZPaVFDTDJPWjRDeGhRVGQ4?=
 =?utf-8?B?M2R2VHlLa2tyanJmWExMaWYrc1ZwZFhSNXNvcExlL2dzTnVGcC9wOW9IL3dM?=
 =?utf-8?B?NURjaFkzM1IxR0xVV1JiYkVHNjgvdk4ySlZ5dFpHbHRGQ0VPWW00OHlQdU5o?=
 =?utf-8?B?R05VdEwyWXZ0VEtqWmwrMDdqd3crMFhwUGErcVVqVWI2S2I5QldDdWlLeE81?=
 =?utf-8?B?Y0FWSVhWd1RJV0oyTk4zSlB1NGZXOERkb1h0NEVhR3VwUjZvNkswM0VJOVVo?=
 =?utf-8?B?NlRDQXYrNlZOT0R2YjVHdmR5Y2NXVTVZTC9udmR6Y0VkZzQ3d1Jwc0w5ZU11?=
 =?utf-8?B?aGZwbW90cW13OFlIMndzMk1YeGdoV1RFb2VTMm1iS3BZQXB0TTM5a3lTbm52?=
 =?utf-8?B?TExQaXpIdHNjbUFwT1ZGTTg4VlJaTk1HcEt6SG5VcHBBZ0JZeWx1d3hLVDB5?=
 =?utf-8?B?SGlEaU05SXVRZWphVFk2ay9GK0JJNjhFY3o0Rng1TnNWdDdQb3E3MURwUHUw?=
 =?utf-8?B?Y3R1aFdFQ1lYSjlkekthRkpHMS9iT21EMHdldmNTSFBUSitLdUNLekZXSTBK?=
 =?utf-8?B?Y0hkaXdoQXFYUURyOU1WVjRlTm5Xb0pMY3VIT1c0RW0rSXQxRy9yZjBiaytB?=
 =?utf-8?B?NkovZFZZMjRRZ0REUXJCOXlNM2o1a0ZYclVDRi9WZ2dBbnVMdzd5R2J2a1NE?=
 =?utf-8?B?QkRWYWl3Z09iZFV6YitiM3RpZGxwaFhCVlFqRGgrS3o4YnFDa3ZPbUVXUGNx?=
 =?utf-8?B?RUllaVc2S0JvandESFM1NE8vR0NLMVRsT1hZaE1qMzJrZmVubnlvcjN1Z0Fs?=
 =?utf-8?B?K1dPUGtvejF2dHZxUWU0cTJUbDZlclV1MUo1dDJjZ1BMUE14Q3BHUFBkNnNM?=
 =?utf-8?B?TnFwVzRJR2IxL0JQMEdQVzRIS1lRbG5zVEk2MXZDZnVRbGlXQ2w2K3ZiUlZI?=
 =?utf-8?Q?EKhjkwQNL64JAk6BIqmvesNhp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2dd472-4b9d-4658-43dd-08dbaf0d9525
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 19:15:07.7167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwajzVcXBb2f4D+kg6LDBo6eD7J+FInJlRuxuV9RnHYpv0b+S1mPU/OKSo9+Zwk1zokbtj1O/XQ7auOfccrKHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5302
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-10 12:02, Melissa Wen wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> The region and segment calculation was incapable of dealing
> with regions of more than 16 segments. We first fix this.
> 
> Now that we can support regions up to 256 elements we can
> define a better segment distribution for near-linear LUTs
> for our maximum of 256 HW-supported points.
> 
> With these changes an "identity" LUT looks visually
> indistinguishable from bypass and allows us to use
> our 3DLUT.
> 

Have you had a chance to test whether this patch makes a
difference? I haven't had the time yet.

Harry

> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../amd/display/dc/dcn10/dcn10_cm_common.c    | 93 +++++++++++++++----
>  1 file changed, 75 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
> index 3538973bd0c6..04b2e04b68f3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
> @@ -349,20 +349,37 @@ bool cm_helper_translate_curve_to_hw_format(struct dc_context *ctx,
>  		 * segment is from 2^-10 to 2^1
>  		 * There are less than 256 points, for optimization
>  		 */
> -		seg_distr[0] = 3;
> -		seg_distr[1] = 4;
> -		seg_distr[2] = 4;
> -		seg_distr[3] = 4;
> -		seg_distr[4] = 4;
> -		seg_distr[5] = 4;
> -		seg_distr[6] = 4;
> -		seg_distr[7] = 4;
> -		seg_distr[8] = 4;
> -		seg_distr[9] = 4;
> -		seg_distr[10] = 1;
> +		if (output_tf->tf == TRANSFER_FUNCTION_LINEAR) {
> +			seg_distr[0] = 0; /* 2 */
> +			seg_distr[1] = 1; /* 4 */
> +			seg_distr[2] = 2; /* 4 */
> +			seg_distr[3] = 3; /* 8 */
> +			seg_distr[4] = 4; /* 16 */
> +			seg_distr[5] = 5; /* 32 */
> +			seg_distr[6] = 6; /* 64 */
> +			seg_distr[7] = 7; /* 128 */
> +
> +			region_start = -8;
> +			region_end = 1;
> +		} else {
> +			seg_distr[0] = 3; /* 8 */
> +			seg_distr[1] = 4; /* 16 */
> +			seg_distr[2] = 4;
> +			seg_distr[3] = 4;
> +			seg_distr[4] = 4;
> +			seg_distr[5] = 4;
> +			seg_distr[6] = 4;
> +			seg_distr[7] = 4;
> +			seg_distr[8] = 4;
> +			seg_distr[9] = 4;
> +			seg_distr[10] = 1; /* 2 */
> +			/* total = 8*16 + 8 + 64 + 2 = */
> +
> +			region_start = -10;
> +			region_end = 1;
> +		}
> +
>  
> -		region_start = -10;
> -		region_end = 1;
>  	}
>  
>  	for (i = region_end - region_start; i < MAX_REGIONS_NUMBER ; i++)
> @@ -375,16 +392,56 @@ bool cm_helper_translate_curve_to_hw_format(struct dc_context *ctx,
>  
>  	j = 0;
>  	for (k = 0; k < (region_end - region_start); k++) {
> -		increment = NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
> +		/*
> +		 * We're using an ugly-ish hack here. Our HW allows for
> +		 * 256 segments per region but SW_SEGMENTS is 16.
> +		 * SW_SEGMENTS has some undocumented relationship to
> +		 * the number of points in the tf_pts struct, which
> +		 * is 512, unlike what's suggested TRANSFER_FUNC_POINTS.
> +		 *
> +		 * In order to work past this dilemma we'll scale our
> +		 * increment by (1 << 4) and then do the inverse (1 >> 4)
> +		 * when accessing the elements in tf_pts.
> +		 *
> +		 * TODO: find a better way using SW_SEGMENTS and
> +		 *       TRANSFER_FUNC_POINTS definitions
> +		 */
> +		increment = (NUMBER_SW_SEGMENTS << 4) / (1 << seg_distr[k]);
>  		start_index = (region_start + k + MAX_LOW_POINT) *
>  				NUMBER_SW_SEGMENTS;
> -		for (i = start_index; i < start_index + NUMBER_SW_SEGMENTS;
> +		for (i = (start_index << 4); i < (start_index << 4) + (NUMBER_SW_SEGMENTS << 4);
>  				i += increment) {
> +			struct fixed31_32 in_plus_one, in;
> +			struct fixed31_32 value, red_value, green_value, blue_value;
> +			uint32_t t = i & 0xf;
> +
>  			if (j == hw_points - 1)
>  				break;
> -			rgb_resulted[j].red = output_tf->tf_pts.red[i];
> -			rgb_resulted[j].green = output_tf->tf_pts.green[i];
> -			rgb_resulted[j].blue = output_tf->tf_pts.blue[i];
> +
> +			in_plus_one = output_tf->tf_pts.red[(i >> 4) + 1];
> +			in = output_tf->tf_pts.red[i >> 4];
> +			value = dc_fixpt_sub(in_plus_one, in);
> +			value = dc_fixpt_shr(dc_fixpt_mul_int(value, t),  4);
> +			value = dc_fixpt_add(in, value);
> +			red_value = value;
> +
> +			in_plus_one = output_tf->tf_pts.green[(i >> 4) + 1];
> +			in = output_tf->tf_pts.green[i >> 4];
> +			value = dc_fixpt_sub(in_plus_one, in);
> +			value = dc_fixpt_shr(dc_fixpt_mul_int(value, t),  4);
> +			value = dc_fixpt_add(in, value);
> +			green_value = value;
> +
> +			in_plus_one = output_tf->tf_pts.blue[(i >> 4) + 1];
> +			in = output_tf->tf_pts.blue[i >> 4];
> +			value = dc_fixpt_sub(in_plus_one, in);
> +			value = dc_fixpt_shr(dc_fixpt_mul_int(value, t),  4);
> +			value = dc_fixpt_add(in, value);
> +			blue_value = value;
> +
> +			rgb_resulted[j].red = red_value;
> +			rgb_resulted[j].green = green_value;
> +			rgb_resulted[j].blue = blue_value;
>  			j++;
>  		}
>  	}

