Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2083DBBDE67
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 13:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6301E10E357;
	Mon,  6 Oct 2025 11:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="my/QQ51+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5EB10E357
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759750873;
 bh=hUUotr5MYYM9aMcAKjEfjPvHV8s0XExBA23OlR2mXR8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=my/QQ51+SkDZGZdItelA0xu/CEBqSp22WzT1IV5M1OPTHxOkMK8+apad66Cjsxg+W
 T4xtxfXbS+xvPvoYGT/tTH0nnaG5f52Mp5aOlYynlMTFNPxOi2qzmryOc9In4dZJsZ
 4RM7bu6U69cW0f8mLkXssfSUorbb3qsrAyMssRdQg4ivFXBdTyIzMdJpe2OCHK4Q9H
 tGopfrl/BgQTfH9NrdnjyOzo6ZROCiOAepaJy592ls/mDmMBFpYWsbi9K/45JvyDvD
 k673KzmXvbXjihnvpeJHcuqDTC7AozU6SVeEhNpeteAVsvdtwB1cwmm4We9dZyfJbY
 0V5PQ8GrXQOzw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 143C917E0AC3;
 Mon,  6 Oct 2025 13:41:13 +0200 (CEST)
Date: Mon, 6 Oct 2025 13:41:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Liviu Dudau
 <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
Message-ID: <20251006134108.6a5cdcb7@fedora>
In-Reply-To: <CAH5fLgjteqdWVBfzU_2iq2v=9MV9rD+s3z6i2ZjrmqBUq6_byQ@mail.gmail.com>
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
 <DD71GUKZKFPR.2OVPQ9KOI89YG@kernel.org>
 <CAH5fLghM_fmaHn561_e7StHAwdV=8gPxAwUToDxPQiBY8E+aVA@mail.gmail.com>
 <20251001171346.482142eb@fedora>
 <CAH5fLgjteqdWVBfzU_2iq2v=9MV9rD+s3z6i2ZjrmqBUq6_byQ@mail.gmail.com>
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

On Mon, 6 Oct 2025 13:31:51 +0200
Alice Ryhl <aliceryhl@google.com> wrote:

> On Wed, Oct 1, 2025 at 5:13=E2=80=AFPM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Wed, 1 Oct 2025 16:42:35 +0200
> > Alice Ryhl <aliceryhl@google.com> wrote:
> > =20
> > > On Wed, Oct 1, 2025 at 4:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.=
org> wrote: =20
> > > >
> > > > On Wed Oct 1, 2025 at 12:41 PM CEST, Alice Ryhl wrote: =20
> > > > > +/*
> > > > > + * Must be called with GEM mutex held. After releasing GEM mutex,
> > > > > + * drm_gpuvm_bo_defer_free_unlocked() must be called.
> > > > > + */
> > > > > +static void
> > > > > +drm_gpuvm_bo_defer_free_locked(struct kref *kref)
> > > > > +{
> > > > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct dr=
m_gpuvm_bo,
> > > > > +                                               kref);
> > > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > > +
> > > > > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > > > > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > > > > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > > > > +     }
> > > > > +
> > > > > +     list_del(&vm_bo->list.entry.gem);
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * GEM mutex must not be held. Called after drm_gpuvm_bo_defer_f=
ree_locked().
> > > > > + */
> > > > > +static void
> > > > > +drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
> > > > > +{
> > > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > > +
> > > > > +     llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
> > > > > +}
> > > > > +
> > > > > +static void
> > > > > +drm_gpuvm_bo_defer_free(struct kref *kref)
> > > > > +{
> > > > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct dr=
m_gpuvm_bo,
> > > > > +                                               kref);
> > > > > +
> > > > > +     mutex_lock(&vm_bo->obj->gpuva.lock);
> > > > > +     drm_gpuvm_bo_defer_free_locked(kref);
> > > > > +     mutex_unlock(&vm_bo->obj->gpuva.lock);
> > > > > +
> > > > > +     /*
> > > > > +      * It's important that the GEM stays alive for the duration=
 in which we
> > > > > +      * hold the mutex, but the instant we add the vm_bo to bo_d=
efer,
> > > > > +      * another thread might call drm_gpuvm_bo_deferred_cleanup(=
) and put
> > > > > +      * the GEM. Therefore, to avoid kfreeing a mutex we are hol=
ding, we add
> > > > > +      * the vm_bo to bo_defer *after* releasing the GEM's mutex.
> > > > > +      */
> > > > > +     drm_gpuvm_bo_defer_free_unlocked(vm_bo);
> > > > > +} =20
> > > >
> > > > So, you're splitting drm_gpuvm_bo_defer_free() into two functions, =
one doing the
> > > > work that is required to be called with the gpuva lock held and one=
 that does
> > > > the work that does not require a lock, which makes perfect sense.
> > > >
> > > > However, the naming chosen for the two functions, i.e.
> > > > drm_gpuvm_bo_defer_free_unlocked() and drm_gpuvm_bo_defer_free_lock=
ed() is
> > > > confusing:
> > > >
> > > > What you mean semantically mean is "do part 1 with lock held" and "=
do part 2
> > > > without lock held", but the the chosen names suggest that both func=
tions are
> > > > identical, with the only difference that one takes the lock interna=
lly and the
> > > > other one requires the caller to take the lock.
> > > >
> > > > It's probably better to name them after what they do and not what t=
hey're part
> > > > of. If you prefer the latter, that's fine with me too, but please c=
hoose a name
> > > > that makes this circumstance obvious. =20
> > >
> > > Fair point. Do you have naming suggestions? Otherwise I can name them
> > > drm_gpuvm_bo_defer_free_part1() and drm_gpuvm_bo_defer_free_part2().
> > > :) =20
> >
> > drm_gpuvm_bo_free_deferral_extract_locked() and
> > drm_gpuvm_bo_free_deferral_enqueue()? Definitely not short names though=
. =20
>=20
> With those names I have to do some additional line breaks. How about:
>=20
> drm_gpuvm_bo_into_zombie()
> drm_gpuvm_bo_defer_zombie()

Sounds good. I think I'd prefer if the second one was called
drm_gpuvm_bo_defer_zombie_cleanup() to make clear what the deferral is
about, but feel free to ignore this if you think it's too long.
