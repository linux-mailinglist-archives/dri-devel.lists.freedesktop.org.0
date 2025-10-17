Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36844BEA308
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC9010EC69;
	Fri, 17 Oct 2025 15:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dPkZM/Re";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02DF10EC69
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760716212;
 bh=dHih5tugPFDzUiymeOf9bgFF9S6ntDdx0jsg78dVKZQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dPkZM/Reh9wJLHFL2LLR+bEhmjM7kNXPGfRQNpjA1/pZuYsCX1fsxftR0pNJz6PAx
 sdoP9fvHBm4ZIEP4VkmHMqV5ZT/0zdKm4FGB1QoKBGy8gsbkWv4w9TZVkmg0Q7jdlC
 N+h6wjHkhIesqn7GbHmgGZLlnaE3HEBMSNN/A+QE789ugB63DE+mAQnxpaevYYwiR+
 U9mgdgCg0tbcwAq7Cf719w/jmOTcmo+UZ6yMCptOQ/KI73cpKx+L3lGvQdfuzuwu8H
 ShAXz0l5yxYQXrGJxpgJXtvkUaPVEMU/SdUBXo4n8t6s4JzorQ9XKtodXe1ZecTbyK
 Ci+Fi4wXbVL6w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D671E17E04DA;
 Fri, 17 Oct 2025 17:50:11 +0200 (CEST)
Date: Fri, 17 Oct 2025 17:50:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, kernel@collabora.com, Matt Coster
 <Matt.Coster@imgtec.com>
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync()
 and a drm_gem_sync() helper
Message-ID: <20251017175008.3ac142c7@fedora>
In-Reply-To: <CAOFGe97gKbek59Mri-+Fb4gLLkt2vJC-szc110fCYvcfRtE8iw@mail.gmail.com>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <CAOFGe96trw17pWKv4-Bbh9bvCz8ANTwAcL-croQQw24800fLbQ@mail.gmail.com>
 <CAOFGe96pKQhuhUCzVizUndgQL80+GsS-YiiRcMiO=eHBnYAHxg@mail.gmail.com>
 <20251017172657.2690bbca@fedora>
 <CAOFGe97gKbek59Mri-+Fb4gLLkt2vJC-szc110fCYvcfRtE8iw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

+Matt for my comment on PVR having the same issue.

On Fri, 17 Oct 2025 11:35:54 -0400
Faith Ekstrand <faith@gfxstrand.net> wrote:

> On Fri, Oct 17, 2025 at 11:27=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Fri, 17 Oct 2025 10:40:46 -0400
> > Faith Ekstrand <faith@gfxstrand.net> wrote:
> > =20
> > > On Fri, Oct 17, 2025 at 10:32=E2=80=AFAM Faith Ekstrand <faith@gfxstr=
and.net> wrote: =20
> > > >
> > > > On Wed, Oct 15, 2025 at 12:04=E2=80=AFPM Boris Brezillon
> > > > <boris.brezillon@collabora.com> wrote: =20
> > > > >
> > > > > Prepare things for standardizing synchronization around CPU acces=
ses
> > > > > of GEM buffers. This will be used to provide default
> > > > > drm_gem_dmabuf_{begin,end}_cpu_access() implementations, and prov=
ide
> > > > > a way for drivers to add their own ioctls to synchronize CPU
> > > > > writes/reads when they can't do it directly from userland.
> > > > >
> > > > > v2:
> > > > > - New commit
> > > > >
> > > > > v3:
> > > > > - No changes
> > > > >
> > > > > v4:
> > > > > - Add Steve's R-b
> > > > >
> > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > Reviewed-by: Steven Price <steven.price@arm.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_gem.c | 10 +++++++++
> > > > >  include/drm/drm_gem.h     | 45 +++++++++++++++++++++++++++++++++=
++++++
> > > > >  2 files changed, 55 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > > index a1a9c828938b..a1431e4f2404 100644
> > > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > > @@ -1333,6 +1333,16 @@ void drm_gem_vunmap(struct drm_gem_object =
*obj, struct iosys_map *map)
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_gem_vunmap);
> > > > >
> > > > > +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size=
_t size,
> > > > > +                enum drm_gem_object_access_flags access)
> > > > > +{
> > > > > +       if (obj->funcs->sync)
> > > > > +               return obj->funcs->sync(obj, offset, size, access=
);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_gem_sync);
> > > > > +
> > > > >  /**
> > > > >   * drm_gem_lock_reservations - Sets up the ww context and acquir=
es
> > > > >   * the lock on an array of GEM objects.
> > > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > > index 8d48d2af2649..1c33e59ab305 100644
> > > > > --- a/include/drm/drm_gem.h
> > > > > +++ b/include/drm/drm_gem.h
> > > > > @@ -66,6 +66,33 @@ enum drm_gem_object_status {
> > > > >         DRM_GEM_OBJECT_ACTIVE    =3D BIT(2),
> > > > >  };
> > > > >
> > > > > +/**
> > > > > + * enum drm_gem_object_status - bitmask describing GEM access ty=
pes to prepare for
> > > > > + */
> > > > > +enum drm_gem_object_access_flags {
> > > > > +       /** @DRM_GEM_OBJECT_CPU_ACCESS: Prepare for a CPU access.=
 */
> > > > > +       DRM_GEM_OBJECT_CPU_ACCESS =3D 0,
> > > > > +
> > > > > +       /** @DRM_GEM_OBJECT_DEV_ACCESS: Prepare for a device acce=
ss. */
> > > > > +       DRM_GEM_OBJECT_DEV_ACCESS =3D BIT(0),
> > > > > +
> > > > > +       /** @DRM_GEM_OBJECT_ACCESSOR_MASK: Mask used to check the=
 entity doing the access. */
> > > > > +       DRM_GEM_OBJECT_ACCESSOR_MASK =3D BIT(0),
> > > > > +
> > > > > +       /** @DRM_GEM_OBJECT_READ_ACCESS: Prepare for read-only ac=
cesses. */
> > > > > +       DRM_GEM_OBJECT_READ_ACCESS =3D BIT(1),
> > > > > +
> > > > > +       /** @DRM_GEM_OBJECT_WRITE_ACCESS: Prepare for write-only =
accesses. */
> > > > > +       DRM_GEM_OBJECT_WRITE_ACCESS =3D BIT(2),
> > > > > +
> > > > > +       /** @DRM_GEM_OBJECT_RW_ACCESS: Prepare for a read/write a=
ccesses. */
> > > > > +       DRM_GEM_OBJECT_RW_ACCESS =3D DRM_GEM_OBJECT_READ_ACCESS |
> > > > > +                                  DRM_GEM_OBJECT_WRITE_ACCESS,
> > > > > +
> > > > > +       /** @DRM_GEM_OBJECT_ACCESS_TYPE_MASK: Mask used to check =
the access type. */
> > > > > +       DRM_GEM_OBJECT_ACCESS_TYPE_MASK =3D DRM_GEM_OBJECT_RW_ACC=
ESS,
> > > > > +};
> > > > > +
> > > > >  /**
> > > > >   * struct drm_gem_object_funcs - GEM object functions
> > > > >   */
> > > > > @@ -191,6 +218,21 @@ struct drm_gem_object_funcs {
> > > > >          */
> > > > >         int (*mmap)(struct drm_gem_object *obj, struct vm_area_st=
ruct *vma);
> > > > >
> > > > > +       /**
> > > > > +        * @sync:
> > > > > +        *
> > > > > +        * Prepare for CPU/device access. This can involve migrat=
ion of
> > > > > +        * a buffer to the system-RAM/VRAM, or for UMA, flushing/=
invalidating
> > > > > +        * the CPU caches. The range can be used to optimize the =
synchronization
> > > > > +        * when possible. =20
> > > >
> > > > This has gone in a very different direction from the version I sent
> > > > out and the added generality makes me really nervous. The idea of s=
ync
> > > > involving migration and that the range is a mere hint are antitheti=
cal
> > > > with Vulkan. It's a very GLish design that assumes that a BO is
> > > > exclusively used by one of the CPU or the GPU at the same time. This
> > > > simply isn't the case in modern APIs. Older DRM uAPIs (as well as
> > > > dma-buf itself) are littered with such ioctls and we're in the proc=
ess
> > > > of deleting them all. =20
> > >
> > > And yes, I realize I sent this on the patch for the hook which you
> > > intended to plumb through to dma-buf. However, I also saw it being
> > > propagated to an ioctl and I didn't know where else to put it that had
> > > the relevant details.
> > >
> > > ~Faith
> > > =20
> > > > If the BO needs to be migrated in order to be accessed from the CPU,
> > > > that needs to happen on map, not on some sort of begin/end. Or bett=
er
> > > > yet, just disallow mapping such buffers. Once the client has a map,
> > > > they are free to access from the CPU while stuff is running on the
> > > > GPU. They have to be careful, of course, not to cause data races, b=
ut
> > > > accessing the same BO from the CPU and GPU or even the same range is
> > > > totally okay if you aren't racing.
> > > >
> > > > As a corollary, just don't map PRIME buffers.
> > > >
> > > > And the range really shouldn't be just a hint. With Vulkan, clients
> > > > are regularly sub-allocating from larger memory objects. If they ask
> > > > to flush 64B and end up flushing 64M, that's pretty bad.
> > > >
> > > > All we need is something which lets us trap through to the kernel f=
or
> > > > CPU cache management. That's all we need and that's really all it
> > > > should do. =20
> >
> > Okay, so there's actually a problem with that I think, because we can't
> > know how the buffer we export will be used. It can be imported by the
> > same driver, and we're all good, but it can also be imported by a
> > different driver, which decides to vmap or allow mmap() on it, and then
> > we have to implement the dma_buf CPU sync hooks. Unless we decide that
> > all exported buffers should be write-combine only? This is the very
> > reason I started hooking things up on the dma_buf side, because we're
> > not in control of who the importer of our buffers is. =20
>=20
> Exported buffers should be WC-only. We could try to get creative but
> the moment we let the lack of coherency leak to other processes,
> potentially to other drivers, we're in a world of hurt. Even with the
> dma-buf begin/end hooks, if it's imported into a driver that does
> Vulkan, those hooks don't make sense and we're screwed.

Well, yeah, the 'entire-buf' granularity is a problem, indeed, and
there's no way around it with the current dma-buf API, which is why I
prevented external bufs from being mapped (AKA not host-visible in
Vulkan's term). But I really thought imported buffers coming from
panthor should be mapped cached.

> And, yes, I
> know panvk is the only Vulkan implementation you're going to see on a
> system with an Arm GPU, but thinking about things in the general case
> across all of DRM, exporting non-coherent memory in 2025 is just
> cursed.

Hm, okay. If that's the way to go, then we should enforce

	!WB_MMAP || !PRIVATE

in panthor, and fail the export of a WB_MMAP buffer in panfrost (we
don't have a way to know that a buffer is private there).

I'll go and revisit the patchset to do that. I guess PVR needs fixing
too, because I haven't seen anything to prevent `CACHED + EXPORTABLE`
there.
