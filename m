Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0EBC0389D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 23:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E012210E955;
	Thu, 23 Oct 2025 21:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wku3xsBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33F110E955
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 21:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761254812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zAmyMgT9xxjxNHcsyNCmwAK+5c4B/XqUwz4L+lbngcI=;
 b=Wku3xsBaC0ouQrhTHzmeurcycAVH6+gMi5Gey1UEKJQyFGgX9OTs9zWTEG4V957bwlE84D
 Th4RHLQQoIsw8mygzkstFeRTM05iDhvAMRt0FBZ8EI71zrzgQmMfxeCZz8CGREL6CHwW8i
 KlDfOsP/S1aRhdCKfN8vHqxwQ70x0Ag=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-R200hXuuNxel_l9nS5WQ3w-1; Thu,
 23 Oct 2025 17:26:47 -0400
X-MC-Unique: R200hXuuNxel_l9nS5WQ3w-1
X-Mimecast-MFC-AGG-ID: R200hXuuNxel_l9nS5WQ3w_1761254803
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 43E461975AF7; Thu, 23 Oct 2025 21:26:43 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.64.235])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5178230002FC; Thu, 23 Oct 2025 21:26:39 +0000 (UTC)
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
 Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>
Subject: [PATCH v5 6/8] rust: drm: gem: Introduce shmem::SGTable
Date: Thu, 23 Oct 2025 17:22:08 -0400
Message-ID: <20251023212540.1141999-7-lyude@redhat.com>
In-Reply-To: <20251023212540.1141999-1-lyude@redhat.com>
References: <20251023212540.1141999-1-lyude@redhat.com>
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

Currently we expose the ability to retrieve an SGTable for an shmem gem
object using gem::shmem::Object::<T>::sg_table(). However, this only gives
us a borrowed reference. This being said - retrieving an SGTable is a
fallible operation, and as such it's reasonable that a driver may want to
hold onto an SGTable for longer then a reference would allow in order to
avoid having to deal with fallibility every time they want to access the
SGTable. One such driver with this usecase is the Asahi driver.

So to support this, let's introduce shmem::SGTable - which both holds a
pointer to the SGTable and a reference to its respective GEM object in
order to keep the GEM object alive for as long as the shmem::SGTable. The
type can be used identically to a normal SGTable.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Rename OwnedSGTable to shmem::SGTable. Since the current version of the
  SGTable abstractions now has a `Owned` and `Borrowed` variant, I think
  renaming this to shmem::SGTable makes things less confusing.
  We do however, keep the name of owned_sg_table() as-is.
V4:
* Clarify safety comments for SGTable to explain why the object is
  thread-safe.
* Rename from SGTableRef to SGTable

 rust/kernel/drm/gem/shmem.rs | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 45b95d60a3ec7..21ccb6c1824be 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -173,6 +173,25 @@ pub fn sg_table(&self) -> Result<&scatterlist::SGTable> {
         // pointer to a scatterlist
         Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
     }
+
+    /// Creates (if necessary) and returns an owned reference to a scatter-gather table of DMA pages
+    /// for this object.
+    ///
+    /// This is the same as [`sg_table`](Self::sg_table), except that it instead returns an
+    /// [`shmem::SGTable`] which holds a reference to the associated gem object, instead of a
+    /// reference to an [`scatterlist::SGTable`].
+    ///
+    /// This will pin the object in memory.
+    ///
+    /// [`shmem::SGTable`]: SGTable
+    pub fn owned_sg_table(&self) -> Result<SGTable<T>> {
+        Ok(SGTable {
+            sgt: self.sg_table()?.into(),
+            // INVARIANT: We take an owned refcount to `self` here, ensuring that `sgt` remains
+            // valid for as long as this `SGTable`.
+            _owner: self.into(),
+        })
+    }
 }
 
 impl<T: DriverObject> Deref for Object<T> {
@@ -223,3 +242,34 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
         dumb_map_offset: None,
     };
 }
+
+/// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
+///
+/// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
+/// [`scatterlist::SGTable`] referenced by this type remains valid for the lifetime of this object.
+///
+/// # Invariants
+///
+/// - `sgt` is kept alive by `_owner`, ensuring it remains valid for as long as `Self`.
+/// - `sgt` corresponds to the owned object in `_owner`.
+/// - This object is only exposed in situations where we know the underlying `SGTable` will not be
+///   modified for the lifetime of this object. Thus, it is safe to send/access this type across
+///   threads.
+pub struct SGTable<T: DriverObject> {
+    sgt: NonNull<scatterlist::SGTable>,
+    _owner: ARef<Object<T>>,
+}
+
+// SAFETY: This object is thread-safe via our type invariants.
+unsafe impl<T: DriverObject> Send for SGTable<T> {}
+// SAFETY: This object is thread-safe via our type invariants.
+unsafe impl<T: DriverObject> Sync for SGTable<T> {}
+
+impl<T: DriverObject> Deref for SGTable<T> {
+    type Target = scatterlist::SGTable;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Creating an immutable reference to this is safe via our type invariants.
+        unsafe { self.sgt.as_ref() }
+    }
+}
-- 
2.51.0

