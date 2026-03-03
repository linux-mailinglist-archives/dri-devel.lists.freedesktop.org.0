Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL8TEg8Lp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABB41F3B1F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF02610E857;
	Tue,  3 Mar 2026 16:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pJgBC+lu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0986210E859;
 Tue,  3 Mar 2026 16:23:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 762B060008;
 Tue,  3 Mar 2026 16:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7715CC2BCB0;
 Tue,  3 Mar 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772555018;
 bh=lvS+2efafKwewwHd7ONO5y6+Y49CgHw8VIi3bRKXV+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pJgBC+luK2vnGf5VECQogdIin5ejUVwJ/MBgNwPKigPRYTo/X/75Uvpvtl1UqQyl7
 RbTf4I7YXeQzkGZSuMMi78LymclByTCU/nZCfaFzxJ3PjPARKunoJjZUIpRLe2KBhD
 0kFdsmbFWb2lB/vgFeBoJPn9gAJLrdmfZTnYToaYTzHAynJXDe4dKlQVT46ytElXSm
 CSnqQ/AHK1LQzsN4CM3fCW3iI+0Dl4grK40RbexUN5CeBKI3ypdKx8jdxNY+x03fEm
 JE8W+fRcAnDYouuuGTOWAOeQleLw2OGwaK/NVpTLWuyjU2jN/+g7NBnlqHtpldZ09j
 2f8W8c8jXw6YA==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory
 initialization
Date: Tue,  3 Mar 2026 17:22:55 +0100
Message-ID: <20260303162314.94363-5-dakr@kernel.org>
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
X-Rspamd-Queue-Id: DABB41F3B1F
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Currently, dma::Coherent cannot safely provide (mutable) access to its
underlying memory because the memory might be concurrently accessed by a
DMA device. This makes it difficult to safely initialize the memory
before handing it over to the hardware.

Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
before its DMA address is exposed to the device. dma::CoherentInit can
guarantee exclusive access to the inner dma::Coherent and implement
Deref and DerefMut.

Once the memory is properly initialized, dma::CoherentInit can be
converted into a regular dma::Coherent.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 153 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 291fdea3b52b..79dd8717ac47 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -20,7 +20,13 @@
         FromBytes, //
     }, //
 };
-use core::ptr::NonNull;
+use core::{
+    ops::{
+        Deref,
+        DerefMut, //
+    },
+    ptr::NonNull, //
+};
 
 /// DMA address type.
 ///
@@ -352,6 +358,151 @@ fn from(direction: DataDirection) -> Self {
     }
 }
 
+/// Initializer type for [`Coherent`].
+///
+/// A [`Coherent`] object can't provide access to its memory as (mutable) slice safely, since it
+/// can't fulfill the requirements for creating a slice. For instance, it is not valid to have a
+/// (mutable) slice to of the memory of a [`Coherent`] while the memory might be accessed by a
+/// device.
+///
+/// In contrast, this initializer type is able to fulfill the requirements to safely obtain a
+/// (mutable) slice, as it neither provides access to the DMA address of the embedded [`Coherent`],
+/// nor can it be used with the DMA projection accessors.
+///
+/// Once initialized, this type can be converted to a regular [`Coherent`] object.
+///
+/// # Examples
+///
+/// `CoherentInit<T>`:
+///
+/// ```
+/// # use kernel::device::{
+/// #     Bound,
+/// #     Device,
+/// # };
+/// use kernel::dma::{attrs::*,
+///     Coherent,
+///     CoherentInit,
+/// };
+///
+/// # fn test(dev: &Device<Bound>) -> Result {
+/// let mut dmem: CoherentInit<u64> =
+///     CoherentInit::zeroed_with_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+/// *dmem = 42;
+/// let dmem: Coherent<u64> = dmem.into();
+/// # Ok::<(), Error>(()) }
+/// ```
+///
+/// `CoherentInit<[T]>`:
+///
+///
+/// ```
+/// # use kernel::device::{
+/// #     Bound,
+/// #     Device,
+/// # };
+/// use kernel::dma::{attrs::*,
+///     Coherent,
+///     CoherentInit,
+/// };
+///
+/// # fn test(dev: &Device<Bound>) -> Result {
+/// let mut dmem: CoherentInit<[u64]> =
+///     CoherentInit::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+/// dmem.fill(42);
+/// let dmem: Coherent<[u64]> = dmem.into();
+/// # Ok::<(), Error>(()) }
+/// ```
+pub struct CoherentInit<T: AsBytes + FromBytes + KnownSize + ?Sized>(Coherent<T>);
+
+impl<T: AsBytes + FromBytes> CoherentInit<[T]> {
+    /// Initializer variant of [`Coherent::zeroed_slice_with_attrs`].
+    pub fn zeroed_slice_with_attrs(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Coherent::zeroed_slice_with_attrs(dev, count, gfp_flags, dma_attrs).map(Self)
+    }
+
+    /// Same as [CoherentInit::zeroed_slice_with_attrs], but with `dma::Attrs(0)`.
+    pub fn zeroed_slice(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Self> {
+        Self::zeroed_slice_with_attrs(dev, count, gfp_flags, Attrs(0))
+    }
+
+    /// Initializes the element at `i` using the given initializer.
+    ///
+    /// Returns `EINVAL` if `i` is out of bounds.
+    pub fn init_at<E>(&mut self, i: usize, init: impl Init<T, E>) -> Result
+    where
+        Error: From<E>,
+    {
+        if i >= self.0.len() {
+            return Err(EINVAL);
+        }
+
+        let ptr = core::ptr::from_mut(&mut self[i]);
+
+        // SAFETY:
+        // - `ptr` is valid, properly aligned, and within this allocation.
+        // - `T: AsBytes + FromBytes` guarantees all bit patterns are valid, so partial writes on
+        //   error cannot leave the element in an invalid state.
+        // - The DMA address has not been exposed yet, so there is no concurrent device access.
+        unsafe { init.__init(ptr)? };
+
+        Ok(())
+    }
+}
+
+impl<T: AsBytes + FromBytes> CoherentInit<T> {
+    /// Same as [`CoherentInit::zeroed_slice_with_attrs`], but for a single element.
+    pub fn zeroed_with_attrs(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Coherent::zeroed_with_attrs(dev, gfp_flags, dma_attrs).map(Self)
+    }
+
+    /// Same as [`CoherentInit::zeroed_slice`], but for a single element.
+    pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> Result<Self> {
+        Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
+    }
+}
+
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> Deref for CoherentInit<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY:
+        // - We have not exposed the DMA address yet, so there can't be any concurrent access by a
+        //   device.
+        // - We have exclusive access to `self.0`.
+        unsafe { self.0.as_ref() }
+    }
+}
+
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> DerefMut for CoherentInit<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY:
+        // - We have not exposed the DMA address yet, so there can't be any concurrent access by a
+        //   device.
+        // - We have exclusive access to `self.0`.
+        unsafe { self.0.as_mut() }
+    }
+}
+
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> From<CoherentInit<T>> for Coherent<T> {
+    fn from(value: CoherentInit<T>) -> Self {
+        value.0
+    }
+}
+
 /// An abstraction of the `dma_alloc_coherent` API.
 ///
 /// This is an abstraction around the `dma_alloc_coherent` API which is used to allocate and map
-- 
2.53.0

