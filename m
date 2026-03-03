Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKjHHQcLp2mJcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125F31F3AF8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0852C10E85D;
	Tue,  3 Mar 2026 16:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dCLmffoW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C56E10E85D;
 Tue,  3 Mar 2026 16:23:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 002F74094A;
 Tue,  3 Mar 2026 16:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E36BC116C6;
 Tue,  3 Mar 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772555009;
 bh=+TCDKXUKD/DuQo8wyguxxZ7g4OqdWwlSrUMCf5ftORg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dCLmffoWpI/L7Wgjs6hmjTG1WqUvGp3qIdPRD9fN1CBx6bvNVHB8PfBuude3YFgyz
 OR7eYyITDJlW0si54rtPaDtZ5GnvuvEpJJJmgqTvS/aE/jKK9pUIEBY6juXBFcNBEE
 CU3wYN6FeqlFJBjYrZGuGw/D57f80LmjID8w/Wn3+2NvdjDiqxDUSqJyIwOK3uP0uw
 lyW7ITHl6adhhTzDCECIEG33sC7XYnyhqqhU2kgcBFGWa2nuPVC9CQp74PnHgH0DnG
 gonnHWoiEFUkh7Wuym3EKq0HDwNZmB/Zncnzzo58v/jTxkI9AJoEDXL1Ez9aupAhz9
 ikyEtrOnY0QXg==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/8] rust: dma: add generalized container for types other than
 slices
