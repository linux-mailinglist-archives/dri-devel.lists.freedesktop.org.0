Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23245AB91E7
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 23:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671A210E968;
	Thu, 15 May 2025 21:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gd3VbCfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A876010E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 21:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747345487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8VlgTzsUVzJPYh5fWGtpzc5L8hvnWzeMUZS80in9GQ=;
 b=Gd3VbCfH8aQuAVvvz+Fg1KYiyAluRM1LtBwRBM5w9iFop0p7nh5MhYroOulyc9ft5VhmcE
 pAYhr/5LKLigv4GPH38t0+WOYCm3seR6m9+TDMTiTW95jnXyaPKbS21oEXzvRFeIgumooX
 eUDsQ2O1E4lteAHOmtFC7tq0cKNw5mg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-O5Fi8y-NONOfoHTKxjsfSg-1; Thu,
 15 May 2025 17:44:44 -0400
X-MC-Unique: O5Fi8y-NONOfoHTKxjsfSg-1
X-Mimecast-MFC-AGG-ID: O5Fi8y-NONOfoHTKxjsfSg_1747345481
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E7CEF18004A7; Thu, 15 May 2025 21:44:40 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.82.40])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8920F1956094; Thu, 15 May 2025 21:44:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Asahi Lina <lina@asahilina.net>
Subject: [PATCH 1/2] rust: drm: gem: Simplify use of generics
Date: Thu, 15 May 2025 17:42:37 -0400
Message-ID: <20250515214425.671423-2-lyude@redhat.com>
In-Reply-To: <20250515214425.671423-1-lyude@redhat.com>
References: <20250515214425.671423-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

Now that my rust skills have been honed, I noticed that there's a lot of
generics in our gem bindings that don't actually need to be here. Currently
the hierarchy of traits in our gem bindings looks like this:

  * Drivers implement:
    * BaseDriverObject<T: DriverObject> (has the callbacks)
    * DriverObject (has the drm::Driver type)
  * Crate implements:
    * IntoGEMObject for Object<T> where T: DriverObject
      Handles conversion to/from raw object pointers
    * BaseObject for T where T: IntoGEMObject
      Provides methods common to all gem interfaces

  Also of note, this leaves us with two different drm::Driver associated
  types:
    * DriverObject::Driver
    * IntoGEMObject::Driver

I'm not entirely sure of the original intent here unfortunately (if anyone
is, please let me know!), but my guess is that the idea would be that some
objects can implement IntoGEMObject using a different ::Driver than
DriverObject - presumably to enable the usage of gem objects from different
drivers. A reasonable usecase of course.

However - if I'm not mistaken, I don't think that this is actually how
things would go in practice. Driver implementations are of course
implemented by their associated drivers, and generally drivers are not
linked to each-other when building the kernel. Which is to say that even in
a situation where we would theoretically deal with gem objects from another
driver, we still wouldn't have access to its drm::driver::Driver
implementation. It's more likely we would simply want a variant of gem
objects in such a situation that have no association with a
drm::driver::Driver type.

Taking that into consideration, we can assume the following:
* Anything that implements BaseDriverObject will implement DriverObject
  In other words, all BaseDriverObjects indirectly have an associated
  ::Driver type - so the two traits can be combined into one with no
  generics.
* Not everything that implements IntoGEMObject will have an associated
  ::Driver, and that's OK.

And with this, we now can do quite a bit of cleanup with the use of
generics here. As such, this commit:

* Removes the generics on BaseDriverObject
* Moves DriverObject::Driver into BaseDriverObject
* Removes DriverObject, and renames BaseDriverObject to DriverObject
* Removes IntoGEMObject::Driver, and require DriverObject be implemented
  for any methods in BaseObject that need an associated driver.

Leaving us with a simpler trait hierarchy that now looks like this:

  * Drivers implement: DriverObject
  * Crate implements:
    * IntoGEMObject for Object<T> where T: DriverObject
    * BaseObject for T where T: IntoGEMObject

Which makes the code a lot easier to understand and build on :).

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 63 +++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 35 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index d8765e61c6c25..ffd45419d563a 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -15,31 +15,31 @@
 use core::{mem, ops::Deref, ptr::NonNull};
 
 /// GEM object functions, which must be implemented by drivers.
