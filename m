Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91FC9D9D3D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 19:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B3A10E9BE;
	Tue, 26 Nov 2024 18:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="XubonZig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C0110E97B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 18:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732645115; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IapuetwjqXGQ939hiHg0qSj7VkyBrpZqu/amvEYpD6E1oYIORpJgq3Cl8oKaM2bMY2ehBTVfQRGgRKZiVr0oJmkmW0bGLZY1F3eqr3CSPyL1Mtg/I6ckpeI723neFrfi1KGZYbZKSExxrAevlNiGkgJSF0lyXFq1YaRHmJmHXBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732645115;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aD2/pmBVn0JFoiP/9RgTswdx3rHdVTtXBOzNoa1Rm5c=; 
 b=HJB/wN8JAMA69rxSXeVYkZvyNlwhTcg4Ovs/5XhxSogrtSSEBZIC4aHRb2FuS+0Tj+XsI4LkYzSp9FIg+noB0EnZTKHFFyUoKoyURMKA8vF+ICl8XzQ7v783ZaWd9ptv7nnDvuZ0BmaPCpnxGD6yeUYSY4FDY20Q/3whb9b3VIY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732645115; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=aD2/pmBVn0JFoiP/9RgTswdx3rHdVTtXBOzNoa1Rm5c=;
 b=XubonZigbdpnKvvJmO9ceCBCpTpUyUuR9lk2MgHzJy3zoSE2ojwqEdgg2XINy0Xl
 kquBDiMHg+yER2kksAcmgjjj9viy3LW6qWja+us0MQVNk9Ows5BWVeIB2l1i9OPLfYI
 xn33WRkzTvLgGFK81a6ahpriL8b7dYwXurcPY3wY=
Received: by mx.zohomail.com with SMTPS id 1732645114162953.4077379227923;
 Tue, 26 Nov 2024 10:18:34 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 02/35] WIP: rust: drm: Add traits for registering KMS
 devices
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-3-lyude@redhat.com>
Date: Tue, 26 Nov 2024 15:18:18 -0300
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
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B4023B5F-C75A-492F-942B-76B083FAAE68@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-3-lyude@redhat.com>
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
> This commit adds some traits for registering DRM devices with KMS =
support,
> implemented through the kernel::drm::kms::Kms trait. Devices which =
don't
> have KMS support can simply use PhantomData<Self>.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> TODO:
> * Generate feature flags automatically, these shouldn't need to be
>  specified by the user
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/bindings/bindings_helper.h |   4 +
> rust/kernel/drm/device.rs       |  18 ++-
> rust/kernel/drm/drv.rs          |  45 ++++++-
> rust/kernel/drm/kms.rs          | 230 ++++++++++++++++++++++++++++++++
> rust/kernel/drm/kms/fbdev.rs    |  45 +++++++
> rust/kernel/drm/mod.rs          |   1 +
> 6 files changed, 335 insertions(+), 8 deletions(-)
> create mode 100644 rust/kernel/drm/kms.rs
> create mode 100644 rust/kernel/drm/kms/fbdev.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index 04898f70ef1b8..4a8e44e11c96a 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,11 +6,15 @@
>  * Sorted alphabetically.
>  */
>=20
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> #include <drm/drm_device.h>
> #include <drm/drm_drv.h>
> #include <drm/drm_file.h>
> #include <drm/drm_fourcc.h>
> +#include <drm/drm_fbdev_dma.h>
> #include <drm/drm_gem.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> #include <drm/drm_gem_shmem_helper.h>
> #include <drm/drm_ioctl.h>
> #include <kunit/test.h>
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 2b687033caa2d..d4d6b1185f6a6 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -5,14 +5,22 @@
> //! C header: =
[`include/linux/drm/drm_device.h`](srctree/include/linux/drm/drm_device.h)=

