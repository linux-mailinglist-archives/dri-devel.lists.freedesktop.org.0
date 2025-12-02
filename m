Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815D8C9D298
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 23:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D063B10E6EB;
	Tue,  2 Dec 2025 22:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GDXm3r9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C273E10E6A7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 22:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764713433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wF8onqTSydFf9NeQRKuX4lDngt1xHIbA7KxQuLsqkCE=;
 b=GDXm3r9+36JSFXACOC2tubz6xGFou5YkVil6orX2VdDra1brmzDt5S1lFyaAHlIe65XS+L
 7ACDb7ZAdtL4t168uRglNJJXP2dIrElajiPOtbRujv2MQiTTAP5XmGQ8dVK3EWrCCRFBYn
 1QDQT+gsE7tal3VMjC94amekjyR2Og8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-5UX4dJqpMFKdVUOGxN7BeA-1; Tue,
 02 Dec 2025 17:10:28 -0500
X-MC-Unique: 5UX4dJqpMFKdVUOGxN7BeA-1
X-Mimecast-MFC-AGG-ID: 5UX4dJqpMFKdVUOGxN7BeA_1764713426
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A58D7180009D; Tue,  2 Dec 2025 22:10:25 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.109])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B007919560A7; Tue,  2 Dec 2025 22:10:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>,
 Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v6 1/8] rust/drm: Add gem::impl_aref_for_gem_obj!
Date: Tue,  2 Dec 2025 17:03:27 -0500
Message-ID: <20251202220924.520644-2-lyude@redhat.com>
In-Reply-To: <20251202220924.520644-1-lyude@redhat.com>
References: <20251202220924.520644-1-lyude@redhat.com>
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

In the future we're going to be introducing more GEM object types in rust
then just gem::Object<T>. Since all types of GEM objects have refcounting,
let's introduce a macro that we can use in the gem crate in order to copy
this boilerplate implementation for each type: impl_aref_for_gem_obj!().

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

---
V5:
* Move .as_raw() call to `let obj` in dec_ref, to ensure that the reference
  to object is not live by the time that we call drm_gem_object_put().
* Add missing #[macro_export] annotation
V6:
* Add missing IntoGEMObject trait bound

 rust/kernel/drm/gem/mod.rs | 53 +++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index a7f682e95c018..5c215e83c1b09 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -15,6 +15,43 @@
 };
 use core::{ops::Deref, ptr::NonNull};
 
+/// A macro for implementing [`AlwaysRefCounted`] for any GEM object type.
+///
+/// Since all GEM objects use the same refcounting scheme.
+#[macro_export]
+macro_rules! impl_aref_for_gem_obj {
+    (
+        impl $( <$( $tparam_id:ident ),+> )? for $type:ty
+        $(
+            where
+                $( $bind_param:path : $bind_trait:path ),+
+        )?
+    ) => {
+        // SAFETY: All gem objects are refcounted
+        unsafe impl $( <$( $tparam_id ),+> )? $crate::types::AlwaysRefCounted for $type
+        where
+            Self: IntoGEMObject,
+            $( $( $bind_param : $bind_trait ),+ )?
+        {
+            fn inc_ref(&self) {
+                // SAFETY: The existence of a shared reference guarantees that the refcount is
+                // non-zero.
+                unsafe { bindings::drm_gem_object_get(self.as_raw()) };
+            }
+
+            unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
+                // SAFETY: `obj` is a valid pointer to an `Object<T>`.
+                let obj = unsafe { obj.as_ref() }.as_raw();
+
+                // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+                unsafe { bindings::drm_gem_object_put(obj) };
+            }
+        }
+    };
+}
+
+pub(crate) use impl_aref_for_gem_obj;
+
 /// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
 /// [`DriverObject`] implementation.
 ///
@@ -252,21 +289,7 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
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
+impl_aref_for_gem_obj!(impl<T> for Object<T> where T: DriverObject);
 
 impl<T: DriverObject> super::private::Sealed for Object<T> {}
 
-- 
2.52.0

