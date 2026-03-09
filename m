Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ53NtH2rmnZKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:35:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E8623CCA6
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897BD10E568;
	Mon,  9 Mar 2026 16:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mDwXvrAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE7A10E558;
 Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 28B0944509;
 Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A38D9C2BCB2;
 Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773074118;
 bh=M2wvf00S2/NepjcwOTg0nKGdQToaxfiaijo9qaj8rYw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=mDwXvrARmG0Rt9IVtcr+6GfxEHOP+AG2Dcvw1DlyWu+9Nf90YTVknJtFd7YJVY4gQ
 HM7NyomUO5SdjBno//mRbEXLqXwgUYB5I3SIHW3CQp0kcXYG828Qwm34fkZnUvkzfL
 4XjS9j0Jc36Ykuo5j3X7wE9nTQMkifqQmXGdLuczsgaM1ga/ghfY4C2XYGrLJ+ESs3
 M1KVNKsgUZEcTcWkTQkvjHEEwgluUhL9lpvEEXE3x+2OytCLGXXU+1enYfguwS2R2j
 QJebrYRANlMVxHb+ZAwhspAtlJT3PR/s4ix8To4fQIW5dN5EK2Ull8vnugvwnneKg2
 3/qaXz2Q/tqMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFE7F4180E;
 Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Date: Mon, 09 Mar 2026 12:34:19 -0400
Subject: [PATCH v4 2/4] rust: ptr: add projection infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-drm-rust-next-v4-2-4ef485b19a4c@proton.me>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
In-Reply-To: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Boqun Feng <boqun@kernel.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, driver-core@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773074117; l=15953;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=miLP0yl3FjGCpj96QFx68fa6u7hqlgNIww43hMgjNq8=;
 b=eA0m7RkR/mSGXK0WMRmnkmdjAaQ+cSBVISnJrKWvXCW5yra/kqFDo2rbTPpWQrbv/rw/l7HK0
 3DN0iiv4XALCtKc8uHMdcxNRIIWlTKx758rQtfIlPT7rczFVgSv3NWM
X-Developer-Key: i=tim.kovalenko@proton.me; a=ed25519;
 pk=/+OiulEpgeZifgP4mDE4e5YlV6nMeY+frze/lY/xiHI=
X-Endpoint-Received: by B4 Relay for tim.kovalenko@proton.me/20260212 with
 auth_id=635
X-Original-From: Tim Kovalenko <tim.kovalenko@proton.me>
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
Reply-To: tim.kovalenko@proton.me
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 88E8623CCA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[tim.kovalenko.proton.me];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[tim.kovalenko@proton.me];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

Add a generic infrastructure for performing field and index projections on
raw pointers. This will form the basis of performing I/O projections.

Pointers manipulations are intentionally using the safe wrapping variants
instead of the unsafe variants, as the latter requires pointers to be
inside an allocation which is not necessarily true for I/O pointers.

This projection macro protects against rogue `Deref` implementation, which
can causes the projected pointer to be outside the bounds of starting
pointer. This is extremely unlikely and Rust has a lint to catch this, but
is unsoundness regardless. The protection works by inducing type inference
ambiguity when `Deref` is implemented.

This projection macro also stops projecting into unaligned fields (i.e.
fields of `#[repr(packed)]` structs), as misaligned pointers require
special handling. This is implemented by attempting to create reference to
projected field inside a `if false` block. Despite being unreachable, Rust
still checks that they're not unaligned fields.

The projection macro supports both fallible and infallible index
projections. These are described in detail inside the documentation.

Signed-off-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/lib.rs            |   3 +
 rust/kernel/ptr.rs            |   3 +
 rust/kernel/ptr/projection.rs | 294 ++++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.build        |   4 +-
 4 files changed, 303 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 510cc7fe496113f85c34f420b1c4be95596297ad..d93292d47420f1f298a452ade5feefedce5ade86 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -38,6 +38,9 @@
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
 //
+// Stable since Rust 1.84.0.
+#![feature(strict_provenance)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index cf980a103acf19ee3bd17bb1dfdbcadfe30467ae..930f523a4659b2cd5974e681ebf4c15c892a5e5a 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -2,6 +2,9 @@
 
 //! Types and functions to work with pointers and addresses.
 
