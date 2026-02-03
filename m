Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEUuA3mugWn0IQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:14:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB91D612D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C7110E568;
	Tue,  3 Feb 2026 08:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ah6zZfOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4291610E54C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 08:14:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 09EF041569;
 Tue,  3 Feb 2026 08:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70366C19425;
 Tue,  3 Feb 2026 08:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770106484;
 bh=4jV6OAA7zxM0/z17MeJQYVmcnGkjyXbh/eLjPCREVUQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ah6zZfOPmSkT11Uh6fXcRxDUZdG/NCrm8zuj3MJva9x4rvNYbgBiBC+SViw+k5KaP
 +Axy9i9Cz/+r0Ea9llfT0SgBPPMVri66sHph00HX13nrqzbySr23k02hJruZjjTkEu
 +GMYQLfDC30sZQqpBlu12AyzwvEChUu6rqWqmHFg3kLtZ3bZnpDoTwMmJVMfozfGGO
 tuaTnC4/ByioIHrqNL0bSgdQwtx9ADaZEA8SCNIoNsu5YanzRNpq1mGvMcLS0m+4kr
 kjdVSWnzECXgcUaYt970LsJPUZC0LDMajmFc1Vcm/cFjmpMrtrhEL7gL3SDzTLIWm1
 N4J892ApAhlDw==
From: Philipp Stanner <phasta@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Date: Tue,  3 Feb 2026 09:14:01 +0100
Message-ID: <20260203081403.68733-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203081403.68733-2-phasta@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phasta@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:phasta@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,kernel.org,google.com,garyguo.net,amd.com,collabora.com,nvidia.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ACB91D612D
X-Rspamd-Action: no action

dma_fence is a synchronization mechanism which is needed by virtually
all GPU drivers.

A dma_fence offers many features, among which the most important ones
are registering callbacks (for example to kick off a work item) which
get executed once a fence gets signalled.

dma_fence has a number of callbacks. Only the two most basic ones
(get_driver_name(), get_timeline_name()) are abstracted since they are
enough to enable the fundamental functionality.

Callbacks in Rust are registered by passing driver data which implements
the Rust callback trait, whose function will be called by the C backend.

dma_fence's are always refcounted, so implement AlwaysRefcounted for
them. Once a reference drops to zero, the C backend calls a release
function, where we implement drop_in_place() to conveniently marry that
C-cleanup mechanism with Rust's ownership concepts.

This patch provides basic functionality, but is still missing:
  - An implementation of PinInit<T, Error> for all driver data.
  - A clever implementation for working dma_fence_begin_signalling()
    guards. See the corresponding TODO in the code.
  - Abstractions for dma_fence_remove_callback() - needed to cleanly
    decouple third parties from fences for life time soundness.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/dma_fence.c        |  28 +++
 rust/helpers/helpers.c          |   1 +
 rust/helpers/spinlock.c         |   5 +
 rust/kernel/sync.rs             |   2 +
 rust/kernel/sync/dma_fence.rs   | 396 ++++++++++++++++++++++++++++++++
 6 files changed, 433 insertions(+)
 create mode 100644 rust/helpers/dma_fence.c
 create mode 100644 rust/kernel/sync/dma_fence.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 2e43c66635a2..fc3cb5eb0be5 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -51,6 +51,7 @@
 #include <linux/device/faux.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-fence.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/fdtable.h>
diff --git a/rust/helpers/dma_fence.c b/rust/helpers/dma_fence.c
new file mode 100644
index 000000000000..cc93297db4b1
--- /dev/null
+++ b/rust/helpers/dma_fence.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-fence.h>
+
+void rust_helper_dma_fence_get(struct dma_fence *f)
+{
+	dma_fence_get(f);
+}
+
+void rust_helper_dma_fence_put(struct dma_fence *f)
+{
+	dma_fence_put(f);
+}
+
+bool rust_helper_dma_fence_begin_signalling(void)
+{
+	return dma_fence_begin_signalling();
+}
+
+void rust_helper_dma_fence_end_signalling(bool cookie)
+{
+	dma_fence_end_signalling(cookie);
+}
+
+bool rust_helper_dma_fence_is_signaled(struct dma_fence *f)
+{
+	return dma_fence_is_signaled(f);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 551da6c9b506..70c690bdb0a5 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -25,6 +25,7 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#include "dma_fence.c"
 #include "drm.c"
 #include "err.c"
 #include "irq.c"
diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index 42c4bf01a23e..017ac447ebbd 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -16,6 +16,11 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
 #endif /* CONFIG_DEBUG_SPINLOCK */
 }
 
