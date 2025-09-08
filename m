Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E342DB49CB3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 00:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5149110E5F6;
	Mon,  8 Sep 2025 22:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LlHL83Tn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55B610E5F6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 22:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757369236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dKR3M+u2UbhgI9ZzLhPjRhOHXsTKC9RJaF9aymRCG+M=;
 b=LlHL83TnXhMIv9KRWX6wIskfX2/7xZ/Bv84fVmo/wDeLr86lLQLZXVv70VJkEHFBMlCP9e
 FjUViiW9SqGYxyHBBa2uBDvmrYJjdmChKCiBivkxzddHk5V7DEmCqvyVCg98POAvdF3ldi
 UXNY+mKoFeJrCX+HWcGpG7DH6uTyEXA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-3ydI1IEgPEucyGfw7RBkRQ-1; Mon,
 08 Sep 2025 18:07:13 -0400
X-MC-Unique: 3ydI1IEgPEucyGfw7RBkRQ-1
X-Mimecast-MFC-AGG-ID: 3ydI1IEgPEucyGfw7RBkRQ_1757369230
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E507C1800365; Mon,  8 Sep 2025 22:07:09 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.41])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BBBC41800452; Mon,  8 Sep 2025 22:07:05 +0000 (UTC)
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
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina+kernel@asahilina.net>
Subject: [PATCH 1/2] Partially revert "rust: drm: gem: Implement
 AlwaysRefCounted for all gem objects automatically"
Date: Mon,  8 Sep 2025 18:04:44 -0400
Message-ID: <20250908220657.165715-2-lyude@redhat.com>
In-Reply-To: <20250908220657.165715-1-lyude@redhat.com>
References: <20250908220657.165715-1-lyude@redhat.com>
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

I made a very silly mistake with this commit that managed to slip by
because I forgot to mzke sure rvkms was rebased before testing my work last
- we can't do blanket implementations like this due to rust's orphan rule.

The code -does- build just fine right now, but it doesn't with the ongoing
bindings for gem shmem. So, just revert this and we'll introduce a macro
for implementing AlwaysRefCounted individually for each type of gem
implementation.

Note that we leave the IntoGEMObject since it is true that all gem objects
are refcounted, so any implementations that are added should be
implementing AlwaysRefCounted anyhow.

This reverts commit 38cb08c3fcd3f3b1d0225dcec8ae50fab5751549.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index fd872de3b6695..af92f2d46d8d8 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -54,26 +54,6 @@ pub trait IntoGEMObject: Sized + super::private::Sealed + AlwaysRefCounted {
     unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self;
 }
 
-// SAFETY: All gem objects are refcounted.
-unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
-    }
-
-    unsafe fn dec_ref(obj: NonNull<Self>) {
-        // SAFETY: We either hold the only refcount on `obj`, or one of many - meaning that no one
-        // else could possibly hold a mutable reference to `obj` and thus this immutable reference
-        // is safe.
-        let obj = unsafe { obj.as_ref() }.as_raw();
-
-        // SAFETY:
-        // - The safety requirements guarantee that the refcount is non-zero.
-        // - We hold no references to `obj` now, making it safe for us to potentially deallocate it.
-        unsafe { bindings::drm_gem_object_put(obj) };
-    }
-}
-
 extern "C" fn open_callback<T: DriverObject>(
     raw_obj: *mut bindings::drm_gem_object,
     raw_file: *mut bindings::drm_file,
@@ -272,6 +252,22 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
     }
 }
 
+// SAFETY: Instances of `Object<T>` are always reference-counted.
+unsafe impl<T: DriverObject> crate::types::AlwaysRefCounted for Object<T> {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: `obj` is a valid pointer to an `Object<T>`.
+        let obj = unsafe { obj.as_ref() };
+
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::drm_gem_object_put(obj.as_raw()) }
+    }
+}
+
 impl<T: DriverObject> super::private::Sealed for Object<T> {}
 
 impl<T: DriverObject> Deref for Object<T> {
-- 
2.51.0

