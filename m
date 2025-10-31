Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46894C25BF2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BBC10E2C8;
	Fri, 31 Oct 2025 15:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mPbtt4vX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5799F10E2C8;
 Fri, 31 Oct 2025 15:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PWbSpPkrax31h67yTKnaPpWsp4RN9SlSqvcDtf5Ecb8=; b=mPbtt4vXMmJOLXQK4p3MfifR69
 9Fsx79aDxJn5LHiBoGc05ZKnmDeNhHVqUrg/Ejje83YoiFqEveIxM9U5FuIvo9CGdKcze81AgUB2J
 jsKvIfTDHT18NDVyW3BGRgu409HxahKHHcFBULcaw75CqK8RsVxg23HkYUO5DsKx5CC/t2OJUGQL0
 ne/Y5S3YXHNfwX46hVHtbmI8lsIcWitd8wCJSBTl4YM+48QqKiwgZUDWpb5/aDL6jumCMyVuiq8vk
 0aS8QhD4Y7nG6wQmXxMcel0wfp6IGzI69fxcoTULxaNWnTGzDYuks6rS3rVqLk8xwl0Thf7iwNj60
 UCOCqEGg==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vEqhh-00HWK9-PL; Fri, 31 Oct 2025 16:06:13 +0100
Message-ID: <193c7d8d-a731-4eb0-aa92-87c46546b78a@igalia.com>
Date: Fri, 31 Oct 2025 15:06:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/27] drm/sched: Add fair scheduling policy
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20251024160800.79836-1-tvrtko.ursulin@igalia.com>
 <20251024160800.79836-10-tvrtko.ursulin@igalia.com>
 <41474e2b14f34e1cd8369f50266843a88b7a86ba.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <41474e2b14f34e1cd8369f50266843a88b7a86ba.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 27/10/2025 12:18, Philipp Stanner wrote:

8><

>> +static ktime_t drm_sched_entity_update_vruntime(struct drm_sched_entity *entity)
>> +{
>> +	/*
>> +	 * Core part of the CFS-like algorithm is that the virtual runtime of
>> +	 * lower priority tasks should grow quicker than the higher priority
>> +	 * ones, so that when we then schedule entities with the aim of keeping
>> +	 * their accumulated virtual time balanced, we can approach fair
>> +	 * distribution of GPU time.
>> +	 *
>> +	 * For converting the real GPU time into virtual we pick some
>> +	 * multipliers with the idea to achieve the following GPU time
>> +	 * distribution:
>> +	 *
>> +	 *  - Kernel priority gets roughly 2x GPU time compared to high.
>> +	 *  - High gets ~4x relative to normal.
>> +	 *  - Normal gets ~8x relative to low.
>> +	 */
> 
> I can make sense of 2 and 4, but how does 7 match to 8?

vvv

>> +	static const unsigned int shift[] = {
>> +		[DRM_SCHED_PRIORITY_KERNEL] = 1,
>> +		[DRM_SCHED_PRIORITY_HIGH]   = 2,
>> +		[DRM_SCHED_PRIORITY_NORMAL] = 4,
>> +		[DRM_SCHED_PRIORITY_LOW]    = 7,
>> +	};
>> +	struct drm_sched_entity_stats *stats = entity->stats;
>> +	ktime_t runtime, prev;
>> +
>> +	spin_lock(&stats->lock);
>> +	prev = stats->prev_runtime;
>> +	runtime = stats->runtime;
>> +	stats->prev_runtime = runtime;
>> +	runtime = ktime_add_ns(stats->vruntime,
>> +			       ktime_to_ns(ktime_sub(runtime, prev)) <<
>> +			       shift[entity->priority]);

I thought 2^7 / 2^4 = 8, but real math was very long time ago. Have I 
oversimplified by equating "for low time grows 8x as fast" to "normal 
gets 8x more gpu time"? Still seems about right when I think about it.

Regards,

Tvrtko

>> +	stats->vruntime = runtime;
>> +	spin_unlock(&stats->lock);
>> +
>> +	return runtime;
>> +}
