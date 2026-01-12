Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B896CD13CAA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 16:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C674410E40A;
	Mon, 12 Jan 2026 15:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qf35rlYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B713A10E40B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 15:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768232954;
 bh=V5s37RHSn247DDFf/S+6gT9qSSjiaTMfOTA9+0zQljM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qf35rlYZK7l0EOgCydM8NMJ8/EswJ65eRAhuDqA0+p5L2A5tWQ9wktxJqPBD8CuYC
 sYwKkLw7ho+OcUYJzcper/0ks4qovUPHASxOKSUyK4txfrbSWMBMVwNLC4AltQ2cXk
 ev/7ZW9dt2ocuFMs20ZgbMdHdo7uuCqXrC9rTPkXtac9vN1rxlqrIVtVFn0fyj+TrL
 tVcbLxapJvl7E0itV7TlUV9T1o2jnxXkqkkLT4OffdA0Svvu5kjxys+QOnWVEsiQA4
 NucWWjIYeeSIrkXovXo7PDVgIghbFE8hdHiF/My+4nCxkB9MLgSBir9V07dPMQHLbm
 wcLOH0Lq/vPCg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8434417E10F4;
 Mon, 12 Jan 2026 16:49:13 +0100 (CET)
Date: Mon, 12 Jan 2026 16:49:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, Chris Diamand
 <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, kernel@collabora.com
Subject: Re: [PATCH v1 8/9] drm/panthor: Track the number of mmap on a BO
Message-ID: <20260112164908.02d25584@fedora>
In-Reply-To: <CAH5fLggS-sgKYRvnraRsOoYysVnYoDdhmiu1jbdWv132BBcWAA@mail.gmail.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-9-boris.brezillon@collabora.com>
 <c86e341d-0dd2-4a97-b047-f62f2aa64c7e@arm.com>
 <20260112153953.61eb20dc@fedora>
 <CAH5fLggS-sgKYRvnraRsOoYysVnYoDdhmiu1jbdWv132BBcWAA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Mon, 12 Jan 2026 16:19:52 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Jan 12, 2026 at 3:40=E2=80=AFPM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Mon, 12 Jan 2026 12:33:33 +0000
