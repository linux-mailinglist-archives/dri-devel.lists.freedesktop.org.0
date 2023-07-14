Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86D3753534
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 10:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB81F10E1CC;
	Fri, 14 Jul 2023 08:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C101410E1CC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 08:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gR7URQWI5m8DIDGvypPjhMPC7WaYc8mD8NLWHqaqz3cNKqF0MgqIwj7LWWiusMwPdmA25zw9yo2PerbS/+f8DqecQwLuBvvJp19si05Rh0+6yYjoH1a5wypzj4+ZK4PFOgitCob9bd/HPt8QvRJPKcAApAH29En4OmFULN/FT9npXgnQm0DR3ZgTx+t4jQioRfkL6L9rdshR/JlrZQGTpfnZ3q/LY+QEawZR12rBzp6GFxMUR3mBurIRDOyGZMHTbvCUlIPy0WoudnvGfZYncu9jDzclVO1e+nSQSbh4e1gUI+BLY2zza3nJsECm2sfcsEzQWtl4S2SJMQJExXWCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SY1AqsiR1fkgMbdomMNX3is/YfDfsC+znwPTJQJ90gQ=;
 b=lFh3MhHUZO4N01WqsX/JTNBQrvLLE3Pyi79MdrtAIXhg+h193zuWGKiIE98p6IjuKrVLPHYkquT6XQN4mhxj2mH052VNaY5Q79yurOx/LDM5TxN2SA8C4tOfF867Nh6jGCFLzLWWylimBxN6l3YiDvJXVrpQeWcscFZmIL6IaZdUaV2RrFUIN15WU75I6qPd9mKX6cefv+Y0VL4tAoJfxgJvdyfDssx+wGIKe6egHxh2VgzQPdL5q0G2BVWjGp/oQ1yqELMcApdE67HV2fE4F6QO7uCzESnupaXVvp8EUr3E2g3aBsvLfXlsaZRcvvHstNWfVXjJta59i4IJxGnkCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SY1AqsiR1fkgMbdomMNX3is/YfDfsC+znwPTJQJ90gQ=;
 b=GJ1tAvTAaIC8u27Xwg/LwzlEnMmN+xTWEEEcVqo4YcH4KTokfF+G+kEwCSPMpgQeKv/chSW1Y3ROjgKAD+BV0F743w6UZcsUq2GDtMc8RqGokOcvstoOiYXYKxfwla4A92Lj7prkKQC3OATXd++2vd3pqEao6oOTs6AITWe9P8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV8PR12MB9232.namprd12.prod.outlook.com (2603:10b6:408:182::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 08:43:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 08:43:53 +0000
Message-ID: <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
Date: Fri, 14 Jul 2023 10:43:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV8PR12MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: d729ce9d-6445-40aa-a8d7-08db84467429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: latLtCaI/ttoEwms4R46oEuXyEzKbeaVFNqO5KP4sJERL/5aR4X2Coo7o0Xuh7YkiPPjh/qESZ02nKUSYDq/Vdi3ahqXhdZaCgboaODFhEwAjv2gc+86xjspP7UNxmtA70XUMNL2A/qUJGo7le4PXe4BQLhd3KMNOd5514e7ReakvctHma8f/hasymPcfVqdWmJhgG/vjtfbgHJKkvzvzjaOHIWUKHf7xNf5qJFBgBpADQzUCKT0TCI0AXLCmGBZ40QQxJPE64lUsakJYV9PpDi1eyTmIeDkgC7vqVUmb9GweWu5Es6gpc0sOd+DMRgNWbM29xq6InZ+67SqNv67xuPqGrdptgCenkZOMp6wVZVLPcupA45G6qr70k/Y+6VNxAr1zMUM3zWWUukmMl3nC6wLmWCXn97dPJfwjGmOofPtdjvOLFSmmCKVXVNtrODrY+BOVySIfxIIJVOoR17mK6kS81vpWKxw5y0F+/Jx/aNU07g1i+/IjaiVcdJg9U6CqKzVt/4D0/SNQl4CA1jKPSp14tTEcsr0psFGz0M/OHyiSpdwOzuyvLYLgV9Bi3zHnSQEp4ywLD8T+mo3sX2Y460ox9+uguhakoDpoV5xB6oIarjXNUtPf8DAsXC3vj5V6ZVhU8nxIKioO3Lk35RmVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(478600001)(6486002)(6666004)(110136005)(54906003)(186003)(6506007)(6512007)(2906002)(316002)(41300700001)(66946007)(66556008)(66476007)(4326008)(5660300002)(7416002)(8936002)(8676002)(38100700002)(86362001)(31696002)(36756003)(2616005)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXhIKy8vY3Q0TlFPSkIvT0lkUnJnbjd3Qm5Eb3JuOWJQRHdpd1RacGhueFV1?=
 =?utf-8?B?WlVDSklSanNjWGNGY3BJU1ZaRmhqdStrcWVQVFMwL0VWRml0K21qL0s0cHRj?=
 =?utf-8?B?WS9CbjMxWHVjUXlKRGdPd3NQSkRLdFpERkM2UDlBbFlNdE5zakc4bEN1TVpW?=
 =?utf-8?B?L25veU5RRXdNQ1daRjhDNVBOMHBpR1JDTUFSYVkyOHJsMGhJcy9zZzU1QTBO?=
 =?utf-8?B?d2MwRUlnQTFnQ1RlZG9rUmkwZ01EaXN6MkVqdG1nV3N4alhxMCtmL1RnWE5F?=
 =?utf-8?B?d3FzV2pXWFhzQys5c0RJb0hEQ3JBc0U2bXNvN2w3TUhKMzExMWs2cXFJNEdj?=
 =?utf-8?B?Z0YzMmh3QVZsZ09WVVpFTGFCOUpNY1FkK0MrcnV3OFM5VXdFajlzdlRraVpX?=
 =?utf-8?B?TndZS2UyRmEvMDB6ZjJ3VitFSnFUajZLbERZRG5UVzg3cndLUlF4am02akRm?=
 =?utf-8?B?MTVZUFJOZXZmbHpERkwzWGcvWkZVdTJXYlpPTyswa3gwR2VNTlo5aG90aEda?=
 =?utf-8?B?eWU5eWJ6ajZ2WDNTQnc4dTJ5YW5MclQ2ZkpCK0M5NTVwQjRMZnVEdS9PODN3?=
 =?utf-8?B?WDl1V1NEcnA5NXpOZEVDR21BbzBYdWJyYjB5UmJ6a1cyYm5DOFVMck51VXJZ?=
 =?utf-8?B?aUxNZ0NoRFdrMFlaSXp0cTVzOWllRjZmbmxkc2ZsMGMwanpaNCtGbEVvRGox?=
 =?utf-8?B?RGdneUxYZDFrQUlST2Y2S1lWcW5DS2ZKRjQ4Q0cxbTZlYzRhUnRqRmkrOENy?=
 =?utf-8?B?UUQyRVJOdTlPWEUvK2lTUjA0L2RPNkxVR0l0YTBPQmJKamhBR25HZEN2SmIx?=
 =?utf-8?B?UDVEZTZoNEpHUDVHZUVhYjllcGw1OEMwMlhKOFRDeUdLWHhQY0tYaU9kSWZi?=
 =?utf-8?B?L2dRWXloRWh2TG95Nm44ZlAzdVJPLzZoaTBod01LWU8vemZhbFNFNTdXZHlH?=
 =?utf-8?B?ZVZOa2dSMGFIR1B2d3FDb2FNS3BVWlA1RkUveTBQYzFCSW05Y2JUUUZaTmVY?=
 =?utf-8?B?Qk1VaFNhV1g1ZDBKd1NxYjlPT2kxbkI3R3BmN2loaHBmL3M1R2FvakZRcVYx?=
 =?utf-8?B?N0ZIL1N5VHhlZWRkUEpseXN1QkhGMTlVNzNCUTRqRVJXZXZwWXFLV21xcHNO?=
 =?utf-8?B?RWFnYkVxQ0tBSHFTRjBBc21HM3BlMVYwTi9KMW9UY1FHV2tUaHlSRGZ3T1hm?=
 =?utf-8?B?UmVrS0VtUHFKejNDWkRxN0RoZlExVmRhTEtNNTZ3RmdWSDJJaXZ2bXpTL0sw?=
 =?utf-8?B?Y01DSnFmT01LS1drbzAwYUw3QS80N1h1czE2VThoeEFMVmJXOUVmNDg5aGVH?=
 =?utf-8?B?aElmWkJlY25MaG94T2FsaGFvK0dHN0VtQTBSRDhBMEo5eDJlbUZTTktRNnJz?=
 =?utf-8?B?LzJsc25OMUM4bWVyTHNLRnBQbGNiZnRIajVKWFVGaUNrWkZMVGUrb3J6M1lx?=
 =?utf-8?B?VUpnV1N4eVR3VnlGejY2RXV1TFJacFZBaUtwNU9MNWhVTHhUNFpEemIzNXh0?=
 =?utf-8?B?dm93Tkd2bis0Nno1MmlxNDZKalJpdG41VmFVWlZsb2lvZE1XZ2JiT1p4ODM4?=
 =?utf-8?B?MTJhWVAzN3NlSnZETHpwTWhJbEUyWWJwZG82ejc3VDlHSzhuVjBMdjlNa0R2?=
 =?utf-8?B?aHQ5eitYZEgzT2RFQVpFdCtFazJzcUllSW8wTENUZlB1NExZZDZQclZkak9Q?=
 =?utf-8?B?UlJ5TlptUEhKK1pLUnVKSGNrY2FyYVYyZTJFaTN4N3AwSEZkQzQ4dlFQYWpN?=
 =?utf-8?B?eW80dVBQL1BCL1R1TkxSelo2TW1JMjZFMWlZQUlENGVNclZ0Vm5sOE14SHhV?=
 =?utf-8?B?d2ZMV2l0cnhSUmwxNWxISzl2SzlkaHZKd2x3WFVxamR2cXRwUysvR1JTeEhi?=
 =?utf-8?B?Vk12UFNvNmdzTm1sZTJ4K1NielZ4V3FTV21SOHQwV0VsNE5KV0pWMVNrUkx5?=
 =?utf-8?B?dUJBaFlsSjAwbXVQU0hXUTY4Zmk4ZnQwZGMxODMwcWYyMFd1RU9HYXFjaVZx?=
 =?utf-8?B?RWloQkdjWnB5a2JnSm52MG5KODNSaUJlaWFmcUNxWk80VlNLbWJieXFMRzJS?=
 =?utf-8?B?bWhIcXdGQUVlbko0bjd1dWQ3d0xvcmZsYWFiZEx1KzlkcFZjSGt0Slg4Wlc0?=
 =?utf-8?B?SHVvMllicEhsRUhOMEhKSys2RFBVSGh1V3Jod1lIUUh0VFZKWXNXVkRvSm5s?=
 =?utf-8?Q?Q1UyZm65J85EhkoGK3nH6daVbRh1VnuAe9hGvaivbUGl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d729ce9d-6445-40aa-a8d7-08db84467429
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 08:43:53.6024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCWq5Sve1YN/Eyr3LvHgwPqRxaMdaFQ0NvPgOgRGZJqDaQX3VghPxnxJA5Opg80a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9232
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.23 um 10:21 schrieb Asahi Lina:
> A signaled scheduler fence can outlive its scheduler, since fences are
> independencly reference counted. Therefore, we can't reference the
> scheduler in the get_timeline_name() implementation.
>
> Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
> dma-bufs reference fences from GPU schedulers that no longer exist.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>   drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>   include/drm/gpu_scheduler.h              | 5 +++++
>   3 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index b2bbc8a68b30..17f35b0b005a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -389,7 +389,12 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>   
>   		/*
>   		 * Fence is from the same scheduler, only need to wait for
> -		 * it to be scheduled
> +		 * it to be scheduled.
> +		 *
> +		 * Note: s_fence->sched could have been freed and reallocated
> +		 * as another scheduler. This false positive case is okay, as if
> +		 * the old scheduler was freed all of its jobs must have
> +		 * signaled their completion fences.

This is outright nonsense. As long as an entity for a scheduler exists 
it is not allowed to free up this scheduler.

So this function can't be called like this.

>   		 */
>   		fence = dma_fence_get(&s_fence->scheduled);
>   		dma_fence_put(entity->dependency);
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index ef120475e7c6..06a0eebcca10 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -68,7 +68,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>   static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>   {
>   	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> -	return (const char *)fence->sched->name;
> +	return (const char *)fence->sched_name;
>   }
>   
>   static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> @@ -216,6 +216,8 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>   	unsigned seq;
>   
>   	fence->sched = entity->rq->sched;
> +	strlcpy(fence->sched_name, entity->rq->sched->name,
> +		sizeof(fence->sched_name));
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>   		       &fence->lock, entity->fence_context, seq);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e95b4837e5a3..4fa9523bd47d 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -305,6 +305,11 @@ struct drm_sched_fence {
>            * @lock: the lock used by the scheduled and the finished fences.
>            */
>   	spinlock_t			lock;
> +        /**
> +         * @sched_name: the name of the scheduler that owns this fence. We
> +	 * keep a copy here since fences can outlive their scheduler.
> +         */
> +	char sched_name[16];

This just mitigates the problem, but doesn't fix it.

The real issue is that the hw fence is kept around much longer than that.

Additional to that I'm not willing to increase the scheduler fence size 
like that just to decouple them from the scheduler.

Regards,
Christian.

>           /**
>            * @owner: job owner for debugging
>            */
>

