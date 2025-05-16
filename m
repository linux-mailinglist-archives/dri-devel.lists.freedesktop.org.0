Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3075ABA1AB
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 19:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E6C10EB46;
	Fri, 16 May 2025 17:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DeFvPh0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D6C10EB43
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747415450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Z0I9jrZU5atM1qUoNE/ouzYqO6Z+EgWgOrezkMsmh0=;
 b=DeFvPh0OSA9K2W6f62YwUQZfPDyOmeQ1LZzhMn8z5jD/Sz4TKG/cYXLpOSi8K4CGbZuy/1
 2fv4wyT8WFSqR0OsZF/IDlQhWdWr1o+NTlFoR4nkpnvDtTM6E2MyerRv/280Fvk7+ldGvc
 rLZH7uCJ4Zqjl1YJpsg3LCJThYUdS74=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-URD6NkHuNkmhRlGioqmafg-1; Fri,
 16 May 2025 13:10:47 -0400
X-MC-Unique: URD6NkHuNkmhRlGioqmafg-1
X-Mimecast-MFC-AGG-ID: URD6NkHuNkmhRlGioqmafg_1747415444
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 89E5A19560A2; Fri, 16 May 2025 17:10:43 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.82.40])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DB54C19560AF; Fri, 16 May 2025 17:10:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Asahi Lina <lina@asahilina.net>
Subject: [PATCH v2 1/4] rust: drm: gem: Simplify use of generics
Date: Fri, 16 May 2025 13:09:16 -0400
Message-ID: <20250516171030.776924-2-lyude@redhat.com>
In-Reply-To: <20250516171030.776924-1-lyude@redhat.com>
References: <20250516171030.776924-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
* Removes DriverObject
* Removes IntoGEMObject::Driver, and require BaseDriverObject be
  implemented for any methods in BaseObject that need an associated driver.

Leaving us with a simpler trait hierarchy that now looks like this:

  * Drivers implement: BaseDriverObject
  * Crate implements:
    * IntoGEMObject for Object<T> where T: DriverObject
    * BaseObject for T where T: IntoGEMObject

Which makes the code a lot easier to understand and build on :).

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Don't refer to Object<T> in callbacks, as this would result in drivers
  getting the wrong gem object type for shmem gem objects once we add
  support for those. Instead, we'll just add a type alias to clean this
  part up.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 82 ++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 47 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index d8765e61c6c25..f0455cc2aff2d 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -15,31 +15,31 @@
 use core::{mem, ops::Deref, ptr::NonNull};
 
 /// GEM object functions, which must be implemented by drivers.
-pub trait BaseDriverObject<T: BaseObject>: Sync + Send + Sized {
+pub trait BaseDriverObject: Sync + Send + Sized {
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
+        _obj: &<Self::Driver as drm::Driver>::Object,
+        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
     ) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
     fn close(
-        _obj: &<<T as IntoGEMObject>::Driver as drm::Driver>::Object,
-        _file: &drm::File<<<T as IntoGEMObject>::Driver as drm::Driver>::File>,
+        _obj: &<Self::Driver as drm::Driver>::Object,
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
@@ -74,25 +74,15 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
-/// Trait which must be implemented by drivers using base GEM objects.
-pub trait DriverObject: BaseDriverObject<Object<Self>> {
-    /// Parent `Driver` for this object.
-    type Driver: drm::Driver;
-}
-
-extern "C" fn open_callback<T: BaseDriverObject<U>, U: BaseObject>(
+extern "C" fn open_callback<T: BaseDriverObject>(
     raw_obj: *mut bindings::drm_gem_object,
     raw_file: *mut bindings::drm_file,
 ) -> core::ffi::c_int {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
-    let file = unsafe {
-        drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
-    };
-    // SAFETY: `open_callback` is specified in the AllocOps structure for `Object<T>`, ensuring that
-    // `raw_obj` is indeed contained within a `Object<T>`.
-    let obj = unsafe {
-        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj)
-    };
+    let file = unsafe { drm::File::<<T::Driver as drm::Driver>::File>::as_ref(raw_file) };
+    // SAFETY: `open_callback` is specified in the AllocOps structure for `DriverObject<T>`,
+    // ensuring that `raw_obj` is contained within a `DriverObject<T>`
+    let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj) };
 
     match T::open(obj, file) {
         Err(e) => e.to_errno(),
@@ -100,26 +90,21 @@ extern "C" fn open_callback<T: BaseDriverObject<U>, U: BaseObject>(
     }
 }
 
-extern "C" fn close_callback<T: BaseDriverObject<U>, U: BaseObject>(
+extern "C" fn close_callback<T: BaseDriverObject>(
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
+    let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj) };
 
     T::close(obj, file);
 }
 