Date: Tue,  3 Mar 2026 17:22:53 +0100
Message-ID: <20260303162314.94363-3-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303162314.94363-1-dakr@kernel.org>
References: <20260303162314.94363-1-dakr@kernel.org>
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
X-Rspamd-Queue-Id: 125F31F3AF8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[google.com,nvidia.com,kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,collabora.com,arm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

Currently, `CoherentAllocation` is concecptually a DMA coherent container
of a slice of `[T]` of runtime-checked length. Generalize it by creating
`dma::Coherent<T>` which can hold any value of `T`.
`Coherent::alloc_with_attrs` is implemented but not yet exposed, as I
believe we should not expose the way to obtain an uninitialized coherent
region.

`Coherent<[T]>` provides a `len` method instead of the previous `count()`
method to be consistent with methods on slices.

The existing type is re-defined as a type alias of `Coherent<[T]>` to ease
transition. Methods in use are not yet removed.

Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/device.rs |   4 +-
 rust/kernel/dma.rs    | 361 ++++++++++++++++++++++++++----------------
 2 files changed, 226 insertions(+), 139 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 94e0548e7687..379058eca2ed 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -575,7 +575,7 @@ pub trait DeviceContext: private::Sealed {}
 /// The bound context indicates that for the entire duration of the lifetime of a [`Device<Bound>`]
 /// reference, the [`Device`] is guaranteed to be bound to a driver.
 ///
-/// Some APIs, such as [`dma::CoherentAllocation`] or [`Devres`] rely on the [`Device`] to be bound,
+/// Some APIs, such as [`dma::Coherent`] or [`Devres`] rely on the [`Device`] to be bound,
 /// which can be proven with the [`Bound`] device context.
 ///
 /// Any abstraction that can guarantee a scope where the corresponding bus device is bound, should
@@ -584,7 +584,7 @@ pub trait DeviceContext: private::Sealed {}
 ///
 /// [`Devres`]: kernel::devres::Devres
 /// [`Devres::access`]: kernel::devres::Devres::access
-/// [`dma::CoherentAllocation`]: kernel::dma::CoherentAllocation
+/// [`dma::Coherent`]: kernel::dma::Coherent
 pub struct Bound;
 
 mod private {
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 54512278085e..3a692ac76ba2 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -6,7 +6,6 @@
 
 use crate::{
     bindings,
-    build_assert,
     device::{
         self,
         Bound,
@@ -14,6 +13,7 @@
     },
     error::to_result,
     prelude::*,
+    ptr::KnownSize,
     sync::aref::ARef,
     transmute::{
         AsBytes,
@@ -357,18 +357,17 @@ fn from(direction: DataDirection) -> Self {
 /// This is an abstraction around the `dma_alloc_coherent` API which is used to allocate and map
 /// large coherent DMA regions.
 ///
-/// A [`CoherentAllocation`] instance contains a pointer to the allocated region (in the
+/// A [`Coherent`] instance contains a pointer to the allocated region (in the
 /// processor's virtual address space) and the device address which can be given to the device
-/// as the DMA address base of the region. The region is released once [`CoherentAllocation`]
+/// as the DMA address base of the region. The region is released once [`Coherent`]
 /// is dropped.
 ///
 /// # Invariants
 ///
-/// - For the lifetime of an instance of [`CoherentAllocation`], the `cpu_addr` is a valid pointer
+/// - For the lifetime of an instance of [`Coherent`], the `cpu_addr` is a valid pointer
 ///   to an allocated region of coherent memory and `dma_handle` is the DMA address base of the
 ///   region.
-/// - The size in bytes of the allocation is equal to `size_of::<T> * count`.
-/// - `size_of::<T> * count` fits into a `usize`.
+/// - The size in bytes of the allocation is equal to size information via pointer.
 // TODO
 //
 // DMA allocations potentially carry device resources (e.g.IOMMU mappings), hence for soundness
@@ -379,124 +378,260 @@ fn from(direction: DataDirection) -> Self {
 // allocation from surviving device unbind; it would require RCU read side critical sections to
 // access the memory, which may require subsequent unnecessary copies.
 //
-// Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
-// entire `CoherentAllocation` including the allocated memory itself.
-pub struct CoherentAllocation<T: AsBytes + FromBytes> {
+// Hence, find a way to revoke the device resources of a `Coherent`, but not the
+// entire `Coherent` including the allocated memory itself.
+pub struct Coherent<T: AsBytes + FromBytes + KnownSize + ?Sized> {
     dev: ARef<device::Device>,
     dma_handle: DmaAddress,
-    count: usize,
     cpu_addr: NonNull<T>,
     dma_attrs: Attrs,
 }
 
-impl<T: AsBytes + FromBytes> CoherentAllocation<T> {
-    /// Allocates a region of `size_of::<T> * count` of coherent memory.
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> Coherent<T> {
+    /// Returns the size in bytes of this allocation.
+    #[inline]
+    pub fn size(&self) -> usize {
+        T::size(self.cpu_addr.as_ptr())
+    }
+
+    /// Returns the raw pointer to the allocated region in the CPU's virtual address space.
+    #[inline]
+    pub fn as_ptr(&self) -> *const T {
+        self.cpu_addr.as_ptr()
+    }
+
+    /// Returns the raw pointer to the allocated region in the CPU's virtual address space as
+    /// a mutable pointer.
+    #[inline]
+    pub fn as_mut_ptr(&self) -> *mut T {
+        self.cpu_addr.as_ptr()
+    }
+
+    /// Returns a DMA handle which may be given to the device as the DMA address base of
+    /// the region.
+    #[inline]
+    pub fn dma_handle(&self) -> DmaAddress {
+        self.dma_handle
+    }
+
+    /// Returns a reference to the data in the region.
     ///
-    /// # Examples
+    /// # Safety
     ///
-    /// ```
-    /// # use kernel::device::{Bound, Device};
-    /// use kernel::dma::{attrs::*, CoherentAllocation};
+    /// * Callers must ensure that the device does not read/write to/from memory while the returned
+    ///   slice is live.
+    /// * Callers must ensure that this call does not race with a write to the same region while
+    ///   the returned slice is live.
+    #[inline]
+    pub unsafe fn as_ref(&self) -> &T {
+        // SAFETY: per safety requirement.
+        unsafe { &*self.as_ptr() }
+    }
+
+    /// Returns a mutable reference to the data in the region.
     ///
-    /// # fn test(dev: &Device<Bound>) -> Result {
-    /// let c: CoherentAllocation<u64> =
-    ///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
-    /// # Ok::<(), Error>(()) }
-    /// ```
-    pub fn alloc_attrs(
+    /// # Safety
+    ///
+    /// * Callers must ensure that the device does not read/write to/from memory while the returned
+    ///   slice is live.
+    /// * Callers must ensure that this call does not race with a read or write to the same region
+    ///   while the returned slice is live.
+    #[expect(clippy::mut_from_ref, reason = "unsafe to use API")]
+    #[inline]
+    pub unsafe fn as_mut(&self) -> &mut T {
+        // SAFETY: per safety requirement.
+        unsafe { &mut *self.as_mut_ptr() }
+    }
+
+    /// Reads the value of `field` and ensures that its type is [`FromBytes`].
+    ///
+    /// # Safety
+    ///
+    /// This must be called from the [`dma_read`] macro which ensures that the `field` pointer is
+    /// validated beforehand.
+    ///
+    /// Public but hidden since it should only be used from [`dma_read`] macro.
+    #[doc(hidden)]
+    pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
+        // SAFETY:
+        // - By the safety requirements field is valid.
+        // - Using read_volatile() here is not sound as per the usual rules, the usage here is
+        // a special exception with the following notes in place. When dealing with a potential
+        // race from a hardware or code outside kernel (e.g. user-space program), we need that
+        // read on a valid memory is not UB. Currently read_volatile() is used for this, and the
+        // rationale behind is that it should generate the same code as READ_ONCE() which the
+        // kernel already relies on to avoid UB on data races. Note that the usage of
+        // read_volatile() is limited to this particular case, it cannot be used to prevent
+        // the UB caused by racing between two kernel functions nor do they provide atomicity.
+        unsafe { field.read_volatile() }
+    }
+
+    /// Writes a value to `field` and ensures that its type is [`AsBytes`].
+    ///
+    /// # Safety
+    ///
+    /// This must be called from the [`dma_write`] macro which ensures that the `field` pointer is
+    /// validated beforehand.
+    ///
+    /// Public but hidden since it should only be used from [`dma_write`] macro.
+    #[doc(hidden)]
+    pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
+        // SAFETY:
+        // - By the safety requirements field is valid.
+        // - Using write_volatile() here is not sound as per the usual rules, the usage here is
+        // a special exception with the following notes in place. When dealing with a potential
+        // race from a hardware or code outside kernel (e.g. user-space program), we need that
+        // write on a valid memory is not UB. Currently write_volatile() is used for this, and the
+        // rationale behind is that it should generate the same code as WRITE_ONCE() which the
+        // kernel already relies on to avoid UB on data races. Note that the usage of
+        // write_volatile() is limited to this particular case, it cannot be used to prevent
+        // the UB caused by racing between two kernel functions nor do they provide atomicity.
+        unsafe { field.write_volatile(val) }
+    }
+}
+
+impl<T: AsBytes + FromBytes> Coherent<T> {
+    /// Allocates a region of `T` of coherent memory.
+    #[expect(unused)]
+    fn alloc_with_attrs(
         dev: &device::Device<Bound>,
-        count: usize,
         gfp_flags: kernel::alloc::Flags,
         dma_attrs: Attrs,
-    ) -> Result<CoherentAllocation<T>> {
-        build_assert!(
-            core::mem::size_of::<T>() > 0,
-            "It doesn't make sense for the allocated type to be a ZST"
-        );
+    ) -> Result<Self> {
+        const {
+            assert!(
+                core::mem::size_of::<T>() > 0,
+                "It doesn't make sense for the allocated type to be a ZST"
+            );
+        }
 
-        let size = count
-            .checked_mul(core::mem::size_of::<T>())
-            .ok_or(EOVERFLOW)?;
         let mut dma_handle = 0;
         // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
         let addr = unsafe {
             bindings::dma_alloc_attrs(
                 dev.as_raw(),
-                size,
+                core::mem::size_of::<T>(),
                 &mut dma_handle,
                 gfp_flags.as_raw(),
                 dma_attrs.as_raw(),
             )
         };
-        let addr = NonNull::new(addr).ok_or(ENOMEM)?;
+        let cpu_addr = NonNull::new(addr.cast()).ok_or(ENOMEM)?;
         // INVARIANT:
-        // - We just successfully allocated a coherent region which is accessible for
-        //   `count` elements, hence the cpu address is valid. We also hold a refcounted reference
-        //   to the device.
-        // - The allocated `size` is equal to `size_of::<T> * count`.
-        // - The allocated `size` fits into a `usize`.
+        // - We just successfully allocated a coherent region which is adequately sized for `T`,
+        //   hence the cpu address is valid.
+        // - We also hold a refcounted reference to the device.
         Ok(Self {
             dev: dev.into(),
             dma_handle,
-            count,
-            cpu_addr: addr.cast(),
+            cpu_addr,
             dma_attrs,
         })
     }
 
-    /// Performs the same functionality as [`CoherentAllocation::alloc_attrs`], except the
-    /// `dma_attrs` is 0 by default.
-    pub fn alloc_coherent(
+    /// Allocates a region of `[T; len]` of coherent memory.
+    fn alloc_slice_with_attrs(
         dev: &device::Device<Bound>,
-        count: usize,
+        len: usize,
         gfp_flags: kernel::alloc::Flags,
-    ) -> Result<CoherentAllocation<T>> {
-        CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
+        dma_attrs: Attrs,
+    ) -> Result<Coherent<[T]>> {
+        const {
+            assert!(
+                core::mem::size_of::<T>() > 0,
+                "It doesn't make sense for the allocated type to be a ZST"
+            );
+        }
+
+        // `dma_alloc_attrs` cannot handle zero-length allocation, bail early.
+        if len == 0 {
+            Err(EINVAL)?;
+        }
+
+        let size = core::mem::size_of::<T>().checked_mul(len).ok_or(ENOMEM)?;
+        let mut dma_handle = 0;
+        // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
+        let addr = unsafe {
+            bindings::dma_alloc_attrs(
+                dev.as_raw(),
+                size,
+                &mut dma_handle,
+                gfp_flags.as_raw(),
+                dma_attrs.as_raw(),
+            )
+        };
+        let cpu_addr = NonNull::slice_from_raw_parts(NonNull::new(addr.cast()).ok_or(ENOMEM)?, len);
+        // INVARIANT:
+        // - We just successfully allocated a coherent region which is adequately sized for
+        //   `[T; len]`, hence the cpu address is valid.
+        // - We also hold a refcounted reference to the device.
+        Ok(Coherent {
+            dev: dev.into(),
+            dma_handle,
+            cpu_addr,
+            dma_attrs,
+        })
     }
+}
 
+impl<T: AsBytes + FromBytes> Coherent<[T]> {
     /// Returns the number of elements `T` in this allocation.
     ///
     /// Note that this is not the size of the allocation in bytes, which is provided by
     /// [`Self::size`].
-    pub fn count(&self) -> usize {
-        self.count
+    #[inline]
+    #[expect(clippy::len_without_is_empty, reason = "Coherent slice is never empty")]
+    pub fn len(&self) -> usize {
+        self.cpu_addr.len()
     }
+}
 
-    /// Returns the size in bytes of this allocation.
-    pub fn size(&self) -> usize {
-        // INVARIANT: The type invariant of `Self` guarantees that `size_of::<T> * count` fits into
-        // a `usize`.
-        self.count * core::mem::size_of::<T>()
-    }
+// Type alias for compatibility.
+#[doc(hidden)]
+pub type CoherentAllocation<T> = Coherent<[T]>;
 
-    /// Returns the raw pointer to the allocated region in the CPU's virtual address space.
-    #[inline]
-    pub fn as_ptr(&self) -> *const [T] {
-        core::ptr::slice_from_raw_parts(self.cpu_addr.as_ptr(), self.count)
+impl<T: AsBytes + FromBytes> CoherentAllocation<T> {
+    /// Allocates a region of `size_of::<T> * count` of coherent memory.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{attrs::*, CoherentAllocation};
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let c: CoherentAllocation<u64> =
+    ///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    pub fn alloc_attrs(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<CoherentAllocation<T>> {
+        Coherent::alloc_slice_with_attrs(dev, count, gfp_flags, dma_attrs)
     }
 
-    /// Returns the raw pointer to the allocated region in the CPU's virtual address space as
-    /// a mutable pointer.
-    #[inline]
-    pub fn as_mut_ptr(&self) -> *mut [T] {
-        core::ptr::slice_from_raw_parts_mut(self.cpu_addr.as_ptr(), self.count)
+    /// Performs the same functionality as [`CoherentAllocation::alloc_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    pub fn alloc_coherent(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<CoherentAllocation<T>> {
+        CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
     }
 
     /// Returns the base address to the allocated region in the CPU's virtual address space.
     pub fn start_ptr(&self) -> *const T {
-        self.cpu_addr.as_ptr()
+        self.as_ptr().cast()
     }
 
     /// Returns the base address to the allocated region in the CPU's virtual address space as
     /// a mutable pointer.
     pub fn start_ptr_mut(&mut self) -> *mut T {
-        self.cpu_addr.as_ptr()
-    }
-
-    /// Returns a DMA handle which may be given to the device as the DMA address base of
-    /// the region.
-    pub fn dma_handle(&self) -> DmaAddress {
-        self.dma_handle
+        self.as_mut_ptr().cast()
     }
 
     /// Returns a DMA handle starting at `offset` (in units of `T`) which may be given to the
@@ -504,11 +639,9 @@ pub fn dma_handle(&self) -> DmaAddress {
     ///
     /// Returns `EINVAL` if `offset` is not within the bounds of the allocation.
     pub fn dma_handle_with_offset(&self, offset: usize) -> Result<DmaAddress> {
-        if offset >= self.count {
+        if offset >= self.len() {
             Err(EINVAL)
         } else {
-            // INVARIANT: The type invariant of `Self` guarantees that `size_of::<T> * count` fits
-            // into a `usize`, and `offset` is inferior to `count`.
             Ok(self.dma_handle + (offset * core::mem::size_of::<T>()) as DmaAddress)
         }
     }
@@ -516,7 +649,7 @@ pub fn dma_handle_with_offset(&self, offset: usize) -> Result<DmaAddress> {
     /// Common helper to validate a range applied from the allocated region in the CPU's virtual
     /// address space.
     fn validate_range(&self, offset: usize, count: usize) -> Result {
-        if offset.checked_add(count).ok_or(EOVERFLOW)? > self.count {
+        if offset.checked_add(count).ok_or(EOVERFLOW)? > self.len() {
             return Err(EINVAL);
         }
         Ok(())
@@ -601,66 +734,20 @@ pub unsafe fn write(&mut self, src: &[T], offset: usize) -> Result {
         };
         Ok(())
     }
-
-    /// Reads the value of `field` and ensures that its type is [`FromBytes`].
-    ///
-    /// # Safety
-    ///
-    /// This must be called from the [`dma_read`] macro which ensures that the `field` pointer is
-    /// validated beforehand.
-    ///
-    /// Public but hidden since it should only be used from [`dma_read`] macro.
-    #[doc(hidden)]
-    pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
-        // SAFETY:
-        // - By the safety requirements field is valid.
-        // - Using read_volatile() here is not sound as per the usual rules, the usage here is
-        // a special exception with the following notes in place. When dealing with a potential
-        // race from a hardware or code outside kernel (e.g. user-space program), we need that
-        // read on a valid memory is not UB. Currently read_volatile() is used for this, and the
-        // rationale behind is that it should generate the same code as READ_ONCE() which the
-        // kernel already relies on to avoid UB on data races. Note that the usage of
-        // read_volatile() is limited to this particular case, it cannot be used to prevent
-        // the UB caused by racing between two kernel functions nor do they provide atomicity.
-        unsafe { field.read_volatile() }
-    }
-
-    /// Writes a value to `field` and ensures that its type is [`AsBytes`].
-    ///
-    /// # Safety
-    ///
-    /// This must be called from the [`dma_write`] macro which ensures that the `field` pointer is
-    /// validated beforehand.
-    ///
-    /// Public but hidden since it should only be used from [`dma_write`] macro.
-    #[doc(hidden)]
-    pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
-        // SAFETY:
-        // - By the safety requirements field is valid.
-        // - Using write_volatile() here is not sound as per the usual rules, the usage here is
-        // a special exception with the following notes in place. When dealing with a potential
-        // race from a hardware or code outside kernel (e.g. user-space program), we need that
-        // write on a valid memory is not UB. Currently write_volatile() is used for this, and the
-        // rationale behind is that it should generate the same code as WRITE_ONCE() which the
-        // kernel already relies on to avoid UB on data races. Note that the usage of
-        // write_volatile() is limited to this particular case, it cannot be used to prevent
-        // the UB caused by racing between two kernel functions nor do they provide atomicity.
-        unsafe { field.write_volatile(val) }
-    }
 }
 
 /// Note that the device configured to do DMA must be halted before this object is dropped.
-impl<T: AsBytes + FromBytes> Drop for CoherentAllocation<T> {
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> Drop for Coherent<T> {
     fn drop(&mut self) {
-        let size = self.count * core::mem::size_of::<T>();
+        let size = T::size(self.cpu_addr.as_ptr());
         // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
         // The cpu address, and the dma handle are valid due to the type invariants on
-        // `CoherentAllocation`.
+        // `Coherent`.
         unsafe {
             bindings::dma_free_attrs(
                 self.dev.as_raw(),
                 size,
-                self.start_ptr_mut().cast(),
+                self.cpu_addr.as_ptr().cast(),
                 self.dma_handle,
                 self.dma_attrs.as_raw(),
             )
@@ -668,20 +755,20 @@ fn drop(&mut self) {
     }
 }
 
-// SAFETY: It is safe to send a `CoherentAllocation` to another thread if `T`
+// SAFETY: It is safe to send a `Coherent` to another thread if `T`
 // can be sent to another thread.
-unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
+unsafe impl<T: AsBytes + FromBytes + KnownSize + Send + ?Sized> Send for Coherent<T> {}
 
 /// Reads a field of an item from an allocated region of structs.
 ///
 /// The syntax is of form `kernel::dma_read!(dma, proj)` where `dma` is an expression to an
-/// [`CoherentAllocation`] and `proj` is a [projection specification](kernel::ptr::project!).
+/// [`Coherent`] and `proj` is a [projection specification](kernel::ptr::project!).
 ///
 /// # Examples
 ///
 /// ```
 /// use kernel::device::Device;
-/// use kernel::dma::{attrs::*, CoherentAllocation};
+/// use kernel::dma::{attrs::*, Coherent};
 ///
 /// struct MyStruct { field: u32, }
 ///
@@ -690,7 +777,7 @@ unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 /// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
 /// unsafe impl kernel::transmute::AsBytes for MyStruct{};
 ///
-/// # fn test(alloc: &kernel::dma::CoherentAllocation<MyStruct>) -> Result {
+/// # fn test(alloc: &kernel::dma::Coherent<[MyStruct]>) -> Result {
 /// let whole = kernel::dma_read!(alloc, [2]?);
 /// let field = kernel::dma_read!(alloc, [1]?.field);
 /// # Ok::<(), Error>(()) }
@@ -700,17 +787,17 @@ macro_rules! dma_read {
     ($dma:expr, $($proj:tt)*) => {{
         let dma = &$dma;
         let ptr = $crate::ptr::project!(
-            $crate::dma::CoherentAllocation::as_ptr(dma), $($proj)*
+            $crate::dma::Coherent::as_ptr(dma), $($proj)*
         );
         // SAFETY: pointer created by projection is within DMA region.
-        unsafe { $crate::dma::CoherentAllocation::field_read(dma, ptr) }
+        unsafe { $crate::dma::Coherent::field_read(dma, ptr) }
     }};
 }
 
 /// Writes to a field of an item from an allocated region of structs.
 ///
 /// The syntax is of form `kernel::dma_write!(dma, proj, val)` where `dma` is an expression to an
-/// [`CoherentAllocation`] and `proj` is a [projection specification](kernel::ptr::project!),
+/// [`Coherent`] and `proj` is a [projection specification](kernel::ptr::project!),
 /// and `val` is the value to be written to the projected location.
 ///
 ///
@@ -718,7 +805,7 @@ macro_rules! dma_read {
 ///
 /// ```
 /// use kernel::device::Device;
-/// use kernel::dma::{attrs::*, CoherentAllocation};
+/// use kernel::dma::{attrs::*, Coherent};
 ///
 /// struct MyStruct { member: u32, }
 ///
@@ -727,7 +814,7 @@ macro_rules! dma_read {
 /// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
 /// unsafe impl kernel::transmute::AsBytes for MyStruct{};
 ///
-/// # fn test(alloc: &kernel::dma::CoherentAllocation<MyStruct>) -> Result {
+/// # fn test(alloc: &kernel::dma::Coherent<[MyStruct]>) -> Result {
 /// kernel::dma_write!(alloc, [2]?.member, 0xf);
 /// kernel::dma_write!(alloc, [1]?, MyStruct { member: 0xf });
 /// # Ok::<(), Error>(()) }
@@ -737,11 +824,11 @@ macro_rules! dma_write {
     (@parse [$dma:expr] [$($proj:tt)*] [, $val:expr]) => {{
         let dma = &$dma;
         let ptr = $crate::ptr::project!(
-            mut $crate::dma::CoherentAllocation::as_mut_ptr(dma), $($proj)*
+            mut $crate::dma::Coherent::as_mut_ptr(dma), $($proj)*
         );
         let val = $val;
         // SAFETY: pointer created by projection is within DMA region.
-        unsafe { $crate::dma::CoherentAllocation::field_write(dma, ptr, val) }
+        unsafe { $crate::dma::Coherent::field_write(dma, ptr, val) }
     }};
     (@parse [$dma:expr] [$($proj:tt)*] [.$field:tt $($rest:tt)*]) => {
         $crate::dma_write!(@parse [$dma] [$($proj)* .$field] [$($rest)*])
-- 
2.53.0

