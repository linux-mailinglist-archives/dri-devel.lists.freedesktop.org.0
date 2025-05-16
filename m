Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF965ABA045
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2D210EB00;
	Fri, 16 May 2025 15:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LSi28N3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ECE10EB00;
 Fri, 16 May 2025 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t9eRXSIwwJ3RBs8er8Ia3CDy+A4KCgoqDqon5Mvaeos=; b=LSi28N3zdS6zipMOTvcgz7ZOpT
 ARoDZ3iVGv0zZ3AC52kOH3tZE0Fqb6Y+qIeXIO3QTakpPr9Y1tZDEmmBNd4wimhGhml4EXDXqq5ih
 0ZzskI013n78iqc5XYerMOFk+Gpvy1j2HcRgK+Xh8eGYeeQRv2Fbh9G7fXxzYQfSf2gpzvjC8J1dv
 WhfjcHJgre4naDZlLd1fHoptYHTmFT3k20Mdhmv6j0jJSpFds7W2L8Jll/8lcb+GOmq2Vz60XFIM2
 FTMLgYM/BM4OmrnY+zfyJ6KIkVYlXbMq3hPznEDRqjniP0me4QCP28S+qlWk2yAeKXHFtn6VjMWLC
 TVCa+NZg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFxCf-0099NR-PB; Fri, 16 May 2025 17:48:28 +0200
Message-ID: <d3c7081d-0a57-45be-acee-d9e0fed185c5@igalia.com>
Date: Fri, 16 May 2025 16:48:27 +0100
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
 <24173faf-c2f0-4d08-93db-587891dc8b5d@igalia.com> <aCco0RFRVM1POr6J@pollux>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aCco0RFRVM1POr6J@pollux>
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


On 16/05/2025 13:00, Danilo Krummrich wrote:
> On Fri, May 16, 2025 at 12:35:52PM +0100, Tvrtko Ursulin wrote:
>>
>> On 16/05/2025 11:54, Danilo Krummrich wrote:
>>> On Fri, May 16, 2025 at 11:19:50AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 16/05/2025 10:53, Danilo Krummrich wrote:
>>>>> On Fri, May 16, 2025 at 10:33:30AM +0100, Tvrtko Ursulin wrote:
>>>>>> On 24/04/2025 10:55, Philipp Stanner wrote:
>>>>>>> +	 * @kill_fence_context: kill the fence context belonging to this scheduler
>>>>>>
>>>>>> Which fence context would that be? ;)
>>>>>
>>>>> There's one one per ring and a scheduler instance represents a single ring. So,
>>>>> what should be specified here?
>>>>
>>>> I was pointing out the fact not all drivers are 1:1 sched:entity.
>>>
>>> I'm well aware, but how is that relevant? Entities don't have an associated
>>> fence context, but a GPU Ring (either hardware or software) has, which a
>>> scheduler instance represents.
>>
>> Aha! Well.. how it is relevant and do entities not have an associated fence
>> context? Well, entity->fence_context.. that was my first association this
>> whole time. Never it crossed my mind this is talking about the hardware
>> fence context. Proof in the pudding naming should be improved.
> 
> It says "fence context belonging to this scheduler", which should be
> unambiguous, however I agree that we could mark out the difference even more.

Cool, I had tunnel vision due working with entity->fence_context a lot 
and this just had misfortune to re-use the same name.

>> But I also don't think there is a requirement for fences returned from
>> ->run_job() to have a single context. Which again makes it not the best
>> naming.
> 
> It's implied by the fact that a scheduler instance represents a ring. Having
> multiple fence contexts per ring doesn't make any sense.
> 
> But it's indeed not written down -- we should do that then.

Would you do it in code or just in docs? I don't see a real benefit to 
it to be honest, since nothing depends on anything apart that it is a 
fence which will signal when job is done. But I am not aware of anything 
where it would be a problem either. One to run past driver maintainers I 
guess.

>>> In the callback the driver should neither tear down an entity, nor the whole
>>> scheduler, hence we shouldn't call it like that. sched_kill() is therefore
>>> misleading as well.
>>
>>   ->sched_exit()? ->sched_stop()? ->sched_cleanup()?
> 
> I think this all would throw up questions like "What does {exit,stop,cleanup}
> mean in this context?". And the answer would be "kill the fence context of the
> ring represented by the scheduler".
> 
> I think we want a name that represents that without an indirection that we have
> to define.

Well fence_kill_context wasn't self-descriptive to me neither so there 
is that too. In other words some kerneldoc will be needed anyway and a 
callback to call while tearing something down is pretty standard stuff. 
So I don't think it is a big deal to explain what that callback should do.

>>> It should be named after what it actually does (or should do). Feel free to
>>> propose a different name that conforms with that.
>>>
>>>>>> We also probably want some commentary on the topic of indefinite (or very
>>>>>> long at least) blocking a thread exit / SIGINT/TERM/KILL time.
>>>>>
>>>>> You mean in case the driver does implement the callback, but does *not* properly
>>>>> tear down the fence context? So, you ask for describing potential consequences
>>>>> of drivers having bugs in the implementation of the callback? Or something else?
>>>>
>>>> I was proposing the kerneldoc for the vfunc should document the callback
>>>> must not block, or if blocking is unavoidable, either document a guideline
>>>> on how long is acceptable. Maybe even enforce a limit in the scheduler core
>>>> itself.
>>>
>>> Killing the fence context shouldn't block.
>>
>> Cool. And maybe convert the wait_event to wait_event_timeout with a warning
>> to be robust.
> 
> That would make sense if it could deadlock, but even if the driver does nothing
> it should terminate eventually. The rule that we always rely on is that we
> guarantee throughout the kernel that fences are signalled eventually.

Given it is an opt-in fair enough. (Some drivers don't have automatic 
fence expiration, but then again they don't have this callback either. 
And once they start adding it, there will be kerneldoc to say callback 
must not block.)

Regards,

Tvrtko

