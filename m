Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75149C038A3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 23:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7703010E956;
	Thu, 23 Oct 2025 21:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G76+xp9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCC310E956
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 21:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761254821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ec9XuEAOd1i63X1HJfT6rmGoUxLBZchaMJ1ZJPi2fiM=;
 b=G76+xp9Z/iNWp2gYIe218lhjwVfFPdMncrVpQ7rqYrre42pfZdETCGHfdeiNwTWiS163Rj
 I0wrwi0MuOz5FrQyJArvYTz9v83iZwZqCKS2T5lwhCrP+4/v/x17IAYRqnCYmpR3B3NMCf
 O/1OW/Z3UACTu5iX4MdOsCYJ+o1cFoQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-QZ_OnJohMFOQY0vSWSK_bg-1; Thu,
 23 Oct 2025 17:26:57 -0400
X-MC-Unique: QZ_OnJohMFOQY0vSWSK_bg-1
X-Mimecast-MFC-AGG-ID: QZ_OnJohMFOQY0vSWSK_bg_1761254815
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B33AB1953988; Thu, 23 Oct 2025 21:26:53 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.64.235])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 04E4C30002EC; Thu, 23 Oct 2025 21:26:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v5 7/8] rust: Introduce iosys_map bindings
Date: Thu, 23 Oct 2025 17:22:09 -0400
Message-ID: <20251023212540.1141999-8-lyude@redhat.com>
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

This introduces a set of bindings for working with iosys_map in rust code.
The design of this is heavily based off the design for both the io and
dma_map bindings for Rust.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V5:
- Fix incorrect field size being passed to iosys_map_memcpy_to()
- Add an additional unit test, basic_macro(), which can successfully catch
  the above issue so it doesn't happen again in the future.

 rust/helpers/helpers.c   |   1 +
 rust/helpers/iosys_map.c |  15 +
 rust/kernel/iosys_map.rs | 705 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs       |   1 +
 4 files changed, 722 insertions(+)
 create mode 100644 rust/helpers/iosys_map.c
 create mode 100644 rust/kernel/iosys_map.rs

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 36d40f911345c..d549af697bd60 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -31,6 +31,7 @@
 #include "irq.c"
 #include "fs.c"
 #include "io.c"
+#include "iosys_map.c"
 #include "jump_label.c"
 #include "kunit.c"
 #include "maple_tree.c"
