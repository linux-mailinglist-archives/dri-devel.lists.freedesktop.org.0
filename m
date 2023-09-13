Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14FC79EC6D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 17:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8556C10E0E4;
	Wed, 13 Sep 2023 15:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4C010E0E4;
 Wed, 13 Sep 2023 15:17:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C9AB6607335;
 Wed, 13 Sep 2023 16:17:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694618252;
 bh=Z2RhB60jI7ghIqdXBwk4c69L9GANfM8C50xL7KrTZHY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kZQG/AX3uSqlfXilPqFHgEnW4cEQv+khUKW351NcItEjQ+N5Wn9UhyKN3+0yqnWv9
 B9VE1gvd5oUzZTtH9CwMJi9jz0b3OLbgvmsrKPfY4WvyQ58H0zSviN/B88S5Ai1vht
 j+gpq92bXcko5J2X/1AUv1/GRj3CHh3ToCHGzflASQ8xebggs10HUY5vrRjI2OJIEg
 wqN+WdsmozjxGnH/IVSfamolm5rimD93xcMDOosahle0jhvln+ik5qRnjxmSKIFuQA
 00Aq7tNClGIdznN0L4YprBzsUCMSUJ9NhGqWBw7If//+3sSLOgoKt7lWB2ANfc9ZEz
 +DkaO/x+Dttkg==
Date: Wed, 13 Sep 2023 17:17:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <20230913171728.5a6ea8bf@collabora.com>
In-Reply-To: <6c658492-9a78-cb70-7d6e-e6d786212ccc@linux.intel.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <20230913090311.5eeb026a@collabora.com>
 <CAPM=9tyf4m6gtUQ0BCraf0gB06_pxXV8gpQQsvWjeJnczmJkQQ@mail.gmail.com>
 <20230913091918.62c06a30@collabora.com>
 <df85257a-02ed-4869-2421-0039a9c97db5@linux.intel.com>
 <20230913133318.15edec7c@collabora.com>
 <6f4c047d-0e6d-c45b-3092-cd0bc84849dc@linux.intel.com>
 <20230913160148.4d941975@collabora.com>
 <6c658492-9a78-cb70-7d6e-e6d786212ccc@linux.intel.com>
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

