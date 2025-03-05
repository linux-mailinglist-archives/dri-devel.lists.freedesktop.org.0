Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B07A53DF9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E3D10E84B;
	Wed,  5 Mar 2025 23:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AVsh+Oo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287BB10E84B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3hYAZMTN2jTPeOCbI/wI2H7Z/11t/pfZBKrXGMP/6Y=;
 b=AVsh+Oo+XMyG4Hb9/Hzy9xB2YWnLht31cCzxt4XQ8sCndSd9h76V516rJ3ACKYQLYjblM1
 h6WWYdkrwhSjIPD8X91ovTe60kChi+xNkeAjpaGyVah0a1i+PdcbrJVKPnkW96/xDe7nBF
 NEUtV3vF8704sEDl062ItNLGq7aLAlQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-mpPo4-fhOxOK9YLqfb8UNA-1; Wed,
 05 Mar 2025 18:05:32 -0500
X-MC-Unique: mpPo4-fhOxOK9YLqfb8UNA-1
X-Mimecast-MFC-AGG-ID: mpPo4-fhOxOK9YLqfb8UNA_1741215927
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C7FC019560B8; Wed,  5 Mar 2025 23:05:26 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 75C7E300019E; Wed,  5 Mar 2025 23:05:22 +0000 (UTC)
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
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 06/33] rust: drm/kms: Add drm_crtc bindings
Date: Wed,  5 Mar 2025 17:59:22 -0500
Message-ID: <20250305230406.567126-7-lyude@redhat.com>
In-Reply-To: <20250305230406.567126-1-lyude@redhat.com>
References: <20250305230406.567126-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This introduces basic bindings for DRM CRTCs which follow the same general
pattern as connectors and planes (e.g. AsRawCrtc, AsRawCrtcState, etc.).
There is one big difference though - drm_crtc_state appears to be the one
atomic state that actually has data which can be mutated from outside of
the atomic commit phase - which means we can't keep rust referencs to it,
and instead need to use the Opaque type and implement things through
pointers instead.

This should be the last mode object we're introducing for the time being
with its own atomic state. Note that we've not added bindings for private
modesetting objects yet, but I don't think those will be needed for rvkms -
and the same general patterns we're using here should work for adding
private modesetting objects.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

TODO:
* Add commit data in the future

V3:
* Add safety comments for ModeObject implementation
* Make AsRawCrtc unsafe, as we need a guarantee that `as_raw()` will always
  return a pointer to a valid `drm_crtc`.
* Update safety comments in atomic_duplicate_state_callback
* Rename generics in Crtc::new to PrimaryData and CursorData
* Add missing safety comment in Crtc::new()
* Improve safety comments in AsRawCrtc
* Break up the conversion from Pin<Box<Crtc>> to &Crtc a bit
* Document why there's an UnsafeCell in CrtcState, because even I forgot
  the reason for this :).
* Introduce UnregisteredCrtc type
* Don't have AsRawCrtc be a supertrait of StaticModeObject. We don't want
  Unregistered mode object variants to be able to return a pointer to the
  DRM device since that would break the UnregisteredKmsDevice pattern.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h |   2 +-
 rust/kernel/drm/kms.rs          |   1 +
 rust/kernel/drm/kms/crtc.rs     | 577 ++++++++++++++++++++++++++++++++
 3 files changed, 579 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/drm/kms/crtc.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 5b85f3faca525..551ddcf02ea0e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,7 +10,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_connector.h>
-#include <drm/drm_plane.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 6cc5bb53f3628..f8d6d522c9d96 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -3,6 +3,7 @@
 //! KMS driver abstractions for rust.
 
 pub mod connector;
