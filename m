Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD87B1741F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7316510E48C;
	Thu, 31 Jul 2025 15:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lSW3jS9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF6310E48C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:49:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 106C7A55481;
 Thu, 31 Jul 2025 15:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538FDC4CEFB;
 Thu, 31 Jul 2025 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753976976;
 bh=Ocb1NOgQl74B18can9Y+UZgv0q32Y4dyFqG+Vs8rtHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lSW3jS9pAFF4r+5a4P3adZuyRu69mYynP+fGwHmQINZf6iHMUIV1er69DyJR+z6Xt
 IxSMgZC1paJiWDzLaVVEQXtuz/qiGXKd6dmASOWX1G/8OpTVmU2OopKUvMv3+08CA0
 8bNqLr6t+HFS9c2VoyAtcwgR8zDE4vF+upWg7myYTFxOwgV7OleMphRm5MoBCqENx0
 /nRw8PWhwaGfXmppVBg6tt9MZ9uFBAlKUaoNcR1k5k/opaOWpCFX06HlIZu4/eIxD0
 phTbYqFklM84ioz4DQbhuL5+DqoqMhmlyet+L+Qc/gjF+RjF7ef8/OOAEXh1SDgBQp
 +bPEBOcNy900Q==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/4] rust: alloc: replace aligned_size() with
 Kmalloc::aligned_layout()
Date: Thu, 31 Jul 2025 17:48:06 +0200
Message-ID: <20250731154919.4132-2-dakr@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250731154919.4132-1-dakr@kernel.org>
References: <20250731154919.4132-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

aligned_size() dates back to when Rust did support kmalloc() only, but
is now used in ReallocFunc::call() and hence for all allocators.

However, the additional padding applied by aligned_size() is only
required by the kmalloc() allocator backend.

Hence, replace aligned_size() with Kmalloc::aligned_layout() and use it
for the affected allocators, i.e. kmalloc() and kvmalloc(), only.

While at it, make Kmalloc::aligned_layout() public, such that Rust
abstractions, which have to call subsystem specific kmalloc() based
allocation primitives directly, can make use of it.

Fixes: 8a799831fc63 ("rust: alloc: implement `ReallocFunc`")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/allocator.rs | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index aa2dfa9dca4c..3331ef338f3b 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -43,17 +43,6 @@
 /// For more details see [self].
 pub struct KVmalloc;
 
-/// Returns a proper size to alloc a new object aligned to `new_layout`'s alignment.
-fn aligned_size(new_layout: Layout) -> usize {
-    // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
-    let layout = new_layout.pad_to_align();
-
-    // Note that `layout.size()` (after padding) is guaranteed to be a multiple of `layout.align()`
-    // which together with the slab guarantees means the `krealloc` will return a properly aligned
-    // object (see comments in `kmalloc()` for more information).
-    layout.size()
-}
-
 /// # Invariants
 ///
 /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
@@ -88,7 +77,7 @@ unsafe fn call(
         old_layout: Layout,
         flags: Flags,
     ) -> Result<NonNull<[u8]>, AllocError> {
-        let size = aligned_size(layout);
+        let size = layout.size();
         let ptr = match ptr {
             Some(ptr) => {
                 if old_layout.size() == 0 {
@@ -123,6 +112,17 @@ unsafe fn call(
     }
 }
 
+impl Kmalloc {
+    /// Returns a [`Layout`] that makes [`Kmalloc`] fulfill the requested size and alignment of
+    /// `layout`.
+    pub const fn aligned_layout(layout: Layout) -> Layout {
+        // Note that `layout.size()` (after padding) is guaranteed to be a multiple of
+        // `layout.align()` which together with the slab guarantees means that `Kmalloc` will return
+        // a properly aligned object (see comments in `kmalloc()` for more information).
+        layout.pad_to_align()
+    }
+}
+
 // SAFETY: `realloc` delegates to `ReallocFunc::call`, which guarantees that
 // - memory remains valid until it is explicitly freed,
 // - passing a pointer to a valid memory allocation is OK,
@@ -135,6 +135,8 @@ unsafe fn realloc(
         old_layout: Layout,
         flags: Flags,
     ) -> Result<NonNull<[u8]>, AllocError> {
+        let layout = Kmalloc::aligned_layout(layout);
+
         // SAFETY: `ReallocFunc::call` has the same safety requirements as `Allocator::realloc`.
         unsafe { ReallocFunc::KREALLOC.call(ptr, layout, old_layout, flags) }
     }
@@ -176,6 +178,10 @@ unsafe fn realloc(
         old_layout: Layout,
         flags: Flags,
     ) -> Result<NonNull<[u8]>, AllocError> {
+        // `KVmalloc` may use the `Kmalloc` backend, hence we have to enforce a `Kmalloc`
+        // compatible layout.
+        let layout = Kmalloc::aligned_layout(layout);
+
         // TODO: Support alignments larger than PAGE_SIZE.
         if layout.align() > bindings::PAGE_SIZE {
             pr_warn!("KVmalloc does not support alignments larger than PAGE_SIZE yet.\n");
-- 
2.50.0

