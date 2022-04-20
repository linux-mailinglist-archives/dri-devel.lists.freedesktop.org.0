Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE55850844F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 11:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55045892CD;
	Wed, 20 Apr 2022 09:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2072.outbound.protection.outlook.com [40.107.101.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D5F8825E;
 Wed, 20 Apr 2022 09:00:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeaWlEzRCPzmHsRJ3g9ZCBscFHNukHuggBdqg/WlLGQrCzH+pYhI3N/uLJRbzo22M/zplAEpG7qZY4D43ZsR2EH7wTRFB9n+6QBUQL95MURs6t2ke5OIkfJSTGWEnnliPPwUYy6DaWrAh3+lgCbKPad95nsWigIDh3MD89A4jhfMgKN4+SqCZjBlo/dXeIvgBDkSGts49XF4Hb7sMUwOVH4r/qBllQBDF9U2qVyrHDt7Q2lrSijBdLzLGj5wMBeud/VADfcHMFSjSYP+MeXx87PjpgnE6DcbkTyL/V2beKhzeFOSyi+0rjQthLrIkO4C2XefKocM0s5Tt1fO0kkmNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fHE4pX+x/MUQBrh+3oFBNcDec5a2NjMJWyJc12zLSU=;
 b=YcB0R50Us4hpjMwUyMrpHyk+x1v07kPK37EhpJV4HJGURrasy6UiE/OlsBVBTGiV3m6RskVy4oF30n6rlJU9NtR7TVw9p6wQAa4/1Qk35BSTCqD+8KuuN31GGJHsYYR5de0jCD0AO13ZpJRxPmlfSxVr84okVPqzPB96xHx+1VWGVi64tz3foSIFoUsuTwbkKvgmMklbXPdBHdIPhxeVQCIfkvgivALmiLGqzbtpDsCKBHugMN89L3D7QFWg8RUw1krgueDmepRLbzf4vFGAmXYu94pyBCsAl3E9wbUcAyx5opUK36V2hRoEHVOFFEqETJ3c4pAb3jgBjQcn7h6qmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fHE4pX+x/MUQBrh+3oFBNcDec5a2NjMJWyJc12zLSU=;
 b=yUn0AdiYkPaUnCn1mdvz8RwYNxZv5mDQkxccYSE8s57BzqRa5hWhL94oNs/tadR05Boo6O9SriZ36t0sIM63M2n4WP5b5hGmjR3QUZk9i74+wkUKU59ZO1AQk2U8ComLJkvgYoAOL+R5dDWoZBOODiO0wbSqpTzPalzZwD1Bjmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB2867.namprd12.prod.outlook.com (2603:10b6:408:99::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 09:00:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 09:00:22 +0000
Message-ID: <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
Date: Wed, 20 Apr 2022 11:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Content-Language: en-US
To: Yang Wang <KevinYang.Wang@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7aa11ee9-1fbb-4496-32ea-08da22ac33c0
X-MS-TrafficTypeDiagnostic: BN8PR12MB2867:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB28673F28B7040E9CA675CAD283F59@BN8PR12MB2867.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16/j31lbxg1GkdHYh5RrZyxJyk94RAhraPH41ehwcYjMdhGlEPyRZ42U/maev1NZ9yikQgvsYu24hPI7pqpQB/KzHk+AWpRp3DikY6DKjzlWTpMQIR7Cm8FzJTzsZCNRLkzeGiBVvIQ5FcPkwCoaojGS5vWx1Qz92kF2NnJdQlZWvKPNwolPW4FSonZXLoyeDNIPdZhSijyn9WlhWEr/XVVQBgYEPNW0+QnriX16F4dZUVgSbGX/AGgEo3wWL7U17XykyjBUBi+RLRJsv2Z4MAa4S9Geno6QUlUno2NHgkDvxehyVXPpNF6Ar5wjkddGoQKhznKEmglbzjNjTpn8ZSCxSUWIp9Px11fdc9+XWKUQTSAM+6i6ZrnX2VoDRn0Il33QRFF+cx6kVqbrlMix6YAb8T7JJ//vipWtaJDOcb6ri+16Qd9UO9wYD4tlyh8SAbSfIEuCQ0g2fQUtzYbKNS+KzSJANUwQxa3VvM6kzXpMbI6hVWi4osHFYUXP7EdcbA0hi9tWWNb/DYhd1vfBbKJMs2V5n2EmihV1wJROCBFbcDUIJVJvJt5PdG30U4PrEZoMckd6MMH75TtMSyaYUl6fdVou6YCLMWa4Rwwt9LevKWieKXL8ax6Q81xHkIBakPo3XesRPnQPjCHRs7vw8mebnVQmJ9MrnRXt0GviSYMyqwKF+7GVXYZrtmCFca2kDhDiSBIjFi9HJ1klGf68OgJSlIriWxvDrlCjxu58tD3VFK1QBNjFWffHqQbnJw4v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(450100002)(508600001)(66946007)(8676002)(83380400001)(8936002)(38100700002)(66476007)(5660300002)(86362001)(66556008)(2616005)(2906002)(36756003)(31696002)(6486002)(6506007)(6666004)(6512007)(186003)(26005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFVCTmNJbFdYZWwrL3FvKzIreE1raTZJaDVKYXJnUFYzQ2s5NlZ0N2NkQ1F3?=
 =?utf-8?B?TTRiNm8xR1JjOFUyaENzUG8zNk0xTVRVcUU2WnJYYUc1YmVLLzVkYXA4bElx?=
 =?utf-8?B?TGR3TExoWmd6Sm8yRDdhTlE3dlFkMGV1ZE1XVVdoQ2dST3hscEExZEx3am9O?=
 =?utf-8?B?eXFxdkpqZUlSWHJvdDYrVXJjcFozT2FCYnJpbzRvRnJmWEZjanBseTFrdEJy?=
 =?utf-8?B?T2xoZlJSRFlxYjNhWldtZlBUQ2pFdnFjVUR6dTlucHl0ckFHaERQdDhSeGt6?=
 =?utf-8?B?VlJZMkdrR3M1TkRxTHM5SHE0OGhzQThDTitFVWU3amx5ajZnNy8zRDZJa1lz?=
 =?utf-8?B?bnM2eGZhK2kwb2ovUThheXBRa3Z3bWpkSXZ6Qnl0WHdZZDlOT0JWWWc1RlE2?=
 =?utf-8?B?M3k0RnNiYWZGMmppUVJiRFdjTDRLUnFxU1Fhak1sWWp2d3RhVC9mblRQNi94?=
 =?utf-8?B?am10anJsUFZFMk9QdlJRZTJ0RHFTYkdQUnpJSFF6V2s5aGFicHZrMHMyU3Qy?=
 =?utf-8?B?cUtsREx5T09rOUVocUhYV0Z3MnFpTzkxR0pDMytsU0hxNWhjVWlMeWUrODhB?=
 =?utf-8?B?blVQYXl1OXJSaElvK1VjblJBUXNjS3FrMmMzYXhLcmpXQVlsbjkrY21hTFV3?=
 =?utf-8?B?TWtmL2oxYys4b2p1YStoY1BKNDBuYWVIQmtIWVl6Uk5MTUp6NjJmc1VpYkhX?=
 =?utf-8?B?amFpNEx2MGh2aDg1N01nWGhVZ1JtMThnMVJSdXhuN2ZrTG9EOUxocmpXRGQw?=
 =?utf-8?B?RHNQN3UrWjJ2Y1dMcjVyaERMcDUwbFBCZDZVbllaRmh0UXpxb2hZRzd6OXJL?=
 =?utf-8?B?d01kRzdONVFVYjNjQk5hK3orTmtuRVIveHZscmtWZXcyUm1RWThyVW03Yk9z?=
 =?utf-8?B?M0xnQWZyMXlXTUlTTmJydVp1MHBCMm8yd2VjbjR2eitXN1VBMlNiRDQxSlhW?=
 =?utf-8?B?LzFlWjZDWEU1YmZCY3N1M01kWXFkOEhONHI4NDVKMmE1VHppUGVxc1pKMkIy?=
 =?utf-8?B?cG1EZm9ZQzlNTS9tWGRmNElIVVN5Mk1lUXlEbXV2dmtyV3BXK1NIc2VsY0gz?=
 =?utf-8?B?U0FwYmtGSTc2bi9VSjZ1OXRzc25JRWNsV29jY0cwNmlOMzAvQ0lOOGJ1Q2x0?=
 =?utf-8?B?ZVJoSncrclRyNmZvbktVUlpsZHNyaWlFQmRtYVp1MlFtcXhRZ1Z0SjRBdVIw?=
 =?utf-8?B?Q0w2RDdWOEk3azZBL2FOZXVqTjF5QTlDOGVSNVNtaHVoeEgzbURMRmxIWklu?=
 =?utf-8?B?QS9VQzFBV2ZVVVJaZmxpVHZ2VVBXQjdDQzAwZFlBL0g2VXRKYXBOTTJVVGVz?=
 =?utf-8?B?S0I4bXJKakMyZEdOWWQ5L2xIZTdQTXZ1L1RWSkZGT3hjSWd2bXdWRURwK2dD?=
 =?utf-8?B?ZldNcHI1TDJkSDR2SzV2R1NEd0lMOUk2cjFDcytkVllYbTRTekRpNjlKZTh0?=
 =?utf-8?B?aUJMMDcyRXh0OUc2VWlHR25XL2FOb3kybU5MV1JYTDE5ZEt5bEpwbmlGbVMx?=
 =?utf-8?B?RjJESStJcGdBZ2dFUFkvOFNiWlpYZm9nNS9Uc1ZSZWhoVEl3UjF3YzJSaWFS?=
 =?utf-8?B?Y1djNCsrNWxOVWdTZjdKNGNNOVFleElVR0hOUm9Oa2p4ZE9TZmpVdTh5TWtj?=
 =?utf-8?B?eDBFdmRQQXc3bko1aW92eTRxcUd4cXQycnlVL0duSGdKOHFvUFNzSHlVcDlY?=
 =?utf-8?B?RVgrYjBYV0ZzWmVZazBwWlNDazFWMkpzS01Wbkx4UG1GRnU5NU1nVDhSeGpG?=
 =?utf-8?B?VWxxbkZYbVVsaHZtMkxCaVh0eEdFcDlyOGtqTVlBYU50ZzdlbjAwU00xY2pB?=
 =?utf-8?B?aVVqN1paNW01UHUySUJYR2dkeG9xbVMxek1DK0xHRXp5V2dCR010a2VZcE9l?=
 =?utf-8?B?azNhK1NwSGMzL1FvenpHYTZpUkF1bzZDQ1VQWU9tZlpSOVJkMjlOQ1o1WVNM?=
 =?utf-8?B?cW10cVhzaFFxd3NBanlpOGZ2QmhxMXFvQVo2MlloWVUzdWRCM1lZZDZzYnRY?=
 =?utf-8?B?a0tkM2ViTlZ6b3hzZGM3djJpdzFoeER2SGRyUnY1N0VQYkNJa1hJdGNROGxa?=
 =?utf-8?B?T29oelVwaEJZdm04SnVBUEZLSFcrU3JNQ0c5alg3TU94Z2RxdXd4WHY0cy85?=
 =?utf-8?B?V3Y4Y3BnWnhieldPU3hFZVlNSDV5VEtvVEpQcHljeWpwREhKWGcyTnpiWWk2?=
 =?utf-8?B?QmNkL2JTcjdNT2NLdE1vWW92dXhXWHJaaGgzWVJJVFlPOGVBTVFvNmFnWGhS?=
 =?utf-8?B?U1JpRWgzY1NLaldrMDhQZnFsTms3SEJUTWlKOW5SVFcvQWtrckl4Q3hMUkdw?=
 =?utf-8?B?ZTdQdHQzbXdzaU5TZTNIc0o5TEVnUitCb0V0VlFJdnc1TE8xZVlyZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa11ee9-1fbb-4496-32ea-08da22ac33c0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 09:00:22.7893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWWaSBWc2ktu7ljmHn/lleN+2Sd55wuK4qthtl0nD4QBwLHxGyZUuaaVmWC16UR/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2867
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

Am 20.04.22 um 10:56 schrieb Yang Wang:
> if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc()

Hui what? Why should kvmalloc() not be able to fallback to vmalloc() 
when __GFP_ZERO is set?

And even that is really the case then that sounds like a bug in kvmalloc().

Regards,
Christian.

> to allocate memory, when request size is exceeds kmalloc limit, it will
> cause allocate memory fail.
>
> e.g: when ttm want to create a BO with 1TB size, it maybe fail.
>
> Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 79c870a3bef8..9f2f3e576b8d 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
>   	ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
> -			GFP_KERNEL | __GFP_ZERO);
> +				    GFP_KERNEL);
>   	if (!ttm->pages)
>   		return -ENOMEM;
> +
> +	memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
> +
>   	return 0;
>   }
>   
> @@ -108,10 +111,12 @@ static int ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
>   	ttm->pages = kvmalloc_array(ttm->num_pages,
>   				    sizeof(*ttm->pages) +
>   				    sizeof(*ttm->dma_address),
> -				    GFP_KERNEL | __GFP_ZERO);
> +				    GFP_KERNEL);
>   	if (!ttm->pages)
>   		return -ENOMEM;
>   
> +	memset(ttm->pages, 0, ttm->num_pages * (sizeof(*ttm->pages) + sizeof(*ttm->dma_address)));
> +
>   	ttm->dma_address = (void *)(ttm->pages + ttm->num_pages);
>   	return 0;
>   }
> @@ -120,9 +125,12 @@ static int ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
>   	ttm->dma_address = kvmalloc_array(ttm->num_pages,
>   					  sizeof(*ttm->dma_address),
> -					  GFP_KERNEL | __GFP_ZERO);
> +					  GFP_KERNEL);
>   	if (!ttm->dma_address)
>   		return -ENOMEM;
> +
> +	memset(ttm->dma_address, 0, ttm->num_pages * sizeof(*ttm->dma_address));
> +
>   	return 0;
>   }
>   