+pub mod crtc;
 pub mod plane;
 
 use crate::{
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
new file mode 100644
index 0000000000000..95c79ffb584cd
--- /dev/null
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -0,0 +1,577 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM CRTCs.
+//!
+//! C header: [`include/drm/drm_crtc.h`](srctree/include/drm/drm_crtc.h)
+
+use super::{plane::*, KmsDriver, ModeObject, StaticModeObject, UnregisteredKmsDevice};
+use crate::{
+    alloc::KBox,
+    bindings,
+    drm::device::Device,
+    error::to_result,
+    init::Zeroable,
+    prelude::*,
+    private::Sealed,
+    types::{NotThreadSafe, Opaque},
+};
+use core::{
+    cell::UnsafeCell,
+    marker::*,
+    mem,
+    ops::{Deref, DerefMut},
+    ptr::{addr_of_mut, null, null_mut},
+};
+use macros::vtable;
+
+/// The main trait for implementing the [`struct drm_crtc`] API for [`Crtc`].
+///
+/// Any KMS driver should have at least one implementation of this type, which allows them to create
+/// [`Crtc`] objects. Additionally, a driver may store driver-private data within the type that
+/// implements [`DriverCrtc`] - and it will be made available when using a fully typed [`Crtc`]
+/// object.
+///
+/// # Invariants
+///
+/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
+///   [`struct drm_crtc`] pointers are contained within a [`Crtc<Self>`].
+/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
+///   [`struct drm_crtc_state`] pointers are contained within a [`CrtcState<Self::State>`].
+///
+/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
+/// [`struct drm_crtc_state`]: srctree/include/drm/drm_crtc.h
+#[vtable]
+pub trait DriverCrtc: Send + Sync + Sized {
+    /// The generated C vtable for this [`DriverCrtc`] implementation.
+    #[unique]
+    const OPS: &'static DriverCrtcOps = &DriverCrtcOps {
+        funcs: bindings::drm_crtc_funcs {
+            atomic_destroy_state: Some(atomic_destroy_state_callback::<Self::State>),
+            atomic_duplicate_state: Some(atomic_duplicate_state_callback::<Self::State>),
+            atomic_get_property: None,
+            atomic_print_state: None,
+            atomic_set_property: None,
+            cursor_move: None,
+            cursor_set2: None,
+            cursor_set: None,
+            destroy: Some(crtc_destroy_callback::<Self>),
+            disable_vblank: None,
+            early_unregister: None,
+            enable_vblank: None,
+            gamma_set: None,
+            get_crc_sources: None,
+            get_vblank_counter: None,
+            get_vblank_timestamp: None,
+            late_register: None,
+            page_flip: Some(bindings::drm_atomic_helper_page_flip),
+            page_flip_target: None,
+            reset: Some(crtc_reset_callback::<Self::State>),
+            set_config: Some(bindings::drm_atomic_helper_set_config),
+            set_crc_source: None,
+            set_property: None,
+            verify_crc_source: None,
+        },
+
+        helper_funcs: bindings::drm_crtc_helper_funcs {
+            atomic_disable: None,
+            atomic_enable: None,
+            atomic_check: None,
+            dpms: None,
+            commit: None,
+            prepare: None,
+            disable: None,
+            mode_set: None,
+            mode_valid: None,
+            mode_fixup: None,
+            atomic_begin: None,
+            atomic_flush: None,
+            mode_set_nofb: None,
+            mode_set_base: None,
+            mode_set_base_atomic: None,
+            get_scanout_position: None,
+        },
+    };
+
+    /// The type to pass to the `args` field of [`UnregisteredCrtc::new`].
+    ///
+    /// This type will be made available in in the `args` argument of [`Self::new`]. Drivers which
+    /// don't need this can simply pass [`()`] here.
+    type Args;
+
+    /// The parent [`KmsDriver`] implementation.
+    type Driver: KmsDriver;
+
+    /// The [`DriverCrtcState`] implementation for this [`DriverCrtc`].
+    ///
+    /// See [`DriverCrtcState`] for more info.
+    type State: DriverCrtcState;
+
+    /// The constructor for creating a [`Crtc`] using this [`DriverCrtc`] implementation.
+    ///
+    /// Drivers may use this to instantiate their [`DriverCrtc`] object.
+    fn new(device: &Device<Self::Driver>, args: &Self::Args) -> impl PinInit<Self, Error>;
+}
+
+/// The generated C vtable for a [`DriverCrtc`].
+///
+/// This type is created internally by DRM.
+pub struct DriverCrtcOps {
+    funcs: bindings::drm_crtc_funcs,
+    helper_funcs: bindings::drm_crtc_helper_funcs,
+}
+
+/// The main interface for a [`struct drm_crtc`].
+///
+/// This type is the main interface for dealing with DRM CRTCs. In addition, it also allows
+/// immutable access to whatever private data is contained within an implementor's [`DriverCrtc`]
+/// type.
+///
+/// # Invariants
+///
+/// - `crtc` and `inner` are initialized for as long as this object is made available to users.
+/// - The data layout of this structure begins with [`struct drm_crtc`].
+/// - The atomic state for this type can always be assumed to be of type [`CrtcState<T::State>`].
+///
+/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
+#[repr(C)]
+#[pin_data]
+pub struct Crtc<T: DriverCrtc> {
+    // The FFI drm_crtc object
+    crtc: Opaque<bindings::drm_crtc>,
+    /// The driver's private inner data
+    #[pin]
+    inner: T,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+// SAFETY: DRM expects this struct to be zero-initialized
+unsafe impl Zeroable for bindings::drm_crtc {}
+
+impl<T: DriverCrtc> Sealed for Crtc<T> {}
+
+// SAFETY: Our CRTC interfaces are guaranteed to be thread-safe
+unsafe impl<T: DriverCrtc> Send for Crtc<T> {}
+
+// SAFETY: Our CRTC interfaces are guaranteed to be thread-safe
+unsafe impl<T: DriverCrtc> Sync for Crtc<T> {}
+
+impl<T: DriverCrtc> Deref for Crtc<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+// SAFETY: We don't expose Crtc<T> to users before `base` is initialized in ::new(), so
+// `raw_mode_obj` always returns a valid pointer to a bindings::drm_mode_object.
+unsafe impl<T: DriverCrtc> ModeObject for Crtc<T> {
+    type Driver = T::Driver;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: DRM connectors exist for as long as the device does, so this pointer is always
+        // valid
+        unsafe { Device::borrow((*self.as_raw()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose Crtc<T> to users before it's initialized, so `base` is always
+        // initialized
+        unsafe { addr_of_mut!((*self.as_raw()).base) }
+    }
+}
+
+// SAFETY: CRTCs are non-refcounted modesetting objects
+unsafe impl<T: DriverCrtc> StaticModeObject for Crtc<T> {}
+
+/// A [`Crtc`] that has not yet been registered with userspace.
+///
+/// KMS registration is single-threaded, so this object is not thread-safe.
+///
+/// # Invariants
+///
+/// - This object can only exist before its respective KMS device has been registered.
+/// - Otherwise, it inherits all invariants of [`Crtc`] and has an identical data layout.
+pub struct UnregisteredCrtc<T: DriverCrtc>(Crtc<T>, NotThreadSafe);
+
+impl<T: DriverCrtc> UnregisteredCrtc<T> {
+    /// Construct a new [`UnregisteredCrtc`].
+    ///
+    /// A driver may use this from their [`KmsDriver::create_objects`] callback in order to
+    /// construct new [`UnregisteredCrtc`] objects.
+    ///
+    /// [`KmsDriver::create_objects`]: kernel::drm::kms::KmsDriver::create_objects
+    pub fn new<'a, 'b: 'a, PrimaryData, CursorData>(
+        dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
+        primary: &'a UnregisteredPlane<PrimaryData>,
+        cursor: Option<&'a UnregisteredPlane<CursorData>>,
+        name: Option<&CStr>,
+        args: T::Args,
+    ) -> Result<&'a Self>
+    where
+        PrimaryData: DriverPlane<Driver = T::Driver>,
+        CursorData: DriverPlane<Driver = T::Driver>,
+    {
+        let this: Pin<KBox<Crtc<T>>> = KBox::try_pin_init(
+            try_pin_init!(Crtc::<T> {
+                crtc: Opaque::new(bindings::drm_crtc {
+                    helper_private: &T::OPS.helper_funcs,
+                    ..Default::default()
+                }),
+                inner <- T::new(dev, &args),
+                _p: PhantomPinned,
+            }),
+            GFP_KERNEL,
+        )?;
+
+        // SAFETY:
+        // - `dev` handles destroying the CRTC and thus will outlive us.
+        // - We just allocated `this`, and we won't move it since it's pinned
+        // - `primary` and `cursor` share the lifetime 'a with `dev`
+        // - This function will memcpy the contents of `name` into its own storage.
+        to_result(unsafe {
+            bindings::drm_crtc_init_with_planes(
+                dev.as_raw(),
+                this.as_raw(),
+                primary.as_raw(),
+                cursor.map_or(null_mut(), |c| c.as_raw()),
+                &T::OPS.funcs,
+                name.map_or(null(), |n| n.as_char_ptr()),
+            )
+        })?;
+
+        // SAFETY: We don't move anything
+        let this = unsafe { Pin::into_inner_unchecked(this) };
+
+        // We'll re-assemble the box in crtc_destroy_callback()
+        let this = KBox::into_raw(this);
+
+        // UnregisteredCrtc has an equivalent data layout
+        let this: *mut Self = this.cast();
+
+        // SAFETY: We just allocated the crtc above, so this pointer must be valid
+        Ok(unsafe { &*this })
+    }
+}
+
+// SAFETY: We inherit all relevant invariants of `Crtc`
+unsafe impl<T: DriverCrtc> AsRawCrtc for UnregisteredCrtc<T> {
+    fn as_raw(&self) -> *mut bindings::drm_crtc {
+        self.0.as_raw()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self {
+        // SAFETY: This is another from_raw() call, so this function shares the same safety contract
+        let crtc = unsafe { Crtc::<T>::from_raw(ptr) };
+
+        // SAFETY: Our data layout is identical via our type invariants.
+        unsafe { mem::transmute(crtc) }
+    }
+}
+
+impl<T: DriverCrtc> Deref for UnregisteredCrtc<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0.inner
+    }
+}
+
+/// A trait implemented by any type that acts as a [`struct drm_crtc`] interface.
+///
+/// This is implemented internally by DRM.
+///
+/// # Safety
+///
+/// [`as_raw()`] must always return a valid pointer to a [`struct drm_crtc`].
+///
+/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
+/// [`as_raw()`]: AsRawCrtc::as_raw()
+pub unsafe trait AsRawCrtc {
+    /// Return a raw pointer to the `bindings::drm_crtc` for this object
+    fn as_raw(&self) -> *mut bindings::drm_crtc;
+
+    /// Convert a raw [`struct drm_crtc`] pointer into an object of this type.
+    ///
+    /// # Safety
+    ///
+    /// Callers promise that `ptr` points to a valid instance of this type
+    ///
+    /// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self;
+}
+
+// SAFETY:
+// - Via our type variants our data layout starts with `drm_crtc`
+// - Since we don't expose `crtc` to users before it has been initialized, this and our data
+//   layout ensure that `as_raw()` always returns a valid pointer to a `drm_crtc`.
+unsafe impl<T: DriverCrtc> AsRawCrtc for Crtc<T> {
+    fn as_raw(&self) -> *mut bindings::drm_crtc {
+        self.crtc.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self {
+        // Our data layout start with `bindings::drm_crtc`.
+        let ptr: *mut Self = ptr.cast();
+
+        // SAFETY: Our safety contract requires that `ptr` point to a valid intance of `Self`.
+        unsafe { &*ptr }
+    }
+}
+
+// SAFETY: We only expose this object to users directly after KmsDriver::create_objects has been
+// called.
+unsafe impl<T: DriverCrtc> ModesettableCrtc for Crtc<T> {
+    type State = CrtcState<T::State>;
+}
+
+/// A supertrait of [`AsRawCrtc`] for [`struct drm_crtc`] interfaces that can perform modesets.
+///
+/// This is implemented internally by DRM.
+///
+/// # Safety
+///
+/// Any object implementing this trait must only be made directly available to the user after
+/// [`create_objects`] has completed.
+///
+/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
+/// [`create_objects`]: KmsDriver::create_objects
+pub unsafe trait ModesettableCrtc: AsRawCrtc {
+    /// The type that should be returned for a CRTC state acquired using this CRTC interface
+    type State: FromRawCrtcState;
+}
+unsafe impl Zeroable for bindings::drm_crtc_state {}
+
+impl<T: DriverCrtcState> Sealed for CrtcState<T> {}
+
+/// The main trait for implementing the [`struct drm_crtc_state`] API for a [`Crtc`].
+///
+/// A driver may store driver-private data within the implementor's type, which will be available
+/// when using a full typed [`CrtcState`] object.
+///
+/// # Invariants
+///
+/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
+///   [`struct drm_crtc`] pointers are contained within a [`Crtc<Self::Crtc>`].
+/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
+///   [`struct drm_crtc_state`] pointers are contained within a [`CrtcState<Self>`].
+///
+/// [`struct drm_crtc`]: srctree/include/drm_crtc.h
+/// [`struct drm_crtc_state`]: srctree/include/drm_crtc.h
+pub trait DriverCrtcState: Clone + Default + Unpin {
+    /// The parent CRTC driver for this CRTC state
+    type Crtc: DriverCrtc<State = Self>
+    where
+        Self: Sized;
+}
+
+/// The main interface for a [`struct drm_crtc_state`].
+///
+/// This type is the main interface for dealing with the atomic state of DRM crtcs. In addition, it
+/// allows access to whatever private data is contained within an implementor's [`DriverCrtcState`]
+/// type.
+///
+/// # Invariants
+///
+/// - `state` and `inner` initialized for as long as this object is exposed to users.
+/// - The data layout of this structure begins with [`struct drm_crtc_state`].
+/// - The CRTC for this type can always be assumed to be of type [`Crtc<T::Crtc>`].
+///
+/// [`struct drm_crtc_state`]: srctree/include/drm/drm_crtc.h
+#[repr(C)]
+pub struct CrtcState<T: DriverCrtcState> {
+    // It should be noted that CrtcState is a bit of an oddball - it's the only atomic state
+    // structure that can be modified after it has been swapped in, which is why we need to have
+    // `state` within an `Opaque<>`…
+    state: Opaque<bindings::drm_crtc_state>,
+
+    // …it is also one of the few atomic states that some drivers will embed work structures into,
+    // which means there's a good chance in the future we may have pinned data here - making it
+    // impossible for us to hold a mutable or immutable reference to the CrtcState. In preparation
+    // for that possibility, we keep `T` in an UnsafeCell.
+    inner: UnsafeCell<T>,
+}
+
+impl<T: DriverCrtcState> Deref for CrtcState<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Our interface ensures that `inner` will not be modified unless only a single
+        // mutable reference exists to `inner`, so this is safe
+        unsafe { &*self.inner.get() }
+    }
+}
+
+impl<T: DriverCrtcState> DerefMut for CrtcState<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        self.inner.get_mut()
+    }
+}
+
+/// A trait implemented by any type which can produce a reference to a [`struct drm_crtc_state`].
+///
+/// This is implemented internally by DRM.
+///
+/// [`struct drm_crtc_state`]: srctree/include/drm/drm_crtc.h
+pub trait AsRawCrtcState: private::AsRawCrtcState {
+    /// The type that this CRTC state interface returns to represent the parent CRTC
+    type Crtc: ModesettableCrtc;
+}
+
+pub(crate) mod private {
+    use super::*;
+
+    #[allow(unreachable_pub)]
+    pub trait AsRawCrtcState {
+        /// Return a raw pointer to the DRM CRTC state
+        ///
+        /// Note that CRTC states are the only atomic state in KMS which don't nicely follow rust's
+        /// data aliasing rules already.
+        fn as_raw(&self) -> *mut bindings::drm_crtc_state;
+    }
+}
+
+/// A trait for providing common methods which can be used on any type that can be used as an atomic
+/// CRTC state.
+pub trait RawCrtcState: AsRawCrtcState {
+    /// Return the CRTC that owns this state.
+    fn crtc(&self) -> &Self::Crtc {
+        // SAFETY:
+        // - This type conversion is guaranteed by type invariance
+        // - Our interface ensures that this access follows rust's data-aliasing rules
+        // - `crtc` is guaranteed to never be NULL and is invariant throughout the lifetime of the
+        //   state
+        unsafe { <Self::Crtc as AsRawCrtc>::from_raw((*self.as_raw()).crtc) }
+    }
+}
+impl<T: AsRawCrtcState> RawCrtcState for T {}
+
+/// A trait implemented for any type which can be constructed directly from a
+/// [`struct drm_crtc_state`] pointer.
+///
+/// This is implemented internally by DRM.
+///
+/// [`struct drm_crtc_state`]: srctree/include/drm/drm_crtc.h
+pub trait FromRawCrtcState: AsRawCrtcState {
+    /// Obtain a reference back to this type from a raw DRM crtc state pointer
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that ptr contains a valid instance of this type.
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_crtc_state) -> &'a Self;
+}
+
+impl<T: DriverCrtcState> private::AsRawCrtcState for CrtcState<T> {
+    #[inline]
+    fn as_raw(&self) -> *mut bindings::drm_crtc_state {
+        self.state.get()
+    }
+}
+
+impl<T: DriverCrtcState> AsRawCrtcState for CrtcState<T> {
+    type Crtc = Crtc<T::Crtc>;
+}
+
+impl<T: DriverCrtcState> FromRawCrtcState for CrtcState<T> {
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_crtc_state) -> &'a Self {
+        // SAFETY: Our data layout starts with `bindings::drm_crtc_state`
+        unsafe { &*(ptr.cast()) }
+    }
+}
+
+unsafe extern "C" fn crtc_destroy_callback<T: DriverCrtc>(crtc: *mut bindings::drm_crtc) {
+    // SAFETY: DRM guarantees that `crtc` points to a valid initialized `drm_crtc`.
+    unsafe { bindings::drm_crtc_cleanup(crtc) };
+
+    // SAFETY:
+    // - DRM guarantees we are now the only one with access to this [`drm_crtc`].
+    // - This cast is safe via `DriverCrtc`s type invariants.
+    // - We created this as a pinned type originally
+    drop(unsafe { Pin::new_unchecked(KBox::from_raw(crtc as *mut Crtc<T>)) });
+}
+
+unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverCrtcState>(
+    crtc: *mut bindings::drm_crtc,
+) -> *mut bindings::drm_crtc_state {
+    // SAFETY: DRM guarantees that `crtc` points to a valid initialized `drm_crtc`.
+    let state = unsafe { (*crtc).state };
+    if state.is_null() {
+        return null_mut();
+    }
+
+    // SAFETY: This cast is safe via `DriverCrtcState`s type invariants.
+    let crtc = unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
+
+    // SAFETY: This cast is safe via `DriverCrtcState`s type invariants.
+    let state = unsafe { CrtcState::<T>::from_raw(state) };
+
+    let new = KBox::try_init(
+        try_init!(CrtcState::<T> {
+            state: Opaque::new(Default::default()),
+            inner: UnsafeCell::new((*state).clone()),
+        }),
+        GFP_KERNEL,
+    );
+
+    if let Ok(new) = new {
+        let new = KBox::into_raw(new).cast();
+
+        // SAFETY:
+        // - `new` provides a valid pointer to a newly allocated `drm_crtc_state` via type
+        // invariants
+        // - This initializes `new` via memcpy()
+        unsafe { bindings::__drm_atomic_helper_crtc_duplicate_state(crtc.as_raw(), new) }
+
+        new
+    } else {
+        null_mut()
+    }
+}
+
+unsafe extern "C" fn atomic_destroy_state_callback<T: DriverCrtcState>(
+    _crtc: *mut bindings::drm_crtc,
+    crtc_state: *mut bindings::drm_crtc_state,
+) {
+    // SAFETY: DRM guarantees that `state` points to a valid instance of `drm_crtc_state`
+    unsafe { bindings::__drm_atomic_helper_crtc_destroy_state(crtc_state) };
+
+    // SAFETY:
+    // - DRM guarantees we are the only one with access to this `drm_crtc_state`
+    // - This cast is safe via our type invariants.
+    // - All data in `CrtcState` is either Unpin, or pinned
+    drop(unsafe { KBox::from_raw(crtc_state as *mut CrtcState<T>) });
+}
+
+unsafe extern "C" fn crtc_reset_callback<T: DriverCrtcState>(crtc: *mut bindings::drm_crtc) {
+    // SAFETY: DRM guarantees that `state` points to a valid instance of `drm_crtc_state`
+    let state = unsafe { (*crtc).state };
+    if !state.is_null() {
+        // SAFETY:
+        // - We're guaranteed `crtc` is `Crtc<T>` via type invariants
+        // - We're guaranteed `state` is `CrtcState<T>` via type invariants.
+        unsafe { atomic_destroy_state_callback::<T>(crtc, state) }
+
+        // SAFETY: No special requirements here, DRM expects this to be NULL
+        unsafe {
+            (*crtc).state = null_mut();
+        }
+    }
+
+    // SAFETY: `crtc` is guaranteed to be of type `Crtc<T::Crtc>` by type invariance
+    let crtc = unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
+
+    // Unfortunately, this is the best we can do at the moment as this FFI callback was mistakenly
+    // presumed to be infallible :(
+    let new = KBox::try_init(
+        try_init!(CrtcState::<T> {
+            state: Opaque::new(Default::default()),
+            inner: UnsafeCell::new(Default::default()),
+        }),
+        GFP_KERNEL,
+    )
+    .expect("Unfortunately, this API was presumed infallible");
+
+    // SAFETY: DRM takes ownership of the state from here, and will never move it
+    unsafe { bindings::__drm_atomic_helper_crtc_reset(crtc.as_raw(), KBox::into_raw(new).cast()) };
+}
-- 
2.48.1

