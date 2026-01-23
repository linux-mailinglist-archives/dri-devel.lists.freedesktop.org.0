Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBC7LIrUcmnKpgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 02:53:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E516F620
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 02:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D437A88C11;
	Fri, 23 Jan 2026 01:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BOMIJVrT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756CF88C11;
 Fri, 23 Jan 2026 01:53:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769133186; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=a2EQCZkimdoHetOVozMgwBMpHO4grYd0FlPS0rUTHKF32yARRSCnD5oSTP48AVhCJlfJvxsMLFtR6mto88EhBolUHSX9k6DXYkfYbarf8y7h/bcnwook0NQ1lTfO9RXorv++Fo+xoqRlMxVwPjBajPuk7/AA5x+7DrcEZxVx0KU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769133186;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yfMG+dkmMembPilVmP4vEhwfn/Ev5TUMJIRJdXXxAhM=; 
 b=OwxCS1W441vjLlfGlK7FGytVTTH2AqEepYAAhLipUTXfUAzteD85ktfx1J9w9pJIIfR2L8nbLSESZAkOJ1zU3To2ruTkpKMrdCp1+7Oa7CcxGs/c4ewoeEwtZC8hxtVg1S1ES9ORVNVdNRhTbmqLtPoGWt8IUgpA0jwCC4ct72A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769133186; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=yfMG+dkmMembPilVmP4vEhwfn/Ev5TUMJIRJdXXxAhM=;
 b=BOMIJVrTZVXGbb7n8qKf7WjoxtojKKH4hc2IqD+RYc1kzPJqXvbVzbz7WLJO4kZF
 bo+bAthL9qaHjkeo8H767C6L0fPCLO4Fo61rOLmD3bHv5FpBbVthOkHQ/6UdbflC+aW
 V4qS4PToJ/b2vgEDq6hWr79ubC9Vs0RPrzqvy7as=