diff --git a/rust/helpers/iosys_map.c b/rust/helpers/iosys_map.c
new file mode 100644
index 0000000000000..b105261c3cf8a
--- /dev/null
+++ b/rust/helpers/iosys_map.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/iosys-map.h>
+
+void rust_helper_iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
+				     const void *src, size_t len)
+{
+	iosys_map_memcpy_to(dst, dst_offset, src, len);
+}
+
+void rust_helper_iosys_map_memcpy_from(void *dst, const struct iosys_map *src,
+				       size_t src_offset, size_t len)
+{
+	iosys_map_memcpy_from(dst, src, src_offset, len);
+}
diff --git a/rust/kernel/iosys_map.rs b/rust/kernel/iosys_map.rs
new file mode 100644
index 0000000000000..4da0ab57cf35c
--- /dev/null
+++ b/rust/kernel/iosys_map.rs
@@ -0,0 +1,705 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! IO-agnostic memory mapping interfaces.
+//!
+//! This crate provides bindings for the `struct iosys_map` type, which provides a common interface
+//! for memory mappings which can reside within coherent memory, or within IO memory.
+//!
+//! C header: [`include/linux/iosys-map.h`](srctree/include/linux/pci.h)
+
+use crate::{
+    prelude::*,
+    transmute::{AsBytes, FromBytes},
+};
+use bindings;
+use core::{
+    marker::PhantomData,
+    mem::{self, MaybeUninit},
+    ops::{Deref, DerefMut, Range},
+    slice,
+};
+
+/// Raw unsized representation of a `struct iosys_map`.
+///
+/// This struct is a transparent wrapper around `struct iosys_map`. The C API does not provide the
+/// size of the mapping by default, and thus this type also does not include the size of the
+/// mapping. As such, it cannot be used for actually accessing the underlying data pointed to by the
+/// mapping.
+///
+/// With the exception of kernel crates which may provide their own wrappers around `RawIoSysMap`,
+/// users will typically not interact with this type directly.
+pub struct RawIoSysMap<T: AsBytes + FromBytes>(bindings::iosys_map, PhantomData<T>);
+
+impl<T: AsBytes + FromBytes> RawIoSysMap<T> {
+    /// Convert from a raw `bindings::iosys_map`.
+    #[expect(unused)]
+    #[inline]
+    pub(crate) fn from_raw(val: bindings::iosys_map) -> Self {
+        Self(val, PhantomData)
+    }
+
+    /// Convert from a `RawIoSysMap<T>` to a raw `bindings::iosys_map` ref.
+    #[inline]
+    pub(crate) fn as_raw(&self) -> &bindings::iosys_map {
+        &self.0
+    }
+
+    /// Convert from a `RawIoSysMap<T>` to a raw mutable `bindings::iosys_map` ref.
+    #[inline]
+    pub(crate) fn as_raw_mut(&mut self) -> &mut bindings::iosys_map {
+        &mut self.0
+    }
+
+    /// Returns whether the mapping is within IO memory space or not.
+    #[inline]
+    pub fn is_iomem(&self) -> bool {
+        self.0.is_iomem
+    }
+
+    /// Returns the size of a single item in this mapping.
+    pub const fn item_size(&self) -> usize {
+        mem::size_of::<T>()
+    }
+
+    /// Returns a mutable address to the memory pointed to by this iosys map.
+    ///
+    /// Note that this address is not guaranteed to reside in system memory, and may reside in IO
+    /// memory.
+    #[inline]
+    pub fn as_mut_ptr(&self) -> *mut T {
+        if self.is_iomem() {
+            // SAFETY: We confirmed above that this iosys map is contained within iomem, so it's
+            // safe to read vaddr_iomem
+            unsafe { self.0.__bindgen_anon_1.vaddr_iomem }
+        } else {
+            // SAFETY: We confirmed above that this iosys map is not contaned within iomem, so it's
+            // safe to read vaddr.
+            unsafe { self.0.__bindgen_anon_1.vaddr }
+        }
+        .cast()
+    }
+
+    /// Returns an immutable address to the memory pointed to by this iosys map.
+    ///
+    /// Note that this address is not guaranteed to reside in system memory, and may reside in IO
+    /// memory.
+    #[inline]
+    pub fn as_ptr(&self) -> *const T {
+        self.as_mut_ptr().cast_const()
+    }
+}
+
+// SAFETY: As we make no guarantees about the validity of the mapping, there's no issue with sending
+// this type between threads.
+unsafe impl<T: AsBytes + FromBytes> Send for RawIoSysMap<T> {}
+
+impl<T: AsBytes + FromBytes> Clone for RawIoSysMap<T> {
+    fn clone(&self) -> Self {
+        Self(self.0, PhantomData)
+    }
+}
+
+/// A sized version of a [`RawIoSysMap`].
+///
+/// Since this type includes the size of the [`RawIoSysMap`], it can be used for accessing the
+/// underlying data pointed to by it.
+///
+/// # Invariants
+///
+/// - The iosys mapping referenced by this type is guaranteed to be of at least `size` bytes in
+///   size
+/// - The iosys mapping referenced by this type is valid for the lifetime `'a`.
+#[derive(Clone)]
+pub struct IoSysMapRef<'a, T: AsBytes + FromBytes> {
+    map: RawIoSysMap<T>,
+    size: usize,
+    _p: PhantomData<&'a T>,
+}
+
+impl<'a, T: AsBytes + FromBytes> IoSysMapRef<'a, T> {
+    /// Create a new [`IoSysMapRef`] from a [`RawIoSysMap`].
+    ///
+    /// # Safety
+    ///
+    /// - The caller guarantees that the mapping referenced by `map` is of at least `size` bytes in
+    ///   size.
+    /// - The caller guarantees that the mapping referenced by `map` remains valid for the lifetime
+    ///   of `'a`.
+    #[allow(unused)]
+    pub(crate) unsafe fn new(map: RawIoSysMap<T>, size: usize) -> IoSysMapRef<'a, T> {
+        // INVARIANT: Our safety contract fulfills the type invariants of `IoSysMapRef`.
+        IoSysMapRef {
+            map,
+            size,
+            _p: PhantomData,
+        }
+    }
+
+    /// Return the size of the `IoSysMapRef`.
+    #[inline]
+    pub fn size(&self) -> usize {
+        self.size
+    }
+
+    /// Returns an immutable reference slice to data from the region starting from `offset`.
+    ///
+    /// `offset` and `count` are in units of `T`. Note that this function requires that the
+    /// underlying iosys mapping does not reside within iomem.
+    ///
+    /// This function can return the following errors:
+    ///
+    /// * [`ENOTSUPP`] if the memory region resides in iomem.
+    /// * [`EOVERFLOW`] if calculating the length of the slice results in an overflow.
+    /// * [`EINVAL`] if the slice would go out of bounds of the memory region.
+    ///
+    /// # Safety
+    ///
+    /// * The caller promises that the memory pointed to by for this `IoSysMapRef` is not written to
+    ///   while the returned slice is live.
+    /// * Callers must ensure that this call does not race with a write to the same region while the
+    ///   returned slice is alive.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::iosys_map::*;
+    ///
+    /// # fn test() -> Result {
+    /// # let map = tests::VecIoSysMap::new(&[1, 2, 3])?;
+    /// # let map = map.get();
+    /// // SAFETY: We are the only ones with access to `map`.
+    /// let slice = unsafe { map.as_slice(0, 3)? };
+    /// assert_eq!(*slice, [1, 2, 3]);
+    ///
+    /// let slice = unsafe { map.as_slice(1, 2)? };
+    /// assert_eq!(*slice, [2, 3]);
+    /// # Ok::<(), Error>(()) }
+    /// # assert!(test().is_ok());
+    /// ```
+    pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
+        if self.is_iomem() {
+            return Err(ENOTSUPP);
+        }
+
+        let range = self.validate_range(offset, count)?;
+
+        // SAFETY:
+        // * `self.validate_range()` is guaranteed to return a range within this memory allocation
+        //   that is contained within the iosys_map and is properly aligned to the size of
+        //   `T`.
+        // * We checked above that the memory pointed to by this iosys map doesn't reside in iomem,
+        //   so it must reside in system memory - ensuring that `self.addr_mut()` returns a valid
+        //   virtual memory address.
+        Ok(unsafe { slice::from_raw_parts(self.as_ptr().byte_add(range.start), count) })
+    }
+
+    /// Returns a mutable reference slice to data from the region starting from `offset`.
+    ///
+    /// `offset` and `count` are in units of `T`. Note that this function requires that the
+    /// underlying iosys mapping does not reside within iomem.
+    ///
+    /// For a list of errors this function can return, see [`as_slice`](Self::as_slice).
+    ///
+    /// # Safety
+    ///
+    /// The caller promises that the memory region pointed to by this `IoSysMapRef` is not written
+    /// to or read from while the returned slice is live.
+    pub unsafe fn as_mut_slice(&mut self, offset: usize, count: usize) -> Result<&mut [T]> {
+        if self.is_iomem() {
+            return Err(ENOTSUPP);
+        }
+
+        let range = self.validate_range(offset, count)?;
+
+        // SAFETY:
+        // * `self.validate_range()` is guaranteed to return a range within this memory allocation
+        //   that is contained within the iosys_map and is properly aligned to the size of
+        //   `T`.
+        // * We checked above that the memory pointed to by this iosys map doesn't reside in iomem,
+        //   so it must reside in system memory - ensuring that `self.addr_mut()` returns a valid
+        //   virtual memory address.
+        Ok(unsafe { slice::from_raw_parts_mut(self.as_mut_ptr().byte_add(range.start), count) })
+    }
+
+    /// Writes `src` to the region starting from `offset`.
+    ///
+    /// `offset` is in units of `T`, not the number of bytes.
+    ///
+    /// This function can return the following errors:
+    ///
+    /// * [`EOVERFLOW`] if calculating the length of the slice results in an overflow.
+    /// * [`EINVAL`] if the slice would go out of bounds of the memory region.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::iosys_map::*;
+    ///
+    /// # fn test() -> Result {
+    /// # let map = tests::VecIoSysMap::new(&[0; 3])?;
+    /// # let mut map = map.get();
+    /// map.write(&[1, 2, 3], 0)?; // (now [1, 2, 3])
+    /// map.write(&[4], 2)?; // (now [1, 2, 4])
+    ///
+    /// // SAFETY: We are the only ones with access to `map`
+    /// let slice = unsafe { map.as_slice(0, 3)? };
+    /// assert_eq!(slice, [1, 2, 4]);
+    ///
+    /// # Ok::<(), Error>(()) }
+    /// # assert!(test().is_ok());
+    /// ```
+    pub fn write(&mut self, src: &[T], offset: usize) -> Result {
+        let range = self.validate_range(offset, src.len())?;
+
+        // SAFETY:
+        // - The address pointed to by this iosys_map is guaranteed to be valid via IoSysMapRef's
+        //   type invariants.
+        // - `self.validate_range()` always returns a valid range of memory within said memory.
+        unsafe {
+            bindings::iosys_map_memcpy_to(
+                self.as_raw_mut(),
+                range.start,
+                src.as_ptr().cast(),
+                range.len(),
+            )
+        };
+
+        Ok(())
+    }
+
+    /// Attempt to compute the offset of an item within the iosys map using its index.
+    ///
+    /// Returns an error if an overflow occurs.
+    ///
+    /// # Safety
+    ///
+    /// This function checks for overflows, but it explicitly does not check if the offset goes out
+    /// of bounds. It is the caller's responsibility to check for this before using the returned
+    /// offset with the iosys_map API.
+    unsafe fn item_from_index(&self, idx: usize) -> Result<usize> {
+        self.item_size().checked_mul(idx).ok_or(EOVERFLOW)
+    }
+
+    /// Common helper to compute and validate a range for a specific data type applied from
+    /// within the allocated region of the iosys mapping.
+    ///
+    /// This function returns the computed range if it doesn't overflow, and the range is valid
+    /// within the allocated region of the iosys mapping. This is so that the computation may
+    /// be reused.
+    ///
+    /// On success, the range returned by this function is guaranteed:
+    ///
+    /// * To be a valid range of memory within the virtual mapping for this gem object.
+    /// * To be properly aligned to [`RawIoSysMap::item_size()`].
+    fn validate_range(&self, offset: usize, count: usize) -> Result<Range<usize>> {
+        // SAFETY: If the offset is out of bounds, we'll catch this via overflow checks or when
+        // checking range_end.
+        let offset = unsafe { self.item_from_index(offset)? };
+        let range_size = count.checked_mul(self.item_size()).ok_or(EOVERFLOW)?;
+        let range_end = offset.checked_add(range_size).ok_or(EOVERFLOW)?;
+
+        if range_end > self.size() {
+            return Err(EINVAL);
+        }
+
+        // INVARIANT: Since `offset` and `count` are both in units of `T`, we're guaranteed that the
+        // range returned here is properly aligned to `T`.
+        Ok(offset..range_end)
+    }
+
+    /// Common helper to compute the memory address of an item within the iosys mapping.
+    ///
+    /// Public but hidden, since it should only be used from [`iosys_map_read`] and
+    /// [`iosys_map_write`].
+    #[doc(hidden)]
+    pub fn ptr_from_index(&self, offset: usize) -> Result<*mut T> {
+        // SAFETY: We check if the resulting offset goes out of bounds below.
+        let offset = unsafe { self.item_from_index(offset)? };
+
+        if offset.checked_add(self.item_size()).ok_or(EOVERFLOW)? > self.size() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: We confirmed that `offset` + the item size does not go out of bounds above.
+        Ok(unsafe { self.as_mut_ptr().byte_add(offset) })
+    }
+
+    // TODO:
+    // This function is currently needed for making the iosys_map_read!() and iosys_map_write!()
+    // macros work due to a combination of a few limitations:
+    //
+    // * The current C API for iosys_map requires that we use offsets for reading/writing
+    //   iosys_maps.
+    // * Calculating the offset of a field within a struct requires that we either:
+    //   * Use field projection for calculating the offset of the field. We don't have this yet.
+    //   * Explicitly specify the type of the struct, which would be cumbersome to require in the
+    //     read/write macros.
+    //   * Provide a typed pointer (or other reference) to the struct in question, allowing the
+    //     use of &raw const and &raw mut.
+    //     * Keep in mind: we can't simply cast the offset of an item in the iosys map into a typed
+    //       pointer to fulfill the third option. While having invalid memory addresses as pointers
+    //       is ok, adding an offset to a pointer in rust requires that the resulting memory address
+    //       is within the same allocation. Since an invalid pointer has no allocation, we can't
+    //       make that guarantee.
+    //
+    // So, until we have field projection the way we workaround this:
+    //
+    // * Calculate the offset (self.item_from_index()) of the struct within the iosys map
+    // * Calculate the memory address of the struct using the offset from the last step
+    //   (self.ptr_from_index()).
+    // * Use that memory address with &raw const/&raw mut in order to calculate the memory address
+    //   of the desired field, ensuring it remains in the same allocation (happens within the
+    //   macros).
+    // * Convert the address from the last step back into an offset within the iosys map
+    //   (offset_from_ptr()).
+    //
+    // Once we do get field projection, this silly code should be removed.
+    //
+    /// Convert a pointer to an item within the iosys map back into an offset.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must be a valid pointer to data within the iosys map.
+    unsafe fn offset_from_ptr<F>(&self, ptr: *const F) -> usize {
+        // SAFETY: `ptr` always points to data within the memory pointed to by the iosys map,
+        // meaning it is within the same memory allocation.
+        //
+        // Additionally, since `ptr` is within the iosys mapping, the offset here will always be
+        // positive and safe to cast to a usize.
+        // (TODO: replace this with byte_offset_from_unsigned once it's available in the kernel)
+        unsafe { ptr.byte_offset_from(self.as_ptr()) as usize }
+    }
+
+    /// Reads the value of `field` and ensures that its type is [`FromBytes`].
+    ///
+    /// # Safety
+    ///
+    /// This must be called from the [`iosys_map_read`] macro which ensures that the `field`
+    /// pointer is validated beforehand.
+    ///
+    /// Public but hidden since it should only be used from the [`iosys_map_read`] macro.
+    #[doc(hidden)]
+    pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
+        let mut field_val = MaybeUninit::<F>::uninit();
+
+        // SAFETY: `field` is guaranteed valid via our safety contract.
+        let offset = unsafe { self.offset_from_ptr(field) };
+
+        // SAFETY: Since we verified `field` is valid above, `offset_from_ptr` will always return a
+        // valid offset within the iosys map.
+        unsafe {
+            bindings::iosys_map_memcpy_from(
+                field_val.as_mut_ptr().cast(),
+                self.as_raw(),
+                offset,
+                mem::size_of::<F>(),
+            )
+        }
+
+        // SAFETY: We just initialized `field_val` above.
+        unsafe { field_val.assume_init() }
+    }
+
+    /// Writes the value of `field` and ensures that its type is [`AsBytes`].
+    ///
+    /// # Safety
+    ///
+    /// This must be called from the [`iosys_map_write`] macro which ensures that the `field`
+    /// pointers validated beforehand.
+    ///
+    /// Public but hidden since it should only be used from the [`iosys_map_write`] macro.
+    #[doc(hidden)]
+    pub unsafe fn field_write<F: AsBytes>(&mut self, field: *mut F, val: F) {
+        // SAFETY: `field` is guaranteed valid via our safety contract.
+        let offset = unsafe { self.offset_from_ptr(field) };
+
+        // SAFETY: `offset_from_ptr` always returns a valid offset within the iosys map.
+        unsafe {
+            bindings::iosys_map_memcpy_to(
+                self.as_raw_mut(),
+                offset,
+                core::ptr::from_ref(&val).cast(),
+                mem::size_of::<F>(),
+            )
+        }
+    }
+}
+
+impl<'a, T: AsBytes + FromBytes> Deref for IoSysMapRef<'a, T> {
+    type Target = RawIoSysMap<T>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.map
+    }
+}
+
+impl<'a, T: AsBytes + FromBytes> DerefMut for IoSysMapRef<'a, T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.map
+    }
+}
+
+/// Reads from a field of an item from an iosys map ref.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{iosys_map::*, transmute::*};
+///
+/// #[derive(Copy, Clone, Debug, PartialEq, Eq)]
+/// struct MyStruct { a: u32, b: u16 }
+///
+/// // SAFETY: All bit patterns are acceptable values for `MyStruct`.
+/// unsafe impl FromBytes for MyStruct {};
+/// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
+/// unsafe impl AsBytes for MyStruct {};
+///
+/// # fn test() -> Result {
+/// # let map = tests::VecIoSysMap::new(&[MyStruct { a: 42, b: 2 }; 3])?;
+/// # let map = map.get();
+/// let whole = kernel::iosys_map_read!(map[2])?;
+/// assert_eq!(whole, MyStruct { a: 42, b: 2 });
+///
+/// let field = kernel::iosys_map_read!(map[1].b)?;
+/// assert_eq!(field, 2);
+/// # Ok::<(), Error>(()) }
+/// # assert!(test().is_ok());
+/// ```
+#[macro_export]
+macro_rules! iosys_map_read {
+    ($map:expr, $idx:expr, $($field:tt)*) => {{
+        (|| -> ::core::result::Result<_, $crate::error::Error> {
+            let map = &$map;
+            let item = $crate::iosys_map::IoSysMapRef::ptr_from_index(map, $idx)?;
+
+            // SAFETY: `ptr_from_index()` ensures that `item` is always a valid (although
+            // potentially not dereferenceable, which is fine here) pointer to within the iosys
+            // mapping.
+            unsafe {
+                let ptr_field = &raw const (*item) $($field)*;
+                ::core::result::Result::Ok(
+                    $crate::iosys_map::IoSysMapRef::field_read(map, ptr_field)
+                )
+            }
+        })()
+    }};
+    ($map:ident [ $idx: expr ] $($field:tt)* ) => {
+        $crate::iosys_map_read!($map, $idx, $($field)*)
+    };
+    ($($map:ident).* [ $idx:expr ] $($field:tt)* ) => {
+        $crate::iosys_map_read!($($map).*, $idx, $($field)*)
+    };
+}
+
+/// Writes to a field of an item from an iosys map ref.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{iosys_map::*, transmute::*};
+///
+/// #[derive(Copy, Clone, Debug, PartialEq, Eq)]
+/// struct MyStruct { a: u32, b: u16 };
+///
+/// // SAFETY: All bit patterns are acceptable values for `MyStruct`.
+/// unsafe impl FromBytes for MyStruct {};
+/// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
+/// unsafe impl AsBytes for MyStruct {};
+///
+/// # fn test() -> Result {
+/// # let map = tests::VecIoSysMap::new(&[MyStruct { a: 42, b: 2 }; 3])?;
+/// # let mut map = map.get();
+/// kernel::iosys_map_write!(map[2].b = 1337)?;
+/// # assert_eq!(kernel::iosys_map_read!(map[2].b)?, 1337);
+///
+/// kernel::iosys_map_write!(map[1] = MyStruct { a: 10, b: 20 })?;
+/// # assert_eq!(kernel::iosys_map_read!(map[1])?, MyStruct { a: 10, b: 20 });
+/// # Ok::<(), Error>(()) }
+/// # assert!(test().is_ok());
+/// ```
+#[macro_export]
+macro_rules! iosys_map_write {
+    ($map:ident [ $idx:expr ] $($field:tt)*) => {{
+        $crate::iosys_map_write!($map, $idx, $($field)*)
+    }};
+    ($($map:ident).* [ $idx:expr ] $($field:tt)* ) => {{
+        $crate::iosys_map_write!($($map).*, $idx, $($field)*)
+    }};
+    ($map:expr, $idx:expr, = $val:expr) => {
+        (|| -> ::core::result::Result<_, $crate::error::Error> {
+            // (expand these outside of the unsafe block (clippy::macro-metavars-in-unsafe)
+            let map = &mut $map;
+            let val = $val;
+
+            let item = $crate::iosys_map::IoSysMapRef::ptr_from_index(map, $idx)?;
+            // SAFETY: `item_from_index` ensures that `item` is always a valid item.
+            unsafe { $crate::iosys_map::IoSysMapRef::field_write(map, item, val) };
+            ::core::result::Result::Ok(())
+        })()
+    };
+    ($map:expr, $idx:expr, $(.$field:ident)* = $val:expr) => {
+        (|| -> ::core::result::Result<_, $crate::error::Error> {
+            // (expand these outside of the unsafe block (clippy::macro-metavars-in-unsafe)
+            let map = &mut $map;
+            let val = $val;
+
+            let item = $crate::iosys_map::IoSysMapRef::ptr_from_index(map, $idx)?;
+
+            // SAFETY: `ptr_from_index()` ensures that `item` is always a valid (although
+            // potentially not dereferenceable, which is fine here) pointer to within the iosys
+            // mapping.
+            unsafe {
+                let ptr_field = &raw mut (*item) $(.$field)*;
+                $crate::iosys_map::IoSysMapRef::field_write(map, ptr_field, val)
+            };
+            ::core::result::Result::Ok(())
+        })()
+    };
+}
+
+#[doc(hidden)]
+#[kunit_tests(rust_iosys_map)]
+pub mod tests {
+    use super::*;
+
+    /// A helper struct for managed IoSysMapRef structs which point to a [`Vec`].
+    pub struct VecIoSysMap<T: AsBytes + FromBytes + Clone> {
+        map: RawIoSysMap<T>,
+        vec: KVec<T>,
+    }
+
+    impl<T: AsBytes + FromBytes + Clone> VecIoSysMap<T> {
+        pub fn new(src: &[T]) -> Result<Self> {
+            let mut vec = KVec::<T>::new();
+
+            vec.extend_from_slice(src, GFP_KERNEL)?;
+
+            let map = RawIoSysMap(
+                bindings::iosys_map {
+                    is_iomem: false,
+                    __bindgen_anon_1: bindings::iosys_map__bindgen_ty_1 {
+                        vaddr: vec.as_mut_ptr().cast(),
+                    },
+                },
+                PhantomData,
+            );
+
+            Ok(Self { map, vec })
+        }
+
+        pub fn get(&self) -> IoSysMapRef<'_, T> {
+            // SAFETY: `map` points to `vec`, so the size of `map` is the size of the `vec`.
+            unsafe { IoSysMapRef::new(self.map.clone(), self.vec.len() * self.map.item_size()) }
+        }
+    }
+
+    #[test]
+    fn basic() -> Result {
+        let map = VecIoSysMap::new(&[0; 3])?;
+        let mut map = map.get();
+
+        map.write(&[1, 2, 3], 0)?;
+
+        // SAFETY: We are the only ones with access to map.
+        assert_eq!(unsafe { map.as_slice(0, 3)? }, [1, 2, 3]);
+
+        map.write(&[42], 1)?;
+
+        // SAFETY: We are the only ones with access to the map.
+        assert_eq!(unsafe { map.as_slice(0, 3)? }, [1, 42, 3]);
+
+        // SAFETY: We are the only ones with access to the map.
+        assert_eq!(unsafe { map.as_slice(1, 1)? }, [42]);
+
+        Ok(())
+    }
+
+    #[test]
+    fn oob_accesses() -> Result {
+        let map = VecIoSysMap::new(&[0; 3])?;
+        let mut map = map.get();
+
+        // SAFETY: We are the only ones with access to map.
+        assert!(unsafe { map.as_slice(0, 4) }.is_err());
+
+        // SAFETY: We are the only ones with access to map.
+        assert!(unsafe { map.as_slice(1, 3) }.is_err());
+
+        assert!(map.write(&[1, 2, 3, 69], 0).is_err());
+        assert!(map.write(&[1, 2, 3], 69).is_err());
+
+        Ok(())
+    }
+
+    #[test]
+    fn overflows() -> Result {
+        let map = VecIoSysMap::new(&[0; 3])?;
+        let mut map = map.get();
+
+        // SAFETY: We are the only ones with access to map.
+        assert!(unsafe { map.as_slice(usize::MAX, 3) }.is_err());
+
+        // SAFETY: We are the only ones with access to map.
+        assert!(unsafe { map.as_slice(0, usize::MAX) }.is_err());
+
+        assert!(map.write(&[1, 2, 3], usize::MAX).is_err());
+
+        Ok(())
+    }
+
+    #[derive(Copy, Clone, Debug, PartialEq, Eq)]
+    struct TestStruct {
+        a: u32,
+        b: u64,
+    }
+
+    // SAFETY: All bit patterns are acceptable values for `TestStruct`.
+    unsafe impl FromBytes for TestStruct {}
+    // SAFETY: Instances of `TestStruct` have no uninitialized portions.
+    unsafe impl AsBytes for TestStruct {}
+
+    #[test]
+    fn basic_macro() -> Result {
+        let mut expected = [TestStruct { a: 1, b: 2 }; 5];
+        let map = VecIoSysMap::new(&expected)?;
+        let mut map = map.get();
+
+        iosys_map_write!(map[3].a = u32::MAX)?;
+        expected[3].a = u32::MAX;
+
+        assert_eq!(iosys_map_read!(map[3].a)?, u32::MAX);
+        assert_eq!(iosys_map_read!(map[3])?, TestStruct { a: u32::MAX, b: 2 });
+
+        // Compare the entire array, so that we catch any mis-sized writes.
+        // SAFETY: We are the only ones with access to map.
+        assert_eq!(expected, unsafe { map.as_slice(0, 5)? });
+
+        Ok(())
+    }
+
+    #[test]
+    fn macro_oob_accesses() -> Result {
+        let map = VecIoSysMap::new(&[TestStruct { a: 1, b: 2 }; 3])?;
+        let mut map = map.get();
+
+        assert!(iosys_map_read!(map[5].b).is_err());
+        assert!(iosys_map_read!(map[1000]).is_err());
+        assert!(iosys_map_write!(map[6969].a = 999).is_err());
+        assert!(iosys_map_write!(map[243] = TestStruct { a: 99, b: 22 }).is_err());
+
+        Ok(())
+    }
+
+    #[test]
+    fn macro_overflows() -> Result {
+        let map = VecIoSysMap::new(&[TestStruct { a: 1, b: 2 }; 3])?;
+        let mut map = map.get();
+
+        assert!(iosys_map_read!(map[usize::MAX]).is_err());
+        assert!(iosys_map_read!(map[usize::MAX].b).is_err());
+        assert!(iosys_map_write!(map[usize::MAX] = TestStruct { a: 1, b: 1 }).is_err());
+        assert!(iosys_map_write!(map[usize::MAX].b = 1).is_err());
+
+        Ok(())
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3dd7bebe78882..a10d50076c872 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -98,6 +98,7 @@
 pub mod init;
 pub mod io;
 pub mod ioctl;
+pub mod iosys_map;
 pub mod iov;
 pub mod irq;
 pub mod jump_label;
-- 
2.51.0

