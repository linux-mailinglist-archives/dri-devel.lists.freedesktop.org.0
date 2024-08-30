Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC07965D18
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 11:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105CD10EA30;
	Fri, 30 Aug 2024 09:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WQAhllT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612F010EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725010653;
 bh=/IGKXnBnV1h0AIAPCm2ANJVylyOTjeht/XRr211+mFc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WQAhllT/fOJttzHM9cUzEfP8awJ+Y4r44u8NuLxhlGA7y/1E1dUIYCjbvzX3zbfBZ
 W18MLSYoDY7ieK8YLQVDsoCp4mspuQJrvgUh4xtMnKz9bUUj9hg8ZuXuch36qmvRRi
 SFHsgILtTAOulF2jrwokJdqenTfFBmTL6qfKM9Q/K5lXsW/M5vPhvKTFrifduq9GYD
 TRycyDr55ih7qb1SGCfVkJ6/o+/aUJdnubItPBHvFTOg0cr8NKJWGVyU7yNeOkrk4D
 odtCGM3J4KfiBc+0Q+1ouYj9GRlJk+CyoUp3qjKSUGmi0DjadmIbVkr1J/WJtrU6zL
 AANdmnRZot1pQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 89D0A17E0F92;
 Fri, 30 Aug 2024 11:37:33 +0200 (CEST)
Date: Fri, 30 Aug 2024 11:37:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, kernel@collabora.com, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Message-ID: <20240830113721.6174f3d9@collabora.com>
In-Reply-To: <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
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

On Fri, 30 Aug 2024 10:14:18 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 29.08.24 um 19:12 schrieb Boris Brezillon:
> > dma_fence objects created by an entity might outlive the
> > drm_gpu_scheduler this entity was bound to if those fences are retained
> > by other other objects, like a dma_buf resv. This means that
> > drm_sched_fence::sched might be invalid when the resv is walked, which
> > in turn leads to a UAF when dma_fence_ops::get_timeline_name() is calle=
d.
> >
> > This probably went unnoticed so far, because the drm_gpu_scheduler had
> > the lifetime of the drm_device, so, unless you were removing the device,
> > there were no reasons for the scheduler to be gone before its fences. =
=20
>=20
> Nope, that is intentional design. get_timeline_name() is not safe to be=20
> called after the fence signaled because that would causes circular=20
> dependency problems.

Do you mean the dma_fence layer should not call get_timeline_name()
after it's been signalled (looking at the code/doc, it doesn't seem to
be the case), or do you mean the drm_sched implementation of the fence
interface is wrong and should assume the fence can live longer than its
creator?

>=20
> E.g. when you have hardware fences it can happen that fences reference a=
=20
> driver module (for the function printing the name) and the module in=20
> turn keeps fences around.
>=20
> So you easily end up with a module you can never unload.

On the other hand, I think preventing the module from being unloaded is
the right thing to do, because otherwise the dma_fence_ops might be
gone when they get dereferenced in the release path. That's also a
problem I noticed when I started working on the initial panthor driver
without drm_sched. To solve that I ended up retaining a module ref for
each fence created, and releasing this ref in the
dma_fence_ops::release() function.

drm_sched adds an indirection that allows drivers to not care, but
that's still a problem if you end up unloading drm_sched while some of
its drm_sched_fence fences are owned by external components.

>=20
>=20
> > With the introduction of a new model where each entity has its own
> > drm_gpu_scheduler instance, this situation is likely to happen every ti=
me
> > a GPU context is destroyed and some of its fences remain attached to
> > dma_buf objects still owned by other drivers/processes.
> >
> > In order to make drm_sched_fence_get_timeline_name() safe, we need to
> > copy the scheduler name into our own refcounted object that's only
> > destroyed when both the scheduler and all its fences are gone.
> >
> > The fact drm_sched_fence might have a reference to the drm_gpu_scheduler
> > even after it's been released is worrisome though, but I'd rather
> > discuss that with everyone than come up with a solution that's likely
> > to end up being rejected.
> >
> > Note that the bug was found while repeatedly reading dma_buf's debugfs
> > file, which, at some point, calls dma_resv_describe() on a resv that
> > contains signalled fences coming from a destroyed GPU context.
> > AFAIK, there's nothing invalid there. =20
>=20
> Yeah but reading debugfs is not guaranteed to crash the kernel.
>=20
> On the other hand the approach with a kref'ed string looks rather sane=20
> to me. One comment on this below.

There's still the problem I mentioned above (unloading drm_sched can
make things crash). Are there any plans to fix that? The simple option
would be to prevent compiling drm_sched as a module, but that's not an
option because it depends on DRM which is a tristate too. Maybe we
could have drm_sched_fence.o linked statically, just like dma-fence.c
is linked statically to prevent the stub ops from disappearing.
Not sure if drm_sched_fence.c depends on symbols defined in
sched_{main,entity}.c or other parts of the DRM subsystem though.

> > +/**
> > + * struct drm_sched_fence_timeline - Wrapped around the timeline name
> > + *
> > + * This is needed to cope with the fact dma_fence objects created by
> > + * an entity might outlive the drm_gpu_scheduler this entity was bound
> > + * to, making drm_sched_fence::sched invalid and leading to a UAF when
> > + * dma_fence_ops::get_timeline_name() is called.
> > + */
> > +struct drm_sched_fence_timeline {
> > +	/** @kref: Reference count of this timeline object. */
> > +	struct kref			kref;
> > +
> > +	/**
> > +	 * @name: Name of the timeline.
> > +	 *
> > +	 * This is currently a copy of drm_gpu_scheduler::name.
> > +	 */
> > +	const char			*name; =20
>=20
> Make that a char name[] and embed the name into the structure. The macro=
=20
> struct_size() can be used to calculate the size.

Sure I can do that.

Regards,

Boris
