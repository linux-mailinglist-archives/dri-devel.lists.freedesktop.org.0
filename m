Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C1D7A0974
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 17:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7ACE10E1A9;
	Thu, 14 Sep 2023 15:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ACA10E144;
 Thu, 14 Sep 2023 15:37:26 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E1AFF660734B;
 Thu, 14 Sep 2023 16:37:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694705845;
 bh=TQbpv8vHzEEc4Jv5PirNSqWfWBrF0+Zj/8K0ohiEBWU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FnYHLVV8Y+XCR2nU5T1akcRhS4g00GcXKA9cSGiy2iDYCBVMsVJd8E6VjOHEBSJ0U
 3xtb/cOUeBLmtEB32OkhfOaNdG5rDrQRi78WUIcfgf9TFMFdLkI70KroQP2MoDDR3x
 5CU9dkt070t3M5vHuV5DoQXavbKXyTWjr9LosrJqptPcObxjOtKceCBzrQ0UaJhXLf
 bWBeWNzi+S8UkttePU7koXyOZv7jpsVZC6B+QedFzYvb1miCBXz7bNehU1TvbJIcSH
 voFCluEfEOf7QTwUfGWC2s/sTiHQjauJgd0jF2zVURUrzoIOQqCDZ9qulIxAMAXGg1
 2nZXh38pF8jRA==
