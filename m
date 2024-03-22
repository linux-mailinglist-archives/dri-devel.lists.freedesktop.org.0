Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436038874C7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 23:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586D5112827;
	Fri, 22 Mar 2024 22:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YWx3bPHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EB4112827
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711145735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7GQ3fPHiJFc4OvZ+/3sVtCU8QWBFnwHWiIOmeagJEg=;
 b=YWx3bPHd3qglprymwy/hgBr6qGJgWTvJxJgONAuDwK9FFBYWRaxrlLvV1qPvxMVaqn6NTY
 jLsoYdT2bKOkiV9WoVh59jVZqKq4wrFkDETbMhhgUzhDOsybYB+jC7nCpDBsDcC7sgXN7N
 vZ+E11lPcI1Z9XyMPJ6JpmM3MUKyWNs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-176-g5IWk4NQOAK7b87urW2VgQ-1; Fri,
 22 Mar 2024 18:15:27 -0400
X-MC-Unique: g5IWk4NQOAK7b87urW2VgQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD0CD3C02454;
 Fri, 22 Mar 2024 22:15:26 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.8.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28DA81074E;
 Fri, 22 Mar 2024 22:15:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>,
 linux-kernel@vger.kernel.org (open list),
 rust-for-linux@vger.kernel.org (open list:RUST)
Subject: [PATCH 3/4] rust/drm/kms: Extract PlaneState<T> into IntoPlaneState
Date: Fri, 22 Mar 2024 18:03:35 -0400
Message-ID: <20240322221305.1403600-4-lyude@redhat.com>
In-Reply-To: <20240322221305.1403600-1-lyude@redhat.com>
References: <20240322221305.1403600-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

DRM actually has a number of helpers that wrap drm_plane_state, one of
which is actually needed by VKMS - drm_shadow_plane_state.

So, let's start preparing to write bindings for this by first extracting
PlaneState<T> into the IntoPlaneState trait - which all DRM structs which
wrap drm_plane_state will implement. This is basically the same idea as the
GEM ops - but for plane states.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/rvkms/plane.rs |   2 +-
 rust/kernel/drm/kms/plane.rs   | 165 ++++++++++++++++++++-------------
 2 files changed, 103 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/rvkms/plane.rs b/drivers/gpu/drm/rvkms/plane.rs
