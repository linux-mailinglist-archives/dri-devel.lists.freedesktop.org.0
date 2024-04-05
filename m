Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F320C899D3D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 14:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2661113BBD;
	Fri,  5 Apr 2024 12:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TJc9LeR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2108.outbound.protection.outlook.com [40.107.220.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28D2113BBD;
 Fri,  5 Apr 2024 12:41:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOn/9h2UPEKB55L6faDlCyYpW7DBmm3mBMzNdF5fbN8fDRT0gSf6V0rS/vO+p5rTD/lkzXO0YNROvXkA+0I6lC7bwpUjqX0eDQc/XWSx/Wm6Ab1MlGqFr16EId1CrTFNvO0M/Yn8DNFPaljN92/T2NBpzA0syZCA/2hy1POnxJKCFfX64vNn5oPulcXQdVaG5INxyWhrS2SZ7o69anxFRJjWdbBNceXsdT5yeI7nphQHMjKZJ3TSPhsgkNhwJHkwzS29/zbwkYB7uUceRSyq4uqp0foTPm3VwuiS0W38qa9jeKDZnMVNG1pEK2a6nMz112p/FDcZMc27GGRbm+X8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7vFA4wbxY7FKmEuF6JLY9UBLEB1dSghd596CE7dBzU=;
 b=T8ho/luooIeiugCoTOeVQeF59WeUWkI84Gp5GTVhZJdyQGvII/hoLkjY5vEQddXzmty+I0LlOPgCFr3Q/WQH+fIYF4du2IzCU2Hbf55EwH7D0bWqajWtPJVxlQkWChgEbIKC5KTKacDk7IGXthZZjjze2lRMSVQEwMykUVcCLDbMytH4IB7KHSsvi5pHVhyLzIoQr3gx4UH+G6BOUvWD1WLX6JLr8szGfuGfZBD6uiox+Vi4JJTrZRpFRpmQ630kMFcZJtKl4OjmyJ3ecSoWZjLiVoyOBwdc8WqCFua+Pr9nQy7/dMGRcutHabiUVZ4mIYAx6TXVncvEUXYH2o1RcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7vFA4wbxY7FKmEuF6JLY9UBLEB1dSghd596CE7dBzU=;
 b=TJc9LeR1ouylNqo+9pgTkR1GtHBE3QHHOsN65YW2w491+IHFvjxyPteapYlZrA0sQbqw8lb2EN8Ysg8r6L3bkA2O2vQs79pFWyJn3uOeAH4bsV9bztJd8Ieq59zwq/csWTb2oT9phOlzgg33jKEi0AY8phcjP+9Ieqq4hojldIw=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 12:41:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 12:41:46 +0000
Message-ID: <2bf874fb-131c-43b8-b18b-2a827b5c8d97@amd.com>
Date: Fri, 5 Apr 2024 14:41:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/ttm: Use LRU hitches
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
 <20240329145707.3087-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240329145707.3087-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0291.eurprd07.prod.outlook.com
 (2603:10a6:800:130::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9228:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcTTTjLLohbfckwoz/J2kJTqY8Xcw6jGzEeGamzwO+zQlyfUkxxm3HvdEeDqdzuAC+AUR1QrvTo/wHQ9i832qZ3fvVIt8dlBJwjpxC7SxxbP9KO7DrtaWuoVM13p0dm034Mez5jim+N+kP2g0yNw5Eidq3WjsNz1ksDSTF9sqESVTjHQVjLKCAWaOv4e1wzbGA21kyq6ZGRnA9g/yZPdX4n4CBePa8YPzu5xIvCYPvM2NyUS+WjWAKg4U3k1btXkn40uE1Q6i1zuGkprIM9ofdvR8wSCv9BIgkKBnNKE4yZ3HaNhWyWlG05i1EOel/SerdznWJa7gFCk/nC4yBQW8rIiZ/7o1qozdNrZmmqhshGHEGcWL7aqR/KnO8IzYYhHILmxgH/enHuknPG0q0OtleRzcv3ADsgkfYzoz8OU01dFfBcWzUY32TCEp0L3RmKeDE4lk9m8uXm7APv4vpyOOqrMQBwivQBeZ7jDwvmezqG80pBdJXl9SuncyLDTfY4V+/CqRTf78hsFKybgyIyTogafmUNvYQbi9TD5f2gshaeL7MtUOoAMQVtafJQmEmTqE1cFb9GXsOhiJdvn5d0qTILuHnfMYaXWdg+cVuncRq640VJvA9G/F+DRnmQW7trFpATsEprjC4WhOXKsuYA/PoCfKfdA5ip2CTL3WftI8io=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGQ5bW5DaFQ2YlUxYmh0MEdza3NkUUQydVZ4U1E1NEwxam53SVN0Z0t5ZWdo?=
 =?utf-8?B?OTBTTVdZSzBDd1Q5TU43WlYwMFRHTHc5c25hVTNjbll5aHQvR2VJRGpuWEpI?=
 =?utf-8?B?UEVDNi8zdjE5aWRBbTFQVGtMcW1WSXJZam5XdXV0UlBtNE1tS2NOeW05NUlL?=
 =?utf-8?B?RlFDcVlTUDQ5Qi9uNGVDckdQa0ZDQVA1TkgzQmNhUTZ2amdDZlNoYSswd012?=
 =?utf-8?B?RkdiakNCa1FERlNWc2dCeWV1YWxSTERsaUFhdW0vOVh2b240Skttc1UvZHBy?=
 =?utf-8?B?bEI1UkZja0dTTU92bFVSTE9CaGdJWDV4M3pVeFk1N20zNkcwd1hiUk1uUy9N?=
 =?utf-8?B?TDd1Z1dPd094T2tLVTFRTzRwRGRBSnNabmIzTkxBWGVycldqR1h1WXIvSXEr?=
 =?utf-8?B?bVNkS29hMi8yRXZqMzlnbS9uN0xEbkJPUGtTZm1KNmh1TlhUQmJwL3dtZ1FD?=
 =?utf-8?B?dzNKc1MvV1lxbnQ4cFhvQ3JKR0JNenNoeXVzVkozRUZQSnVoTWxxYlQwUWk1?=
 =?utf-8?B?L1JrU2RZUmxkSG5xTFFuL3ZCK0o5eG9lSVF6NmJuVVp6WVFXditETFJ6ODZE?=
 =?utf-8?B?c1JpZ3pkM0h5WVVVU1I2UDB1b3F5ZmUwcWhWRXgwSUhyTkc0b2sxYkVkL0tZ?=
 =?utf-8?B?b09vNDlyd2FKaVd1blpkMyt2dUs2SHQ3YlNrUWNhTTAxSzBzblMzQStXVXRT?=
 =?utf-8?B?QzBJTnNydnpQNjZObzlpdG5yRkNxSHdDclpacEg5eUN1SWFMN3dDN3ZiZktF?=
 =?utf-8?B?TWVua2xQV29FVWg0RWFJRmtYQ1lDV0p5Wm80NlljYXluOHR2RFBPMktoVXNz?=
 =?utf-8?B?Q0RyS0toRXdYT0ZSaU9SRStoTnIxdkp5MXMxSEdWd2VjSGUra1FBNWpmeG91?=
 =?utf-8?B?Tis1UzlScmRndEkwMjdzWWlqWkxxaUNUUWZGQllCZForRFQ4cGhBeWpSa3kw?=
 =?utf-8?B?aWVUbit2S0ZnSkxQemRhZEk0NnBCSktReHhQMXpFWUFQRGZlN1B2U3ZhajJx?=
 =?utf-8?B?U2pIT1NxUXVxMy90bmw3VFJuSVRjOFN6RWdpTUg2R1JROVQ2czFnQThZMnR1?=
 =?utf-8?B?M1FVSGx6M3VMcHU3UU90NnlxNVZ5YWJBbGtCUnRFcjhiMkNTL1VLVHpiTXVL?=
 =?utf-8?B?OGV2VFh3blpzQzV0MU5OTStraFpFd3R3QnNIR1ZBOSt5WEtNUS9zVS9lOTlX?=
 =?utf-8?B?WUJGUXIvUkpYbVk5clUvOHc5d3ZlSzdJdFcxTW16N3p3bHl4WUMxZTkvV2l4?=
 =?utf-8?B?MkpaaTRtaFVkRGxSeHBJem94czhVMStiVWdIVld6Q0dCMkFFTGQrZHJKNmFI?=
 =?utf-8?B?NTFKMWQ2Mmx0bWcwdnA5MWI0V2p3VG9Rd1UrNUdOMWNpQ29oMWx3aWJzeFpW?=
 =?utf-8?B?TFpQT2YwWC9aY1ZVbkpORjhrWUE2aGQvcy9PT1hIWTQ3UHhGTUVqTU9CblNW?=
 =?utf-8?B?ZzNPQnRDMFM4NVJXekhyL0VXcVVZTDlZcUl5eWJ6Q2hZQzJRZmNLMEJnV214?=
 =?utf-8?B?S1BYcFJseGhvVXFlNEtGOWMxMWY5M3pHWk9pWStIaG83VEgxWDZyNWNoeVFm?=
 =?utf-8?B?ZDlsUEd4TGFob29LOFhlYmVIR3dkTjRJQkdHQW85M1lhQlZOdk9BQXJKVDFs?=
 =?utf-8?B?Sk1STzZNdllibi9jNytsUDRlV0NiT2RCVGg0WmdZdE9NRHQxSG4vcXVEdmFL?=
 =?utf-8?B?YVpIRjZQUjJCNURhMHFGcEFnYkMwOStXZzJUMmx6cmZodVdxNytabGRSY0xS?=
 =?utf-8?B?amdZVW11R0EwREhlMXBPTG5ibFhoRWhLaWx6RTRpajVpK0VJT2QvZ29RU1Zi?=
 =?utf-8?B?VklFR2JkbHE1RDZ5bk1xL0VPaGFDMFpySENpbVZiZWt5YzgyWnBnRzlFS0pT?=
 =?utf-8?B?R0VhYjlZZHJ6b2RtTzdTZHlBYlJlMTFzSWlZOVRJa2hla1RRTlI3YUVwUXFJ?=
 =?utf-8?B?UlhJaVpQaVZjUEY1dFZIVURNby9RUEI3VU5EOW9CemZUL0dqaEtpcUo4bTBH?=
 =?utf-8?B?Wk5rZWcwWFlJbTlXRjBFZTBEbnVudVpnQXNQTUlYNzZZTldwWUh4L3U2NUx3?=
 =?utf-8?B?M3FBSXFBMDF2Vys3REpHR0kwajh6emRTS0ZWTFUxd0d6N0haVk1IaC9GWlFt?=
 =?utf-8?Q?fMaBPo3SIz5frFn2oe1KaJyA/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e8c187-8400-4be9-3215-08dc556dc11a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 12:41:46.3577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hLqit0YxV1pZ1sWNo/yyfTjCbqKyRTqLlwxS9s78wj/a0qNUPUgdJKgQmYbOkkv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228
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

Am 29.03.24 um 15:57 schrieb Thomas Hellström:
> Have iterators insert themselves into the list they are iterating
> over using hitch list nodes. Since only the iterator owner
> can remove these list nodes from the list, it's safe to unlock
> the list and when continuing, use them as a starting point. Due to
> the way LRU bumping works in TTM, newly added items will not be
> missed, and bumped items will be iterated over a second time before
> reaching the end of the list.
>
> The exception is list with bulk move sublists. When bumping a
> sublist, a hitch that is part of that sublist will also be moved
> and we might miss items if restarting from it. This will be
> addressed in a later patch.
>
> v2:
> - Updated ttm_resource_cursor_fini() documentation.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       |  1 +
>   drivers/gpu/drm/ttm/ttm_device.c   |  9 ++-
>   drivers/gpu/drm/ttm/ttm_resource.c | 94 ++++++++++++++++++++----------
>   include/drm/ttm/ttm_resource.h     | 16 +++--
>   4 files changed, 82 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e059b1e1b13b..b6f75a0ff2e5 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -622,6 +622,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   		if (locked)
>   			dma_resv_unlock(res->bo->base.resv);
>   	}
> +	ttm_resource_cursor_fini_locked(&cursor);
>   
>   	if (!bo) {
>   		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index f27406e851e5..e8a6a1dab669 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -169,12 +169,17 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   			num_pages = PFN_UP(bo->base.size);
>   			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>   			/* ttm_bo_swapout has dropped the lru_lock */
> -			if (!ret)
> +			if (!ret) {
> +				ttm_resource_cursor_fini(&cursor);
>   				return num_pages;
> -			if (ret != -EBUSY)
> +			}
> +			if (ret != -EBUSY) {
> +				ttm_resource_cursor_fini(&cursor);
>   				return ret;
> +			}
>   		}
>   	}
> +	ttm_resource_cursor_fini_locked(&cursor);
>   	spin_unlock(&bdev->lru_lock);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7aa5ca5c0e33..ccc31ad85e3b 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -32,6 +32,37 @@
>   
>   #include <drm/drm_util.h>
>   
> +/**
> + * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
> + * @cursor: The struct ttm_resource_cursor to finalize.
> + *
> + * The function pulls the LRU list cursor off any lists it was previusly
> + * attached to. Needs to be called with the LRU lock held. The function
> + * can be called multiple times after eachother.
> + */
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
> +{
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +	list_del_init(&cursor->hitch.link);
> +}
> +
> +/**
> + * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
> + * @cursor: The struct ttm_resource_cursor to finalize.
> + *
> + * The function pulls the LRU list cursor off any lists it was previusly
> + * attached to. Needs to be called without the LRU list lock held. The
> + * function can be called multiple times after eachother.
> + */
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
> +{
> +	spinlock_t *lru_lock = &cursor->man->bdev->lru_lock;
> +
> +	spin_lock(lru_lock);
> +	ttm_resource_cursor_fini_locked(cursor);
> +	spin_unlock(lru_lock);
> +}
> +
>   /**
>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>    * @bulk: the structure to init
> @@ -484,62 +515,63 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   EXPORT_SYMBOL(ttm_resource_manager_debug);
>   
>   /**
> - * ttm_resource_manager_first
> - *
> - * @man: resource manager to iterate over
> + * ttm_resource_manager_next() - Continue iterating over the resource manager
> + * resources
>    * @cursor: cursor to record the position
>    *
> - * Returns the first resource from the resource manager.
> + * Return: The next resource from the resource manager.
>    */
>   struct ttm_resource *
> -ttm_resource_manager_first(struct ttm_resource_manager *man,
> -			   struct ttm_resource_cursor *cursor)
> +ttm_resource_manager_next(struct ttm_resource_cursor *cursor)

