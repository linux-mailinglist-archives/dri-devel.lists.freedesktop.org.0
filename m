Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A58D6AE252
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630BD10E4B3;
	Tue,  7 Mar 2023 14:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343F510E4B3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:27:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 61DA14261B;
 Tue,  7 Mar 2023 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199260;
 bh=qxI6GJmNo0Y4+6c3Pa+ta2DSc4p6o+YuxslYcsGJFM4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=ZcXSxP3Nj8rQiVFU5QoKVbKGsKDqHqTuptTxSXb/T++6CSJflmJ6UyjAAT2xKxLCF
 5AeJuJyumpsVwn46UZijLtezdC7Z9aEhd734nS5JGxluZXzZQ/HlRiaXond8FeBdxU
 45QdqLToECPJ/lWxzcqXZVR0u9dZzKqa5CuI643IONL5Uh0pUiBnRU1bAj8OOnjLdP
 L0krGvpuwnciNiPCT8lvsbIlRYzrCBerjLMwTQIH486utIZNAtUCgDcq2wsbTjN4h7
 KWq1FU+enwWdsvDLytFsYG5znXhtrKP1ziisN/AN1ufxC3thyf1Ohxy5oQLpUP+n6c
 aT0njZjUwaXFA==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:33 +0900
Subject: [PATCH RFC 08/18] rust: dma_fence: Add DMA Fence abstraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-8-917ff5bc80a8@asahilina.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=21370;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=qxI6GJmNo0Y4+6c3Pa+ta2DSc4p6o+YuxslYcsGJFM4=;
 b=mX8/ZtYERXNdbWtwabzrHCLIOywZes6UBii6Z13L/frmDi6cg/WtPxMZuURZwWM32yFmjCOEN
 JT3Dr3DG2L2AMfhB4cY+egFO/xkLF5EEkuU/9sOZLjXXs5VnxyMt2Ji
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

DMA fences are the internal synchronization primitive used for DMA
operations like GPU rendering, video en/decoding, etc. Add an
abstraction to allow Rust drivers to interact with this subsystem.

Note: This uses a raw spinlock living next to the fence, since we do
not interact with it other than for initialization.
TODO: Expose this to the user at some point with a safe abstraction.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers.c                  |  53 ++++
 rust/kernel/dma_fence.rs        | 532 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 4 files changed, 589 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 9f152d373df8..705af292a5b4 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -14,6 +14,8 @@
 #include <drm/drm_ioctl.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/dma-fence.h>
+#include <linux/dma-fence-chain.h>
 #include <linux/dma-mapping.h>
 #include <linux/fs.h>
 #include <linux/ioctl.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index 388ff1100ea5..8e906a7a7d8a 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -23,6 +23,8 @@
 #include <linux/bug.h>
 #include <linux/build_bug.h>
 #include <linux/device.h>
+#include <linux/dma-fence.h>
+#include <linux/dma-fence-chain.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/errname.h>
@@ -30,6 +32,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/spinlock.h>
 #include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/xarray.h>
@@ -388,6 +391,56 @@ int rust_helper_sg_dma_len(const struct scatterlist *sg)
 }
 EXPORT_SYMBOL_GPL(rust_helper_sg_dma_len);
 
+void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
+				  struct lock_class_key *key)
+{
+#ifdef CONFIG_DEBUG_SPINLOCK
+# ifndef CONFIG_PREEMPT_RT
+	__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
+# else
+	rt_mutex_base_init(&lock->lock);
+	__rt_spin_lock_init(lock, name, key, false);
+# endif
+#else
+	spin_lock_init(lock);
+#endif
+}
+EXPORT_SYMBOL_GPL(rust_helper___spin_lock_init);
+
+#ifdef CONFIG_DMA_SHARED_BUFFER
+
+void rust_helper_dma_fence_get(struct dma_fence *fence)
+{
+	dma_fence_get(fence);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dma_fence_get);
+
+void rust_helper_dma_fence_put(struct dma_fence *fence)
+{
+	dma_fence_put(fence);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dma_fence_put);
+
+struct dma_fence_chain *rust_helper_dma_fence_chain_alloc(void)
+{
+	return dma_fence_chain_alloc();
+}
+EXPORT_SYMBOL_GPL(rust_helper_dma_fence_chain_alloc);
+
+void rust_helper_dma_fence_chain_free(struct dma_fence_chain *chain)
+{
+	dma_fence_chain_free(chain);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dma_fence_chain_free);
+
+void rust_helper_dma_fence_set_error(struct dma_fence *fence, int error)
+{
+	dma_fence_set_error(fence, error);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dma_fence_set_error);
+
+#endif
+
 #ifdef CONFIG_DRM
 
 void rust_helper_drm_gem_object_get(struct drm_gem_object *obj)
