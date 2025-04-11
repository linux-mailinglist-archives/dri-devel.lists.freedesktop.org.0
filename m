Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84988A85633
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 10:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7874210EB1E;
	Fri, 11 Apr 2025 08:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kxekeN5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CF810EB19;
 Fri, 11 Apr 2025 08:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744358915;
 bh=NidnmQTUy8CGiG25xVaQndf6AbYBHk0NJv6mWM47KJU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kxekeN5vQMBnyglmu7UACR4CeBJ+U2lVC24cTrAvakPbvwB9Rqq3td/PaqjZKlY0w
 YwXxNq7246LV8M7yM4JiHM7/2d2Wr8+5X6knJBsU2HPV+/AR02xzi9/pGWag+go9rU
 6eg7w+U6nJeRROYUkDiFjKpWDTXgJYASBPGjpCMVR44LTLGDxp0yE5mGkLv64cX4JH
 VU688zyh03nzQ7ZN9YaZiAnk8kdtGvormKUohiIawPjsHYI0t4VJ9bbMbWPk+FpuOy
 iJ9Ro4wFsRMH71q4pAVb7gvHYyAYgP/LeD19pzKo9MnIFkG7YYfDQhYoWEowDoTfHN
 xYGff8YMbeq2w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E935317E0402;
 Fri, 11 Apr 2025 10:08:34 +0200 (CEST)
Date: Fri, 11 Apr 2025 10:08:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Faith Ekstrand
 <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <20250411100829.7c82cdb1@collabora.com>
In-Reply-To: <bb182577-f1fc-4305-9f12-09aa73b726b3@amd.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com>
 <bb182577-f1fc-4305-9f12-09aa73b726b3@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Thu, 10 Apr 2025 20:52:27 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 10.04.25 um 19:20 schrieb Boris Brezillon:
> > [SNIP] =20
> >>>> Faulting is only legal when you have something like HMM, SVM or
> >>>> whatever you call it. And then you can just use a plain shmem
> >>>> object to provide you with backing pages.
> >>>>
> >>>> I mean we could in theory allow faulting on GEM objects as well,
> >>>> but we would need to take very strict precautions on that we
> >>>> currently don't have as far as I know.   =20
> >>> We only use this mechanism for very specific allocations: tiler
> >>> memory whose maximum size can't be guessed upfront because tile
> >>> binning is by nature unpredictible.
> >>>   =20
> >>>> So could you explain how this works in the first place?   =20
> >>> I can explain you how this works in Panthor, yes. You get an
> >>> initial amount of memory that the tiler can use, when it runs out
> >>> of memory, it will first ask the system for more memory, if the
> >>> allocation fails, it will fallback to what they call "incremental
> >>> rendering", where the already binned primitives are flushed to the
> >>> FB in order to free memory, and the rendering starts over from
> >>> there, with the memory that has been freed.
> >>>
> >>> In Panthor, this on-demand allocation scheme is something that
> >>> allows us to speed-up rendering when there's memory available, but
> >>> we can make progress when that's not the case, hence the failable
> >>> allocation scheme I'm proposing here.   =20
> >> Puh, that sounds like it can potentially work but is also very very
> >> fragile.
> >>
> >> You must have a code comment when you select the GFP flags how and
> >> why that works. =20
> > +	/* We want non-blocking allocations, if we're OOM, we just
> > fail the job
> > +	 * to unblock things.
> > +	 */
> > +	ret =3D drm_gem_shmem_sparse_populate_range(&bo->base,
> > page_offset,
> > +						  NUM_FAULT_PAGES,
> > page_gfp,
> > +						  __GFP_NORETRY |
> > __GFP_NOWARN);
> >
> > That's what I have right now in the failable allocation path. The
> > tiler chunk allocation uses the same flags, but doesn't have a
> > comment explaining that a fallback exists when the allocation
> > fails. =20
>=20
> We agreed to use GFP_NOWAIT for such types of allocations to at least
> wake up kswapd on the low water mark.

Yeah, I wasn't sure about the flags to be honest. Hence the ping and
the very reason Sima asked me to Cc a few more people to look at those
changes.

>=20
> IIRC even using __GFP_NORETRY here was illegal, but I need to double
> check the discussions again.

FWIW, it's been taken from i915 [1]

>=20
> From the comment this at minimum needs an explanation what influence
> this has on the submission and that you can still guarantee fence
> forward progress.

Agreed.

