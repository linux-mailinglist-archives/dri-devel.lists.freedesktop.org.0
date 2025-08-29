Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BEB3C525
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 00:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F16E10EC41;
	Fri, 29 Aug 2025 22:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eieRm8NN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2EA10E41F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 22:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756507327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cr7Z5SnqFnSoE6cxmV2l32qPVo05acQnlSmqa8BLLuw=;
 b=eieRm8NNr4yi80OnciFcsQt8ChXMs2pmToB0lB9sbxV5HoBeRA+rx+vWnrOLgfvSzWsvKG
 7llfDJVhJwqhWv5nYpb4DkZMwPyc7LrYHPsuHxOLgSKGhsCMd5lSTl4gab7IgaDHPMA3fH
 Mw2FGytCXCC8+WgHOmItwHRllrwT0Ws=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-114-IJgjwKlTMvOBSB8COVyeAw-1; Fri,
 29 Aug 2025 18:42:02 -0400
X-MC-Unique: IJgjwKlTMvOBSB8COVyeAw-1
X-Mimecast-MFC-AGG-ID: IJgjwKlTMvOBSB8COVyeAw_1756507319
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 19F231800451; Fri, 29 Aug 2025 22:41:59 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.78])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A091518003FC; Fri, 29 Aug 2025 22:41:54 +0000 (UTC)
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
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GPUS [RUST])
Subject: [PATCH v3 04/14] rust: drm: gem: Support driver-private GEM object
 types
Date: Fri, 29 Aug 2025 18:35:19 -0400
Message-ID: <20250829224116.477990-5-lyude@redhat.com>
In-Reply-To: <20250829224116.477990-1-lyude@redhat.com>
References: <20250829224116.477990-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

One of the original intents with the gem bindings was that drivers could
specify additional gem implementations, in order to enable for driver
private gem objects. This wasn't really possible however, as up until now
our GEM bindings have always assumed that the only GEM object we would run
into was driver::Driver::Object - meaning that implementing another GEM
object type would result in all of the BaseDriverObject callbacks assuming
the wrong type.

This is a pretty easy fix though, all we need to do is specify a
BaseDriverObject in driver::Driver instead of an AllocImpl, and then add an
associated type for AllocImpl in BaseDriverObject. That way each
BaseDriverObject has its own AllocImpl allowing it to know which type to
provide in BaseDriverObject callbacks, and driver::Driver can simply go
through the BaseDriverObject to its AllocImpl type in order to get access
to ALLOC_OPS.

So, let's do this and update Nova for these changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V4:
* Update trait bounds. This looks gnarlier then it is:

    Self: AllocImpl<Driver = D>, <-- Get the driver for this GEM object
    D: drm::Driver<Object = O, File = F>, <-- Get the driver's Object, File
                                              impl
    F: drm::file::DriverFile,
    O: BaseDriverObject<Object = Self>, <-- Make sure we're the driver's
                                            main GEM object impl.
  (don't worry, the compiler can always figure out what D, F, O are)
* Also, rename the commit. I realized I should be clearer about what this
  does so people can stop me if this isn't what was meant by private gem
  object implementations :).

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nova/driver.rs |  8 ++++++--
 drivers/gpu/drm/nova/gem.rs    |  1 +
 rust/kernel/drm/device.rs      | 17 ++++++++++-------
 rust/kernel/drm/driver.rs      |  2 +-
 rust/kernel/drm/gem/mod.rs     | 21 +++++++++++++--------
 5 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 91b7380f83ab4..4c252426056c5 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -1,7 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::{
-    auxiliary, c_str, device::Core, drm, drm::gem, drm::ioctl, prelude::*, sync::aref::ARef,
+    auxiliary, c_str,
+    device::Core,
+    drm::{self, gem, ioctl},
+    prelude::*,
+    types::ARef,
 };
 
 use crate::file::File;
