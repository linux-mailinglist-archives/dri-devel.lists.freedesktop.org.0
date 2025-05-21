Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97D1ABFE4A
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 22:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5E810E781;
	Wed, 21 May 2025 20:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FDmmjhEJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6533910E775
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 20:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747860481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7RkpFLJnA47LTzwk8o4U9PeS8nU4fCkKj3jasQpFZE=;
 b=FDmmjhEJdWxEpTWMnBROwYFxlkDkuUUjOutd3Yx22864j7scvRoJ+OBbOiPmF5cTqsZoz5
 prr/CDW7YPQyop8L+D2H8Hx01fkU1cGhTZtoAbx5BO7kPI6NvRYq3AJfBjOERcodd1JG6g
 nv76dxjSS7y5JSNcwE/zkHe4ix72MDA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-BLGIfQEcP6OcNxgkLVqypg-1; Wed,
 21 May 2025 16:47:59 -0400
X-MC-Unique: BLGIfQEcP6OcNxgkLVqypg-1
X-Mimecast-MFC-AGG-ID: BLGIfQEcP6OcNxgkLVqypg_1747860477
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 08BEE19560B1; Wed, 21 May 2025 20:47:57 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 47F9119560B7; Wed, 21 May 2025 20:47:52 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH v2 06/12] rust: drm: gem: Add OpaqueObject
Date: Wed, 21 May 2025 16:29:13 -0400
Message-ID: <20250521204654.1610607-7-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In the future, we want to have the ability for a driver to have private gem
objects - or use gem objects across ffi boundaries that don't use our
driver's GEM object implementation. So, let's take some inspiration from
the KMS bindings I've been working on and introduce an OpaqueObject type.

This type can be used identically to a normal gem object, with the
exception that the private-data layout of the object is not known.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 61 +++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index f0029e6989ed6..aeec847b80aa7 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -6,13 +6,13 @@
 
 use crate::{
     alloc::flags::*,
-    bindings, drm,
+    bindings, drm::{self, private::Sealed},
     drm::driver::{AllocImpl, AllocOps},
     error::{to_result, Result},
     prelude::*,
     types::{ARef, AlwaysRefCounted, Opaque},
 };
-use core::{ops::Deref, ptr::NonNull};
+use core::{ops::Deref, ptr::NonNull, marker::PhantomData};
 
 /// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
 /// [`DriverObject`] implementation.
@@ -21,6 +21,26 @@
 /// [`DriverFile`]: drm::file::DriverFile
 pub type DriverFile<T> = drm::File<<<T as BaseDriverObject>::Driver as drm::Driver>::File>;
 
+/// A helper macro for implementing AsRef<OpaqueObject<…>>
+macro_rules! impl_as_opaque {
+    ($type:ty where $tparam:ident : $tparam_trait:ident) => {
+        impl<D, $tparam> core::convert::AsRef<kernel::drm::gem::OpaqueObject<D>> for $type
+        where
+            D: kernel::drm::driver::Driver,
+            Self: kernel::drm::gem::BaseDriverObject<Driver = D>,
+            Self: kernel::drm::gem::IntoGEMObject,
+            $tparam: $tparam_trait
+        {
+            fn as_ref(&self) -> &kernel::drm::gem::OpaqueObject<D> {
+                // SAFETY: This cast is safe via our type invariant.
+                unsafe { &*((self.as_raw().cast_const()).cast()) }
+            }
+        }
+    };
+}
+
+pub(crate) use impl_as_opaque;
+
 /// GEM object functions, which must be implemented by drivers.
 pub trait BaseDriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
@@ -49,7 +69,7 @@ fn close(_obj: &Self::Object, _file: &DriverFile<Self>) {}
 }
 
 /// Trait that represents a GEM object subtype
-pub trait IntoGEMObject: Sized + super::private::Sealed + AlwaysRefCounted {
+pub trait IntoGEMObject: Sized + Sealed + AlwaysRefCounted {
     /// Returns a reference to the raw `drm_gem_object` structure, which must be valid as long as
     /// this owning object is valid.
     fn as_raw(&self) -> *mut bindings::drm_gem_object;
@@ -297,7 +317,7 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
     }
 }
 
-impl<T: BaseDriverObject> super::private::Sealed for Object<T> {}
+impl<T: BaseDriverObject> Sealed for Object<T> {}
 
 impl<T: BaseDriverObject> Deref for Object<T> {
     type Target = T;
@@ -321,6 +341,39 @@ impl<T: BaseDriverObject> AllocImpl for Object<T> {
     };
 }
 
+impl_as_opaque!(Object<T> where T: BaseDriverObject);
+
+/// A GEM object whose private-data layout is not known.
+///
+/// Not all GEM objects are created equal, and subsequently drivers may occasionally need to deal
+/// with situations where they are working with a GEM object but have no knowledge of its
+/// private-data layout.
+///
+/// It may be used just like a normal [`Object`], with the exception that it cannot access
+/// driver-private data.
+///
+/// # Invariant
+///
+/// Via `#[repr(transparent)]`, this type is guaranteed to have an identical data layout to
+/// `struct drm_gem_object`.
+#[repr(transparent)]
+pub struct OpaqueObject<T: drm::Driver>(Opaque<bindings::drm_gem_object>, PhantomData<T>);
+
+impl<T: drm::Driver> IntoGEMObject for OpaqueObject<T> {
+    unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
+        // SAFETY:
+        // - This cast is safe via our type invariant.
+        // - `self_ptr` is guaranteed to be a valid pointer to a gem object by our safety contract.
+        unsafe { &*self_ptr.cast::<Self>().cast_const() }
+    }
+
+    fn as_raw(&self) -> *mut bindings::drm_gem_object {
+        self.0.get()
+    }
+}
+
+impl<D: drm::Driver> Sealed for OpaqueObject<D> {}
+
 pub(super) const fn create_fops() -> bindings::file_operations {
     // SAFETY: As by the type invariant, it is safe to initialize `bindings::file_operations`
     // zeroed.
-- 
2.49.0

