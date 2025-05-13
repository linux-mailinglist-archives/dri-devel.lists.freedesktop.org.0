Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC81AB5F1E
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 00:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF15B10E5F8;
	Tue, 13 May 2025 22:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BqW5bMo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929DA10E5F8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 22:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747174287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYpgcS7RnRGZH3+H9PW9GmynVyhw2nSeHj3h6xR1Dao=;
 b=BqW5bMo2jjqZ+dPZ8scbYIu2JH4mxkwSpjKz64KJkWM3wMB23n96bTyjOo5D0cnZ27awQb
 v6T4jyjIJxiAo08mC1KffW/egx+h1iAjLKX1KdseAS3ZwVcgG9RRWNMbS85Jj8faK7NsqL
 20hofjEBC97X6zztT+1WLxGdTa1BGHQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-15-KpYSB-q-Md-OvwAxl0nexQ-1; Tue,
 13 May 2025 18:11:26 -0400
X-MC-Unique: KpYSB-q-Md-OvwAxl0nexQ-1
X-Mimecast-MFC-AGG-ID: KpYSB-q-Md-OvwAxl0nexQ_1747174283
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9ABA7180036F; Tue, 13 May 2025 22:11:23 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.64.99])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3FDA61944A82; Tue, 13 May 2025 22:11:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
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
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH v2 4/4] rust: drm: gem: Implement AlwaysRefCounted for all gem
 objects automatically
Date: Tue, 13 May 2025 18:09:57 -0400
Message-ID: <20250513221046.903358-5-lyude@redhat.com>
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

Currently we are requiring AlwaysRefCounted in most trait bounds for gem
objects, and implementing it by hand for our only current type of gem
object. However, all gem objects use the same functions for reference
counting - and all gem objects support reference counting.

We're planning on adding support for shmem gem objects, let's move this
around a bit by instead making IntoGEMObject require AlwaysRefCounted as a
trait bound, and then provide a blanket AlwaysRefCounted implementation for
any object that implements IntoGEMObject so all gem object types can use
the same AlwaysRefCounted implementation. This also makes things less
verbose by making the AlwaysRefCounted trait bound implicit for any
IntoGEMObject bound.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/drm/gem/mod.rs | 47 +++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index fa293c08f431d..e920c7a7edb21 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -10,7 +10,7 @@
     drm::driver::{AllocImpl, AllocOps},
     error::{to_result, Result},
     prelude::*,
-    types::{ARef, Opaque},
+    types::{ARef, AlwaysRefCounted, Opaque},
 };
 use core::{mem, ops::Deref, ptr::NonNull};
 
@@ -36,7 +36,7 @@ fn close(
 }
 
 /// Trait that represents a GEM object subtype
-pub trait IntoGEMObject: Sized + super::private::Sealed {
+pub trait IntoGEMObject: Sized + super::private::Sealed + AlwaysRefCounted {
     /// Owning driver for this type
     type Driver: drm::Driver;
 
@@ -54,6 +54,26 @@ pub trait IntoGEMObject: Sized + super::private::Sealed {
     unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self;
 }
 
+// SAFETY: All gem objects are refcounted.
+unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: We either hold the only refcount on `obj`, or one of many - meaning that no one
+        // else could possibly hold a mutable reference to `obj` and thus this immutable reference
+        // is safe.
+        let obj = unsafe { obj.as_ref() }.as_raw();
+
+        // SAFETY:
+        // - The safety requirements guarantee that the refcount is non-zero.
+        // - We hold no references to `obj` now, making it safe for us to potentially deallocate it.
+        unsafe { bindings::drm_gem_object_put(obj) };
+    }
+}
+
 /// Trait which must be implemented by drivers using base GEM objects.
 pub trait DriverObject: BaseDriverObject<Object<Self>> {
     /// Parent `Driver` for this object.
@@ -112,10 +132,7 @@ unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
 }
 
 /// Base operations shared by all GEM object classes
-pub trait BaseObject
-where
-    Self: crate::types::AlwaysRefCounted + IntoGEMObject,
-{
+pub trait BaseObject: IntoGEMObject {
     /// Returns the size of the object in bytes.
     fn size(&self) -> usize {
         // SAFETY: `self.into_gem_obj()` is guaranteed to be a pointer to a valid `struct
@@ -173,7 +190,7 @@ fn create_mmap_offset(&self) -> Result<u64> {
     }
 }
 
-impl<T> BaseObject for T where Self: crate::types::AlwaysRefCounted + IntoGEMObject {}
+impl<T: IntoGEMObject> BaseObject for T {}
 
 /// A base GEM object.
 ///
@@ -267,22 +284,6 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
     }
 }
 
-// SAFETY: Instances of `Object<T>` are always reference-counted.
-unsafe impl<T: DriverObject> crate::types::AlwaysRefCounted for Object<T> {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
-    }
-
-    unsafe fn dec_ref(obj: NonNull<Self>) {
-        // SAFETY: `obj` is a valid pointer to an `Object<T>`.
-        let obj = unsafe { obj.as_ref() };
-
-        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
-        unsafe { bindings::drm_gem_object_put(obj.as_raw()) }
-    }
-}
-
 impl<T: DriverObject> super::private::Sealed for Object<T> {}
 
 impl<T: DriverObject> Deref for Object<T> {
-- 
2.49.0