On Wed, 13 Sep 2023 16:29:30 +0200
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> On 9/13/23 16:01, Boris Brezillon wrote:
> > On Wed, 13 Sep 2023 15:22:56 +0200
> > Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> > =20
> >> On 9/13/23 13:33, Boris Brezillon wrote: =20
> >>> On Wed, 13 Sep 2023 12:39:01 +0200
> >>> Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> >>>    =20
> >>>> Hi,
> >>>>
> >>>> On 9/13/23 09:19, Boris Brezillon wrote: =20
> >>>>> On Wed, 13 Sep 2023 17:05:42 +1000
> >>>>> Dave Airlie <airlied@gmail.com> wrote:
> >>>>>       =20
> >>>>>> On Wed, 13 Sept 2023 at 17:03, Boris Brezillon
> >>>>>> <boris.brezillon@collabora.com> wrote: =20
> >>>>>>> On Tue, 12 Sep 2023 18:20:32 +0200
> >>>>>>> Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> >>>>>>>          =20
> >>>>>>>>> +/**
> >>>>>>>>> + * get_next_vm_bo_from_list() - get the next vm_bo element
> >>>>>>>>> + * @__gpuvm: The GPU VM
> >>>>>>>>> + * @__list_name: The name of the list we're iterating on
> >>>>>>>>> + * @__local_list: A pointer to the local list used to store al=
ready iterated items
> >>>>>>>>> + * @__prev_vm_bo: The previous element we got from drm_gpuvm_g=
et_next_cached_vm_bo()
> >>>>>>>>> + *
> >>>>>>>>> + * This helper is here to provide lockless list iteration. Loc=
kless as in, the
> >>>>>>>>> + * iterator releases the lock immediately after picking the fi=
rst element from
> >>>>>>>>> + * the list, so list insertion deletion can happen concurrentl=
y. =20
> >>>>>>>> Are the list spinlocks needed for that async state update from w=
ithin
> >>>>>>>> the dma-fence critical section we've discussed previously? =20
> >>>>>>> Any driver calling _[un]link() from its drm_gpu_scheduler::run_jo=
b()
> >>>>>>> hook will be in this situation (Panthor at the moment, PowerVR so=
on). I
> >>>>>>> get that Xe and Nouveau don't need that because they update the VM
> >>>>>>> state early (in the ioctl path), but I keep thinking this will hu=
rt us
> >>>>>>> if we don't think it through from the beginning, because once you=
've
> >>>>>>> set this logic to depend only on resv locks, it will be pretty ha=
rd to
> >>>>>>> get back to a solution which lets synchronous VM_BINDs take prece=
dence
> >>>>>>> on asynchronous request, and, with vkQueueBindSparse() passing ex=
ternal
> >>>>>>> deps (plus the fact the VM_BIND queue might be pretty deep), it c=
an
> >>>>>>> take a long time to get your synchronous VM_BIND executed... =20
> >>>> So this would boil down to either (possibly opt-in) keeping the spin=
lock
> >>>> approach or pushing the unlink out to a wq then? =20
> >>> Deferred _unlink() would not be an issue, since I already defer the
> >>> drm_gpuva destruction to a wq, it would just a be a matter of moving =
the
> >>> _unlink() call there as well. But _link() also takes the GEM gpuva li=
st
> >>> lock, and that one is bit tricky, in that sm_map() can trigger 2 more
> >>> _link() calls for the prev/next mappings, which we can't guess until =
we
> >>> get to execute the VM update. If we mandate the use of the GEM resv
> >>> lock, that simply means async VM updates (AKA calling
> >>> drm_gpuvm_sm_[un]map()) are not an option. And if this is what everyo=
ne
> >>> agrees on, then I'd like the APIs that make this sort of async VM
> >>> update possible (drm_gpuvm_sm_[un]map(), the drm_gpuvm_ops::sm_step*
> >>> methods, and probably other things) to be dropped, so we don't make it
> >>> look like it's something we support.
> >>>    =20
> >>>> BTW, as also asked in a reply to Danilo, how do you call unlink from
> >>>> run_job() when it was requiring the obj->dma_resv lock, or was that =
a WIP? =20
> >>> _unlink() makes sure the GEM gpuva list lock is taken, but this can be
> >>> a custom lock (see drm_gem_gpuva_set_lock()). In panthor we have
> >>> panthor_gem_object::gpuva_list_lock that's dedicated the gpuva list
> >>> protection. We make sure we never take this lock while allocating
> >>> memory to guarantee the dma-signalling path can't deadlock.
> >>>    =20
> >>>>>>>          =20
> >>>>>> btw what is the use case for this? do we have actual vulkan
> >>>>>> applications we know will have problems here? =20
> >>>>> I don't, but I think that's a concern Faith raised at some point (d=
ates
> >>>>> back from when I was reading threads describing how VM_BIND on i915
> >>>>> should work, and I was clearly discovering this whole VM_BIND thing=
 at
> >>>>> that time, so maybe I misunderstood).
> >>>>>       =20
> >>>>>> it feels like a bit of premature optimisation, but maybe we have u=
se cases. =20
> >>>>> Might be, but that's the sort of thing that would put us in a corne=
r if
> >>>>> we don't have a plan for when the needs arise. Besides, if we don't
> >>>>> want to support that case because it's too complicated, I'd recomme=
nd
> >>>>> dropping all the drm_gpuvm APIs that let people think this mode is
> >>>>> valid/supported (map/remap/unmap hooks in drm_gpuvm_ops,
> >>>>> drm_gpuvm_sm_[un]map helpers, etc). Keeping them around just adds t=
o the
> >>>>> confusion. =20
> >>>> Xe allows bypassing the bind-queue with another bind-queue, but to
> >>>> completely avoid dependencies between queues the Operations may not
> >>>> overlap. =20
> >>> So, you check the VM state with some VM lock held (would be the VM re=
sv
> >>> in my case), and if the mapping is new (no overlaps with pre-existing
> >>> mappings), you queue it to the fast-track/sync-VM_BIND queue. What wo=
uld
> >>> be missing I guess is a way to know if the mapping is active (MMU has
> >>> been updated) or pending (MMU update queued to the bind-queue), so I =
can
> >>> fast-track mapping/unmapping of active mappings. This would leave
> >>> overlapping sync/async VM updates, which can't happen in practice
> >>> unless userspace is doing something wrong (sparse bindings always go
> >>> through vkQueueBindSparse). =20
> >> User-space is allowed to create new bind queues at will, and they
> >> execute independently save for range overlaps. =20
> > I've limited panthor to just one bind-queue that's automatically
> > created when the VM is created. I guess letting userspace create more
> > than one queue is doable, but we'd still be serializing VM
> > operations anyway and that complicates the whole thing when concurrent
> > operations to the same VM region happen from different bind queues, so I
> > figured it'd be simpler to expose just one queue.
> > =20
> >> And the overlapping granularity depends very much on the detail of the
> >> range tracking.
> >> We drafted this fenced range utility
> >>
> >> https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/353
> >>
> >> That tracks active ranges that remove themselves when the attached fen=
ce
> >> signals. Not sure if we ended up using it, though. A new binding would
> >> scan this utility for dma-fences it needs to depend upon. =20
> > Sounds like implicit deps on VM ranges :D. I'll have a look, thanks
> > for the pointer!
> > =20
> >> Ranges in Xe
> >> are actually page-table modification ranges, so can exceed the actual =
VA
> >> range in some situations, but if you can build page-table structures
> >> async the granularity indeed becomes better. =20
> > The granularity in Mali is 4k, and we don't build the page table struct
> > asynchronously, we just update the page table tree from the CPU,
> > holding a VM lock to serialize such operations (that's done
> > synchronously in the ::run_job() path, or from the ioctl in case of a
> > sync-VM_BIND). =20
>=20
> OK, yeah we have something similar although we build the page-table tree=
=20
> in the IOCTL and update entries using the GPU unless there are no=20
> dependencies,

We can't do that since we defer pgtable updates to the io-pgtable
framework, which handles the pgtable tree update (we can't pass a
pre-built version of the tree). What we did though, is extend the
framework so we're in control of the page table allocations. In order
to avoid allocations in the dma-signalling path, we pre-allocate page
tables for the range we want to map (or unmap), and then pick from these
pre-allocated pages when the iopgtable frameworks asks us to allocate a
page table. Until now, we were provisioning for the worst case scenario
(all levels of the page table tree are missing, except for the root
level, which is allocated when the io-pgtable is instantiated). With
per-range operation tracking, we could potentially avoid this
over-provisioning by checking the queue of operations touching a
specific range, and making sure unmaps don't teardown page tables if we
now they're going to be needed later on (we just want to update PTEs
in that case).

> in which case we do it sync in the ioctl as well.
>=20
> The drawback here is that if one op adds a pagetable tree node near the=20
> root (spanning say 1G) and the next op adds an entry to that node, the=20
> granularity can become pretty large...

I know nothing about the intel GPU MMU page table format, but I guess
you're talking about adding one or more levels to the pgtable tree
because some big physically contiguous mapping is split, which indeed
might require allocating page tables and filling a lot of PTEs. This
change of granularity indeed has a cost, and avoiding repeated changes
would indeed be preferable, but it's not the end of the world for
Panthor, where we only use 4k and 2M granules (only the last level is
optional in our implementation).
