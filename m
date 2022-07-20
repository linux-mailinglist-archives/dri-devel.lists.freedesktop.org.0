Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B557B329
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C24C112A3F;
	Wed, 20 Jul 2022 08:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03D710FA68;
 Wed, 20 Jul 2022 08:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5BJJCQy5exxjngj2eCxLuGeboJF4K9CoOl5HIZQND6rNaUKTL+IBddrdZZOpdvTltWKM/GuWufQz60u1g05dzsoqnIkLOP5CwTDuz2Qx5Vb0quHtU4f4IGlb17gqv2lxf4+p2xZCERePLfDEvgYNkzTlipWYu3J+cy1Mfq/TcvL89J2cQjQrRy8MgEJAAG1MPljm6Oc+q5mrh7FUfipTaxOCHQH70h1+EJS8X1F6ny8kGs8GnetM8WW29Xf+uxVcfTdZwOV1R6HC7GN/+nBtvsRYzB3ebFnRoKljL+LPChdXPDm3umou3LCZ6kehhx57ttD8BmPM1rQPFLudeua+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v502glMGbAy54A9VcSi4SzEjUpU0UHVEl8Kl/6PwF9Y=;
 b=MHPxpz514y+dPtze/d/1Rxfmct1DIl8lAGe+LUj4eQFS8bwEizphHSu01Dc8ZSVbCE7oA0SpVPBvDg+r9pORYfv3EOXXUR0w+7D+45Axg44kH00T2ygcnABQUvsIQzDpEWKGCcSvDTBT0RWawVoEZtJp8joiTak0REU4WlgOhfv0fiFlM5m42V6p5UCoTC+2G7cHTMs6zQ3ZvWzF2xAqXlMl+9Y5hRDroxWJKrah4DrXr2jyIQA2/1gLkL9IoTe4gyt95IaVmD05y4KtaOFqPI3gNGm8jDoKi/ZgRWrPj8gY9yx/dEPtv+2kskDqeLSeyINnVZCXf27u0ylf1yHhJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v502glMGbAy54A9VcSi4SzEjUpU0UHVEl8Kl/6PwF9Y=;
 b=fjWOxL47vDJxs4YgYOXvbmHIZoCrrD1h/ejUAO7xTMOkjDK6RTCiwjHvygUhm5QTvDfWhMxrOFLayakk3dKaL6xjzmnDjHefZMXppZ3s7zcQfxDfhWMc806Ku7j5fExXkNt22rJ+Q2qAU+lfayIATg0c9h17jm6+yEzceXCaFus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3470.namprd12.prod.outlook.com (2603:10b6:208:d0::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Wed, 20 Jul
 2022 08:41:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 08:41:14 +0000
Message-ID: <7b80e48d-8670-6007-d6d3-aa3587e26d60@amd.com>
Date: Wed, 20 Jul 2022 10:41:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] drm/ttm: add new intersect callback to res mgr
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220720073606.3885-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220720073606.3885-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0635.eurprd06.prod.outlook.com
 (2603:10a6:20b:46f::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18382fab-1e6e-4854-6efa-08da6a2b9afe
X-MS-TrafficTypeDiagnostic: MN2PR12MB3470:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lkGvKm/ezlvBeFLg+lc8irl5chQAXREJvgHLJZeJ0KH89K2GZ3pvrnxy2JZvE8JkUpFABfVHgwg593VpMzF4VFTvuKeVRqx89qmtLQEHp4OH/gkhIIcktrVgD7RV7kkKj1JCYsfRX8wclRVURdHBb70IC7Q3BJjbavJDR35fKwZa/4533vg/p8pTw1F5GghcnAJ/c3XIp3lz6ocVaWnaf3wNh/hrnfTowg73ws9jWmtdVHLDgyuunjYkgNXOv7ZRJdD4gGlgCEsKJYaCDxV2M9vGKTjVFe5xDBXXy0JI7tEMF0dT8IU3/zCOcLmjIGk1i+Tsizo7i1Ewnsde89m9KRud6ljSK438RJLZbgAnzHgzBPduRAOLkQE0rSoyTQpo6RGsjmKq4lsWCmYg2JouP2mHZbbXky4lgRLqi24wB/lDceRne5BLU5+Ooa8sjNgJjNrUagds19BLoFxxiNW6mnv+JGygiyJve1NSh6yP9pO3BQnVazgDrSvXr7tNKPyVELIK+OxVcm1NQm28qm1Dw4QBQtDPRYV7Jmd2zKLt9zWX3boeKHy/Qo1/Bg5saW0Ei4JWSSXGmyJWru3lvXc+l2LQp0bq42POkBMCwOxq2tLwIl0YPGHcE0LLmsnNQ+k1bo+btp8AYtbnDgCc5eCXPTH148kqZJX96CNFs8pMtbZpw9Bw2T4A82ueQsuu09FESKPWPRikAPvF0lxqQWOk9wLklQvCHAAXOMBwT4TC35+GvWCw5HxjgIsLc6/TgjJTxM04iHn547ia2g7Zmli+EhB2mOif3/qMUTwvvFITNxrHH0jeoghLcHe8HDiF1HSQ8wEjQFPlgUH5oj7cfqwDrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(83380400001)(6512007)(6486002)(2616005)(5660300002)(8936002)(186003)(6666004)(36756003)(31686004)(41300700001)(478600001)(6506007)(66946007)(38100700002)(4326008)(66556008)(8676002)(86362001)(31696002)(2906002)(316002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHdVVjM0aDVWQ0lnL05MUVo5QTNtWU9HUnJBK0tVUjBLNllGdFlMWmtaaW1n?=
 =?utf-8?B?dHJIR2E1KytmUDY4dGk1cHdrUWVCZVNZbzl1SFJNUkMwUWcxbG5CZUJxZU1s?=
 =?utf-8?B?ZXphdWlvVFhtZDBDNndEbkZXZkVuRExTQmNDd1pCMDlyVUhPRmNUaU1xRTB5?=
 =?utf-8?B?K3EzbTU0Tkg3eURXWXptK0RTUzNnam0zTXYya0FwcDNScGVMei81N2FNb1JE?=
 =?utf-8?B?Qm0zU2NDblVjMVZ3eldzcjBqUWl2THFtQ0hkNGhnbENtcW40MWd1N0xwVkRE?=
 =?utf-8?B?elQvMk9QZmdteTRlcE9XaW0wY1JqZG44Tmlnb05LektnNFE1ejF0Ym1BbFBK?=
 =?utf-8?B?bEN3aG4zcTZ4Znd4NkptSmRUZXA2dWVsei8yRHpENVpPT2hvRXVwekp1cCtD?=
 =?utf-8?B?ZVJFZzFocWR5eDJEQnlqcERIWFBjUDVubHAvYXdEU0xRSU45YW1lWWVWRG1z?=
 =?utf-8?B?NG96eVluK05UU3llbGhIT3E2NWk4dnQ1Y281MGpmSnBhWks1S3NwYUdnOVpN?=
 =?utf-8?B?Wi90VjlRTFlpakEzWWIrMllNb2gzakZWMkJEMkJnYzl5WUNReWZiOG1UZzc5?=
 =?utf-8?B?MXdGTEVSNzgrS0JyTENYdzArSjNQY0JHY2V3U0hCKzdPRjVXWEJTY28rbXhF?=
 =?utf-8?B?YTViZDN1dFAvSERsQXprem9WZkhXOW9WUGtnUTBtT29oZ0NhNGZZTCtvczlB?=
 =?utf-8?B?TmY2MmlIdUFGWU1pVGEvNzBFS3V1b1hIZDNIR2Q1WXdWZVRGam1yemtNNmEx?=
 =?utf-8?B?amE0REJtR1VLQXk5eDRFWWUyY1ZMUU5FQ2hVNjZHcDJpMERDK3d6RmkvNVZ5?=
 =?utf-8?B?NSs3MThJMjBLTnY3Qk4yaDhWQVZObHlPdnpWaXdOVGw1N016OEJJRHRieE1j?=
 =?utf-8?B?emlYNFo4RlJOd0dISVZJTC9HOW1MMUtKNk0zL2h4aEtybTZzMkl1aUtxVkJH?=
 =?utf-8?B?TStzc2lqKzU3eUtITTU2ZWx2YWFGTnJzaTlINE1ESnFOTDJhL1NKdGdYWmc0?=
 =?utf-8?B?QW1FSWJNVytCVlpNRzBuV3Z1QXl2N3NIWG5Sdm1jVEo1VFBPSVpFempjTDBK?=
 =?utf-8?B?WWdZVHFOQzljenpZbWZzaDFDTjVGRmw3M0lsNm10NXd2UW10MzEzbWhDMHAw?=
 =?utf-8?B?U1hHUlRkcWNMcnE4aVN2OEt2NklucEtDRkJqL2x6QzlkRy92eUY3Wlk0WlF0?=
 =?utf-8?B?bmMrbWwwb3J5WnZSUk1uL2U5aFVsdk9BNDFFVWw1dEs4UWxaZm1JeGJMN1Y2?=
 =?utf-8?B?ckRvVEJpRTV1VXJhV1BQbzVzcjBGRkZVVGIxeUN4TEwxSXByWHZIaE5Xb0Rn?=
 =?utf-8?B?Z2hLQ2N3WUVOQkRqSHlGbGxKVEprMFFZWlA2ak8zcnI1MjEwL1FKRTN2TEg0?=
 =?utf-8?B?NzF3aHFHTUtLOCs1NDY0ajV6a0IrV2Rqd1dUNFlQSXRDWFUraGR0VGhhZXNZ?=
 =?utf-8?B?THVFT1dFZEViL1FHM3ZWUFNmU3ZUMmM4VXZoOWtrclpONWhaKzlHMzJGUnY3?=
 =?utf-8?B?TG8rSDd3SHNqcDdrWWxlWGRzMG9RcFRPR0Y0NStjZzhqckNKNHhrYnl0dU1u?=
 =?utf-8?B?TlJhd0x4Qnl4UHNxSUhvbi9sZERYd2s1bllIOW1KN3pIUG9wT05tcWpPZHZE?=
 =?utf-8?B?M3F3b2Y3cGY3YUtUWmp1ZUt4MXNSZk4vR1JXeEhkbEZGRmNCWldkcnlxR1RB?=
 =?utf-8?B?dHNaMm1SUE9XWWsvbm9HVE5PS0Rzak1paEZWSm95ZEY0SVpLb0xZemNWMjU0?=
 =?utf-8?B?dy9vTEtFSTdZclcwVCs4aHF5aUU4SlpmOHFlL1VqeFRjenJCN0UwVGZxaEJF?=
 =?utf-8?B?d1lrZUk5NVdWSDNBSk50U0hXYjErUCtRdEh4Y2tIZFBlWXpFMkg2RSsyRjlp?=
 =?utf-8?B?V0MydzhsQWZRVUtFbXZJSmUwK0dLUUg4VzhtcFZBb1BHK2tLUlliMGZpRm9w?=
 =?utf-8?B?Zi9hQVE4cVVua0JoRHl4RVpreit0R2VoOG80UTV4aW1aVHp1alU0MUo0Z1Q3?=
 =?utf-8?B?NmtYM1BLQlh3eHhEeDk1UFlIazJlc1pnaEZtbHZvdXRTNE1Sb2NmeGpsZTU3?=
 =?utf-8?B?ZGlrRGlxalNFZW4zSWRGZVhMQThHVXZJVmRJMFJxWERIMXJLT3g5V3p2TStm?=
 =?utf-8?B?M2VFWEVESlV0RkhHQUVYbDM4NE5FRllsVUpacXJjUW15NGNTdENQbzJsUTBM?=
 =?utf-8?Q?HRanJXj+MY3BakaSpMif26VR9wzS7OvJdb/L/hyrh5+7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18382fab-1e6e-4854-6efa-08da6a2b9afe
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 08:41:14.4256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMxjAW7qnMfxTLqiuB4xx27EgvqP4Ru8uWAxKKGTMkQ5GaA0S2uo4WSEWwP2fX3p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3470
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.07.22 um 09:36 schrieb Arunpravin Paneer Selvam:
> - This allows the resource manager to handle intersection
>    of placement and resources.
>
> - Add callback function to amdgpu driver module fetching
>    start offset from buddy allocator.

Probably better to only add the callback and ttm_resource_intersect() 
wrapper function in this patch and then move the amdgpu and 
ttm_range_manager changes to separate patches.

Apart from that looks good to me.

Regards,
Christian.

>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 19 +++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 33 ++++++++++++++++++++
>   drivers/gpu/drm/ttm/ttm_range_manager.c      | 17 ++++++++++
>   drivers/gpu/drm/ttm/ttm_resource.c           | 28 +++++++++++++++++
>   include/drm/ttm/ttm_resource.h               | 20 ++++++++++++
>   5 files changed, 117 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 8c6b2284cf56..727c80134aa6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -204,6 +204,24 @@ void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
>   	amdgpu_gart_invalidate_tlb(adev);
>   }
>   
> +/**
> + * amdgpu_gtt_mgr_intersect - test for intersection
> + *
> + * @man: Our manager object
> + * @res: The resource to test
> + * @place: The place for the new allocation
> + * @size: The size of the new allocation
> + *
> + * Simplified intersection test, only interesting if we need GART or not.
> + */
> +static bool amdgpu_gtt_mgr_intersect(struct ttm_resource_manager *man,
> +				     struct ttm_resource *res,
> +				     const struct ttm_place *place,
> +				     size_t size)
> +{
> +	return !place->lpfn || amdgpu_gtt_mgr_has_gart_addr(res);
> +}
> +
>   /**
>    * amdgpu_gtt_mgr_debug - dump VRAM table
>    *
> @@ -225,6 +243,7 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
>   static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
>   	.alloc = amdgpu_gtt_mgr_new,
>   	.free = amdgpu_gtt_mgr_del,
> +	.intersect = amdgpu_gtt_mgr_intersect,
>   	.debug = amdgpu_gtt_mgr_debug
>   };
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 28ec5f8ac1c1..ed0d10fe0b88 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -720,6 +720,38 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>   	return atomic64_read(&mgr->vis_usage);
>   }
>   
> +/**
> + * amdgpu_vram_mgr_intersect - test each drm buddy block for intersection
> + *
> + * @man: TTM memory type manager
> + * @res: The resource to test
> + * @place: The place to test against
> + * @size: Size of the new allocation
> + *
> + * Test each drm buddy block for intersection for eviction decision.
> + */
> +static bool amdgpu_vram_mgr_intersect(struct ttm_resource_manager *man,
> +				      struct ttm_resource *res,
> +				      const struct ttm_place *place,
> +				      size_t size)
> +{
> +	struct amdgpu_vram_mgr_resource *mgr = to_amdgpu_vram_mgr_resource(res);
> +	struct list_head *list = &mgr->blocks;
> +	struct drm_buddy_block *block;
> +	u32 num_pages = PFN_UP(size);
> +	u32 start;
> +
> +	/* Check each drm buddy block individually */
> +	list_for_each_entry(block, list, link) {
> +		start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
> +		if (start < place->fpfn ||
> +		    (place->lpfn && (start + num_pages) > place->lpfn))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   /**
>    * amdgpu_vram_mgr_debug - dump VRAM table
>    *
> @@ -753,6 +785,7 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
>   static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
>   	.alloc	= amdgpu_vram_mgr_new,
>   	.free	= amdgpu_vram_mgr_del,
> +	.intersect = amdgpu_vram_mgr_intersect,
>   	.debug	= amdgpu_vram_mgr_debug
>   };
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index d91666721dc6..bf5de1978ead 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -113,6 +113,22 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
>   	kfree(node);
>   }
>   
> +static bool ttm_range_man_intersect(struct ttm_resource_manager *man,
> +				    struct ttm_resource *res,
> +				    const struct ttm_place *place,
> +				    size_t size)
> +{
> +	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
> +	u32 num_pages = PFN_UP(size);
> +
> +	/* Don't evict BOs outside of the requested placement range */
> +	if (place->fpfn >= (node->start + num_pages) ||
> +	    (place->lpfn && place->lpfn <= node->start))
> +		return false;
> +
> +	return true;
> +}
> +
>   static void ttm_range_man_debug(struct ttm_resource_manager *man,
>   				struct drm_printer *printer)
>   {
> @@ -126,6 +142,7 @@ static void ttm_range_man_debug(struct ttm_resource_manager *man,
>   static const struct ttm_resource_manager_func ttm_range_manager_func = {
>   	.alloc = ttm_range_man_alloc,
>   	.free = ttm_range_man_free,
> +	.intersect = ttm_range_man_intersect,
>   	.debug = ttm_range_man_debug
>   };
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 20f9adcc3235..84c21f92b422 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -253,6 +253,34 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>   }
>   EXPORT_SYMBOL(ttm_resource_free);
>   
> +/**
> + * ttm_resource_intersect - test for intersection
> + *
> + * @bdev: TTM device structure
> + * @res: The resource to test
> + * @place: The placement to test
> + * @size: How many bytes the new allocation needs.
> + *
> + * Test if @res intersects with @place and @size. Used for testing if evictions
> + * are valueable or not.
> + */
> +bool ttm_resource_intersect(struct ttm_device *bdev,
> +			    struct ttm_resource *res,
> +			    const struct ttm_place *place,
> +			    size_t size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	if (!res)
> +		return false;
> +
> +	man = ttm_manager_type(bdev, res->mem_type);
> +	if (!place || !man->func->intersect)
> +		return true;
> +
> +	return man->func->intersect(man, res, place, size);
> +}
> +
>   static bool ttm_resource_places_compat(struct ttm_resource *res,
>   				       const struct ttm_place *places,
>   				       unsigned num_placement)
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index ca89a48c2460..3f3ab2a8a69e 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -88,6 +88,22 @@ struct ttm_resource_manager_func {
>   	void (*free)(struct ttm_resource_manager *man,
>   		     struct ttm_resource *res);
>   
> +	/**
> +	 * struct ttm_resource_manager_func member intersect
> +	 *
> +	 * @man: Pointer to a memory type manager.
> +	 * @res: Pointer to a struct ttm_resource to be checked.
> +	 * @place: Placement to check against.
> +	 * @size: Size of the check.
> +	 *
> +	 * Test if @res intersects with @place + @size. Used to judge if
> +	 * evictions are valueable or not.
> +	 */
> +	bool (*intersect)(struct ttm_resource_manager *man,
> +			  struct ttm_resource *res,
> +			  const struct ttm_place *place,
> +			  size_t size);
> +
>   	/**
>   	 * struct ttm_resource_manager_func member debug
>   	 *
> @@ -329,6 +345,10 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   		       const struct ttm_place *place,
>   		       struct ttm_resource **res);
>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
> +bool ttm_resource_intersect(struct ttm_device *bdev,
> +			    struct ttm_resource *res,
> +			    const struct ttm_place *place,
> +			    size_t size);
>   bool ttm_resource_compat(struct ttm_resource *res,
>   			 struct ttm_placement *placement);
>   void ttm_resource_set_bo(struct ttm_resource *res,

