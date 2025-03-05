Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377B7A53E09
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2985A10E853;
	Wed,  5 Mar 2025 23:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AAXJuDb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EF010E84F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FiII/UFZj0PJa3aqHS4adfK6RLGvexStwXEtTIs9AeA=;
 b=AAXJuDb0xn5cnkZ9lXlvrNX3xW839UpDifTcL/9ZHzrPtZF1WrOQ7SAHuaKlnY7zfecCen
 UDuhn1B/NC91bWMGjBshHIOoHZia1Am488Q4901SSsX5fwUUvU8iTV83flO26KBCuWeWFp
 Bx+j5viIl8/irDFP+dgxWEiD7tBSLHs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-354-Xad8I59GMX2nR9Rn7DYrPA-1; Wed,
 05 Mar 2025 18:06:46 -0500
X-MC-Unique: Xad8I59GMX2nR9Rn7DYrPA-1
X-Mimecast-MFC-AGG-ID: Xad8I59GMX2nR9Rn7DYrPA_1741216004
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F0DCA1800361; Wed,  5 Mar 2025 23:06:43 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ECAF5300019E; Wed,  5 Mar 2025 23:06:39 +0000 (UTC)
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
Subject: [RFC v3 15/33] rust: drm/kms: Add OpaqueCrtc and OpaqueCrtcState
Date: Wed,  5 Mar 2025 17:59:31 -0500
Message-ID: <20250305230406.567126-16-lyude@redhat.com>
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

This is the same thing as OpaqueConnector and OpaqueConnectorState, but for
CRTCs now.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Add safety comment for implementation of ModeObject
* Add safety comments to AsRawCrtc implementation
* Implement try_from_opaque() and from_opaque() using a macro

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/crtc.rs | 167 +++++++++++++++++++++++++++++++++++-
 1 file changed, 166 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 9950b09754072..bcdd452ff7b10 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -4,7 +4,9 @@
 //!
 //! C header: [`include/drm/drm_crtc.h`](srctree/include/drm/drm_crtc.h)
 
-use super::{plane::*, KmsDriver, ModeObject, StaticModeObject, UnregisteredKmsDevice};
+use super::{
+    plane::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject, UnregisteredKmsDevice,
+};
 use crate::{
     alloc::KBox,
     bindings,
@@ -185,6 +187,25 @@ fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
 // SAFETY: CRTCs are non-refcounted modesetting objects
 unsafe impl<T: DriverCrtc> StaticModeObject for Crtc<T> {}
 
+// SAFETY: `funcs` is initialized when the crtc is allocated
+unsafe impl<T: DriverCrtc> ModeObjectVtable for Crtc<T> {
+    type Vtable = bindings::drm_crtc_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        // SAFETY: `as_raw()` always returns a valid pointer to a CRTC
+        unsafe { *self.as_raw() }.funcs
+    }
+}
+
+impl<T: DriverCrtc> Crtc<T> {
+    super::impl_from_opaque_mode_obj! {
+        fn <'a, D>(&'a OpaqueCrtc<D>) -> &'a Self;
+        use
+            T as DriverCrtc,
+            D as KmsDriver
+    }
+}
+
 /// A [`Crtc`] that has not yet been registered with userspace.
 ///
 /// KMS registration is single-threaded, so this object is not thread-safe.
@@ -361,6 +382,86 @@ fn mask(&self) -> u32 {
 }
 impl<T: AsRawCrtc> RawCrtc for T {}
 
