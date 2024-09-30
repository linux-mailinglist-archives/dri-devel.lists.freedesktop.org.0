Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809CB98B0E7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE3E10E46F;
	Mon, 30 Sep 2024 23:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZZlVBMOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355EB10E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zsg6b5UNPhHsmvqymPCPnflKtWQ+9pnWvRyUUcC31Ac=;
 b=ZZlVBMOtZtzZczYOYeEjo7rxKMOyydq2LzihfabliEcwVEiXgd071MzdZOVQir4JZC2l/B
 AtLzXSA63KS+42yvM/k0cCZGoD+7LQdWExwsNNYRgtjlYMWYjGD46ku6dwYzgJK0WaLZ9R
 8/ZRww6crjpmG2cnfFQxDTLQs+8CjyY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-PlY6vkyENYeWN7BvNNgSPA-1; Mon,
 30 Sep 2024 19:38:17 -0400
X-MC-Unique: PlY6vkyENYeWN7BvNNgSPA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D8230193EB0B; Mon, 30 Sep 2024 23:38:14 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0B7593003DEC; Mon, 30 Sep 2024 23:38:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 07/35] WIP: rust: drm/kms: Add drm_crtc bindings
Date: Mon, 30 Sep 2024 19:09:50 -0400
Message-ID: <20240930233257.1189730-8-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
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

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms.rs      |   1 +
 rust/kernel/drm/kms/crtc.rs | 501 ++++++++++++++++++++++++++++++++++++
 2 files changed, 502 insertions(+)
 create mode 100644 rust/kernel/drm/kms/crtc.rs

diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 5b075794a1155..4b54611fdba8b 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -3,6 +3,7 @@
 //! KMS driver abstractions for rust.
 
 pub mod connector;