Why are you switching first/next here? It took me a moment to realize 
that the two functions switched places.

>   {
> +	struct ttm_resource_manager *man = cursor->man;
>   	struct ttm_lru_item *lru;
>   
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
> -	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
> -	     ++cursor->priority)
> -		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> -			if (ttm_lru_item_is_res(lru))
> +	do {
> +		lru = &cursor->hitch;
> +		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru)) {
> +				list_move(&cursor->hitch.link, &lru->link);
>   				return ttm_lru_item_to_res(lru);
> +			}
>   		}
>   
> +		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
> +			break;
> +
> +		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
> +	} while (true);
> +
> +	list_del_init(&cursor->hitch.link);
> +
>   	return NULL;
>   }
>   
>   /**
> - * ttm_resource_manager_next
> - *
> + * ttm_resource_manager_first() - Start iterating over the resources
> + * of a resource manager
>    * @man: resource manager to iterate over
>    * @cursor: cursor to record the position
> - * @res: the current resource pointer
>    *
> - * Returns the next resource from the resource manager.
> + * Initializes the cursor and starts iterating. When done iterating,
> + * the caller must explicitly call ttm_resource_cursor_fini().
> + *
> + * Return: The first resource from the resource manager.
>    */
>   struct ttm_resource *
> -ttm_resource_manager_next(struct ttm_resource_manager *man,
> -			  struct ttm_resource_cursor *cursor,
> -			  struct ttm_resource *res)
> +ttm_resource_manager_first(struct ttm_resource_manager *man,
> +			   struct ttm_resource_cursor *cursor)
>   {
> -	struct ttm_lru_item *lru = &res->lru;
> -
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
> -	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> -		if (ttm_lru_item_is_res(lru))
> -			return ttm_lru_item_to_res(lru);
> -	}
> +	cursor->priority = 0;
> +	cursor->man = man;
> +	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);