@@ -59,7 +63,7 @@ fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBo
 impl drm::Driver for NovaDriver {
     type Data = NovaData;
     type File = File;
-    type Object = gem::Object<NovaObject>;
+    type Object = NovaObject;
 
     const INFO: drm::DriverInfo = INFO;
 
diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 2760ba4f3450b..10e3053f1a246 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -18,6 +18,7 @@ pub(crate) struct NovaObject {}
 
 impl gem::DriverObject for NovaObject {
     type Driver = NovaDriver;
+    type Object = gem::Object<Self>;
 
     fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
         try_pin_init!(NovaObject {})
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3bb7c83966cf2..16cf6cb53d9a7 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -60,6 +60,9 @@ pub struct Device<T: drm::Driver> {
     data: T::Data,
 }
 
+/// A type alias for referring to the [`AllocImpl`] implementation for a DRM driver.
+type DriverAllocImpl<T> = <<T as drm::Driver>::Object as drm::gem::DriverObject>::Object;
+
 impl<T: drm::Driver> Device<T> {
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
@@ -70,13 +73,13 @@ impl<T: drm::Driver> Device<T> {
         master_set: None,
         master_drop: None,
         debugfs_init: None,
-        gem_create_object: T::Object::ALLOC_OPS.gem_create_object,
-        prime_handle_to_fd: T::Object::ALLOC_OPS.prime_handle_to_fd,
-        prime_fd_to_handle: T::Object::ALLOC_OPS.prime_fd_to_handle,
-        gem_prime_import: T::Object::ALLOC_OPS.gem_prime_import,
-        gem_prime_import_sg_table: T::Object::ALLOC_OPS.gem_prime_import_sg_table,
-        dumb_create: T::Object::ALLOC_OPS.dumb_create,
-        dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
+        gem_create_object: DriverAllocImpl::<T>::ALLOC_OPS.gem_create_object,
+        prime_handle_to_fd: DriverAllocImpl::<T>::ALLOC_OPS.prime_handle_to_fd,
+        prime_fd_to_handle: DriverAllocImpl::<T>::ALLOC_OPS.prime_fd_to_handle,
+        gem_prime_import: DriverAllocImpl::<T>::ALLOC_OPS.gem_prime_import,
+        gem_prime_import_sg_table: DriverAllocImpl::<T>::ALLOC_OPS.gem_prime_import_sg_table,
+        dumb_create: DriverAllocImpl::<T>::ALLOC_OPS.dumb_create,
+        dumb_map_offset: DriverAllocImpl::<T>::ALLOC_OPS.dumb_map_offset,
         show_fdinfo: None,
         fbdev_probe: None,
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index dae0f4d1bbe3c..2500a61f45a6a 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -103,7 +103,7 @@ pub trait Driver {
     type Data: Sync + Send;
 
     /// The type used to manage memory for this driver.
-    type Object: AllocImpl;
+    type Object: drm::gem::DriverObject;
 
     /// The type used to represent a DRM File (client)
     type File: drm::file::DriverFile;
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index b27b9fbf28bbb..ec36cd9ea69ed 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -26,16 +26,19 @@ pub trait DriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
     type Driver: drm::Driver;
 
+    /// The GEM object type that will be passed to various callbacks.
+    type Object: AllocImpl;
+
     /// Create a new driver data object for a GEM object of a given size.
     fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
-    fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) -> Result {
+    fn open(_obj: &Self::Object, _file: &DriverFile<Self>) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
-    fn close(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) {}
+    fn close(_obj: &Self::Object, _file: &DriverFile<Self>) {}
 }
 
 /// Trait that represents a GEM object subtype
@@ -83,7 +86,7 @@ extern "C" fn open_callback<T: DriverObject>(
 
     // SAFETY: `open_callback` is specified in the AllocOps structure for `DriverObject<T>`,
     // ensuring that `raw_obj` is contained within a `DriverObject<T>`
-    let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::from_raw(raw_obj) };
+    let obj = unsafe { T::Object::from_raw(raw_obj) };
 
     match T::open(obj, file) {
         Err(e) => e.to_errno(),
@@ -100,7 +103,7 @@ extern "C" fn close_callback<T: DriverObject>(
 
     // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
     // that `raw_obj` is indeed contained within a `Object<T>`.
-    let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::from_raw(raw_obj) };
+    let obj = unsafe { T::Object::from_raw(raw_obj) };
 
     T::close(obj, file);
 }
@@ -127,11 +130,12 @@ fn size(&self) -> usize {
 
     /// Creates a new handle for the object associated with a given `File`
     /// (or returns an existing one).
-    fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
+    fn create_handle<D, F, O>(&self, file: &drm::File<F>) -> Result<u32>
     where
         Self: AllocImpl<Driver = D>,
-        D: drm::Driver<Object = Self, File = F>,
+        D: drm::Driver<Object = O, File = F>,
         F: drm::file::DriverFile,
+        O: DriverObject<Object = Self>,
     {
         let mut handle: u32 = 0;
         // SAFETY: The arguments are all valid per the type invariants.
@@ -142,11 +146,12 @@ fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
     }
 
     /// Looks up an object by its handle for a given `File`.
-    fn lookup_handle<D, F>(file: &drm::File<F>, handle: u32) -> Result<ARef<Self>>
+    fn lookup_handle<D, F, O>(file: &drm::File<F>, handle: u32) -> Result<ARef<Self>>
     where
         Self: AllocImpl<Driver = D>,
-        D: drm::Driver<Object = Self, File = F>,
+        D: drm::Driver<Object = O, File = F>,
         F: drm::file::DriverFile,
+        O: DriverObject<Object = Self>,
     {
         // SAFETY: The arguments are all valid per the type invariants.
         let ptr = unsafe { bindings::drm_gem_object_lookup(file.as_raw().cast(), handle) };
-- 
2.50.0