> >>> And that's how it is today, the
> >>> alloc-on-fault mechanism is being used in at least 3 drivers, and
> >>> all I'm trying to do here is standardize it and try to document
> >>> the constraints that comes with this model, constraint that are
> >>> currently being ignored. Like the fact allocations in the fault
> >>> handler path shouldn't block so we're guaranteed to signal the job
> >>> fence in finite time, and we don't risk a deadlock between the
> >>> driver shrinker and the job triggering the fault.   =20
> >> Well on one hand it's good to that we document the pitfalls, but I
> >> clearly think that we should *not* spread that into common code. =20
> > Ack on not encouraging people to use that; but having a clear path
> > describing how this should be done for HW that don't have other
> > options, with helpers and extensive doc is IMHO better than letting
> > new drivers reproduce the mistake that were done in the past.
> > Because, if you tell people "don't do that", but don't have an
> > alternative to propose, they'll end up doing it anyway. =20
>=20
> Just to be clear: We have already completely rejected code from going
> upstream because of that!

Apparently panfrost/panthor/lima didn't get enough scrutiny...

>=20
> And we are not talking about anything small, but rather a full blown
> framework and every developed by a major player.
>=20
> Additional to that both i915 and amdgpu had code which used this
> approach as well and we reverted back because it simply doesn't work
> reliable.

BTW, the sparse GEM-SHMEM code in itself doesn't necessarily imply
non-blocking allocation in the fault handler, though admittedly it's
been designed to allow it.

>=20
> >> That would give the impression that this actually works and to be
> >> honest I should start to charge money to rejecting stuff like that.
> >> It would probably get me rich.
> >> =20
> >>> I'm well aware of the implications of what I'm proposing here, but
> >>> ignoring the fact some drivers already violate the rules don't
> >>> make them disappear. So I'd rather work with you and others to
> >>> clearly state what the alloc-in-fault-path rules are, and enforce
> >>> them in some helper functions, than pretend these ugly things
> >>> don't exist. :D   =20
> >> Yeah, but this kind of says to others it's ok to do this which
> >> clearly isn't as far as I can see. =20
> > Not really. At least not if we properly review any driver that use
> > these APIs, and clearly state in the doc that this is provided as a
> > last resort for HW that can't do without on-fault-allocation,
> > because they are designed to work this way.
> > =20
> >> What we should do instead is to add this as not ok approaches to
> >> the documentation and move on. =20
> > Well, that's what happened with panfrost, lima and panthor, and see
> > where we are now: 3 drivers that you consider broken (probably
> > rightfully), and more to come if we don't come up with a plan for HW
> > that have the same requirements (as I said, I wouldn't be surprised
> > if most tilers were relying on the same kind of
> > on-demand-allocation). =20
>=20
> Well we have HW features in major drivers which we simply don't use
> because of that.

Yeah, but in that case that's not really a HW feature we can switch
off/avoid using. It's at the core of how Mali GPUs work (at least
anything prior to gen10). And forcing all apps to fully allocate this
128MB buffer upfront (which might seem small for discrete GPUs, but
really isn't for systems where the memory can be as low as 1GB, and
shared with the rest of the system) isn't really an option. The only
alternative I see is finding a way to emulate incremental rendering on
older Mali GPUs, assuming that's even possible.

>=20
> > As always, I appreciate your valuable inputs, and would be happy to
> > try anything you think might be more adapted than what is proposed
> > here, but saying "this is broken HW/driver, so let's ignore it" is
> > not really an option, at least if you don't want the bad design
> > pattern to spread. =20
>=20
> Yeah, I'm not sure what to do either. We *know* from experience that
> this approach will fail.

Can you, or someone who was involved in those attempts, sum-up the
problem that were attempted to be solved, and the walls you hit with
this non-blocking/failable allocation scheme (fell free to link me to
previous discussion so you don't have to type it again :-)).

FWIW, the problem I see with the current panfrost/panthor
on-fault-allocation scheme is the fact allocating GEMs with GFP_KERNEL
leads to unbounded waits, which might cause a job timeout. The dealock
between the panfrost shrinker and the job requesting memory doesn't
exist AFAICT, because panfrost can only reclaim objects that were
flagged as unused (MADVISE(DONTNEED)), and the allocation is done
without any of the locks that are taken by the panfrost shrinker held.
So yeah, jobs can fail because the system ran out of memory, the job
fence will be signalled with an error, and the system will just move
on. It's already what happens today, and userspace either ignores it
(because on older Mali GPUs, a fault on a job is just transient, and
doesn't prevent other jobs from executing) or knows how to recover from
it (on newer GPUs, the FW scheduling-context needs to be destroyed
re-created).

Just to be clear, I'm not saying this is good, I'm just describing what
is done today, so you get the whole picture.

Now, with panthor being in the process of adopting a transparent
reclaim mechanism (swapout on reclaim if the GPU context is idle,
swapin on next job), the deadlock between the panthor/gem-shmem
shrinker and the allocation in the fault path will probably surface, so
I do get why no-alloc-in-fault path, or at the very least,
non-blocking-alloc-in-fault-path is needed. And I really thought
non-blocking allocations would be allowed in that case. So please bare
with me, and tell me where my mistake is, because every time I think I
got it, I look at it again, and don't see the problem.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/i915/gem=
/i915_gem_shmem.c#L96
