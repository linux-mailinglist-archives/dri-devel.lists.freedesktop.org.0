Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FBED1E67C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 12:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD2F10E0F8;
	Wed, 14 Jan 2026 11:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F4zEEfGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C138C10E0F8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 11:30:54 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-5014f383df6so1386541cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 03:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768390253; x=1768995053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cSdIXLKPTdi93G8U4R5SQcAFt9Fsb+Bvw+g/z/TUA64=;
 b=F4zEEfGj4Z4P6sk25dGMEMPa+0NJcN0eckEWxgHWJzgsKIjo00/R4kAGtAc3dRBjM6
 nB23Wy7aQltAcqBHNCza79yiBnwSpQGNJfLRMrx+WEjmsok7viq0c7158cDlw9qcBISB
 3UnjIaMpjFmNjbcwJdtXM/MRj375r64dJ5PqS0sKPwvST5d9Sn7XqSq+nOJjoTNUIbP6
 wFcOePKWtz3j4kj85JZf5Z3VBL4e2qgDlLim98gx/IVFM8VtQxIwhEeVuwCsh6kDUUHr
 qs+376plLjIP/qcZVOQ1pbpdvkR7+aNH8IYA63ww8IdUGXGO/k59YuMUidi0owG+vGsI
 eA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768390253; x=1768995053;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cSdIXLKPTdi93G8U4R5SQcAFt9Fsb+Bvw+g/z/TUA64=;
 b=Qvwb/6fb2YFe9/i9HvuYfaUo23rjuTy15msz+WPlDnPuLksOjikhEjXFBqdOyio5lG
 ay1YLAt+H4s7qzOeBJb9Tohb+W4S15Tt211R3zMEh+XNspf5cKN3BGDYJpa0mzCkHM2q
 mx8/arfrpgHHndn4MSUQtoh7/HZ6vtb9tHoEK1tQYdgL3nQndfnmxZZps/vlx/D2ucUp
 a6Mx2cFTUmt9HS7ivaGlxuN2bYWP6U1TC80LY+dw9+S2NQP69f2SOPLQmspMN3t7p1Kj
 Q6AJz/Op2F/OIXLtEPPwuMRAmGtZxVQ1L7R1soSpU2qwxICe2H1OOKm413IPYK8JRE9L
 C6fg==
X-Gm-Message-State: AOJu0YwAxa1HQK/2Lp0eXXIytbWF8Tn3nW7CP7GsaLY2WtKsK7ZUMJQm
 c75wlIeIud7Vo/6kidTselS1gQ7rPeKquP1lGm3EWsDeI3pQXh9F0lvd
X-Gm-Gg: AY/fxX4UU/P6KO0QcIv8kOkAk0GvOe9nrH0gte7Bz4Oo26sYBdIG5pY/DDerbyfODgP
 01m/87pzzbYwmXY2K5KhpgK3mRgx0HemJYqPXN5lE9Jh/sTeL2erIMyJ+3Eg6XDH8fXP7X9nDow
 O6QsHQlJS22njkMxd929sntKiCPNJw+5TX/8a3AG58NgLSLhLmaHwwgdX5DyhVzPurMdG9e61Ef
 1RXECecJ+NmkTOm9P18duHWOh0liGzmDI+nXbragN00ugxfz4EZoME2nCyO8glKFS86unS5XpZG
 7/eK/jak0lSLEm+YrC+AhuyHqWwyg7+ZVMrsTR+L228xMW1X8ZorIhBUy14tx/C/OayrrzrdV5U
 MBUIQnto4Ov4Um2pOv6RtYW2TdDGvhhjol+k5AlZs6hFJXoh8Z6usj89ECxdnf+yIEw5yVroC/5
 PtGZaJQ51W9Zo0MJ+NFOmn6I+io0mh/4S7di1EdXzi+4s=
X-Received: by 2002:a05:622a:144a:b0:4f3:5eb4:61d1 with SMTP id
 d75a77b69052e-50148474022mr26435121cf.54.1768390253383; 
 Wed, 14 Jan 2026 03:30:53 -0800 (PST)
