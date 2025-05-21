Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2720ABFE5C
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 22:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6112910E791;
	Wed, 21 May 2025 20:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZjlyCgSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70E910E791
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 20:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747860508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B07NYKKXvANlIZfpwmKg8iAUTUr0H/iCuFhmRkbUJU8=;
 b=ZjlyCgSsJtVOdy0WAX/xPjBriq9HqZNtqmuOscqGbBndNomezQSXAWGq8+EOejryz3VaIH
 fclqdPRHqEEXekw+mNj2hKbv8abmWyCfzwRIqCwmYOv5dpxNqrr2JzzD+COrnRpjsKC7Ha
 CtcFbrnj5VgoUItTxyIcbhBnCsvRyMA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-YbFIHZ_dMxi94vPwO_OTsw-1; Wed,
 21 May 2025 16:48:26 -0400
X-MC-Unique: YbFIHZ_dMxi94vPwO_OTsw-1
X-Mimecast-MFC-AGG-ID: YbFIHZ_dMxi94vPwO_OTsw_1747860503
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A841819560AA; Wed, 21 May 2025 20:48:23 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A2D601956066; Wed, 21 May 2025 20:48:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
 Danilo Krummrich <dakr@kernel.org>, Asahi Lina <lina@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v2 09/12] rust: drm: gem: Introduce OwnedSGTable
Date: Wed, 21 May 2025 16:29:16 -0400
Message-ID: <20250521204654.1610607-10-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
MIME-Version: 1.0
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

Currently we expose the ability to retrieve an SGTable for an shmem gem
object using gem::shmem::Object::<T>::sg_table(). However, this only gives us a
borrowed reference. This being said - retrieving an SGTable is a fallible
operation, and as such it's reasonable that a driver may want to hold
onto an SGTable for longer then a reference would allow in order to avoid
having to deal with fallibility every time they want to access the SGTable.
One such driver with this usecase is the Asahi driver.

So to support this, let's introduce OwnedSGTable - which both holds a
pointer to the SGTable and a reference to its respective GEM object in
order to keep the GEM object alive for as long as the OwnedSGTable. The
type can be used identically to a normal SGTable.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index c38fca715429e..bff038df93334 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -20,7 +20,7 @@
     prelude::*,
     types::{ARef, Opaque},
     container_of,
-    scatterlist,
+    scatterlist::SGTable,
 };
 use core::{
     mem::MaybeUninit,
@@ -172,23 +172,36 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
         let _ = unsafe { KBox::from_raw(this) };
     }
 
-    /// Creates (if necessary) and returns a scatter-gather table of DMA pages for this object.
+    /// Creates (if necessary) and returns an immutable reference to a scatter-gather table of DMA
+    /// pages for this object.
     ///
     /// This will pin the object in memory.
-    pub fn sg_table(&self) -> Result<SGTable<T>> {
+    #[inline]
+    pub fn sg_table(&self) -> Result<&SGTable> {
         // SAFETY:
         // - drm_gem_shmem_get_pages_sgt is thread-safe.
         // - drm_gem_shmem_get_pages_sgt returns either a valid pointer to a scatterlist, or an
         //   error pointer.
         let sgt = from_err_ptr(unsafe { bindings::drm_gem_shmem_get_pages_sgt(self.as_shmem()) })?;
 
-        Ok(SGTable {
-            // SAFETY: We checked that `sgt` is not an error pointer, so it must be a valid pointer
-            // to a scatterlist.
-            sgt: NonNull::from(unsafe { scatterlist::SGTable::as_ref(sgt) }),
+        // SAFETY: We checked above that `sgt` is not an error pointer, so it must be a valid
+        // pointer to a scatterlist
+        Ok(unsafe { SGTable::as_ref(sgt) })
+    }
+
+    /// Creates (if necessary) and returns an owned scatter-gather table of DMA pages for this
+    /// object.
+    ///
+    /// This is the same as [`sg_table`](Self::sg_table), except that it instead returns a
+    /// [`OwnedSGTable`] which holds a reference to the associated gem object.
+    ///
+    /// This will pin the object in memory.
+    pub fn owned_sg_table(&self) -> Result<OwnedSGTable<T>> {
+        Ok(OwnedSGTable {
+            sgt: self.sg_table()?.into(),
             // INVARIANT: We take an owned refcount to `self` here, ensuring that `sgt` remains
             // valid for as long as this `OwnedSGTable`.
-            _owner: self.into()
+            _owner: self.into(),
         })
     }
 
-- 
2.49.0

