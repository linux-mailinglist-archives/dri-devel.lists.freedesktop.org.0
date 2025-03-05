Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946CBA53DF5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E123A10E7F9;
	Wed,  5 Mar 2025 23:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DACNdJWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA1E10E7E6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sl6/ekVgAWYCDTBSA2VtxkimLd/n9xlZs5F5lrJfmw0=;
 b=DACNdJWHL5hwYZXy1A0q9MiRmZNJU6E0sVpuP/PMZuUIs3VlioRGdRcZEW9ldTF35n4ZTy
 T0VlbyN/ssqCtvEC6rccmHsVtPmbkkPwTU0cxJvmTqZg/fxpZ4briBw6RlKuXlRsdGLipX
 SD1XPEANi1xS4eX7gcCE8J0bo0Hirs4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-_WqexueYPgqrl-lh9vpcxw-1; Wed,
 05 Mar 2025 18:05:18 -0500
X-MC-Unique: _WqexueYPgqrl-lh9vpcxw-1
X-Mimecast-MFC-AGG-ID: _WqexueYPgqrl-lh9vpcxw_1741215916
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3D7181955DB9; Wed,  5 Mar 2025 23:05:16 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1D9B8300019E; Wed,  5 Mar 2025 23:05:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 05/33] rust: drm/kms: Add drm_plane bindings
Date: Wed,  5 Mar 2025 17:59:21 -0500
Message-ID: <20250305230406.567126-6-lyude@redhat.com>
In-Reply-To: <20250305230406.567126-1-lyude@redhat.com>
References: <20250305230406.567126-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

The next step is adding a set of basic bindings to create a plane, which
has to happen before we can create a CRTC (since we need to be able to at
least specify a primary plane for a CRTC upon creation). This mostly
follows the same general pattern as connectors (AsRawPlane,
AsRawPlaneState, etc.).

There is one major difference with planes vs. other types of atomic mode
objects: drm_plane_state isn't the only base plane struct used in DRM
drivers, as some drivers will use helpers like drm_shadow_plane_state which
have a drm_plane_state embedded within them.

Since we'll eventually be adding bindings for shadow planes, we introduce a
PlaneStateHelper trait - which represents any data type which can be used
as the main wrapping structure around a drm_plane_state - and we implement
this trait for PlaneState<T>. This trait can be used in our C callbacks to
allow for drivers to use different wrapping structures without needing to
implement a separate set of FFI callbacks for each type. Currently planes
are the only type I'm aware of which do this.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V2:
* Start using Gerry Guo's updated #[vtable] function so that our driver
  operations table has a static location in memory

V3:
* Add safety comment for implementation of ModeObject
* Make AsRawPlane unsafe, since we need a guarantee that `as_raw()` always
  returns a valid pointer to an initialized drm_plane.
* Add comments to __drm_atomic_helper_duplicate_state()
* Switch `PlaneType` to camel casing
* Improve safety comment in `Plane::<T>::new()`
* Fix parameter types for `formats` and `format_modifiers`, as pointed out
  by Louis Chauvet DRM will copy all of these into its own storage.
* Improve safety comments in FromRawPlaneState
* Introduce UnregisteredPlane type
* Don't have AsRawPlane be a supertrait of StaticModeObject. We don't want
  Unregistered mode object variants to be able to return a pointer to the
  DRM device since that would break the UnregisteredKmsDevice pattern.
