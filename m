Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1279EA5A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 16:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7D610E4C5;
	Wed, 13 Sep 2023 14:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CA910E4C4;
 Wed, 13 Sep 2023 14:01:52 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D09266072F4;
 Wed, 13 Sep 2023 15:01:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694613711;
 bh=Mwd//y8kHHQGgFxOxx8+av5f6FESInoaEQ4FowrvBRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d1gHAJA7me5QINpy/fe01qCDBjK6a3k8ZGjHTlZRJMsss8iNaPNzzed/8q67Ej39k
 tn2wBThiIyRHWTp5Ftq50mo5RRPWGF8n0ar4P4xfA1g2gnAsk2v0Z80SCc40D/7vWz
 hxNlHOIIX9OcORdPPDNy/TG5uv6tD2jXmYCI+fmAm9RYdYMY7Hw7UBKaIcpo3Ci5lX
 ZQcXG6wdt2rlfDPljmGaz43yMezvMLidAiwndcAlRE1l3N/IDJ3iCzMnhTjKF8QWwq
 QSzTdpjGaGcPw67BdXW4C3B3rdzxbW4v6tvlDgDBjWq/P54oCm1KzUiFlakMKgyB8O
 XYIOszqbo10gg==
Date: Wed, 13 Sep 2023 16:01:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <20230913160148.4d941975@collabora.com>
In-Reply-To: <6f4c047d-0e6d-c45b-3092-cd0bc84849dc@linux.intel.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <20230913090311.5eeb026a@collabora.com>
 <CAPM=9tyf4m6gtUQ0BCraf0gB06_pxXV8gpQQsvWjeJnczmJkQQ@mail.gmail.com>
 <20230913091918.62c06a30@collabora.com>
 <df85257a-02ed-4869-2421-0039a9c97db5@linux.intel.com>
 <20230913133318.15edec7c@collabora.com>
 <6f4c047d-0e6d-c45b-3092-cd0bc84849dc@linux.intel.com>
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

