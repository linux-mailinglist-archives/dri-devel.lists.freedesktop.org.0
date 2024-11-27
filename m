Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E877C9DAC2E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 18:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F02910E048;
	Wed, 27 Nov 2024 17:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ckZybp51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464FA10E048
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 17:04:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732727037; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jIF6WcFsa7I0SVmYvBQiGg86iB7nlnV0i/9U4SrBCqUb/xp1zBp7n9E+Upzh8fGkNTRYoihRMBMHVFZWZptABwMwTR30EZhHOvlmQzHgVA5X+eunqI5J8FHTn+h80VrHPffgZh9Jp7QTpgoYDvb5E7acHQPG/1S0jT1m6RbM5Is=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732727037;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ThqB6Cw1Jz5IsPrydDGEs7scPjQXlxcw0xZC/VMUBio=; 
 b=M47wD+ldu5Rd5vv+QW4ajan+iTOSVOSrCAVqDqFHznuG5htUYvxiCDQH7To6abMlGDtqS7bThh2qxr6BjmONdBVPVWJDiUJ6VmCX+bJ4wtOUy7ubN78hzkXxwEchTmEpuETIZ2NgftXkvXo5EVXHFrGVwtRub8Nvwfg3wBhzeQI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732727037; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=ThqB6Cw1Jz5IsPrydDGEs7scPjQXlxcw0xZC/VMUBio=;
 b=ckZybp51h0i6ipcllrZLB5l8jXfgjNJzJGy+S71P1LMZkCIlaqu+H+DbvnSG+aGC
 gtGEe0wy/JIURPNLz0/DNvdvMY7XSnSSklJgKrvSG/aZoH53/fsF54ghsKd6YM6l/9E
 CL+vcyk/PXb/k1+En7vvaeeZ7o1uxZU/zwOdbK1U=
Received: by mx.zohomail.com with SMTPS id 1732727035170332.7762190998259;
 Wed, 27 Nov 2024 09:03:55 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 15/35] WIP: rust: drm/kms: Add OpaquePlane and
 OpaquePlaneState
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-16-lyude@redhat.com>
Date: Wed, 27 Nov 2024 14:03:39 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <46A2C748-0EC5-481D-8473-09182C1D44DF@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-16-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-ZohoMailClient: External
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

Hi Lyude,

