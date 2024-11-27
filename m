Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A119DAA4E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 16:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067E910E0E8;
	Wed, 27 Nov 2024 15:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="aPOtoNAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1305410E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 15:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732719810; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ic+sSeblIlMzNmyx93ijjM1GVdyzE8/eGMi0aumB5MO+91VUZg0htzi62u5hSN9WpJ56wqeFH/UhXH9uj+JQgZgIg6DSxqmf6l+w0lc+wkgHg5CSiD7GK1nfrZE0NzFBfUhTLmQ3xElUHpISB5wpQ7grX701ZMKN6YiGzAGnW7U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732719810;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FW2BjeUhmf7EpI5P3+7+Tgb5Vu35+00rH6VSDQTpzOs=; 
 b=gz6heiuUIt8N6kz6ksWOgP1BLJgCM4qQADfmxgNNNk2QR5KLU7/ARiu5O9EK3yVrd54llobMhPzzjsIN0D0cFlePh/vtaxO6QKu0ZuW/X2izzdaBRsWS4N2281B/jCBRKoDrnajn1JSlBXAdw+ucroTXFA9pnxfb2iKB/6zV8uI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732719810; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=FW2BjeUhmf7EpI5P3+7+Tgb5Vu35+00rH6VSDQTpzOs=;
 b=aPOtoNAIrmmuzLep4Wzb6pO4kc3Cln6MTfq7VDzbpP1q6Hjt5bMFdi1cZt2ugBcS
 FcBbo2qKnUZWqm0KB9/ZCoDmoNMp3StxSiWsA+RrE3cdhfAUrAV1rba+TXysScyR7Dv
 MihD8dBvkVtVtYRv/8dH6K2icKJWl6GQJn+1ZkvY=
Received: by mx.zohomail.com with SMTPS id 1732719808969656.9652960943769;
 Wed, 27 Nov 2024 07:03:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 10/35] rust: drm/kms: Add DriverConnector::get_mode
 callback
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-11-lyude@redhat.com>
Date: Wed, 27 Nov 2024 12:03:14 -0300
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
Message-Id: <36E11299-A121-46DB-8F8D-45AC4B99BCE6@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-11-lyude@redhat.com>
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
> Next up is filling out some of the basic connector hotplugging =
callbacks -
> which we'll need for setting up the fbdev helpers for KMS devices. =
Note
> that connector hotplugging in DRM follows a BFL scheme: pretty much =
all

A what scheme?

