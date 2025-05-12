Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C6EAB4517
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 21:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC21D10E0E8;
	Mon, 12 May 2025 19:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="bu0uBxsZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3126710E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 19:39:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747078770; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RCsFildO18/UzrxflNgbKaMb2TvmKbpLLtWvEtfPjXKGqVk7TXXd5jNKjnhkPNoiWkb7/mLpbTs3pSt8T0RXDJpPzd+WiWAYkQz3P5aW7cetO3XgMqV623y+DcJgH4EEuKIDl0rD3fJVlyoCbVqKQXbebH3fb4XMQgF+XOJORTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747078770;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=F8a7chvHnyEYGioEG6UzDaTzrfuAAluR4e+aS8YNyVo=; 
 b=EsSHg3hErZ+0M8ijY2om2sUiEEsnYxBAEkWtbXGXc/vhHeraVJMNChvp2lJ+At+uPKTbUifuuroyCldfVm3nZncRFBix1FF1e9pfyxiIcT1tsBE0cof4TdjlM8rc9S53kG/CWCEUw80vKBAcTUxagD6gQmEO9xqebdXnxJzLBeI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747078770; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=F8a7chvHnyEYGioEG6UzDaTzrfuAAluR4e+aS8YNyVo=;
 b=bu0uBxsZogNmX4aEXsKwWcGX0DX017RqXxt1WvLiXUE7Aack39yK6QIyO2M2NfeS
 A1uuV/azwG9Uszfx/qY0i6pQ+6oDs16P0Xeookn8jolUkytmYoL8R/OYl8rEBw54FAx
 tuqR6VOE8jNdeAykrtF+c4rmxI0Ao7/6eQMBAsu8=
Received: by mx.zohomail.com with SMTPS id 1747078768512340.5233388996256;
 Mon, 12 May 2025 12:39:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [RFC v3 09/33] rust: drm/kms: Add DriverConnector::get_mode
 callback
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250305230406.567126-10-lyude@redhat.com>
Date: Mon, 12 May 2025 16:39:11 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B375789B-C1CF-4A67-84DB-FCCD7C69CF27@collabora.com>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-10-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
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

> On 5 Mar 2025, at 19:59, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Next up is filling out some of the basic connector hotplugging =
callbacks -
> which we'll need for setting up the fbdev helpers for KMS devices. =
Note
> that connector hotplugging in DRM follows a BFL scheme: pretty much =
all
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
>=20
> ---
> V3:
> * Document uses of ManuallyDrop
> * Use addr_of_mut!() instead of &mut
> * Add some missing invariant comments
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/bindings/bindings_helper.h  |  1 +
> rust/kernel/drm/kms.rs           | 90 +++++++++++++++++++++++++++++++-
> rust/kernel/drm/kms/connector.rs | 62 ++++++++++++++++++++--
> 3 files changed, 147 insertions(+), 6 deletions(-)
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index a6735f6fba947..27828dd36d4f2 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -21,6 +21,7 @@
> #include <drm/drm_gem_framebuffer_helper.h>
> #include <drm/drm_gem_shmem_helper.h>
> #include <drm/drm_plane.h>
> +#include <drm/drm_probe_helper.h>
> #include <drm/drm_ioctl.h>
> #include <kunit/test.h>
> #include <linux/blk-mq.h>
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index f0044d396e1eb..7935e935f9975 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -8,15 +8,20 @@
> pub mod plane;
>=20
> use crate::{
> -    device,
> +    container_of, device,
>     drm::{device::Device, drv::Driver},
>     error::to_result,
>     prelude::*,
>     private::Sealed,
> +    sync::{Mutex, MutexGuard},
>     types::*,
> };
> use bindings;
> -use core::{marker::PhantomData, ops::Deref, ptr::NonNull};
> +use core::{
> +    marker::PhantomData,
> +    ops::Deref,
> +    ptr::{self, addr_of_mut, NonNull},
> +};
>=20
> /// The C vtable for a [`Device`].
> ///
> @@ -191,6 +196,23 @@ pub struct ModeConfigInfo {
>     pub preferred_fourcc: Option<u32>,
> }
>=20
> +impl<T: KmsDriver> Device<T> {
> +    /// Retrieve a pointer to the mode_config mutex
> +    #[inline]
> +    pub(crate) fn mode_config_mutex(&self) -> &Mutex<()> {
> +        // SAFETY: This lock is initialized for as long as =
`Device<T>` is exposed to users
> +        unsafe { =
Mutex::from_raw(addr_of_mut!((*self.as_raw()).mode_config.mutex)) }
> +    }
> +
> +    /// Acquire the [`mode_config.mutex`] for this [`Device`].
> +    #[inline]
> +    pub fn mode_config_lock(&self) -> ModeConfigGuard<'_, T> {
> +        // INVARIANT: We're locking mode_config.mutex, fulfilling our =
invariant that this lock is
> +        // held throughout ModeConfigGuard's lifetime.
> +        ModeConfigGuard(self.mode_config_mutex().lock(), PhantomData)
> +    }
> +}
> +
> /// A modesetting object in DRM.
> ///
> /// This is any type of object where the underlying C object contains =
a [`struct drm_mode_object`].
> @@ -314,3 +336,67 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
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

