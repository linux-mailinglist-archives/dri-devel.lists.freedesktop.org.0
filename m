Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNBdMgsLp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D571F3B0F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E8010E858;
	Tue,  3 Mar 2026 16:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CINpFcQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE36C10E865;
 Tue,  3 Mar 2026 16:23:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 54BC060008;
 Tue,  3 Mar 2026 16:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E9FC19425;
 Tue,  3 Mar 2026 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772555014;
 bh=2KpsdZwDEoGsFZo4mcehIAvYG9ASAGAxsst8MTspzNM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CINpFcQGYvbR4YvZESh+564qUW9h1Drprf79ZT8AiYiKKCLinSv3zb9hMtDAicQ2v
 sFwHmTkwr7S6S+1v729+qDlKvJsaobdCNbFbVjqHF5dLK4kEuWIQiZNpT9myRHpwbu
 sulikvPjA7VlcMZwjqIDOdcbaammLmbO+RG0OTJjlGRzJsfA8bjLBKqugjzL26M363
 nZCryzqnQQBG5YhZ/94KNoJ5Md3SGF3vr6GLPnuIG1SkOGWEtaDA3infQH9PAMjW1k
 Zoukdz/1mCYfEiUIiU+HJZ1zz7F7uTVOr+V7NfXkOR7VFcZK/cnTA7Cj/n58Q5gL3D
 USgcqQskKmQtA==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/8] rust: dma: add zeroed constructor to `Coherent`
Date: Tue,  3 Mar 2026 17:22:54 +0100
Message-ID: <20260303162314.94363-4-dakr@kernel.org>
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
X-Rspamd-Queue-Id: F2D571F3B0F
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

These constructors create a coherent container of a single object
instead of slice. They are named `zeroed` and `zeroed_with_attrs` to
emphasis that they are created initialized zeroed. It is intended that
there'll be new constructors that take `PinInit` instead of zeroing.

Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs       | 77 +++++++++++++++++++++++++++++++++++-----
 samples/rust/rust_dma.rs |  8 ++---
 2 files changed, 73 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 3a692ac76ba2..291fdea3b52b 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -47,7 +47,7 @@ pub trait Device: AsRef<device::Device<Core>> {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -64,7 +64,7 @@ unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -83,7 +83,7 @@ unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -102,7 +102,7 @@ unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_max_seg_size(&self, size: u32) {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -202,12 +202,12 @@ pub const fn value(&self) -> u64 {
 ///
 /// ```
 /// # use kernel::device::{Bound, Device};
-/// use kernel::dma::{attrs::*, CoherentAllocation};
+/// use kernel::dma::{attrs::*, Coherent};
 ///
 /// # fn test(dev: &Device<Bound>) -> Result {
 /// let attribs = DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_WARN;
-/// let c: CoherentAllocation<u64> =
-///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, attribs)?;
+/// let c: Coherent<[u64]> =
+///     Coherent::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, attribs)?;
 /// # Ok::<(), Error>(()) }
 /// ```
 #[derive(Clone, Copy, PartialEq)]
@@ -492,7 +492,6 @@ pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
 
 impl<T: AsBytes + FromBytes> Coherent<T> {
     /// Allocates a region of `T` of coherent memory.
-    #[expect(unused)]
     fn alloc_with_attrs(
         dev: &device::Device<Bound>,
         gfp_flags: kernel::alloc::Flags,
@@ -529,6 +528,33 @@ fn alloc_with_attrs(
         })
     }
 
+    /// Allocates a region of type `T` of coherent memory.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{attrs::*, Coherent};
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let c: Coherent<[u64; 4]> =
+    ///     Coherent::zeroed_with_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    pub fn zeroed_with_attrs(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Self::alloc_with_attrs(dev, gfp_flags | __GFP_ZERO, dma_attrs)
+    }
+
+    /// Performs the same functionality as [`Coherent::zeroed_with_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> Result<Self> {
+        Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
+    }
+
     /// Allocates a region of `[T; len]` of coherent memory.
     fn alloc_slice_with_attrs(
         dev: &device::Device<Bound>,
@@ -572,6 +598,41 @@ fn alloc_slice_with_attrs(
             dma_attrs,
         })
     }
+
+    /// Allocates a zeroed region of type `T` of coherent memory.
+    ///
+    /// Unlike `Coherent::<[T; N]>::zeroed_with_attrs`, `Coherent::<T>::zeored_slices` support
+    /// a runtime length.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{attrs::*, Coherent};
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let c: Coherent<[u64]> =
+    ///     Coherent::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    pub fn zeroed_slice_with_attrs(
+        dev: &device::Device<Bound>,
+        len: usize,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Coherent<[T]>> {
+        Coherent::alloc_slice_with_attrs(dev, len, gfp_flags | __GFP_ZERO, dma_attrs)
+    }
+
+    /// Performs the same functionality as [`Coherent::zeroed_slice_with_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    pub fn zeroed_slice(
+        dev: &device::Device<Bound>,
+        len: usize,
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Coherent<[T]>> {
+        Self::zeroed_slice_with_attrs(dev, len, gfp_flags, Attrs(0))
+    }
 }
 
 impl<T: AsBytes + FromBytes> Coherent<[T]> {
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index ce39b5545097..314ef51cd86c 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -6,7 +6,7 @@
 
 use kernel::{
     device::Core,
-    dma::{CoherentAllocation, DataDirection, Device, DmaMask},
+    dma::{Coherent, DataDirection, Device, DmaMask},
     page, pci,
     prelude::*,
     scatterlist::{Owned, SGTable},
@@ -16,7 +16,7 @@
 #[pin_data(PinnedDrop)]
 struct DmaSampleDriver {
     pdev: ARef<pci::Device>,
-    ca: CoherentAllocation<MyStruct>,
+    ca: Coherent<[MyStruct]>,
     #[pin]
     sgt: SGTable<Owned<VVec<u8>>>,
 }
@@ -64,8 +64,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             // SAFETY: There are no concurrent calls to DMA allocation and mapping primitives.
             unsafe { pdev.dma_set_mask_and_coherent(mask)? };
 
-            let ca: CoherentAllocation<MyStruct> =
-                CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
+            let ca: Coherent<[MyStruct]> =
+                Coherent::zeroed_slice(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
             for (i, value) in TEST_VALUES.into_iter().enumerate() {
                 kernel::dma_write!(ca, [i]?, MyStruct::new(value.0, value.1));
-- 
2.53.0

