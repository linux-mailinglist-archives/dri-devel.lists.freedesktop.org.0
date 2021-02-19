Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DE631FCFC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 17:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D576EB5E;
	Fri, 19 Feb 2021 16:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAC3E6EB5E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 16:17:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 031D4ED1;
 Fri, 19 Feb 2021 08:17:44 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAFFB3F73B;
 Fri, 19 Feb 2021 08:17:42 -0800 (PST)
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
 <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
 <20210218154538.GA1483@kevin> <bddce2d0-8f93-9263-0185-97fc848ddda6@arm.com>
 <CAL_JsqJ1Q+yRTY7+RduWSK4ZWO4v8Dq02xwNdNpNY0uD402M-g@mail.gmail.com>
 <456aaf72-50ed-f482-d6e1-e131143aa835@arm.com>
 <CAL_Jsq+aYmmz6+RHzSNmaMQqJgkBGk6+7SyrnHQ9uASdcEU3uA@mail.gmail.com>
 <CAKMK7uF_qAL4fhuz-_itvS6BY2ziOnjkyjc-hrXKWmK7Q9ZE6w@mail.gmail.com>
 <76d68de3-d097-117a-ae9d-6771b106e16f@arm.com>
 <YC/VtqBVVN3XTuPF@phenom.ffwll.local>
From: Steven Price <steven.price@arm.com>
Message-ID: <a4546f4e-5c2f-158b-2e30-777569c06aea@arm.com>
Date: Fri, 19 Feb 2021 16:18:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YC/VtqBVVN3XTuPF@phenom.ffwll.local>
Content-Language: en-GB
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
Cc: Neil Roberts <nroberts@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/02/2021 15:13, Daniel Vetter wrote:
> On Fri, Feb 19, 2021 at 01:36:06PM +0000, Steven Price wrote:
>> On 18/02/2021 18:20, Daniel Vetter wrote:
>>> On Thu, Feb 18, 2021 at 6:16 PM Rob Herring <robh+dt@kernel.org> wrote:
>>>>
>>>> On Thu, Feb 18, 2021 at 10:51 AM Steven Price <steven.price@arm.com> wrote:
>>>>>
>>>>> On 18/02/2021 16:38, Rob Herring wrote:
>>>>>> On Thu, Feb 18, 2021 at 10:15 AM Steven Price <steven.price@arm.com> wrote:
>>>>>>>
>>>>>>> On 18/02/2021 15:45, Alyssa Rosenzweig wrote:
>>>>>>>>> Yeah plus Cc: stable for backporting and I think an igt or similar for
>>>>>>>>> panfrost to check this works correctly would be pretty good too. Since
>>>>>>>>> if it took us over 1 year to notice this bug it's pretty clear that
>>>>>>>>> normal testing doesn't catch this. So very likely we'll break this
>>>>>>>>> again.
>>>>>>>>
>>>>>>>> Unfortunately there are a lot of kernel bugs which are noticed during actual
>>>>>>>> use (but not CI runs), some of which have never been fixed. I do know
>>>>>>>> the shrinker impl is buggy for us, if this is the fix I'm very happy.
>>>>>>>
>>>>>>> I doubt this will actually "fix" anything - if I understand correctly
>>>>>>> then the sequence which is broken is:
>>>>>>>
>>>>>>>      * allocate BO, mmap to CPU
>>>>>>>      * madvise(DONTNEED)
>>>>>>>      * trigger purge
>>>>>>>      * try to access the BO memory
>>>>>>>
>>>>>>> which is an invalid sequence for user space - the attempt to access
>>>>>>> memory should cause a SIGSEGV. However because drm_vma_node_unmap() is
>>>>>>> unable to find the mappings there may still be page table entries
>>>>>>> present which would provide access to memory the kernel has freed. Which
>>>>>>> is of course a big security hole and so this fix is needed.
>>>>>>>
>>>>>>> In what way do you find the shrinker impl buggy? I'm aware there's some
>>>>>>> dodgy locking (although I haven't worked out how to fix it) - but AFAICT
>>>>>>> it's more deadlock territory rather than lacking in locks. Are there
>>>>>>> correctness issues?
>>>>>>
>>>>>> What's there was largely a result of getting lockdep happy.
>>>>>>
>>>>>>>>> btw for testing shrinkers recommended way is to have a debugfs file
>>>>>>>>> that just force-shrinks everything. That way you avoid all the trouble
>>>>>>>>> that tend to happen when you drive a system close to OOM on linux, and
>>>>>>>>> it's also much faster.
>>>>>>>>
>>>>>>>> 2nding this as a good idea.
>>>>>>>>
>>>>>>>
>>>>>>> Sounds like a good idea to me too. But equally I'm wondering whether the
>>>>>>> best (short term) solution is to actually disable the shrinker. I'm
>>>>>>> somewhat surprised that nobody has got fed up with the "Purging xxx
>>>>>>> bytes" message spam - which makes me think that most people are not
>>>>>>> hitting memory pressure to trigger the shrinker.
>>>>>>
>>>>>> If the shrinker is dodgy, then it's probably good to have the messages
>>>>>> to know if it ran.
>>>>>>
>>>>>>> The shrinker on kbase caused a lot of grief - and the only way I managed
>>>>>>> to get that under control was by writing a static analysis tool for the
>>>>>>> locking, and by upsetting people by enforcing the (rather dumb) rules of
>>>>>>> the tool on the code base. I've been meaning to look at whether sparse
>>>>>>> can do a similar check of locks.
>>>>>>
>>>>>> Lockdep doesn't cover it?
>>>>>
>>>>> Short answer: no ;)
>>>
>>> It's pretty good actually, if you correctly annotate things up.
>>
>> I agree - it's pretty good, the problem is you need reasonable test
>> coverage, and getting good test coverage of shrinkers is hard.
>>
>>>>> The problem with lockdep is that you have to trigger the locking
>>>>> scenario to get a warning out of it. For example you obviously won't get
>>>>> any warnings about the shrinker without triggering the shrinker (which
>>>>> means memory pressure since we don't have the debugfs file to trigger it).
>>>>
>>>> Actually, you don't need debugfs. Writing to /proc/sys/vm/drop_caches
>>>> will do it. Though maybe there's other code path scenarios that
>>>> wouldn't cover.
>>>
>>> Huh didn't know, but it's a bit a shotgun, plus it doesn't use
>>> fs_reclaim shrinker annotations, which means you don't have lockdep
>>> checks. I think at least, would need some deadlock and testing.
>>
>> The big problem with this sort of method for triggering the shrinkers is
>> that they are called without (many) locks held. Whereas it's entirely
>> possible for a shrinker to be called at (almost) any allocation in the
>> kernel.
>>
>> Admittedly the Panfrost shrinkers are fairly safe - because most things are
>> xxx_trylock(). kbase avoids trylock which makes reclaim more reliable, but
>> means deadlocks are much easier.
> 
> This is why you need the fs_reclaim annotation. With that lockdep can
> connect the dots. See also might_alloc() annotations I've added in 5.11 or
> so.
> 
> Validating shrinkers for deadlocks is actually not that hard, you just
> need the debugfs interface to run your shrinker at will under the
> fs_reclaim_acquire/release annotations. You do _not_ need to hit the full
> combinatorial test matrix of making sure that your shrinker is called in
> any possible place where memory is allocated.

Cool - I hadn't looked at that code before, but it does look like it 
should pick up the problem cases. I wish that had existed back when I 
was dealing with kbase! :)

