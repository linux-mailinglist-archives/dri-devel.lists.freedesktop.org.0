Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CFE3A24C4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 08:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867566E5A0;
	Thu, 10 Jun 2021 06:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782C66E486;
 Thu, 10 Jun 2021 06:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fo/ZTZm16OQjOz2HC0khPTNB2euwOIBNPaB98SDIaLpQoOJuT1xof4JSf35IKG9TzHQsPImdnSzUILW8ZquSH5IBknr6s0UGU4qj/Ujz+2sVj66FVekoZl1Vj6d3ltc9BZRBAoyMubPWwQK2Rn5YkQt5IffcTmowXla65eJzCbvfuKI01/FeMHHA4F7shVARRRd04SaAOs2i6XxYCjj7sLI2lP+iDHpK9DZHAUomij6NZNB2pMZyhoPkHNAuU5MA7aj8huWGDmYbwtIQjytEB6SjlX1MuHEl40mnoOb20VlWSpYrEEuNta8gsdvFId3aGdwucHxoSSyiuiQPAo7+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uopzG3M63stspRxliML3P7dIqA7YbgD4iVpcGDIxV4=;
 b=eg0tIuIX/ejfINC0T59fR7LTsnVtaCgTuVWwdB3uto+dbZoo8GY0gWwO/CuA2oQyCJTNFJ0ervrI448MTF5yYtgAwlnoHsdsHl52lJaYBBBw5jobVFFShEhHYuH7uTho95yUG4kMLtY1OTgBrGKjbHNyP3N7p0rHeckCjCyp+PbkfCSvb551ihHgmyxPjzNYznzl8En+WoJ9Ozkjr9i1CMULnIjXDC4eBt8+keTByhGCakma+yvMK99kDhrlxgbycz3GgiDs/HIVkzqR5Gxz5ZjNCcbqtelpNjCp/RDW9Q/wL3r7rjlkUeTr7sgu+TD+DHEUOCs+PM31ubWcJdj3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uopzG3M63stspRxliML3P7dIqA7YbgD4iVpcGDIxV4=;
 b=ki4aEfpnzFcQ4wsid4vqFhRd9spkrURtGgVoCVPWHQpcyDmwKvUr3CE3PfPcAqIPDdF/bmVwluaM28t0hVGNKTaGSpJNSUzkvybjF3tuGwONW4aAbPomM4Sb0KWTY+jM9Shj65De/+POubSZHF/Or308zaFQUCUqLRmdS0IyQyI=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 06:51:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 06:51:23 +0000