index 54c4bbda64d8e..d98a1f7bf79e2 100644
--- a/drivers/gpu/drm/rvkms/plane.rs
+++ b/drivers/gpu/drm/rvkms/plane.rs
@@ -20,7 +20,7 @@ pub(crate) struct DriverPlane {
 impl plane::DriverPlane for DriverPlane {
     type Initializer = impl PinInit<Self, Error>;
 
-    type State = RvkmsPlaneState;
+    type State = PlaneState;
 
     type Driver = RvkmsDriver;
 
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 78c8e370b997c..73c285445be63 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -13,6 +13,7 @@
     sync::{Arc, ArcBorrow},
     init::InPlaceInit,
     offset_of,
+    private::Sealed,
 };
 use core::{
     cell::UnsafeCell,
@@ -62,14 +63,16 @@ pub trait DriverPlane: Send + Sync + Sized {
     /// The parent driver implementation
     type Driver: KmsDriver;
 
-    /// The type for this driver's drm_plane_state implementation
-    type State: DriverPlaneState;
+    /// The full type for this driver's drm_plane_state implementation. Drivers which don't need
+    /// special DRM helpers for their plane states may just use `PlaneState<T>` here, where `T` is
+    /// their private state struct which implements `DriverPlaneState`
+    type State: IntoPlaneState;
 
     /// Create a new plane for this driver
     fn new(device: &Device<Self::Driver>, args: Self::Args) -> Self::Initializer;
 }
 
-impl<T: DriverPlane> crate::private::Sealed for Plane<T> {}
+impl<T: DriverPlane> Sealed for Plane<T> {}
 
 impl<T: DriverPlane> ModeObject for Plane<T> {
     type Driver = T::Driver;
@@ -177,6 +180,70 @@ pub(super) fn raw_mut_ptr(&self) -> *mut bindings::drm_plane {
     unsafe { drop(Box::from_raw(plane as *mut Plane<T>)) };
 }
 
+/// Operations implemented by any base atomic plane state. These are implemented by DRM to provide
+/// wrappers around the generic atomic plane state, along with various plane state helpers.
+///
+/// SAFETY: Incorrect implementation of these methods will result in UB, users should take care to
+/// read through the documentation of each method - especially the provided methods.
+pub unsafe trait IntoPlaneState: Default + Sealed {
+    /// Consume the box for this plane state without dropping its contents, and return a reference
+    /// to it's base plane state to hand off to DRM
+    ///
+    /// Implementors must override this if their data layout does not start with
+    /// `bindings::drm_plane_state`.
+    fn into_raw(self: Box<Self>) -> *mut bindings::drm_plane_state {
+        // Our data layout starts with drm_plane_state
+        Box::into_raw(self).cast()
+    }
+
+    /// Reconstruct the box for this plate state for deallocation
+    ///
+    /// Implementors must override this if their data layout does not start with
+    /// `bindings::drm_plane_state`.
+    unsafe fn from_raw(ptr: *mut bindings::drm_plane_state) -> Box<Self> {
+        // SAFETY: Users of this default promise their data layout starts with drm_plane_state
+        unsafe { Box::from_raw(ptr.cast()) }
+    }
+
+    /// Get a mutable reference to the raw `bindings::drm_plane_state` contained within this type
+    /// that we can pass to DRM
+    fn as_raw_mut(&mut self) -> &mut bindings::drm_plane_state {
+        // SAFETY: Users of this default promise their data layout starts with drm_plane_state
+        unsafe { mem::transmute(self) }
+    }
+
+    /// Get an immutable reference to this type from the given raw `bindings::drm_plane_state`
+    /// pointer
+    ///
+    /// Implementors must override this if their data layout does not start with
+    /// `bindings::drm_plane_state`.
+    ///
+    /// SAFETY: The caller guarantees `ptr` is contained within a valid instance of `Self`
+    unsafe fn ref_from_raw<'a>(ptr: *const bindings::drm_plane_state) -> &'a Self {
+        // SAFETY: Users of this default promise their data layout starts with drm_plane_state
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get a mutable reference to this type from the given raw `bindings::drm_plane_state` pointer
+    ///
+    /// SAFETY: The caller guarantees `ptr` is contained within a valid instance of `Self`
+    unsafe fn ref_from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) -> &'a mut Self {
+        // SAFETY: Users of this default promise their data layout starts with drm_plane_state
+        unsafe { &mut (*ptr.cast()) }
+    }
+
+    // Allocate a "duplicated" copy of this state, which usually involves calling DRM's helper
+    // function for this plane state type
+    fn __duplicate_state(&self, plane: *mut bindings::drm_plane) -> Result<Box<Self>>;
+
+    // Call DRM's destroy helper for this type of plane state. Note this only cleans up the base DRM
+    // state struct and does not de-allocate its `Box`.
+    fn __destroy_state(state: *mut bindings::drm_plane_state);
+
+    // Call DRM's reset helper for this type of plane state.
+    fn __reset_state(plane: *mut bindings::drm_plane, state: *mut bindings::drm_plane_state);
+}
+
 #[derive(Default)]
 #[repr(C)]
 pub struct PlaneState<T: DriverPlaneState> {
@@ -190,46 +257,35 @@ pub trait DriverPlaneState: Clone + Default + Sized {
     type Plane: DriverPlane;
 }
 
-impl<T: DriverPlaneState> PlaneState<T> {
-    /// Consume this struct without dropping it, and return a pointer to its base `drm_plane_state`
-    /// which can be handed off to DRM.
-    fn into_raw(self: Box<Self>) -> *mut bindings::drm_plane_state {
-        let this = Box::into_raw(self);
+impl<T: DriverPlaneState> Sealed for PlaneState<T> {}
 
-        unsafe { &mut (*this).state }
-    }
+// SAFETY: Our data layout starts with drm_plane_state
+unsafe impl<T: DriverPlaneState> IntoPlaneState for PlaneState<T> {
+    fn __duplicate_state(&self, plane: *mut bindings::drm_plane) -> Result<Box<Self>> {
+        let mut new: Box<Self> = Box::try_init(try_init!(Self {
+            state: bindings::drm_plane_state { ..Default::default() },
+            inner: self.inner.clone()
+        }))?;
 
-    /// Consume a raw pointer and recover the original `Box<PlaneState<T>>`
-    ///
-    /// SAFETY: Callers must ensure that ptr contains a valid instance of `PlaneState<T>`
-    unsafe fn from_raw(ptr: *mut bindings::drm_plane_state) -> Box<Self> {
-        unsafe { Box::from_raw(ptr as *mut _) }
-    }
+        // SAFETY: FFI call with no special requirements
+        unsafe { bindings::__drm_atomic_helper_plane_duplicate_state(plane, new.as_raw_mut()) };
 
-    /// Obtain a reference back to the `PlaneState<T>`
-    ///
-    /// SAFETY: Callers must ensure that ptr contains a valid instance of `PlaneState<T>`.
-    unsafe fn as_ref<'a>(ptr: *const bindings::drm_plane_state) -> &'a Self {
-        unsafe { &*(ptr as *const _) }
+        Ok(new)
     }
 
-    /// Obtain a mutable reference back to the PlaneState<T>
-    ///
-    /// SAFETY: Callers must ensure that ptr contains a valid instance of `PlaneState<T>`, and that
-    /// no other references to this `PlaneState<T>` exist for the lifetime of this reference
-    unsafe fn as_mut_ref<'a>(ptr: *mut bindings::drm_plane_state) -> &'a mut Self {
-        unsafe { &mut *(ptr as *mut _) }
+    fn __destroy_state(state: *mut bindings::drm_plane_state) {
+        // SAFETY: This would not be called without a plane state to destroy
+        unsafe { bindings::__drm_atomic_helper_plane_destroy_state(state) };
     }
 
-    /// Obtain a mutable pointer to the base plane state, for use in FFI calls
-    unsafe fn as_mut_ptr(&mut self) -> *mut bindings::drm_plane_state {
-        &mut self.state
+    fn __reset_state(plane: *mut bindings::drm_plane, state: *mut bindings::drm_plane_state) {
+        unsafe { bindings::__drm_atomic_helper_plane_reset(plane, state) }
     }
 }
 
 unsafe impl Zeroable for bindings::drm_plane_state { }
 
-unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverPlaneState>(
+unsafe extern "C" fn atomic_duplicate_state_callback<T: IntoPlaneState>(
     plane: *mut bindings::drm_plane
 ) -> *mut bindings::drm_plane_state
 {
@@ -240,55 +296,38 @@ unsafe impl Zeroable for bindings::drm_plane_state { }
         return null_mut();
     }
 
-    // SAFETY: We just verified that `state` is non-null, and we're guaranteed by our bindings that
-    // `state` is of type `PlaneState<T>`.
-    let state = unsafe { PlaneState::<T>::as_ref(state) };
-
-    let mut new: Result<Box<PlaneState<T>>> = Box::try_init(try_init!(PlaneState::<T> {
-        state: bindings::drm_plane_state { ..Default::default() },
-        inner: state.inner.clone()
-    }));
-
-    if let Ok(mut new) = new {
-        // SAFETY: Just a lil' FFI call, nothing special here
-        unsafe { bindings::__drm_atomic_helper_plane_duplicate_state(plane, new.as_mut_ptr()) };
-
-        new.into_raw()
-    } else {
-        null_mut()
-    }
+    // SAFETY: We just checked that the state is non-null, and we're guaranteed this operation is
+    // safe via type invariance
+    unsafe { T::ref_from_raw(state) }.__duplicate_state(plane).map_or(null_mut(), T::into_raw)
 }
 
-unsafe extern "C" fn atomic_destroy_state_callback<T: DriverPlaneState>(
+unsafe extern "C" fn atomic_destroy_state_callback<T: IntoPlaneState>(
     _plane: *mut bindings::drm_plane,
-    plane_state: *mut bindings::drm_plane_state
+    state: *mut bindings::drm_plane_state
 ) {
-    // SAFETY: This callback wouldn't be called unless there a plane state to destroy
-    unsafe { bindings::__drm_atomic_helper_plane_destroy_state(plane_state) };
+    T::__destroy_state(state);
 
-    // SAFETY: We're guaranteed by type invariants that plane_state is of type PlaneState<T>, and
-    // since this is the destructor callback for DRM - we're guaranteed to hold the only remaining
-    // reference to this state
-    unsafe { drop(PlaneState::<T>::from_raw(plane_state)) };
+    // SAFETY: We're guaranteed by type invariance that state of type T, and __destroy_state() does
+    // not perform any deallocations
+    drop(unsafe { T::from_raw(state) });
 }
 
-unsafe extern "C" fn plane_reset_callback<T: DriverPlaneState>(
+unsafe extern "C" fn plane_reset_callback<T: IntoPlaneState>(
     plane: *mut bindings::drm_plane,
 ) {
-    // SAFETY: The only entrypoint to this function lives in `plane` so it must be valid, and
+    // SAFETY: The only entrypoint to this function lives in `plane` so it must be valid
     let state = unsafe { (*plane).state };
     if !state.is_null() {
-        // SAFETY: We're guaranteed by type invariance that this plane's state is of type
-        // DriverPlaneState<T>
+        // SAFETY: We're guaranteed by type invariance that this planes state is of type T
         unsafe { atomic_destroy_state_callback::<T>(plane, state) }
     }
 
     // Unfortunately, this is the best we can do at the moment as this FFI callback was mistakenly
     // presumed to be infallible :(
-    let new = Box::try_new(PlaneState::<T>::default()).expect("Blame the API, sorry!");
+    let new = Box::try_new(T::default()).expect("Blame the API, sorry!");
 
-    // SAFETY: DRM takes ownership of the state from here and assigns it to the plane
-    unsafe { bindings::__drm_atomic_helper_plane_reset(plane, new.into_raw()) };
+    // DRM takes ownership of the state from here, resets it, and then assigns it to the plane
+    T::__reset_state(plane, new.into_raw());
 }
 
 #[derive(Copy, Clone, Debug, PartialEq, Eq)]
-- 
2.43.0

