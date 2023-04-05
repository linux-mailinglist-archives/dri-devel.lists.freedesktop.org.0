Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268146D85B0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 20:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111F710E25B;
	Wed,  5 Apr 2023 18:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E96910E25B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 18:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/M2AQMz2e483f/a1PhJtTz+TJy7KH22br3xZJ1vBJ53GFN+OIEuYoQ3BTbJ+hzBy2K632w3lS/9/8ikMNJy1CCpr3AA/HPRB3aVUoz1Y57pq5jQfsF1BE5W3i0kolo50XKf5cYMIBWkm/Bu0gpEEPFJzsx2cFbtZkqVLDqfSO08ju3sHnkP5wzc2Go8enbyA9qDMcAnphpW15hJ/8p/jBZtF4Jv28hWqZBmSiIDIs6Tb/XCII4SP9R2kqt/Og+V4eu2ynuSrGDXCtUANufmtsSfRzvAbSQMz/m34orPaIQFA/fTf+KF8CfB437UfBLW7pgFU1He2vczNFm73HvHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibJqSDTJZCmxvmzaOjOl96sffaTI+Zr5lYH6My4Ag3g=;
 b=N5EMeuGI/nG4F+Edoml/v+IVSbh1XK57nVdSFddFS1hNmtiNofGRw5gHRPfpVTskuys+sVvIk+nvTJfq9CK3kDkiUVTv2uTkIfExWRj5rKpzxq2V5zE9jchJ0V4u7kUryGmnyWszGWaKfto2CesAXbWZ1k0lhop/68+F+p9smMtHG5whSPJsW9GxjWWUELTOCRznI8ZCTROTlGD+1AgLNW+DsMMI8jbU0ZbnMzl25j4rHWSDQrwetvygRPj2O+o/OcxmudweDbN4HN4Af7gdawE7m/G8JKCkeiwL75DZWzDKo2C5GGI/Gpr/8B2UkgliPvJNT2xQQKGJMCwZtubcHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibJqSDTJZCmxvmzaOjOl96sffaTI+Zr5lYH6My4Ag3g=;
 b=yLC6KSKY99m/JM+zwob57IcpWmu1DZz/BC17D9sksT38nXlwpphtv7nNYw5kqlJerFoJ819OHKMGqvYPeoWdeHAWppY+SOfcLPQr3lO7RJ5CAETTsN0TMYcH6k+1Rvi2iQsHqW6/bINoYr5Wv89mV4DCesMr4Xolex1js5/P4lI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW4PR12MB6973.namprd12.prod.outlook.com (2603:10b6:303:20a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 18:09:48 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 18:09:48 +0000
Message-ID: <9c0cac54-fbf5-902e-20f2-f1d58c027f38@amd.com>
Date: Wed, 5 Apr 2023 14:09:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: Asahi Lina <lina@asahilina.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230406-scheduler-uaf-1-v1-1-8e5662269d25@asahilina.net>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
In-Reply-To: <20230406-scheduler-uaf-1-v1-1-8e5662269d25@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0180.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::26) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW4PR12MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: c2bce625-abd3-4eee-d0bd-08db3600f148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBLWtzMn4C0P77rCD+/NF3doSnfLutEC99y9kmuKYjWBoTNR/ME7K0R0GfAPX1E2L96CS8ByZYl7OMwcjxvck1dXLTnBcf3VXocDTh0mUTDlmBMe6dzvEhTd3l0wvwVxLuXpZ4B2/HgiE4LyI2k3UNXglF/UOaZzRFFA7sfoSEESYkCql+fHIMIOaWiiPTeoZGh4u1psV28zs5ZBVDzOJlKHAjJ02p7hymwhJeMYY7qdMsdO5icXl80Qd26noattP9RM6oKP5eAk58ygUYgnPgrhws0sNpxf9bhc43/RWIL6k7P7IgbwoFVFOjTVocMG1FfWgDCcH8mnCrhXsj5ae6wTghv41nx4iIwohovilN9dviGKdo2+4GLv6Fc47mYxMkx2KTAEfjcxCzxSIioIev8Mi1+rT4f0BRP1c6siJXx1FiypogsWgBGAgfngSNzA8MA7u9LBEgLnOD3ORaSIdxewmO6549wsQCA7QaM5G+fZOyNr0Ae/MH8YQllB4ejU2Rap9GvwaZFobFVfoIGIV4Xh5mx+hIMyPBJ9CIQhVXEsBTy6py95xiZ1iYq+LZOvnEiWpKy5YwDV0tEdmCnddXqM/ma3WG5Mnj7q5gfCtiXMOzU5BoLmpHSa/C9d7IMyeHdKl2T3k0bdZVJFKJT1qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199021)(6666004)(83380400001)(2616005)(6486002)(6512007)(478600001)(316002)(6636002)(26005)(110136005)(53546011)(186003)(6506007)(2906002)(44832011)(5660300002)(36756003)(38100700002)(4326008)(41300700001)(66476007)(66556008)(31696002)(8936002)(86362001)(8676002)(66946007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGQzalJoUW1SZmZEZ0VaNkVDVVN0TUtCWHdZWWhnNTB0L0J5MmwvQjYxd0tL?=
 =?utf-8?B?NThPa3ZqeVgrMEZremFrcXpwVjJjRTRJRHUyMWZCdmo4VTQ0WCtuRUNoZkFF?=
 =?utf-8?B?aFVTVDBoajhiL1N5Qzhld1BUbURhS0FOQW9YS1NjMFhTUUNSODhKVUJEeXhZ?=
 =?utf-8?B?bDJGMEZZTVc4TmxES3Jiek9ZNDd0MnFVQ0RKM0hGOWtLOWczUVVZKzFpdHBM?=
 =?utf-8?B?TmkvU2xUTmcvTHF2allPUnJOWmZQS0hDZXFiMnJQVFZBVGJ0Y1RIMFBaRE9O?=
 =?utf-8?B?QnlpNzdtNnBxenQ2RjBtcmZMeGpTc0pDRWFWREdsM2Z4SERHRTdldkpKaE5M?=
 =?utf-8?B?VVNKWExFWWJKSWhVaXJZaSs5OEFqeGJBejFTaDNMNXRzR0hlc2I1ZTdIdFR6?=
 =?utf-8?B?NURzdEVIQ2V2QmplbjF6VXM4UmR0cEI3bUNWaiszaTJvenNxaDhZWVQ0c3dy?=
 =?utf-8?B?cVdLRTZaekZnVVdDQStnVnlTbGJ0YWN6YlFTY2JWbUxSYWxaOGZrT1RkOGlB?=
 =?utf-8?B?cWdVbSt1QTVBME02TGxtVzVSaVZhd3FvdnNGeGZsTHhwbWxyd21XUTlxYXFq?=
 =?utf-8?B?Y2kxT0VrSWxWVmhkQ0xRREpRTkIxRXV3U1VYRUR4RmJ6VURzc1dWbEM1cjkx?=
 =?utf-8?B?emxzN0xua3JWclNzdTkxT0hIcFhuc3dSaS9QWG5uK0k0WkZDR2YwMGN4MnlN?=
 =?utf-8?B?VGk5N29NQlRHV1Y5Ni9PWElHNm5xaEszRlBmK2ZsMDlYZy9nYmtzVEFiTkVO?=
 =?utf-8?B?cW5sNWlZYXh5M2xDYTVkQmt3NHFUdTN5WGdpQXA0VkNqNXg2VVk2NTcrWkVU?=
 =?utf-8?B?WW42bWQ1MllRVUhib0NNSW5LRUFmMlFrUjEzTmVZYUJiSjFaWE16RCtHS2FI?=
 =?utf-8?B?SmwzYzRMNDhpMEUyV1J3VktoNm5XUTh5OVFBQk9ndWEzNW5XbnJKMHhmZFM0?=
 =?utf-8?B?eEo4aGxXc3ZmZHpJUTBZVmxqOU45SG80OUhNQWpwL2F2UEpmN0FuUWVlenB1?=
 =?utf-8?B?N2dhNWM3bVFkZGtsV3dMeXcvVG03eDZtWEthU0lhSzRjNFVMbHB4SFg4c01t?=
 =?utf-8?B?MUZRaXYwamVMTDJkL1NhdERMMFVCd09SVzhrZHVsWFpianZXSHRPM2JqbXMw?=
 =?utf-8?B?MnYrelVDMUpFN2NFamRvMStxSDRnNFJBOERoaFVSdGxwc1RDb2hnR282SmQ2?=
 =?utf-8?B?SEErYkl5TlYyajcvajhnVExCdmVUMFVJU2dRUFBqeW53b0wwbm1udVo4RWhR?=
 =?utf-8?B?OVcwNHNVdHNzMzZsdkJCMkZZSTE0R0g0NkVtOGhNWHRNYzNOUm10VStVUXZj?=
 =?utf-8?B?bGxxYW9tZm5leURGeW9MZzRuNjFxRXJoMGlBUVAwbllnWC9tSDVtYnBuR20w?=
 =?utf-8?B?eDcrQ1A2NnVNcWJwWU5VVWwxS1hGekJlNmZ4ZGUwYWM4bVM5dkNNNU1XYWo5?=
 =?utf-8?B?dlVPYlhuYWVPOTIybTRHaXpNaWowOFUreUxWbFE3dG1UOHlDcitIU0ZDRG4v?=
 =?utf-8?B?bFNicTV5NDFUR1NaMDF5aE55VmVrWFZwbkt0UGRLNEFPNHhVRGZQcWxEOFdW?=
 =?utf-8?B?T3JIZkxUeDNMQmR1RlJIRU0ydjFoT1g5blcraXJpNm9XRDhGTTI3NlVsSmlI?=
 =?utf-8?B?cXZrWkRaclJNYnhnckFIeVVqcFp5SWVSYVlnQnFjRzN3THZGdFBwaWVyTDN2?=
 =?utf-8?B?RHdONDRHM1BkSVV2ZzNQeDZqZEltSG9TYzFKV2xVNGYyaFpHK0JGd0k0SHcr?=
 =?utf-8?B?WGtsRDNhT0lHNU9pU3lkWlNxUUZiMUZPRDgxczZYNHNic1NRd21JaXR6NkFu?=
 =?utf-8?B?dDY3TlVKUjR0SzVES3FaazhUZFVRRmNGNmRXZVMzSVVFS0Vjd0JWQnNUYys1?=
 =?utf-8?B?Tzhvc0xpN0dkYlUzTVgvU2M0UUg5T3ZMZkEydmZVOEFKRitzOUVpelQ1RDdR?=
 =?utf-8?B?c1RTb0JSek45c3V0VHhwNi9sVU9VMGNwL1BxejBPeXdpdUxUMGlCUTJhUUow?=
 =?utf-8?B?YlZHeE1ZZERGanZUc3RlbEY2ZTB5RWJkREx2SHNVU2pJbWg2a014a0Fsd2g1?=
 =?utf-8?B?a0wvVE1EbXhTRlB6aHl1YW51Z3A1NFF0VG91OHJZVzRUMGRvRjJrSkV2SC9z?=
 =?utf-8?Q?Zjv/hPVBjmiVId+9F4AeBeocV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bce625-abd3-4eee-d0bd-08db3600f148
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:09:48.0285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6iyZgatnRJHETtBTxT1ounI6WM7lPk0KeZGe0mbLqEl0253zioCRe/AYHJAYJ3v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973
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
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-05 12:34, Asahi Lina wrote:
> A signaled scheduler fence can outlive its scheduler, since fences are
> independently reference counted. Therefore, we can't reference the
> scheduler in the get_timeline_name() implementation.
> 
> Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
> dma-bufs reference fences from GPU schedulers that no longer exist.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Thanks for fixing this. If there's no objections, I'll add my tag
and I'll push this tomorrow. I think this should go in through
drm-misc-fixes and drm-misc-next.

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

>  drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>  drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>  include/drm/gpu_scheduler.h              | 5 +++++
>  3 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 15d04a0ec623..8b3b949b2ce8 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -368,7 +368,12 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>  
>  		/*
>  		 * Fence is from the same scheduler, only need to wait for
> -		 * it to be scheduled
> +		 * it to be scheduled.
> +		 *
> +		 * Note: s_fence->sched could have been freed and reallocated
> +		 * as another scheduler. This false positive case is okay, as if
> +		 * the old scheduler was freed all of its jobs must have
> +		 * signaled their completion fences.
>  		 */
>  		fence = dma_fence_get(&s_fence->scheduled);
>  		dma_fence_put(entity->dependency);
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 7fd869520ef2..33b145dfa38c 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -66,7 +66,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>  static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>  {
>  	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> -	return (const char *)fence->sched->name;
> +	return (const char *)fence->sched_name;
>  }
>  
>  static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> @@ -168,6 +168,8 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>  	unsigned seq;
>  
>  	fence->sched = entity->rq->sched;
> +	strlcpy(fence->sched_name, entity->rq->sched->name,
> +		sizeof(fence->sched_name));
>  	seq = atomic_inc_return(&entity->fence_seq);
>  	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>  		       &fence->lock, entity->fence_context, seq);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9db9e5e504ee..49f019731891 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -295,6 +295,11 @@ struct drm_sched_fence {
>           * @lock: the lock used by the scheduled and the finished fences.
>           */
>  	spinlock_t			lock;
> +        /**
> +         * @sched_name: the name of the scheduler that owns this fence. We
> +         * keep a copy here since fences can outlive their scheduler.
> +         */
> +	char sched_name[16];
>          /**
>           * @owner: job owner for debugging
>           */
> 
> ---
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> change-id: 20230406-scheduler-uaf-1-994ec34cac93
> 
> Thank you,
> ~~ Lina
> 

