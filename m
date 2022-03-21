Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78FE4E2973
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 15:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9980410E487;
	Mon, 21 Mar 2022 14:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C4810E487
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 14:03:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxHt2veZHk3wlHIpxQbMKeYpMYs3tGUH1kOlOG0prJt4P1gr6WZwFYicTU4+v8ayyhlu18AlQRyt8/oykt/w5fnreQ5b2718XoilL9tmq8BnNYG1i6vkEoe8W9GAyy8tQbbx//Ib7pb3nuBqYYBweIRA4H4dFyK2iRL88WRUEzAPQIghBrrrZ7ndu6ufxpRfXP1b1P6dLeHojGWyG03f6rJ+4WPW/W5JgwojT9ADI2XsIjTxcS+8PLcq6EqdysMqGzXiMIUNgPVSite8PKiW/2MXTNZsElfNuWIgcKsuq77//NpG5aAs/CpQYuV/F4uibU1Lwed8BJpN45j6DvlWpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n83C2aq12I7qZQsIkZEpuYHRr+6zLuJGrB4C2UWYXJM=;
 b=F/8ed88pgSZlY0HU0uWVv2BvhgOEu89tolBxkepsg7f/b57HMHIiFbk9L7qxaqxn8WCGiYCd+RuXDtm6Ol4Tl8y6vyXmngnQ2dECpNE/wqjcQqgcInNOKhYE0gyCG5lByob13Jva4B7m2zIXqXOEzrvy2Uwcw6gnMM49cxgjIR3UqSFA4pEW/zaNTe6Lia4Gid+bPe22asYYggxjXacusLXE8BWUGla6fe0ZZkB/piIBGLUCZ+3XAUo3Z/Rob7Qfura30/FYr3NJNCV7uW+wcHX99HWCmLPqnQUzn1kYMeTYv5FEzXvUKLjcM5xDI7uTffl/nTl/wPjPvducD26Q/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n83C2aq12I7qZQsIkZEpuYHRr+6zLuJGrB4C2UWYXJM=;
 b=wlDe0A0akBnusvvgVX2eUGdDV3IHCnw0oxgUIvk8H7IJxOEZzxTdOVXb0WkbOHdMr4pWDU4n32oqAeA2kSRuEx4l1lBswXKvJfCFmb8r6h+5jCEj6nPr+jKH5jZ3tNYlg9Fa29kmwmHcUn26eyuJtncto9lcULp2tSaGmxOWDso=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB2900.namprd12.prod.outlook.com (2603:10b6:408:69::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 14:03:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 14:03:26 +0000
Message-ID: <875f98e2-9c40-d22d-0ded-22c99ba6cd4e@amd.com>
Date: Mon, 21 Mar 2022 15:03:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/23] dma-buf: add dma_resv_replace_fences v2
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20220321135856.1331-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5P194CA0004.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d52ce42-0b9a-424d-a7c5-08da0b43918a
X-MS-TrafficTypeDiagnostic: BN8PR12MB2900:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB2900FE2C53F75A218379F47083169@BN8PR12MB2900.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p+U4oaT+ebPgWnhnMB4tTwk+8HSB7RPlN9YlUr213w21gZAXNVrRY1CaQKdp2SX+lG8NWQ9JwlmuULjuBmNWsH27KNEnQnKwGEtFk/2i+QUrjtmWQgM59gi5qY1X4vcdJ9BEWOqRu7dKcBmungKAExhvYI2oYgf5mTlzQ/mrLkeBISWwWQn9bQwmnaWyP34KcBowzFQAyuFU2y3Y8fK7CTzLlJai/7RLIu2GQIkW1n3B8q06wxtZtMobRN4sSMaigwAYKFzapi41Fg4nNx1jfXZEgIJCeIHjjsXQzNq7HTmaQoQ2OT9GEA4MABxNsHNh2moCVpTp/O3MrRru1/BHMn9SDmJTfDzloDGpnEwkUKU09+rPS4tYpSN/5i4B4DDNu93nezpadxSxw+b9+zjigh++3kr5QlTCa0Xm9jGFTiRsWDOLScY1/QyTJqTFts67EQdoflzYTpj6nq6/15diu0YMf1oVFjJKYV/A2RP2LoDFOwYQciNuka8zxB2Pnr/4InuCiq/qjjbFALjsxUoSkuyiC8n1DkChmlIccA2ZRfTuoTu97o8axQqvFQ0F5sFxCi5JQcQr9mPsqOZDoJIkG5+uNP2URqRNZ2bSD2dyBkk7NFzwcKNRaOMHO+lcEUcsp/83GpTNxOm1gPGoFwfQFYlm/yz+08X5iGDRF8P8w/s/hxTsSvO/KmVbA6SY7mQCpdaTtua55oD6hm6u0cxQucXRPqYi4J29rNuu2rwcEDJAiUWinc91kD8Vzxw0XNK3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(66946007)(8676002)(2906002)(36756003)(38100700002)(83380400001)(31686004)(6666004)(6506007)(508600001)(6512007)(6486002)(186003)(5660300002)(316002)(66574015)(86362001)(31696002)(2616005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjViUnJpbW0yaDFUQUxuSmxOR1grRHZmVTY5eUs0WXJHcG1BK2NMeDNpY2ZV?=
 =?utf-8?B?UGZUS2xRYUdpYThEMGwzTlUwdUlLdTYxNFppS3FaU1lLaXFDcERmbmk2NWRv?=
 =?utf-8?B?WFRYTlZxQ1l6bXhXeHNnYU5lWW85Y1hLVzVoQnhrNFgzWUFCRkpkZGw2RWJy?=
 =?utf-8?B?czlzby9FbnJtanVDbTM5WUZYU2hGajdsV1RvTUZxTHZHOW5PbjhRY2cvZ2RV?=
 =?utf-8?B?RzZwSG04bG5USzlsRUtIL0VoaEV4a041RHpZOGZ1VnAzRzZMQnJBL0RrSmFG?=
 =?utf-8?B?RWg3ajlrNHpPVi95QUQydkx1WStER2FJV0h1SmlUeDJwam1zb3JIUDJLRVY5?=
 =?utf-8?B?STJOb3lIYmpkQ3ZNVjZnZXJzSUxqV0xkUGVBOWdxWXlXZlpyS0tjYWFTNVVE?=
 =?utf-8?B?cm5jYjFoZklycGVMMzY4V29Ody9rN1ZJNFJkR0xvVkRUYzlxSFBSNjBnNUg5?=
 =?utf-8?B?U2wxbHVaVjdVNktpWDF1NTJVUDdabXl5SGdIN1V1bnBxWk1wMDBUSUk4eVZP?=
 =?utf-8?B?ai9FeEUzN2RlalVWOU9LOS9DSU5DcXU5Y0QweThoc1NUaXU4UWlWanl4SzRz?=
 =?utf-8?B?bUhuSkNEZnFHK3hCaHBCT0NSR0RQMEIxaXRFT0VGRGpIRUE1UndhbnhhSW9Z?=
 =?utf-8?B?WlFKRUJCMjdvVHMzRlpLbFFuenJzK3FPRTduM0NnQ1o1ZFhjYTZlOVh4azFk?=
 =?utf-8?B?d2NlOXVESXRnVFNBZ0tTakhkUjllZVFMUU5IaUpLMWc1dmFVM2p1RjVDQzMv?=
 =?utf-8?B?bStxRVcvWUZsYzRLMjZNWHF4RlhFd0dnelVMd2RaUExWcXFyY0o0UHJHS09V?=
 =?utf-8?B?RmhrSFNsTThsNkNpbEFvbWhHZkJUQjRtaEJzR2VVU3dNWFdab2NNUXZ5Zkdo?=
 =?utf-8?B?K1dNR0pLQnR5RnV5Z1cwOW9iV1dEM3BsdjJDYlRuUFpKYzdnenBxWnVzYm5u?=
 =?utf-8?B?d08zRERYUWdRWlZqZHU0T0pBQU5tN3FXOWlRVElaR2JzdHJSbHRvQTVHNG1i?=
 =?utf-8?B?ZzliV21tZllVbk1BMzFyVkxUTFpUYXVFb3d6eW11UGYwN3g1eXViZDFyTTR4?=
 =?utf-8?B?MjBTUUdBcFd4ZUxKc0FlZWtBVGMxZXh5Q3lqQ2RkUnFQU2VCUk5vSDVrK0gy?=
 =?utf-8?B?cVpqbXBtakh3Zjc5ZVV2N0JYOWltakxod1lnVmhoZDZGNjNNbDhiSEN3aVNi?=
 =?utf-8?B?VS9Rdk93Qnl2WnpXa2JpUFVzR0d2VUs1RUhuQkMxK2tUbnl5dXpzQkNFM1d3?=
 =?utf-8?B?dy9ydU9UL2RYL1Fwakh5OG5pd0YyN2JwNVVMNVFyTklRZEJ2SEVVY1VHN1VE?=
 =?utf-8?B?SkZCdnBKV1ZDU2JJTE5CUDVDclpDZlJCNHVoV0VWeHlyK0JhRUxJcFAwOE9R?=
 =?utf-8?B?Sjc5a000eTdObWJpOUN2SDUxSU5KU0h2Q3Y1a2RHN0J2QzhtMlMyWmloV01D?=
 =?utf-8?B?dG5nMlUxWTRiV3dMSjl0bWhHRmIycStiOGNtZ1BZVE1QdVBqNUhtRi9IUlFL?=
 =?utf-8?B?Wkwrd3hmL1U1OWtpWWlzQXBtc1pQQnJFTWdwZDdRcjg0SjdJdU0wWE9ZTDZq?=
 =?utf-8?B?c0t3YlBBbVQyV0F5bXdLb2l5VXE4bVJ0ZVdBcHhpWCtOeEk0S1hEZ0dWNkZN?=
 =?utf-8?B?QjZPdVBpcFVFQ2NyRHdnZ3NPbUdlYXFKRzEvN21oODZabDBsSkMwRXBVOHZm?=
 =?utf-8?B?VGVXeGpnRmwvbHVyYmVISzNFTjc5YUtyNWN3cVRhdVl6QUpFeUUwbDZYNENT?=
 =?utf-8?B?b3JhNGFWaEJRdW5oUmRvcEZOOVVWcXBtMjlramFPTElxY2hVWm5wYmVpMDRa?=
 =?utf-8?B?SkpPK0NpY2Q3Wm9ubzJzYzc4eUdEaDlzMHF3MktTUzlOT0NZSEdwWUc0YXFO?=
 =?utf-8?B?YjZERjBFdE5GS1VuQUJ5UlUxMWxuQVY4V1ByUlI2Y3h3SWZ6c1Y5NW9wK0hL?=
 =?utf-8?B?d2F0MlEvRUFsVFgyUTRrNXc4anhxSUJUUjk4NHYvQjNSNm5yYklIK1pKRjB1?=
 =?utf-8?B?SFUvRGR4ME5VUVM3WDMrb2U1dGROK3ZsSERCL0hmVkdOYUx6UHdDNkZBajha?=
 =?utf-8?Q?U2Ggk/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d52ce42-0b9a-424d-a7c5-08da0b43918a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 14:03:26.1187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aE1dgbl+7gTxFxrGAts46ziv6n5uTVKbMyhlaI4aOzYKVOx5oJX27IBxz0LGUMwm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2900
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

Mhm, crap I've forgot the cover letter. Anyway should be a well known 
set by now.

I've polished the documentation a bit more compared to the last version 
and with this finally managed to correctly CC all the driver maintainers 
on the relevant patches.

Please review and comment.

Cheers,
Christian.

Am 21.03.22 um 14:58 schrieb Christian König:
> This function allows to replace fences from the shared fence list when
> we can gurantee that the operation represented by the original fence has
> finished or no accesses to the resources protected by the dma_resv
> object any more when the new fence finishes.
>
> Then use this function in the amdkfd code when BOs are unmapped from the
> process.
>
> v2: add an example when this is usefull.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-resv.c                    | 45 +++++++++++++++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 49 +++----------------
>   include/linux/dma-resv.h                      |  2 +
>   3 files changed, 54 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index b51416405e86..509060861cf3 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -289,6 +289,51 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>   }
>   EXPORT_SYMBOL(dma_resv_add_shared_fence);
>   
> +/**
> + * dma_resv_replace_fences - replace fences in the dma_resv obj
> + * @obj: the reservation object
> + * @context: the context of the fences to replace
> + * @replacement: the new fence to use instead
> + *
> + * Replace fences with a specified context with a new fence. Only valid if the
> + * operation represented by the original fence has no longer access to the
> + * resources represented by the dma_resv object when the new fence completes.
> + *
> + * And example for using this is replacing a preemption fence with a page table
> + * update fence which makes the resource inaccessible.
> + */
> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> +			     struct dma_fence *replacement)
> +{
> +	struct dma_resv_list *list;
> +	struct dma_fence *old;
> +	unsigned int i;
> +
> +	dma_resv_assert_held(obj);
> +
> +	write_seqcount_begin(&obj->seq);
> +
> +	old = dma_resv_excl_fence(obj);
> +	if (old->context == context) {
> +		RCU_INIT_POINTER(obj->fence_excl, dma_fence_get(replacement));
> +		dma_fence_put(old);
> +	}
> +
> +	list = dma_resv_shared_list(obj);
> +	for (i = 0; list && i < list->shared_count; ++i) {
> +		old = rcu_dereference_protected(list->shared[i],
> +						dma_resv_held(obj));
> +		if (old->context != context)
> +			continue;
> +
> +		rcu_assign_pointer(list->shared[i], dma_fence_get(replacement));
> +		dma_fence_put(old);
> +	}
> +
> +	write_seqcount_end(&obj->seq);
> +}
> +EXPORT_SYMBOL(dma_resv_replace_fences);
> +
>   /**
>    * dma_resv_add_excl_fence - Add an exclusive fence.
>    * @obj: the reservation object
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index f9bab963a948..b6f266f612ea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -253,53 +253,18 @@ void amdgpu_amdkfd_release_notify(struct amdgpu_bo *bo)
>   static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>   					struct amdgpu_amdkfd_fence *ef)
>   {
> -	struct dma_resv *resv = bo->tbo.base.resv;
> -	struct dma_resv_list *old, *new;
> -	unsigned int i, j, k;
> +	struct dma_fence *replacement;
>   
>   	if (!ef)
>   		return -EINVAL;
>   
> -	old = dma_resv_shared_list(resv);
> -	if (!old)
> -		return 0;
> -
> -	new = kmalloc(struct_size(new, shared, old->shared_max), GFP_KERNEL);
> -	if (!new)
> -		return -ENOMEM;
> -
> -	/* Go through all the shared fences in the resevation object and sort
> -	 * the interesting ones to the end of the list.
> +	/* TODO: Instead of block before we should use the fence of the page
> +	 * table update and TLB flush here directly.
>   	 */
> -	for (i = 0, j = old->shared_count, k = 0; i < old->shared_count; ++i) {
> -		struct dma_fence *f;
> -
> -		f = rcu_dereference_protected(old->shared[i],
> -					      dma_resv_held(resv));
> -
> -		if (f->context == ef->base.context)
> -			RCU_INIT_POINTER(new->shared[--j], f);
> -		else
> -			RCU_INIT_POINTER(new->shared[k++], f);
> -	}
> -	new->shared_max = old->shared_max;
> -	new->shared_count = k;
> -
> -	/* Install the new fence list, seqcount provides the barriers */
> -	write_seqcount_begin(&resv->seq);
> -	RCU_INIT_POINTER(resv->fence, new);
> -	write_seqcount_end(&resv->seq);
> -
> -	/* Drop the references to the removed fences or move them to ef_list */
> -	for (i = j; i < old->shared_count; ++i) {
> -		struct dma_fence *f;
> -
> -		f = rcu_dereference_protected(new->shared[i],
> -					      dma_resv_held(resv));
> -		dma_fence_put(f);
> -	}
> -	kfree_rcu(old, rcu);
> -
> +	replacement = dma_fence_get_stub();
> +	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
> +				replacement);
> +	dma_fence_put(replacement);
>   	return 0;
>   }
>   
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index afdfdfac729f..3f53177bdb46 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -468,6 +468,8 @@ void dma_resv_init(struct dma_resv *obj);
>   void dma_resv_fini(struct dma_resv *obj);
>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> +			     struct dma_fence *fence);
>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>   int dma_resv_get_fences(struct dma_resv *obj, bool write,
>   			unsigned int *num_fences, struct dma_fence ***fences);

