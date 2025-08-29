Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FBFB3C537
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 00:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF92810EC4E;
	Fri, 29 Aug 2025 22:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M+A5TitF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6EB10EC4E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 22:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756507383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ze5i6Pi0AsJ8OZnGY1zOw/cDXaH5xQ4ENMo0wMvIxrk=;
 b=M+A5TitFBmXy140/wY9M/jvnJ86/sjJr1TtRsSOmTc07JL9BhIAn5It5ZhxlKm7eooyeKO
 ZBcjwnTFvHv31jC0prLgCyjwMbFuT6Sm7xYKiEbH1l01r4InLlFqTdPtQvyCsBJAjA/d0l
 xIqoHQWIkS+CwmsYWGYRR0X54sfPXTQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-I9enlBaGM4CVqSLLlPdsZg-1; Fri,
 29 Aug 2025 18:42:57 -0400
X-MC-Unique: I9enlBaGM4CVqSLLlPdsZg-1
X-Mimecast-MFC-AGG-ID: I9enlBaGM4CVqSLLlPdsZg_1756507373
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4D75719560AD; Fri, 29 Aug 2025 22:42:53 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.78])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E951E18003FC; Fri, 29 Aug 2025 22:42:48 +0000 (UTC)
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
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina+kernel@asahilina.net>
Subject: [PATCH v3 11/14] rust: drm: gem: Introduce SGTableRef
Date: Fri, 29 Aug 2025 18:35:26 -0400
Message-ID: <20250829224116.477990-12-lyude@redhat.com>
In-Reply-To: <20250829224116.477990-1-lyude@redhat.com>
References: <20250829224116.477990-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

So to support this, let's introduce SGTableRef - which both holds a
pointer to the SGTable and a reference to its respective GEM object in
order to keep the GEM object alive for as long as the SGTableRef. The
type can be used identically to a normal SGTable.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Rename OwnedSGTable to SGTableRef. Since the current version of the
  SGTable abstractions now has a `Owned` and `Borrowed` variant, I think
  renaming this to SGTableRef makes things less confusing.
  We do however, keep the name of owned_sg_table() as-is.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 6a8a392c3691b..1437cda27a22c 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -178,6 +178,22 @@ pub fn sg_table(&self) -> Result<&scatterlist::SGTable> {
         Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
     }
 
+    /// Creates (if necessary) and returns an owned reference to a scatter-gather table of DMA pages
+    /// for this object.
+    ///
+    /// This is the same as [`sg_table`](Self::sg_table), except that it instead returns a
+    /// [`OwnedSGTable`] which holds a reference to the associated gem object.
+    ///
+    /// This will pin the object in memory.
+    pub fn owned_sg_table(&self) -> Result<SGTableRef<T>> {
+        Ok(SGTableRef {
+            sgt: self.sg_table()?.into(),
+            // INVARIANT: We take an owned refcount to `self` here, ensuring that `sgt` remains
+            // valid for as long as this `OwnedSGTable`.
+            _owner: self.into(),
+        })
+    }
+
     /// Creates and returns a virtual kernel memory mapping for this object.
     pub fn vmap(&self) -> Result<VMap<T>> {
         let mut map: MaybeUninit<bindings::iosys_map> = MaybeUninit::uninit();
@@ -309,3 +325,37 @@ fn drop(&mut self) {
 unsafe impl<T: DriverObject> Send for VMap<T> {}
 /// SAFETY: `iosys_map` objects are safe to send across threads.
 unsafe impl<T: DriverObject> Sync for VMap<T> {}
+
+/// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
+///
+/// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
+/// [`SGTable`] referenced by `SGTableRef` remains valid for the lifetime of this object.
+///
+/// # Invariants
+///
+/// - `sgt` is kept alive by `_owner`, ensuring it remains valid for as long as `Self`.
+/// - `sgt` corresponds to the owned object in `_owner`.
+/// - This object is only exposed in situations where we know the underlying `SGTable` will not be
+///   modified for the lifetime of this object.
+///
+/// [`SGTable`]: scatterlist::SGTable
+pub struct SGTableRef<T: DriverObject> {
+    sgt: NonNull<scatterlist::SGTable>,
+    _owner: ARef<Object<T>>,
+}
+
+// SAFETY: This object is only exposed in situations where we know the underlying `SGTable` will not
+// be modified for the lifetime of this object.
+unsafe impl<T: DriverObject> Send for SGTableRef<T> {}
+// SAFETY: This object is only exposed in situations where we know the underlying `SGTable` will not
+// be modified for the lifetime of this object.
+unsafe impl<T: DriverObject> Sync for SGTableRef<T> {}
+
+impl<T: DriverObject> Deref for SGTableRef<T> {
+    type Target = scatterlist::SGTable;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Creating an immutable reference to this is safe via our type invariants.
+        unsafe { self.sgt.as_ref() }
+    }
+}
-- 
2.50.0

