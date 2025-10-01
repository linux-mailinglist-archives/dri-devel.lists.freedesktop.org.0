Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E0BB0FF1
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 17:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D78610E08B;
	Wed,  1 Oct 2025 15:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="acDYKDlk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A4A10E08B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 15:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759331630;
 bh=f2pt9BkEMx3ptqqD1vPp/R/QxVaCY72d5ngPAgE3eBk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=acDYKDlkavcHRTzLkn/2F3viCrcT5C3gxkQI8w6NbKYUivdOE+k8p4mKn+Z+AnPyj
 NZOps7NkQFBOgDLf+67YMDBwOhpfcP/tkj6X1JDyW90qYMicj8agdrAA283txmP86O
 7hk9H382WT75Mw2r18rEAQPe+G9jN8AHEdJjylgf3BKL+xZZD9ZAIPE7HsMx2iAZ3B
 LKTLXqNhsOVzDe9XnPJRMQqrPrZEnQDvDbMPGeSEmB0GrA+Q9C21teczc0K+xqsPW0
 IsqvmCBHKHwUiqmoSA3fLKR9kqFaAdsegCnuZ+31vx8+GpH53idtntYsk83i0f+mHc
 Xts20/pO9ymWA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 47DF217E0AC3;
 Wed,  1 Oct 2025 17:13:50 +0200 (CEST)
Date: Wed, 1 Oct 2025 17:13:46 +0200
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
Message-ID: <20251001171346.482142eb@fedora>
In-Reply-To: <CAH5fLghM_fmaHn561_e7StHAwdV=8gPxAwUToDxPQiBY8E+aVA@mail.gmail.com>
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
 <DD71GUKZKFPR.2OVPQ9KOI89YG@kernel.org>
 <CAH5fLghM_fmaHn561_e7StHAwdV=8gPxAwUToDxPQiBY8E+aVA@mail.gmail.com>
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

On Wed, 1 Oct 2025 16:42:35 +0200
Alice Ryhl <aliceryhl@google.com> wrote:

> On Wed, Oct 1, 2025 at 4:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
> >
> > On Wed Oct 1, 2025 at 12:41 PM CEST, Alice Ryhl wrote: =20
> > > +/*
> > > + * Must be called with GEM mutex held. After releasing GEM mutex,
> > > + * drm_gpuvm_bo_defer_free_unlocked() must be called.
> > > + */
> > > +static void
> > > +drm_gpuvm_bo_defer_free_locked(struct kref *kref)
> > > +{
> > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gp=
uvm_bo,
> > > +                                               kref);
> > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > +
> > > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > > +     }
> > > +
> > > +     list_del(&vm_bo->list.entry.gem);
> > > +}
> > > +
> > > +/*
> > > + * GEM mutex must not be held. Called after drm_gpuvm_bo_defer_free_=
locked().
> > > + */
> > > +static void
> > > +drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
> > > +{
> > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > +
> > > +     llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
> > > +}
> > > +
> > > +static void
> > > +drm_gpuvm_bo_defer_free(struct kref *kref)
> > > +{
> > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gp=
uvm_bo,
> > > +                                               kref);
> > > +
> > > +     mutex_lock(&vm_bo->obj->gpuva.lock);
> > > +     drm_gpuvm_bo_defer_free_locked(kref);
> > > +     mutex_unlock(&vm_bo->obj->gpuva.lock);
> > > +
> > > +     /*
> > > +      * It's important that the GEM stays alive for the duration in =
which we
> > > +      * hold the mutex, but the instant we add the vm_bo to bo_defer,
> > > +      * another thread might call drm_gpuvm_bo_deferred_cleanup() an=
d put
> > > +      * the GEM. Therefore, to avoid kfreeing a mutex we are holding=
, we add
> > > +      * the vm_bo to bo_defer *after* releasing the GEM's mutex.
> > > +      */
> > > +     drm_gpuvm_bo_defer_free_unlocked(vm_bo);
> > > +} =20
> >
> > So, you're splitting drm_gpuvm_bo_defer_free() into two functions, one =
doing the
> > work that is required to be called with the gpuva lock held and one tha=
t does
> > the work that does not require a lock, which makes perfect sense.
> >
> > However, the naming chosen for the two functions, i.e.
> > drm_gpuvm_bo_defer_free_unlocked() and drm_gpuvm_bo_defer_free_locked()=
 is
> > confusing:
> >
> > What you mean semantically mean is "do part 1 with lock held" and "do p=
art 2
> > without lock held", but the the chosen names suggest that both function=
s are
> > identical, with the only difference that one takes the lock internally =
and the
> > other one requires the caller to take the lock.
> >
> > It's probably better to name them after what they do and not what they'=
re part
> > of. If you prefer the latter, that's fine with me too, but please choos=
e a name
> > that makes this circumstance obvious. =20
>=20
> Fair point. Do you have naming suggestions? Otherwise I can name them
> drm_gpuvm_bo_defer_free_part1() and drm_gpuvm_bo_defer_free_part2().
> :)

drm_gpuvm_bo_free_deferral_extract_locked() and
drm_gpuvm_bo_free_deferral_enqueue()? Definitely not short names though.