+pub mod crtc;
 pub mod fbdev;
 pub mod plane;
 
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
new file mode 100644
index 0000000000000..d84db49948380
--- /dev/null
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! KMS driver abstractions for rust.
+
+use super::{
+    plane::*,
+    ModeObject,
+    StaticModeObject,
+    KmsDriver,
+    UnregisteredKmsDevice
+};
+use crate::{
+    bindings,
+    drm::device::Device,
+    device,
+    prelude::*,
+    private::Sealed,
+    error::from_result,
+    types::Opaque,
+    init::Zeroable,
+    sync::Arc,
+    error::to_result,
+};
+use core::{
+    cell::{Cell, UnsafeCell},
+    marker::*,
+    ptr::{NonNull, null, null_mut, addr_of_mut, self},
+    ops::{Deref, DerefMut},
+    mem,
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
+            gamma_set: None, // TODO
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
+    /// The type to pass to the `args` field of [`Crtc::new`].
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
+unsafe impl Zeroable for bindings::drm_crtc { }
+
+impl<T: DriverCrtc> Sealed for Crtc<T> {}
+
+// SAFETY: Our CRTC interfaces are guaranteed to be thread-safe
+unsafe impl<T: DriverCrtc> Send for Crtc<T> { }
+
+// SAFETY: Our CRTC interfaces are guaranteed to be thread-safe
+unsafe impl<T: DriverCrtc> Sync for Crtc<T> { }
+
+impl<T: DriverCrtc> Deref for Crtc<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<T: DriverCrtc> ModeObject for Crtc<T> {
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
+unsafe impl<T: DriverCrtc> StaticModeObject for Crtc<T> { }
+
+impl<T: DriverCrtc> Crtc<T> {
+    /// Construct a new [`Crtc`].
+    ///
+    /// A driver may use this from their [`Kms::create_objects`] callback in order to construct new
+    /// [`Crtc`] objects.
+    ///
+    /// [`Kms::create_objects`]: kernel::drm::kms::Kms::create_objects
+    pub fn new<'a, 'b: 'a, P, C>(
+        dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
+        primary: &'a Plane<P>,
+        cursor: Option<&'a Plane<C>>,
+        name: Option<&CStr>,
+        args: T::Args,
+    ) -> Result<&'b Self>
+    where
+        P: DriverPlane<Driver = T::Driver>,
+        C: DriverPlane<Driver = T::Driver>
+    {
+        let this = Box::try_pin_init(
+            try_pin_init!(Self {
+                crtc: Opaque::new(bindings::drm_crtc {
+                    helper_private: &T::OPS.helper_funcs,
+                    ..Default::default()
+                }),
+                inner <- T::new(dev, &args),
+                _p: PhantomPinned,
+            }),
+            GFP_KERNEL
+        )?;
+
+        to_result(unsafe {
+            bindings::drm_crtc_init_with_planes(
+                dev.as_raw(),
+                this.as_raw(),
+                primary.as_raw(),
+                cursor.map_or(null_mut(), |c| c.as_raw()),
+                &T::OPS.funcs,
+                name.map_or(null(), |n| n.as_char_ptr())
+            )
+        })?;
+
+        // Convert the box into a raw pointer, we'll re-assemble it in crtc_destroy_callback()
+        // SAFETY: We don't move anything
+        Ok(unsafe { &*Box::into_raw(Pin::into_inner_unchecked(this)) })
+    }
+}
+
+/// A trait implemented by any type that acts as a [`struct drm_crtc`] interface.
+///
+/// This is implemented internally by DRM.
+///
+/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
+pub trait AsRawCrtc: StaticModeObject {
+    /// The type that should be returned for a CRTC state acquired using this CRTC interface
+    type State: FromRawCrtcState;
+
+    /// Return a raw pointer to the `bindings::drm_crtc` for this object
+    fn as_raw(&self) -> *mut bindings::drm_crtc;
+
+    /// Convert a raw `bindings::drm_crtc` pointer into an object of this type.
+    ///
+    /// SAFETY: Callers promise that `ptr` points to a valid instance of this type
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self;
+}
+
+impl<T: DriverCrtc> AsRawCrtc for Crtc<T> {
+    type State = CrtcState<T::State>;
+
+    fn as_raw(&self) -> *mut bindings::drm_crtc {
+        self.crtc.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self {
+        // SAFETY: Our data layout starts with `bindings::drm_crtc`
+        unsafe { &*ptr.cast() }
+    }
+}
+
+unsafe impl Zeroable for bindings::drm_crtc_state { }
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
+    type Crtc: DriverCrtc<State = Self> where Self: Sized;
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
+    state: Opaque<bindings::drm_crtc_state>,
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
+        // SAFETY: Our interfaces ensures that we either have one mutable reference to the state
+        // (this one), or multiple immutable references
+        unsafe { self.inner.get_mut() }
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
+    type Crtc: AsRawCrtc;
+}
+
+pub(crate) mod private {
+    use super::*;
+
+    #[doc(hidden)]
+    pub trait AsRawCrtcState {
+        /// Return a raw pointer to the DRM CRTC state
+        ///
+        /// Note that CRTC states are the only atomic state in KMS which don't nicely follow rust's
+        /// data aliasing rules already.
+        fn as_raw(&self) -> *mut bindings::drm_crtc_state;
+    }
+}
+
+pub(super) use private::AsRawCrtcState as AsRawCrtcStatePrivate;
+
+/// A trait for providing common methods which can be used on any type that can be used as an atomic
+/// CRTC state.
+pub trait RawCrtcState: AsRawCrtcState {
+    /// Return the CRTC that owns this state.
+    fn crtc(&self) -> &Self::Crtc {
+        // SAFETY:
+        // * This type conversion is guaranteed by type invariance
+        // * Our interface ensures that this access follows rust's data-aliasing rules
+        // * `crtc` is guaranteed to never be NULL and is invariant throughout the lifetime of the
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
+unsafe extern "C" fn crtc_destroy_callback<T: DriverCrtc>(
+    crtc: *mut bindings::drm_crtc
+) {
+    // SAFETY: DRM guarantees that `crtc` points to a valid initialized `drm_crtc`.
+    unsafe { bindings::drm_crtc_cleanup(crtc) };
+
+    // SAFETY:
+    // - DRM guarantees we are now the only one with access to this [`drm_crtc`].
+    // - This cast is safe via `DriverCrtc`s type invariants.
+    // - We created this as a pinned type originally
+    drop(unsafe { Pin::new_unchecked(Box::from_raw(crtc as *mut Crtc<T>)) });
+}
+
+unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverCrtcState>(
+    crtc: *mut bindings::drm_crtc
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
+    let mut new = Box::try_init(
+        try_init!(CrtcState::<T> {
+            state: Opaque::new(Default::default()),
+            inner: UnsafeCell::new((*state).clone()),
+        }),
+        GFP_KERNEL
+    );
+
+    if let Ok(mut new) = new {
+        let new = Box::into_raw(new).cast();
+
+        // SAFETY: DRM simply copies the data from the previous base DRM state here and does not
+        // move the contents of `ptr`
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
+    // * DRM guarantees we are the only one with access to this `drm_crtc_state`
+    // * This cast is safe via our type invariants.
+    // * All data in `CrtcState` is either Unpin, or pinned
+    drop(unsafe { Box::from_raw(crtc_state as *mut CrtcState<T>) });
+}
+
+unsafe extern "C" fn crtc_reset_callback<T: DriverCrtcState>(
+    crtc: *mut bindings::drm_crtc,
+) {
+    // SAFETY: DRM guarantees that `state` points to a valid instance of `drm_crtc_state`
+    let state = unsafe { (*crtc).state };
+    if !state.is_null() {
+        // SAFETY:
+        // * We're guaranteed `crtc` is `Crtc<T>` via type invariants
+        // * We're guaranteed `state` is `CrtcState<T>` via type invariants.
+        unsafe { atomic_destroy_state_callback::<T>(crtc, state) }
+
+        // SAFETY: No special requirements here, DRM expects this to be NULL
+        unsafe { (*crtc).state = null_mut(); }
+    }
+
+    // SAFETY: `crtc` is guaranteed to be of type `Crtc<T::Crtc>` by type invariance
+    let crtc = unsafe { Crtc::<T::Crtc>::from_raw(crtc) };
+
+    // Unfortunately, this is the best we can do at the moment as this FFI callback was mistakenly
+    // presumed to be infallible :(
+    let new = Box::try_init(
+        try_init!(CrtcState::<T> {
+            state: Opaque::new(Default::default()),
+            inner: UnsafeCell::new(Default::default()),
+        }),
+        GFP_KERNEL
+    ).expect("Unfortunately, this API was presumed infallible");
+
+    // SAFETY: DRM takes ownership of the state from here, and will never move it
+    unsafe {
+        bindings::__drm_atomic_helper_crtc_reset(
+            crtc.as_raw(),
+            Box::into_raw(new).cast()
+        )
+    };
+}
-- 
2.46.1