Subject: Re: [PATCH 5/5] DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <20210609212959.471209-6-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ea36431d-521a-c1c0-59e5-a196f55c28dd@amd.com>
Date: Thu, 10 Jun 2021 08:51:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210609212959.471209-6-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c285:5f9a:99f5:633e]
X-ClientProxiedBy: AM4PR0302CA0003.eurprd03.prod.outlook.com
 (2603:10a6:205:2::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c285:5f9a:99f5:633e]
 (2a02:908:1252:fb60:c285:5f9a:99f5:633e) by
 AM4PR0302CA0003.eurprd03.prod.outlook.com (2603:10a6:205:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Thu, 10 Jun 2021 06:51:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e432b94-44b8-44d8-9e65-08d92bdc28dd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40477713D862C0EFDB4B6EBB83359@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g4Vl496BMvt6aVAh2nmyyyZxI7hZVjmf3uIMzPo4lB1Es0RqI6YW/mzN5/DQuaHPc9eLbwWKhucJO1afzDkooCri34tvIfinwNvAEvYlMd94vqPnM8Rep9IXSdgWnPaeWNGu56qJJ8posWhNkFSqCE6fBlsnxSv7Rrlmcd8yATu382SWf2o06hIlrGjV4TN35XMeuLq1ur5zGtHef1SJI2PyXc0sQ/ncMLejyBN8V1J1mhXNWrtkDN4Z2YZQLFPOuyGUDsZefI3Go1DuKdQGvORKD+xEgC8/a5QYS8WtaoRASuUbHv6gOALPGFKMLnqNLrfZy4nUzjqj4ZcyZXTuoG+2lx0aN2zpR/rJn320en1KE5YtPsNwFiifmPbAhbDr9lqDJT1EvPQ8UX2P7HAXx1L2u+s8A9m7ltQyL73Ho3aPQvOkuQzKjx/3S7f4TjzNjUP/h4TC9qaGgsxehBBHpFbuP08lCDnwQxMU3TJ3NhVc/FHOmt5BXA+iFj/iwFHJ6ussZna8V+nuB/Fg9moRbMURuZAISy7claviwaksUhi4f4OGjHNlbF9wj/qMqLiDSo33bPSrYSBZrKQFGbZ4XwX1jFju2OHE6cO//iVADvNwb64JA96/wjIgLyJmL7AQkkDx2C11acxVRgLeV9Jaxqaa5JNPaQ5x2oO0JxUVezbifPrncWWCHMKFbeKcaq3v3ONM0M+0qjN2vIz4zbxA/TysmIpacq6h+ST08fuOf7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(6486002)(478600001)(316002)(2616005)(5660300002)(4326008)(31686004)(66476007)(66946007)(36756003)(2906002)(8676002)(66556008)(38100700002)(6666004)(66574015)(31696002)(8936002)(54906003)(16526019)(186003)(86362001)(83380400001)(26583001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1UwOWtvUmJaRkxvQWsrb0FvVXZpNzg1NitSVjNveTN0MTUxTUM3R2Vyc0hD?=
 =?utf-8?B?bDF5aTlmYXpNWmJ0dlByUythcFVTV3RiT3pmbDQ2emNOQkIwM0xXd1llcTh1?=
 =?utf-8?B?L0NCQmYwZnVCaWZOSjR0Vm54bHRVb1NnektTQVRGT2dNM0dCU0FTV3kyb3J6?=
 =?utf-8?B?TkM4cWlDTW5VS2tLQXVGVGR6TnFiNW9LYS9hbFlBUUptNUxheFpUd0pSeXN3?=
 =?utf-8?B?QWNBNU5LdE5WcCswVVU2cDdyQjRyQ0o5azdBajdsL0Q4MVY2NDZTR0NPK1hX?=
 =?utf-8?B?dGRjQlFPRloyTzNVT3U5Syt0NGwzTVFidlNFUlpIT2Q0MmxpeDU2Z3dhL1ZW?=
 =?utf-8?B?UklQbEdEUHZlMkd1WkJTRVpseWliWlliL2VPOUNmZVRjdnpQQVc5T3RRZ0Y3?=
 =?utf-8?B?MGkybE9RMjYyNXVFVExGVEY5aG1SbVhlbVlRa3VISU1GTFdMeWw0VytuYUx1?=
 =?utf-8?B?eGpQTXV2VDA0eXpzQ0I0VTBJQzRjZ3Y1RlIzY3BUYnk2eWMwYXBraHNQSkZH?=
 =?utf-8?B?NXBEamRCRUVzNWJxd1BRVzVSV3JXR0lnU0YwQUY5aFBuRVkzTWg4K2wvbVNX?=
 =?utf-8?B?bWR3bmFqSHpNbjJWVGROR05FYWRJRHVISS9TcGdwcjhweFpDR0dXM1B2Tmdn?=
 =?utf-8?B?MitucGVnYkJSLyswS3VsRVNqalp4KzhOcFpxV01Qayt4NXZRNXBBeHFmbFNM?=
 =?utf-8?B?Q3MwamtYRTlvOGdxMUNabTZQUzljNGlvMi9OaGhiNlNlTEJUSWwvNFE0cWlE?=
 =?utf-8?B?QkhZVlF6ZEZPNWc5cUVtaklydnNGaFkrS0ZwY29wOEhHRFVBOGx1d0ZmZkhv?=
 =?utf-8?B?TlVpeWdNRjF2L3hTNnlMakJ0SHJ2bzU4ZUdvR1hINzdkZTV5SDBMeWlLVzcy?=
 =?utf-8?B?ODhQVWNqNlBPODRtN0M3QklIWHJ6M2M2bkVuWUd2TWRTWXBFRmhiYklOa0to?=
 =?utf-8?B?SEZORnNkR3VGTnhPaU5iaG1nbXdXM1EvY2IvS1ZWUCsvenA1cys4aHFpZHlX?=
 =?utf-8?B?ZUFjWlhwMjdJSzNXNEVUa3NXTTE5TGtreWFHSzVmS01hREdjamJGbnNrUmtH?=
 =?utf-8?B?VE5zOUNxajRXSWZ5Z2dvY2FidUQxNE40cTg2Z29VUmdLRHY5ZUdQK2YxRzdh?=
 =?utf-8?B?STBDNFFDeFZHTVBCM0tNZTNvU2JFSGJaNTJ0WG9rMFA4a0Qva0UzYjU0NFNF?=
 =?utf-8?B?K3N5L1JGeFE5RUZsMTVSeWZjTENKUmtNVEhXZ2FoL1YvcG5NdmpGVzc4cHgv?=
 =?utf-8?B?aEhTTXJsYXRjaFRkWTYrYkJNNjhBOURGV3ZTSFltcmhJeDIyRTRWcDN6RWZK?=
 =?utf-8?B?bWhoQmdDQm5Ea2VQNXpZeWRaYjlURXk1Nmw2L25yd1hmaUZ1WFEwZTEvczZy?=
 =?utf-8?B?UnRsM3N1Q3k3dnQ5U1VnNW9qZkRzT24zSlA1YTVIemZVUFh0TEMrRVc1ZWNB?=
 =?utf-8?B?bGVOc3ZUbWpiVWpXYzhNNGlDOExKUmRTRVdXUkJZZE9zQjA5RU94VUJLVHo5?=
 =?utf-8?B?ZzFOdHBKSldGemc2R1RMSjZOb2dYQy82MmRwcE1VVnc1Q1YwbVRCZWE0eG1E?=
 =?utf-8?B?YUxwVzlCRCtWNHE2NDhWVUZRVmFheU14eTllZmp3VzFzUC9EVHEvdTU5Nm45?=
 =?utf-8?B?RjkzbVV2VUhHcVBtS2N4OUc2Tlg1di9iamk5RXpFeUd4SjZnRUZCa2RUaGRy?=
 =?utf-8?B?YWRkZ0QydTg5K1NGUGR6akhJRE5PRzVRcjRBeThvU0FTZ3o3aFY5ZjVQV3pO?=
 =?utf-8?B?VGxhZkFFYUxDU3dDRGVuTmI0ckhpRU9sYlFYWjF4dXJOdEhxeGR3aFJPM2xH?=
 =?utf-8?B?a0tzbS9Lb0gxbVpQc09Xem9YT25RbElHTkRHTEtUcEJyNG1JTTEra2swQzlD?=
 =?utf-8?Q?FKWLFvsKPcIXI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e432b94-44b8-44d8-9e65-08d92bdc28dd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 06:51:22.9637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEQEjArmLeOF17z0C/YMY5s0uDuRA7+mLclyGRgVUomWeTjMYz/WAGy2K2JA0L2F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.06.21 um 23:29 schrieb Jason Ekstrand:
> This helper existed to handle the weird corner-cases caused by using
> SLAB_TYPESAFE_BY_RCU for backing dma_fence.  Now that no one is using
> that anymore (i915 was the only real user), dma_fence_get_rcu is
> sufficient.  The one slightly annoying thing we have to deal with here
> is that dma_fence_get_rcu_safe did an rcu_dereference as well as a
> SLAB_TYPESAFE_BY_RCU-safe dma_fence_get_rcu.  This means each call site
> ends up being 3 lines instead of 1.

That's an outright NAK.

The loop in dma_fence_get_rcu_safe is necessary because the underlying 
fence object can be replaced while taking the reference.

This is completely unrelated to SLAB_TYPESAFE_BY_RCU. See the 
dma_fence_chain usage for reference.

What you can remove is the sequence number handling in dma-buf. That 
should make adding fences quite a bit quicker.

Regards,
Christian.

>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/dma-buf/dma-fence-chain.c         |  8 ++--
>   drivers/dma-buf/dma-resv.c                |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  4 +-
>   drivers/gpu/drm/i915/i915_active.h        |  4 +-
>   drivers/gpu/drm/i915/i915_vma.c           |  4 +-
>   include/drm/drm_syncobj.h                 |  4 +-
>   include/linux/dma-fence.h                 | 50 -----------------------
>   include/linux/dma-resv.h                  |  4 +-
>   8 files changed, 23 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 7d129e68ac701..46dfc7d94d8ed 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -15,15 +15,17 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
>    * dma_fence_chain_get_prev - use RCU to get a reference to the previous fence
>    * @chain: chain node to get the previous node from
>    *
> - * Use dma_fence_get_rcu_safe to get a reference to the previous fence of the
> - * chain node.
> + * Use rcu_dereference and dma_fence_get_rcu to get a reference to the
> + * previous fence of the chain node.
>    */
>   static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
>   {
>   	struct dma_fence *prev;
>   
>   	rcu_read_lock();
> -	prev = dma_fence_get_rcu_safe(&chain->prev);
> +	prev = rcu_dereference(chain->prev);
> +	if (prev)
> +		prev = dma_fence_get_rcu(prev);
>   	rcu_read_unlock();
>   	return prev;
>   }
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index f26c71747d43a..cfe0db3cca292 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -376,7 +376,9 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>   		dst_list = NULL;
>   	}
>   
> -	new = dma_fence_get_rcu_safe(&src->fence_excl);
> +	new = rcu_dereference(src->fence_excl);
> +	if (new)
> +		new = dma_fence_get_rcu(new);
>   	rcu_read_unlock();
>   
>   	src_list = dma_resv_shared_list(dst);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 72d9b92b17547..0aeb6117f3893 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -161,7 +161,9 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
>   		struct dma_fence *old;
>   
>   		rcu_read_lock();
> -		old = dma_fence_get_rcu_safe(ptr);
> +		old = rcu_dereference(*ptr);
> +		if (old)
> +			old = dma_fence_get_rcu(old);
>   		rcu_read_unlock();
>   
>   		if (old) {
> diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
> index d0feda68b874f..bd89cfc806ca5 100644
> --- a/drivers/gpu/drm/i915/i915_active.h
> +++ b/drivers/gpu/drm/i915/i915_active.h
> @@ -103,7 +103,9 @@ i915_active_fence_get(struct i915_active_fence *active)
>   	struct dma_fence *fence;
>   
>   	rcu_read_lock();
> -	fence = dma_fence_get_rcu_safe(&active->fence);
> +	fence = rcu_dereference(active->fence);
> +	if (fence)
> +		fence = dma_fence_get_rcu(fence);
>   	rcu_read_unlock();
>   
>   	return fence;
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 0f227f28b2802..ed0388d99197e 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -351,7 +351,9 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
>   		struct dma_fence *fence;
>   
>   		rcu_read_lock();
> -		fence = dma_fence_get_rcu_safe(&vma->active.excl.fence);
> +		fence = rcu_dereference(vma->active.excl.fence);
> +		if (fence)
> +			fence = dma_fence_get_rcu(fence);
>   		rcu_read_unlock();
>   		if (fence) {
>   			err = dma_fence_wait(fence, MAX_SCHEDULE_TIMEOUT);
> diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
> index 6cf7243a1dc5e..6c45d52988bcc 100644
> --- a/include/drm/drm_syncobj.h
> +++ b/include/drm/drm_syncobj.h
> @@ -105,7 +105,9 @@ drm_syncobj_fence_get(struct drm_syncobj *syncobj)
>   	struct dma_fence *fence;
>   
>   	rcu_read_lock();
> -	fence = dma_fence_get_rcu_safe(&syncobj->fence);
> +	fence = rcu_dereference(syncobj->fence);
> +	if (fence)
> +		fence = dma_fence_get_rcu(syncobj->fence);
>   	rcu_read_unlock();
>   
>   	return fence;
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 6ffb4b2c63715..f4a2ab2b1ae46 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -307,56 +307,6 @@ static inline struct dma_fence *dma_fence_get_rcu(struct dma_fence *fence)
>   		return NULL;
>   }
>   
> -/**
> - * dma_fence_get_rcu_safe  - acquire a reference to an RCU tracked fence
> - * @fencep: pointer to fence to increase refcount of
> - *
> - * Function returns NULL if no refcount could be obtained, or the fence.
> - * This function handles acquiring a reference to a fence that may be
> - * reallocated within the RCU grace period (such as with SLAB_TYPESAFE_BY_RCU),
> - * so long as the caller is using RCU on the pointer to the fence.
> - *
> - * An alternative mechanism is to employ a seqlock to protect a bunch of
> - * fences, such as used by struct dma_resv. When using a seqlock,
> - * the seqlock must be taken before and checked after a reference to the
> - * fence is acquired (as shown here).
> - *
> - * The caller is required to hold the RCU read lock.
> - */
> -static inline struct dma_fence *
> -dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
> -{
> -	do {
> -		struct dma_fence *fence;
> -
> -		fence = rcu_dereference(*fencep);
> -		if (!fence)
> -			return NULL;
> -
> -		if (!dma_fence_get_rcu(fence))
> -			continue;
> -
> -		/* The atomic_inc_not_zero() inside dma_fence_get_rcu()
> -		 * provides a full memory barrier upon success (such as now).
> -		 * This is paired with the write barrier from assigning
> -		 * to the __rcu protected fence pointer so that if that
> -		 * pointer still matches the current fence, we know we
> -		 * have successfully acquire a reference to it. If it no
> -		 * longer matches, we are holding a reference to some other
> -		 * reallocated pointer. This is possible if the allocator
> -		 * is using a freelist like SLAB_TYPESAFE_BY_RCU where the
> -		 * fence remains valid for the RCU grace period, but it
> -		 * may be reallocated. When using such allocators, we are
> -		 * responsible for ensuring the reference we get is to
> -		 * the right fence, as below.
> -		 */
> -		if (fence == rcu_access_pointer(*fencep))
> -			return rcu_pointer_handoff(fence);
> -
> -		dma_fence_put(fence);
> -	} while (1);
> -}
> -
>   #ifdef CONFIG_LOCKDEP
>   bool dma_fence_begin_signalling(void);
>   void dma_fence_end_signalling(bool cookie);
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 562b885cf9c3d..a38c021f379af 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -248,7 +248,9 @@ dma_resv_get_excl_unlocked(struct dma_resv *obj)
>   		return NULL;
>   
>   	rcu_read_lock();
> -	fence = dma_fence_get_rcu_safe(&obj->fence_excl);
> +	fence = rcu_dereference(obj->fence_excl);
> +	if (fence)
> +		fence = dma_fence_get_rcu(fence);
>   	rcu_read_unlock();
>   
>   	return fence;