> > Steven Price <steven.price@arm.com> wrote:
> > =20
> > > On 09/01/2026 13:08, Boris Brezillon wrote: =20
> > > > This will be used to order things by reclaimability.
> > > >
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > ---
> > > >  drivers/gpu/drm/panthor/panthor_gem.c | 44 +++++++++++++++++++++++=
++--
> > > >  drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
> > > >  2 files changed, 45 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/dr=
m/panthor/panthor_gem.c
> > > > index 44f05bd957e7..458d22380e96 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > > > @@ -484,6 +484,7 @@ static void panthor_gem_print_info(struct drm_p=
rinter *p, unsigned int indent,
> > > >     drm_printf_indent(p, indent, "vmap_use_count=3D%u\n",
> > > >                       refcount_read(&bo->cmap.vaddr_use_count));
> > > >     drm_printf_indent(p, indent, "vaddr=3D%p\n", bo->cmap.vaddr);
> > > > +   drm_printf_indent(p, indent, "mmap_count=3D%u\n", refcount_read=
(&bo->cmap.mmap_count));
> > > >  }
> > > >
> > > >  static int panthor_gem_pin_locked(struct drm_gem_object *obj)
> > > > @@ -600,6 +601,13 @@ static int panthor_gem_mmap(struct drm_gem_obj=
ect *obj, struct vm_area_struct *v
> > > >     if (is_cow_mapping(vma->vm_flags))
> > > >             return -EINVAL;
> > > >
> > > > +   if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
> > > > +           dma_resv_lock(obj->resv, NULL);
> > > > +           if (!refcount_inc_not_zero(&bo->cmap.mmap_count))
> > > > +                   refcount_set(&bo->cmap.mmap_count, 1);
> > > > +           dma_resv_unlock(obj->resv);
> > > > +   }
> > > > +
> > > >     vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> > > >     vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> > > >     if (should_map_wc(bo))
> > > > @@ -732,10 +740,42 @@ static vm_fault_t panthor_gem_fault(struct vm=
_fault *vmf)
> > > >     return blocking_page_setup(vmf, bo, page_offset, true);
> > > >  }
> > > >
> > > > +static void panthor_gem_vm_open(struct vm_area_struct *vma)
> > > > +{
> > > > +   struct panthor_gem_object *bo =3D to_panthor_bo(vma->vm_private=
_data);
> > > > +
> > > > +   /* mmap_count must have been incremented at mmap time, so it ca=
n't be
> > > > +    * zero here.
> > > > +    */
> > > > +   if (!drm_gem_is_imported(&bo->base))
> > > > +           drm_WARN_ON(bo->base.dev, !refcount_inc_not_zero(&bo->c=
map.mmap_count));
> > > > +
> > > > +   drm_gem_vm_open(vma);
> > > > +}
> > > > +
> > > > +static void panthor_gem_vm_close(struct vm_area_struct *vma)
> > > > +{
> > > > +   struct panthor_gem_object *bo =3D to_panthor_bo(vma->vm_private=
_data);
> > > > +
> > > > +   if (drm_gem_is_imported(&bo->base))
> > > > +           goto out;
> > > > +
> > > > +   if (refcount_dec_not_one(&bo->cmap.mmap_count))
> > > > +           goto out;
> > > > +
> > > > +   dma_resv_lock(bo->base.resv, NULL);
> > > > +   if (!refcount_dec_not_one(&bo->cmap.mmap_count))
> > > > +           refcount_set(&bo->cmap.mmap_count, 0);
> > > > +   dma_resv_unlock(bo->base.resv); =20
> > >
> > > I don't think this logic is safe. Holding the resv_lock doesn't prote=
ct
> > > against another thread doing a refcount_inc_not_zero() without holding
> > > the lock.
> > >
> > > I think you can just replace the if() part with a refcount_dec() call,
> > > the lock AFAICT is needed because the following patch wants to be sure
> > > that !!mmap_count is stable when resv_lock is held. =20
> >
> > I wish I could, but refcount_dec() doesn't let me do the 1 -> 0 without
> > complaining :P. =20
>=20
> I'm pretty sure that refcount_dec() is fine with 1->0.

That's not what [1] says. refcount_dec_and_test() is okay though, but
it'd force us to do a

	(void)refcount_dec_and_test()

and detail why it's okay to ignore the returned value. Not too sure
which one is better.

> Did you mean
> refcount_inc() and 0->1?
>=20
> > > I also feel you should invert the conditino for refcount_dec_not_one,
> > > leading to the following which I feel is easier to read:
> > >
> > > static void panthor_gem_vm_close(struct vm_area_struct *vma)
> > > {
> > >       [...]
> > >
> > >       if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
> > >               dma_resv_lock(bo->base.resv, NULL);
> > >               refcount_dec(&bo->cmap.mmap_count);
> > >               dma_resv_unlock(bo->base.resv);
> > >       } =20
> >
> > The best I can do is:
> >
> >         if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
> >                 dma_resv_lock(bo->base.resv, NULL);
> >                 if (!refcount_dec_not_one(&bo->cmap.mmap_count))
> >                         refcount_set(&bo->cmap.mmap_count, 0);
> >                 dma_resv_unlock(bo->base.resv);
> >         }
> >
> > so we only take the lock when absolutely needed, but the 1 -> 0
> > transition still has to be done with "if (dec_not_one) set(0)". =20
>=20
> Why not just use atomic_t and use the atomic inc/dec operations? They
> don't have saturation, but also do not require treating zero
> specially.

I had suggested using atomics back when I was reviewing the
shmem-shrinker stuff to avoid this exact same issue. I can't find the
thread anymore and I can't remember the rationale either (probably that
saturation detection was useful, still), but the decision was to use a
refcount_t. I don't mind using atomics here, but I'd rather not be
blocked on that when/if I try to move that code into a common lib.

[1]https://elixir.bootlin.com/linux/v6.19-rc4/source/include/linux/refcount=
.h#L460
