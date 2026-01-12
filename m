Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF5D13E39
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A362410E402;
	Mon, 12 Jan 2026 16:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oIPgEntU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEF310E402
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768234027;
 bh=qf2liF3PRGdd5V9MVGiiYjiIaPACQ6TvC6haw+nVM60=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oIPgEntUkn0gJZSCgScT3rRPQBpcJTQd79KqHzeJTVJChq9gfBr4ZjZBtLTd10yqX
 oW/KgknSezNyFrvcwmoEoLnryxtpJt2rrXOTC8gViYZrDrMBW1iFiQcsalF+f7U50A
 sI2PIayLga/8GLw7c7AT2uM+9/JBBFNbZkvOGPQvprjU2ztjcEsE7I2tyZjlSDwWTm
 4X4g0DyrezWaGH0o7frB2jJvaqhQt3LDScRTPVLmYvtmUhF8++D6zg8sKAxTEYgMHP
 tgJrKLKf2yL4W8rldatrO07WthFKk4ucwgejlIbNUIV+6QsSoiqS/8d7tcGNpga1FM
 24jqpU4I9kLLA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 424A417E0A49;
 Mon, 12 Jan 2026 17:07:06 +0100 (CET)
Date: Mon, 12 Jan 2026 17:06:58 +0100
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
Message-ID: <20260112170658.1bda2573@fedora>
In-Reply-To: <CAH5fLgj_mGHjk81ZVS2o+Q-+UY3PhZ-ech1BzjDewUvGHaeWBA@mail.gmail.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-9-boris.brezillon@collabora.com>
 <c86e341d-0dd2-4a97-b047-f62f2aa64c7e@arm.com>
 <20260112153953.61eb20dc@fedora>
 <CAH5fLggS-sgKYRvnraRsOoYysVnYoDdhmiu1jbdWv132BBcWAA@mail.gmail.com>
 <20260112164908.02d25584@fedora>
 <CAH5fLgj_mGHjk81ZVS2o+Q-+UY3PhZ-ech1BzjDewUvGHaeWBA@mail.gmail.com>
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

On Mon, 12 Jan 2026 16:51:26 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Jan 12, 2026 at 4:49=E2=80=AFPM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Mon, 12 Jan 2026 16:19:52 +0100
> > Alice Ryhl <aliceryhl@google.com> wrote:
> > =20
> > > On Mon, Jan 12, 2026 at 3:40=E2=80=AFPM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote: =20
> > > >
> > > > On Mon, 12 Jan 2026 12:33:33 +0000
> > > > Steven Price <steven.price@arm.com> wrote:
> > > > =20
> > > > > On 09/01/2026 13:08, Boris Brezillon wrote: =20
> > > > > > +static void panthor_gem_vm_close(struct vm_area_struct *vma)
> > > > > > +{
> > > > > > +   struct panthor_gem_object *bo =3D to_panthor_bo(vma->vm_pri=
vate_data);
> > > > > > +
> > > > > > +   if (drm_gem_is_imported(&bo->base))
> > > > > > +           goto out;
> > > > > > +
> > > > > > +   if (refcount_dec_not_one(&bo->cmap.mmap_count))
> > > > > > +           goto out;
> > > > > > +
> > > > > > +   dma_resv_lock(bo->base.resv, NULL);
> > > > > > +   if (!refcount_dec_not_one(&bo->cmap.mmap_count))
> > > > > > +           refcount_set(&bo->cmap.mmap_count, 0);
> > > > > > +   dma_resv_unlock(bo->base.resv); =20
> > > > >
> > > > > I don't think this logic is safe. Holding the resv_lock doesn't p=
rotect
> > > > > against another thread doing a refcount_inc_not_zero() without ho=
lding
> > > > > the lock.
> > > > >
> > > > > I think you can just replace the if() part with a refcount_dec() =
call,
> > > > > the lock AFAICT is needed because the following patch wants to be=
 sure
> > > > > that !!mmap_count is stable when resv_lock is held. =20
> > > >
> > > > I wish I could, but refcount_dec() doesn't let me do the 1 -> 0 wit=
hout
> > > > complaining :P. =20
> > >
> > > I'm pretty sure that refcount_dec() is fine with 1->0. =20
> >
> > That's not what [1] says. refcount_dec_and_test() is okay though, but
> > it'd force us to do a
> >
> >         (void)refcount_dec_and_test()
> >
> > and detail why it's okay to ignore the returned value. Not too sure
> > which one is better. =20
>=20
> You're right, I mixed it up with refcount_dec_and_test().
>=20
> > > > > I also feel you should invert the conditino for refcount_dec_not_=
one,
> > > > > leading to the following which I feel is easier to read:
> > > > >
> > > > > static void panthor_gem_vm_close(struct vm_area_struct *vma)
> > > > > {
> > > > >       [...]
> > > > >
> > > > >       if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
> > > > >               dma_resv_lock(bo->base.resv, NULL);
> > > > >               refcount_dec(&bo->cmap.mmap_count);
> > > > >               dma_resv_unlock(bo->base.resv);
> > > > >       } =20
> > > >
> > > > The best I can do is:
> > > >
> > > >         if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
> > > >                 dma_resv_lock(bo->base.resv, NULL);
> > > >                 if (!refcount_dec_not_one(&bo->cmap.mmap_count))
> > > >                         refcount_set(&bo->cmap.mmap_count, 0);
> > > >                 dma_resv_unlock(bo->base.resv);
> > > >         }
> > > >
> > > > so we only take the lock when absolutely needed, but the 1 -> 0
> > > > transition still has to be done with "if (dec_not_one) set(0)". =20
> > >
> > > Why not just use atomic_t and use the atomic inc/dec operations? They
> > > don't have saturation, but also do not require treating zero
> > > specially. =20
> >
> > I had suggested using atomics back when I was reviewing the
> > shmem-shrinker stuff to avoid this exact same issue. I can't find the
> > thread anymore and I can't remember the rationale either (probably that
> > saturation detection was useful, still), but the decision was to use a
> > refcount_t. I don't mind using atomics here, but I'd rather not be
> > blocked on that when/if I try to move that code into a common lib.
> >
> > [1]https://elixir.bootlin.com/linux/v6.19-rc4/source/include/linux/refc=
ount.h#L460 =20
>=20
> It's just a suggestion - no need to block on it.

Sure, np.

>=20
> It sounds like refcount_t should have an refcount_inc_maybe_first()
> where 0->1 is ok.

We actually need refcount_dec_maybe_last() in this context, but I get
the idea. Don't know if the "ATOMIC INFRASTRUCTURE" maintainers would
be okay with this idea though, since it's silencing the "do something
special when your counter reaches zero" behavior enforced by the
refcount API, and it's not that often that resources are released
lazily like that anyway, so maybe the extra line is not that big of a
deal.
