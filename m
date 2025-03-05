Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E47A53E0B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509E610E84F;
	Wed,  5 Mar 2025 23:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iGSgPfUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E7410E84F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGhdforG/hfsTGcf1d8lWIscR/N9faUXID3wN0fe8hE=;
 b=iGSgPfUPg3VXLesHXUxyj85lVsp/ED/Ll+pzlw+k25uzpVhc4Qlxw9cqWwkvAvIYKOi9Rv
 5GWXhDHHu02nPL9i6rmlNTzzZX2zaXUeJ4bXBI3vxU8RCoiZygqJIuiMje4WA0LVAbGT0x
 Ke9HIka80GKsHXOfQxTIHsz+qXlE0FE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-391-7XKPghc_PD-C1h_03dlyvw-1; Wed,
 05 Mar 2025 18:06:58 -0500
X-MC-Unique: 7XKPghc_PD-C1h_03dlyvw-1
X-Mimecast-MFC-AGG-ID: 7XKPghc_PD-C1h_03dlyvw_1741216016
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6ED5F180025A; Wed,  5 Mar 2025 23:06:56 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 57C33300019E; Wed,  5 Mar 2025 23:06:53 +0000 (UTC)
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
Subject: [RFC v3 17/33] rust: drm/kms: Add OpaqueEncoder
Date: Wed,  5 Mar 2025 17:59:33 -0500
Message-ID: <20250305230406.567126-18-lyude@redhat.com>
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

Same thing as OpaquePlane, but for encoders now.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Add safety comment to ModeObject implementation
* Add safety comments for AsRawEncoder
* Implement try_from_opaque() and from_opaque() using a macro

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/encoder.rs | 91 +++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/encoder.rs b/rust/kernel/drm/kms/encoder.rs
index 2e4e88055c890..9ae2ff8eb5d50 100644
--- a/rust/kernel/drm/kms/encoder.rs
+++ b/rust/kernel/drm/kms/encoder.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/drm/drm_encoder.h`](srctree/include/drm/drm_encoder.h)
 
-use super::{KmsDriver, ModeObject, StaticModeObject, UnregisteredKmsDevice};
+use super::{KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject, UnregisteredKmsDevice};
 use crate::{
     alloc::KBox,
     drm::device::Device,
@@ -219,6 +219,25 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::drm_encoder) -> &'a Self {
     }
 }
 
+// SAFETY: `funcs` is initialized when the encoder is allocated
+unsafe impl<T: DriverEncoder> ModeObjectVtable for Encoder<T> {
+    type Vtable = bindings::drm_encoder_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        // SAFETY: `as_raw()` always returns a valid pointer to an encoder
+        unsafe { *self.as_raw() }.funcs
+    }
+}
+
+impl<T: DriverEncoder> Encoder<T> {
+    super::impl_from_opaque_mode_obj! {
+        fn <'a, D>(&'a OpaqueEncoder<D>) -> &'a Self;
+        use
+            T as DriverEncoder,
+            D as KmsDriver
+    }
+}
+
 /// A [`Encoder`] that has not yet been registered with userspace.
 ///
 /// KMS registration is single-threaded, so this object is not thread-safe.
@@ -311,6 +330,76 @@ pub fn new<'a, 'b: 'a>(
     }
 }
 
+/// A [`struct drm_encoder`] without a known [`DriverEncoder`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverEncoder`] implementation
+/// for a [`struct drm_encoder`] automatically. It is identical to [`Encoder`], except that it does not
+/// provide access to the driver's private data.
+///
+/// # Invariants
+///
+/// Same as [`Encoder`].
+#[repr(transparent)]
+pub struct OpaqueEncoder<T: KmsDriver> {
+    encoder: Opaque<bindings::drm_encoder>,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> Sealed for OpaqueEncoder<T> {}
+
+// SAFETY: All of our encoder interfaces are thread-safe
+unsafe impl<T: KmsDriver> Send for OpaqueEncoder<T> {}
+
+// SAFETY: All of our encoder interfaces are thread-safe
+unsafe impl<T: KmsDriver> Sync for OpaqueEncoder<T> {}
+
+// SAFETY: We don't expose OpaqueEncoder<T> to users before `base` is initialized in
+// OpaqueEncoder::new(), so `raw_mode_obj` always returns a valid poiner to a
+// bindings::drm_mode_object.
+unsafe impl<T: KmsDriver> ModeObject for OpaqueEncoder<T> {
+    type Driver = T;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: DRM encoders exist for as long as the device does, so this pointer is always
+        // valid
+        unsafe { Device::borrow((*self.encoder.get()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose Encoder<T> to users before it's initialized, so `base` is always
+        // initialized
+        unsafe { addr_of_mut!((*self.encoder.get()).base) }
+    }
+}
+
+// SAFETY: Encoders do not have a refcount
+unsafe impl<T: KmsDriver> StaticModeObject for OpaqueEncoder<T> {}
+
+// SAFETY:
+// - Via our type variants our data layout is identical to  with `drm_encoder`
+// - Since we don't expose `Encoder` to users before it has been initialized, this and our data
+//   layout ensure that `as_raw()` always returns a valid pointer to a `drm_encoder`.
+unsafe impl<T: KmsDriver> AsRawEncoder for OpaqueEncoder<T> {
+    fn as_raw(&self) -> *mut bindings::drm_encoder {
+        self.encoder.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_encoder) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_encoder`
+        unsafe { &*ptr.cast() }
+    }
+}
+
+// SAFETY: `funcs` is initialized when the encoder is allocated
+unsafe impl<T: KmsDriver> ModeObjectVtable for OpaqueEncoder<T> {
+    type Vtable = bindings::drm_encoder_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        // SAFETY: `as_raw()` always returns a valid pointer to an encoder
+        unsafe { *self.as_raw() }.funcs
+    }
+}
+
 unsafe extern "C" fn encoder_destroy_callback<T: DriverEncoder>(
     encoder: *mut bindings::drm_encoder,
 ) {
-- 
2.48.1

