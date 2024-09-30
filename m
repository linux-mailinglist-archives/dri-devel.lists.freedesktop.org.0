Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD8798B0F4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3857710E59A;
	Mon, 30 Sep 2024 23:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cPgS2KWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704D810E59A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZR+Oy8+dZBZO6+3VRxhqxljsi2SG5GmfYhJRwKT9SBE=;
 b=cPgS2KWIpuYjMogBGaG2rLjIGYGv3Gt5DxluI1vU7B1e8CqVlkRKptgkz7b1zJo0LXXY+4
 AeMWusaZyor5FQv+Lg7KzbUkh53U3t/PG90Y8bVPByAbank5wU1Gfnhpv7bMCrprGb7+Eu
 DS/ld4vr1Bp3czRL9/Hb8EaQ3G1mG6A=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-rkaPSSVnPBibG5lQR8OeMA-1; Mon,
 30 Sep 2024 19:39:19 -0400
X-MC-Unique: rkaPSSVnPBibG5lQR8OeMA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BD146192DE39; Mon, 30 Sep 2024 23:39:16 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A94FB3003DEC; Mon, 30 Sep 2024 23:39:12 +0000 (UTC)
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
Subject: [WIP RFC v2 15/35] WIP: rust: drm/kms: Add OpaquePlane and
 OpaquePlaneState
Date: Mon, 30 Sep 2024 19:09:58 -0400
Message-ID: <20240930233257.1189730-16-lyude@redhat.com>
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

Same thing as OpaqueCrtc and OpaqueCrtcState, but for plane states now.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

TODO:
* Finish adding upcast functions.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/plane.rs | 143 +++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 3040c4546b121..3ace487316d46 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -217,6 +217,43 @@ pub fn new<'a, 'b: 'a, const FMT_COUNT: usize, const MOD_COUNT: usize>(
         // SAFETY: We don't move anything
         Ok(unsafe { &*Box::into_raw(Pin::into_inner_unchecked(this)) })
     }
+
+    /// Attempt to convert an [`OpaquePlane`] into a fully qualified [`Plane`].
+    ///
+    /// This checks if the given [`OpaquePlane`] uses the same [`DriverPlane`] implementation, and
+    /// returns the [`OpaquePlane`] as a [`Plane`] object if so.
+    pub fn try_from_opaque<'a, D>(opaque: &'a OpaquePlane<D>) -> Option<&'a Self>
+    where
+        D: KmsDriver,
+        T: DriverPlane<Driver = D>
+    {
+        // SAFETY: The vtables for a `Plane` are initialized by the time that we expose `Plane`
+        // objects to users, and their values are invariant throughout the lifetime of the device.
+        let funcs = unsafe { (*opaque.plane.get()).funcs };
+
+        // SAFETY: We just guaranteed that the opaque plane shares our vtable pointers, which means
+        // it must belong to our `DriverPlane` implementation. As well, all `Plane<DriverPlane>`
+        // objects start with an identical data layout to `OpaquePlane`
+        ptr::eq(funcs, &T::OPS.funcs).then(|| unsafe { mem::transmute(opaque) })
+    }
+
+    /// Convert a [`OpaquePlane`] into its fully qualified [`Plane`].
+    ///
+    /// This is an infallible version of [`Self::try_from_opaque`]. This function is mainly useful
+    /// for drivers where only a single [`DriverPlane`] implementation exists.
+    ///
+    /// # Panics
+    ///
+    /// This function will panic if the underlying [`Plane`] which contains the provided
+    /// [`OpaquePlane`] does not belong to the same [`DriverPlane`] implementation.
+    pub fn from_opaque<'a, D>(opaque: &'a OpaquePlane<D>) -> &'a Self
+    where
+        D: KmsDriver,
+        T: DriverPlane<Driver = D>
+    {
+        Self::try_from_opaque(opaque)
+            .expect("Passed OpaquePlane does not share this DriverPlane implementation")
+    }
 }
 
 /// A trait implemented by any type that acts as a [`struct drm_plane`] interface.