Received: by mx.zohomail.com with SMTPS id 1769133183513650.3173926183874;
 Thu, 22 Jan 2026 17:53:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 2/3] rust/drm: Don't setup private driver data until
 registration
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260122225057.3589500-3-lyude@redhat.com>
Date: Thu, 22 Jan 2026 22:52:31 -0300
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E3CBBAB1-4EED-4052-B9DC-AAEB58D67265@collabora.com>
References: <20260122225057.3589500-1-lyude@redhat.com>
 <20260122225057.3589500-3-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	APPLE_MAILER_COMMON(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 23E516F620
X-Rspamd-Action: no action

Hi Lyude,

> On 22 Jan 2026, at 19:46, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Now that we have a DeviceContext that we can use to represent whether =
a
> Device is known to have been registered, we can make it so that =
drivers can
> create their Devices but wait until the registration phase to assign =
their
> private data to the Device. This is desirable as some drivers need to =
make
> use of the DRM device early on before finalizing their private driver =
data.
>=20
> As such, this change makes it so that the driver's private data can
> currently only be accessed through Device<T, Registered> types and not
> Device<T, Uninit>.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> drivers/gpu/drm/nova/driver.rs |  4 +--
> drivers/gpu/drm/tyr/driver.rs  |  4 +--
> rust/kernel/drm/device.rs      | 63 ++++++++++++++++++++--------------
> rust/kernel/drm/driver.rs      | 19 ++++++++--
> 4 files changed, 58 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/driver.rs =
b/drivers/gpu/drm/nova/driver.rs
> index 99d6841b69cbc..8cea5f68c3b04 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -56,8 +56,8 @@ impl auxiliary::Driver for NovaDriver {
>     fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> =
impl PinInit<Self, Error> {
>         let data =3D try_pin_init!(NovaData { adev: adev.into() });
>=20
> -        let drm =3D =
drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
> -        let drm =3D drm::Registration::new_foreign_owned(drm, =
adev.as_ref(), 0)?;
> +        let drm =3D =
drm::UnregisteredDevice::<Self>::new(adev.as_ref())?;
> +        let drm =3D drm::Registration::new_foreign_owned(drm, =
adev.as_ref(), data, 0)?;
>=20
>         Ok(Self { drm: drm.into() })
>     }
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index ac265a60f5667..e73c56659ea75 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -133,8 +133,8 @@ fn probe(
>                 gpu_info,
>         });
>=20
> -        let tdev =3D =
drm::UnregisteredDevice::<Self>::new(pdev.as_ref(), data)?;
> -        let tdev =3D =
drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), 0)?;
> +        let tdev =3D =
drm::UnregisteredDevice::<Self>::new(pdev.as_ref())?;
> +        let tdev =3D =
drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), data, =
0)?;
>=20
>         let driver =3D TyrDriver {
>             device: tdev.into(),
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index f529bc7fc4032..0e81957cf8c28 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -26,13 +26,15 @@
> };
> use core::{
>     alloc::Layout,
> +    cell::UnsafeCell,
>     marker::PhantomData,
> -    mem,
> -    ops::Deref,
> -    ptr::{
> +    mem::{
>         self,
> -        NonNull, //
> +        MaybeUninit, //
>     },
> +    ops::Deref,
> +    ptr::NonNull,
> +    sync::atomic::*,
> };
>=20
> #[cfg(CONFIG_DRM_LEGACY)]
> @@ -141,7 +143,7 @@ impl DeviceContext for Uninit {}
> ///
> /// The device in `self.0` is guaranteed to be a newly created =
[`Device`] that has not yet been
> /// registered with userspace until this type is dropped.
> -pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, =
Uninit>>, NotThreadSafe);
> +pub struct UnregisteredDevice<T: drm::Driver>(pub(crate) =
ARef<Device<T, Uninit>>, NotThreadSafe);
>=20
> impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
>     type Target =3D Device<T, Uninit>;
> @@ -188,7 +190,7 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
>     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
>     ///
>     /// This can be used to create a =
[`Registration`](kernel::drm::Registration).
> -    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, =
Error>) -> Result<Self> {
> +    pub fn new(dev: &device::Device) -> Result<Self> {
>         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, =
hence ensure a `kmalloc()`
>         // compatible `Layout`.
>         let layout =3D Kmalloc::aligned_layout(Layout::new::<Self>());
> @@ -207,22 +209,6 @@ pub fn new(dev: &device::Device, data: impl =
PinInit<T::Data, Error>) -> Result<S
>         .cast();
>         let raw_drm =3D =
NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOMEM)?;
>=20
> -        // SAFETY: `raw_drm` is a valid pointer to `Self`.
> -        let raw_data =3D unsafe { =
ptr::addr_of_mut!((*raw_drm.as_ptr()).data) };
> -
> -        // SAFETY:
> -        // - `raw_data` is a valid pointer to uninitialized memory.
> -        // - `raw_data` will not move until it is dropped.
> -        unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
> -            // SAFETY: `raw_drm` is a valid pointer to `Self`, given =
that `__drm_dev_alloc` was
> -            // successful.
> -            let drm_dev =3D unsafe { Device::into_drm_device(raw_drm) =
};
> -
> -            // SAFETY: `__drm_dev_alloc()` was successful, hence =
`drm_dev` must be valid and the
> -            // refcount must be non-zero.
> -            unsafe { bindings::drm_dev_put(drm_dev) };
> -        })?;
> -
>         // SAFETY: The reference count is one, and now we take =
ownership of that reference as a
>         // `drm::Device`.
>         // INVARIANT: We just created the device above, but have yet =
to call `drm_dev_register`.
> @@ -254,7 +240,15 @@ pub fn new(dev: &device::Device, data: impl =
PinInit<T::Data, Error>) -> Result<S
> #[repr(C)]
> pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
>     dev: Opaque<bindings::drm_device>,
> -    data: T::Data,
> +
> +    /// Keeps track of whether we've initialized the device data yet.
> +    pub(crate) data_is_init: AtomicBool,

Why don=E2=80=99t we make the data a member of the Registered context?

