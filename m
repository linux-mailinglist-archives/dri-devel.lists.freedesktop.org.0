Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8845D6B2F69
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 22:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C548110E8DF;
	Thu,  9 Mar 2023 21:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857A110E8E2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 21:16:29 +0000 (UTC)
Received: from 2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com
 (2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com
 [IPv6:2603:8080:2102:63d7:c4a8:7e10:391:f3ff])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gfxstrand)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4DBEE6602F6A;
 Thu,  9 Mar 2023 21:16:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678396587;
 bh=rTOQNMw/vlrePXMX+Ncfj1z67754Yem/yc0aVpGGAow=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=eHTUSQSRKXVpQdPyE1XmQQk9NsodVO4+vi0joX2RXEsbu5YRQJaI48JBgc+iNd0xC
 0zIaRAIwSL+6TF2Jp7kpE1UFjLDDbFHCNJoVcJeWN4klB5DlSRpanngXmr6wqBTFRA
 PLktg1w7IkCVDE5miEHDTM+6aMl2B55g/cqrhmGTskf2LcDoulslqgE467D3xLrfy/
 dgBlNrWPgUd5i4H8qZI+b8W6Ha4jWw8pr2U1e4RUAhpqAj+q3jwRWwQOe53WM0LOco
 gKakdvfGL6wdzBpEB5d6mhMRscB+EmX2+lnVCjWjudoxbtH9nty47rlP47eRFVuCIe
 ZLLtGLrx+opZw==
Message-ID: <9ba89e97155400fb379f5101ccb8960d0bcbc025.camel@collabora.com>
Subject: Re: [PATCH RFC 03/18] rust: drm: file: Add File abstraction
From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: Asahi Lina <lina@asahilina.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Luben Tuikov <luben.tuikov@amd.com>, Jarkko
 Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Date: Thu, 09 Mar 2023 15:16:18 -0600