> probing is protected under the mighty drm_device->mode_config.lock, =
which
> of course is a bit counter-intuitive to rust's locking schemes where =
data
> is always associated with its lock.
>=20
> Since that lock is embedded in an FFI type and not a rust type, we =
need to
> introduce our own wrapper type that acts as a lock acquisition for =
this.
> This brings us to introducing a few new types:
>=20
> * ModeConfigGuard - the most basic lock guard, as long as this object =
is
>  alive we are guaranteed to be holding drm_device->mode_config.lock. =
This
>  object doesn't do much else on its own currently.
> * ConnectorGuard - an object which corresponds to a specific typed DRM
>  connector. This can only be acquired with a ModeConfigGuard, and will =
be
>  used to allow calling methods that are only safe to call with
>  drm_device->mode_config.lock held. Since it implements
>  Deref<Target=3DConnector<T>> as well, it can also be used for any =
other
>  operations that would normally be available on a DRM connector.
>=20
> And finally, we add the DriverConnector::get_modes() trait method =
which
> drivers can use to implement the drm_connector_helper_funcs.get_modes
> callback. Note that while we make this trait method mandatory, we only =
do
> so for the time being since VKMS doesn't do very much with DRM =
connectors -
> and as such we have no need yet to implement alternative connector =
probing
> schemes outside of get_modes().
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms.rs           | 70 ++++++++++++++++++++++++++++++++
> rust/kernel/drm/kms/connector.rs | 57 ++++++++++++++++++++++++--
> 2 files changed, 124 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index d5cad598f016f..d74267c78864f 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -18,6 +18,8 @@
>     types::*,
>     error::to_result,
>     private::Sealed,
> +    sync::{Mutex, MutexGuard},
> +    container_of
> };
> use core::{
>     ops::Deref,
> @@ -233,6 +235,21 @@ impl<T, K> KmsDriver for T
>     T: Driver<Kms =3D K>,
>     K: Kms<Driver =3D T> {}
>=20
> +impl<T: KmsDriver> Device<T> {
> +    /// Retrieve a pointer to the mode_config mutex
> +    #[inline]
> +    pub(crate) fn mode_config_mutex(&self) -> &Mutex<()> {
> +        // SAFETY: This lock is initialized for as long as =
`Device<T>` is exposed to users
> +        unsafe { Mutex::from_raw(&mut =
(*self.as_raw()).mode_config.mutex) }

Again, a bit hard to understand what=E2=80=99s going on here, since =
everything is on a single line.

> +    }
> +
> +    /// Acquire the [`mode_config.mutex`] for this [`Device`].
> +    #[inline]
> +    pub fn mode_config_lock(&self) -> ModeConfigGuard<'_, T> {
> +        ModeConfigGuard(self.mode_config_mutex().lock(), PhantomData)
> +    }
> +}
> +
> /// A modesetting object in DRM.
> ///
> /// This is any type of object where the underlying C object contains =
a [`struct drm_mode_object`].
> @@ -339,3 +356,56 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>         unsafe { =
bindings::drm_mode_object_put(obj.as_ref().raw_mode_obj()) }
>     }
> }
> +
> +/// A mode config guard.
> +///
> +/// This is an exclusive primitive that represents when =
[`drm_device.mode_config.mutex`] is held - as
> +/// some modesetting operations (particularly ones related to =
[`connectors`](connector)) are still
> +/// protected under this single lock. The lock will be dropped once =
this object is dropped.
> +///
> +/// # Invariants
> +///
> +/// - `self.0` is contained within a [`struct drm_mode_config`], =
which is contained within a
> +///   [`struct drm_device`].
> +/// - The [`KmsDriver`] implementation of that [`struct drm_device`] =
is always `T`.
> +/// - This type proves that [`drm_device.mode_config.mutex`] is =
acquired.
> +///
> +/// [`struct drm_mode_config`]: (srctree/include/drm/drm_device.h)
> +/// [`drm_device.mode_config.mutex`]: =
(srctree/include/drm/drm_device.h)
> +/// [`struct drm_device`]: (srctree/include/drm/drm_device.h)
> +pub struct ModeConfigGuard<'a, T: KmsDriver>(MutexGuard<'a, ()>, =
PhantomData<T>);
> +
> +impl<'a, T: KmsDriver> ModeConfigGuard<'a, T> {
> +    /// Construct a new [`ModeConfigGuard`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that [`drm_device.mode_config.mutex`] =
is acquired.
> +    ///
> +    /// [`drm_device.mode_config.mutex`]: =
(srctree/include/drm/drm_device.h)
> +    pub(crate) unsafe fn new(drm: &'a Device<T>) -> Self {
> +        // SAFETY: Our safety contract fulfills the requirements of =
`MutexGuard::new()`
> +        Self(unsafe { MutexGuard::new(drm.mode_config_mutex(), ()) }, =
PhantomData)
> +    }
> +
> +    /// Return the [`Device`] that this [`ModeConfigGuard`] belongs =
to.
> +    pub fn drm_dev(&self) -> &'a Device<T> {
> +        // SAFETY:
> +        // - `self` is embedded within a `drm_mode_config` via our =
type invariants
> +        // - `self.0.lock` has an equivalent data type to `mutex` via =
its type invariants.
> +        let mode_config =3D unsafe { container_of!(self.0.lock, =
bindings::drm_mode_config, mutex) };
> +
> +        // SAFETY: And that `drm_mode_config` lives in a `drm_device` =
via type invariants.
> +        unsafe { Device::borrow(container_of!(mode_config, =
bindings::drm_device, mode_config)) }
> +    }
> +
> +    /// Assert that the given device is the owner of this mode config =
guard.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `dev` is different from the owning device for this =
mode config guard.
> +    #[inline]
> +    pub(crate) fn assert_owner(&self, dev: &Device<T>) {
> +        assert!(ptr::eq(self.drm_dev(), dev));
> +    }
> +}
> diff --git a/rust/kernel/drm/kms/connector.rs =
b/rust/kernel/drm/kms/connector.rs
> index 54457b327c365..57ab29473c344 100644
> --- a/rust/kernel/drm/kms/connector.rs
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -19,7 +19,7 @@
> use core::{
>     marker::*,
>     ptr::null_mut,
> -    mem,
> +    mem::{self, ManuallyDrop},
>     ptr::{self, NonNull, addr_of_mut},
>     ffi::*,
>     ops::*,
> @@ -28,6 +28,7 @@
> use super::{
>     ModeObject,
>     RcModeObject,
> +    ModeConfigGuard,
>     encoder::*,
>     KmsDriver,
> };
> @@ -93,7 +94,7 @@ pub trait DriverConnector: Send + Sync + Sized {
>             destroy: Some(connector_destroy_callback::<Self>),
>             force: None,
>             detect: None,
> -            fill_modes: None,
> +            fill_modes: =
Some(bindings::drm_helper_probe_single_connector_modes),
>             debugfs_init: None,
>             oob_hotplug_event: None,
>             atomic_duplicate_state: =
Some(atomic_duplicate_state_callback::<Self::State>),
> @@ -101,7 +102,7 @@ pub trait DriverConnector: Send + Sync + Sized {
>         helper_funcs: bindings::drm_connector_helper_funcs {
>             mode_valid: None,
>             atomic_check: None,
> -            get_modes: None,
> +            get_modes: Some(get_modes_callback::<Self>),
>             detect_ctx: None,
>             enable_hpd: None,
>             disable_hpd: None,
> @@ -132,6 +133,12 @@ pub trait DriverConnector: Send + Sync + Sized {
>     ///
>     /// Drivers may use this to instantiate their [`DriverConnector`] =
object.
>     fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl =
PinInit<Self, Error>;
> +
> +    /// Retrieve a list of available display modes for this =
[`Connector`].
> +    fn get_modes<'a>(
> +        connector: ConnectorGuard<'a, Self>,
> +        guard: &ModeConfigGuard<'a, Self::Driver>
> +    ) -> i32;
> }
>=20
> /// The generated C vtable for a [`DriverConnector`].
> @@ -229,6 +236,19 @@ pub fn new(
>         })
>     }
>=20
> +    /// Acquire a [`ConnectorGuard`] for this connector from a =
[`ModeConfigGuard`].
> +    ///
> +    /// This verifies using the provided reference that the given =
guard is actually for the same
> +    /// device as this connector's parent.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `guard` is not a [`ModeConfigGuard`] for this =
connector's parent [`Device`].
> +    pub fn guard<'a>(&'a self, guard: &ModeConfigGuard<'a, =
T::Driver>) -> ConnectorGuard<'a, T> {
> +        guard.assert_owner(self.drm_dev());
> +        ConnectorGuard(self)
> +    }
> +
>     /// Attach an encoder to this [`Connector`].
>     ///
>     /// TODO: Move this to an `UnregisteredConnector` interface =
somehow=E2=80=A6
> @@ -327,6 +347,37 @@ unsafe fn from_raw<'a>(ptr: *mut =
bindings::drm_connector) -> &'a Self {
>     drop(unsafe { Box::from_raw(connector as *mut Connector<T>) });
> }
>=20
> +unsafe extern "C" fn get_modes_callback<T: DriverConnector>(
> +    connector: *mut bindings::drm_connector,
> +) -> c_int {
> +    // SAFETY: This is safe via `DriverConnector`s type invariants.
> +    let connector =3D unsafe { Connector::<T>::from_raw(connector) };
> +
> +    // SAFETY: This FFI callback is only called while =
`mode_config.lock` is held
> +    let guard =3D ManuallyDrop::new(unsafe { =
ModeConfigGuard::new(connector.drm_dev()) });

I=E2=80=99m confused. Can you explain what this ManuallyDrop is being =
used for?

> +
> +    T::get_modes(connector.guard(&guard), &guard)
> +}
> +
> +/// A privileged [`Connector`] obtained while holding a =
[`ModeConfigGuard`].
> +///
> +/// This provides access to various methods for [`Connector`] that =
must happen under lock, such as
> +/// setting resolution preferences and adding display modes.
> +///
> +/// # Invariants
> +///
> +/// Shares the invariants of [`ModeConfigGuard`].
> +#[derive(Copy, Clone)]
> +pub struct ConnectorGuard<'a, T: DriverConnector>(&'a Connector<T>);
> +
> +impl<T: DriverConnector> Deref for ConnectorGuard<'_, T> {
> +    type Target =3D Connector<T>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        self.0
> +    }
> +}
> +
> // SAFETY: DRM expects this struct to be zero-initialized
> unsafe impl Zeroable for bindings::drm_connector_state {}
>=20
> --=20
> 2.46.1
>=20

=E2=80=94 Daniel

