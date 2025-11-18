Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B534C69986
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDFC10E4A8;
	Tue, 18 Nov 2025 13:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sSW27ozh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5AB10E4A8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:27:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E87A540A18;
 Tue, 18 Nov 2025 13:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE36BC4CEF1;
 Tue, 18 Nov 2025 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763472452;
 bh=O6w8yE+bQAU4FwyqlCvQpDdc1jWO3Vrz2pdLrX3KRAs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sSW27ozhxydZh+w4GiB5IRjKKwLLBj/nRTZruTWHa/gPU/6yXinllb4JeI4/uJdd+
 zQWRbQ2MkGimhOWkEGtLPyVGagoHmEDwjKUGUToaExi4fDwga8L2elfJXd7qRYzY+x
 LwuUshugcNGZ4TnWyjM3ARCrnvRPb5WiLTqwYkJQeyb6KTAo+vE6V36UZxWDOQnhOv
 Yc40zpi40zkk+r4upgBj8cPVhKJgBAq1zgrTs8uXvpTGxiUBoZ8pxePvF8bhExnp1J
 szSkha4XM+50OkTiBA+NrWbhh/KTGGsqqu9eRLitNfX4seBwHYLjevTKp3EJfL21uh
 d597D7wlLbtIg==
From: Philipp Stanner <phasta@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Peter Colberg <pcolberg@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
Date: Tue, 18 Nov 2025 14:25:18 +0100
Message-ID: <20251118132520.266179-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251118132520.266179-2-phasta@kernel.org>
References: <20251118132520.266179-2-phasta@kernel.org>
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

dma_fence is a synchronization mechanism which is needed by virtually
all GPU drivers.

A dma_fence offers many features, among which the most important ones
are registering callbacks (for example to kick off a work item) which
get executed once a fence gets signalled.

dma_fence has a number of callbacks. Only the two most basic ones
(get_driver_name(), get_timeline_name() are abstracted since they are
enough to enable the basic functionality.

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
  - Additional useful helper functions such as dma_fence_is_signaled().
    These _should_ be relatively trivial to implement, though.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/dma_fence.c        |  23 ++
 rust/helpers/helpers.c          |   1 +
 rust/helpers/spinlock.c         |   5 +
 rust/kernel/sync.rs             |   2 +
 rust/kernel/sync/dma_fence.rs   | 380 ++++++++++++++++++++++++++++++++
 6 files changed, 412 insertions(+)
 create mode 100644 rust/helpers/dma_fence.c
 create mode 100644 rust/kernel/sync/dma_fence.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 84d60635e8a9..107cb6b6f4a4 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -48,6 +48,7 @@
 #include <linux/cred.h>
 #include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-fence.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/file.h>
diff --git a/rust/helpers/dma_fence.c b/rust/helpers/dma_fence.c
new file mode 100644
index 000000000000..a9fc4829bbae
--- /dev/null
+++ b/rust/helpers/dma_fence.c
@@ -0,0 +1,23 @@
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
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 7cf7fe95e41d..99a7f7834c03 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -20,6 +20,7 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#include "dma_fence.c"
 #include "drm.c"
 #include "err.c"
 #include "fs.c"
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
index 00f9b558a3ad..84c406b6b9e1 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -12,6 +12,7 @@
 mod arc;
 pub mod aref;
 pub mod completion;
+pub mod dma_fence;
 mod condvar;
 pub mod lock;
 mod locked_by;
@@ -20,6 +21,7 @@
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use completion::Completion;
+pub use dma_fence::{DmaFence, DmaFenceCtx, DmaFenceCb, DmaFenceCbFunc};
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
 pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
 pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
diff --git a/rust/kernel/sync/dma_fence.rs b/rust/kernel/sync/dma_fence.rs
new file mode 100644
index 000000000000..d9a59dde0210
--- /dev/null
+++ b/rust/kernel/sync/dma_fence.rs
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0
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

