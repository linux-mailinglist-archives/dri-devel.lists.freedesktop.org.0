Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE776A53E08
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA6110E852;
	Wed,  5 Mar 2025 23:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="REzJvCeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AD010E84F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t861S+lJA1FAHGRt4CQfszfhAAbg1AWVUqKzD27olGw=;
 b=REzJvCeDnH73Y7djDwQDTEGffATs6V1l2JMM2j0yBUATfmMOimWrHtloykEwNwCHiP5Jz2
 zwS0lpE9apTVaZ88NbzlFdWdN2RQDE2G2l5fC/TPVUMUvx/rJVPFdXwyRZQq0qiMAdLCU6
 j/q8jArwblCIuL9HWi5GTe/2IlKuPT8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-R_vdkGnWMOKYaG23ECL0KQ-1; Wed,
 05 Mar 2025 18:06:38 -0500
X-MC-Unique: R_vdkGnWMOKYaG23ECL0KQ-1
X-Mimecast-MFC-AGG-ID: R_vdkGnWMOKYaG23ECL0KQ_1741215996
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9D01319560AD; Wed,  5 Mar 2025 23:06:36 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DB9C8300019E; Wed,  5 Mar 2025 23:06:32 +0000 (UTC)
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
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 14/33] rust: drm/kms: Add OpaqueConnector and
 OpaqueConnectorState
Date: Wed,  5 Mar 2025 17:59:30 -0500
Message-ID: <20250305230406.567126-15-lyude@redhat.com>
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

Since we allow drivers to have multiple implementations of DriverConnector
and DriverConnectorState (in C, the equivalent of this is having multiple
structs which embed drm_connector) - there are some situations we will run
into where it's not possible for us to know the corresponding
DriverConnector or DriverConnectorState for a given connector. The most
obvious one is iterating through all connectors on a KMS device.

So, take advantage of the various connector traits we added to introduce
OpaqueConnector<> and OpaqueConnectorState<> which both can be used as a
DRM connector and connector state respectively without needing to know the
corresponding traits.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Add safety comment to implementation of ModeObject
* Add safety comments to AsRawConnector implementation
* Implement try_from_opaque() and from_opaque() using a macro
* Ensure all Opaque types have the ability to "upcast"

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms.rs           | 115 +++++++++++++++++++++
 rust/kernel/drm/kms/connector.rs | 171 ++++++++++++++++++++++++++++++-
 2 files changed, 285 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 7935e935f9975..1d6ca9c92659a 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -61,6 +61,104 @@ unsafe fn setup_kms(_drm: &Device<Self::Driver>) -> Result<ModeConfigInfo> {
     }
 }
 