+pub mod projection;
+pub use crate::project_pointer as project;
+
 use core::mem::{
     align_of,
     size_of, //
diff --git a/rust/kernel/ptr/projection.rs b/rust/kernel/ptr/projection.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7686d8502095108b90e863e90cbc3a626c65031e
--- /dev/null
+++ b/rust/kernel/ptr/projection.rs
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Infrastructure for handling projections.
+
+use core::{
+    mem::MaybeUninit,
+    ops::Deref, //
+};
+
+use crate::prelude::*;
+
+/// Error raised when a projection is attempted on array or slices out of bounds.
+pub struct OutOfBound;
+
+impl From<OutOfBound> for Error {
+    #[inline(always)]
+    fn from(_: OutOfBound) -> Self {
+        ERANGE
+    }
+}
+
+/// A helper trait to perform index projection.
+///
+/// This is similar to `core::slice::SliceIndex`, but operate on raw pointers safely and fallibly.
+///
+/// # Safety
+///
+/// The implementation of `index` and `get` (if `Some` is returned) must ensure that, if provided
+/// input pointer `slice` and returned pointer `output`, then:
+/// - `output` has the same provenance as `slice`;
+/// - `output.byte_offset_from(slice)` is between 0 to
+///   `KnownSize::size(slice) - KnownSize::size(output)`.
+///
+/// This means that if the input pointer is valid, then pointer returned by `get` or `index` is
+/// also valid.
+#[diagnostic::on_unimplemented(message = "`{Self}` cannot be used to index `{T}`")]
+#[doc(hidden)]
+pub unsafe trait ProjectIndex<T: ?Sized>: Sized {
+    type Output: ?Sized;
+
+    /// Returns an index-projected pointer, if in bounds.
+    fn get(self, slice: *mut T) -> Option<*mut Self::Output>;
+
+    /// Returns an index-projected pointer; fail the build if it cannot be proved to be in bounds.
+    #[inline(always)]
+    fn index(self, slice: *mut T) -> *mut Self::Output {
+        Self::get(self, slice).unwrap_or_else(|| build_error!())
+    }
+}
+
+// Forward array impl to slice impl.
+// SAFETY: safety requirement guaranteed by the forwarded impl.
+unsafe impl<T, I, const N: usize> ProjectIndex<[T; N]> for I
+where
+    I: ProjectIndex<[T]>,
+{
+    type Output = <I as ProjectIndex<[T]>>::Output;
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T; N]) -> Option<*mut Self::Output> {
+        <I as ProjectIndex<[T]>>::get(self, slice)
+    }
+
+    #[inline(always)]
+    fn index(self, slice: *mut [T; N]) -> *mut Self::Output {
+        <I as ProjectIndex<[T]>>::index(self, slice)
+    }
+}
+
+// SAFETY: `get` returned pointers has same provenance as `slice` and the offset is checked to not
+// exceed the required bound.
+unsafe impl<T> ProjectIndex<[T]> for usize {
+    type Output = T;
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut T> {
+        if self >= slice.len() {
+            None
+        } else {
+            Some(slice.cast::<T>().wrapping_add(self))
+        }
+    }
+}
+
+// SAFETY: `get` returned pointers has same provenance as `slice` and the offset is checked to not
+// exceed the required bound.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::Range<usize> {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        let new_len = self.end.checked_sub(self.start)?;
+        if self.end > slice.len() {
+            return None;
+        }
+        Some(core::ptr::slice_from_raw_parts_mut(
+            slice.cast::<T>().wrapping_add(self.start),
+            new_len,
+        ))
+    }
+}
+
+// SAFETY: safety requirement guaranteed by the forwarded impl.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::RangeTo<usize> {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        (0..self.end).get(slice)
+    }
+}
+
+// SAFETY: safety requirement guaranteed by the forwarded impl.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::RangeFrom<usize> {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        (self.start..slice.len()).get(slice)
+    }
+}
+
+// SAFETY: `get` returned the pointer as is, so it always have the same provenance and offset of 0.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::RangeFull {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        Some(slice)
+    }
+}
+
+/// A helper trait to perform field projection.
+///
+/// This trait has a `DEREF` generic parameter so it can be implemented twice for types that
+/// implement `Deref`. This will cause an ambiguity error and thus block `Deref` types being used
+/// as base of projection, as they can inject unsoundness. Users therefore must not specify `DEREF`
+/// and should always leave it to be inferred.
+///
+/// # Safety
+///
+/// `proj` may only invoke `f` with a valid allocation, as documentation described.
+#[doc(hidden)]
+pub unsafe trait ProjectField<const DEREF: bool> {
+    /// Project a pointer to a type to a pointer of a field.
+    ///
+    /// `f` may only be invoked with a valid allocation so it can safely obtain raw pointers to
+    /// fields using `&raw mut`.
+    ///
+    /// This is needed because `base` might not point to a valid allocation, while `&raw mut`
+    /// requires pointers to be in bounds of a valid allocation.
+    ///
+    /// # Safety
+    ///
+    /// `f` must return a pointer in bounds of the provided pointer.
+    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mut F) -> *mut F;
+}
+
+// NOTE: in theory, this API should work for `T: ?Sized` and `F: ?Sized`, too. However we cannot
+// currently support that as we need to obtain a valid allocation that `&raw const` can operate on.
+// SAFETY: `proj` invokes `f` with valid allocation.
+unsafe impl<T> ProjectField<false> for T {
+    #[inline(always)]
+    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mut F) -> *mut F {
+        // Create a valid allocation to start projection, as `base` is not necessarily so. The
+        // memory is never actually used so it will be optimized out, so it should work even for
+        // very large `T` (`memoffset` crate also relies on this). To be extra certain, we also
+        // annotate `f` closure with `#[inline(always)]` in the macro.
+        let mut place = MaybeUninit::uninit();
+        let place_base = place.as_mut_ptr();
+        let field = f(place_base);
+        // SAFETY: `field` is in bounds from `base` per safety requirement.
+        let offset = unsafe { field.byte_offset_from(place_base) };
+        // Use `wrapping_byte_offset` as `base` does not need to be of valid allocation.
+        base.wrapping_byte_offset(offset).cast()
+    }
+}
+
+// SAFETY: vacuously satisfied.
+unsafe impl<T: Deref> ProjectField<true> for T {
+    #[inline(always)]
+    unsafe fn proj<F>(_: *mut Self, _: impl FnOnce(*mut Self) -> *mut F) -> *mut F {
+        build_error!("this function is a guard against `Deref` impl and is never invoked");
+    }
+}
+
+/// Create a projection from a raw pointer.
+///
+/// The projected pointer is within the memory region marked by the input pointer. There is no
+/// requirement that the input raw pointer needs to be valid, so this macro may be used for
+/// projecting pointers outside normal address space, e.g. I/O pointers. However, if the input
+/// pointer is valid, the projected pointer is also valid.
+///
+/// Supported projections include field projections and index projections.
+/// It is not allowed to project into types that implement custom `Deref` or `Index`.
+///
+/// The macro has basic syntax of `kernel::ptr::project!(ptr, projection)`, where `ptr` is an
+/// expression that evaluates to a raw pointer which serves as the base of projection. `projection`
+/// can be a projection expression of form `.field` (normally identifer, or numeral in case of
+/// tuple structs) or of form `[index]`.
+///
+/// If mutable pointer is needed, the macro input can be prefixed with `mut` keyword, i.e.
+/// `kernel::ptr::project!(mut ptr, projection)`. By default, a const pointer is created.
+///
+/// `ptr::project!` macro can perform both fallible indexing and build-time checked indexing.
+/// `[index]` form performs build-time bounds checking; if compiler fails to prove `[index]` is in
+/// bounds, compilation will fail. `[index]?` can be used to perform runtime bounds checking;
+/// `OutOfBound` error is raised via `?` if the index is out of bounds.
+///
+/// # Examples
+///
+/// Field projections are performed with `.field_name`:
+/// ```
+/// struct MyStruct { field: u32, }
+/// let ptr: *const MyStruct = core::ptr::dangling();
+/// let field_ptr: *const u32 = kernel::ptr::project!(ptr, .field);
+///
+/// struct MyTupleStruct(u32, u32);
+///
+/// fn proj(ptr: *const MyTupleStruct) {
+///     let field_ptr: *const u32 = kernel::ptr::project!(ptr, .1);
+/// }
+/// ```
+///
+/// Index projections are performed with `[index]`:
+/// ```
+/// fn proj(ptr: *const [u8; 32]) -> Result {
+///     let field_ptr: *const u8 = kernel::ptr::project!(ptr, [1]);
+///     // This will fail the build.
+///     // kernel::ptr::project!(ptr, [128]);
+///     // This will raise an `OutOfBound` error (which is convertable to `ERANGE`).
+///     kernel::ptr::project!(ptr, [128]?);
+///     Ok(())
+/// }
+/// ```
+///
+/// If you need to match on the error instead of propagate, put the invocation inside a closure:
+/// ```
+/// let ptr: *const [u8; 32] = core::ptr::dangling();
+/// let field_ptr: Result<*const u8> = (|| -> Result<_> {
+///     Ok(kernel::ptr::project!(ptr, [128]?))
+/// })();
+/// assert!(field_ptr.is_err());
+/// ```
+///
+/// For mutable pointers, put `mut` as the first token in macro invocation.
+/// ```
+/// let ptr: *mut [(u8, u16); 32] = core::ptr::dangling_mut();
+/// let field_ptr: *mut u16 = kernel::ptr::project!(mut ptr, [1].1);
+/// ```
+#[macro_export]
+macro_rules! project_pointer {
+    (@gen $ptr:ident, ) => {};
+    // Field projection. `$field` needs to be `tt` to support tuple index like `.0`.
+    (@gen $ptr:ident, .$field:tt $($rest:tt)*) => {
+        // SAFETY: the provided closure always return in bounds pointer.
+        let $ptr = unsafe {
+            $crate::ptr::projection::ProjectField::proj($ptr, #[inline(always)] |ptr| {
+                // Check unaligned field. Not all users (e.g. DMA) can handle unaligned
+                // projections.
+                if false {
+                    let _ = &(*ptr).$field;
+                }
+                // SAFETY: `$field` is in bounds, and no implicit `Deref` is possible (if the
+                // type implements `Deref`, Rust cannot infer the generic parameter `DEREF`).
+                &raw mut (*ptr).$field
+            })
+        };
+        $crate::ptr::project!(@gen $ptr, $($rest)*)
+    };
+    // Fallible index projection.
+    (@gen $ptr:ident, [$index:expr]? $($rest:tt)*) => {
+        let $ptr = $crate::ptr::projection::ProjectIndex::get($index, $ptr)
+            .ok_or($crate::ptr::projection::OutOfBound)?;
+        $crate::ptr::project!(@gen $ptr, $($rest)*)
+    };
+    // Build-time checked index projection.
+    (@gen $ptr:ident, [$index:expr] $($rest:tt)*) => {
+        let $ptr = $crate::ptr::projection::ProjectIndex::index($index, $ptr);
+        $crate::ptr::project!(@gen $ptr, $($rest)*)
+    };
+    (mut $ptr:expr, $($proj:tt)*) => {{
+        let ptr: *mut _ = $ptr;
+        $crate::ptr::project!(@gen ptr, $($proj)*);
+        ptr
+    }};
+    ($ptr:expr, $($proj:tt)*) => {{
+        let ptr = <*const _>::cast_mut($ptr);
+        // We currently always project using mutable pointer, as it is not decided whether `&raw
+        // const` allows the resulting pointer to be mutated (see documentation of `addr_of!`).
+        $crate::ptr::project!(@gen ptr, $($proj)*);
+        ptr.cast_const()
+    }};
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 32e209bc7985cbf26ad8af2b986fbd1920aa3bd4..3652b85be54594e3616be5a92c1967035e9d919d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -310,16 +310,18 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 
 # The features in this list are the ones allowed for non-`rust/` code.
 #
+#   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`.
 #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
+#   - Stable since Rust 1.84.0: `feature(strict_provenance)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.53.0


