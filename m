Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 078844E55B3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AE510E73C;
	Wed, 23 Mar 2022 15:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EB510E726
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 15:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8pvxqIDe/uwoznn/ANQOL2HxayqxxKci5l+ZQnbrUc6ca+BUX1vd6w4TxIsH+0uNMgqkaPCnSsgOBo2Off31kk4I66AVLdUFPDBUQYUdgA+/Hs0YE2ZuiIj+ylTWVI3Gc68YlqXG8Ju5K4+qhhq5PBJJO+6ZH4xUHuz8X0rgJ1ComOWvkxK1w2jPomHnYnC/CJNAzaeoY9KjnNClGC5zjUrahSXPGXExYw22def/pdGe5TQS8JvRXcSCnsLtjXinZpKJWsgxXwo+OstlVJkLd6OAA0In6RlkYXU9avKtFxoGeVVQpWB6Sk10uk8QSkeMyeGwuRBngHek9bZdoVDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U27gcVOY4PYH18NGAW12Mim4Hg5NqIqaDcQIEcJz/ZM=;
 b=c1/YzcTBb9z2/RjDnUAwSlvXpM/2aKuknwndep5Y/o0qmSJRr7tTAJa1KHMW/f6EeTgSjD+tbUBC/vJHwx6bKWnQgf+nj3OfkC3byUZYgK85u/nJM53DtTbL8t6VLog30xZBdTVH5HE/FPlCLCcWl9vGOBmWFxWF0Fwr1cJkyxGjr97/HDyb6oZm3bYkRW86AaoRLbSnyHfA+OwsBpiklgS35a94YzQ2kXUMzpIT712vyG85+dlLwlY84U0byitWOBZukm8Fo37oYFXcCE+fctlfFB1ulkeXeTOlDFKqc1+JPL57nQ7llv3DJZoM0ogl7t6kS8ZX+yOsv9USsS0Dbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U27gcVOY4PYH18NGAW12Mim4Hg5NqIqaDcQIEcJz/ZM=;
 b=GRSf+rteuu5wOOLFTJMYPUHxOHZhhZVijtcYNBg8fEpYCz6TswFTs72dmW3I88Tq7AeJaWyivNOKEZ7ips8Ta8YnKvVKht5MXi2SwOgDJqDsYqnHMxZLRuXtW+J+Ju8kXw8vL35AW2TU+uOvq9y0QwzD4JBUQli5LUcsITbw3h0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY4PR1201MB0072.namprd12.prod.outlook.com (2603:10b6:910:1b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 15:55:09 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%4]) with mapi id 15.20.5102.016; Wed, 23 Mar 2022
 15:55:07 +0000
