Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA6543EC8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E38310EFCB;
	Wed,  8 Jun 2022 21:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372D610E4B0;
 Wed,  8 Jun 2022 21:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654724691; x=1686260691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aiNPaGjcIHjwrAznERR6dUleN1hMAE/ptqshxRWBwWA=;
 b=egS93izCgCK1hSx4l6n7StRgKI1GOBT0/Ybd7D6hRP783A8gwXnUGMsX
 7yAHoaXqurYIMlqs2SsSZucJ5ZPe603JTIsaC53nNfrmsMecN9hmY/C3y
 vS6TxEaS8HOYND4c/xragm5Gs/j52lE7+5YzlCBHcHS6DA2INDG1FfQuH
 F3VO+C6StCb8y4ZPixDarxzBbGQEATESdk+obJaY85A7TkvuZF+cKISrE
 1JfBlNFQFmKo0fipUWf3kVgrMIfMIKphRHDNLf6OFeLQ9fTU3X+BxjahU
 i3zYGxQMAKHEi0dZ87LRTX+AljfmCBoe2px4z9sURTYYJGglkxXl/K/u0 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="277083273"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="277083273"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 14:44:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="648862818"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 14:44:50 -0700
Date: Wed, 8 Jun 2022 14:44:32 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Message-ID: <20220608214431.GD4461@nvishwa1-DESK>
References: <43746609-4f60-f347-5934-6680516297dd@intel.com>
 <20220601202836.GA15346@jons-linux-dev-box>
 <20220602201112.GQ4461@nvishwa1-DESK>
 <CAOFGe94AXn_vqON++LpiCTqOspCrVZawcYmjL3W6A7tA5vjTpQ@mail.gmail.com>
 <bd615d4e-3911-a9ce-5d9f-fb85f7866d32@intel.com>
 <20220603235148.GU4461@nvishwa1-DESK>
 <CAOFGe97GP10J601XGRNK7X+xLxGK1sxNnbbLeLTxAf8g4V0-bQ@mail.gmail.com>
 <20220607181810.GV4461@nvishwa1-DESK>
 <20220607213209.GY4461@nvishwa1-DESK>
 <4be022cc-518e-49e1-96bd-b9720a313401@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4be022cc-518e-49e1-96bd-b9720a313401@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 08:33:25AM +0100, Tvrtko Ursulin wrote:
>
>
>On 07/06/2022 22:32, Niranjana Vishwanathapura wrote:
>>On Tue, Jun 07, 2022 at 11:18:11AM -0700, Niranjana Vishwanathapura wrote:
>>>On Tue, Jun 07, 2022 at 12:12:03PM -0500, Jason Ekstrand wrote:
>>>> On Fri, Jun 3, 2022 at 6:52 PM Niranjana Vishwanathapura
>>>> <niranjana.vishwanathapura@intel.com> wrote:
>>>>
>>>>   On Fri, Jun 03, 2022 at 10:20:25AM +0300, Lionel Landwerlin wrote:
>>>>   >   On 02/06/2022 23:35, Jason Ekstrand wrote:
>>>>   >
>>>>   >     On Thu, Jun 2, 2022 at 3:11 PM Niranjana Vishwanathapura
>>>>   >     <niranjana.vishwanathapura@intel.com> wrote:
>>>>   >
>>>>   >       On Wed, Jun 01, 2022 at 01:28:36PM -0700, Matthew 
>>>>Brost wrote:
>>>>   >       >On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin
>>>>   wrote:
>>>>   >       >> On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
>>>>   >       >> > +VM_BIND/UNBIND ioctl will immediately start
>>>>   binding/unbinding
>>>>   >       the mapping in an
>>>>   >       >> > +async worker. The binding and unbinding will 
>>>>work like a
>>>>   special
>>>>   >       GPU engine.
>>>>   >       >> > +The binding and unbinding operations are serialized and
>>>>   will
>>>>   >       wait on specified
>>>>   >       >> > +input fences before the operation and will signal the
>>>>   output
>>>>   >       fences upon the
>>>>   >       >> > +completion of the operation. Due to serialization,
>>>>   completion of
>>>>   >       an operation
>>>>   >       >> > +will also indicate that all previous operations 
>>>>are also
>>>>   >       complete.
>>>>   >       >>
>>>>   >       >> I guess we should avoid saying "will immediately start
>>>>   >       binding/unbinding" if
>>>>   >       >> there are fences involved.
>>>>   >       >>
>>>>   >       >> And the fact that it's happening in an async 
>>>>worker seem to
>>>>   imply
>>>>   >       it's not
>>>>   >       >> immediate.
>>>>   >       >>
>>>>   >
>>>>   >       Ok, will fix.
>>>>   >       This was added because in earlier design binding was deferred
>>>>   until
>>>>   >       next execbuff.
>>>>   >       But now it is non-deferred (immediate in that sense). 
>>>>But yah,
>>>>   this is
>>>>   >       confusing
>>>>   >       and will fix it.
>>>>   >
>>>>   >       >>
>>>>   >       >> I have a question on the behavior of the bind 
>>>>operation when
>>>>   no
>>>>   >       input fence
>>>>   >       >> is provided. Let say I do :
>>>>   >       >>
>>>>   >       >> VM_BIND (out_fence=fence1)
>>>>   >       >>
>>>>   >       >> VM_BIND (out_fence=fence2)
>>>>   >       >>
>>>>   >       >> VM_BIND (out_fence=fence3)
>>>>   >       >>
>>>>   >       >>
>>>>   >       >> In what order are the fences going to be signaled?
>>>>   >       >>
>>>>   >       >> In the order of VM_BIND ioctls? Or out of order?
>>>>   >       >>
>>>>   >       >> Because you wrote "serialized I assume it's : in order
>>>>   >       >>
>>>>   >
>>>>   >       Yes, in the order of VM_BIND/UNBIND ioctls. Note that 
>>>>bind and
>>>>   unbind
>>>>   >       will use
>>>>   >       the same queue and hence are ordered.
>>>>   >
>>>>   >       >>
>>>>   >       >> One thing I didn't realize is that because we only get one
>>>>   >       "VM_BIND" engine,
>>>>   >       >> there is a disconnect from the Vulkan specification.
>>>>   >       >>
>>>>   >       >> In Vulkan VM_BIND operations are serialized but 
>>>>per engine.
>>>>   >       >>
>>>>   >       >> So you could have something like this :
>>>>   >       >>
>>>>   >       >> VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
>>>>   >       >>
>>>>   >       >> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
>>>>   >       >>
>>>>   >       >>
>>>>   >       >> fence1 is not signaled
>>>>   >       >>
>>>>   >       >> fence3 is signaled
>>>>   >       >>
>>>>   >       >> So the second VM_BIND will proceed before the 
>>>>first VM_BIND.
>>>>   >       >>
>>>>   >       >>
>>>>   >       >> I guess we can deal with that scenario in 
>>>>userspace by doing
>>>>   the
>>>>   >       wait
>>>>   >       >> ourselves in one thread per engines.
>>>>   >       >>
>>>>   >       >> But then it makes the VM_BIND input fences useless.
>>>>   >       >>
>>>>   >       >>
>>>>   >       >> Daniel : what do you think? Should be rework this or just
>>>>   deal with
>>>>   >       wait
>>>>   >       >> fences in userspace?
>>>>   >       >>
>>>>   >       >
>>>>   >       >My opinion is rework this but make the ordering via 
>>>>an engine
>>>>   param
>>>>   >       optional.
>>>>   >       >
>>>>   >       >e.g. A VM can be configured so all binds are ordered 
>>>>within the
>>>>   VM
>>>>   >       >
>>>>   >       >e.g. A VM can be configured so all binds accept an engine
>>>>   argument
>>>>   >       (in
>>>>   >       >the case of the i915 likely this is a gem context 
>>>>handle) and
>>>>   binds
>>>>   >       >ordered with respect to that engine.
>>>>   >       >
>>>>   >       >This gives UMDs options as the later likely consumes 
>>>>more KMD
>>>>   >       resources
>>>>   >       >so if a different UMD can live with binds being 
>>>>ordered within
>>>>   the VM
>>>>   >       >they can use a mode consuming less resources.
>>>>   >       >
>>>>   >
>>>>   >       I think we need to be careful here if we are looking for some
>>>>   out of
>>>>   >       (submission) order completion of vm_bind/unbind.
>>>>   >       In-order completion means, in a batch of binds and 
>>>>unbinds to be
>>>>   >       completed in-order, user only needs to specify 
>>>>in-fence for the
>>>>   >       first bind/unbind call and the our-fence for the last
>>>>   bind/unbind
>>>>   >       call. Also, the VA released by an unbind call can be 
>>>>re-used by
>>>>   >       any subsequent bind call in that in-order batch.
>>>>   >
>>>>   >       These things will break if binding/unbinding were to 
>>>>be allowed
>>>>   to
>>>>   >       go out of order (of submission) and user need to be extra
>>>>   careful
>>>>   >       not to run into pre-mature triggereing of out-fence and bind
>>>>   failing
>>>>   >       as VA is still in use etc.
>>>>   >
>>>>   >       Also, VM_BIND binds the provided mapping on the specified
>>>>   address
>>>>   >       space
>>>>   >       (VM). So, the uapi is not engine/context specific.
>>>>   >
>>>>   >       We can however add a 'queue' to the uapi which can be 
>>>>one from
>>>>   the
>>>>   >       pre-defined queues,
>>>>   >       I915_VM_BIND_QUEUE_0
>>>>   >       I915_VM_BIND_QUEUE_1
>>>>   >       ...
>>>>   >       I915_VM_BIND_QUEUE_(N-1)
>>>>   >
>>>>   >       KMD will spawn an async work queue for each queue which will
>>>>   only
>>>>   >       bind the mappings on that queue in the order of submission.
>>>>   >       User can assign the queue to per engine or anything 
>>>>like that.
>>>>   >
>>>>   >       But again here, user need to be careful and not 
>>>>deadlock these
>>>>   >       queues with circular dependency of fences.
>>>>   >
>>>>   >       I prefer adding this later an as extension based on 
>>>>whether it
>>>>   >       is really helping with the implementation.
>>>>   >
>>>>   >     I can tell you right now that having everything on a single
>>>>   in-order
>>>>   >     queue will not get us the perf we want.  What vulkan 
>>>>really wants
>>>>   is one
>>>>   >     of two things:
>>>>   >      1. No implicit ordering of VM_BIND ops.  They just happen in
>>>>   whatever
>>>>   >     their dependencies are resolved and we ensure ordering 
>>>>ourselves
>>>>   by
>>>>   >     having a syncobj in the VkQueue.
>>>>   >      2. The ability to create multiple VM_BIND queues.  We need at
>>>>   least 2
>>>>   >     but I don't see why there needs to be a limit besides 
>>>>the limits
>>>>   the
>>>>   >     i915 API already has on the number of engines.  Vulkan could
>>>>   expose
>>>>   >     multiple sparse binding queues to the client if it's not
>>>>   arbitrarily
>>>>   >     limited.
>>>>
>>>>   Thanks Jason, Lionel.
>>>>
>>>>   Jason, what are you referring to when you say "limits the i915 API
>>>>   already
>>>>   has on the number of engines"? I am not sure if there is such an uapi
>>>>   today.
>>>>
>>>> There's a limit of something like 64 total engines today based on the
>>>> number of bits we can cram into the exec flags in execbuffer2.  I think
>>>> someone had an extended version that allowed more but I ripped it out
>>>> because no one was using it.  Of course, execbuffer3 might not 
>>>>have that
>>>> problem at all.
>>>>
>>>
>>>Thanks Jason.
>>>Ok, I am not sure which exec flag is that, but yah, execbuffer3 probably
>>>will not have this limiation. So, we need to define a VM_BIND_MAX_QUEUE
>>>and somehow export it to user (I am thinking of embedding it in
>>>I915_PARAM_HAS_VM_BIND. bits[0]->HAS_VM_BIND, bits[1-3]->'n' meaning 2^n
>>>queues.
>>
>>Ah, I think you are waking about I915_EXEC_RING_MASK (0x3f) which execbuf3
>>will also have. So, we can simply define in vm_bind/unbind structures,
>>
>>#define I915_VM_BIND_MAX_QUEUE   64
>>        __u32 queue;
>>
>>I think that will keep things simple.
>
>Hmmm? What does execbuf2 limit has to do with how many engines 
>hardware can have? I suggest not to do that.
>
>Change with added this:
>
>	if (set.num_engines > I915_EXEC_RING_MASK + 1)
>		return -EINVAL;
>
>To context creation needs to be undone and so let users create engine 
>maps with all hardware engines, and let execbuf3 access them all.
>

Earlier plan was to carry I915_EXEC_RING_MAP (0x3f) to execbuff3 also.
Hence, I was using the same limit for VM_BIND queues (64, or 65 if we
make it N+1).
But, as discussed in other thread of this RFC series, we are planning
to drop this I915_EXEC_RING_MAP in execbuff3. So, there won't be
any uapi that limits the number of engines (and hence the vm_bind queues
need to be supported).

If we leave the number of vm_bind queues to be arbitrarily large
(__u32 queue_idx) then, we need to have a hashmap for queue (a wq,
work_item and a linked list) lookup from the user specified queue index.
Other option is to just put some hard limit (say 64 or 65) and use
an array of queues in VM (each created upon first use). I prefer this.

Niranjana

>Regards,
>
>Tvrtko
>
>>
>>Niranjana
>>
>>>
>>>>   I am trying to see how many queues we need and don't want it to be
>>>>   arbitrarily
>>>>   large and unduely blow up memory usage and complexity in i915 driver.
>>>>
>>>> I expect a Vulkan driver to use at most 2 in the vast majority 
>>>>of cases. I
>>>> could imagine a client wanting to create more than 1 sparse 
>>>>queue in which
>>>> case, it'll be N+1 but that's unlikely.  As far as complexity 
>>>>goes, once
>>>> you allow two, I don't think the complexity is going up by 
>>>>allowing N.  As
>>>> for memory usage, creating more queues means more memory.  That's a
>>>> trade-off that userspace can make.  Again, the expected number 
>>>>here is 1
>>>> or 2 in the vast majority of cases so I don't think you need to worry.
>>>
>>>Ok, will start with n=3 meaning 8 queues.
>>>That would require us create 8 workqueues.
>>>We can change 'n' later if required.
>>>
>>>Niranjana
>>>
>>>>
>>>>   >     Why?  Because Vulkan has two basic kind of bind 
>>>>operations and we
>>>>   don't
>>>>   >     want any dependencies between them:
>>>>   >      1. Immediate.  These happen right after BO creation or 
>>>>maybe as
>>>>   part of
>>>>   >     vkBindImageMemory() or VkBindBufferMemory().  These 
>>>>don't happen
>>>>   on a
>>>>   >     queue and we don't want them serialized with anything.  To
>>>>   synchronize
>>>>   >     with submit, we'll have a syncobj in the VkDevice which is
>>>>   signaled by
>>>>   >     all immediate bind operations and make submits wait on it.
>>>>   >      2. Queued (sparse): These happen on a VkQueue which may be the
>>>>   same as
>>>>   >     a render/compute queue or may be its own queue.  It's up to us
>>>>   what we
>>>>   >     want to advertise.  From the Vulkan API PoV, this is like any
>>>>   other
>>>>   >     queue.  Operations on it wait on and signal semaphores.  If we
>>>>   have a
>>>>   >     VM_BIND engine, we'd provide syncobjs to wait and 
>>>>signal just like
>>>>   we do
>>>>   >     in execbuf().
>>>>   >     The important thing is that we don't want one type of 
>>>>operation to
>>>>   block
>>>>   >     on the other.  If immediate binds are blocking on sparse binds,
>>>>   it's
>>>>   >     going to cause over-synchronization issues.
>>>>   >     In terms of the internal implementation, I know that 
>>>>there's going
>>>>   to be
>>>>   >     a lock on the VM and that we can't actually do these things in
>>>>   >     parallel.  That's fine.  Once the dma_fences have signaled and
>>>>   we're
>>>>
>>>>   Thats correct. It is like a single VM_BIND engine with 
>>>>multiple queues
>>>>   feeding to it.
>>>>
>>>> Right.  As long as the queues themselves are independent and 
>>>>can block on
>>>> dma_fences without holding up other queues, I think we're fine.
>>>>
>>>>   >     unblocked to do the bind operation, I don't care if 
>>>>there's a bit
>>>>   of
>>>>   >     synchronization due to locking.  That's expected.  What 
>>>>we can't
>>>>   afford
>>>>   >     to have is an immediate bind operation suddenly blocking on a
>>>>   sparse
>>>>   >     operation which is blocked on a compute job that's going to run
>>>>   for
>>>>   >     another 5ms.
>>>>
>>>>   As the VM_BIND queue is per VM, VM_BIND on one VM doesn't block the
>>>>   VM_BIND
>>>>   on other VMs. I am not sure about usecases here, but just wanted to
>>>>   clarify.
>>>>
>>>> Yes, that's what I would expect.
>>>> --Jason
>>>>
>>>>   Niranjana
>>>>
>>>>   >     For reference, Windows solves this by allowing arbitrarily many
>>>>   paging
>>>>   >     queues (what they call a VM_BIND engine/queue).  That 
>>>>design works
>>>>   >     pretty well and solves the problems in question.  
>>>>Again, we could
>>>>   just
>>>>   >     make everything out-of-order and require using syncobjs 
>>>>to order
>>>>   things
>>>>   >     as userspace wants. That'd be fine too.
>>>>   >     One more note while I'm here: danvet said something on 
>>>>IRC about
>>>>   VM_BIND
>>>>   >     queues waiting for syncobjs to materialize.  We don't really
>>>>   want/need
>>>>   >     this.  We already have all the machinery in userspace to handle
>>>>   >     wait-before-signal and waiting for syncobj fences to 
>>>>materialize
>>>>   and
>>>>   >     that machinery is on by default.  It would actually 
>>>>take MORE work
>>>>   in
>>>>   >     Mesa to turn it off and take advantage of the kernel 
>>>>being able to
>>>>   wait
>>>>   >     for syncobjs to materialize.  Also, getting that right is
>>>>   ridiculously
>>>>   >     hard and I really don't want to get it wrong in kernel 
>>>>space.     When we
>>>>   >     do memory fences, wait-before-signal will be a thing.  We don't
>>>>   need to
>>>>   >     try and make it a thing for syncobj.
>>>>   >     --Jason
>>>>   >
>>>>   >   Thanks Jason,
>>>>   >
>>>>   >   I missed the bit in the Vulkan spec that we're allowed to have a
>>>>   sparse
>>>>   >   queue that does not implement either graphics or compute 
>>>>operations
>>>>   :
>>>>   >
>>>>   >     "While some implementations may include
>>>>   VK_QUEUE_SPARSE_BINDING_BIT
>>>>   >     support in queue families that also include
>>>>   >
>>>>   >      graphics and compute support, other implementations may only
>>>>   expose a
>>>>   >     VK_QUEUE_SPARSE_BINDING_BIT-only queue
>>>>   >
>>>>   >      family."
>>>>   >
>>>>   >   So it can all be all a vm_bind engine that just does bind/unbind
>>>>   >   operations.
>>>>   >
>>>>   >   But yes we need another engine for the immediate/non-sparse
>>>>   operations.
>>>>   >
>>>>   >   -Lionel
>>>>   >
>>>>   >         >
>>>>   >       Daniel, any thoughts?
>>>>   >
>>>>   >       Niranjana
>>>>   >
>>>>   >       >Matt
>>>>   >       >
>>>>   >       >>
>>>>   >       >> Sorry I noticed this late.
>>>>   >       >>
>>>>   >       >>
>>>>   >       >> -Lionel
>>>>   >       >>
>>>>   >       >>