* Change name of PlaneType to Type (for consistency with the other type IDs
  we've adde)
* Use addr_of_mut! in more places instead of &mut

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/drm/fourcc.rs       |   1 -
 rust/kernel/drm/kms.rs          |   1 +
 rust/kernel/drm/kms/plane.rs    | 621 ++++++++++++++++++++++++++++++++
 4 files changed, 624 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/drm/kms/plane.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index c41a3309223b2..5b85f3faca525 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -18,6 +19,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/blk-mq.h>
diff --git a/rust/kernel/drm/fourcc.rs b/rust/kernel/drm/fourcc.rs
index 62203478b5955..a30e40dbc037c 100644
--- a/rust/kernel/drm/fourcc.rs
+++ b/rust/kernel/drm/fourcc.rs
@@ -11,7 +11,6 @@ const fn fourcc_code(a: u8, b: u8, c: u8, d: u8) -> u32 {
 
 // TODO: We manually import this because we don't have a reasonable way of getting constants from
 // function-like macros in bindgen yet.
-#[allow(dead_code)]
 pub(crate) const FORMAT_MOD_INVALID: u64 = 0xffffffffffffff;
 
 // TODO: We need to automate importing all of these. For the time being, just add the single one
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index f10e9f83ccb78..6cc5bb53f3628 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -3,6 +3,7 @@
 //! KMS driver abstractions for rust.
 
 pub mod connector;
+pub mod plane;
 
 use crate::{
     device,
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
new file mode 100644
index 0000000000000..9f262156eac6c
--- /dev/null
+++ b/rust/kernel/drm/kms/plane.rs
@@ -0,0 +1,621 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM display planes.
+//!
+//! C header: [`include/drm/drm_plane.h`](srctree/include/drm/drm_plane.h)
+
+use super::{KmsDriver, ModeObject, StaticModeObject, UnregisteredKmsDevice};
+use crate::{
+    alloc::KBox,
+    bindings,
+    drm::{device::Device, fourcc::*},
+    error::{to_result, Error},
+    init::Zeroable,
+    prelude::*,
+    private::Sealed,
+    types::{NotThreadSafe, Opaque},
+};
+use core::{
+    marker::*,
+    mem,
+    ops::*,
+    pin::Pin,
+    ptr::{addr_of_mut, null, null_mut},
+};
+use macros::pin_data;
+
+/// The main trait for implementing the [`struct drm_plane`] API for [`Plane`].
+///
+/// Any KMS driver should have at least one implementation of this type, which allows them to create
+/// [`Plane`] objects. Additionally, a driver may store driver-private data within the type that
+/// implements [`DriverPlane`] - and it will be made available when using a fully typed [`Plane`]
+/// object.
+///
+/// # Invariants
+///
+/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
+///   [`struct drm_plane`] pointers are contained within a [`Plane<Self>`].
+/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
+///   [`struct drm_plane_state`] pointers are contained within a [`PlaneState<Self::State>`].
+///
+/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
+/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
+#[vtable]
+pub trait DriverPlane: Send + Sync + Sized {
+    /// The generated C vtable for this [`DriverPlane`] implementation.
+    #[unique]
+    const OPS: &'static DriverPlaneOps = &DriverPlaneOps {
+        funcs: bindings::drm_plane_funcs {
+            update_plane: Some(bindings::drm_atomic_helper_update_plane),
+            disable_plane: Some(bindings::drm_atomic_helper_disable_plane),
+            destroy: Some(plane_destroy_callback::<Self>),
+            reset: Some(plane_reset_callback::<Self>),
+            set_property: None,
+            atomic_duplicate_state: Some(atomic_duplicate_state_callback::<Self::State>),
+            atomic_destroy_state: Some(atomic_destroy_state_callback::<Self::State>),
+            atomic_set_property: None,
+            atomic_get_property: None,
+            late_register: None,
+            early_unregister: None,
+            atomic_print_state: None,
+            format_mod_supported: None,
+        },
+
+        helper_funcs: bindings::drm_plane_helper_funcs {
+            prepare_fb: None,
+            cleanup_fb: None,
+            begin_fb_access: None,
+            end_fb_access: None,
+            atomic_check: None,
+            atomic_update: None,
+            atomic_enable: None,
+            atomic_disable: None,
+            atomic_async_check: None,
+            atomic_async_update: None,
+            panic_flush: None,
+            get_scanout_buffer: None,
+        },
+    };
+
+    /// The type to pass to the `args` field of [`UnregisteredPlane::new`].
+    ///
+    /// This type will be made available in in the `args` argument of [`Self::new`]. Drivers which
+    /// don't need this can simply pass [`()`] here.
+    type Args;
+
+    /// The parent [`KmsDriver`] implementation.
+    type Driver: KmsDriver;
+
+    /// The [`DriverPlaneState`] implementation for this [`DriverPlane`].
+    ///
+    /// See [`DriverPlaneState`] for more info.
+    type State: DriverPlaneState;
+
+    /// The constructor for creating a [`Plane`] using this [`DriverPlane`] implementation.
+    ///
+    /// Drivers may use this to instantiate their [`DriverPlane`] object.
+    fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl PinInit<Self, Error>;
+}
+
+/// The generated C vtable for a [`DriverPlane`].
+///
+/// This type is created internally by DRM.
+pub struct DriverPlaneOps {
+    funcs: bindings::drm_plane_funcs,
+    helper_funcs: bindings::drm_plane_helper_funcs,
+}
+
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+#[repr(u32)]
+/// An enumerator describing a type of [`Plane`].
+///
+/// This is mainly just relevant for DRM legacy drivers.
+///
+/// # Invariants
+///
+/// This type is identical to [`enum drm_plane_type`].
+///
+/// [`enum drm_plane_type`]: srctree/include/drm/drm_plane.h
+pub enum Type {
+    /// Overlay planes represent all non-primary, non-cursor planes. Some drivers refer to these
+    /// types of planes as "sprites" internally.
+    Overlay = bindings::drm_plane_type_DRM_PLANE_TYPE_OVERLAY,
+
+    /// A primary plane attached to a CRTC that is the most likely to be able to light up the CRTC
+    /// when no scaling/cropping is used, and the plane covers the whole CRTC.
+    Primary = bindings::drm_plane_type_DRM_PLANE_TYPE_PRIMARY,
+
+    /// A cursor plane attached to a CRTC that is more likely to be enabled when no scaling/cropping
+    /// is used, and the framebuffer has the size indicated by [`ModeConfigInfo::max_cursor`].
+    ///
+    /// [`ModeConfigInfo::max_cursor`]: crate::drm::kms::ModeConfigInfo
+    Cursor = bindings::drm_plane_type_DRM_PLANE_TYPE_CURSOR,
+}
+
+/// The main interface for a [`struct drm_plane`].
+///
+/// This type is the main interface for dealing with DRM planes. In addition, it also allows
+/// immutable access to whatever private data is contained within an implementor's [`DriverPlane`]
+/// type.
+///
+/// # Invariants
+///
+/// - `plane` and `inner` are initialized for as long as this object is made available to users.
+/// - The data layout of this structure begins with [`struct drm_plane`].
+/// - The atomic state for this type can always be assumed to be of type [`PlaneState<T::State>`].
+///
+/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
+#[repr(C)]
+#[pin_data]
+pub struct Plane<T: DriverPlane> {
+    /// The FFI drm_plane object
+    plane: Opaque<bindings::drm_plane>,
+    /// The driver's private inner data
+    #[pin]
+    inner: T,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+unsafe impl Zeroable for bindings::drm_plane {}
+
+impl<T: DriverPlane> Sealed for Plane<T> {}
+
+impl<T: DriverPlane> Deref for Plane<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+/// A [`Plane`] that has not yet been registered with userspace.
+///
+/// KMS registration is single-threaded, so this object is not thread-safe.
+///
+/// # Invariants
+///
+/// - This object can only exist before its respective KMS device has been registered.
+/// - Otherwise, it inherits all invariants of [`Plane`] and has an identical data layout.
+pub struct UnregisteredPlane<T: DriverPlane>(Plane<T>, NotThreadSafe);
+
+// SAFETY: We share the invariants of `Plane`
+unsafe impl<T: DriverPlane> AsRawPlane for UnregisteredPlane<T> {
+    fn as_raw(&self) -> *mut bindings::drm_plane {
+        self.0.as_raw()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_plane) -> &'a Self {
+        // SAFETY: This is another from_raw() call, so this function shares the same safety contract
+        let plane = unsafe { Plane::<T>::from_raw(ptr) };
+
+        // SAFETY: Our data layout is identical via our type invariants.
+        unsafe { mem::transmute(plane) }
+    }
+}
+
+impl<T: DriverPlane> Deref for UnregisteredPlane<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0.inner
+    }
+}
+
+impl<T: DriverPlane> UnregisteredPlane<T> {
+    /// Construct a new [`UnregisteredPlane`].
+    ///
+    /// A driver may use this from their [`KmsDriver::create_objects`] callback in order to
+    /// construct new [`UnregisteredPlane`] objects.
+    ///
+    /// [`KmsDriver::create_objects`]: kernel::drm::kms::KmsDriver::create_objects
+    pub fn new<'a, 'b: 'a>(
+        dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
+        possible_crtcs: u32,
+        formats: &[u32],
+        format_modifiers: Option<&[u64]>,
+        type_: Type,
+        name: Option<&CStr>,
+        args: T::Args,
+    ) -> Result<&'b Self> {
+        let this: Pin<KBox<Plane<T>>> = KBox::try_pin_init(
+            try_pin_init!(Plane::<T> {
+                plane: Opaque::new(bindings::drm_plane {
+                    helper_private: &T::OPS.helper_funcs,
+                    ..Default::default()
+                }),
+                inner <- T::new(dev, args),
+                _p: PhantomPinned
+            }),
+            GFP_KERNEL,
+        )?;
+
+        // TODO: Move this over to using collect() someday
+        // Create a modifiers array with the sentinel for passing to DRM
+        let format_modifiers_raw;
+        if let Some(modifiers) = format_modifiers {
+            let mut raw = KVec::with_capacity(modifiers.len() + 1, GFP_KERNEL)?;
+            for modifier in modifiers {
+                raw.push(*modifier, GFP_KERNEL)?;
+            }
+            raw.push(FORMAT_MOD_INVALID, GFP_KERNEL)?;
+
+            format_modifiers_raw = Some(raw);
+        } else {
+            format_modifiers_raw = None;
+        }
+
+        // SAFETY:
+        // - `dev` handles destroying the plane, and thus will outlive us and always be valid.
+        // - We just allocated `this`, and we won't move it since it's pinned
+        // - We just allocated the `format_modifiers_raw` vec and added the sentinel DRM expects
+        //   above
+        // - `drm_universal_plane_init` will memcpy() the following parameters into its own storage,
+        //   so it's safe for them to become inaccessible after this call returns:
+        //   - `formats`
+        //   - `format_modifiers_raw`
+        //   - `name`
+        // - `type_` is equivalent to `drm_plane_type` via its type invariants.
+        to_result(unsafe {
+            bindings::drm_universal_plane_init(
+                dev.as_raw(),
+                this.as_raw(),
+                possible_crtcs,
+                &T::OPS.funcs,
+                formats.as_ptr(),
+                formats.len() as _,
+                format_modifiers_raw.map_or(null(), |f| f.as_ptr()),
+                type_ as _,
+                name.map_or(null(), |n| n.as_char_ptr()),
+            )
+        })?;
+
+        // SAFETY: We don't move anything
+        let this = unsafe { Pin::into_inner_unchecked(this) };
+
+        // We'll re-assemble the box in plane_destroy_callback()
+        let this = KBox::into_raw(this);
+
+        // UnregisteredPlane has an equivalent data layout
+        let this: *mut Self = this.cast();
+
+        // SAFETY: We just allocated the plane above, so this pointer must be valid
+        Ok(unsafe { &*this })
+    }
+}
+
+/// A trait implemented by any type that acts as a [`struct drm_plane`] interface.
+///
+/// This is implemented internally by DRM.
+///
+/// # Safety
+///
+/// [`as_raw()`] must always return a valid pointer to an initialized [`struct drm_plane`].
+///
+/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
+/// [`as_raw()`]: AsRawPlane::as_raw()
+pub unsafe trait AsRawPlane {
+    /// Return the raw `bindings::drm_plane` for this DRM plane.
+    ///
+    /// Drivers should never use this directly.
+    fn as_raw(&self) -> *mut bindings::drm_plane;
+
+    /// Convert a raw `bindings::drm_plane` pointer into an object of this type.
+    ///
+    /// # Safety
+    ///
+    /// Callers promise that `ptr` points to a valid instance of this type
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_plane) -> &'a Self;
+}
+
+// SAFETY:
+// - Via our type variants our data layout starts with `drm_plane`
+// - Since we don't expose `plane` to users before it has been initialized, this and our data
+//   layout ensure that `as_raw()` always returns a valid pointer to a `drm_plane`.
+unsafe impl<T: DriverPlane> AsRawPlane for Plane<T> {
+    fn as_raw(&self) -> *mut bindings::drm_plane {
+        self.plane.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_plane) -> &'a Self {
+        // Our data layout start with `bindings::drm_plane`.
+        let ptr: *mut Self = ptr.cast();
+
+        // SAFETY: Our safety contract requires that `ptr` point to a valid intance of `Self`.
+        unsafe { &*ptr }
+    }
+}
+
+// SAFETY: We only expose this object to users directly after KmsDriver::create_objects has been
+// called.
+unsafe impl<T: DriverPlane> ModesettablePlane for Plane<T> {
+    type State = PlaneState<T::State>;
+}
+
+// SAFETY: We don't expose Plane<T> to users before `base` is initialized in ::new(), so
+// `raw_mode_obj` always returns a valid pointer to a bindings::drm_mode_object.
+unsafe impl<T: DriverPlane> ModeObject for Plane<T> {
+    type Driver = T::Driver;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: DRM planes exist for as long as the device does, so this pointer is always valid
+        unsafe { Device::borrow((*self.as_raw()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose DRM planes to users before `base` is initialized
+        unsafe { addr_of_mut!((*self.as_raw()).base) }
+    }
+}
+
+// SAFETY: Planes do not have a refcount
+unsafe impl<T: DriverPlane> StaticModeObject for Plane<T> {}
+
+// SAFETY: Our interface is thread-safe.
+unsafe impl<T: DriverPlane> Send for Plane<T> {}
+
+// SAFETY: Our interface is thread-safe.
+unsafe impl<T: DriverPlane> Sync for Plane<T> {}
+
+/// A supertrait of [`AsRawPlane`] for [`struct drm_plane`] interfaces that can perform modesets.
+///
+/// This is implemented internally by DRM.
+///
+/// # Safety
+///
+/// Any object implementing this trait must only be made directly available to the user after
+/// [`create_objects`] has completed.
+///
+/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
+/// [`create_objects`]: KmsDriver::create_objects
+pub unsafe trait ModesettablePlane: AsRawPlane {
+    /// The type that should be returned for a plane state acquired using this plane interface
+    type State: FromRawPlaneState;
+}
+
+/// A trait implemented by any type which can produce a reference to a [`struct drm_plane_state`].
+///
+/// This is implemented internally by DRM.
+///
+/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
+pub trait AsRawPlaneState: private::AsRawPlaneState {
+    /// The type that this plane state interface returns to represent the parent DRM plane
+    type Plane: ModesettablePlane;
+}
+
+pub(crate) mod private {
+    /// Trait for retrieving references to the base plane state contained within any plane state
+    /// compatible type
+    #[allow(unreachable_pub)]
+    pub trait AsRawPlaneState {
+        /// Return an immutable reference to the raw plane state
+        fn as_raw(&self) -> &bindings::drm_plane_state;
+
+        /// Get a mutable reference to the raw `bindings::drm_plane_state` contained within this
+        /// type.
+        ///
+        /// # Safety
+        ///
+        /// The caller promises this mutable reference will not be used to modify any contents of
+        /// `bindings::drm_plane_state` which DRM would consider to be static - like the backpointer
+        /// to the DRM plane that owns this state. This also means the mutable reference should
+        /// never be exposed outside of this crate.
+        unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_plane_state;
+    }
+}
+
+pub(crate) use private::AsRawPlaneState as AsRawPlaneStatePrivate;
+
+/// A trait implemented for any type which can be constructed directly from a
+/// [`struct drm_plane_state`] pointer.
+///
+/// This is implemented internally by DRM.
+///
+/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
+pub trait FromRawPlaneState: AsRawPlaneState {
+    /// Get an immutable reference to this type from the given raw [`struct drm_plane_state`]
+    /// pointer.
+    ///
+    /// # Safety
+    ///
+    /// - The caller guarantees `ptr` is contained within a valid instance of `Self`
+    /// - The caller guarantees that `ptr` cannot not be modified for the lifetime of `'a`.
+    ///
+    /// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_plane_state) -> &'a Self;
+
+    /// Get a mutable reference to this type from the given raw [`struct drm_plane_state`] pointer.
+    ///
+    /// # Safety
+    ///
+    /// - The caller guarantees that `ptr` is contained within a valid instance of `Self`
+    /// - The caller guarantees that `ptr` cannot have any other references taken out for the
+    ///   lifetime of `'a`.
+    ///
+    /// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) -> &'a mut Self;
+}
+
+/// The main interface for a [`struct drm_plane_state`].
+///
+/// This type is the main interface for dealing with the atomic state of DRM planes. In addition, it
+/// allows access to whatever private data is contained within an implementor's [`DriverPlaneState`]
+/// type.
+///
+/// # Invariants
+///
+/// - The DRM C API and our interface guarantees that only the user has mutable access to `state`,
+///   up until [`drm_atomic_helper_commit_hw_done`] is called. Therefore, `plane` follows rust's
+///   data aliasing rules and does not need to be behind an [`Opaque`] type.
+/// - `state` and `inner` initialized for as long as this object is exposed to users.
+/// - The data layout of this structure begins with [`struct drm_plane_state`].
+/// - The plane for this atomic state can always be assumed to be of type [`Plane<T::Plane>`].
+///
+/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
+/// [`drm_atomic_helper_commit_hw_done`]: srctree/include/drm/drm_atomic_helper.h
+#[derive(Default)]
+#[repr(C)]
+pub struct PlaneState<T: DriverPlaneState> {
+    state: bindings::drm_plane_state,
+    inner: T,
+}
+
+/// The main trait for implementing the [`struct drm_plane_state`] API for a [`Plane`].
+///
+/// A driver may store driver-private data within the implementor's type, which will be available
+/// when using a full typed [`PlaneState`] object.
+///
+/// # Invariants
+///
+/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
+///   [`struct drm_plane`] pointers are contained within a [`Plane<Self::Plane>`].
+/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
+///   [`struct drm_plane_state`] pointers are contained within a [`PlaneState<Self>`].
+///
+/// [`struct drm_plane`]: srctree/include/drm_plane.h
+/// [`struct drm_plane_state`]: srctree/include/drm_plane.h
+pub trait DriverPlaneState: Clone + Default + Sized {
+    /// The type for this driver's drm_plane implementation
+    type Plane: DriverPlane;
+}
+
+impl<T: DriverPlaneState> Sealed for PlaneState<T> {}
+
+impl<T: DriverPlaneState> AsRawPlaneState for PlaneState<T> {
+    type Plane = Plane<T::Plane>;
+}
+
+impl<T: DriverPlaneState> private::AsRawPlaneState for PlaneState<T> {
+    fn as_raw(&self) -> &bindings::drm_plane_state {
+        &self.state
+    }
+
+    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_plane_state {
+        &mut self.state
+    }
+}
+
+impl<T: DriverPlaneState> FromRawPlaneState for PlaneState<T> {
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_plane_state) -> &'a Self {
+        // Our data layout starts with `bindings::drm_plane_state`.
+        let ptr: *const Self = ptr.cast();
+
+        // SAFETY:
+        // - Our safety contract requires that `ptr` be contained within `Self`.
+        // - Our safety contract requires the caller ensure that it is safe for us to take an
+        //   immutable reference.
+        unsafe { &*ptr }
+    }
+
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) -> &'a mut Self {
+        // Our data layout starts with `bindings::drm_plane_state`.
+        let ptr: *mut Self = ptr.cast();
+
+        // SAFETY:
+        // - Our safety contract requires that `ptr` be contained within `Self`.
+        // - Our safety contract requires the caller ensure it is safe for us to take a mutable
+        //   reference.
+        unsafe { &mut *ptr }
+    }
+}
+
+unsafe impl Zeroable for bindings::drm_plane_state {}
+
+impl<T: DriverPlaneState> Deref for PlaneState<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: DriverPlaneState> DerefMut for PlaneState<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.inner
+    }
+}
+
+unsafe extern "C" fn plane_destroy_callback<T: DriverPlane>(plane: *mut bindings::drm_plane) {
+    // SAFETY: DRM guarantees that `plane` points to a valid initialized `drm_plane`.
+    unsafe { bindings::drm_plane_cleanup(plane) };
+
+    // SAFETY:
+    // - DRM guarantees we are now the only one with access to this [`drm_plane`].
+    // - This cast is safe via `DriverPlane`s type invariants.
+    drop(unsafe { KBox::from_raw(plane as *mut Plane<T>) });
+}
+
+unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverPlaneState>(
+    plane: *mut bindings::drm_plane,
+) -> *mut bindings::drm_plane_state {
+    // SAFETY: DRM guarantees that `plane` points to a valid initialized `drm_plane`.
+    let state = unsafe { (*plane).state };
+    if state.is_null() {
+        return null_mut();
+    }
+
+    // SAFETY: This cast is safe via `DriverPlaneState`s type invariants.
+    let state = unsafe { PlaneState::<T>::from_raw(state) };
+
+    let new = KBox::try_init(
+        try_init!(PlaneState::<T> {
+            state: bindings::drm_plane_state {
+                ..Default::default()
+            },
+            inner: state.inner.clone()
+        }),
+        GFP_KERNEL,
+    );
+
+    if let Ok(mut new) = new {
+        // SAFETY:
+        // - `new` provides a valid pointer to a newly allocated `drm_plane_state` via type
+        //   invariants
+        // - This initializes `new` via memcpy()
+        unsafe { bindings::__drm_atomic_helper_plane_duplicate_state(plane, new.as_raw_mut()) };
+
+        KBox::into_raw(new).cast()
+    } else {
+        null_mut()
+    }
+}
+
+unsafe extern "C" fn atomic_destroy_state_callback<T: DriverPlaneState>(
+    _plane: *mut bindings::drm_plane,
+    state: *mut bindings::drm_plane_state,
+) {
+    // SAFETY: DRM guarantees that `state` points to a valid instance of `drm_plane_state`
+    unsafe { bindings::__drm_atomic_helper_plane_destroy_state(state) };
+
+    // SAFETY:
+    // * DRM guarantees we are the only one with access to this `drm_plane_state`
+    // * This cast is safe via our type invariants.
+    drop(unsafe { KBox::from_raw(state.cast::<PlaneState<T>>()) });
+}
+
+unsafe extern "C" fn plane_reset_callback<T: DriverPlane>(plane: *mut bindings::drm_plane) {
+    // SAFETY: DRM guarantees that `state` points to a valid instance of `drm_plane_state`
+    let state = unsafe { (*plane).state };
+    if !state.is_null() {
+        // SAFETY:
+        // - We're guaranteed `plane` is `Plane<T>` via type invariants
+        // - We're guaranteed `state` is `PlaneState<T>` via type invariants.
+        unsafe { atomic_destroy_state_callback::<T::State>(plane, state) }
+
+        // SAFETY: No special requirements here, DRM expects this to be NULL
+        unsafe {
+            (*plane).state = null_mut();
+        }
+    }
+
+    // Unfortunately, this is the best we can do at the moment as this FFI callback was mistakenly
+    // presumed to be infallible :(
+    let new =
+        KBox::new(PlaneState::<T::State>::default(), GFP_KERNEL).expect("Blame the API, sorry!");
+
+    // DRM takes ownership of the state from here, resets it, and then assigns it to the plane
+    // SAFETY:
+    // - DRM guarantees that `plane` points to a valid instance of `drm_plane`.
+    // - The cast to `drm_plane_state` is safe via `PlaneState`s type invariants.
+    unsafe { bindings::__drm_atomic_helper_plane_reset(plane, KBox::into_raw(new).cast()) };
+}
-- 
2.48.1

