Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34242ACAD47
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBAA10E504;
	Mon,  2 Jun 2025 11:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NWe7wYnc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521BE10E4FB;
 Mon,  2 Jun 2025 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8mEOnsA5vZwNT5wigACJ5I8hJ/y6uDtgZy0n+4yBrhQ=; b=NWe7wYnc1xeIgynOL+yn8C+Auh
 zPqSSeRiBUE6C9HjSB/INxD/1YH3QdN+Pouqxko5q4N6RH6ig6HrAMqnIIwnTpOv5Eo3dZKLl6rzV
 Aubc+lSijseofk20C8zwmGv9JgZ0a9EpT11+TQuy8aEgOw5JUIHfg4BNsLEXAhxj/Rqdj28NuyxM1
 jRv2Zs83+2yYRaININHHMya00P5cs2bZ/v1oikyjAmxYrsDBQvaP8BruDK6Nx7uie6yce12zSHQZf
 LX3ZBGjz9nXTlfsIJdkkINFnxP1FYfeohawbwCarW19P9vuuTjMvNU9ZbcUJyuMxb5MxEXHJ6qNLz
 SnTawFgA==;
Received: from [189.7.87.52] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uM3Sz-00GG7d-0S; Mon, 02 Jun 2025 13:36:33 +0200
Message-ID: <177ea4e7-b05d-4ee0-8b5e-e3dfd67491a0@igalia.com>
Date: Mon, 2 Jun 2025 08:36:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to
 skip the reset
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
 <20250530-sched-skip-reset-v2-6-c40a8d2d8daa@igalia.com>
 <964e59ba1539083ef29b06d3c78f5e2e9b138ab8.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <964e59ba1539083ef29b06d3c78f5e2e9b138ab8.camel@mailbox.org>
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

Hi Philipp,

On 02/06/25 04:28, Philipp Stanner wrote:
> On Fri, 2025-05-30 at 11:01 -0300, Maíra Canal wrote:

[...]

>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>> b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>> index
>> 7146069a98492f5fab2a49d96e2054f649e1fe3d..46f5391e84a12232b247886cf13
>> 11f8e09f42f04 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>> @@ -40,11 +40,11 @@ static enum drm_gpu_sched_stat
>> etnaviv_sched_timedout_job(struct drm_sched_job
>>   	int change;
>>   
>>   	/*
>> -	 * If the GPU managed to complete this jobs fence, the
>> timout is
>> -	 * spurious. Bail out.
>> +	 * If the GPU managed to complete this jobs fence, the
>> timeout has
>> +	 * fired before free-job worker. The timeout is spurious, so
>> bail out.
>>   	 */
>>   	if (dma_fence_is_signaled(submit->out_fence))
>> -		goto out_no_timeout;
>> +		return DRM_GPU_SCHED_STAT_NO_HANG;
>>   
>>   	/*
>>   	 * If the GPU is still making forward progress on the front-
>> end (which
>> @@ -70,7 +70,7 @@ static enum drm_gpu_sched_stat
>> etnaviv_sched_timedout_job(struct drm_sched_job
>>   		gpu->hangcheck_dma_addr = dma_addr;
>>   		gpu->hangcheck_primid = primid;
>>   		gpu->hangcheck_fence = gpu->completed_fence;
>> -		goto out_no_timeout;
>> +		return DRM_GPU_SCHED_STAT_NO_HANG;
>>   	}
>>   
>>   	/* block scheduler */
>> @@ -86,10 +86,7 @@ static enum drm_gpu_sched_stat
>> etnaviv_sched_timedout_job(struct drm_sched_job
>>   	drm_sched_resubmit_jobs(&gpu->sched);
>>   
>>   	drm_sched_start(&gpu->sched, 0);
>> -	return DRM_GPU_SCHED_STAT_RESET;
>>   
>> -out_no_timeout:
>> -	list_add(&sched_job->list, &sched_job->sched->pending_list);
> 
> Here you actually remove the manipulation of the scheduler internals,
> but you didn't in v3d. Just to point that out.
> 
> 
> And BTW I'm just seeing that the pending_list gets manipulated here
> with the scheduler's workqueues running and no locks being hold.
> 
> Oh man :(
> 
> That is most certainly a bug, and I recommend that the etnaviv
> maintainers at least add the appropriate lock here and backport that
> since it can race any time.
> 
> 
> But thx for working on that, Maíra. Good that we can remove the stuff
> this way.
> 
> Thinking about it, this patch even fixes a bug. So could contain a
> Fixes: tag. But I'm not sure if it's worth it to mark the entire series
> for Stable. Opinions?

I believe the best way to fix this bug would be doing something similar
to what I did to v3d: send a temporary fix adding the locks, which will
be backported to stable. I'll send a fix to Etnaviv today.

Thanks for the review, Phillip!

Best Regards,
- Maíra

> 
> 
> P.
> 
> 
>>   	return DRM_GPU_SCHED_STAT_RESET;
>>   }
>>   
>>
> 

