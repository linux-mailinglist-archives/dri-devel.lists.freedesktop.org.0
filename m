Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F423AE55A0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 00:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B0410E474;
	Mon, 23 Jun 2025 22:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Ny52dreS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4730210E472
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 22:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750716779; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=K1j0Zgy09FLjJkBECueMZBV/vl1KJSGzrccGMXKa0hf5+aIHaNs8YPCKSI18k0OWpA7nonPYJf+50SW6KCzOe6PIgXlV025oUx4a0JX0lIjWLpwu32Nj+yCFwuTuG2Zwe2xaruybPMZpPXHYCaaFWvhAIt/KyLqk9f048zAR/HU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750716779;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=R/OPNWNuNU0gy1bLm311JcmJwmHKTXtpZ8cbHCqzFBs=; 
 b=DUKRSJnk357tKTeZN+20NosV7a1E9EyNQ15qc99io2gR9rk9rFtEvY0DCTG0tZHbJCGrows7RPleIdRI9eoVLZlE+KHOePc2/OBdMEI0FwVFimx8HZ7qnABo8cDJUqrrwd/nnUKsfXhF2j1xstbbDLrL4ZN/RrcQ/JJFbblEukQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750716779; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
 bh=R/OPNWNuNU0gy1bLm311JcmJwmHKTXtpZ8cbHCqzFBs=;
 b=Ny52dreSbhg3cbj71MwbqK0yRh+3XoZC38vUKCtLpO6AL7OsLLL0rpNdnRSgQdDj
 0I8/Aa33JuIvBCBPHoDvquUggk66/SVIrOLo6b6Yg2N/I1cSfSP+K68lwsiqDs46SIy
 5qBpjdkukMsUMVMMuSs6DE3VbnqztzfsexisZ5Eg=
Received: by mx.zohomail.com with SMTPS id 1750716776569246.03084252845588;
 Mon, 23 Jun 2025 15:12:56 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Jun 2025 19:12:45 -0300
Subject: [PATCH] rust: drm: mm: Add DRM MM Range Allocator abstraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-topics-tyr-drm_mm-v1-1-82fe8104a6f5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFzRWWgC/x2MQQqAIBAAvyJ7biG1OvSViAjdag9WrBKF9Pckm
 MscZjJEEqYIvcogdHHkYy+iKwVum/eVkH1xMLVp685YTMfJLmJ6BL2EKQT02je20FmtoXSn0ML
 3/xzG9/0AoXYv5WMAAAA=
X-Change-ID: 20250623-topics-tyr-drm_mm-d1d43d436311
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Asahi Lina <lina+kernel@asahilina.net>, 
 Asahi Lina <lina+kernel@asahilina.net>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External
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

From: Asahi Lina <lina+kernel@asahilina.net>

drm_mm provides a simple range allocator, useful for managing virtual
address ranges. Add a Rust abstraction to expose this module to Rust
drivers.

This code will be used by upcoming GPU drivers soon in order to manage
a range of memory reserved to the kernel driver. This includes some
kernel-managed objects as well as memory needed by the GPU hardware
itself.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
Changes from v0:
- Rebase on rust-next
- Use Opaque<T> as needed.
- Improve the docs
- Slightly reword the commit message to highligh how this will be used
  by new drivers
---
 rust/kernel/drm/mm.rs  | 333 +++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs |   1 +
 2 files changed, 334 insertions(+)