Received: from [10.254.120.192] (mkmvpn.amd.com. [165.204.54.211])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50148eba456sm12429001cf.20.2026.01.14.03.30.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Jan 2026 03:30:53 -0800 (PST)
Message-ID: <b9c8ec64-ed96-4eaf-9e30-a98dfdd26b5a@gmail.com>
Date: Wed, 14 Jan 2026 12:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] drm/sched: use inline locks for the drm-sched-fence
 v2
To: phasta@kernel.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260113152125.47380-1-christian.koenig@amd.com>
 <20260113152125.47380-11-christian.koenig@amd.com>
 <c8c362d73d4f2cff9be685184186a6f3368939f1.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <c8c362d73d4f2cff9be685184186a6f3368939f1.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
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

On 1/13/26 17:12, Philipp Stanner wrote:
> On Tue, 2026-01-13 at 16:16 +0100, Christian König wrote:
>> Using the inline lock is now the recommended way for dma_fence implementations.
>>
>> For the scheduler fence use the inline lock for the scheduled fence part
>> and then the lock from the scheduled fence as external lock for the finished fence.
>>
>> This way there is no functional difference, except for saving the space
>> for the separate lock.
>>
>> v2: re-work the patch to avoid any functional difference
> 
> *cough cough*
> 
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/scheduler/sched_fence.c | 6 +++---
>>  include/drm/gpu_scheduler.h             | 4 ----
>>  2 files changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>> index 724d77694246..112677231f9a 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>  
>>  	fence->owner = owner;
>>  	fence->drm_client_id = drm_client_id;
>> -	spin_lock_init(&fence->lock);
>>  
>>  	return fence;
>>  }
>> @@ -230,9 +229,10 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>  	fence->sched = entity->rq->sched;
>>  	seq = atomic_inc_return(&entity->fence_seq);
>>  	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>> -		       &fence->lock, entity->fence_context, seq);
>> +		       NULL, entity->fence_context, seq);
>>  	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>> -		       &fence->lock, entity->fence_context + 1, seq);
>> +		       dma_fence_spinlock(&fence->scheduled),
> 
> I think while you are correct that this is no functional difference, it
> is still a bad idea which violates the entire idea of your series:
> 
> All fences are now independent from each other and the fence context –
> except for those two.
> 
> Some fences are more equal than others ;)

Yeah, I was going back and forth once more if I should keep this patch at all or just drop it.

> By implementing this, you would also show to people browsing the code
> that it can be a good idea or can be done to have fences share locks.
> Do you want that?

Good question. For almost all cases we don't want this, but once more the scheduler is special.

In the scheduler we have two fences in one, the scheduled one and the finished one.

So here it technically makes sense to have this construct to be defensive.

But on the other hand it has no practical value because it still doesn't allow us to unload the scheduler module. We would need a much wider rework for being able to do that.

So maybe I should just really drop this patch or at least keep it back until we had time to figure out what the next steps are.

> As far as I have learned from you and our discussions, that would be a
> very bombastic violation of the sacred "dma-fence-rules".

Well using the inline fence is "only" a strong recommendation. It's not as heavy as the signaling rules because when you mess up those you can easily kill the whole system.

> I believe it's definitely worth sacrificing some bytes so that those
> two fences get fully decoupled. Who will have it on their radar that
> they are special? Think about future reworks.

This doesn't even save any bytes, my thinking was more that this is the more defensive approach should anybody use the spinlock pointer from the scheduler fence to do some locking.

> Besides that, no objections from my side.

Thanks,
Christian.

> 
> 
> P.
> 
>> +		       entity->fence_context + 1, seq);
>>  }
>>  
>>  module_init(drm_sched_fence_slab_init);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 78e07c2507c7..ad3704685163 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>>           * belongs to.
>>           */
>>  	struct drm_gpu_scheduler	*sched;
>> -        /**
>> -         * @lock: the lock used by the scheduled and the finished fences.
>> -         */
>> -	spinlock_t			lock;
>>          /**
>>           * @owner: job owner for debugging
>>           */
> 

