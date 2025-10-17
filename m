Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14C8BE9CFF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121D410EC44;
	Fri, 17 Oct 2025 15:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gENBdBcc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853D510EC44
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760714824;
 bh=B3tPYOdx8TRfHo8b8rCsJoa3qANwUWEDrTSZm9oGExc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gENBdBcc68raOrYf1dojUpr4dxueHjCZrddNVMfbwmPTbF6P+VjQB+02L2I+LsZnv
 G6NEPcl/qGqtRJ4zWqi+3xSd5eOWNL4cFtvbKj2OnU8UMKr045BQy/A0j6Emb+lgHE
 4tmVH+RGRJ3vzInRG1puz1wq1UXLRKRhXAcus4gvGeISLVTUz2XusttZwUwg4bl3Bi
 NkQSULAwtgkeQNuBJOFVRVTQfUPVBRLT0FFnbNlhAsTbcLC4UMYjn/h0I3ulPdGPKW
 ql6H1XYlfsCnfjs5/EliNxmPX6sGuoIU53uJrktr+EKs8d8GUNkhQC+kJnYBaHV2ri
 UXAeRTN7AAknw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AE14917E02B0;
 Fri, 17 Oct 2025 17:27:03 +0200 (CEST)
Date: Fri, 17 Oct 2025 17:26:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync()
 and a drm_gem_sync() helper
Message-ID: <20251017172657.2690bbca@fedora>
In-Reply-To: <CAOFGe96pKQhuhUCzVizUndgQL80+GsS-YiiRcMiO=eHBnYAHxg@mail.gmail.com>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <CAOFGe96trw17pWKv4-Bbh9bvCz8ANTwAcL-croQQw24800fLbQ@mail.gmail.com>
 <CAOFGe96pKQhuhUCzVizUndgQL80+GsS-YiiRcMiO=eHBnYAHxg@mail.gmail.com>
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

On Fri, 17 Oct 2025 10:40:46 -0400
Faith Ekstrand <faith@gfxstrand.net> wrote:

> On Fri, Oct 17, 2025 at 10:32=E2=80=AFAM Faith Ekstrand <faith@gfxstrand.=
net> wrote:
> >
> > On Wed, Oct 15, 2025 at 12:04=E2=80=AFPM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote: =20
> > >
> > > Prepare things for standardizing synchronization around CPU accesses
> > > of GEM buffers. This will be used to provide default
> > > drm_gem_dmabuf_{begin,end}_cpu_access() implementations, and provide
> > > a way for drivers to add their own ioctls to synchronize CPU
> > > writes/reads when they can't do it directly from userland.
> > >
> > > v2:
> > > - New commit
> > >
> > > v3:
> > > - No changes
> > >
> > > v4:
> > > - Add Steve's R-b
> > >
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Reviewed-by: Steven Price <steven.price@arm.com>
> > > ---
> > >  drivers/gpu/drm/drm_gem.c | 10 +++++++++
> > >  include/drm/drm_gem.h     | 45 +++++++++++++++++++++++++++++++++++++=
++
> > >  2 files changed, 55 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > index a1a9c828938b..a1431e4f2404 100644
> > > --- a/drivers/gpu/drm/drm_gem.c
> > > +++ b/drivers/gpu/drm/drm_gem.c
> > > @@ -1333,6 +1333,16 @@ void drm_gem_vunmap(struct drm_gem_object *obj=
, struct iosys_map *map)
> > >  }
> > >  EXPORT_SYMBOL(drm_gem_vunmap);
> > >
> > > +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t s=
ize,
> > > +                enum drm_gem_object_access_flags access)
> > > +{
> > > +       if (obj->funcs->sync)
> > > +               return obj->funcs->sync(obj, offset, size, access);
> > > +
> > > +       return 0;
> > > +}
> > > +EXPORT_SYMBOL(drm_gem_sync);
> > > +
> > >  /**
> > >   * drm_gem_lock_reservations - Sets up the ww context and acquires
> > >   * the lock on an array of GEM objects.
> > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > index 8d48d2af2649..1c33e59ab305 100644
> > > --- a/include/drm/drm_gem.h
> > > +++ b/include/drm/drm_gem.h
> > > @@ -66,6 +66,33 @@ enum drm_gem_object_status {
> > >         DRM_GEM_OBJECT_ACTIVE    =3D BIT(2),
> > >  };
> > >
> > > +/**
> > > + * enum drm_gem_object_status - bitmask describing GEM access types =
to prepare for
> > > + */
> > > +enum drm_gem_object_access_flags {
> > > +       /** @DRM_GEM_OBJECT_CPU_ACCESS: Prepare for a CPU access. */
> > > +       DRM_GEM_OBJECT_CPU_ACCESS =3D 0,
> > > +
> > > +       /** @DRM_GEM_OBJECT_DEV_ACCESS: Prepare for a device access. =
*/
> > > +       DRM_GEM_OBJECT_DEV_ACCESS =3D BIT(0),
> > > +
> > > +       /** @DRM_GEM_OBJECT_ACCESSOR_MASK: Mask used to check the ent=
ity doing the access. */
> > > +       DRM_GEM_OBJECT_ACCESSOR_MASK =3D BIT(0),
> > > +
> > > +       /** @DRM_GEM_OBJECT_READ_ACCESS: Prepare for read-only access=
es. */
> > > +       DRM_GEM_OBJECT_READ_ACCESS =3D BIT(1),
> > > +
> > > +       /** @DRM_GEM_OBJECT_WRITE_ACCESS: Prepare for write-only acce=
sses. */
> > > +       DRM_GEM_OBJECT_WRITE_ACCESS =3D BIT(2),
> > > +
> > > +       /** @DRM_GEM_OBJECT_RW_ACCESS: Prepare for a read/write acces=
ses. */
> > > +       DRM_GEM_OBJECT_RW_ACCESS =3D DRM_GEM_OBJECT_READ_ACCESS |
> > > +                                  DRM_GEM_OBJECT_WRITE_ACCESS,
> > > +
> > > +       /** @DRM_GEM_OBJECT_ACCESS_TYPE_MASK: Mask used to check the =
access type. */
> > > +       DRM_GEM_OBJECT_ACCESS_TYPE_MASK =3D DRM_GEM_OBJECT_RW_ACCESS,
> > > +};
> > > +
> > >  /**
> > >   * struct drm_gem_object_funcs - GEM object functions
> > >   */
> > > @@ -191,6 +218,21 @@ struct drm_gem_object_funcs {
> > >          */
> > >         int (*mmap)(struct drm_gem_object *obj, struct vm_area_struct=
 *vma);
> > >
> > > +       /**
> > > +        * @sync:
> > > +        *
> > > +        * Prepare for CPU/device access. This can involve migration =
of
> > > +        * a buffer to the system-RAM/VRAM, or for UMA, flushing/inva=
lidating
> > > +        * the CPU caches. The range can be used to optimize the sync=
hronization
> > > +        * when possible. =20
> >
> > This has gone in a very different direction from the version I sent
> > out and the added generality makes me really nervous. The idea of sync
> > involving migration and that the range is a mere hint are antithetical
> > with Vulkan. It's a very GLish design that assumes that a BO is
> > exclusively used by one of the CPU or the GPU at the same time. This
> > simply isn't the case in modern APIs. Older DRM uAPIs (as well as
> > dma-buf itself) are littered with such ioctls and we're in the process
> > of deleting them all. =20
>=20
> And yes, I realize I sent this on the patch for the hook which you
> intended to plumb through to dma-buf. However, I also saw it being
> propagated to an ioctl and I didn't know where else to put it that had
> the relevant details.
>=20
> ~Faith
>=20
> > If the BO needs to be migrated in order to be accessed from the CPU,
> > that needs to happen on map, not on some sort of begin/end. Or better
> > yet, just disallow mapping such buffers. Once the client has a map,
> > they are free to access from the CPU while stuff is running on the
> > GPU. They have to be careful, of course, not to cause data races, but
> > accessing the same BO from the CPU and GPU or even the same range is
> > totally okay if you aren't racing.
> >
> > As a corollary, just don't map PRIME buffers.
> >
> > And the range really shouldn't be just a hint. With Vulkan, clients
> > are regularly sub-allocating from larger memory objects. If they ask
> > to flush 64B and end up flushing 64M, that's pretty bad.
> >
> > All we need is something which lets us trap through to the kernel for
> > CPU cache management. That's all we need and that's really all it
> > should do.

Okay, so there's actually a problem with that I think, because we can't
know how the buffer we export will be used. It can be imported by the
same driver, and we're all good, but it can also be imported by a
different driver, which decides to vmap or allow mmap() on it, and then
we have to implement the dma_buf CPU sync hooks. Unless we decide that
all exported buffers should be write-combine only? This is the very
reason I started hooking things up on the dma_buf side, because we're
not in control of who the importer of our buffers is.
