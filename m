Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A9AB9B2E
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 13:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8839310EA78;
	Fri, 16 May 2025 11:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WezWspeU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CA310EA72;
 Fri, 16 May 2025 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LIAVMXH4svSzSC/MKS256EsGPDy7x67BLuUzvVdOq7o=; b=WezWspeUDnrBexJag2ObCx4wOG
 4HddBNA5ILpO5EnUFDY94aOxtU6RHirgdqwEqLSbDOWHtxWUUfsHUwHau5IA3NRE0P3Gzth9iZ2pe
 flePg4671Uk0mnR/Y3tWZZoa/Q+K+qapZIedTHPufpmTgZ6314pcH8RAEfYgvIRcHlGMBHgBchlX/
 yqMe9UdpJrZ+bFoVjhSMyEaTVRZpjZEDvmyto6Apwl7A366G8ywcw0a47KcaqOyOQAclysKiH2jhj
 pKEszIZMJn917dyss8rhxb6Wd6JKzWhX7mxtlUNtkohzUTzPYGLTykYoz6hrzxVMk8ucpid8FFSfh
 YLsvP9XQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFtGF-00949i-5M; Fri, 16 May 2025 13:35:53 +0200
Message-ID: <24173faf-c2f0-4d08-93db-587891dc8b5d@igalia.com>
Date: Fri, 16 May 2025 12:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/sched: Prevent teardown waitque from blocking
 too long
To: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-4-phasta@kernel.org>
 <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com> <aCcLMhS5kyD60PEX@pollux>
 <e152d20b-c62e-47d9-a891-7910d1d24c6a@igalia.com> <aCcZSA79X9Nk2mzh@pollux>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aCcZSA79X9Nk2mzh@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 16/05/2025 11:54, Danilo Krummrich wrote:
> On Fri, May 16, 2025 at 11:19:50AM +0100, Tvrtko Ursulin wrote:
>>
>> On 16/05/2025 10:53, Danilo Krummrich wrote:
>>> On Fri, May 16, 2025 at 10:33:30AM +0100, Tvrtko Ursulin wrote:
>>>> On 24/04/2025 10:55, Philipp Stanner wrote:
>>>>> +	 * @kill_fence_context: kill the fence context belonging to this scheduler
>>>>
>>>> Which fence context would that be? ;)
>>>
>>> There's one one per ring and a scheduler instance represents a single ring. So,
>>> what should be specified here?
>>
>> I was pointing out the fact not all drivers are 1:1 sched:entity.
> 
> I'm well aware, but how is that relevant? Entities don't have an associated
> fence context, but a GPU Ring (either hardware or software) has, which a
> scheduler instance represents.

Aha! Well.. how it is relevant and do entities not have an associated 
fence context? Well, entity->fence_context.. that was my first 
association this whole time. Never it crossed my mind this is talking 
about the hardware fence context. Proof in the pudding naming should be 
improved.

But I also don't think there is a requirement for fences returned from 
->run_job() to have a single context. Which again makes it not the best 
naming.

>> Thought it would be obvious from the ";)".
> 
> I should read from ";)" that you refer to a 1:N-sched:entity relationship (which
> doesn't seem to be related)?
> 
>>>> Also, "fence context" would be a new terminology in gpu_scheduler.h API
>>>> level. You could call it ->sched_fini() or similar to signify at which point
>>>> in the API it gets called and then the fact it takes sched as parameter
>>>> would be natural.
>>>
>>> The driver should tear down the fence context in this callback, not the while
>>> scheduler. ->sched_fini() would hence be misleading.
>>
>> Not the while what? Not while drm_sched_fini()?
> 
> *whole
> 
>> Could call it sched_kill()
>> or anything. My point is that we dont' have "fence context" in the API but
>> entities so adding a new term sounds sub-optimal.
> 
> In the callback the driver should neither tear down an entity, nor the whole
> scheduler, hence we shouldn't call it like that. sched_kill() is therefore
> misleading as well.

  ->sched_exit()? ->sched_stop()? ->sched_cleanup()?

> It should be named after what it actually does (or should do). Feel free to
> propose a different name that conforms with that.
> 
>>>> We also probably want some commentary on the topic of indefinite (or very
>>>> long at least) blocking a thread exit / SIGINT/TERM/KILL time.
>>>
>>> You mean in case the driver does implement the callback, but does *not* properly
>>> tear down the fence context? So, you ask for describing potential consequences
>>> of drivers having bugs in the implementation of the callback? Or something else?
>>
>> I was proposing the kerneldoc for the vfunc should document the callback
>> must not block, or if blocking is unavoidable, either document a guideline
>> on how long is acceptable. Maybe even enforce a limit in the scheduler core
>> itself.
> 
> Killing the fence context shouldn't block.

Cool. And maybe convert the wait_event to wait_event_timeout with a 
warning to be robust.

Mind you, I still think a solution which does not add new state 
machinery should be preferred.

Regards,

Tvrtko