@@ -275,6 +312,63 @@ unsafe impl<T: DriverPlane> Send for Plane<T> {}
 // SAFETY: Our interface is thread-safe.
 unsafe impl<T: DriverPlane> Sync for Plane<T> {}
 
+/// A [`struct drm_plane`] without a known [`DriverPlane`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverPlane`] implementation
+/// for a [`struct drm_plane`] automatically. It is identical to [`Plane`], except that it does not
+/// provide access to the driver's private data.
+///
+/// It may be upcasted to a full [`Plane`] using [`Plane::from_opaque`] or
+/// [`Plane::try_from_opaque`].
+///
+/// # Invariants
+///
+/// - `plane` is initialized for as long as this object is made available to users.
+/// - The data layout of this structure is equivalent to [`struct drm_plane`].
+///
+/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
+#[repr(transparent)]
+pub struct OpaquePlane<T: KmsDriver> {
+    plane: Opaque<bindings::drm_plane>,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> Sealed for OpaquePlane<T> {}
+
+impl<T: KmsDriver> AsRawPlane for OpaquePlane<T> {
+    type State = OpaquePlaneState<T>;
+
+    fn as_raw(&self) -> *mut bindings::drm_plane {
+        self.plane.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_plane) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_plane`
+        unsafe { &*ptr.cast() }
+    }
+}
+
+impl<T: KmsDriver> ModeObject for OpaquePlane<T> {
+    type Driver = T;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: DRM planes exist for as long as the device does, so this pointer is always valid
+        unsafe { Device::borrow((*self.as_raw()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose DRM planes to users before `base` is initialized
+        unsafe { &mut ((*self.as_raw()).base) }
+    }
+}
+
+// SAFETY: Planes do not have a refcount
+unsafe impl<T: KmsDriver> StaticModeObject for OpaquePlane<T> {}
+
+// SAFETY: Our plane interfaces are guaranteed to be thread-safe
+unsafe impl<T: KmsDriver> Send for OpaquePlane<T> {}
+unsafe impl<T: KmsDriver> Sync for OpaquePlane<T> {}
+
 /// A trait implemented by any type which can produce a reference to a [`struct drm_plane_state`].
 ///
 /// This is implemented internally by DRM.
@@ -419,6 +513,55 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+/// A [`struct drm_plane_state`] without a known [`DriverPlaneState`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverPlaneState`]
+/// implementation for a [`struct drm_plane_state`] automatically. It is identical to [`Plane`],
+/// except that it does not provide access to the driver's private data.
+///
+/// TODO: Add upcast functions
+///
+/// # Invariants
+///
+/// - The DRM C API and our interface guarantees that only the user has mutable access to `state`,
+///   up until [`drm_atomic_helper_commit_hw_done`] is called. Therefore, `plane` follows rust's
+///   data aliasing rules and does not need to be behind an [`Opaque`] type.
+/// - `state` is initialized for as long as this object is exposed to users.
+/// - The data layout of this structure is identical to [`struct drm_plane_state`].
+///
+/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
+/// [`drm_atomic_helper_commit_hw_done`]: srctree/include/drm/drm_atomic_helper.h
+#[repr(transparent)]
+pub struct OpaquePlaneState<T: KmsDriver> {
+    state: bindings::drm_plane_state,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> AsRawPlaneState for OpaquePlaneState<T> {
+    type Plane = OpaquePlane<T>;
+}
+
+impl<T: KmsDriver> private::AsRawPlaneState for OpaquePlaneState<T> {
+    fn as_raw(&self) -> &bindings::drm_plane_state {
+        &self.state
+    }
+
+    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_plane_state {
+        &mut self.state
+    }
+}
+
+impl<T: KmsDriver> FromRawPlaneState for OpaquePlaneState<T> {
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_plane_state) -> &'a Self {
+        // SAFETY: Our data layout is identical to `ptr`
+        unsafe { &*ptr.cast() }
+    }
+
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) -> &'a mut Self {
+        // SAFETY: Our data layout is identical to `ptr`
+        unsafe { &mut *ptr.cast() }
+    }
+}
 unsafe extern "C" fn plane_destroy_callback<T: DriverPlane>(
     plane: *mut bindings::drm_plane
 ) {
-- 
2.46.1