That should probably be a list_add() instead.

Need to take a closer look what actually changed when the functions keep 
their original order.

Christian.

>   
> -	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
> -	     ++cursor->priority)
> -		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> -			if (ttm_lru_item_is_res(lru))
> -				ttm_lru_item_to_res(lru);
> -		}
> -
> -	return NULL;
> +	return ttm_resource_manager_next(cursor);
>   }
>   
>   static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 4babc4ff10b0..dfc01258c981 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -271,15 +271,23 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>   
>   /**
>    * struct ttm_resource_cursor
> - *
> + * @man: The resource manager currently being iterated over
> + * @hitch: A hitch list node inserted before the next resource
> + * to iterate over.
>    * @priority: the current priority
>    *
>    * Cursor to iterate over the resources in a manager.
>    */
>   struct ttm_resource_cursor {
> +	struct ttm_resource_manager *man;
> +	struct ttm_lru_item hitch;
>   	unsigned int priority;
>   };
>   
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> +
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> +
>   /**
>    * struct ttm_lru_bulk_move_pos
>    *
> @@ -438,9 +446,7 @@ struct ttm_resource *
>   ttm_resource_manager_first(struct ttm_resource_manager *man,
>   			   struct ttm_resource_cursor *cursor);
>   struct ttm_resource *
> -ttm_resource_manager_next(struct ttm_resource_manager *man,
> -			  struct ttm_resource_cursor *cursor,
> -			  struct ttm_resource *res);
> +ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
>   
>   /**
>    * ttm_resource_manager_for_each_res - iterate over all resources
> @@ -452,7 +458,7 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>    */
>   #define ttm_resource_manager_for_each_res(man, cursor, res)		\
>   	for (res = ttm_resource_manager_first(man, cursor); res;	\
> -	     res = ttm_resource_manager_next(man, cursor, res))
> +	     res = ttm_resource_manager_next(cursor))
>   
>   struct ttm_kmap_iter *
>   ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,