>=20
> use crate::{
> -    bindings, device, drm,
> -    drm::drv::AllocImpl,
> +    bindings, device,
> +    drm::{
> +        drv::AllocImpl,
> +        self,
> +        kms::{KmsImpl, private::KmsImpl as KmsImplPrivate}
> +    },
>     error::code::*,
>     error::from_err_ptr,
>     error::Result,
>     types::{ARef, AlwaysRefCounted, ForeignOwnable, Opaque},
> };
> -use core::{ffi::c_void, marker::PhantomData, ptr::NonNull};
> +use core::{
> +    ffi::c_void,
> +    marker::PhantomData,
> +    ptr::NonNull
> +};
>=20
> #[cfg(CONFIG_DRM_LEGACY)]
> macro_rules! drm_legacy_fields {
> @@ -150,6 +158,10 @@ pub fn data(&self) -> <T::Data as =
ForeignOwnable>::Borrowed<'_> {
>         // SAFETY: `Self::data` is always converted and set on device =
creation.
>         unsafe { <T::Data as =
ForeignOwnable>::from_foreign(drm.raw_data()) };
>     }
> +
> +    pub(crate) const fn has_kms() -> bool {
> +        <T::Kms as KmsImplPrivate>::MODE_CONFIG_OPS.is_some()
> +    }
> }
>=20
> // SAFETY: DRM device objects are always reference counted and the =
get/put functions
> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> index 0cf3fb1cea53c..6b61f2755ba79 100644
> --- a/rust/kernel/drm/drv.rs
> +++ b/rust/kernel/drm/drv.rs
> @@ -8,7 +8,15 @@
>     alloc::flags::*,
>     bindings,
>     devres::Devres,
> -    drm,
> +    drm::{
> +        self,
> +        kms::{
> +            KmsImpl,
> +            private::KmsImpl as KmsImplPrivate,
> +            Kms
> +        }
> +    },
> +    device,
>     error::{Error, Result},
>     private::Sealed,
>     str::CStr,
> @@ -142,6 +150,12 @@ pub trait Driver {
>     /// The type used to represent a DRM File (client)
>     type File: drm::file::DriverFile;
>=20
> +    /// The KMS implementation for this driver.
> +    ///
> +    /// Drivers that wish to support KMS should pass their =
implementation of `drm::kms::KmsDriver`
> +    /// here. Drivers which do not have KMS support can simply pass =
`drm::kms::NoKms` here.
> +    type Kms: drm::kms::KmsImpl<Driver =3D Self> where Self: Sized;
> +
>     /// Driver metadata
>     const INFO: DriverInfo;
>=20
> @@ -159,21 +173,36 @@ pub trait Driver {
>=20
> impl<T: Driver> Registration<T> {
>     /// Creates a new [`Registration`] and registers it.
> -    pub fn new(drm: ARef<drm::device::Device<T>>, flags: usize) -> =
Result<Self> {
> +    pub fn new(dev: &device::Device, data: T::Data, flags: usize) -> =
Result<Self> {
> +        let drm =3D drm::device::Device::<T>::new(dev, data)?;
> +        let has_kms =3D drm::device::Device::<T>::has_kms();
> +
> +        let mode_config_info =3D if has_kms {
> +            // SAFETY: We have yet to register this device
> +            Some(unsafe { T::Kms::setup_kms(&drm)? })
> +        } else {
> +            None
> +        };
> +
>         // SAFETY: Safe by the invariants of `drm::device::Device`.
>         let ret =3D unsafe { bindings::drm_dev_register(drm.as_raw(), =
flags as u64) };
>         if ret < 0 {
>             return Err(Error::from_errno(ret));
>         }
>=20
> +        if let Some(ref info) =3D mode_config_info {
> +            // SAFETY: We just registered the device above
> +            unsafe { T::Kms::setup_fbdev(&drm, info) };
> +        }
> +
>         Ok(Self(drm))
>     }
>=20
>     /// Same as [`Registration::new`}, but transfers ownership of the =
[`Registration`] to `Devres`.
> -    pub fn new_foreign_owned(drm: ARef<drm::device::Device<T>>, =
flags: usize) -> Result {
> -        let reg =3D Registration::<T>::new(drm.clone(), flags)?;
> +    pub fn new_foreign_owned(dev: &device::Device, data: T::Data, =
flags: usize) -> Result {
> +        let reg =3D Registration::<T>::new(dev, data, flags)?;
>=20
> -        Devres::new_foreign_owned(drm.as_ref(), reg, GFP_KERNEL)
> +        Devres::new_foreign_owned(dev, reg, GFP_KERNEL)
>     }
>=20
>     /// Returns a reference to the `Device` instance for this =
registration.
> @@ -195,5 +224,11 @@ fn drop(&mut self) {
>         // SAFETY: Safe by the invariant of =
`ARef<drm::device::Device<T>>`. The existance of this
>         // `Registration` also guarantees the this =
`drm::device::Device` is actually registered.
>         unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
> +
> +        if drm::device::Device::<T>::has_kms() {
> +            // SAFETY: We just checked above that KMS was setup for =
this device, so this is safe to
> +            // call
> +            unsafe { =
bindings::drm_atomic_helper_shutdown(self.0.as_raw()) }
> +        }
>     }
> }
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> new file mode 100644
> index 0000000000000..d3558a5eccc54
> --- /dev/null
> +++ b/rust/kernel/drm/kms.rs
> @@ -0,0 +1,230 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! KMS driver abstractions for rust.
> +
> +pub mod fbdev;
> +
> +use crate::{
> +    drm::{
> +        drv::Driver,
> +        device::Device
> +    },
> +    device,
> +    prelude::*,
> +    types::*,
> +    error::to_result,
> +    private::Sealed,
> +};
> +use core::{
> +    ops::Deref,
> +    ptr::{self, NonNull},
> +    mem::{self, ManuallyDrop},
> +    marker::PhantomData,
> +};
> +use bindings;
> +
> +/// The C vtable for a [`Device`].
> +///
> +/// This is created internally by DRM.
> +pub(crate) struct ModeConfigOps {
> +    pub(crate) kms_vtable: bindings::drm_mode_config_funcs,
> +    pub(crate) kms_helper_vtable: =
bindings::drm_mode_config_helper_funcs
> +}
> +
> +/// A trait representing a type that can be used for setting up KMS, =
or a stub.
> +///
> +/// For drivers which don't have KMS support, the methods provided by =
this trait may be stubs. It is
> +/// implemented internally by DRM.
> +pub trait KmsImpl: private::KmsImpl {}
> +
> +pub(crate) mod private {
> +    use super::*;
> +
> +    /// Private callback implemented internally by DRM for setting up =
KMS on a device, or stubbing
> +    /// the KMS setup for devices which don't have KMS support can =
just use [`PhantomData`].

This comment is a bit hard to parse. Also, I wonder if we can find a =
better solution than just using
PhantomData.

> +    pub trait KmsImpl {
> +        /// The parent driver for this KMS implementation
> +        type Driver: Driver;
> +
> +        /// The optional KMS callback operations for this driver.
> +        const MODE_CONFIG_OPS: Option<ModeConfigOps>;
> +
> +        /// The callback for setting up KMS on a device
> +        ///
> +        /// # Safety
> +        ///
> +        /// `drm` must be unregistered.
> +        unsafe fn setup_kms(drm: &Device<Self::Driver>) -> =
Result<ModeConfigInfo> {
> +            build_error::build_error("This should never be =
reachable")

How exactly would we get here?

> +        }
> +
> +        /// The callback for setting up fbdev emulation on a KMS =
device.
> +        ///
> +        /// # Safety
> +        ///
> +        /// `drm` must be registered.
> +        unsafe fn setup_fbdev(drm: &Device<Self::Driver>, =
mode_config_info: &ModeConfigInfo) {
> +            build_error::build_error("This should never be =
reachable")
> +        }
> +    }
> +}
> +
> +/// A [`Device`] with KMS initialized that has not been registered =
with userspace.
> +///
> +/// This type is identical to [`Device`], except that it is able to =
create new static KMS resources.
> +/// It represents a KMS device that is not yet visible to userspace, =
and also contains miscellaneous
> +/// state required during the initialization process of a [`Device`].
> +pub struct UnregisteredKmsDevice<'a, T: Driver> {
> +    drm: &'a Device<T>,
> +}

Minor nit, you can use a tuple struct instead. I don=E2=80=99t think =
this field name adds much.

> +
> +impl<'a, T: Driver> Deref for UnregisteredKmsDevice<'a, T> {
> +    type Target =3D Device<T>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        self.drm
> +    }
> +}
> +
> +impl<'a, T: Driver> UnregisteredKmsDevice<'a, T> {
> +    /// Construct a new [`UnregisteredKmsDevice`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller promises that `drm` is an unregistered [`Device`].
> +    pub(crate) unsafe fn new(drm: &'a Device<T>) -> Self {
> +        Self {
> +            drm,
> +        }
> +    }
> +}
> +
> +/// A trait which must be implemented by drivers that wish to support =
KMS
> +///
> +/// It should be implemented for the same type that implements =
[`Driver`]. Drivers which don't
> +/// support KMS should use [`PhantomData<Self>`].

If `Kms` should be implemented only by types that implement `Driver`, =
shouldn=E2=80=99t you add it as a supertrait?

> +///
> +/// [`PhantomData<Self>`]: PhantomData
> +#[vtable]
> +pub trait Kms {
> +    /// The parent [`Driver`] for this [`Device`].
> +    type Driver: KmsDriver;
> +
> +    /// The fbdev implementation to use for this [`Device`].
> +    ///
> +    /// Which implementation may be used here depends on the GEM =
implementation specified in
> +    /// [`Driver::Object`]. See [`fbdev`] for more information.
> +    type Fbdev: fbdev::FbdevImpl;

Maybe `Driver::Object` should provide that associated constant instead? =
Otherwise you comment above
is just a pinky promise.

> +
> +    /// Return a [`ModeConfigInfo`] structure for this =
[`device::Device`].
> +    fn mode_config_info(
> +        dev: &device::Device,
> +        drm_data: <<Self::Driver as Driver>::Data as =
ForeignOwnable>::Borrowed<'_>,
> +    ) -> Result<ModeConfigInfo>;
> +
> +    /// Create mode objects like [`crtc::Crtc`], [`plane::Plane`], =
etc. for this device
> +    fn create_objects(drm: &UnregisteredKmsDevice<'_, Self::Driver>) =
-> Result;

IMHO, just looking at the function signature, it gets hard to relate =
this to `Crtc` or `Plane`.

> +}
> +
> +impl<T: Kms> private::KmsImpl for T {
> +    type Driver =3D T::Driver;
> +
> +    const MODE_CONFIG_OPS: Option<ModeConfigOps> =3D =
Some(ModeConfigOps {
> +        kms_vtable: bindings::drm_mode_config_funcs {
> +            atomic_check: Some(bindings::drm_atomic_helper_check),
> +            // TODO TODO: There are other possibilities then this =
function, but we need
> +            // to write up more bindings before we can support those
> +            fb_create: Some(bindings::drm_gem_fb_create),
> +            mode_valid: None, // TODO
> +            atomic_commit: Some(bindings::drm_atomic_helper_commit),
> +            get_format_info: None,
> +            atomic_state_free: None,
> +            atomic_state_alloc: None,
> +            atomic_state_clear: None,
> +            output_poll_changed: None,
> +        },
> +
> +        kms_helper_vtable: bindings::drm_mode_config_helper_funcs {
> +            atomic_commit_setup: None, // TODO
> +            atomic_commit_tail: None, // TODO
> +        },
> +    });
> +
> +    unsafe fn setup_kms(drm: &Device<Self::Driver>) -> =
Result<ModeConfigInfo> {
> +        let mode_config_info =3D T::mode_config_info(drm.as_ref(), =
drm.data())?;
> +
> +        // SAFETY: `MODE_CONFIG_OPS` is always Some() in this =
implementation
> +        let ops =3D unsafe { =
T::MODE_CONFIG_OPS.as_ref().unwrap_unchecked() };
> +
> +        // SAFETY:
> +        // - This function can only be called before registration via =
our safety contract.
> +        // - Before registration, we are the only ones with access to =
this device.
> +        unsafe {
> +            (*drm.as_raw()).mode_config =3D bindings::drm_mode_config =
{
> +                funcs: &ops.kms_vtable,
> +                helper_private: &ops.kms_helper_vtable,
> +                min_width: mode_config_info.min_resolution.0,
> +                min_height: mode_config_info.min_resolution.1,
> +                max_width: mode_config_info.max_resolution.0,
> +                max_height: mode_config_info.max_resolution.1,
> +                cursor_width: mode_config_info.max_cursor.0,
> +                cursor_height: mode_config_info.max_cursor.1,
> +                preferred_depth: mode_config_info.preferred_depth,
> +                ..Default::default()
> +            };
> +        }
> +
> +        // SAFETY: We just setup all of the required info this =
function needs in `drm_device`
> +        to_result(unsafe { =
bindings::drmm_mode_config_init(drm.as_raw()) })?;
> +
> +        // SAFETY: `drm` is guaranteed to be unregistered via our =
safety contract.
> +        let drm =3D unsafe { UnregisteredKmsDevice::new(drm) };
> +
> +        T::create_objects(&drm)?;
> +
> +        // TODO: Eventually add a hook to customize how state =
readback happens, for now just reset
> +        // SAFETY: Since all static modesetting objects were created =
in `T::create_objects()`, and
> +        // that is the only place they can be created, this fulfills =
the C API requirements.
> +        unsafe { bindings::drm_mode_config_reset(drm.as_raw()) };
> +
> +        Ok(mode_config_info)
> +    }
> +
> +    unsafe fn setup_fbdev(drm: &Device<Self::Driver>, =
mode_config_info: &ModeConfigInfo) {
> +        <<T as Kms>::Fbdev as =
fbdev::private::FbdevImpl>::setup_fbdev(drm, mode_config_info)

Some type-aliases would do nicely here :)

> +    }
> +}
> +
> +impl<T: Kms> KmsImpl for T {}
> +
> +impl<T: Driver> private::KmsImpl for PhantomData<T> {
> +    type Driver =3D T;
> +
> +    const MODE_CONFIG_OPS: Option<ModeConfigOps> =3D None;
> +}
> +
> +impl<T: Driver> KmsImpl for PhantomData<T> {}
> +
> +/// Various device-wide information for a [`Device`] that is provided =
during initialization.
> +#[derive(Copy, Clone)]
> +pub struct ModeConfigInfo {
> +    /// The minimum (w, h) resolution this driver can support
> +    pub min_resolution: (i32, i32),
> +    /// The maximum (w, h) resolution this driver can support
> +    pub max_resolution: (i32, i32),
> +    /// The maximum (w, h) cursor size this driver can support
> +    pub max_cursor: (u32, u32),
> +    /// The preferred depth for dumb ioctls
> +    pub preferred_depth: u32,
> +}
> +
> +/// A [`Driver`] with [`Kms`] implemented.
> +///
> +/// This is implemented internally by DRM for any [`Device`] whose =
[`Driver`] type implements
> +/// [`Kms`], and provides access to methods which are only safe to =
use with KMS devices.
> +pub trait KmsDriver: Driver {}
> +
> +impl<T, K> KmsDriver for T
> +where
> +    T: Driver<Kms =3D K>,
> +    K: Kms<Driver =3D T> {}
> diff --git a/rust/kernel/drm/kms/fbdev.rs =
b/rust/kernel/drm/kms/fbdev.rs
> new file mode 100644
> index 0000000000000..bdf97500137d8
> --- /dev/null
> +++ b/rust/kernel/drm/kms/fbdev.rs
> @@ -0,0 +1,45 @@
> +//! Fbdev helper implementations for rust.
> +//!
> +//! This module provides the various Fbdev implementations that can =
be used by Rust KMS drivers.
> +use core::marker::*;
> +use crate::{private::Sealed, drm::{kms::*, device::Device, gem}};
> +use bindings;
> +
> +pub(crate) mod private {
> +    use super::*;
> +
> +    pub trait FbdevImpl {
> +        /// Setup the fbdev implementation for this KMS driver.
> +        fn setup_fbdev<T: Driver>(drm: &Device<T>, mode_config_info: =
&ModeConfigInfo);
> +    }
> +}
> +
> +/// The main trait for a driver's DRM implementation.
> +///
> +/// Drivers are expected not to implement this directly, and to =
instead use one of the objects
> +/// provided by this module such as [`FbdevDma`].
> +pub trait FbdevImpl: private::FbdevImpl {}
> +
> +/// The fbdev implementation for drivers using the gem DMA helpers.
> +///
> +/// Drivers which use the gem DMA helpers ([`gem::Object`]) should =
use this for their [`Kms::Fbdev`]
> +/// type.
> +pub struct FbdevDma<T: Driver>(PhantomData<T>);
> +
> +impl<T, G> private::FbdevImpl for FbdevDma<T>
> +where
> +    T: Driver<Object =3D gem::Object<G>>,
> +    G: gem::DriverObject
> +{
> +    #[inline]
> +    fn setup_fbdev<D: Driver>(drm: &Device<D>, mode_config_info: =
&ModeConfigInfo) {
> +        // SAFETY: Our implementation bounds re proof that this =
driver is using the gem dma helpers
> +        unsafe { bindings::drm_fbdev_dma_setup(drm.as_raw(), =
mode_config_info.preferred_depth) };
> +    }
> +}
> +
> +impl<T, G> FbdevImpl for FbdevDma<T>
> +where
> +    T: Driver<Object =3D gem::Object<G>>,
> +    G: gem::DriverObject
> +{}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index 2c12dbd181997..049ae675cb9b1 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -8,3 +8,4 @@
> pub mod fourcc;
> pub mod gem;
> pub mod ioctl;
> +pub mod kms;
> --=20
> 2.46.1

There=E2=80=99s quite a bit of generics, associated types and bounds =
being used. I wonder if your patch would benefit
from a small, self-contained example? You can probably adapt that from =
rvkms directly, I suppose.

=E2=80=94 Daniel

