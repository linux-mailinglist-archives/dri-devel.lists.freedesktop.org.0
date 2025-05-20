Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7771EABE28C
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 20:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2B310E5F4;
	Tue, 20 May 2025 18:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ze8Np1jt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F210E612
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 18:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747765356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTc5ZzsULEJRyl7cd9ycKlIiqkNSEfS7X3XjScm3/CY=;
 b=Ze8Np1jtqepBPo/52W6OGofsBId5kILTjBGg0G192jsQSxN7JroGRHmFnpcjNHHiLoaaRa
 D7nbpnK9/oD6OoEkAKONke5J3Y9nw+WKTkwAhOZnjqUCc3T+4/rty2I7H/c8LlITwXMVs1
 5oUe630K2QDHoxg3mpHd2gCJEz0o7U0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-uFSE8K05OdWE274LEBJZbA-1; Tue,
 20 May 2025 14:22:33 -0400
X-MC-Unique: uFSE8K05OdWE274LEBJZbA-1
X-Mimecast-MFC-AGG-ID: uFSE8K05OdWE274LEBJZbA_1747765351
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 27DBA1956051; Tue, 20 May 2025 18:22:31 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.70])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3708F180045B; Tue, 20 May 2025 18:22:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
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
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GPUS [RUST])
Subject: [PATCH v3 4/4] rust: drm: Use gem::BaseDriverObject in driver::Driver
Date: Tue, 20 May 2025 14:19:15 -0400
Message-ID: <20250520182144.1313262-5-lyude@redhat.com>
In-Reply-To: <20250520182144.1313262-1-lyude@redhat.com>
References: <20250520182144.1313262-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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
 drivers/gpu/drm/nova/driver.rs |  4 ++--
 drivers/gpu/drm/nova/gem.rs    |  1 +
 rust/kernel/drm/device.rs      | 17 ++++++++++-------
 rust/kernel/drm/driver.rs      |  2 +-
 rust/kernel/drm/gem/mod.rs     | 11 +++++++----
 5 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index b28b2e05cc156..58e534cf3ed39 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{auxiliary, c_str, device::Core, drm, drm::gem, drm::ioctl, prelude::*, types::ARef};
+use kernel::{auxiliary, c_str, device::Core, drm, drm::ioctl, prelude::*, types::ARef};
 
 use crate::file::File;
 use crate::gem::NovaObject;
@@ -57,7 +57,7 @@ fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBo
 impl drm::Driver for NovaDriver {
     type Data = NovaData;
     type File = File;
-    type Object = gem::Object<NovaObject>;
+    type Object = NovaObject;
 
     const INFO: drm::DriverInfo = INFO;
 
diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 68f93c9675611..a3024922f0d90 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -18,6 +18,7 @@ pub(crate) struct NovaObject {}
 
 impl gem::BaseDriverObject for NovaObject {
     type Driver = NovaDriver;
+    type Object = gem::Object<Self>;
 
     fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
         try_pin_init!(NovaObject {})
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 74c9a3dd719e3..6fc6995be637d 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -60,6 +60,9 @@ pub struct Device<T: drm::Driver> {
     data: T::Data,
 }
 
+/// A type alias for referring to the [`AllocImpl`] implementation for a DRM driver.
+type DriverAllocImpl<T> = <<T as drm::Driver>::Object as drm::gem::BaseDriverObject>::Object;
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
index 2be2a2d318e03..a77747edac80e 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -106,7 +106,7 @@ pub trait Driver {
     type Data: Sync + Send;
 
     /// The type used to manage memory for this driver.
-    type Object: AllocImpl;
+    type Object: drm::gem::BaseDriverObject;
 
     /// The type used to represent a DRM File (client)
     type File: drm::file::DriverFile;
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 8944fc7a815a2..3c45883011d49 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -26,16 +26,19 @@ pub trait BaseDriverObject: Sync + Send + Sized {
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
@@ -83,7 +86,7 @@ extern "C" fn open_callback<T: BaseDriverObject>(
 
     // SAFETY: `open_callback` is specified in the AllocOps structure for `DriverObject<T>`,
     // ensuring that `raw_obj` is contained within a `DriverObject<T>`
-    let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj) };
+    let obj = unsafe { T::Object::as_ref(raw_obj) };
 
     match T::open(obj, file) {
         Err(e) => e.to_errno(),
@@ -100,7 +103,7 @@ extern "C" fn close_callback<T: BaseDriverObject>(
 
     // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
     // that `raw_obj` is indeed contained within a `Object<T>`.
-    let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj) };
+    let obj = unsafe { T::Object::as_ref(raw_obj) };
 
     T::close(obj, file);
 }
-- 
2.49.0

