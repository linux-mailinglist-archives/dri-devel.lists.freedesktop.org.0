Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064C3AE047D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 13:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B85410EA0C;
	Thu, 19 Jun 2025 11:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FwF6rciV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A84B10EA0B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 11:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750334234;
 bh=DR/rK5HTj+CWk3pzua5Z1Bq7gFUhrjz26jlD1PlmDUQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FwF6rciVdJ8E6CWw8PHfonXBYZhIx242n/qAuaGVrLLGKSaZXwUPkPGH5WyuxC36X
 TszAddwZ75xYE/OOKKdq0+zVOOsFrc9KP90kLV/Zq0mxEyyF2Rzcz4ACTpH5zlJCzO
 34mzBRe/RkSOBdot2lihqN3siVwgDnyzLE+/T20ll386qT3uJR2Eg0Uz2gllUMGjkU
 WSW9k3YQZ2bzMByXM9/kWiEksP3U0yJbrN/TfB4RDLs+lBtRkRKuLprCkiii8aX+nK
 Wz1OffDaFvSD9lrMOXpoDbSRFrXKQsxu9NlWIoLoCMb1UZPnNCUoqSeAsNViOXPkd3
 8+eqKYLpRirbQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 437B917E0863;
 Thu, 19 Jun 2025 13:57:13 +0200 (CEST)
Date: Thu, 19 Jun 2025 13:57:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Lyude Paul <lyude@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v2 2/2] rust: drm: Add GPUVM abstraction
Message-ID: <20250619135709.634625e0@collabora.com>
In-Reply-To: <F731D6F7-312D-4633-B677-69B7CC7194A6@collabora.com>
References: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
 <20250422-gpuvm-v2-2-44d4fc25e411@collabora.com>
 <aAgHGuzCZzh7YPz2@cassiopeiae>
 <DBB3E8CE-19AA-437D-AF54-BF23763B254F@collabora.com>
 <aAj7gAzFVRX3dN7L@pollux>
 <F731D6F7-312D-4633-B677-69B7CC7194A6@collabora.com>
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

Hi,

On Fri, 13 Jun 2025 13:42:59 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> Danilo,
>=20
>=20
> > <snip>
> >  =20
> >>>> +// SAFETY: DRM GpuVmBo objects are always reference counted and the=
 get/put functions