> On 30 Sep 2024, at 20:09, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Same thing as OpaqueCrtc and OpaqueCrtcState, but for plane states =
now.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> TODO:
> * Finish adding upcast functions.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/plane.rs | 143 +++++++++++++++++++++++++++++++++++
> 1 file changed, 143 insertions(+)
>=20
> diff --git a/rust/kernel/drm/kms/plane.rs =
b/rust/kernel/drm/kms/plane.rs
> index 3040c4546b121..3ace487316d46 100644
> --- a/rust/kernel/drm/kms/plane.rs
> +++ b/rust/kernel/drm/kms/plane.rs
> @@ -217,6 +217,43 @@ pub fn new<'a, 'b: 'a, const FMT_COUNT: usize, =
const MOD_COUNT: usize>(
>         // SAFETY: We don't move anything
>         Ok(unsafe { &*Box::into_raw(Pin::into_inner_unchecked(this)) =
})
>     }
> +
> +    /// Attempt to convert an [`OpaquePlane`] into a fully qualified =
[`Plane`].
> +    ///
> +    /// This checks if the given [`OpaquePlane`] uses the same =
[`DriverPlane`] implementation, and
> +    /// returns the [`OpaquePlane`] as a [`Plane`] object if so.
> +    pub fn try_from_opaque<'a, D>(opaque: &'a OpaquePlane<D>) -> =
Option<&'a Self>
> +    where
> +        D: KmsDriver,
> +        T: DriverPlane<Driver =3D D>
> +    {
> +        // SAFETY: The vtables for a `Plane` are initialized by the =
time that we expose `Plane`
> +        // objects to users, and their values are invariant =
throughout the lifetime of the device.
> +        let funcs =3D unsafe { (*opaque.plane.get()).funcs };
> +
> +        // SAFETY: We just guaranteed that the opaque plane shares =
our vtable pointers, which means
> +        // it must belong to our `DriverPlane` implementation. As =
well, all `Plane<DriverPlane>`
> +        // objects start with an identical data layout to =
`OpaquePlane`
> +        ptr::eq(funcs, &T::OPS.funcs).then(|| unsafe { =
mem::transmute(opaque) })
> +    }
> +
> +    /// Convert a [`OpaquePlane`] into its fully qualified [`Plane`].
> +    ///
> +    /// This is an infallible version of [`Self::try_from_opaque`]. =
This function is mainly useful
> +    /// for drivers where only a single [`DriverPlane`] =
implementation exists.
> +    ///
> +    /// # Panics
> +    ///
> +    /// This function will panic if the underlying [`Plane`] which =
contains the provided
> +    /// [`OpaquePlane`] does not belong to the same [`DriverPlane`] =
implementation.
> +    pub fn from_opaque<'a, D>(opaque: &'a OpaquePlane<D>) -> &'a Self
> +    where
> +        D: KmsDriver,
> +        T: DriverPlane<Driver =3D D>
> +    {
> +        Self::try_from_opaque(opaque)
> +            .expect("Passed OpaquePlane does not share this =
DriverPlane implementation")
> +    }

I guess the same question from the previous patch applies. If a driver =
has only a single implementor for
`DriverPlane`, why should it care about OpaquePlane?

> }
>=20
> /// A trait implemented by any type that acts as a [`struct =
drm_plane`] interface.
> @@ -275,6 +312,63 @@ unsafe impl<T: DriverPlane> Send for Plane<T> {}
> // SAFETY: Our interface is thread-safe.
> unsafe impl<T: DriverPlane> Sync for Plane<T> {}
>=20
> +/// A [`struct drm_plane`] without a known [`DriverPlane`] =
implementation.
> +///
> +/// This is mainly for situations where our bindings can't infer the =
[`DriverPlane`] implementation
> +/// for a [`struct drm_plane`] automatically. It is identical to =
[`Plane`], except that it does not
> +/// provide access to the driver's private data.
> +///
> +/// It may be upcasted to a full [`Plane`] using =
[`Plane::from_opaque`] or
> +/// [`Plane::try_from_opaque`].
> +///
> +/// # Invariants
> +///
> +/// - `plane` is initialized for as long as this object is made =
available to users.
> +/// - The data layout of this structure is equivalent to [`struct =
drm_plane`].
> +///
> +/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
> +#[repr(transparent)]
> +pub struct OpaquePlane<T: KmsDriver> {
> +    plane: Opaque<bindings::drm_plane>,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: KmsDriver> Sealed for OpaquePlane<T> {}
> +
> +impl<T: KmsDriver> AsRawPlane for OpaquePlane<T> {
> +    type State =3D OpaquePlaneState<T>;
> +
> +    fn as_raw(&self) -> *mut bindings::drm_plane {
> +        self.plane.get()
> +    }
> +
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_plane) -> &'a Self =
{
> +        // SAFETY: Our data layout is identical to =
`bindings::drm_plane`
> +        unsafe { &*ptr.cast() }
> +    }
> +}
> +
> +impl<T: KmsDriver> ModeObject for OpaquePlane<T> {
> +    type Driver =3D T;
> +
> +    fn drm_dev(&self) -> &Device<Self::Driver> {
> +        // SAFETY: DRM planes exist for as long as the device does, =
so this pointer is always valid
> +        unsafe { Device::borrow((*self.as_raw()).dev) }
> +    }
> +
> +    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
> +        // SAFETY: We don't expose DRM planes to users before `base` =
is initialized
> +        unsafe { &mut ((*self.as_raw()).base) }
> +    }
> +}
> +
> +// SAFETY: Planes do not have a refcount
> +unsafe impl<T: KmsDriver> StaticModeObject for OpaquePlane<T> {}
> +
> +// SAFETY: Our plane interfaces are guaranteed to be thread-safe
> +unsafe impl<T: KmsDriver> Send for OpaquePlane<T> {}
> +unsafe impl<T: KmsDriver> Sync for OpaquePlane<T> {}
> +
> /// A trait implemented by any type which can produce a reference to a =
[`struct drm_plane_state`].
> ///
> /// This is implemented internally by DRM.
> @@ -419,6 +513,55 @@ fn deref_mut(&mut self) -> &mut Self::Target {
>     }
> }
>=20
> +/// A [`struct drm_plane_state`] without a known [`DriverPlaneState`] =
implementation.
> +///
> +/// This is mainly for situations where our bindings can't infer the =
[`DriverPlaneState`]
> +/// implementation for a [`struct drm_plane_state`] automatically. It =
is identical to [`Plane`],
> +/// except that it does not provide access to the driver's private =
data.
> +///
> +/// TODO: Add upcast functions
> +///
> +/// # Invariants
> +///
> +/// - The DRM C API and our interface guarantees that only the user =
has mutable access to `state`,
> +///   up until [`drm_atomic_helper_commit_hw_done`] is called. =
Therefore, `plane` follows rust's
> +///   data aliasing rules and does not need to be behind an =
[`Opaque`] type.
> +/// - `state` is initialized for as long as this object is exposed to =
users.
> +/// - The data layout of this structure is identical to [`struct =
drm_plane_state`].
> +///
> +/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
> +/// [`drm_atomic_helper_commit_hw_done`]: =
srctree/include/drm/drm_atomic_helper.h
> +#[repr(transparent)]
> +pub struct OpaquePlaneState<T: KmsDriver> {
> +    state: bindings::drm_plane_state,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: KmsDriver> AsRawPlaneState for OpaquePlaneState<T> {
> +    type Plane =3D OpaquePlane<T>;
> +}
> +
> +impl<T: KmsDriver> private::AsRawPlaneState for OpaquePlaneState<T> {
> +    fn as_raw(&self) -> &bindings::drm_plane_state {
> +        &self.state
> +    }
> +
> +    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_plane_state =
{
> +        &mut self.state
> +    }
> +}
> +
> +impl<T: KmsDriver> FromRawPlaneState for OpaquePlaneState<T> {
> +    unsafe fn from_raw<'a>(ptr: *const bindings::drm_plane_state) -> =
&'a Self {
> +        // SAFETY: Our data layout is identical to `ptr`
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) =
-> &'a mut Self {
> +        // SAFETY: Our data layout is identical to `ptr`
> +        unsafe { &mut *ptr.cast() }
> +    }
> +}
> unsafe extern "C" fn plane_destroy_callback<T: DriverPlane>(
>     plane: *mut bindings::drm_plane
> ) {
> --=20
> 2.46.1
>=20

Apart for the clarification I asked above, this patch looks good.

=E2=80=94 Daniel

