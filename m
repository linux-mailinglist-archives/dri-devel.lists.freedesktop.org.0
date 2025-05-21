Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C1ABFE5D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 22:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8777D10E795;
	Wed, 21 May 2025 20:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B1N5CI94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1D10E796
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 20:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747860528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Xzufaa4aZgtFIYzj8zYYCFRxQVb/zwFe5HxzSZJWxY=;
 b=B1N5CI94J6qbmxWIjId/MzpSW/rHQyU11XcmWy0ywIpFR3YqdjyV5sb7JI+Vj4ln8WkSN2
 2TxnFnRdy2Y+RdSboTk1gRs+ivrKwcLBCinYZScRurJUJQ5O7d4AQ+/pjaGi+VZ/LKYTQi
 fh/WOwiAV0aEifNGmnPf3z+NogsiVZI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-cHEFoZDJMu2ztuwO7P5b-Q-1; Wed,
 21 May 2025 16:48:45 -0400
X-MC-Unique: cHEFoZDJMu2ztuwO7P5b-Q-1
X-Mimecast-MFC-AGG-ID: cHEFoZDJMu2ztuwO7P5b-Q_1747860520
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A474D180036E; Wed, 21 May 2025 20:48:40 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AED9F19560B7; Wed, 21 May 2025 20:48:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GPUS [RUST]),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v2 11/12] rust: drm: gem: Add export() callback
Date: Wed, 21 May 2025 16:29:18 -0400
Message-ID: <20250521204654.1610607-12-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

This introduces an optional export() callback for GEM objects, which is
used to implement the drm_gem_object_funcs->export function.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nova/gem.rs  |  1 +
 rust/kernel/drm/gem/mod.rs   | 73 +++++++++++++++++++++++++++++++++++-
 rust/kernel/drm/gem/shmem.rs |  6 ++-
 3 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index f2f23320110dd..6cc7a65a50fae 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -16,6 +16,7 @@
 #[pin_data]
 pub(crate) struct NovaObject {}
 
+#[vtable]
 impl gem::BaseDriverObject for NovaObject {
     type Driver = NovaDriver;
     type Object = gem::Object<Self>;
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 6d87e75690d2f..ef697f323e52c 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -10,7 +10,8 @@
     alloc::flags::*,
     bindings, drm::{self, private::Sealed},
     drm::driver::{AllocImpl, AllocOps},
-    error::{to_result, Result},
+    dma_buf,
+    error::{to_result, from_err_ptr, Result},
     prelude::*,
     types::{ARef, AlwaysRefCounted, Opaque},
 };
@@ -44,6 +45,7 @@ fn as_ref(&self) -> &kernel::drm::gem::OpaqueObject<D> {
 pub(crate) use impl_as_opaque;
 
 /// GEM object functions, which must be implemented by drivers.
+#[vtable]
 pub trait BaseDriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
     type Driver: drm::Driver;
@@ -68,6 +70,11 @@ fn open(_obj: &Self::Object, _file: &DriverFile<Self>) -> Result {
 
     /// Close a handle to an existing object, associated with a File.
     fn close(_obj: &Self::Object, _file: &DriverFile<Self>) {}
+
+    /// Optional handle for exporting a gem object.
+    fn export(_obj: &Self::Object, _flags: u32) -> Result<DmaBuf<Self::Object>> {
+        unimplemented!()
+    }
 }
 
 /// Trait that represents a GEM object subtype
@@ -137,6 +144,21 @@ extern "C" fn close_callback<T: BaseDriverObject>(
     T::close(obj, file);
 }
 
+extern "C" fn export_callback<T: BaseDriverObject>(
+    raw_obj: *mut bindings::drm_gem_object,
+    flags: i32,
+) -> *mut bindings::dma_buf {
+    // SAFETY: `export_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
+    // that `raw_obj` is contained within a `Object<T>`.
+    let obj = unsafe { T::Object::as_ref(raw_obj) };
+
+    match T::export(obj, flags as _) {
+        // DRM takes a hold of the reference
+        Ok(buf) => buf.into_raw(),
+        Err(e) => e.to_ptr(),
+    }
+}
+
 impl<T: BaseDriverObject> IntoGEMObject for Object<T> {
     fn as_raw(&self) -> *mut bindings::drm_gem_object {
         self.obj.get()
@@ -247,7 +269,11 @@ impl<T: BaseDriverObject> Object<T> {
         open: Some(open_callback::<T>),
         close: Some(close_callback::<T>),
         print_info: None,
-        export: None,
+        export: if T::HAS_EXPORT {
+            Some(export_callback::<T>)
+        } else {
+            None
+        },
         pin: None,
         unpin: None,
         get_sg_table: None,
@@ -376,6 +402,49 @@ fn as_raw(&self) -> *mut bindings::drm_gem_object {
 
 impl<D: drm::Driver> Sealed for OpaqueObject<D> {}
 
+/// A [`dma_buf::DmaBuf`] which has been exported from a GEM object.
+///
+/// The [`dma_buf::DmaBuf`] will be released when this type is dropped.
+///
+/// # Invariants
+///
+/// - `self.0` points to a valid initialized [`dma_buf::DmaBuf`] for the lifetime of this object.
+/// - The GEM object from which this [`dma_buf::DmaBuf`] was exported from is guaranteed to be of
+///   type `T`.
+pub struct DmaBuf<T: IntoGEMObject>(NonNull<dma_buf::DmaBuf>, PhantomData<T>);
+
+impl<T: IntoGEMObject> Deref for DmaBuf<T> {
+    type Target = dma_buf::DmaBuf;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: This pointer is guaranteed to be valid by our type invariants.
+        unsafe { self.0.as_ref() }
+    }
+}
+
+impl<T: IntoGEMObject> Drop for DmaBuf<T> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY:
+        // - `dma_buf::DmaBuf` is guaranteed to have an identical layout to `struct dma_buf`
+        //   by its type invariants.
+        // - We hold the last reference to this `DmaBuf`, making it safe to destroy.
+        unsafe { bindings::drm_gem_dmabuf_release(self.0.cast().as_ptr()) }
+    }
+}
+
+impl<T: IntoGEMObject> DmaBuf<T> {
+    /// Leak the reference for this [`DmaBuf`] and return a raw pointer to it.
+    #[inline]
+    pub(crate) fn into_raw(self) -> *mut bindings::dma_buf {
+        let dma_ptr = self.as_raw();
+
+        core::mem::forget(self);
+        dma_ptr
+    }
+}
+
 pub(super) const fn create_fops() -> bindings::file_operations {
     // SAFETY: As by the type invariant, it is safe to initialize `bindings::file_operations`
     // zeroed.
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index bff038df93334..799f15c38cc36 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -77,7 +77,11 @@ impl<T: BaseDriverObject> Object<T> {
         open: Some(super::open_callback::<T>),
         close: Some(super::close_callback::<T>),
         print_info: Some(bindings::drm_gem_shmem_object_print_info),
-        export: None,
+        export: if T::HAS_EXPORT {
+            Some(super::export_callback::<T>)
+        } else {
+            None
+        },
         pin: Some(bindings::drm_gem_shmem_object_pin),
         unpin: Some(bindings::drm_gem_shmem_object_unpin),
         get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
-- 
2.49.0

