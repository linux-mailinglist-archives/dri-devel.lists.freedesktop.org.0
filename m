Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5F4AB5F1B
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 00:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5533010E5F4;
	Tue, 13 May 2025 22:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XdbTb9Y+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918D210E5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747174282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+eRdN+ZheJAEz/HIzsmMzXqUM9+/iVZmHsdLdFswD3U=;
 b=XdbTb9Y+WmDRpkM7TWrCG/2ybTcY8Ao7GGknEwglJjO+cGRjLgMh4Wa2GLFG53sJPpfFk3
 WJ3SZUNkobB/dE/WfunP5BXB5phrIUpKOutGnsqYy6YpmMRgbM7kd4zQ9PEC7N7E8z9bnB
 DTKNQ+HBGFG23IKs/zL5ar0I67WcSk4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-lmH3wHABP0iRzkoMnM7q2w-1; Tue,
 13 May 2025 18:11:19 -0400
X-MC-Unique: lmH3wHABP0iRzkoMnM7q2w-1
X-Mimecast-MFC-AGG-ID: lmH3wHABP0iRzkoMnM7q2w_1747174277
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 354891955BF2; Tue, 13 May 2025 22:11:16 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.64.99])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C52021944A82; Tue, 13 May 2025 22:11:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>,
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
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Asahi Lina <lina@asahilina.net>
Subject: [PATCH v2 3/4] rust: drm: gem: s/into_gem_obj()/as_raw()/
Date: Tue, 13 May 2025 18:09:56 -0400
Message-ID: <20250513221046.903358-4-lyude@redhat.com>
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

There's a few changes here:
* The rename, of course (this should also let us drop the clippy annotation
  here)
* Return *mut bindings::drm_gem_object instead of
  &Opaque<bindings::drm_gem_object> - the latter doesn't really have any
  benefit and just results in conversion from the rust type to the C type
  having to be more verbose than necessary.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>

---
V2:

Rename to as_raw()

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 1ea1f15d8313c..fa293c08f431d 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -12,7 +12,7 @@
     prelude::*,
     types::{ARef, Opaque},
 };
-use core::{mem, ops::Deref, ptr, ptr::NonNull};
+use core::{mem, ops::Deref, ptr::NonNull};
 
 /// GEM object functions, which must be implemented by drivers.
 pub trait BaseDriverObject<T: BaseObject>: Sync + Send + Sized {
@@ -42,8 +42,7 @@ pub trait IntoGEMObject: Sized + super::private::Sealed {
 
     /// Returns a reference to the raw `drm_gem_object` structure, which must be valid as long as
     /// this owning object is valid.
-    #[allow(clippy::wrong_self_convention)]
-    fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object>;
+    fn as_raw(&self) -> *mut bindings::drm_gem_object;
 
     /// Converts a pointer to a `struct drm_gem_object` into a reference to `Self`.
     ///
@@ -101,8 +100,8 @@ extern "C" fn close_callback<T: BaseDriverObject<U>, U: BaseObject>(
 impl<T: DriverObject> IntoGEMObject for Object<T> {
     type Driver = T::Driver;
 
-    fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object> {
-        &self.obj
+    fn as_raw(&self) -> *mut bindings::drm_gem_object {
+        self.obj.get()
     }
 
     unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
@@ -121,7 +120,7 @@ pub trait BaseObject
     fn size(&self) -> usize {
         // SAFETY: `self.into_gem_obj()` is guaranteed to be a pointer to a valid `struct
         // drm_gem_object`.
-        unsafe { (*self.into_gem_obj().get()).size }
+        unsafe { (*self.as_raw()).size }
     }
 
     /// Creates a new handle for the object associated with a given `File`
@@ -133,11 +132,7 @@ fn create_handle(
         let mut handle: u32 = 0;
         // SAFETY: The arguments are all valid per the type invariants.
         to_result(unsafe {
-            bindings::drm_gem_handle_create(
-                file.as_raw().cast(),
-                self.into_gem_obj().get(),
-                &mut handle,
-            )
+            bindings::drm_gem_handle_create(file.as_raw().cast(), self.as_raw(), &mut handle)
         })?;
         Ok(handle)
     }
@@ -171,14 +166,10 @@ fn lookup_handle(
     /// Creates an mmap offset to map the object from userspace.
     fn create_mmap_offset(&self) -> Result<u64> {
         // SAFETY: The arguments are valid per the type invariant.
-        to_result(unsafe { bindings::drm_gem_create_mmap_offset(self.into_gem_obj().get()) })?;
+        to_result(unsafe { bindings::drm_gem_create_mmap_offset(self.as_raw()) })?;
 
         // SAFETY: The arguments are valid per the type invariant.
-        Ok(unsafe {
-            bindings::drm_vma_node_offset_addr(ptr::addr_of_mut!(
-                (*self.into_gem_obj().get()).vma_node
-            ))
-        })
+        Ok(unsafe { bindings::drm_vma_node_offset_addr(&raw mut (*self.as_raw()).vma_node) })
     }
 }
 
-- 
2.49.0