-pub trait BaseDriverObject<T: BaseObject>: Sync + Send + Sized {
+pub trait DriverObject: Sync + Send + Sized {
+    /// Parent `Driver` for this object.
+    type Driver: drm::Driver;
+
     /// Create a new driver data object for a GEM object of a given size.
-    fn new(dev: &drm::Device<T::Driver>, size: usize) -> impl PinInit<Self, Error>;
+    fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
     fn open(
-        _obj: &<<T as IntoGEMObject>::Driver as drm::Driver>::Object,
-        _file: &drm::File<<<T as IntoGEMObject>::Driver as drm::Driver>::File>,
+        _obj: &Object<Self>,
+        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
     ) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
     fn close(
-        _obj: &<<T as IntoGEMObject>::Driver as drm::Driver>::Object,
-        _file: &drm::File<<<T as IntoGEMObject>::Driver as drm::Driver>::File>,
+        _obj: &Object<Self>,
+        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
     ) {
     }
 }
 
 /// Trait that represents a GEM object subtype
 pub trait IntoGEMObject: Sized + super::private::Sealed + AlwaysRefCounted {
-    /// Owning driver for this type
-    type Driver: drm::Driver;
-
     /// Returns a reference to the raw `drm_gem_object` structure, which must be valid as long as
     /// this owning object is valid.
     fn as_raw(&self) -> *mut bindings::drm_gem_object;
@@ -74,25 +74,17 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
-/// Trait which must be implemented by drivers using base GEM objects.
-pub trait DriverObject: BaseDriverObject<Object<Self>> {
-    /// Parent `Driver` for this object.
-    type Driver: drm::Driver;
-}
-
-extern "C" fn open_callback<T: BaseDriverObject<U>, U: BaseObject>(
+extern "C" fn open_callback<T: DriverObject>(
     raw_obj: *mut bindings::drm_gem_object,
     raw_file: *mut bindings::drm_file,
 ) -> core::ffi::c_int {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
     let file = unsafe {
-        drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
+        drm::File::<<T::Driver as drm::Driver>::File>::as_ref(raw_file)
     };
     // SAFETY: `open_callback` is specified in the AllocOps structure for `Object<T>`, ensuring that
     // `raw_obj` is indeed contained within a `Object<T>`.
-    let obj = unsafe {
-        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj)
-    };
+    let obj = unsafe { Object::<T>::as_ref(raw_obj) };
 
     match T::open(obj, file) {
         Err(e) => e.to_errno(),
@@ -100,26 +92,21 @@ extern "C" fn open_callback<T: BaseDriverObject<U>, U: BaseObject>(
     }
 }
 
-extern "C" fn close_callback<T: BaseDriverObject<U>, U: BaseObject>(
+extern "C" fn close_callback<T: DriverObject>(
     raw_obj: *mut bindings::drm_gem_object,
     raw_file: *mut bindings::drm_file,
 ) {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
-    let file = unsafe {
-        drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
-    };
+    let file = unsafe { drm::File::<<T::Driver as drm::Driver>::File>::as_ref(raw_file) };
+
     // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
     // that `raw_obj` is indeed contained within a `Object<T>`.
-    let obj = unsafe {
-        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj)
-    };
+    let obj = unsafe { Object::<T>::as_ref(raw_obj) };
 
     T::close(obj, file);
 }
 
 impl<T: DriverObject> IntoGEMObject for Object<T> {
-    type Driver = T::Driver;
-
     fn as_raw(&self) -> *mut bindings::drm_gem_object {
         self.obj.get()
     }
@@ -143,8 +130,11 @@ fn size(&self) -> usize {
     /// (or returns an existing one).
     fn create_handle(
         &self,
-        file: &drm::File<<<Self as IntoGEMObject>::Driver as drm::Driver>::File>,
-    ) -> Result<u32> {
+        file: &drm::File<<Self::Driver as drm::Driver>::File>,
+    ) -> Result<u32>
+    where
+        Self: DriverObject
+    {
         let mut handle: u32 = 0;
         // SAFETY: The arguments are all valid per the type invariants.
         to_result(unsafe {
@@ -155,9 +145,12 @@ fn create_handle(
 
     /// Looks up an object by its handle for a given `File`.
     fn lookup_handle(
-        file: &drm::File<<<Self as IntoGEMObject>::Driver as drm::Driver>::File>,
+        file: &drm::File<<Self::Driver as drm::Driver>::File>,
         handle: u32,
-    ) -> Result<ARef<Self>> {
+    ) -> Result<ARef<Self>>
+    where
+        Self: DriverObject
+    {
         // SAFETY: The arguments are all valid per the type invariants.
         let ptr = unsafe { bindings::drm_gem_object_lookup(file.as_raw().cast(), handle) };
         if ptr.is_null() {
@@ -212,8 +205,8 @@ impl<T: DriverObject> Object<T> {
 
     const OBJECT_FUNCS: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
         free: Some(Self::free_callback),
-        open: Some(open_callback::<T, Object<T>>),
-        close: Some(close_callback::<T, Object<T>>),
+        open: Some(open_callback::<T>),
+        close: Some(close_callback::<T>),
         print_info: None,
         export: None,
         pin: None,
-- 
2.49.0