In-Reply-To: <20230307-rust-drm-v1-3-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-3-917ff5bc80a8@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>, asahi@lists.linux.dev,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-03-07 at 23:25 +0900, Asahi Lina wrote:
> A DRM File is the DRM counterpart to a kernel file structure,
> representing an open DRM file descriptor. Add a Rust abstraction to
> allow drivers to implement their own File types that implement the
> DriverFile trait.
>=20
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
> =C2=A0rust/bindings/bindings_helper.h |=C2=A0=C2=A0 1 +
> =C2=A0rust/kernel/drm/drv.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 7 ++-
> =C2=A0rust/kernel/drm/file.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 113
> ++++++++++++++++++++++++++++++++++++++++
> =C2=A0rust/kernel/drm/mod.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A04 files changed, 120 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/bindings/bindings_helper.h
> b/rust/bindings/bindings_helper.h
> index 2a999138c4ae..7d7828faf89c 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -8,6 +8,7 @@
> =C2=A0
> =C2=A0#include <drm/drm_device.h>
> =C2=A0#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> =C2=A0#include <drm/drm_ioctl.h>
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/device.h>
> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> index 29a465515dc9..1dcb651e1417 100644
> --- a/rust/kernel/drm/drv.rs
> +++ b/rust/kernel/drm/drv.rs
> @@ -144,6 +144,9 @@ pub trait Driver {
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Should be either `drm::gem::Object<T>` or
> `drm::gem::shmem::Object<T>`.
> =C2=A0=C2=A0=C2=A0=C2=A0 type Object: AllocImpl;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 /// The type used to represent a DRM File (client)
> +=C2=A0=C2=A0=C2=A0 type File: drm::file::DriverFile;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Driver metadata
> =C2=A0=C2=A0=C2=A0=C2=A0 const INFO: DriverInfo;
> =C2=A0
> @@ -213,8 +216,8 @@ macro_rules! drm_device_register {
> =C2=A0impl<T: Driver> Registration<T> {
> =C2=A0=C2=A0=C2=A0=C2=A0 const VTABLE: bindings::drm_driver =3D drm_legac=
y_fields! {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 load: None,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open: None, // TODO: File abs=
traction
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 postclose: None, // TODO: Fil=
e abstraction
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open: Some(drm::file::open_ca=
llback::<T::File>),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 postclose: Some(drm::file::po=
stclose_callback::<T::File>),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lastclose: None,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unload: None,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release: None,
> diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
> new file mode 100644
> index 000000000000..48751e93c38a
> --- /dev/null
> +++ b/rust/kernel/drm/file.rs
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM File objects.
> +//!
> +//! C header:
> [`include/linux/drm/drm_file.h`](../../../../include/linux/drm/drm_fi
> le.h)
> +
> +use crate::{bindings, drm, error::Result};
> +use alloc::boxed::Box;
> +use core::marker::PhantomData;
> +use core::ops::Deref;
> +
> +/// Trait that must be implemented by DRM drivers to represent a DRM
> File (a client instance).
> +pub trait DriverFile {
> +=C2=A0=C2=A0=C2=A0 /// The parent `Driver` implementation for this `Driv=
erFile`.
> +=C2=A0=C2=A0=C2=A0 type Driver: drm::drv::Driver;
> +
> +=C2=A0=C2=A0=C2=A0 /// Open a new file (called when a client opens the D=
RM device).
> +=C2=A0=C2=A0=C2=A0 fn open(device: &drm::device::Device<Self::Driver>) -=
>
> Result<Box<Self>>;
> +}
> +
> +/// An open DRM File.
> +///
> +/// # Invariants
> +/// `raw` is a valid pointer to a `drm_file` struct.
> +#[repr(transparent)]
> +pub struct File<T: DriverFile> {
> +=C2=A0=C2=A0=C2=A0 raw: *mut bindings::drm_file,
> +=C2=A0=C2=A0=C2=A0 _p: PhantomData<T>,
> +}
> +
> +pub(super) unsafe extern "C" fn open_callback<T: DriverFile>(
> +=C2=A0=C2=A0=C2=A0 raw_dev: *mut bindings::drm_device,
> +=C2=A0=C2=A0=C2=A0 raw_file: *mut bindings::drm_file,
> +) -> core::ffi::c_int {
> +=C2=A0=C2=A0=C2=A0 let drm =3D core::mem::ManuallyDrop::new(unsafe {
> drm::device::Device::from_raw(raw_dev) });

Maybe you can help educate me a bit here... This feels like a really
sketchy pattern.  We're creating a Device from a pointer, an operation
which inherently consumes a reference but then marking it ManuallyDrop
so drm_device_put() never gets called.  It took me a while but I think
I figured out what you're trying to do: Make it so all the Rust stuff
works with Device, not drm_device but it still feels really wrong.  It
works, it just feels like there's a lot of unsafe abstraction juggling
happening here and I expect this operation is going to be pretty common
in the Rust abstraction layer.

Am I missing something?

~Faith


> +=C2=A0=C2=A0=C2=A0 // SAFETY: This reference won't escape this function
> +=C2=A0=C2=A0=C2=A0 let file =3D unsafe { &mut *raw_file };
> +
> +=C2=A0=C2=A0=C2=A0 let inner =3D match T::open(&drm) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Err(e) =3D> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n e.to_kernel_errno();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(i) =3D> i,
> +=C2=A0=C2=A0=C2=A0 };
> +
> +=C2=A0=C2=A0=C2=A0 file.driver_priv =3D Box::into_raw(inner) as *mut _;
> +
> +=C2=A0=C2=A0=C2=A0 0
> +}
> +
> +pub(super) unsafe extern "C" fn postclose_callback<T: DriverFile>(
> +=C2=A0=C2=A0=C2=A0 _dev: *mut bindings::drm_device,
> +=C2=A0=C2=A0=C2=A0 raw_file: *mut bindings::drm_file,
> +) {
> +=C2=A0=C2=A0=C2=A0 // SAFETY: This reference won't escape this function
> +=C2=A0=C2=A0=C2=A0 let file =3D unsafe { &*raw_file };
> +
> +=C2=A0=C2=A0=C2=A0 // Drop the DriverFile
> +=C2=A0=C2=A0=C2=A0 unsafe { Box::from_raw(file.driver_priv as *mut T) };
> +}
> +
> +impl<T: DriverFile> File<T> {
> +=C2=A0=C2=A0=C2=A0 // Not intended to be called externally, except via
> declare_drm_ioctls!()
> +=C2=A0=C2=A0=C2=A0 #[doc(hidden)]
> +=C2=A0=C2=A0=C2=A0 pub unsafe fn from_raw(raw_file: *mut bindings::drm_f=
ile) ->
> File<T> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 File {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw: =
raw_file,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _p: P=
hantomData,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 #[allow(dead_code)]
> +=C2=A0=C2=A0=C2=A0 /// Return the raw pointer to the underlying `drm_fil=
e`.
> +=C2=A0=C2=A0=C2=A0 pub(super) fn raw(&self) -> *const bindings::drm_file=
 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.raw
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Return an immutable reference to the raw `drm_fil=
e`
> structure.
> +=C2=A0=C2=A0=C2=A0 pub(super) fn file(&self) -> &bindings::drm_file {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { &*self.raw }
> +=C2=A0=C2=A0=C2=A0 }
> +}
> +
> +impl<T: DriverFile> Deref for File<T> {
> +=C2=A0=C2=A0=C2=A0 type Target =3D T;
> +
> +=C2=A0=C2=A0=C2=A0 fn deref(&self) -> &T {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { &*(self.file().drive=
r_priv as *const T) }
> +=C2=A0=C2=A0=C2=A0 }
> +}
> +
> +impl<T: DriverFile> crate::private::Sealed for File<T> {}
> +
> +/// Generic trait to allow users that don't care about driver
> specifics to accept any File<T>.
> +///
> +/// # Safety
> +/// Must only be implemented for File<T> and return the pointer,
> following the normal invariants
> +/// of that type.
> +pub unsafe trait GenericFile: crate::private::Sealed {
> +=C2=A0=C2=A0=C2=A0 /// Returns the raw const pointer to the `struct drm_=
file`
> +=C2=A0=C2=A0=C2=A0 fn raw(&self) -> *const bindings::drm_file;
> +=C2=A0=C2=A0=C2=A0 /// Returns the raw mut pointer to the `struct drm_fi=
le`
> +=C2=A0=C2=A0=C2=A0 fn raw_mut(&mut self) -> *mut bindings::drm_file;
> +}
> +
> +unsafe impl<T: DriverFile> GenericFile for File<T> {
> +=C2=A0=C2=A0=C2=A0 fn raw(&self) -> *const bindings::drm_file {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.raw
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 fn raw_mut(&mut self) -> *mut bindings::drm_file {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.raw
> +=C2=A0=C2=A0=C2=A0 }
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index 69376b3c6db9..a767942d0b52 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -4,4 +4,5 @@
> =C2=A0
> =C2=A0pub mod device;
> =C2=A0pub mod drv;
> +pub mod file;
> =C2=A0pub mod ioctl;
>=20