On Wed, 13 Sep 2023 15:22:56 +0200
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> On 9/13/23 13:33, Boris Brezillon wrote:
> > On Wed, 13 Sep 2023 12:39:01 +0200
> > Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> > =20
> >> Hi,
> >>
> >> On 9/13/23 09:19, Boris Brezillon wrote: =20
> >>> On Wed, 13 Sep 2023 17:05:42 +1000
> >>> Dave Airlie <airlied@gmail.com> wrote:
> >>>    =20
> >>>> On Wed, 13 Sept 2023 at 17:03, Boris Brezillon
> >>>> <boris.brezillon@collabora.com> wrote: =20
> >>>>> On Tue, 12 Sep 2023 18:20:32 +0200
> >>>>> Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> >>>>>       =20
> >>>>>>> +/**
> >>>>>>> + * get_next_vm_bo_from_list() - get the next vm_bo element
> >>>>>>> + * @__gpuvm: The GPU VM
> >>>>>>> + * @__list_name: The name of the list we're iterating on
> >>>>>>> + * @__local_list: A pointer to the local list used to store alre=
ady iterated items
> >>>>>>> + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get=
_next_cached_vm_bo()
> >>>>>>> + *
> >>>>>>> + * This helper is here to provide lockless list iteration. Lockl=
ess as in, the
> >>>>>>> + * iterator releases the lock immediately after picking the firs=
t element from
> >>>>>>> + * the list, so list insertion deletion can happen concurrently.=
 =20
> >>>>>> Are the list spinlocks needed for that async state update from wit=
hin
> >>>>>> the dma-fence critical section we've discussed previously? =20
> >>>>> Any driver calling _[un]link() from its drm_gpu_scheduler::run_job()
> >>>>> hook will be in this situation (Panthor at the moment, PowerVR soon=
). I
> >>>>> get that Xe and Nouveau don't need that because they update the VM
> >>>>> state early (in the ioctl path), but I keep thinking this will hurt=
 us
> >>>>> if we don't think it through from the beginning, because once you've
> >>>>> set this logic to depend only on resv locks, it will be pretty hard=
 to
> >>>>> get back to a solution which lets synchronous VM_BINDs take precede=
nce
> >>>>> on asynchronous request, and, with vkQueueBindSparse() passing exte=
rnal
> >>>>> deps (plus the fact the VM_BIND queue might be pretty deep), it can
> >>>>> take a long time to get your synchronous VM_BIND executed... =20
> >> So this would boil down to either (possibly opt-in) keeping the spinlo=
ck
> >> approach or pushing the unlink out to a wq then? =20
> > Deferred _unlink() would not be an issue, since I already defer the
> > drm_gpuva destruction to a wq, it would just a be a matter of moving the
> > _unlink() call there as well. But _link() also takes the GEM gpuva list
> > lock, and that one is bit tricky, in that sm_map() can trigger 2 more
> > _link() calls for the prev/next mappings, which we can't guess until we
> > get to execute the VM update. If we mandate the use of the GEM resv
> > lock, that simply means async VM updates (AKA calling
> > drm_gpuvm_sm_[un]map()) are not an option. And if this is what everyone
> > agrees on, then I'd like the APIs that make this sort of async VM
> > update possible (drm_gpuvm_sm_[un]map(), the drm_gpuvm_ops::sm_step*
> > methods, and probably other things) to be dropped, so we don't make it
> > look like it's something we support.
> > =20
> >> BTW, as also asked in a reply to Danilo, how do you call unlink from
> >> run_job() when it was requiring the obj->dma_resv lock, or was that a =
WIP? =20
> > _unlink() makes sure the GEM gpuva list lock is taken, but this can be
> > a custom lock (see drm_gem_gpuva_set_lock()). In panthor we have
> > panthor_gem_object::gpuva_list_lock that's dedicated the gpuva list
> > protection. We make sure we never take this lock while allocating
> > memory to guarantee the dma-signalling path can't deadlock.
> > =20
> >>>>>       =20
> >>>> btw what is the use case for this? do we have actual vulkan
> >>>> applications we know will have problems here? =20
> >>> I don't, but I think that's a concern Faith raised at some point (dat=
es
> >>> back from when I was reading threads describing how VM_BIND on i915
> >>> should work, and I was clearly discovering this whole VM_BIND thing at
> >>> that time, so maybe I misunderstood).
> >>>    =20
> >>>> it feels like a bit of premature optimisation, but maybe we have use=
 cases. =20
> >>> Might be, but that's the sort of thing that would put us in a corner =
if
> >>> we don't have a plan for when the needs arise. Besides, if we don't
> >>> want to support that case because it's too complicated, I'd recommend
> >>> dropping all the drm_gpuvm APIs that let people think this mode is
> >>> valid/supported (map/remap/unmap hooks in drm_gpuvm_ops,
> >>> drm_gpuvm_sm_[un]map helpers, etc). Keeping them around just adds to =
the
> >>> confusion. =20
> >> Xe allows bypassing the bind-queue with another bind-queue, but to
> >> completely avoid dependencies between queues the Operations may not
> >> overlap. =20
> > So, you check the VM state with some VM lock held (would be the VM resv
> > in my case), and if the mapping is new (no overlaps with pre-existing
> > mappings), you queue it to the fast-track/sync-VM_BIND queue. What would
> > be missing I guess is a way to know if the mapping is active (MMU has
> > been updated) or pending (MMU update queued to the bind-queue), so I can
> > fast-track mapping/unmapping of active mappings. This would leave
> > overlapping sync/async VM updates, which can't happen in practice
> > unless userspace is doing something wrong (sparse bindings always go
> > through vkQueueBindSparse). =20
>=20
> User-space is allowed to create new bind queues at will, and they=20
> execute independently save for range overlaps.

I've limited panthor to just one bind-queue that's automatically
created when the VM is created. I guess letting userspace create more
than one queue is doable, but we'd still be serializing VM
operations anyway and that complicates the whole thing when concurrent
operations to the same VM region happen from different bind queues, so I
figured it'd be simpler to expose just one queue.

>=20
> And the overlapping granularity depends very much on the detail of the=20
> range tracking.
> We drafted this fenced range utility
>=20
> https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/353
>=20
> That tracks active ranges that remove themselves when the attached fence=
=20
> signals. Not sure if we ended up using it, though. A new binding would=20
> scan this utility for dma-fences it needs to depend upon.

Sounds like implicit deps on VM ranges :D. I'll have a look, thanks
for the pointer!=20

> Ranges in Xe=20
> are actually page-table modification ranges, so can exceed the actual VA=
=20
> range in some situations, but if you can build page-table structures=20
> async the granularity indeed becomes better.

The granularity in Mali is 4k, and we don't build the page table struct
asynchronously, we just update the page table tree from the CPU,
holding a VM lock to serialize such operations (that's done
synchronously in the ::run_job() path, or from the ioctl in case of a
sync-VM_BIND).

>=20
> /Thomas
>=20
>=20
>=20
> >
> > I'll give it a try.
> > =20
> >> (And the definition of overlap is currently page-table
> >> structure updates may not overlap) but no guarantees are made about
> >> priority.
> >>
> >> /Thomas
> >>
> >>
> >> =20