+/// Implement the repetitive from_opaque/try_from_opaque methods for all mode object and state
+/// types.
+///
+/// Because there are so many different ways of accessing mode objects, their states, etc. we need a
+/// macro that we can use for consistently implementing try_from_opaque()/from_opaque() functions to
+/// convert from Opaque mode objects to fully typed mode objects. This macro handles that, and can
+/// generate said functions for any kind of type which the original mode object driver trait can be
+/// derived from. All conversions check the mode object's vtable. For example:
+///
+/// ```compile_fail
+/// impl<'a, T: DriverConnectorState> ConnectorState<T> {
+///     impl_from_opaque_mode_obj! {
+///         // | An optional lifetime and meta-variables to declare for each function
+///         // |          | The type of the input parameter `opaque`
+///         // |          |                               | The converted type
+///         // v          v                               v
+///         fn <'a, D, C>(&'a OpaqueConnectorState<T>) -> &'a Self
+///         where // <-- An optional set of additional trait bounds to match against
+///             T: DriverConnectorState<Connector = C>;
+///         use
+///         //  | Meta-variable that will contain ::OPS (the auto-generated vtable)
+///         //  |    | The driver trait implemented by the driver for generating the vtable
+///         //  |    | It will add the bound C: DriverConnector<Driver = D> to the function
+///         //  v    v
+///             C as DriverConnector,
+///         //  | Meta-variable to assign to KmsDriver
+///         //  |    | This must always be KmsDriver, it's just here for clarity
+///         //  v    v
+///             D as KmsDriver,
+///     }
+/// }
+/// ```
+macro_rules! impl_from_opaque_mode_obj {
+    (
+        fn <
+            $( $lifetime:lifetime, )?
+            $( $decl_bound_id:ident ),*
+        > ($opaque:ty) -> $inner_ret_ty:ty
+        $(
+            where
+                $( $extra_bound_id:ident : $extra_trait:ident<$( $extra_assoc:ident = $extra_meta_match:ident ),+> ),+
+        )? ;
+        use
+            $obj_trait_meta:ident as $obj_trait:ident,
+            $drv_trait_meta:ident as KmsDriver
+    ) => {
+        #[doc = "Try to convert `opaque` into a fully qualified `Self`."]
+        #[doc = ""]
+        #[doc = concat!("This will try to convert `opaque` into `Self` if it shares the same [`",
+                        stringify!($obj_trait), "`] implementation as `Self`.")]
+        pub fn try_from_opaque<$( $lifetime, )? $( $decl_bound_id ),* >(
+            opaque: $opaque
+        ) -> Result<$inner_ret_ty, $opaque>
+        where
+            $drv_trait_meta: KmsDriver,
+            $obj_trait_meta: $obj_trait<Driver = $drv_trait_meta>
+            $( , $( $extra_bound_id: $extra_trait<$( $extra_assoc = $extra_meta_match ),+> ),+ )?
+        {
+            let funcs = opaque.vtable();
+            let obj_funcs = &$obj_trait_meta::OPS.funcs;
+
+            if core::ptr::eq(funcs, obj_funcs) {
+                // SAFETY: We only perform this transmutation if the opaque object shares our vtable
+                // pointers, so the underlying full object must share our data layout.
+                Ok(unsafe { core::mem::transmute(opaque) })
+            } else {
+                Err(opaque)
+            }
+        }
+
+        #[doc = "Convert `opaque` into a fully qualified `Self`."]
+        #[doc = ""]
+        #[doc = concat!("This is an infallible version of [`Self::try_from_opaque`]. This ",
+                        "function is mainly useful for drivers where only a single [`",
+                        stringify!($obj_trait), "`] implementation exists.")]
+        #[doc = ""]
+        #[doc = "# Panics"]
+        #[doc = ""]
+        #[doc = concat!("This function will panic if `opaque` belongs to a different [`",
+                        stringify!($obj_trait), "`] implementation.")]
+        pub fn from_opaque<$( $lifetime, )? $( $decl_bound_id ),* >(
+            opaque: $opaque
+        ) -> $inner_ret_ty
+        where
+            $drv_trait_meta: KmsDriver,
+            $obj_trait_meta: $obj_trait<Driver = $drv_trait_meta>
+            $( , $( $extra_bound_id: $extra_trait<$( $extra_assoc = $extra_meta_match ),+> ),+ )?
+        {
+            Self::try_from_opaque(opaque)
+                .map_or(None, |o| Some(o))
+                .expect(concat!("Passed ", stringify!($opaque), " does not share this ",
+                                stringify!($obj_trait), " implementation."))
+        }
+    };
+}
+
+pub(crate) use impl_from_opaque_mode_obj;
+
 /// A [`Device`] with KMS initialized that has not been registered with userspace.
 ///
 /// This type is identical to [`Device`], except that it is able to create new static KMS resources.
@@ -337,6 +435,23 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
+/// A trait for any object related to a [`ModeObject`] that can return its vtable.
+///
+/// This reference will used for checking whether an opaque representation of a mode object uses a
+/// specific driver trait implementation.
+///
+/// # Safety
+///
+/// `ModeObjectVtable::vtable()` must always return a valid pointer to the relevant mode object's
+/// vtable.
+pub(crate) unsafe trait ModeObjectVtable {
+    /// The type for the auto-generated vtable.
+    type Vtable;
+
+    /// Return a static reference to the auto-generated vtable for the relevant mode object.
+    fn vtable(&self) -> *const Self::Vtable;
+}
+
 /// A mode config guard.
 ///
 /// This is an exclusive primitive that represents when [`drm_device.mode_config.mutex`] is held - as
diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 0cfe346b4760e..4521643d19749 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/drm/drm_connector.h`](srctree/include/drm/drm_connector.h)
 
-use super::{encoder::*, KmsDriver, ModeConfigGuard, ModeObject, RcModeObject};
+use super::{encoder::*, KmsDriver, ModeConfigGuard, ModeObject, ModeObjectVtable, RcModeObject};
 use crate::{
     alloc::KBox,
     bindings,
@@ -203,6 +203,13 @@ fn deref(&self) -> &Self::Target {
 }
 
 impl<T: DriverConnector> Connector<T> {
+    super::impl_from_opaque_mode_obj! {
+        fn <'a, D>(&'a OpaqueConnector<D>) -> &'a Self;
+        use
+            T as DriverConnector,
+            D as KmsDriver
+    }
+
     /// Acquire a [`ConnectorGuard`] for this connector from a [`ModeConfigGuard`].
     ///
     /// This verifies using the provided reference that the given guard is actually for the same
@@ -286,6 +293,16 @@ fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
 // SAFETY: DRM connectors are refcounted mode objects
 unsafe impl<T: DriverConnector> RcModeObject for Connector<T> {}
 
+// SAFETY: `funcs` is initialized by DRM when the connector is allocated
+unsafe impl<T: DriverConnector> ModeObjectVtable for Connector<T> {
+    type Vtable = bindings::drm_connector_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        // SAFETY: `funcs` is initialized by DRM when the connector is allocated
+        unsafe { *self.as_raw() }.funcs
+    }
+}
+
 // SAFETY:
 // * Via our type variants our data layout starts with `drm_connector`
 // * Since we don't expose `Connector` to users before it has been initialized, this and our data
@@ -448,6 +465,81 @@ impl<T: AsRawConnector> RawConnector for T {}
     T::get_modes(connector.guard(&guard), &guard)
 }
 
+/// A [`struct drm_connector`] without a known [`DriverConnector`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverConnector`]
+/// implementation for a [`struct drm_connector`] automatically. It is identical to [`Connector`],
+/// except that it does not provide access to the driver's private data.
+///
+/// # Invariants
+///
+/// - `connector` is initialized for as long as this object is exposed to users.
+/// - The data layout of this type is equivalent to [`struct drm_connector`].
+///
+/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
+#[repr(transparent)]
+pub struct OpaqueConnector<T: KmsDriver> {
+    connector: Opaque<bindings::drm_connector>,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> Sealed for OpaqueConnector<T> {}
+
+// SAFETY:
+// - Via our type variants our data layout starts is identical to `drm_connector`
+// - Since we don't expose `OpaqueConnector` to users before it has been initialized, this and our
+//   data layout ensure that `as_raw()` always returns a valid pointer to a `drm_connector`.
+unsafe impl<T: KmsDriver> AsRawConnector for OpaqueConnector<T> {
+    fn as_raw(&self) -> *mut bindings::drm_connector {
+        self.connector.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_connector`
+        unsafe { &*ptr.cast() }
+    }
+}
+
+// SAFETY: We only expose this object to users directly after KmsDriver::create_objects has been
+// called.
+unsafe impl<T: KmsDriver> ModesettableConnector for OpaqueConnector<T> {
+    type State = OpaqueConnectorState<T>;
+}
+
+// SAFETY: We don't expose OpaqueConnector<T> to users before `base` is initialized in
+// Connector::new(), so `raw_mode_obj` always returns a valid pointer to a bindings::drm_mode_object.
+unsafe impl<T: KmsDriver> ModeObject for OpaqueConnector<T> {
+    type Driver = T;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: The parent device for a DRM connector will never outlive the connector, and this
+        // pointer is invariant through the lifetime of the connector
+        unsafe { Device::borrow((*self.as_raw()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose DRM connectors to users before `base` is initialized
+        unsafe { &mut (*self.as_raw()).base }
+    }
+}
+
+// SAFETY: Connectors are reference counted mode objects
+unsafe impl<T: KmsDriver> RcModeObject for OpaqueConnector<T> {}
+
+// SAFETY: `funcs` is initialized by DRM when the connector is allocated
+unsafe impl<T: KmsDriver> ModeObjectVtable for OpaqueConnector<T> {
+    type Vtable = bindings::drm_connector_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        // SAFETY: `funcs` is initialized by DRM when the connector is allocated
+        unsafe { *self.as_raw() }.funcs
+    }
+}
+
+// SAFETY: Our connector interfaces are guaranteed to be thread-safe
+unsafe impl<T: KmsDriver> Send for OpaqueConnector<T> {}
+unsafe impl<T: KmsDriver> Sync for OpaqueConnector<T> {}
+
 /// A privileged [`Connector`] obtained while holding a [`ModeConfigGuard`].
 ///
 /// This provides access to various methods for [`Connector`] that must happen under lock, such as
@@ -655,6 +747,83 @@ unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut S
     }
 }
 
+// SAFETY: `funcs` is initialized by DRM when the connector is allocated
+unsafe impl<T: DriverConnectorState> ModeObjectVtable for ConnectorState<T> {
+    type Vtable = bindings::drm_connector_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        self.connector().vtable()
+    }
+}
+
+impl<T: DriverConnectorState> ConnectorState<T> {
+    super::impl_from_opaque_mode_obj! {
+        fn <'a, D, C>(&'a OpaqueConnectorState<D>) -> &'a Self
+        where
+            T: DriverConnectorState<Connector = C>;
+        use
+            C as DriverConnector,
+            D as KmsDriver
+    }
+}
+
+/// A [`struct drm_connector_state`] without a known [`DriverConnectorState`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverConnectorState`]
+/// implementation for a [`struct drm_connector_state`] automatically. It is identical to
+/// [`Connector`], except that it does not provide access to the driver's private data.
+///
+/// # Invariants
+///
+/// - `state` is initialized for as long as this object is exposed to users.
+/// - The data layout of this type is identical to [`struct drm_connector_state`].
+/// - The DRM C API and our interface guarantees that only the user has mutable access to `state`,
+///   up until [`drm_atomic_helper_commit_hw_done`] is called. Therefore, `connector` follows rust's
+///   data aliasing rules and does not need to be behind an [`Opaque`] type.
+///
+/// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
+/// [`drm_atomic_helper_commit_hw_done`]: srctree/include/drm/drm_atomic_helper.h
+#[repr(transparent)]
+pub struct OpaqueConnectorState<T: KmsDriver> {
+    state: bindings::drm_connector_state,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> AsRawConnectorState for OpaqueConnectorState<T> {
+    type Connector = OpaqueConnector<T>;
+}
+
+impl<T: KmsDriver> private::AsRawConnectorState for OpaqueConnectorState<T> {
+    fn as_raw(&self) -> &bindings::drm_connector_state {
+        &self.state
+    }
+
+    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_connector_state {
+        &mut self.state
+    }
+}
+
+impl<T: KmsDriver> FromRawConnectorState for OpaqueConnectorState<T> {
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_connector_state) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_connector_state`
+        unsafe { &*ptr.cast() }
+    }
+
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_connector_state`
+        unsafe { &mut *ptr.cast() }
+    }
+}
+
+// SAFETY: See OpaqueConnector's ModeObjectVtable implementation
+unsafe impl<T: KmsDriver> ModeObjectVtable for OpaqueConnectorState<T> {
+    type Vtable = bindings::drm_connector_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        self.connector().vtable()
+    }
+}
+
 unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverConnectorState>(
     connector: *mut bindings::drm_connector,
 ) -> *mut bindings::drm_connector_state {
-- 
2.48.1