diff --git a/rust/kernel/dma_fence.rs b/rust/kernel/dma_fence.rs
new file mode 100644
index 000000000000..ca93380d9da2
--- /dev/null
+++ b/rust/kernel/dma_fence.rs
@@ -0,0 +1,532 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! DMA fence abstraction.
+//!
+//! C header: [`include/linux/dma_fence.h`](../../include/linux/dma_fence.h)
+
+use crate::{
+    bindings,
+    error::{to_result, Result},
+    prelude::*,
+    sync::LockClassKey,
+    types::Opaque,
+};
+use core::fmt::Write;
+use core::ops::{Deref, DerefMut};
+use core::ptr::addr_of_mut;
+use core::sync::atomic::{AtomicU64, Ordering};
+
+/// Any kind of DMA Fence Object
+///
+/// # Invariants
+/// raw() returns a valid pointer to a dma_fence and we own a reference to it.
+pub trait RawDmaFence: crate::private::Sealed {
+    /// Returns the raw `struct dma_fence` pointer.
+    fn raw(&self) -> *mut bindings::dma_fence;
+
+    /// Returns the raw `struct dma_fence` pointer and consumes the object.
+    ///
+    /// The caller is responsible for dropping the reference.
+    fn into_raw(self) -> *mut bindings::dma_fence
+    where
+        Self: Sized,
+    {
+        let ptr = self.raw();
+        core::mem::forget(self);
+        ptr
+    }
+
+    /// Advances this fence to the chain node which will signal this sequence number.
+    /// If no sequence number is provided, this returns `self` again.
+    fn chain_find_seqno(self, seqno: u64) -> Result<Fence>
+    where
+        Self: Sized,
+    {
+        let mut ptr = self.into_raw();
+
+        // SAFETY: This will safely fail if this DmaFence is not a chain.
+        // `ptr` is valid per the type invariant.
+        let ret = unsafe { bindings::dma_fence_chain_find_seqno(&mut ptr, seqno) };
+
+        if ret != 0 {
+            // SAFETY: This is either an owned reference or NULL, dma_fence_put can handle both.
+            unsafe { bindings::dma_fence_put(ptr) };
+            Err(Error::from_kernel_errno(ret))
+        } else if ptr.is_null() {
+            Err(EINVAL) // When can this happen?
+        } else {
+            // SAFETY: ptr is valid and non-NULL as checked above.
+            Ok(unsafe { Fence::from_raw(ptr) })
+        }
+    }
+
+    /// Signal completion of this fence
+    fn signal(&self) -> Result {
+        to_result(unsafe { bindings::dma_fence_signal(self.raw()) })
+    }
+
+    /// Set the error flag on this fence
+    fn set_error(&self, err: Error) {
+        unsafe { bindings::dma_fence_set_error(self.raw(), err.to_kernel_errno()) };
+    }
+}
+
+/// A generic DMA Fence Object
+///
+/// # Invariants
+/// ptr is a valid pointer to a dma_fence and we own a reference to it.
+pub struct Fence {
+    ptr: *mut bindings::dma_fence,
+}
+
+impl Fence {
+    /// Create a new Fence object from a raw pointer to a dma_fence.
+    ///
+    /// # Safety
+    /// The caller must own a reference to the dma_fence, which is transferred to the new object.
+    pub(crate) unsafe fn from_raw(ptr: *mut bindings::dma_fence) -> Fence {
+        Fence { ptr }
+    }
+
+    /// Create a new Fence object from a raw pointer to a dma_fence.
+    ///
+    /// # Safety
+    /// Takes a borrowed reference to the dma_fence, and increments the reference count.
+    pub(crate) unsafe fn get_raw(ptr: *mut bindings::dma_fence) -> Fence {
+        // SAFETY: Pointer is valid per the safety contract
+        unsafe { bindings::dma_fence_get(ptr) };
+        Fence { ptr }
+    }
+
+    /// Create a new Fence object from a RawDmaFence.
+    pub fn from_fence(fence: &dyn RawDmaFence) -> Fence {
+        // SAFETY: Pointer is valid per the RawDmaFence contract
+        unsafe { Self::get_raw(fence.raw()) }
+    }
+}
+
+impl crate::private::Sealed for Fence {}
+
+impl RawDmaFence for Fence {
+    fn raw(&self) -> *mut bindings::dma_fence {
+        self.ptr
+    }
+}
+
+impl Drop for Fence {
+    fn drop(&mut self) {
+        // SAFETY: We own a reference to this syncobj.
+        unsafe { bindings::dma_fence_put(self.ptr) };
+    }
+}
+
+impl Clone for Fence {
+    fn clone(&self) -> Self {
+        // SAFETY: `ptr` is valid per the type invariant and we own a reference to it.
+        unsafe {
+            bindings::dma_fence_get(self.ptr);
+            Self::from_raw(self.ptr)
+        }
+    }
+}
+
+unsafe impl Sync for Fence {}
+unsafe impl Send for Fence {}
+
+/// Trait which must be implemented by driver-specific fence objects.
+#[vtable]
+pub trait FenceOps: Sized + Send + Sync {
+    /// True if this dma_fence implementation uses 64bit seqno, false otherwise.
+    const USE_64BIT_SEQNO: bool;
+
+    /// Returns the driver name. This is a callback to allow drivers to compute the name at
+    /// runtime, without having it to store permanently for each fence, or build a cache of
+    /// some sort.
+    fn get_driver_name<'a>(self: &'a FenceObject<Self>) -> &'a CStr;
+
+    /// Return the name of the context this fence belongs to. This is a callback to allow drivers
+    /// to compute the name at runtime, without having it to store permanently for each fence, or
+    /// build a cache of some sort.
+    fn get_timeline_name<'a>(self: &'a FenceObject<Self>) -> &'a CStr;
+
+    /// Enable software signaling of fence.
+    fn enable_signaling(self: &FenceObject<Self>) -> bool {
+        false
+    }
+
+    /// Peek whether the fence is signaled, as a fastpath optimization for e.g. dma_fence_wait() or
+    /// dma_fence_add_callback().
+    fn signaled(self: &FenceObject<Self>) -> bool {
+        false
+    }
+
+    /// Callback to fill in free-form debug info specific to this fence, like the sequence number.
+    fn fence_value_str(self: &FenceObject<Self>, _output: &mut dyn Write) {}
+
+    /// Fills in the current value of the timeline as a string, like the sequence number. Note that
+    /// the specific fence passed to this function should not matter, drivers should only use it to
+    /// look up the corresponding timeline structures.
+    fn timeline_value_str(self: &FenceObject<Self>, _output: &mut dyn Write) {}
+}
+
+unsafe extern "C" fn get_driver_name_cb<T: FenceOps>(
+    fence: *mut bindings::dma_fence,
+) -> *const core::ffi::c_char {
+    // SAFETY: All of our fences are FenceObject<T>.
+    let p = crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T>;
+
+    // SAFETY: The caller is responsible for passing a valid dma_fence subtype
+    T::get_driver_name(unsafe { &mut *p }).as_char_ptr()
+}
+
+unsafe extern "C" fn get_timeline_name_cb<T: FenceOps>(
+    fence: *mut bindings::dma_fence,
+) -> *const core::ffi::c_char {
+    // SAFETY: All of our fences are FenceObject<T>.
+    let p = crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T>;
+
+    // SAFETY: The caller is responsible for passing a valid dma_fence subtype
+    T::get_timeline_name(unsafe { &mut *p }).as_char_ptr()
+}
+
+unsafe extern "C" fn enable_signaling_cb<T: FenceOps>(fence: *mut bindings::dma_fence) -> bool {
+    // SAFETY: All of our fences are FenceObject<T>.
+    let p = crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T>;
+
+    // SAFETY: The caller is responsible for passing a valid dma_fence subtype
+    T::enable_signaling(unsafe { &mut *p })
+}
+
+unsafe extern "C" fn signaled_cb<T: FenceOps>(fence: *mut bindings::dma_fence) -> bool {
+    // SAFETY: All of our fences are FenceObject<T>.
+    let p = crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T>;
+
+    // SAFETY: The caller is responsible for passing a valid dma_fence subtype
+    T::signaled(unsafe { &mut *p })
+}
+
+unsafe extern "C" fn release_cb<T: FenceOps>(fence: *mut bindings::dma_fence) {
+    // SAFETY: All of our fences are FenceObject<T>.
+    let p = crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T>;
+
+    // SAFETY: p is never used after this
+    unsafe {
+        core::ptr::drop_in_place(&mut (*p).inner);
+    }
+
+    // SAFETY: All of our fences are allocated using kmalloc, so this is safe.
+    unsafe { bindings::dma_fence_free(fence) };
+}
+
+unsafe extern "C" fn fence_value_str_cb<T: FenceOps>(
+    fence: *mut bindings::dma_fence,
+    string: *mut core::ffi::c_char,
+    size: core::ffi::c_int,
+) {
+    let size: usize = size.try_into().unwrap_or(0);
+
+    if size == 0 {
+        return;
+    }
+
+    // SAFETY: All of our fences are FenceObject<T>.
+    let p = crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T>;
+
+    // SAFETY: The caller is responsible for the validity of string/size
+    let mut f = unsafe { crate::str::Formatter::from_buffer(string as *mut _, size) };
+
+    // SAFETY: The caller is responsible for passing a valid dma_fence subtype
+    T::fence_value_str(unsafe { &mut *p }, &mut f);
+    let _ = f.write_str("\0");
+
+    // SAFETY: `size` is at least 1 per the check above
+    unsafe { *string.add(size - 1) = 0 };
+}
+
+unsafe extern "C" fn timeline_value_str_cb<T: FenceOps>(
+    fence: *mut bindings::dma_fence,
+    string: *mut core::ffi::c_char,
+    size: core::ffi::c_int,
+) {
+    let size: usize = size.try_into().unwrap_or(0);
+
+    if size == 0 {
+        return;
+    }
+
+    // SAFETY: All of our fences are FenceObject<T>.
+    let p = crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T>;
+
+    // SAFETY: The caller is responsible for the validity of string/size
+    let mut f = unsafe { crate::str::Formatter::from_buffer(string as *mut _, size) };
+
+    // SAFETY: The caller is responsible for passing a valid dma_fence subtype
+    T::timeline_value_str(unsafe { &mut *p }, &mut f);
+    let _ = f.write_str("\0");
+
+    // SAFETY: `size` is at least 1 per the check above
+    unsafe { *string.add(size - 1) = 0 };
+}
+
+// Allow FenceObject<Self> to be used as a self argument, for ergonomics
+impl<T: FenceOps> core::ops::Receiver for FenceObject<T> {}
+
+/// A driver-specific DMA Fence Object
+///
+/// # Invariants
+/// ptr is a valid pointer to a dma_fence and we own a reference to it.
+#[repr(C)]
+pub struct FenceObject<T: FenceOps> {
+    fence: bindings::dma_fence,
+    lock: Opaque<bindings::spinlock>,
+    inner: T,
+}
+
+impl<T: FenceOps> FenceObject<T> {
+    const SIZE: usize = core::mem::size_of::<Self>();
+
+    const VTABLE: bindings::dma_fence_ops = bindings::dma_fence_ops {
+        use_64bit_seqno: T::USE_64BIT_SEQNO,
+        get_driver_name: Some(get_driver_name_cb::<T>),
+        get_timeline_name: Some(get_timeline_name_cb::<T>),
+        enable_signaling: if T::HAS_ENABLE_SIGNALING {
+            Some(enable_signaling_cb::<T>)
+        } else {
+            None
+        },
+        signaled: if T::HAS_SIGNALED {
+            Some(signaled_cb::<T>)
+        } else {
+            None
+        },
+        wait: None, // Deprecated
+        release: Some(release_cb::<T>),
+        fence_value_str: if T::HAS_FENCE_VALUE_STR {
+            Some(fence_value_str_cb::<T>)
+        } else {
+            None
+        },
+        timeline_value_str: if T::HAS_TIMELINE_VALUE_STR {
+            Some(timeline_value_str_cb::<T>)
+        } else {
+            None
+        },
+    };
+}
+
+impl<T: FenceOps> Deref for FenceObject<T> {
+    type Target = T;
+
+    fn deref(&self) -> &T {
+        &self.inner
+    }
+}
+
+impl<T: FenceOps> DerefMut for FenceObject<T> {
+    fn deref_mut(&mut self) -> &mut T {
+        &mut self.inner
+    }
+}
+
+impl<T: FenceOps> crate::private::Sealed for FenceObject<T> {}
+impl<T: FenceOps> RawDmaFence for FenceObject<T> {
+    fn raw(&self) -> *mut bindings::dma_fence {
+        &self.fence as *const _ as *mut _
+    }
+}
+
+/// A unique reference to a driver-specific fence object
+pub struct UniqueFence<T: FenceOps>(*mut FenceObject<T>);
+
+impl<T: FenceOps> Deref for UniqueFence<T> {
+    type Target = FenceObject<T>;
+
+    fn deref(&self) -> &FenceObject<T> {
+        unsafe { &*self.0 }
+    }
+}
+
+impl<T: FenceOps> DerefMut for UniqueFence<T> {
+    fn deref_mut(&mut self) -> &mut FenceObject<T> {
+        unsafe { &mut *self.0 }
+    }
+}
+
+impl<T: FenceOps> crate::private::Sealed for UniqueFence<T> {}
+impl<T: FenceOps> RawDmaFence for UniqueFence<T> {
+    fn raw(&self) -> *mut bindings::dma_fence {
+        unsafe { addr_of_mut!((*self.0).fence) }
+    }
+}
+
+impl<T: FenceOps> From<UniqueFence<T>> for UserFence<T> {
+    fn from(value: UniqueFence<T>) -> Self {
+        let ptr = value.0;
+        core::mem::forget(value);
+
+        UserFence(ptr)
+    }
+}
+
+impl<T: FenceOps> Drop for UniqueFence<T> {
+    fn drop(&mut self) {
+        // SAFETY: We own a reference to this fence.
+        unsafe { bindings::dma_fence_put(self.raw()) };
+    }
+}
+
+unsafe impl<T: FenceOps> Sync for UniqueFence<T> {}
+unsafe impl<T: FenceOps> Send for UniqueFence<T> {}
+
+/// A shared reference to a driver-specific fence object
+pub struct UserFence<T: FenceOps>(*mut FenceObject<T>);
+
+impl<T: FenceOps> Deref for UserFence<T> {
+    type Target = FenceObject<T>;
+
+    fn deref(&self) -> &FenceObject<T> {
+        unsafe { &*self.0 }
+    }
+}
+
+impl<T: FenceOps> Clone for UserFence<T> {
+    fn clone(&self) -> Self {
+        // SAFETY: `ptr` is valid per the type invariant and we own a reference to it.
+        unsafe {
+            bindings::dma_fence_get(self.raw());
+            Self(self.0)
+        }
+    }
+}
+
+impl<T: FenceOps> crate::private::Sealed for UserFence<T> {}
+impl<T: FenceOps> RawDmaFence for UserFence<T> {
+    fn raw(&self) -> *mut bindings::dma_fence {
+        unsafe { addr_of_mut!((*self.0).fence) }
+    }
+}
+
+impl<T: FenceOps> Drop for UserFence<T> {
+    fn drop(&mut self) {
+        // SAFETY: We own a reference to this fence.
+        unsafe { bindings::dma_fence_put(self.raw()) };
+    }
+}
+
+unsafe impl<T: FenceOps> Sync for UserFence<T> {}
+unsafe impl<T: FenceOps> Send for UserFence<T> {}
+
+/// An array of fence contexts, out of which fences can be created.
+pub struct FenceContexts {
+    start: u64,
+    count: u32,
+    seqnos: Vec<AtomicU64>,
+    lock_name: &'static CStr,
+    lock_key: &'static LockClassKey,
+}
+
+impl FenceContexts {
+    /// Create a new set of fence contexts.
+    pub fn new(
+        count: u32,
+        name: &'static CStr,
+        key: &'static LockClassKey,
+    ) -> Result<FenceContexts> {
+        let mut seqnos: Vec<AtomicU64> = Vec::new();
+
+        seqnos.try_reserve(count as usize)?;
+
+        for _ in 0..count {
+            seqnos.try_push(Default::default())?;
+        }
+
+        let start = unsafe { bindings::dma_fence_context_alloc(count as core::ffi::c_uint) };
+
+        Ok(FenceContexts {
+            start,
+            count,
+            seqnos,
+            lock_name: name,
+            lock_key: key,
+        })
+    }
+
+    /// Create a new fence in a given context index.
+    pub fn new_fence<T: FenceOps>(&self, context: u32, inner: T) -> Result<UniqueFence<T>> {
+        if context > self.count {
+            return Err(EINVAL);
+        }
+
+        let p = unsafe {
+            bindings::krealloc(
+                core::ptr::null_mut(),
+                FenceObject::<T>::SIZE,
+                bindings::GFP_KERNEL | bindings::__GFP_ZERO,
+            ) as *mut FenceObject<T>
+        };
+
+        if p.is_null() {
+            return Err(ENOMEM);
+        }
+
+        let seqno = self.seqnos[context as usize].fetch_add(1, Ordering::Relaxed);
+
+        // SAFETY: The pointer is valid, so pointers to members are too.
+        // After this, all fields are initialized.
+        unsafe {
+            addr_of_mut!((*p).inner).write(inner);
+            bindings::__spin_lock_init(
+                addr_of_mut!((*p).lock) as *mut _,
+                self.lock_name.as_char_ptr(),
+                self.lock_key.get(),
+            );
+            bindings::dma_fence_init(
+                addr_of_mut!((*p).fence),
+                &FenceObject::<T>::VTABLE,
+                addr_of_mut!((*p).lock) as *mut _,
+                self.start + context as u64,
+                seqno,
+            );
+        };
+
+        Ok(UniqueFence(p))
+    }
+}
+
+/// A DMA Fence Chain Object
+///
+/// # Invariants
+/// ptr is a valid pointer to a dma_fence_chain which we own.
+pub struct FenceChain {
+    ptr: *mut bindings::dma_fence_chain,
+}
+
+impl FenceChain {
+    /// Create a new DmaFenceChain object.
+    pub fn new() -> Result<Self> {
+        // SAFETY: This function is safe to call and takes no arguments.
+        let ptr = unsafe { bindings::dma_fence_chain_alloc() };
+
+        if ptr.is_null() {
+            Err(ENOMEM)
+        } else {
+            Ok(FenceChain { ptr })
+        }
+    }
+
+    /// Convert the DmaFenceChain into the underlying raw pointer.
+    ///
+    /// This assumes the caller will take ownership of the object.
+    pub(crate) fn into_raw(self) -> *mut bindings::dma_fence_chain {
+        let ptr = self.ptr;
+        core::mem::forget(self);
+        ptr
+    }
+}
+
+impl Drop for FenceChain {
+    fn drop(&mut self) {
+        // SAFETY: We own this dma_fence_chain.
+        unsafe { bindings::dma_fence_chain_free(self.ptr) };
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index cb23d24c6718..31866069e0bc 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,8 @@ mod allocator;
 mod build_assert;
 pub mod delay;
 pub mod device;
+#[cfg(CONFIG_DMA_SHARED_BUFFER)]
+pub mod dma_fence;
 pub mod driver;
 #[cfg(CONFIG_RUST_DRM)]
 pub mod drm;

-- 
2.35.1