-impl<T: DriverObject> IntoGEMObject for Object<T> {
-    type Driver = T::Driver;
-
+impl<T: BaseDriverObject> IntoGEMObject for Object<T> {
     fn as_raw(&self) -> *mut bindings::drm_gem_object {
         self.obj.get()
     }
@@ -141,10 +126,10 @@ fn size(&self) -> usize {
 
     /// Creates a new handle for the object associated with a given `File`
     /// (or returns an existing one).
-    fn create_handle(
-        &self,
-        file: &drm::File<<<Self as IntoGEMObject>::Driver as drm::Driver>::File>,
-    ) -> Result<u32> {
+    fn create_handle(&self, file: &drm::File<<Self::Driver as drm::Driver>::File>) -> Result<u32>
+    where
+        Self: BaseDriverObject,
+    {
         let mut handle: u32 = 0;
         // SAFETY: The arguments are all valid per the type invariants.
         to_result(unsafe {
@@ -155,9 +140,12 @@ fn create_handle(
 
     /// Looks up an object by its handle for a given `File`.
     fn lookup_handle(
-        file: &drm::File<<<Self as IntoGEMObject>::Driver as drm::Driver>::File>,
+        file: &drm::File<<Self::Driver as drm::Driver>::File>,
         handle: u32,
-    ) -> Result<ARef<Self>> {
+    ) -> Result<ARef<Self>>
+    where
+        Self: BaseDriverObject,
+    {
         // SAFETY: The arguments are all valid per the type invariants.
         let ptr = unsafe { bindings::drm_gem_object_lookup(file.as_raw().cast(), handle) };
         if ptr.is_null() {
@@ -199,21 +187,21 @@ impl<T: IntoGEMObject> BaseObject for T {}
 /// - `self.dev` is always a valid pointer to a `struct drm_device`.
 #[repr(C)]
 #[pin_data]
-pub struct Object<T: DriverObject + Send + Sync> {
+pub struct Object<T: BaseDriverObject + Send + Sync> {
     obj: Opaque<bindings::drm_gem_object>,
     dev: NonNull<drm::Device<T::Driver>>,
     #[pin]
     data: T,
 }
 
-impl<T: DriverObject> Object<T> {
+impl<T: BaseDriverObject> Object<T> {
     /// The size of this object's structure.
     pub const SIZE: usize = mem::size_of::<Self>();
 
     const OBJECT_FUNCS: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
         free: Some(Self::free_callback),
-        open: Some(open_callback::<T, Object<T>>),
-        close: Some(close_callback::<T, Object<T>>),
+        open: Some(open_callback::<T>),
+        close: Some(close_callback::<T>),
         print_info: None,
         export: None,
         pin: None,
@@ -283,9 +271,9 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
     }
 }
 
-impl<T: DriverObject> super::private::Sealed for Object<T> {}
+impl<T: BaseDriverObject> super::private::Sealed for Object<T> {}
 
-impl<T: DriverObject> Deref for Object<T> {
+impl<T: BaseDriverObject> Deref for Object<T> {
     type Target = T;
 
     fn deref(&self) -> &Self::Target {
@@ -293,7 +281,7 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<T: DriverObject> AllocImpl for Object<T> {
+impl<T: BaseDriverObject> AllocImpl for Object<T> {
     const ALLOC_OPS: AllocOps = AllocOps {
         gem_create_object: None,
         prime_handle_to_fd: None,
-- 
2.49.0

