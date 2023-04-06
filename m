Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AD6D9ADA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 16:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE0410E279;
	Thu,  6 Apr 2023 14:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFF710EC12
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 14:43:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 7909D425AB;
 Thu,  6 Apr 2023 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1680792205;
 bh=cH2f1dzWcw5zGNLV6Sfa7FVHZP1ooqt4v1TG0/tALi0=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To;
 b=a3gGGunYeaQPwzp7tYF5GLXAypv5IY9NBfZcmmtFsIb7IJ/jqeYAAF/ZltHJimfT2
 rjo48b0iXe8CX32eXX0pmhfTCrb3c5mgjAnLZHrccQ0XHEzXTWO5wytDSBtAoGdHk2
 Zn1q3/YnVVXbY+ZrpipBoVNNJFzoMPxkvm3zK5MITSO/UGa0U/b6CQgKDsmUWfncIe
 rkoGxeBMAmmMpfg4ib9GBdpfo5AblwQe5MdPyzfQsrJ6pdYlPH2VM7dzI85sfJx/M+
 6aJ9pWXP9dHaoFUamivJEdGfnZGaZ7MngYQy+aADb7UU/9KVVcxpiMRNnmD8LPJZfL
 HND11VYAUc5xw==
Message-ID: <30534307-24af-b6f8-ea9f-e4264997bf9d@asahilina.net>
Date: Thu, 6 Apr 2023 23:43:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
 <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
 <24fe6e14-0d0a-f874-766d-e8d045d1e80e@asahilina.net>
 <ZC6ab6LomidehGR3@phenom.ffwll.local>
 <9500edc9-4e9d-9d64-b444-ea9523779700@asahilina.net>
 <ZC7LCi0vqFOw3KL5@phenom.ffwll.local>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <ZC7LCi0vqFOw3KL5@phenom.ffwll.local>
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
Cc: Matthew Brost <matthew.brost@intel.com>, andrey.grodzovsky@amd.com,
 tvrtko.ursulin@linux.intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, yuq825@gmail.com,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2023 22.37, Daniel Vetter wrote:
> On Thu, Apr 06, 2023 at 09:21:47PM +0900, Asahi Lina wrote:
>> On 06/04/2023 19.09, Daniel Vetter wrote:
>>> On Thu, Apr 06, 2023 at 06:05:11PM +0900, Asahi Lina wrote:
>>>> On 06/04/2023 17.27, Daniel Vetter wrote:
>>>>> On Thu, 6 Apr 2023 at 10:22, Christian König <christian.koenig@amd.com> wrote:
>>>>>>
>>>>>> Am 05.04.23 um 18:09 schrieb Luben Tuikov:
>>>>>>> On 2023-04-05 10:05, Danilo Krummrich wrote:
>>>>>>>> On 4/4/23 06:31, Luben Tuikov wrote:
>>>>>>>>> On 2023-03-28 04:54, Lucas Stach wrote:
>>>>>>>>>> Hi Danilo,
>>>>>>>>>>
>>>>>>>>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>>>>>>>>>> Hi all,
>>>>>>>>>>>
>>>>>>>>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
>>>>>>>>>>> tries to track the accumulated time that a job was active on the GPU
>>>>>>>>>>> writing it to the entity through which the job was deployed to the
>>>>>>>>>>> scheduler originally. This is done within drm_sched_get_cleanup_job()
>>>>>>>>>>> which fetches a job from the schedulers pending_list.
>>>>>>>>>>>
>>>>>>>>>>> Doing this can result in a race condition where the entity is already
>>>>>>>>>>> freed, but the entity's newly added elapsed_ns field is still accessed
>>>>>>>>>>> once the job is fetched from the pending_list.
>>>>>>>>>>>
>>>>>>>>>>> After drm_sched_entity_destroy() being called it should be safe to free
>>>>>>>>>>> the structure that embeds the entity. However, a job originally handed
>>>>>>>>>>> over to the scheduler by this entity might still reside in the
>>>>>>>>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy()
>>>>>>>>>>> already being called and the entity being freed. Hence, we can run into
>>>>>>>>>>> a UAF.
>>>>>>>>>>>
>>>>>>>>>> Sorry about that, I clearly didn't properly consider this case.
>>>>>>>>>>
>>>>>>>>>>> In my case it happened that a job, as explained above, was just picked
>>>>>>>>>>> from the schedulers pending_list after the entity was freed due to the
>>>>>>>>>>> client application exiting. Meanwhile this freed up memory was already
>>>>>>>>>>> allocated for a subsequent client applications job structure again.
>>>>>>>>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to
>>>>>>>>>>> reproduce the same corruption over and over again by just using
>>>>>>>>>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>>>>>>>>>
>>>>>>>>>>> Fixing this issue doesn't seem to be very straightforward though (unless
>>>>>>>>>>> I miss something), which is why I'm writing this mail instead of sending
>>>>>>>>>>> a fix directly.
>>>>>>>>>>>
>>>>>>>>>>> Spontaneously, I see three options to fix it:
>>>>>>>>>>>
>>>>>>>>>>> 1. Rather than embedding the entity into driver specific structures
>>>>>>>>>>> (e.g. tied to file_priv) we could allocate the entity separately and
>>>>>>>>>>> reference count it, such that it's only freed up once all jobs that were
>>>>>>>>>>> deployed through this entity are fetched from the schedulers pending list.
>>>>>>>>>>>
>>>>>>>>>> My vote is on this or something in similar vain for the long term. I
>>>>>>>>>> have some hope to be able to add a GPU scheduling algorithm with a bit
>>>>>>>>>> more fairness than the current one sometime in the future, which
>>>>>>>>>> requires execution time tracking on the entities.
>>>>>>>>> Danilo,
>>>>>>>>>
>>>>>>>>> Using kref is preferable, i.e. option 1 above.
>>>>>>>> I think the only real motivation for doing that would be for generically
>>>>>>>> tracking job statistics within the entity a job was deployed through. If
>>>>>>>> we all agree on tracking job statistics this way I am happy to prepare a
>>>>>>>> patch for this option and drop this one:
>>>>>>>> https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
>>>>>>> Hmm, I never thought about "job statistics" when I preferred using kref above.
>>>>>>> The reason kref is attractive is because one doesn't need to worry about
>>>>>>> it--when the last user drops the kref, the release is called to do
>>>>>>> housekeeping. If this never happens, we know that we have a bug to debug.
>>>>>>
>>>>>> Yeah, reference counting unfortunately have some traps as well. For
>>>>>> example rarely dropping the last reference from interrupt context or
>>>>>> with some unexpected locks help when the cleanup function doesn't expect
>>>>>> that is a good recipe for problems as well.
>>>>>>
>>>>>>> Regarding the patch above--I did look around the code, and it seems safe,
>>>>>>> as per your analysis, I didn't see any reference to entity after job submission,
>>>>>>> but I'll comment on that thread as well for the record.
>>>>>>
>>>>>> Reference counting the entities was suggested before. The intentionally
>>>>>> avoided that so far because the entity might be the tip of the iceberg
>>>>>> of stuff you need to keep around.
>>>>>>
>>>>>> For example for command submission you also need the VM and when you
>>>>>> keep the VM alive you also need to keep the file private alive....
>>>>>
>>>>> Yeah refcounting looks often like the easy way out to avoid
>>>>> use-after-free issue, until you realize you've just made lifetimes
>>>>> unbounded and have some enourmous leaks: entity keeps vm alive, vm
>>>>> keeps all the bo alives, somehow every crash wastes more memory
>>>>> because vk_device_lost means userspace allocates new stuff for
>>>>> everything.
>>>>
>>>> Refcounting everywhere has been working well for us, so well that so far all
>>>> the oopses we've hit have been... drm_sched bugs like this one, not anything
>>>> in the driver. But at least in Rust you have the advantage that you can't
>>>> just forget a decref in a rarely-hit error path (or worse, forget an incref
>>>> somewhere important)... ^^
>>>>
>>>>> If possible a lifetime design where lifetimes have hard bounds and you
>>>>> just borrow a reference under a lock (or some other ownership rule) is
>>>>> generally much more solid. But also much harder to design correctly
>>>>> :-/
>>>>>
>>>>>> Additional to that we have some ugly inter dependencies between tearing
>>>>>> down an application (potential with a KILL signal from the OOM killer)
>>>>>> and backward compatibility for some applications which render something
>>>>>> and quit before the rendering is completed in the hardware.
>>>>>
>>>>> Yeah I think that part would also be good to sort out once&for all in
>>>>> drm/sched, because i915 has/had the same struggle.
>>>>> -Daniel
>>>>>
>>>>
>>>> Is this really a thing? I think that's never going to work well for explicit
>>>> sync, since the kernel doesn't even know what BOs it has to keep alive for a
>>>> job... I guess it could keep the entire file and all of its objects/VMs/etc
>>>> alive until all of its submissions complete but... ewww.
>>>>
>>>> Our Mesa implementation synchronously waits for all jobs on context destroy
>>>> for this reason, but if you just kill the app, yeah, you get faults as
>>>> running GPU jobs have BOs yanked out from under them. Kill loops make for a
>>>> good way of testing fault handling...
>>>
>>> You wind down the entire thing on file close? Like
>>> - stop all context
>>> - tear down all context
>>> - tear down all vm
>>> - tear down all obj
>>>
>>> Just winding things down in a random order and then letting gpu fault
>>> handling sort out the mess doesn't strike me as particularly clean design
>>> ...
>> The idea is that object drop order generally doesn't matter since things
>> that care about other things should own them or hold references to them
>> anyway, so the dependency graph of all the resources is encoded directly in
>> the type hierarchy instead of having to open-code a "cleanup procedure"...
>> which then invariably leads to corner cases when you have to do the same
>> thing, or part of it, for error handling.
>>
>> This has been working *very* well! It solves the issue of error handling
>> since error handling just unwinds whatever was done to that point naturally
>> in Rust (? operator), so there's practically no open-coded error handling
>> code anywhere. The first time we ran into OOMs (Xonotic with no Mesa texture
>> compression support yet, on 8GB machines on max settings...) the whole thing
>> just worked. OOM killer went rampant and shmem doesn't account stuff to
>> processes properly of course, but all the error paths, allocation errors,
>> etc... all of that just worked, first try, across dozens of error paths that
>> had never been tested before, not a single oops or deadlock or leak or
>> anything in sight. Similarly, yesterday I did manage to run into drm_sched
>> failing to create kthreads (the scaling issue Matthew's series fixes)... and
>> still, that was fine. That happens on queue creation so it just bubbled up
>> to Mesa as a failed ioctl and things kept moving along nicely otherwise. I
>> even have nice ergonomic XArray semantics so that you can reserve a new
>> slot, allocate some object, then populate it, and if you don't (because you
>> errored out in between) it automatically gets freed again without explicit
>> cleanup code.
>>
>> And it also means that I can encode *firmware* resource dependencies in the
>> type system (with Rust lifetimes attached to *GPU* pointers even - it's a
>> bit dodgy how it's done but it works well in practice). Since it is
>> absolutely critical that the firmware objects respect their lifetimes or
>> else the whole thing crashes irrecoverably, this is the only way I feel it's
>> been even practical to write this driver and not be a firmware crash mess.
>> Of course we still get some crashes due to flaws in how I understand the
>> firmware, but it's always things I don't know, not things I accidentally
>> messed up in some corner case code path we don't normally hit, since I just
>> don't have to think about that as long as the hierarchy is right.
>>
>> I actually don't know exactly what precise order things get dropped in for
>> this reason! I could find out, and it's predictable in Rust, what I mean is
>> that thinking about a total order like that is not necessary for correctness
>> as long as I got the ownership right. Off the top of my head though, it goes
>> very roughly like this:
>>
>> - On File close, all the GEM objects get closed (DRM core does this)
>> - This triggers explicit drops of all mappings in those GEM objects owned by
>> that File (identified by unique ID, this is the one annoying circular
>> reference thing I mentioned in the other thread...). At this point the GPU
>> probably faults but we don't care. *
>> - The File itself gets dropped, which drops the XArrays for queues and
>> (UAPI) VMs
>>    - UAPI VMs getting dropped doesn't do much other than unmap a single dummy
>> object. The underlying MMU VM is refcounted and jobs hold references. This
>> also drops the userspace VM object allocator used for kernel-managed
>> allocations, but that too is internally refcounted and won't go away until
>> all of its allocations do.
>> - Queues get dropped, which mostly drops a bunch of references to things
>> that no longer matter, along with the scheduler and scheduler entity.
>> - The entity already has a reference to the scheduler in the abstraction (to
>> meet the soundness requirement), so the entity necessarily goes first. That
>> kills all not yet scheduled jobs, freeing any resources they might use.
>> - Then the scheduler gets torn down, and with my other patch that logically
>> kills all in-flight jobs, detaching their hardware fences and dropping the
>> job objects. This... still doesn't do much other than drop some references
>> that we don't care about.
>> - At this point, if any jobs are in flight, their firmware objects and all
>> of the type hierarchy that goes with them is still alive, as well as the
>> firmware queues they're in and the Rust objects representing them, the VMs
>> they use, the Events they have been allocated...
>> - Jobs complete (successfully or fault), then when complete get popped off
>> of the Rust-side queue objects that represent the firmware queues.
>> - When any given FW queue is empty, it relinquishes its assigned firmware
>> event ID. That causes the event system to drop its owner reference to it,
>> which means the queue itself gets dropped (since the UAPI Queue that also
>> held a reference is gone). That then also drops a reference to what I call
>> the GpuContext.
>> - To avoid deadlocks, completed job objects are freed in another thread
>> (ugly hack right now, should be done better in the future). Eventually as
>> that happens, any resources they reference are dropped, including some
>> shared ones that are logically tied to the scheduler/queues, references to
>> the MMU VM address space, references to the VM slot that address space is
>> assigned to, objects allocated out of user VM space, everything. Refcounts
>> everywhere for anything shared, direct ownership of child structures for
>> anything that isn't (work buffers, firmware command lists, etc.). I once
>> tried to make a slide of the references and pointers involved in just the
>> vertex half of a single GPU job and... even just that was quite interesting.
>> - When the last job completes, that drops the last reference to the VM slot,
>> which means the backing VM is logically detached from the GPU MMU (this is
>> lazy though, it's still there in practice).
>> - When the last firmware queue is dropped for a logical queue/sched/etc
>> (which means no more jobs are running at the GPU for that context), that
>> drops the last reference to the GpuContext. That also gets shoved into
>> another thread context for cleanup to avoid deadlocks with fault recovery.
>> - When that is finally cleaned up, a firmware command is sent to invalidate
>> the GpuContext. I'm still figuring out what that does and what the lifetime
>> rules are here (this is the only explicit invalidation command that exists),
>> but as of yesterday I know that at the very least we need to keep hold of
>> any Tiled Vertex Buffer associated with it until after inval, so that now
>> has a reference to it that gets dropped after the firmware acknowledges the
>> invalidation (unless it's a non-render-capable Queue, then no TVB
>> necessary).
>> - When the Buffer gets dropped, that frees both its backing memory and
>> (virtual) page list structures, which are in user VM space, as well as some
>> kernel firmware objects.
>> - If things have happened in the order I listed here, those will be the last
>> allocations in the two user VM space heap object allocators, so those now
>> get dropped, which drops the mappings of their backing GEM objects,
>> unmapping them from the MMU VM page tables.
>> - Those mappings will now be the last references to the actual MMU VM
>> object, so that it gets destroyed (the lazy detach comes into effect here,
>> PT base address is removed from the VM context base table, full ASID
>> invalidate, etc.), which with it drops the IoPgTable that backs it, which
>> frees the page tables.
>> - Then finally the GEM objects backing the userspace allocators get dropped
>> as well, which will be the last reference to them, so those get freed.
> 
> Thanks for the write up!
> 
> Maybe some more fundamental thoughts on this entire endeavour:
> 
> I think one thing that's causing a lot of friction that in C drivers at
> least some of these things are done with implied/borrowed references. If
> you want an absolute shocking example, the gpu crash dump sampling for a
> driver that does dynamic memory management can be pretty epic:
> 
> - the timeout handler is guaranteed (well if the driver didn't screw up
>    things, which mostly boils down to call drm_sched_stop() before it
>    analyzes anything at all wrt gpu hw state) to hold up the drm_job
>    completion fence
> 
> - this fence is (at submit ioctl time) installed into all the dma_resv
>    fence containers for the vm (single shared dma_resv for all vm-private obj for
>    efficiency, all shareable gem_bo have their own dma_resv)
> 
> - the memory manager guarantees that it will not free (or even move in the
>    case of ttm) the buffer while a fence is unsingalled. ttm does this by
>    delaying the free as needed, i915-gem and some of the others did this by
>    trying to hold onto extra references. the latter causes way too much
>    problems with reference dropping in my experience looking at a decade of
>    drivers getting details wrong here.
> 
> - which means the crash dump handler can have a plain list of gem_bo to
>    record, without any references, because they wont go away before it
>    finishes.
> 
> - more fun even, you could directly sample the memory locations at ioctl
>    submit time, and even when ttm moves the buffers around in a pipelined
>    fashion: your timeout handler wont run before all the jobs to move the
>    buffer into the right location have completed, and it will not unblock
>    any subsequent move or eviction that's already queued up. Which means
>    even the raw memory address will point at the right stuff.
> 
> This is just one example. drm and the kernel is full of these borrowed
> reference tricks with often cross through the entire stack, so rust has to
> be able to cope. The sales pitch of rust, and really the reason it's the
> first non-C language in linux, is that with the borrow semantics, it can
> validate this stuff at compile time, and allow kernel drivers to continue
> playing these tricks to outright avoid any and all refcounting needs. If
> rust doesn't deliver and we need to have all the refcounting again to make
> rust drivers safe I think that'll cast serious doubts on the viability of
> rust-in-linux.

Right, so the thing is Rust can encode *some* borrowed reference 
semantics at compile time, namely what Rust lifetimes can represent. But 
you can't encode arbitrarily complex "I can guarantee this is alive 
right now because reasons A,B,C,D" semantics in the type system. For 
arbitrarily complex rules like that, you need to either refcount, or use 
unsafe and raw pointers. For example, in my driver I use raw pointers in 
the event slot acquisition to point to the actual u32s that hold the 
event values, because I can guarantee through the semantics of that 
module that those will always be valid pointers to the live array (and 
never alias too), even though I can't encode that in the type system. 
Throwing around refcounted pointers to the whole object there would be 
silly, so instead I just used unsafe and left a SAFETY comment 
explaining why it's safe.

In the end, unsafe isn't any worse than C (it's strictly better, you 
still get the borrow checker and type safety and everything else), so I 
don't think Rust not being able to solve all of these problems is really 
a good argument against Rust. The idea, and where Rust really shines, is 
that even when you have to do this you are *containing* the unsafe code 
within places where it can be audited and explained. And when the 
majority of the code is safe, and when you strive to make the interfaces 
between modules safe, and when you limit the ability of cross-module 
interactions to break safety (Not eliminate! In abstractions yes, and in 
userspace Rust this is expected, but within a driver it gets more 
interesting and I can spend a long time talking about how safety 
boundaries in drivers are complicated and a bit porous...) you end up 
reducing the chances of safety bugs by orders of magnitude anyway.

And it worked, right? I have ~128 unsafe{} blocks in the driver and 
still no oopses in production ^^

But (big but!) the idea with safe Rust abstractions (the stuff in rust/) 
is that they absolutely do need to be safe (unless marked unsafe, but 
that sucks...), because then implicitly you are documenting the 
safety/lifetime requirements in the type system and that's hugely 
beneficial for common code. It means users of those APIs don't have to 
think about the internals and safety invariants and all that. Drivers 
still have to worry about internal safety, but they don't have to worry 
about messing up the interface with common code. That's also very 
beneficial for allowing refactoring of that common code without worrying 
that you'll break users.

So technically we could just give up and mark the drm_sched abstraction 
unsafe and actually document all of these safety requirements (which is 
the other side of the coin - if you want to use unsafe, you get to write 
the docs, lawyer style! That's the rule! No getting by with vague docs 
with dozens of unexplained corner cases!). But, honestly, I think that 
would be kind of sad... drm_sched really should have a self-contained, 
safe API, and I just don't see a good reason why it can't other than it 
not having been designed with this in mind initially. It was ported out 
of a driver, and not that long ago, right? That explains a lot, because 
it means it is probably leaking all of these assumptions from that 
driver's internal design... and it probably doesn't help that the people 
maintaining it all seem to be from that particular company either. It's 
easy to have tunnel vision if you mostly work on one use case...

> Now there's definitely going to be hilarious bugs uncovered on the C side,
> and semantics that need to be clarified, but I think enabling scary tricks
> like the above one is what'll fundamentally make or break rust in linux.

For the specific case of crash dumps and stop-the-world stuff like 
that... yeah, those are some of the worst things to fit in otherwise 
nice Rust designs because they violate layering left and right. I don't 
have a good answer for how exactly I'd do this in my driver yet. I'm 
sure it *can* be done, and there's always unsafe if needed, since at 
that point you're dealing in driver code and that's a lot less 
contentious than an abstraction being unsafe itself...

My initial plan for FW crash dumps is going to be fairly easy because I 
only really care about dumping the firmware object arena and maybe 
actual firmware .data, and that's all GPU-global anyway, and it won't be 
hard to poke my way into the global allocators to take a snapshot of 
their backing GEM objects. There's a global alloc lock involved there 
which is all I need for basic consistency and getting the locking right 
for allocs as far as deadlock risk is something I need to care about for 
other reasons anyway. It won't guarantee that nobody else is *writing* 
to any of that memory while I take a snapshot, but I don't really care 
about that since it would be rare and should be limited to 
newly-allocated memory the firmware doesn't yet care about anyway.

In the end, nothing stops you from having piles of raw pointer 
backdoors, having a rule that "this is only used for the crash handler", 
and then having a couple pages of SAFETY comments in that bit of the 
code with a big "here be dragons" disclaimer. It won't make that 
particular chunk of code any less likely to have bugs than the 
equivalent C code, but at least the rest of the driver isn't affected, 
and hopefully you can at least avoid unsafe in some subsets of the 
troublesome part too ^^

There's also a flipside to this though: Who cares if you take extra 
redundant GEM BO references in the crash handler due to API safety? 
After all, it's not a perf-sensitive codepath. Of course, if safety 
causes you to add refcounting at all where none would otherwise be 
needed, or to have to do more of it in hot paths, or to introduce extra 
locking that could cause deadlocks that's a different story. But I think 
the thought process is very different between Rust and C here, when 
writing drivers. In C, it takes extra work to be safe, so chances are 
most people won't write defensive code like that even where there is no 
performance reason not to, since it's outright easier to read code the 
less safe it is. Rust isn't like that! Most safety is encoded in types 
(automatic reference counting is a big one here), so it doesn't take any 
extra effort to be safe, while it usually does to do it unsafely (unsafe 
{} blocks if nothing else). So then you write safe code by default... 
which yes, might do some extra refcounting and locking and stuff, but 
you can always optimize that later, profiler in hand. Once you know you 
need unsafe for real perf reasons, by all means, and I expect to end up 
doing a round of profiling in the future and have to poke some holes in 
things too. But until then... safe is just easier and, well, safer!

> In the end it'll be lots of detail work, and I really hope it all works
> out.
> 
>> I probably got more than one thing wrong there, and there's layers of
>> complexity I glossed over, but that's the rough idea ^^
>>
>> * If we need to fix this then we're going to need some kind of signal from
>> the DRM core that this is happening and it's not normal user-triggered GEM
>> closing, and it's going to be interesting... it also means we need some kind
>> of mechanism to transfer responsibility over those mappings to all in-flight
>> jobs themselves, because normally userspace is strictly responsible for all
>> mappings in an explicit sync VM bind style world, and now we're adding a
>> special case where we freeze the state of the VM until all in-flight jobs
>> are done when the File goes away instead of eagerly freeing things. That's a
>> very weird departure from how the whole thing normally works, so if we
>> really want that I'm going to have to think of how to do it reasonably. It
>> might be easier once we implement the full VM map range tracking which will
>> likely flip the VM<->GEM object relationship around a bit.
> 
> See my other reply for you how can untangle this potentially on the vm_id
> subthread. I think in general rust Drop is awesome, but there's cases
> where we'll have to be more explicit at unwinding things. At least in the
> linux kernel the general consensus is that too much refcounting is a
> maintenance disaster because you end up dropping the final reference in
> all kinds of really bad places (interrupt handlers, while holding the
> wrong locks, holding them too long).

Yeah, that's one I've run into, it's why I have a few places with subtle 
code to avoid that and more things will need cleaning up too...

This is something that I expect will become Rust compile-time magic in 
the future though! There's already been talk about being able to prove 
that things are only ever called from the right execution context. Then 
if you have a Drop of a reference whose underlying type is not safe to 
Drop from IRQ context in IRQ context, the compiler complains. It's not 
clear exactly what this will look like yet, but it's an active topic of 
discussion. And that's another nice thing about Rust: we can actually 
help drive the evolution of the language, much faster than with C!

> Somewhat related I also expect that
> rust drivers will need to have quite a few manual drop calls to
> artificially limit lifetime, because sometimes when you drop things the
> wrong way round (e.g. drop the refcount while still having the mutex guard
> live) results in deadlocks.

Yup! ^^

drivers/gpu/drm/asahi$ grep -r core::mem::drop | wc -l
17

Rust is magic but it won't magically solve all of our problems!

(I don't think all of those 17 are necessary, some are just places where 
I wanted to be explicit/safer or bound critical sections more, but a few 
are definitely there to avoid deadlocks.)

Simple Arc<Mutex<T>> usage isn't a problem though, you can't drop the 
refcount without dropping the guard first there (lifetimes prevent it). 
The tricky bit is when you have to call into *another* agent that owns a 
reference to the same object, after having done something while holding 
the mutex. Then you really need to drop the guard first.

> There's going to be lots of fun here :-)

It's already been fun and I don't expect it to get any less fun ^^

~~ Lina

