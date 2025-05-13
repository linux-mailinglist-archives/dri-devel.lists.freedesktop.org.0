Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E4BAB5F1D
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 00:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2F310E5F5;
	Tue, 13 May 2025 22:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MpmeCMD/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8AD10E5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747174281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tt1JSePFPFuckdQ49k5xhTN6H2hYpcBzjeDUG0vewRk=;
 b=MpmeCMD/9aC4ppF3ti0GVgV1aXwU9yEoVQbnKYKcQUy41lyrSktLFSCdeFmgePhxOxfwMt
 87/n2MA2IT0Q0oRSYwGCVdABAQHHw6RYRlY2ZgmF3+bstIoTiKDCOXFd/AXiieODotD+2h
 XVZaAkf0wh2vSBn2pJfDb8J1Gs9ENFM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-218-p7kry4B1MlGfHFKlsC4WMg-1; Tue,
 13 May 2025 18:11:15 -0400
X-MC-Unique: p7kry4B1MlGfHFKlsC4WMg-1
X-Mimecast-MFC-AGG-ID: p7kry4B1MlGfHFKlsC4WMg_1747174269
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 82A9E1800374; Tue, 13 May 2025 22:11:08 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.64.99])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8100C1944A82; Tue, 13 May 2025 22:11:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
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
 Danilo Krummrich <dakr@kernel.org>, Asahi Lina <lina@asahilina.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH v2 2/4] rust: drm: gem: Refactor IntoGEMObject::from_gem_obj()
 to as_ref()
Date: Tue, 13 May 2025 18:09:55 -0400
Message-ID: <20250513221046.903358-3-lyude@redhat.com>
In-Reply-To: <20250513221046.903358-1-lyude@redhat.com>
References: <20250513221046.903358-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

There's a few issues with this function, mainly:

* This function -probably- should have been unsafe from the start. Pointers
  are not always necessarily valid, but you want a function that does
  field-projection for a pointer that can travel outside of the original
  struct to be unsafe, at least if I understand properly.
* *mut Self is not terribly useful in this context, the majority of uses of
  from_gem_obj() grab a *mut Self and then immediately convert it into a
  &'a Self. It also goes against the ffi conventions we've set in the rest
  of the kernel thus far.
* from_gem_obj() also doesn't follow the naming conventions in the rest of
  the DRM bindings at the moment, as_ref() would be a better name.

So, let's:

* Make from_gem_obj() unsafe
* Convert it to return &'a Self
* Rename it to as_ref()
* Update all call locations

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

---
V2:
* Apply Danilo's comments in lookup_handle()
* Add safety comment from Daniel

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 69 ++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index df8f9fdae5c22..1ea1f15d8313c 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -45,8 +45,14 @@ pub trait IntoGEMObject: Sized + super::private::Sealed {
     #[allow(clippy::wrong_self_convention)]
     fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object>;
 
-    /// Converts a pointer to a `struct drm_gem_object` into a pointer to `Self`.
-    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self;
+    /// Converts a pointer to a `struct drm_gem_object` into a reference to `Self`.
+    ///
+    /// # Safety
+    ///
+    /// - `self_ptr` must be a valid pointer to `Self`.
+    /// - The caller promises that holding the immutable reference returned by this function does
+    ///   not violate rust's data aliasing rules and remains valid throughout the lifetime of `'a`.
+    unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self;
 }
 
 /// Trait which must be implemented by drivers using base GEM objects.
@@ -63,14 +69,13 @@ extern "C" fn open_callback<T: BaseDriverObject<U>, U: BaseObject>(
     let file = unsafe {
         drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
     };
-    let obj =
-        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::from_gem_obj(
-            raw_obj,
-        );
-
-    // SAFETY: `from_gem_obj()` returns a valid pointer as long as the type is correct and the
-    // `raw_obj` we got is valid.
-    match T::open(unsafe { &*obj }, file) {
+    // SAFETY: `open_callback` is specified in the AllocOps structure for `Object<T>`, ensuring that
+    // `raw_obj` is indeed contained within a `Object<T>`.
+    let obj = unsafe {
+        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj)
+    };
+
+    match T::open(obj, file) {
         Err(e) => e.to_errno(),
         Ok(()) => 0,
     }
@@ -84,14 +89,13 @@ extern "C" fn close_callback<T: BaseDriverObject<U>, U: BaseObject>(
     let file = unsafe {
         drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
     };
-    let obj =
-        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::from_gem_obj(
-            raw_obj,
-        );
-
-    // SAFETY: `from_gem_obj()` returns a valid pointer as long as the type is correct and the
-    // `raw_obj` we got is valid.
-    T::close(unsafe { &*obj }, file);
+    // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
+    // that `raw_obj` is indeed contained within a `Object<T>`.
+    let obj = unsafe {
+        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj)
+    };
+
+    T::close(obj, file);
 }
 
 impl<T: DriverObject> IntoGEMObject for Object<T> {
@@ -101,9 +105,10 @@ fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object> {
         &self.obj
     }
 
-    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self {
-        // SAFETY: All of our objects are Object<T>.
-        unsafe { crate::container_of!(obj, Object<T>, obj).cast_mut() }
+    unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
+        // SAFETY: `obj` is guaranteed to be in an `Object<T>` via the safety contract of this
+        // function
+        unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
     }
 }
 
@@ -144,11 +149,23 @@ fn lookup_handle(
     ) -> Result<ARef<Self>> {
         // SAFETY: The arguments are all valid per the type invariants.
         let ptr = unsafe { bindings::drm_gem_object_lookup(file.as_raw().cast(), handle) };
-        let ptr = <Self as IntoGEMObject>::from_gem_obj(ptr);
-        let ptr = NonNull::new(ptr).ok_or(ENOENT)?;
-
-        // SAFETY: We take ownership of the reference of `drm_gem_object_lookup()`.
-        Ok(unsafe { ARef::from_raw(ptr) })
+        if ptr.is_null() {
+            return Err(ENOENT);
+        }
+
+        // SAFETY:
+        // - A `drm::Driver` can only have a single `File` implementation.
+        // - `file` uses the same `drm::Driver` as `Self`.
+        // - Therefore, we're guaranteed that `ptr` must be a gem object embedded within `Self`.
+        // - And we check if the pointer is null befoe calling as_ref(), ensuring that `ptr` is a
+        //   valid pointer to an initialized `Self`.
+        let obj = unsafe { Self::as_ref(ptr) };
+
+        // SAFETY:
+        // - We take ownership of the reference of `drm_gem_object_lookup()`.
+        // - Our `NonNull` comes from an immutable reference, thus ensuring it is a valid pointer to
+        //   `Self`.
+        Ok(unsafe { ARef::from_raw(obj.into()) })
     }
 
     /// Creates an mmap offset to map the object from userspace.
-- 
2.49.0

