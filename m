Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5466BE5867
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 23:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D316510EA93;
	Thu, 16 Oct 2025 21:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UD2HIM9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5271010EA91
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 21:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760649022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ij7DcA7oc5twnKbfaM76zg6OO8Y5d6E9HxWw6kPrfy8=;
 b=UD2HIM9/hCA3qgIheHaEk+IWQQOR4kql/0IsbRs1DIthzhCQq4Csy0bGH3h1XtqR7XnW2g
 794hkPHj8E0V0vV5UVTlSUiRzKPV4ZVzzC4QrRB1m9cwmqOnrVn1ilWaYg2pt499Qe8cX0
 nBQKUAOAeSqH/s7yyqJ39zls+oF9I0k=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-YyiUp2BUOh2sxenhlo34EA-1; Thu,
 16 Oct 2025 17:10:18 -0400
X-MC-Unique: YyiUp2BUOh2sxenhlo34EA-1
X-Mimecast-MFC-AGG-ID: YyiUp2BUOh2sxenhlo34EA_1760649016
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2952F180122A; Thu, 16 Oct 2025 21:10:16 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.252])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6956F30001BC; Thu, 16 Oct 2025 21:10:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/9] rust/drm: Add gem::impl_aref_for_gem_obj!
Date: Thu, 16 Oct 2025 17:08:15 -0400
Message-ID: <20251016210955.2813186-3-lyude@redhat.com>
In-Reply-To: <20251016210955.2813186-1-lyude@redhat.com>
References: <20251016210955.2813186-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
---
 rust/kernel/drm/gem/mod.rs | 53 +++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 20c2769a8c9d6..981fbb931e952 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -15,6 +15,43 @@
 };
 use core::{ops::Deref, ptr::NonNull};
 
+/// A macro for implementing [`AlwaysRefCounted`] for any GEM object type.
+///
+/// Since all GEM objects use the same refcounting scheme.
+macro_rules! impl_aref_for_gem_obj {
+    (
+        impl $( <$( $tparam_id:ident ),+> )? for $type:ty
+        $(
+            where
+                $( $bind_param:path : $bind_trait:path ),+
+        )?
+    ) => {
+        // SAFETY: All gem objects are refcounted
+        unsafe impl $( <$( $tparam_id ),+> )? crate::types::AlwaysRefCounted for $type
+        $(
+            where
+                $( $bind_param : $bind_trait ),+
+        )?
+        {
+            fn inc_ref(&self) {
+                // SAFETY: The existence of a shared reference guarantees that the refcount is
+                // non-zero.
+                unsafe { bindings::drm_gem_object_get(self.as_raw()) };
+            }
+
+            unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
+                // SAFETY: `obj` is a valid pointer to an `Object<T>`.
+                let obj = unsafe { obj.as_ref() };
+
+                // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+                unsafe { bindings::drm_gem_object_put(obj.as_raw()) };
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
@@ -253,21 +290,7 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
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
2.51.0