+/// A [`struct drm_crtc`] without a known [`DriverCrtc`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverCrtc`] implementation
+/// for a [`struct drm_crtc`] automatically. It is identical to [`Crtc`], except that it does not
+/// provide access to the driver's private data.
+///
+/// It may be upcasted to a full [`Crtc`] using [`Crtc::from_opaque`] or
+/// [`Crtc::try_from_opaque`].
+///
+/// # Invariants
+///
+/// - `crtc` is initialized for as long as this object is made available to users.
+/// - The data layout of this structure is equivalent to [`struct drm_crtc`].
+///
+/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
+#[repr(transparent)]
+pub struct OpaqueCrtc<T: KmsDriver> {
+    crtc: Opaque<bindings::drm_crtc>,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> Sealed for OpaqueCrtc<T> {}
+
+// SAFETY:
+// - Via our type variants our data layout is identical to `drm_crtc`
+// - Since we don't expose `OpaqueCrtc` to users before it has been initialized, this and our data
+//   layout ensure that `as_raw()` always returns a valid pointer to a `drm_crtc`.
+unsafe impl<T: KmsDriver> AsRawCrtc for OpaqueCrtc<T> {
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
+// SAFETY: We only expose this object to users directly after KmsDriver::create_objects has been
+// called.
+unsafe impl<T: KmsDriver> ModesettableCrtc for OpaqueCrtc<T> {
+    type State = OpaqueCrtcState<T>;
+}
+
+// SAFETY: We don't expose OpaqueCrtc<T> to users before `base` is initialized in Crtc::<T>::new(),
+// so `raw_mode_obj` always returns a valid pointer to a bindings::drm_mode_object.
+unsafe impl<T: KmsDriver> ModeObject for OpaqueCrtc<T> {
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
+        unsafe { addr_of_mut!((*self.as_raw()).base) }
+    }
+}
+
+// SAFETY: CRTCs are non-refcounted modesetting objects
+unsafe impl<T: KmsDriver> StaticModeObject for OpaqueCrtc<T> {}
+
+// SAFETY: Our CRTC interface is guaranteed to be thread-safe
+unsafe impl<T: KmsDriver> Send for OpaqueCrtc<T> {}
+
+// SAFETY: Our CRTC interface is guaranteed to be thread-safe
+unsafe impl<T: KmsDriver> Sync for OpaqueCrtc<T> {}
+
+// SAFETY: `funcs` is initialized when the CRTC is allocated
+unsafe impl<T: KmsDriver> ModeObjectVtable for OpaqueCrtc<T> {
+    type Vtable = bindings::drm_crtc_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        // SAFETY: `as_raw()` always returns a valid pointer to a crtc
+        unsafe { (*self.as_raw()).funcs }
+    }
+}
+
 unsafe impl Zeroable for bindings::drm_crtc_state {}
 
 impl<T: DriverCrtcState> Sealed for CrtcState<T> {}
@@ -429,6 +530,26 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+// SAFETY: Shares the safety guarantee of Crtc<T>'s ModeObjectVtable impl
+unsafe impl<T: DriverCrtcState> ModeObjectVtable for CrtcState<T> {
+    type Vtable = bindings::drm_crtc_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        self.crtc().vtable()
+    }
+}
+
+impl<T: DriverCrtcState> CrtcState<T> {
+    super::impl_from_opaque_mode_obj! {
+        fn <'a, D, C>(&'a OpaqueCrtcState<D>) -> &'a Self
+        where
+            T: DriverCrtcState<Crtc = C>;
+        use
+            C as DriverCrtc,
+            D as KmsDriver
+    }
+}
+
 /// A trait implemented by any type which can produce a reference to a [`struct drm_crtc_state`].
 ///
 /// This is implemented internally by DRM.
@@ -502,6 +623,50 @@ unsafe fn from_raw<'a>(ptr: *const bindings::drm_crtc_state) -> &'a Self {
     }
 }
 
+/// A [`struct drm_crtc_state`] without a known [`DriverCrtcState`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverCrtcState`]
+/// implementation for a [`struct drm_crtc_state`] automatically. It is identical to [`Crtc`],
+/// except that it does not provide access to the driver's private data.
+///
+/// # Invariants
+///
+/// - `state` is initialized for as long as this object is exposed to users.
+/// - The data layout of this type is identical to [`struct drm_crtc_state`].
+///
+/// [`struct drm_crtc_state`]: srctree/include/drm/drm_crtc.h
+#[repr(transparent)]
+pub struct OpaqueCrtcState<T: KmsDriver> {
+    state: Opaque<bindings::drm_crtc_state>,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> AsRawCrtcState for OpaqueCrtcState<T> {
+    type Crtc = OpaqueCrtc<T>;
+}
+
+impl<T: KmsDriver> private::AsRawCrtcState for OpaqueCrtcState<T> {
+    fn as_raw(&self) -> *mut bindings::drm_crtc_state {
+        self.state.get()
+    }
+}
+
+impl<T: KmsDriver> FromRawCrtcState for OpaqueCrtcState<T> {
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_crtc_state) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_crtc_state`
+        unsafe { &*(ptr.cast()) }
+    }
+}
+
+// SAFETY: Shares the safety guarantees of OpaqueCrtc<T>'s ModeObjectVtable impl
+unsafe impl<T: KmsDriver> ModeObjectVtable for OpaqueCrtcState<T> {
+    type Vtable = bindings::drm_crtc_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        self.crtc().vtable()
+    }
+}
+
 unsafe extern "C" fn crtc_destroy_callback<T: DriverCrtc>(crtc: *mut bindings::drm_crtc) {
     // SAFETY: DRM guarantees that `crtc` points to a valid initialized `drm_crtc`.
     unsafe { bindings::drm_crtc_cleanup(crtc) };
-- 
2.48.1

