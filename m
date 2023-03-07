Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B696AE250
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EA210E4B2;
	Tue,  7 Mar 2023 14:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A92C10E4B2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:27:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id E7AF6424EB;
 Tue,  7 Mar 2023 14:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199252;
 bh=tiuyBWTl8Qdxvj79LVgsGFbR06YAjmOHoitbb98rzLA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=pQIUoDU+zvY4rYeN9Otpg73BvCX394ybfNniG50+pCGTU/dRQzMT0GNTyCUTJcoaF
 RuCPNmEqUTzp0gTrn+45EXTK7X2QBEnupjZrbnmdsvEZPpih7MsFnL5QFTX8FW7Kc9
 9VGU1FQjOdn2u08IylzPfQb120kGPd4BjesZwebSTj1+waUoiNLJUenkhaY6jZQ92s
 ozWFKoHyKSYwPX//CtaLhNDUABDjXC7dgtbgB83UozvJ0nGDFxMk/yIyutNqihzeDx
 eWtOIqOkRibkTJxe3W27ePR7Rn1BbGEWj0B3nqb0CUwX3+/XSl9hrfIh1f6CudPzC2
 a2Q0ItXbVVq7g==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:32 +0900
Subject: [PATCH RFC 07/18] rust: drm: mm: Add DRM MM Range Allocator
 abstraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-7-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=11527;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=tiuyBWTl8Qdxvj79LVgsGFbR06YAjmOHoitbb98rzLA=;
 b=1YWNy7i7Y7pqn4yADDd+wawlXS8A7BCpNq2HvNp13CJ6/glYN+hiWD6duc+ImAlFB7hpC4Nj5
 qKVdeJNweZNBkjTZR9M7ZwRdGs9mp0ON/OFHohmu5CGOmuAhGYSEnZ9
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_mm provides a simple range allocator, useful for managing virtual
address ranges. Add a Rust abstraction to expose this module to Rust
drivers.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/kernel/drm/mm.rs  | 309 +++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs |   1 +
 2 files changed, 310 insertions(+)

diff --git a/rust/kernel/drm/mm.rs b/rust/kernel/drm/mm.rs
new file mode 100644
index 000000000000..83e27a7dcc7e
--- /dev/null
+++ b/rust/kernel/drm/mm.rs
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM MM range allocator
+//!
+//! C header: [`include/linux/drm/drm_mm.h`](../../../../include/linux/drm/drm_mm.h)
+
+use crate::{
+    bindings,
+    error::{to_result, Result},
+    str::CStr,
+    sync::{Arc, LockClassKey, LockIniter, Mutex, UniqueArc},
+    types::Opaque,
+};
+
+use alloc::boxed::Box;
+
+use core::{
+    marker::{PhantomData, PhantomPinned},
+    ops::Deref,
+    pin::Pin,
+};
+
+/// Type alias representing a DRM MM node.
+pub type Node<A, T> = Pin<Box<NodeData<A, T>>>;
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
+pub struct NodeData<A: AllocInner<T>, T> {
+    node: bindings::drm_mm_node,
+    mm: Arc<Mutex<MmInner<A, T>>>,
+    valid: bool,
+    /// A drm_mm_node needs to be pinned because nodes reference each other in a linked list.
+    _pin: PhantomPinned,
+    inner: T,
+}
+
+// SAFETY: Allocator ops take the mutex, and there are no mutable actions on the node.
+unsafe impl<A: Send + AllocInner<T>, T: Send> Send for NodeData<A, T> {}
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
+impl<A: AllocInner<T>, T> NodeData<A, T> {
+    /// Returns the color of the node (an opaque value)
+    pub fn color(&self) -> usize {
+        self.node.color as usize
+    }
+
+    /// Returns the start address of the node
+    pub fn start(&self) -> u64 {
+        self.node.start
+    }
+
+    /// Returns the size of the node in bytes
+    pub fn size(&self) -> u64 {
+        self.node.size
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
+            unsafe { bindings::drm_mm_remove_node(&mut self.node) };
+        }
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
+    pub fn new(
+        start: u64,
+        size: u64,
+        inner: A,
+        name: &'static CStr,
+        lock_key: &'static LockClassKey,
+    ) -> Result<Allocator<A, T>> {
+        // SAFETY: We call `Mutex::init_lock` below.
+        let mut mm: Pin<UniqueArc<Mutex<MmInner<A, T>>>> = UniqueArc::try_new(unsafe {
+            Mutex::new(MmInner(Opaque::uninit(), inner, PhantomData))
+        })?
+        .into();
+
+        mm.as_mut().init_lock(name, lock_key);
+
+        unsafe {
+            // SAFETY: The Opaque instance provides a valid pointer, and it is initialized after
+            // this call.
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
+        let mut mm_node = Box::try_new(NodeData {
+            // SAFETY: This C struct should be zero-initialized.
+            node: unsafe { core::mem::zeroed() },
+            valid: false,
+            inner: node,
+            mm: self.mm.clone(),
+            _pin: PhantomPinned,
+        })?;
+
+        let guard = self.mm.lock();
+        // SAFETY: We hold the lock and all pointers are valid.
+        to_result(unsafe {
+            bindings::drm_mm_insert_node_in_range(
+                guard.0.get(),
+                &mut mm_node.node,
+                size,
+                alignment,
+                color as core::ffi::c_ulong,
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
+        let mut mm_node = Box::try_new(NodeData {
+            // SAFETY: This C struct should be zero-initialized.
+            node: unsafe { core::mem::zeroed() },
+            valid: false,
+            inner: node,
+            mm: self.mm.clone(),
+            _pin: PhantomPinned,
+        })?;
+
+        mm_node.node.start = start;
+        mm_node.node.size = size;
+        mm_node.node.color = color as core::ffi::c_ulong;
+
+        let guard = self.mm.lock();
+        // SAFETY: We hold the lock and all pointers are valid.
+        to_result(unsafe { bindings::drm_mm_reserve_node(guard.0.get(), &mut mm_node.node) })?;
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
+// MmInner is safely Send if the AllocInner user type is Send.
+unsafe impl<A: Send + AllocInner<T>, T> Send for MmInner<A, T> {}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index c44760a1332f..73fab2dee3af 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -7,3 +7,4 @@ pub mod drv;
 pub mod file;
 pub mod gem;
 pub mod ioctl;
+pub mod mm;

-- 
2.35.1