diff --git a/rust/kernel/drm/mm.rs b/rust/kernel/drm/mm.rs
new file mode 100644
index 0000000000000000000000000000000000000000..9536a97fc3831ace5d2f4d216c723d97c52f925c
--- /dev/null
+++ b/rust/kernel/drm/mm.rs
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM MM range allocator.
+//!
+//! The range allocator is frequently used to manage GPU memory. To do so,
+//! drivers have to insert nodes into the allocator. The presence of a node in
+//! the allocator indicates that the range it represents is currently taken.
+//!
+//! See [`DRM MM Range Allocator`](https://docs.kernel.org/gpu/drm-mm.html#drm-mm-range-allocator)
+//! for more information.
+//!
+//! C header: [`include/drm/drm_mm.h`](srctree/include/drm/drm_mm.h)
+
+use crate::{
+    alloc::flags::*,
+    bindings,
+    error::{to_result, Result},
+    new_mutex,
+    sync::{Arc, Mutex, UniqueArc},
+    types::Opaque,
+};
+
+use crate::init::InPlaceInit;
+use crate::prelude::KBox;
+
+use core::{
+    marker::{PhantomData, PhantomPinned},
+    ops::Deref,
+    pin::Pin,
+};
+
+/// Type alias representing a DRM MM node.
+pub type Node<A, T> = Pin<KBox<NodeData<A, T>>>;
+
+/// Trait which must be implemented by the inner allocator state type provided by the user.
+pub trait AllocInner<T> {
+    /// Notification that a node was dropped from the allocator.
+    fn drop_object(&mut self, _start: u64, _size: u64, _color: usize, _object: &mut T) {}
+}
+
+impl<T> AllocInner<T> for () {}
+
+/// Wrapper type for a `struct drm_mm` plus user AllocInner object.
+///
+/// # Invariants
+/// The `drm_mm` struct is valid and initialized.
+struct MmInner<A: AllocInner<T>, T>(Opaque<bindings::drm_mm>, A, PhantomData<T>);
+
+/// Represents a single allocated node in the MM allocator
+///
+/// # Invariants
+///
+/// - `node` points to a valid `drm_mm_node` struct, which is initialized when
+///   the node is inserted in the allocator, and inserting a node is the only way
+///   to create a `NodeData`, therefore `node` is always valid.
+pub struct NodeData<A: AllocInner<T>, T> {
+    node: Opaque<bindings::drm_mm_node>,
+    mm: Arc<Mutex<MmInner<A, T>>>,
+    valid: bool,
+    /// A drm_mm_node needs to be pinned because nodes reference each other in a linked list.
+    _pin: PhantomPinned,
+    inner: T,
+}
+
+impl<A: AllocInner<T>, T> NodeData<A, T> {
+    /// Returns the color of the node (an opaque value)
+    #[inline]
+    pub fn color(&self) -> usize {
+        // SAFETY: Safe as per the type invariants of `NodeData`.
+        unsafe { *self.node.get() }.color
+    }
+
+    /// Returns the start address of the node
+    #[inline]
+    pub fn start(&self) -> u64 {
+        // SAFETY: Safe as per the type invariants of `NodeData`.
+        unsafe { *self.node.get() }.start
+    }
+
+    /// Returns the size of the node in bytes
+    #[inline]
+    pub fn size(&self) -> u64 {
+        // SAFETY: Safe as per the type invariants of `NodeData`.
+        unsafe { *self.node.get() }.size
+    }
+
+    /// Operate on the user `AllocInner<T>` implementation associated with this node's allocator.
+    pub fn with_inner<RetVal>(&self, cb: impl FnOnce(&mut A) -> RetVal) -> RetVal {
+        let mut l = self.mm.lock();
+        cb(&mut l.1)
+    }
+
+    /// Return a clonable, detached reference to the allocator inner data.
+    pub fn alloc_ref(&self) -> InnerRef<A, T> {
+        InnerRef(self.mm.clone())
+    }
+
+    /// Return a mutable reference to the inner data.
+    pub fn inner_mut(self: Pin<&mut Self>) -> &mut T {
+        // SAFETY: This is okay because inner is not structural
+        unsafe { &mut self.get_unchecked_mut().inner }
+    }
+}
+
+impl<A: AllocInner<T>, T> Deref for NodeData<A, T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}
+
+impl<A: AllocInner<T>, T> Drop for NodeData<A, T> {
+    fn drop(&mut self) {
+        if self.valid {
+            let mut guard = self.mm.lock();
+
+            // Inform the user allocator that a node is being dropped.
+            guard
+                .1
+                .drop_object(self.start(), self.size(), self.color(), &mut self.inner);
+            // SAFETY: The MM lock is still taken, so we can safely remove the node.
+            unsafe { bindings::drm_mm_remove_node(self.node.get()) };
+        }
+    }
+}
+
+// SAFETY: Allocator ops take the mutex, and there are no mutable actions on the node.
+unsafe impl<A: Send + AllocInner<T>, T: Send> Send for NodeData<A, T> {}
+// SAFETY: Allocator ops take the mutex, and there are no mutable actions on the node.
+unsafe impl<A: Send + AllocInner<T>, T: Sync> Sync for NodeData<A, T> {}
+
+/// Available MM node insertion modes
+#[repr(u32)]
+pub enum InsertMode {
+    /// Search for the smallest hole (within the search range) that fits the desired node.
+    ///
+    /// Allocates the node from the bottom of the found hole.
+    Best = bindings::drm_mm_insert_mode_DRM_MM_INSERT_BEST,
+
+    /// Search for the lowest hole (address closest to 0, within the search range) that fits the
+    /// desired node.
+    ///
+    /// Allocates the node from the bottom of the found hole.
+    Low = bindings::drm_mm_insert_mode_DRM_MM_INSERT_LOW,
+
+    /// Search for the highest hole (address closest to U64_MAX, within the search range) that fits
+    /// the desired node.
+    ///
+    /// Allocates the node from the top of the found hole. The specified alignment for the node is
+    /// applied to the base of the node (`Node.start()`).
+    High = bindings::drm_mm_insert_mode_DRM_MM_INSERT_HIGH,
+
+    /// Search for the most recently evicted hole (within the search range) that fits the desired
+    /// node. This is appropriate for use immediately after performing an eviction scan and removing
+    /// the selected nodes to form a hole.
+    ///
+    /// Allocates the node from the bottom of the found hole.
+    Evict = bindings::drm_mm_insert_mode_DRM_MM_INSERT_EVICT,
+}
+
+/// A clonable, interlocked reference to the allocator state.
+///
+/// This is useful to perform actions on the user-supplied `AllocInner<T>` type given just a Node,
+/// without immediately taking the lock.
+#[derive(Clone)]
+pub struct InnerRef<A: AllocInner<T>, T>(Arc<Mutex<MmInner<A, T>>>);
+
+impl<A: AllocInner<T>, T> InnerRef<A, T> {
+    /// Operate on the user `AllocInner<T>` implementation, taking the lock.
+    pub fn with<RetVal>(&self, cb: impl FnOnce(&mut A) -> RetVal) -> RetVal {
+        let mut l = self.0.lock();
+        cb(&mut l.1)
+    }
+}
+
+/// An instance of a DRM MM range allocator.
+pub struct Allocator<A: AllocInner<T>, T> {
+    mm: Arc<Mutex<MmInner<A, T>>>,
+    _p: PhantomData<T>,
+}
+
+impl<A: AllocInner<T>, T> Allocator<A, T> {
+    /// Create a new range allocator for the given start and size range of addresses.
+    ///
+    /// The user may optionally provide an inner object representing allocator state, which will
+    /// be protected by the same lock. If not required, `()` can be used.
+    #[track_caller]
+    pub fn new(start: u64, size: u64, inner: A) -> Result<Allocator<A, T>> {
+        let mm = UniqueArc::pin_init(
+            new_mutex!(MmInner(Opaque::uninit(), inner, PhantomData)),
+            GFP_KERNEL,
+        )?;
+
+        // SAFETY: The Opaque instance provides a valid pointer, and it is initialized after
+        // this call.
+        unsafe {
+            bindings::drm_mm_init(mm.lock().0.get(), start, size);
+        }
+
+        Ok(Allocator {
+            mm: mm.into(),
+            _p: PhantomData,
+        })
+    }
+
+    /// Insert a new node into the allocator of a given size.
+    ///
+    /// `node` is the user `T` type data to store into the node.
+    pub fn insert_node(&mut self, node: T, size: u64) -> Result<Node<A, T>> {
+        self.insert_node_generic(node, size, 0, 0, InsertMode::Best)
+    }
+
+    /// Insert a new node into the allocator of a given size, with configurable alignment,
+    /// color, and insertion mode.
+    ///
+    /// `node` is the user `T` type data to store into the node.
+    pub fn insert_node_generic(
+        &mut self,
+        node: T,
+        size: u64,
+        alignment: u64,
+        color: usize,
+        mode: InsertMode,
+    ) -> Result<Node<A, T>> {
+        self.insert_node_in_range(node, size, alignment, color, 0, u64::MAX, mode)
+    }
+
+    /// Insert a new node into the allocator of a given size, with configurable alignment,
+    /// color, insertion mode, and sub-range to allocate from.
+    ///
+    /// `node` is the user `T` type data to store into the node.
+    #[allow(clippy::too_many_arguments)]
+    pub fn insert_node_in_range(
+        &mut self,
+        node: T,
+        size: u64,
+        alignment: u64,
+        color: usize,
+        start: u64,
+        end: u64,
+        mode: InsertMode,
+    ) -> Result<Node<A, T>> {
+        let mut mm_node = KBox::new(
+            NodeData {
+                // SAFETY: This C struct should be zero-initialized.
+                node: unsafe { core::mem::zeroed() },
+                valid: false,
+                inner: node,
+                mm: self.mm.clone(),
+                _pin: PhantomPinned,
+            },
+            GFP_KERNEL,
+        )?;
+
+        let guard = self.mm.lock();
+        // SAFETY: We hold the lock and all pointers are valid.
+        to_result(unsafe {
+            bindings::drm_mm_insert_node_in_range(
+                guard.0.get(),
+                mm_node.node.get(),
+                size,
+                alignment,
+                color,
+                start,
+                end,
+                mode as u32,
+            )
+        })?;
+
+        mm_node.valid = true;
+
+        Ok(Pin::from(mm_node))
+    }
+
+    /// Insert a node into the allocator at a fixed start address.
+    ///
+    /// `node` is the user `T` type data to store into the node.
+    pub fn reserve_node(
+        &mut self,
+        node: T,
+        start: u64,
+        size: u64,
+        color: usize,
+    ) -> Result<Node<A, T>> {
+        let mut mm_node = KBox::new(
+            NodeData {
+                // SAFETY: This C struct should be zero-initialized.
+                node: unsafe { core::mem::zeroed() },
+                valid: false,
+                inner: node,
+                mm: self.mm.clone(),
+                _pin: PhantomPinned,
+            },
+            GFP_KERNEL,
+        )?;
+
+        {
+            // SAFETY: It is safe to fabricate a &mut reference here.
+            let mm_node = unsafe { &mut *mm_node.node.get() };
+            mm_node.start = start;
+            mm_node.size = size;
+            mm_node.color = color;
+        }
+
+        let guard = self.mm.lock();
+        // SAFETY: We hold the lock and all pointers are valid.
+        to_result(unsafe { bindings::drm_mm_reserve_node(guard.0.get(), mm_node.node.get()) })?;
+
+        mm_node.valid = true;
+
+        Ok(Pin::from(mm_node))
+    }
+
+    /// Operate on the inner user type `A`, taking the allocator lock
+    pub fn with_inner<RetVal>(&self, cb: impl FnOnce(&mut A) -> RetVal) -> RetVal {
+        let mut guard = self.mm.lock();
+        cb(&mut guard.1)
+    }
+}
+
+impl<A: AllocInner<T>, T> Drop for MmInner<A, T> {
+    fn drop(&mut self) {
+        // SAFETY: If the MmInner is dropped then all nodes are gone (since they hold references),
+        // so it is safe to tear down the allocator.
+        unsafe {
+            bindings::drm_mm_takedown(self.0.get());
+        }
+    }
+}
+
+// SAFETY: MmInner is safely Send if the AllocInner user type is Send.
+unsafe impl<A: Send + AllocInner<T>, T> Send for MmInner<A, T> {}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 1b82b6945edf25b947afc08300e211bd97150d6b..f369da5b12fb876f23eda8ea7665990919f3960c 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -7,6 +7,7 @@
 pub mod file;
 pub mod gem;
 pub mod ioctl;
+pub mod mm;
 
 pub use self::device::Device;
 pub use self::driver::Driver;

---
base-commit: dc35ddcf97e99b18559d0855071030e664aae44d
change-id: 20250623-topics-tyr-drm_mm-d1d43d436311

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