>>>>> I have to admit I'm not 100% sure I've seen any lockdep warnings based
>>>>> on buffer objects recently. I can trigger them based on jobs:
>>>>>
>> [snip]
>>>>>
>>>>> Certainly here the mutex causing the problem is the shrinker_lock!
>>>>>
>>>>> The above is triggered by chucking a whole ton of jobs which
>>>>> fault at the GPU.
>>>>>
>>>>> Sadly I haven't found time to work out how to untangle the locks.
>>>>
>>>> They are tricky because pretty much any memory allocation can trigger
>>>> things as I recall.
>>>
>>> The above should only be possible with my dma_fence annotations, and
>>> yes the point to bugs in the drm/scheduler. They shouldn't matter for
>>> panfrost, and those patches aren't in upstream yet.
>>
>> Yes that's on a (random version of) drm-misc - just what I happened to have
>> built recently. Good news if that's not actually Panfrost's bug. I haven't
>> had the time to track down what's going on yet.
> 
> Are you sure this is really drm-misc? The patch should never have been
> there which adds these annotations.

Well drm-misc-next. It's based on commit e4abd7ad2b77 with some pending 
Panfrost fixes on top.

> Also help for fixing common code is appreciated :-)

Indeed - I have put it on my todo list, but I'm not sure when I'll be 
able to spend time on it.

Thanks,

Steve

>> Sounds like I'm perhaps being a bit unfair on the shrinkers - I'm just aware
>> that I went down a rabbit hole before looking at changing the locks which
>> started because I was convinced having shrinker_lock as a mutex was a
>> problem. But it was a while ago and I've forgotten what the logic was.
> 
> Oh memory reclaim and shrinker is definitely a rabbit hole.
> -Daniel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