> >>>> +// satisfy the requirements.
> >>>> +unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
> >>>> +    fn inc_ref(&self) {
> >>>> +        // SAFETY: The drm_gpuvm_get function satisfies the require=
ments for inc_ref().
> >>>> +        unsafe { bindings::drm_gpuvm_bo_get(&self.bo as *const _ as=
 *mut _) };
> >>>> +    }
> >>>> +
> >>>> +    unsafe fn dec_ref(mut obj: NonNull<Self>) {
> >>>> +        // SAFETY: drm_gpuvm_bo_put() requires holding the gpuva lo=
ck, which is
> >>>> +        // the dma_resv lock by default.
> >>>> +        // The drm_gpuvm_put function satisfies the requirements fo=
r dec_ref().
> >>>> +        // (We do not support custom locks yet.)
> >>>> +        unsafe {
> >>>> +            let resv =3D (*obj.as_mut().bo.obj).resv;
> >>>> +            bindings::dma_resv_lock(resv, core::ptr::null_mut());
> >>>> +            bindings::drm_gpuvm_bo_put(&mut obj.as_mut().bo);
> >>>> +            bindings::dma_resv_unlock(resv); =20
> >>>=20
> >>> What if the resv_lock is held already? Please also make sure to put m=
ultiple
> >>> unsafe calls each in a separate unsafe block. =20
> >>=20
> >> By whom? =20
> >=20
> > The lock might be held already by the driver or by TTM when things are =
called
> > from TTM callbacks.
> >=20
> > This is why GPUVM never takes locks by itself, but asserts that the cor=
rect lock
> > is held.
> >=20
> > I think we really want to get proof by the driver by providing lock gua=
rd
> > references.
> >  =20
>=20
> There doesn=E2=80=99t seem to be a solution that fits all the boxes here.
>=20
> As you said, at this point the current status of the resv is unknown. If =
we
> simply assume that it is not taken, we run into the problem you pointed o=
ut:
> i.e.: recursive locking where ttm or some other layer has the lock alread=
y.
>=20
> Alternatively, if we assume that the resv must be locked in dec_ref(), th=
en we
> may build a lock::Guard from it and assert that it is held, but in any ca=
se
> it's very confusing to expect the reservation to be locked on a dec_ref()=
 call.
>=20
> The fact that dec_ref() is placed automatically on drop will massively
> complicate the call sites:

I'm digressing, but there's an aspect I found very annoying in the C
version of the API: the fact that we have to take a BO ref, then lock,
then release the vm_bo [1], because otherwise the vm_bo might be the
last owner of a BO ref leading to a UAF on the lock itself. This to me,
denotes a lifetime issue that I think would be good to address in the
rust version of the API.

It's not exactly the same problem, but I think it comes from the same
root issue: lax ownership definition. By that I mean it's not clear
who's the owner and who's the owned. gem_object::gpuva::list has
weak refs on the vm_bos contained in this list, which kinda makes sense
because vm_bos themselves have a ref on the gem_object, and if we were
to make this weak ref a strong ref we'd never free any of these two
objects. The lock is also part of the BO (either the BO resv lock, or a
custom lock), and since it's the very same lock we use to insert/remove
vm_bos, that's problematic.

If we were making the gpuvm_bo_list a separate object that's originally
created by the BO, and then let the GPUVM layer manipulate only this
list, it could work. Of course that means the resv lock/driver custom
lock should come from this object too, and I'm not too sure that's an
option when dma_buf imports are involved.

>=20
> We will have to ensure that the resv is locked at all times where we inte=
rface
> with a GpuVmBo, because each of these points could possibly be the last a=
ctive
> ref. If we don't, then we've introduced a race where the list is modified=
 but
> no lock is taken, which will be a pretty easy mistake to make. This seems=
 to
> also be the case in C, which we should try to improve upon.

Yep, with auto-unref thrown into the mix you have to be very careful on
which paths might release the last vm_bo ref, and make sure an extra
ref is taken on the BO, and the resv/custom lock is held when that
happens.

>=20
> My suggestion is to introduce a separate GPU-VA lock here:
>=20
> /// A base GEM object.
> #[repr(C)]
> #[pin_data]
> pub struct Object<T: DriverObject> {
>     obj: bindings::drm_gem_object,
>     // The DRM core ensures the Device exists as long as its objects exis=
t, so we don't need to
>     // manage the reference count here.
>     dev: *const bindings::drm_device,
>     #[pin]
>     inner: T,
>     #[pin]
>     _p: PhantomPinned,
>     // Add a GPU-VA lock here <--------
> }
>=20
> And only support custom locks in Rust, to the detriment of the optimizati=
on
> where the resv is used and to the detriment of any perf improvements that
> reusing the reservation might bring to the table.

Yes, if it was only about perf optimizations, then I'd like to see
numbers that prove taking an extra lock that's always going to be free
in a path where you already took the BO resv lock actually makes a
difference, and honestly, I doubt it. But my fear is that it's not so
much about avoiding an extra lock to be taken, and more about making
sure this list insertion/deletion doesn't race with other paths that
are assuming that taking the resv lock is enough to guarantee exclusive
access to this vm_bo list (I mean places outside gpuvm, in the drivers
directly). I guess the is fixable.

>=20
> Notice that this would sidestep this entire discussion: nobody else would=
 be
> aware of this new lock so we could safely lock it in dec_ref(). We would =
also
> be transparently managing the locking on behalf of drivers in all the oth=
er
> calls where the VA list is accessed, which is another plus as I said abov=
e.

If the lock is part of the gem_object, it's not solving the problem I
described above, because you might be taking a lock that disappears if
you don't take a BO ref before taking the lock. In the end, that's
still a risky business.

>=20
> I understand that most C drivers do not need an extra lock, but it's gett=
ing
> hard to emulate this behavior in Rust.
>=20
> Also, the fact that they don't need an extra lock does not invalidate the=
 fact
> that it would be simply safer to have this extra lock anyways. In other w=
ords,
> it is still completely possible to use GPUVM without locking anything and=
 IMHO
> we shouldn't bring this over if we can help it.

Overall, I do agree with Daniel here. We'd rather think about how to
make the C API more user-friendly by clearly defining
ownership/lifetime before we try to add rust bindings on top.
Deciding where the lock comes from is part of the discussion, but IMHO,
that's not the only thing we need to sort out.

I hope that me chiming in didn't make the situation worse :-/, and I'd
be fine if someone convince me that what I complain about here is
actually not a problem in rust :-).

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v6.15.2/source/drivers/gpu/drm/panthor/=
panthor_mmu.c#L1090