Perhaps we should do more here? There is `Mutex::assert_is_held()` which =
is
just:

void rust_helper_mutex_assert_is_held(struct mutex *mutex)
{
    lockdep_assert_held(mutex);
}

...or perhaps you should spin a quick patch for mutex_is_locked()?

> +    ///
> +    /// [`drm_device.mode_config.mutex`]: =
(srctree/include/drm/drm_device.h)
> +    pub(crate) unsafe fn new(drm: &'a Device<T>) -> Self {
> +        // SAFETY: Our safety contract fulfills the requirements of =
`MutexGuard::new()`
> +        // INVARIANT: And our safety contract ensures that this type =
proves that
> +        // `drm_device.mode_config.mutex` is acquired.
> +        Self(
> +            unsafe { MutexGuard::new(drm.mode_config_mutex(), ()) },
> +            PhantomData,
> +        )
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
> +        unsafe {
> +            Device::borrow(container_of!(
> +                mode_config,
> +                bindings::drm_device,
> +                mode_config
> +            ))
> +        }
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
> index 6fe0a7517bd55..14de3b0529f89 100644
> --- a/rust/kernel/drm/kms/connector.rs
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -4,7 +4,7 @@
> //!
> //! C header: =
[`include/drm/drm_connector.h`](srctree/include/drm/drm_connector.h)
>=20
> -use super::{encoder::*, KmsDriver, ModeObject, RcModeObject};
> +use super::{encoder::*, KmsDriver, ModeConfigGuard, ModeObject, =
RcModeObject};
> use crate::{
>     alloc::KBox,
>     bindings,
> @@ -17,7 +17,7 @@
> };
> use core::{
>     marker::*,
> -    mem,
> +    mem::{self, ManuallyDrop},
>     ops::*,
>     ptr::{addr_of_mut, null_mut},
>     stringify,
> @@ -106,7 +106,7 @@ pub trait DriverConnector: Send + Sync + Sized {
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
> @@ -114,7 +114,7 @@ pub trait DriverConnector: Send + Sync + Sized {
>         helper_funcs: bindings::drm_connector_helper_funcs {
>             mode_valid: None,
>             atomic_check: None,
> -            get_modes: None,
> +            get_modes: Some(get_modes_callback::<Self>),
>             detect_ctx: None,
>             enable_hpd: None,
>             disable_hpd: None,
> @@ -145,6 +145,12 @@ pub trait DriverConnector: Send + Sync + Sized {
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
> +        guard: &ModeConfigGuard<'a, Self::Driver>,
> +    ) -> i32;
> }
>=20
> /// The generated C vtable for a [`DriverConnector`].
> @@ -196,6 +202,21 @@ fn deref(&self) -> &Self::Target {
>     }
> }
>=20
> +impl<T: DriverConnector> Connector<T> {
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
> +}
> +
> /// A trait implemented by any type that acts as a [`struct =
drm_connector`] interface.
> ///
> /// This is implemented internally by DRM.
> @@ -392,6 +413,39 @@ pub fn attach_encoder(&self, encoder: &impl =
AsRawEncoder) -> Result {
>     drop(unsafe { KBox::from_raw(connector as *mut Connector<T>) });
> }
>=20
> +unsafe extern "C" fn get_modes_callback<T: DriverConnector>(
> +    connector: *mut bindings::drm_connector,
> +) -> core::ffi::c_int {
> +    // SAFETY: This is safe via `DriverConnector`s type invariants.
> +    let connector =3D unsafe { Connector::<T>::from_raw(connector) };
> +
> +    // SAFETY: This FFI callback is only called while =
`mode_config.lock` is held
> +    // We use ManuallyDrop here to prevent the lock from being =
released after the callback
> +    // completes, as that should be handled by DRM.
> +    let guard =3D ManuallyDrop::new(unsafe { =
ModeConfigGuard::new(connector.drm_dev()) });
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
> 2.48.1
>=20
>=20

=E2=80=94 Daniel=