Message-ID: <c25fd1c5-aef3-9abf-ab94-e901904bc4ea@amd.com>
Date: Wed, 23 Mar 2022 11:55:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/23] dma-buf: add dma_resv_replace_fences v2
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20220321135856.1331-1-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63f884c4-1756-4cfd-9461-08da0ce5806b
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0072:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0072FACC2EB1E893ED3C872692189@CY4PR1201MB0072.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z+1VGI7aP5mPFWJvDqqCFWXgoYACVZTCiCDTNi4Bv8B3xEYkfgvvzNRQII0Kvs5rlu4tCxYbWpbeCwEYX/Vq8p/zz5jImp8XQmzQP2W94Ej98Wh7zt+5G3mfiQ+fdFLKRWYoeF74qIMzQ1Wb4kZCxPx5ASDx/MZBPmB7w3JDR1HJ0Rh/KqCBoN/YhNL8kNT/oaozom4Rag/d3e8jkvyBq5HNUk+bavf+Fge7+037LqRZ0vasA1Vi9aJSgnLkFMjnyvaD16a5agXPzxDOripBFxsWUHKKPsJEZbVmMeoRcF8KfCClUOBUxnPDoxR9tNGtmjlxcPkdOzNVWkFtXhRzkkaLd3USjXtrJIAUF0PZ0e8fygdB3pxV0/lOIOj1yH4U07zu0UH1o+w1RiE47O1tYByKggeCZ7NyqbhjAWIuFjE1sbtSt6Yg9WIE9ppcfRMsXsJfEwpr7oGJbX6nNh5hqhlMCUGlcjRGi/mqCGOO2wQiMzpmriEnT0/bew4IOd9g0RWg0VrUr0LKtltOPMYqnhcKYDV9SGYo+Fx1NFfnBvwtMlVzAk1WMEqzh9eDW5KDoVIm7d4jyuZQovGFk7UIVeaqz3vDToZvbyIZF2fuOBUMOzzIysEtmgSNG8IuQbAXAgMa3Us0N9uRU2zmmL42gG9kWaEoQ0KdhWUW2KWWZ3O9VEWheQE0KIJJrDVWM+NJ0a+P/yvsFMPl5IoZuTTOXhIpnRCsuYwMjKsgVDQYx/mWH1Qn+lXhhe0/hny4fo8n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(44832011)(83380400001)(26005)(4326008)(8676002)(66476007)(2616005)(86362001)(66556008)(66946007)(31696002)(6486002)(6506007)(6666004)(66574015)(8936002)(5660300002)(186003)(2906002)(6512007)(36756003)(31686004)(316002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTZyUllIMmlqd0NwUUlyTDNzS3ZVY0EvYkg2R1I3ak01ZlhTVDJyRWRtSUdv?=
 =?utf-8?B?RHFGNTBVdzNhSFlrVERjYzZ4REtzQmdhcVZmUzVRalRhYkg0dmgwVzVpVXNE?=
 =?utf-8?B?WEdUQS9KaUErMXk5K2JQVElLbXE2V2dYZGJxbHlneFo2R0RzQVpZV2dRNytB?=
 =?utf-8?B?cjVteE1IM0oveUlOV0ZNeDFxdGFGTUhqcENwdlllR3ZaNXpIanVXZnkxUU1Y?=
 =?utf-8?B?OW5mWXBHQkJRZkI0R1ZNVUtUc1BCcFFyVmZqUHo2SXdUa0NTYlc1VmxCY2I3?=
 =?utf-8?B?eXc5d3FGS2NqbHlOMnVKTVhPVmNwSFlCU3RRUEFudk00bFdWUUdxNTQrVzdy?=
 =?utf-8?B?ZVpEbVA4aSs5MzZ1emM4aWVpM3lmVnRIVkFPWXM3MG5Jc1BPVkdWakd3bVBE?=
 =?utf-8?B?aWN5OEhxbUxFWFVRTHF4OGxDSGdST0E1OWhrRUR3K3FyVnBadkxSVWNrUm4w?=
 =?utf-8?B?SFNqQ2tHN0k0UEdJQzBzQWNZOG51WVBFaTVXS3lpRmZNbmpUb25aYjU5LzJ6?=
 =?utf-8?B?K3RRYzZrYkpONnFNRzlpKzdycUFaOUdSVXd5WVA2dndkQXUwSTJvNytXYkxw?=
 =?utf-8?B?Q2FRRnc2YTc2N3lPK0ZHZnM4NitjS1VCVGgvbFlhcmxwU0dSU2tVeTBYa0Iv?=
 =?utf-8?B?d2NCeXRNV25MN3dBdjYvelhEMmhLdWkvZ1pYZTRkT0pwWU1ISGE2MWJ5THlv?=
 =?utf-8?B?Q3dxaUFzVGZwQlB6RTc1Q1h1WHdxZnU1Wjg3NmIraUdoSGVQamRtVWc0QnB3?=
 =?utf-8?B?NFJsc2FOdXFRRE8rZTRnYzhoVXZmZkZmQ1d2R1NhaExCdDRhZVM2YTArdlJ4?=
 =?utf-8?B?NlNrVUhlK1hjL1hLcWcwaUJ6RlZLRDVyc2FGb1RGTWtKTjgyWk9NNEl5VGtQ?=
 =?utf-8?B?ODJIUFhkalYxS0doZnJnQVpIVytDMHhSQTBJNXVGSUNYODdQUVRXYXVjZ2F4?=
 =?utf-8?B?YWlUL2hGUEMvN3ByVjgwK0x2WXE2QmpQRDdjcjRJMkhmVDFYMW1uWVVFZUV6?=
 =?utf-8?B?YXpHNmgwVzNqRFEvcFVjT0NyYzlPTWtMeGxBKzl5N3VrK3dRN2dFNzN5RXlm?=
 =?utf-8?B?R1gwVTVDUWNhcExaWko4Y3Ftb0d4aGthVHJMaUpwWDNKaCthRGlzb254U3p1?=
 =?utf-8?B?aExac21scDV2QnlwYW1ISHB1Ylh5SHppQVZKcWRwWUpVRVJTLzFiWDMvT0pZ?=
 =?utf-8?B?MXJUN3I1K3lCeWgxNmhPaWxGSjRuSGVuendVMnRpSXpwb1RzclMxc3lvZ0k3?=
 =?utf-8?B?U082K1pGRDd2Yk1RZDlYVWhrTEk1U2VFcFQ1bWJoR1gzUGhPTkVuSncwZDNI?=
 =?utf-8?B?YWdwUGx2RE1GN2hjSG1oNDZVSjlxcFRoYmU2YzF5R3A1dmE3YUtTcTF6Lzh4?=
 =?utf-8?B?U2pqeFF1QXpZeUJXZ0tleUhVRi91UTR0TzBRWlVhTjIwbHMxbVJ5SUd6VEsz?=
 =?utf-8?B?TUlWbkRCR2E4WWNIbitwZ1E0SEtOY1UxbWVqOEFwcEZoUkVVME5mZVlJSm5K?=
 =?utf-8?B?YjIzeVlUNEoxSnl2aHpzMmdSWEptNFVFV2R3b2VxSnV3R2Yxak5neDlCRWo1?=
 =?utf-8?B?MkI1VG9lUnVrZDk3c2llN2o4bjJtYU9hbloyUHRtVFBrcDZaOGd0RUdDSnZ6?=
 =?utf-8?B?aGRIRVEvdS9Ca1lKdCtQRmcvOTU1RjFOa3J1aUtkS2RSVUtzN3BYYytsN3Ju?=
 =?utf-8?B?eU91TnkxaDh4bjFZM1o3LytReVBKMXRMdGFReGhnOHBsbFRJS0o5RzYxYkpL?=
 =?utf-8?B?VEJ3WmwzS0dKWjIxdEpLN2d1YkZBSFpoU2pXRDY5L2pNaUhpbTFhTFVYZWtl?=
 =?utf-8?B?L1JEQk9jd1pSMVhkcnlZU2xUclhocE9adDNGWEFBTlJXNHdoRlQ4RVRDdFBs?=
 =?utf-8?B?MWlkbGFNZHpQVXNVcGk0Sk94ZUlwVVp3TEpNOTBJVEtiMW9QbmdHeFBGNnZX?=
 =?utf-8?Q?iWdZ7JNJNs0IYdGxVkMKEexzULrNC/CX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f884c4-1756-4cfd-9461-08da0ce5806b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 15:55:07.1361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtQwYrJ/n1pQdnkwetZS1EuHntU6mxBvXqjnP+1E7oV2W445os2e2p+G3U0LmSh56GMsOIP/SmO53aal0zXOUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0072
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-03-21 um 09:58 schrieb Christian König:
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

I don't understand this comment. Which block are you referring to? And 
what does this have to do with TLB flushing? Maybe you're thinking of a 
specific use case of amdgpu_amdkfd_remove_eviction_fence for page table 
BOs. But that's not the only case where we need to remove eviction fences.

Other than that, this patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


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