+void rust_helper_spin_lock_init(spinlock_t *lock)
+{
+	spin_lock_init(lock);
+}
+
 void rust_helper_spin_lock(spinlock_t *lock)
 {
 	spin_lock(lock);
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index cf5b638a097d..85e524ea9118 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -14,6 +14,7 @@
 pub mod atomic;
 pub mod barrier;
 pub mod completion;
+pub mod dma_fence;
 mod condvar;
 pub mod lock;
 mod locked_by;
@@ -23,6 +24,7 @@
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use completion::Completion;
+pub use dma_fence::{DmaFence, DmaFenceCtx, DmaFenceCb, DmaFenceCbFunc};
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
 pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
 pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
diff --git a/rust/kernel/sync/dma_fence.rs b/rust/kernel/sync/dma_fence.rs
new file mode 100644
index 000000000000..9c15426f8432
--- /dev/null
+++ b/rust/kernel/sync/dma_fence.rs
@@ -0,0 +1,396 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2025, 2026 Red Hat Inc.:
+//   - Philipp Stanner <pstanner@redhat.com>
+
+//! DmaFence support.
+//!
+//! Reference: <https://docs.kernel.org/driver-api/dma-buf.html#c.dma_fence>
+//!
+//! C header: [`include/linux/dma-fence.h`](srctree/include/linux/dma-fence.h)
+
+use crate::{
+    bindings,
+    prelude::*,
+    types::ForeignOwnable,
+    types::{ARef, AlwaysRefCounted, Opaque},
+};
+
+use core::{
+    ptr::{drop_in_place, NonNull},
+    sync::atomic::{AtomicU64, Ordering},
+};
+
+use kernel::sync::{Arc, ArcBorrow};
+use kernel::c_str;
+
+/// Defines the callback function the dma-fence backend will call once the fence gets signalled.
+pub trait DmaFenceCbFunc {
+    /// The callback function. `cb` is a container of the data which the driver passed in
+    /// [`DmaFence::register_callback`].
+    fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>)
+    where
+        Self: Sized;
+}
+
+/// Container for driver data which the driver gets back in its callback once the fence gets
+/// signalled.
+#[pin_data]
+pub struct DmaFenceCb<T: DmaFenceCbFunc> {
+    /// C struct needed for the backend.
+    #[pin]
+    inner: Opaque<bindings::dma_fence_cb>,
+    /// Driver data.
+    #[pin]
+    pub data: T,
+}
+
+impl<T: DmaFenceCbFunc + 'static> DmaFenceCb<T> {
+    fn new(data: impl PinInit<T>) -> Result<Pin<KBox<Self>>> {
+        let cb = try_pin_init!(Self {
+            inner: Opaque::zeroed(), // This gets initialized by the C backend.
+            data <- data,
+        });
+
+        KBox::pin_init(cb, GFP_KERNEL)
+    }
+
+    /// Callback for the C dma_fence backend.
+    ///
+    /// # Safety
+    /// All data used and cast in this function was validly created by
+    /// [`DmaFence::register_callback`] and isn't modified by the C backend until this callback
+    /// here has run.
+    unsafe extern "C" fn callback(
+        _fence_ptr: *mut bindings::dma_fence,
+        cb_ptr: *mut bindings::dma_fence_cb,
+    ) {
+        let cb_ptr = Opaque::cast_from(cb_ptr);
+
+        // SAFETY: The constructor guarantees that `cb_ptr` is always `inner` of a DmaFenceCb.
+        let cb_ptr = unsafe { crate::container_of!(cb_ptr, Self, inner) }.cast_mut() as *mut c_void;
+        // SAFETY: `cp_ptr` is the heap memory of a Pin<Kbox<Self>> because it was created by
+        // invoking ForeignOwnable::into_foreign() on such an instance.
+        let cb = unsafe { <Pin<KBox<Self>> as ForeignOwnable>::from_foreign(cb_ptr) };
+
+        // Pass ownership back over to the driver.
+        T::callback(cb);
+    }
+}
+
+/// A dma-fence context. A fence context takes care of associating related fences with each other,
+/// providing each with raising sequence numbers and a common identifier.
+#[pin_data]
+pub struct DmaFenceCtx {
+    /// An opaque spinlock. Only ever passed to the C backend, never used by Rust.
+    #[pin]
+    lock: Opaque<bindings::spinlock_t>,
+    /// The fence context number.
+    nr: u64,
+    /// The sequence number for the next fence created.
+    seqno: AtomicU64,
+}
+
+impl DmaFenceCtx {
+    /// Create a new `DmaFenceCtx`.
+    pub fn new() -> Result<Arc<Self>> {
+        let ctx = pin_init!(Self {
+            // Feed in a non-Rust spinlock for now, since the Rust side never needs the lock.
+            lock <- Opaque::ffi_init(|slot: *mut bindings::spinlock| {
+                // SAFETY: `slot` is a valid pointer to an uninitialized `struct spinlock_t`.
+                unsafe { bindings::spin_lock_init(slot) };
+            }),
+            // SAFETY: `dma_fence_context_alloc()` merely works on a global atomic. Parameter `1`
+            // is the number of contexts we want to allocate.
+            nr: unsafe { bindings::dma_fence_context_alloc(1) },
+            seqno: AtomicU64::new(0),
+        });
+
+        Arc::pin_init(ctx, GFP_KERNEL)
+    }
+
+    fn get_new_fence_seqno(&self) -> u64 {
+        self.seqno.fetch_add(1, Ordering::Relaxed)
+    }
+}
+
+// SAFETY: The DmaFenceCtx is merely a wrapper around an atomic integer.
+unsafe impl Send for DmaFenceCtx {}
+// SAFETY: The DmaFenceCtx is merely a wrapper around an atomic integer.
+unsafe impl Sync for DmaFenceCtx {}
+
+impl ArcBorrow<'_, DmaFenceCtx> {
+    /// Create a new fence, consuming `data`.
+    ///
+    /// The fence will increment the refcount of the fence context associated with this
+    /// [`DmaFenceCtx`].
+    pub fn new_fence<T>(
+        &mut self,
+        data: impl PinInit<T>,
+    ) -> Result<ARef<DmaFence<T>>> {
+        let fctx: Arc<DmaFenceCtx> = (*self).into();
+        let seqno: u64 = fctx.get_new_fence_seqno();
+
+        // TODO: Should we reset seqno in case of failure?
+        // Pass `fctx` by value so that the fence will hold a reference to the DmaFenceCtx as long
+        // as it lives.
+        DmaFence::new(fctx, data, &self.lock, self.nr, seqno)
+    }
+}
+
+/// A synchronization primitive mainly for GPU drivers.
+///
+/// DmaFences are always reference counted. The typical use case is that one side registers
+/// callbacks on the fence which will perform a certain action (such as queueing work) once the
+/// other side signals the fence.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::{Arc, ArcBorrow, DmaFence, DmaFenceCtx, DmaFenceCb, DmaFenceCbFunc};
+/// use core::sync::atomic::{self, AtomicBool};
+///
+/// static mut CHECKER: AtomicBool = AtomicBool::new(false);
+///
+/// struct CallbackData {
+///     i: u32,
+/// }
+///
+/// impl CallbackData {
+///     fn new() -> Self {
+///         Self { i: 9 }
+///     }
+/// }
+///
+/// impl DmaFenceCbFunc for CallbackData {
+///     fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>) where Self: Sized {
+///         assert_eq!(cb.data.i, 9);
+///         // SAFETY: Just to have an easy way for testing. This cannot race with the checker
+///         // because the fence signalling callbacks are executed synchronously.
+///         unsafe { CHECKER.store(true, atomic::Ordering::Relaxed); }
+///     }
+/// }
+///
+/// struct DriverData {
+///     i: u32,
+/// }
+///
+/// impl DriverData {
+///     fn new() -> Self {
+///         Self { i: 5 }
+///     }
+/// }
+///
+/// let data = DriverData::new();
+/// let fctx = DmaFenceCtx::new()?;
+///
+/// let mut fence = fctx.as_arc_borrow().new_fence(data)?;
+///
+/// let cb_data = CallbackData::new();
+/// fence.register_callback(cb_data);
+/// // fence.begin_signalling();
+/// fence.signal()?;
+/// // Now check wehether the callback was actually executed.
+/// // SAFETY: `fence.signal()` above works sequentially. We just check here whether the signalling
+/// // actually did set the boolean correctly.
+/// unsafe { assert_eq!(CHECKER.load(atomic::Ordering::Relaxed), true); }
+///
+/// Ok::<(), Error>(())
+/// ```
+#[pin_data]
+pub struct DmaFence<T> {
+    /// The actual dma_fence passed to C.
+    #[pin]
+    inner: Opaque<bindings::dma_fence>,
+    /// User data.
+    #[pin]
+    data: T,
+    /// Marks whether the fence is currently in the signalling critical section.
+    signalling: bool,
+    /// A boolean needed for the C backend's lockdep guard.
+    signalling_cookie: bool,
+    /// A reference to the associated [`DmaFenceCtx`] so that it cannot be dropped while there are
+    /// still fences around.
+    fctx: Arc<DmaFenceCtx>,
+}
+
+// SAFETY: `DmaFence` is safe to be sent to any task.
+unsafe impl<T> Send for DmaFence<T> {}
+
+// SAFETY: `DmaFence` is safe to be accessed concurrently.
+unsafe impl<T> Sync for DmaFence<T> {}
+
+// SAFETY: These implement the C backends refcounting methods which are proven to work correctly.
+unsafe impl<T> AlwaysRefCounted for DmaFence<T> {
+    fn inc_ref(&self) {
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct dma_fence`.
+        unsafe { bindings::dma_fence_get(self.as_raw()) }
+    }
+
+    /// # Safety
+    ///
+    /// `ptr`must be a valid pointer to a [`DmaFence`].
+    unsafe fn dec_ref(ptr: NonNull<Self>) {
+        // SAFETY: `ptr` is never a NULL pointer; and when `dec_ref()` is called
+        // the fence is by definition still valid.
+        let fence = unsafe { (*ptr.as_ptr()).inner.get() };
+
+        // SAFETY: Valid because `fence` was created validly above.
+        unsafe { bindings::dma_fence_put(fence) }
+    }
+}
+
+impl<T> DmaFence<T> {
+    // TODO: There could be a subtle potential problem here? The LLVM compiler backend can create
+    // several versions of this constant. Their content would be identical, but their addresses
+    // different.
+    const OPS: bindings::dma_fence_ops = Self::ops_create();
+
+    /// Create an initializer for a new [`DmaFence`].
+    fn new(
+        fctx: Arc<DmaFenceCtx>,
+        data: impl PinInit<T>, // TODO: The driver data should implement PinInit<T, Error>
+        lock: &Opaque<bindings::spinlock_t>,
+        context: u64,
+        seqno: u64,
+    ) -> Result<ARef<Self>> {
+        let fence = pin_init!(Self {
+            inner <- Opaque::ffi_init(|slot: *mut bindings::dma_fence| {
+                let lock_ptr = &raw const (*lock);
+                // SAFETY: `slot` is a valid pointer to an uninitialized `struct dma_fence`.
+                // `lock_ptr` is a pointer to the spinlock of the fence context, which is shared
+                // among all the fences. This can't become a UAF because each fence takes a
+                // reference of the fence context.
+                unsafe { bindings::dma_fence_init(slot, &Self::OPS, Opaque::cast_into(lock_ptr), context, seqno) };
+            }),
+            data <- data,
+            signalling: false,
+            signalling_cookie: false,
+            fctx: fctx,
+        });
+
+        let b = KBox::pin_init(fence, GFP_KERNEL)?;
+
+        // SAFETY: We don't move the contents of `b` anywhere here. After unwrapping it, ARef will
+        // take care of preventing memory moves.
+        let rawptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(b) });
+
+        // SAFETY: `rawptr` was created validly above.
+        let aref = unsafe { ARef::from_raw(NonNull::new_unchecked(rawptr)) };
+
+        Ok(aref)
+    }
+
+    /// Mark the beginning of a DmaFence signalling critical section. Should be called once a fence
+    /// gets published.
+    ///
+    /// The signalling critical section is marked as finished automatically once the fence signals.
+    pub fn begin_signalling(&mut self) {
+        // FIXME: this needs to be mutable, obviously, but we can't borrow mutably. *sigh*
+        self.signalling = true;
+        // TODO: Should we warn if a user tries to do this several times for the same
+        // fence? And should we ignore the request if the fence is already signalled?
+
+        // SAFETY: `dma_fence_begin_signalling()` works on global lockdep data and calling it is
+        // always safe.
+        self.signalling_cookie = unsafe { bindings::dma_fence_begin_signalling() };
+    }
+
+    const fn ops_create() -> bindings::dma_fence_ops {
+        // SAFETY: Zeroing out memory on the stack is always safe.
+        let mut ops: bindings::dma_fence_ops = unsafe { core::mem::zeroed() };
+
+        ops.get_driver_name = Some(Self::get_driver_name);
+        ops.get_timeline_name = Some(Self::get_timeline_name);
+        ops.release = Some(Self::release);
+
+        ops
+    }
+
+    // The C backend demands the following two callbacks. They are intended for
+    // cross-driver communication, i.e., for another driver to figure out to
+    // whom a fence belongs. As we don't support that currently in the Rust
+    // implementation, let's go for dummy data. By the way it has already been
+    // proposed to remove those callbacks from C, since there are barely any
+    // users.
+    //
+    // And implementing them properly in Rust would require a mandatory interface
+    // and potentially open questions about UAF bugs when the module gets unloaded.
+    extern "C" fn get_driver_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
+        c_str!("DRIVER_NAME_UNUSED").as_char_ptr()
+    }
+
+    extern "C" fn get_timeline_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
+        c_str!("TIMELINE_NAME_UNUSED").as_char_ptr()
+    }
+
+    /// The release function called by the C backend once the refcount drops to 0. We use this to
+    /// drop the Rust dma-fence, too. Since [`DmaFence`] implements [`AlwaysRefCounted`], this is
+    /// perfectly safe and a convenient way to concile the two release mechanisms of C and Rust.
+    unsafe extern "C" fn release(ptr: *mut bindings::dma_fence) {
+        let ptr = Opaque::cast_from(ptr);
+
+        // SAFETY: The constructor guarantees that `ptr` is always the inner fence of a DmaFence.
+        let fence = unsafe { crate::container_of!(ptr, Self, inner) }.cast_mut();
+
+        // SAFETY: See above. Also, the release callback will only be called once, when the
+        // refcount drops to 0, and when that happens the fence is by definition still valid.
+        unsafe { drop_in_place(fence) };
+    }
+
+    /// Signal the fence. This will invoke all registered callbacks.
+    pub fn signal(&self) -> Result {
+        // SAFETY: `self` is refcounted.
+        let ret = unsafe { bindings::dma_fence_signal(self.as_raw()) };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        if self.signalling {
+            // SAFETY: `dma_fence_end_signalling()` works on global lockdep data. The only
+            // parameter is a boolean passed by value.
+            unsafe { bindings::dma_fence_end_signalling(self.signalling_cookie) };
+        }
+
+        Ok(())
+    }
+
+    /// Check whether the fence was signalled at the moment of the function call.
+    pub fn is_signaled(&self) -> bool {
+        // SAFETY: self is by definition still valid. The backend ensures proper
+        // locking. We don't implement the dma_fence fastpath backend_ops
+        // callbacks, so this merely checks a boolean and has no side effects.
+        unsafe { bindings::dma_fence_is_signaled(self.as_raw()) }
+    }
+
+    /// Register a callback on a [`DmaFence`]. The callback will be invoked in the fence's
+    /// signalling path, i.e., critical section.
+    ///
+    /// Consumes `data`. `data` is passed back to the implemented callback function when the fence
+    /// gets signalled.
+    pub fn register_callback<U: DmaFenceCbFunc + 'static>(&self, data: impl PinInit<U>) -> Result {
+        let cb = DmaFenceCb::new(data)?;
+        let ptr = cb.into_foreign() as *mut DmaFenceCb<U>;
+        // SAFETY: `ptr` was created validly directly above.
+        let inner_cb = unsafe { (*ptr).inner.get() };
+
+        // SAFETY: `self.as_raw()` is valid because `self` is refcounted, `inner_cb` was created
+        // validly above and was turned into a ForeignOwnable, so it won't be dropped. `callback`
+        // has static life time.
+        let ret = unsafe {
+            bindings::dma_fence_add_callback(
+                self.as_raw(),
+                inner_cb,
+                Some(DmaFenceCb::<U>::callback),
+            )
+        };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+        Ok(())
+    }
+
+    fn as_raw(&self) -> *mut bindings::dma_fence {
+        self.inner.get()
+    }
+}
-- 
2.49.0