Date: Thu, 14 Sep 2023 17:37:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <20230914173722.0acb980b@collabora.com>
In-Reply-To: <d06a667e-145d-5aab-d31b-8b87742c4a56@linux.intel.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <20230913090311.5eeb026a@collabora.com>
 <CAPM=9tyf4m6gtUQ0BCraf0gB06_pxXV8gpQQsvWjeJnczmJkQQ@mail.gmail.com>
 <20230913091918.62c06a30@collabora.com>
 <df85257a-02ed-4869-2421-0039a9c97db5@linux.intel.com>
 <20230913133318.15edec7c@collabora.com>
 <6f4c047d-0e6d-c45b-3092-cd0bc84849dc@linux.intel.com>
 <20230914102010.628ea823@collabora.com>
 <c32bb890-b06e-6b5d-1ff8-b67f6c9d92a6@linux.intel.com>
 <20230914135439.3bec8eca@collabora.com>
 <d06a667e-145d-5aab-d31b-8b87742c4a56@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Sep 2023 15:33:50 +0200
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> Hi,
>=20
> On 9/14/23 13:54, Boris Brezillon wrote:
> > On Thu, 14 Sep 2023 12:45:44 +0200
> > Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> > =20
> >> On 9/14/23 10:20, Boris Brezillon wrote: =20
> >>> On Wed, 13 Sep 2023 15:22:56 +0200
> >>> Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> >>>    =20
> >>>> On 9/13/23 13:33, Boris Brezillon wrote: =20
> >>>>> On Wed, 13 Sep 2023 12:39:01 +0200
> >>>>> Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> >>>>>       =20
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 9/13/23 09:19, Boris Brezillon wrote: =20
> >>>>>>> On Wed, 13 Sep 2023 17:05:42 +1000
> >>>>>>> Dave Airlie <airlied@gmail.com> wrote:
> >>>>>>>          =20
> >>>>>>>> On Wed, 13 Sept 2023 at 17:03, Boris Brezillon
> >>>>>>>> <boris.brezillon@collabora.com> wrote: =20
> >>>>>>>>> On Tue, 12 Sep 2023 18:20:32 +0200
> >>>>>>>>> Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> >>>>>>>>>             =20
> >>>>>>>>>>> +/**
> >>>>>>>>>>> + * get_next_vm_bo_from_list() - get the next vm_bo element
> >>>>>>>>>>> + * @__gpuvm: The GPU VM
> >>>>>>>>>>> + * @__list_name: The name of the list we're iterating on
> >>>>>>>>>>> + * @__local_list: A pointer to the local list used to store =
already iterated items
> >>>>>>>>>>> + * @__prev_vm_bo: The previous element we got from drm_gpuvm=
_get_next_cached_vm_bo()
> >>>>>>>>>>> + *
> >>>>>>>>>>> + * This helper is here to provide lockless list iteration. L=
ockless as in, the
> >>>>>>>>>>> + * iterator releases the lock immediately after picking the =
first element from
> >>>>>>>>>>> + * the list, so list insertion deletion can happen concurren=
tly. =20
> >>>>>>>>>> Are the list spinlocks needed for that async state update from=
 within
> >>>>>>>>>> the dma-fence critical section we've discussed previously? =20
> >>>>>>>>> Any driver calling _[un]link() from its drm_gpu_scheduler::run_=
job()
> >>>>>>>>> hook will be in this situation (Panthor at the moment, PowerVR =
soon). I
> >>>>>>>>> get that Xe and Nouveau don't need that because they update the=
 VM
> >>>>>>>>> state early (in the ioctl path), but I keep thinking this will =
hurt us
> >>>>>>>>> if we don't think it through from the beginning, because once y=
ou've
> >>>>>>>>> set this logic to depend only on resv locks, it will be pretty =
hard to
> >>>>>>>>> get back to a solution which lets synchronous VM_BINDs take pre=
cedence
> >>>>>>>>> on asynchronous request, and, with vkQueueBindSparse() passing =
external
> >>>>>>>>> deps (plus the fact the VM_BIND queue might be pretty deep), it=
 can
> >>>>>>>>> take a long time to get your synchronous VM_BIND executed... =20
> >>>>>> So this would boil down to either (possibly opt-in) keeping the sp=
inlock
> >>>>>> approach or pushing the unlink out to a wq then? =20
> >>>>> Deferred _unlink() would not be an issue, since I already defer the
> >>>>> drm_gpuva destruction to a wq, it would just a be a matter of movin=
g the
> >>>>> _unlink() call there as well. But _link() also takes the GEM gpuva =
list
> >>>>> lock, and that one is bit tricky, in that sm_map() can trigger 2 mo=
re
> >>>>> _link() calls for the prev/next mappings, which we can't guess unti=
l we
> >>>>> get to execute the VM update. If we mandate the use of the GEM resv
> >>>>> lock, that simply means async VM updates (AKA calling
> >>>>> drm_gpuvm_sm_[un]map()) are not an option. And if this is what ever=
yone
> >>>>> agrees on, then I'd like the APIs that make this sort of async VM
> >>>>> update possible (drm_gpuvm_sm_[un]map(), the drm_gpuvm_ops::sm_step*
> >>>>> methods, and probably other things) to be dropped, so we don't make=
 it
> >>>>> look like it's something we support.
> >>>>>       =20
> >>>>>> BTW, as also asked in a reply to Danilo, how do you call unlink fr=
om
> >>>>>> run_job() when it was requiring the obj->dma_resv lock, or was tha=
t a WIP? =20
> >>>>> _unlink() makes sure the GEM gpuva list lock is taken, but this can=
 be
> >>>>> a custom lock (see drm_gem_gpuva_set_lock()). In panthor we have
> >>>>> panthor_gem_object::gpuva_list_lock that's dedicated the gpuva list
> >>>>> protection. We make sure we never take this lock while allocating
> >>>>> memory to guarantee the dma-signalling path can't deadlock.
> >>>>>       =20
> >>>>>>>>>             =20
> >>>>>>>> btw what is the use case for this? do we have actual vulkan
> >>>>>>>> applications we know will have problems here? =20
> >>>>>>> I don't, but I think that's a concern Faith raised at some point =
(dates
> >>>>>>> back from when I was reading threads describing how VM_BIND on i9=
15
> >>>>>>> should work, and I was clearly discovering this whole VM_BIND thi=
ng at
> >>>>>>> that time, so maybe I misunderstood).
> >>>>>>>          =20
> >>>>>>>> it feels like a bit of premature optimisation, but maybe we have=
 use cases. =20
> >>>>>>> Might be, but that's the sort of thing that would put us in a cor=
ner if
> >>>>>>> we don't have a plan for when the needs arise. Besides, if we don=
't
> >>>>>>> want to support that case because it's too complicated, I'd recom=
mend
> >>>>>>> dropping all the drm_gpuvm APIs that let people think this mode is
> >>>>>>> valid/supported (map/remap/unmap hooks in drm_gpuvm_ops,
> >>>>>>> drm_gpuvm_sm_[un]map helpers, etc). Keeping them around just adds=
 to the
> >>>>>>> confusion. =20
> >>>>>> Xe allows bypassing the bind-queue with another bind-queue, but to
> >>>>>> completely avoid dependencies between queues the Operations may not
> >>>>>> overlap. =20
> >>>>> So, you check the VM state with some VM lock held (would be the VM =
resv
> >>>>> in my case), and if the mapping is new (no overlaps with pre-existi=
ng
> >>>>> mappings), you queue it to the fast-track/sync-VM_BIND queue. What =
would
> >>>>> be missing I guess is a way to know if the mapping is active (MMU h=
as
> >>>>> been updated) or pending (MMU update queued to the bind-queue), so =
I can
> >>>>> fast-track mapping/unmapping of active mappings. =20
> >>> Ok, so I started modifying the implementation, and quickly realized t=
he
> >>> overlap test can't be done without your xe_range_fence tree because of
> >>> unmaps. Since we call drm_gpuva_unmap() early/in the IOCTL path (IOW,
> >>> before the mapping teardown is effective), we lose track of this
> >>> yet-to-be-executed-unmap operation, and if we do our
> >>> va_range_overlaps_with_existing_mappings() test after such an unmap h=
as
> >>> been queued using just the drm_gpuvm tree, we might get false even if
> >>> the mapping still exists and is expected to be torn down when the
> >>> VM_BIND(unmap) job is executed on the bind-queue. As a result, this
> >>> might execute the VM_BIND(map,sync) immediately (because the dependen=
cy
> >>> went undetected), and then the vm_bind_run_job() function kicks in and
> >>> undoes what the synchronous VM_BIND(map) did. Am I missing something?
> >>>
> >>> If I'm correct, that means I'm back to having synchronous VM_BIND ops
> >>> queued after all asynchronous ones unless I use something like your
> >>> xe_range_fence solution (which I was hoping I could postpone until we
> >>> decide to expose multiple bind queues). =20
> >> Yes, unfortunately fine-granular async range-tracking comes with a cos=
t.
> >> Still, if you are doing page-table updates solely with the CPU, you
> >> could probably short-circuit the fence part of the fenced ranges? =20
> > I'm doing it with the CPU, but asynchronously (bind-queue), so I'm
> > facing pretty much the same problems, I think.
> > =20
> >> =20
> >>> I'm still a bit skeptical about this 'update VM mappings tree early,
> >>> defer MMU page table updates' approach, where the VM state and the
> >>> actual page table tree are temporarily out of sync until all operatio=
ns
> >>> have been flushed on all queues targeting a VM. This means any test we
> >>> do on the gpuvm, like, 'give me the BO mapped at VA xxx', is subject =
to
> >>> 'is this the current state or the future state?' questioning. Note th=
at
> >>> we can't even get the current VM state anymore, because all the
> >>> drm_gpuvm::tree stores with this solution is the future state, and
> >>> to-be-unmapped mappings are lost during the transitioning period (when
> >>> vm_bind jobs are queued but not executed yet). =20
> >> Understandable. But this is the way we historically have been doing
> >> things, (I think the whole async atomic page-flipping is using the same
> >> concept), but rather than refering to it as current state and future
> >> state, I'd like to think it as Synchronous CPU state (What an API user
> >> sees) vs GPU state (What the GPU sees where it's currently executing).=
 =20
> > Actually, the latency incurred by the fact the page table updates are
> > done by the GPU is one thing, and I guess I could agree with you if that
> > was the only difference between the GPU and CPU view. But the fact
> > VM_BIND jobs can have external dependencies makes things a lot more
> > confusing. I might be wrong, but I think atomic page-flip is simpler.
> > Yes you can have implicit deps on your scanout buffer, and yes the HW
> > will wait for these fences to signal before updating the plane pointer,
> > but that's still just a simple pipeline with one resource to deal with.
> > A VM is a whole range with virtual memory regions being attached
> > physical mem chunks, possibly with each range having its own lifecycle,
> > etc. It'd make more sense to me to have a way to know the current
> > state, and the future state. =20
>=20
> Yeah so in Xe we support async bind jobs solely to be able to do deep=20
> pipelining and it's not only the pagetable jobs, You could have multiple=
=20
> bind-evict-restore-exec-unbind-bind-evict-restore-exec all piplelined=20
> and only the available memory resources sets the limit. In fact you can=20
> even have physical VRAM assigned to a bo which won't be used until exec=20
> #5 in the pipeline and released in exec #4 since TTM is aware of async=20
> memory management.
>=20
> So something needs to absorb the state discrepancy between what you=20
> refer to as the current state and the future state. The question is what=
=20
> should absorb it? Should it be the gpuvm or some associated driver state=
=20
> tracking?

That's exactly what I'd like to sort out.

>=20
> Now let's say that you have a deferred bind state-update pending and=20
> track the *current* state in the gpuvm so that a number of vma unmaps=20
> and maps aren't yet visible to gpuvm and then you submit an exec ioctl.=20
> How does the exec ioctl know the gpuvm state?

A tree of pending VM ops, ordered per VA-range, with overlapping
allowed (to support pipelining), who are assigned fence objects? With
the fence + explicit deps passed to a job, we should know which extra
extobjs to add to the currently mapped extobjs. But I wasn't even
considering something as complex. Extobjs can be added early, even
before the mapping is active (that's what I was doing in my previous
PoC, using the async VM update model). Same goes for evicted BOs, they
can be re-pinned early. The only downside is that we might force BO
residency to last longer than strictly needed (because we'd be adding
our GPU job fence to extobjs we don't necessarily need if these extobjs
end up being mapped after the GPU job is executed, which can happen if
the deps passed to VM_BIND prevent its execution).

> Like external bos to=20
> validate or bos that become evicted, userptr vmas that have been=20
> invalidated? Does the exec need to block waiting for the bind fence to=20
> complete so that it can assess the VM state that UMD intended to be there?

I'd say no, given the GPU job added its fence to the VM resv and all
extobjs resvs. If a mapping update is queued, it should be waiting for
the job using the previous mapping to complete, thus making BO
retrieval from an exception path okay (and when I say exception path, I
intentionally exclude any allocation requests, because those would need
extra precautions, like non-blocking allocation, and I don't even want
to think about it at the moment).

>=20
> >
> > Just one example, say you have a GPU job that triggers some fault
> > that's supposed to be handled by the kernel driver to unblock the
> > situation. In order to have some context, the kernel driver needs to
> > read a GPU buffer that's passed back as a virtual address by the GPU/FW,
> > so it calls drm_gpuvm_bo_find(), and now it might potentially get a BO
> > that's not the current BO being mapped at this address, but the future
> > BO after some asynchronous VM_BIND(map) has been executed, and of
> > course, the VM_BIND job leading to this future state, could have a
> > dependency on the GPU job, because this GPU job was using the old
> > mapping. It might sound completely hypothetical, but that's actually
> > the sort of things the Mali FW does in a few occasions. =20
>=20
> Recoverable faults are typically requiring some sort of memory operation=
=20
> that requires the dma_resv or outer lock, like validation or=20
> get_user_pages(), and can thus not be performed in the fence signalling=20
> critical path and on Xe they are reserved for Long-Running VMs. On=20
> those, pipelining is not really needed and is disallowed in Xe to avoid=20
> having to deal with the state discrepancy.

I intentionally didn't take the map/alloc-on-fault example, because
that one is bit complicated, and we don't need it (at least not yet).

>=20
> But to the actual problem you mention, let's say its a fault that=20
> triggers a need to dump bo contents, then yes in order to be able to do=20
> deep pipelining in this way the driver needs to track some state=20
> discrepancy, and that's an additional overhead.

Yes, more something like that.

>=20
> >
> > So yeah, I'm still not convinced we can always get away with just the
> > future representation of the VM. Sometimes you have to know what's
> > mapped at the moment.
> > =20
> >> To bring them in sync you need to wait for fences. =20
> > Wouldn't solve the case I mentioned above, AFAICT.
> > =20
> >> And ideally the async
> >> work should never fail. =20
> > Sure, that I considered for granted. If async VM_BIND fails, we just
> > flag the VM as unusable, and cancel any GPU job submission happening on
> > the VM. The user then has to recreate the VM to take a fresh start
> > (DEVICE_LOST situation).
> >
> > It a bit tricky when we want to clean things up after a failure,
> > because we might have lost track of some of mappings (early
> > gpuva_unmap(), but the MMU page tables are still lying around). In our
> > case (Panthor) that's not really an issue though, because
> > free_io_pgtable_ops() will take care of that for us.
> > =20
> >> If one wants to push async work out to be handled solely by the GPU,
> >> this is the way things must be done since the GPU can't take locks or
> >> allocate memory, but as part or all of async work is sometimes done
> >> using the CPU, it might make sense to challenge that to some extent. =
=20
> > I think updating the VM state in the run_job() with drm_gpuva_[un]map()
> > would still account for the GPU-is-executing-pgtable-updates latency,
> > and that's not really the sort of desynchronization I'm worried about,
> > because when you get to submit your VM_BIND job, you know all the job
> > deps are met, and the VM update is about to happen. What I'm worried
> > about is the desynchronization incurred by complex VM_BIND job deps
> > that make it hard to know what's the diff between the drm_gpuvm state
> > (predicting the future) and the VM state a GPU job expects (the
> > present). =20
>=20
> Yes that sort of deep pipeling requires additional "current" state=20
> tracking for some situations, but waiting in exec for the current state=20
> to catch up with future state, which it seems is a consequence of async=20
> state updates, isn't really an option for us.

I wasn't really considering waits as an option, and I do intend to
pipeline VM_BIND and GPU jobs, with deps taking care of further
ordering constraints. What I had in mind was more a way to retrieve the
future state from the current state + a list of diffs. Actually I don't
even mind doing it the other way around (retrieving the current state
from the future state plus a list of pending operations reverted),
because such exceptions are rare enough that we can accept the extra
cost. My point was, having just the future state doesn't always work,
and there's currently no way we can have a list of diffs to revert,
because we lose track of some operations, like unmaps.

>=20
> Now if you think the decision to remove those spinlocks from drm_gpuvm=20
> was premature, I'm fully OK to have them in there again, but opt-in so=20
> that we have helpers that fit all purposes.

Well, with the dual-mode APIs, at least the driver could decide what
the drm_gpuvm state was encoding (current if you call
drm_gpuva_[un]map() from the run_job() path, or future if you do it
from the the IOCTL/submit path). With the new model, that's no longer
an option. But even the new model could work out, if I have way to get
the current state from the future state, I was just hoping we could
make this logic generic...