> +
> +    /// The Driver's private data.
> +    ///
> +    /// This must only be written to from [`drm::Registration::new`].
> +    pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,
> +
>     _ctx: PhantomData<C>,
> }
>=20
> @@ -305,6 +299,21 @@ extern "C" fn release(ptr: *mut =
bindings::drm_device) {
>         // SAFETY: `ptr` is a valid pointer to a `struct drm_device` =
and embedded in `Self`.
>         let this =3D unsafe { Self::from_drm_device(ptr) };
>=20
> +        {
> +            // SAFETY:
> +            // - Since we are in release(), we are guaranteed that no =
one else has access to `this`.
> +            // - We confirmed above that `this` is a valid pointer to =
an initialized `Self`.
> +            let this =3D unsafe { &mut *this };
> +            if this.data_is_init.load(Ordering::Relaxed) {
> +                // SAFETY:
> +                // - Since we are in release(), we are guaranteed =
that no one else has access to
> +                //   `this`.
> +                // - We checked that the data is initialized above.
> +                // - We do not use `data` any point after calling =
this function.
> +                unsafe { (&mut *this.data.get()).assume_init_drop() =
};
> +            }
> +        }
> +
>         // SAFETY:
>         // - When `release` runs it is guaranteed that there is no =
further access to `this`.
>         // - `this` is valid for dropping.
> @@ -323,11 +332,15 @@ pub(crate) unsafe fn assume_ctx<NewCtx: =
DeviceContext>(&self) -> &Device<T, NewC
>     }
> }
>=20
> -impl<T: drm::Driver, C: DeviceContext> Deref for Device<T, C> {
> +impl<T: drm::Driver> Deref for Device<T, Registered> {
>     type Target =3D T::Data;
>=20
>     fn deref(&self) -> &Self::Target {
> -        &self.data
> +        // SAFETY:
> +        // - `data` is initialized before any `Device`s with the =
`Registered` context are available
> +        //   to the user.
> +        // - `data` is only written to once in `Registration::new()`, =
so this read will never race.
> +        unsafe { (&*self.data.get()).assume_init_ref() }
>     }
> }
>=20
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index da9f1bfef1f14..a16605b407159 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -15,7 +15,8 @@
> };
> use core::{
>     mem,
> -    ptr::NonNull, //
> +    ptr::NonNull,
> +    sync::atomic::*, //
> };
>=20
> /// Driver use the GEM memory manager. This should be set for all =
modern drivers.
> @@ -127,7 +128,18 @@ pub trait Driver {
> pub struct Registration<T: Driver>(ARef<drm::Device<T>>);
>=20
> impl<T: Driver> Registration<T> {
> -    fn new(drm: drm::UnregisteredDevice<T>, flags: usize) -> =
Result<Self> {
> +    fn new(
> +        drm: drm::UnregisteredDevice<T>,
> +        data: impl PinInit<T::Data, Error>,
> +        flags: usize,
> +    ) -> Result<Self> {

IIUC this consumes UnregisteredDevice and returns=20

Registration<T: Driver>(ARef<drm::Device<T>>);

i.e.:

Registration<T: Driver>(ARef<drm::Device<T, C =3D Registered>>);

Again, the Registered typestate seems like the perfect place to store =
T::Data.


> +        // SAFETY:
> +        // - `raw_data` is a valid pointer to uninitialized memory.
> +        // - `raw_data` will not move until it is dropped.
> +        unsafe { data.__pinned_init(drm.0.data.get().cast()) }?;
> +
> +        drm.data_is_init.store(true, Ordering::Relaxed);
> +
>         // SAFETY: `drm.as_raw()` is valid by the invariants of =
`drm::Device`.
>         to_result(unsafe { bindings::drm_dev_register(drm.as_raw(), =
flags) })?;
>=20
> @@ -150,6 +162,7 @@ fn new(drm: drm::UnregisteredDevice<T>, flags: =
usize) -> Result<Self> {
>     pub fn new_foreign_owned<'a>(
>         drm: drm::UnregisteredDevice<T>,
>         dev: &'a device::Device<device::Bound>,
> +        data: impl PinInit<T::Data, Error>,
>         flags: usize,
>     ) -> Result<&'a drm::Device<T>>
>     where
> @@ -160,7 +173,7 @@ pub fn new_foreign_owned<'a>(
>             return Err(EINVAL);
>         }
>=20
> -        let reg =3D Registration::<T>::new(drm, flags)?;
> +        let reg =3D Registration::<T>::new(drm, data, flags)?;
>         let drm =3D NonNull::from(reg.device());
>=20
>         devres::register(dev, reg, GFP_KERNEL)?;
> --=20
> 2.52.0
>=20

