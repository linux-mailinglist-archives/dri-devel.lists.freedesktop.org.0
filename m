Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDBE435F5C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221E26EC34;
	Thu, 21 Oct 2021 10:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B451F6EC31;
 Thu, 21 Oct 2021 10:39:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm1GiL2wY1pG+tR+Ao0OvCc1eHClTn5aoRvUhGvBa7APqBUhYTii3q3ZsuzrlklgAy2cakRLRwtfkUrZG3meA924IBNovi8/364zWZTs2crCz5fYye6qapvZx/XQ5mCB3285wpE1Fpsm0B+10Ftt8YyJKRMn0X9woYh1IQqFOUFrU+j8T7/hOUNr1Gl+X0Pf1oRhCLZkKinaLjF00mcguae1ImEc3U557Jbe5LhZkRDGq+Mhm/6nRC0lYX9dZJKs7TJouMzsZ0aHD7FCNhhPW3XrwnLcoM2RXklyYuYUTdu4JXqdpmbc5hQQFN8pnr2AQhE8i1+nMcnw92fD97z5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTy7q5XRkQI9vuNTtB6yLKrTnuBzXrsSt8t9DiQ9qPM=;
 b=Mb8nBd7Xwk6/Pd67RoO3PBJxZpsS7zw0r2rJjE5xkadWi5C63uxHFpbTT9J7+q9UbhqGsYaigUDYoB9dIKeQRnW5L45pE3E22gBGrntYvf02xu6KljBRZFrvC0H0SoAHKBDvFL2R95v4kYiHvfeOyswuHq9iFna1/cGuy5r6zZEdACdjXFI8pL2JYJiYgZ+4x8oA7rpsEw6lS/QAi0m322+uXo1/fEvqyMn/C048caNEwg5kasgF1Ht2fgqBIDG14sXMw1xl7X/BqTVZ7tvu+kQrIv1CsItmf63dGLrKWR3uJ8fo6v4WeULYwybHairhgrg4u0My5B91zJKijClz7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTy7q5XRkQI9vuNTtB6yLKrTnuBzXrsSt8t9DiQ9qPM=;
 b=bxFMCztx+MArDClBaKeyXIYUtJvi8N54iNDA2TDV9AmSl0wxgonBeLZaJQP8ykuDaxsKJGf3tV9vYa9KGNm7awd3glaHzToFqeuwqoy7TS01urIB7zDBfHZdWTT3v295O4pbthTB5wxvE9VxYsTc3ehciW6FBEI7PGTFd+vsiPs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2428.namprd12.prod.outlook.com
 (2603:10b6:907:6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Thu, 21 Oct
 2021 10:39:06 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.019; Thu, 21 Oct
 2021 10:39:05 +0000
Subject: Re: [PATCH 02/28] drm/i915: use new iterator in
 i915_gem_object_wait_reservation
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-2-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <022f8ecb-37c0-3d67-563f-012f0a3651df@amd.com>
Date: Thu, 21 Oct 2021 12:38:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211021103605.735002-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR0502CA0055.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::32) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:46a4:dec3:9292:691a]
 (2a02:908:1252:fb60:46a4:dec3:9292:691a) by
 AM6PR0502CA0055.eurprd05.prod.outlook.com (2603:10a6:20b:56::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 10:39:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0dcb5cd-e32a-4ee1-d714-08d9947f0157
X-MS-TrafficTypeDiagnostic: MW2PR12MB2428:
X-Microsoft-Antispam-PRVS: <MW2PR12MB24286A60CEA490D96C6F996583BF9@MW2PR12MB2428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AblcQa6ABwxZIlKe+dsMmzkPL3cdNf8T3V29FGgLq5ozKMSJmkUXgstNcHXOVTwi0VajYHiO1qTEjT+HgmsXj98UUESSR+Y0+xJyaWTYHemrdSQ/OWEQ5y4+m71TglbVYJCXYJC2yvWkEqQ9Om6/umaTVci+BT8eOMGgcf4Zu9oAqefW/BshuQMSPkB8l4duwX93HflS6w0necs1jhxX2rz5QqQ/hnmFNp//e5jERtz+3AZEj84Li8dqQQ9J01m1eDXmqFEVv/O05bIyLoKwavN4uqz94OxBTvh9O0C+Bfi0fUK03QS4QpWvOJdTMUoKE5QlIxfy3p44WjUHl197tSC2QfUG2z1Dhb7BmprZ8umNSBNV3qTziOHnSWvfiZ5Se35Uc+0QBE7xH2QuyOYkHC9qzg2cBAZFAKUuqq2+kO3jRtJtxHhmCnr8YxT5Dn36g6SeXljjJYdTtX2vyuqyuvVjkUz9HfvbaN/xZxOivgj51AcF0nh6ig3/rvmVIirQp4zL1XOMa8S7u5AblGsxIgZnHAayIqaGV+PdyfmiFhClXJiNYvTsCNspuM6ddTtre4DI2RcFKWapbl+kNWGUp39JR5teqHuKMoITsVHC0eh1lDvFDwyAKJv+aa0XgG4KgkPVXH1eABLuOBkUB0+FKdv6Z6qPUpWyV0ZN+fIz++6nBLAGPJVreZOwZ6N4ShM2is1c3FhpoDrncY6hZ+MNHDOMEpWwHWstdqzp32O2Wpfpfs4uZJallssM7FIYADeN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(186003)(66946007)(66556008)(31696002)(38100700002)(8936002)(316002)(86362001)(2616005)(66476007)(508600001)(6666004)(5660300002)(4326008)(6486002)(2906002)(8676002)(66574015)(83380400001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEtsK0RHU0pKL3FMOUFvdXFEdVlkMWJKZ1VqNEdIb3E4a1h3YUovM09sMzB4?=
 =?utf-8?B?b0wxVTVzdG56SHJzTmxhV3g0Q1dPR0VidVJiOFFadXVrWkRjakl1RnE2Z0Vj?=
 =?utf-8?B?VFFWd1ZlS0lybDMvQ0JSbHhnVzVxOXovd3d6SkhQaUQ4ZGk5aGx1V1hQQ0Zs?=
 =?utf-8?B?MVBWaUFmQ2wwMUlGL1NWTklRcjJaUnpNcDk5dXRvZ0loekhkcTJ2bFl6WTZw?=
 =?utf-8?B?UFpteEFoOE03RDU4ME1tbjJFay9ybzJRaFdrSUJSYVlBcThtcERxYUlraVZX?=
 =?utf-8?B?V2RIZ2lPK0djYWVQNEFjREZVL1MvUlFrclExa2xVOXdXOWRpYy9xTGIrTTFQ?=
 =?utf-8?B?bEdmaDl6cC9yUHFOVWxRbHVjSExuWDduRWRGWlIzS3p0Q2dTR0IxbVI4Nm01?=
 =?utf-8?B?b29mMUdTUnRZYlhqSTN5RHhvWGNaZEJMSGxha0tIZlVVUjJkaDlxV0FIR1VO?=
 =?utf-8?B?emJHNHhEZjJaUFcxZUxHN2tENmZvbHZpUTYwbUZMc2pyWm1nM3o1N05pOURS?=
 =?utf-8?B?bmdwUFJGU2pYNzRlOHh5VmU2TEtRQVJDcFV0SkxlaDd2MExEQWZ2VDdqNXJp?=
 =?utf-8?B?MEVBN29OTXpzZW5Yd2JZZmliWjBzUDdPbUtLL2JncU9ORi93eTJGUm9UZmpq?=
 =?utf-8?B?cWkydE8zeXA1RXJneDN3RDV0alZBNit6MlIyZERic3dpYklwTW1EV2orWCtm?=
 =?utf-8?B?bjAvVVFScWVBdVhQd3lrZFhrclFIbUlCaWduUHd3KzA3VWtlT1JXVmwwMkNU?=
 =?utf-8?B?NDZNNmtaQW85WktKTzlKVFJrOURyenVpNHJVR1puc1lWcE5ha3E0RXBEWUk3?=
 =?utf-8?B?b01xTnhSN282NmVPd01IVDhjeUhadk4ycDdUNE9pUEZaNFZodFBZN3JiNWd2?=
 =?utf-8?B?emNJL3BCUFB2TWNkWUJxTzlUUDErMlRFc1dzaWJzYUhGTlZiZWVOY3FNVDB2?=
 =?utf-8?B?TW5janhSODFqWnRQRCs3VUVzQ2psZ21Ra2JJdkNjY3JjRkdTK294REFvU25J?=
 =?utf-8?B?ZjUvbmxJTkhKeGRtcitkSDM4SFpRKy94UlFWSXh2WjBSNHJnd1ZlQm9hSUJ3?=
 =?utf-8?B?TFltelZMNFo0c3BNMFYvbWkxSWxWcDk4M2haUXdUeVhOcUxxMDA5S0ZiSFhG?=
 =?utf-8?B?aXU0NTIwUkhzUHFqUFFiUk5PNzNnS0NiR0FRT2picFM3Y2FsdDRyblVETHE3?=
 =?utf-8?B?MzZBcmwxdzg0bHpJaG1NQjN6ZVFiZWZwbnlnSXRtZUF5RnpndHFHaE8vWWVX?=
 =?utf-8?B?b2U5OTlzZDZQdkdweVN0UjdNc08ySUVraHY5UHREOE1iNTFrKzRuMUJuUWc1?=
 =?utf-8?B?OTQwWTZERGg0cEtaR3ZzdWs1eC9JblBJNGEreHRxVXN1NUJXVFd0NkhEczlM?=
 =?utf-8?B?RGFkd2xJYzdQS3BjMm10azF3K3R4Nmo0OXVzT2szR3dZeExyWGwveWk5T0Fo?=
 =?utf-8?B?WG9xeThMMXZNanJiQ0N4TFgrOVlqM1RKWEQyQWExdm1MOVZEdUgrTDdseUdj?=
 =?utf-8?B?MnY2Y0x2L0EySWlodjFKc2ZDUWptK002bmljYmdWWWJCNTYyenRmTVlhcTFi?=
 =?utf-8?B?MUlwQ1Q2anBtVDRQL0F5ekNOMmcvbVRJSVFEVENoTi9BRG54RzBLa3dKcVNx?=
 =?utf-8?B?Q0JhMHI3L0hidnJzaVZsaEd3UE9TRW5HcWxxSGtSUUFOOG1uT2gwMVVXK0Fa?=
 =?utf-8?B?azdhTkcySmoyWEFlTkJ1K1JXMW1CeUduMWQwa1JsWkxDRVhJYkpPTGhHVFAw?=
 =?utf-8?B?djZwZ1ppUTY2UWJOd1R2RGxhdzY5YjJ5Z2dLeXczSlZxZnZuenFidGRLZjVw?=
 =?utf-8?B?MSt2M29zaFRvd1JTY1dTZmNWYlp5Z01nUlJVVmNvWmNBamN5UTVpT2x2MkpG?=
 =?utf-8?Q?lEXo/d/uhIzWz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0dcb5cd-e32a-4ee1-d714-08d9947f0157
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 10:39:05.7565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2428
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

Am 21.10.21 um 12:35 schrieb Maarten Lankhorst:
> From: Christian König <christian.koenig@amd.com>
>
> Simplifying the code a bit.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> [mlankhorst: Handle timeout = 0 correctly, use new i915_request_wait_timeout.]
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

LGTM, do you want to push it or should I pick it up into drm-misc-next?

Christian.

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 65 ++++++++----------------
>   1 file changed, 20 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index f909aaa09d9c..840c13706999 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -25,7 +25,7 @@ i915_gem_object_wait_fence(struct dma_fence *fence,
>   		return timeout;
>   
>   	if (dma_fence_is_i915(fence))
> -		return i915_request_wait(to_request(fence), flags, timeout);
> +		return i915_request_wait_timeout(to_request(fence), flags, timeout);
>   
>   	return dma_fence_wait_timeout(fence,
>   				      flags & I915_WAIT_INTERRUPTIBLE,
> @@ -37,58 +37,29 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>   				 unsigned int flags,
>   				 long timeout)
>   {
> -	struct dma_fence *excl;
> -	bool prune_fences = false;
> -
> -	if (flags & I915_WAIT_ALL) {
> -		struct dma_fence **shared;
> -		unsigned int count, i;
> -		int ret;
> -
> -		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
> -		if (ret)
> -			return ret;
> -
> -		for (i = 0; i < count; i++) {
> -			timeout = i915_gem_object_wait_fence(shared[i],
> -							     flags, timeout);
> -			if (timeout < 0)
> -				break;
> -
> -			dma_fence_put(shared[i]);
> -		}
> -
> -		for (; i < count; i++)
> -			dma_fence_put(shared[i]);
> -		kfree(shared);
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
> +	long ret = timeout ?: 1;
> +
> +	dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		ret = i915_gem_object_wait_fence(fence, flags, timeout);
> +		if (ret <= 0)
> +			break;
>   
> -		/*
> -		 * If both shared fences and an exclusive fence exist,
> -		 * then by construction the shared fences must be later
> -		 * than the exclusive fence. If we successfully wait for
> -		 * all the shared fences, we know that the exclusive fence
> -		 * must all be signaled. If all the shared fences are
> -		 * signaled, we can prune the array and recover the
> -		 * floating references on the fences/requests.
> -		 */
> -		prune_fences = count && timeout >= 0;
> -	} else {
> -		excl = dma_resv_get_excl_unlocked(resv);
> +		if (timeout)
> +			timeout = ret;
>   	}
> -
> -	if (excl && timeout >= 0)
> -		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
> -
> -	dma_fence_put(excl);
> +	dma_resv_iter_end(&cursor);
>   
>   	/*
>   	 * Opportunistically prune the fences iff we know they have *all* been
>   	 * signaled.
>   	 */
> -	if (prune_fences)
> +	if (timeout > 0)
>   		dma_resv_prune(resv);
>   
> -	return timeout;
> +	return ret;
>   }
>   
>   static void fence_set_priority(struct dma_fence *fence,
> @@ -196,7 +167,11 @@ i915_gem_object_wait(struct drm_i915_gem_object *obj,
>   
>   	timeout = i915_gem_object_wait_reservation(obj->base.resv,
>   						   flags, timeout);
> -	return timeout < 0 ? timeout : 0;
> +
> +	if (timeout < 0)
> +		return timeout;
> +
> +	return !timeout ? -ETIME : 0;
>   }
>   
>   static inline unsigned long nsecs_to_jiffies_timeout(const u64 n)

