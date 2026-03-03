Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN2pDRILp2mJcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CD1F3B35
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1174B10E85F;
	Tue,  3 Mar 2026 16:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bmk0Z2oM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D61110E86B;
 Tue,  3 Mar 2026 16:23:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8467541B5E;
 Tue,  3 Mar 2026 16:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADDDC116C6;
 Tue,  3 Mar 2026 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772555022;
 bh=+liU4pQNiYF4RC3Z3F4oQnCGR+HREs2Sq3MMzyTGAOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bmk0Z2oMWzuq509fyO1v/aQOfoxTxOlzclkhD5GNbCyhMh2yu7FChr7EvI1YQFM37
 Fx5Mp4iZ2DPDaE+dXPD5pHJ4jClMOez0HOTmtreERsarMbW/eVna6KcaUiexSp+Hjv
 Jze0+p30dGCWoZXalXq1WaWwbtypMGwe5IPDaZSyirikkHoc6dx9Ee5JXE/8vTK4i0
 DxBMAxlOHejyxts5d7/HXVI62feIhiQC6h//7SBUWvWUiNsr8Nb0sCvAVxXew1tuLK
 4/c/3cEZ20EAZCdl4DInvPgBRsrOAjU0ohTE3xerRQKGN5oVMVR4FxemYsjIxAhnwn
 AcNgedmkzliPg==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 5/8] rust: dma: add Coherent:init() and
 Coherent::init_with_attrs()
Date: Tue,  3 Mar 2026 17:22:56 +0100
Message-ID: <20260303162314.94363-6-dakr@kernel.org>
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
X-Rspamd-Queue-Id: F37CD1F3B35
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

Analogous to Coherent::zeroed() and Coherent::zeroed_with_attrs(), add
Coherent:init() and Coherent::init_with_attrs() which both take an impl
Init<T, E> argument initializing the DMA coherent memory.

Compared to CoherentInit, Coherent::init() is a one-shot constructor
that runs an Init closure and immediately exposes the DMA handle,
whereas CoherentInit is a multi-stage initializer that provides safe
&mut T access by withholding the DMA address until converted to
Coherent.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 79dd8717ac47..d77c1b6cb0c4 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -706,6 +706,43 @@ pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> R
         Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
     }
 
+    /// Same as [`Coherent::zeroed_with_attrs`], but instead of a zero-initialization the memory is
+    /// initialized with `init`.
+    pub fn init_with_attrs<E>(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+        init: impl Init<T, E>,
+    ) -> Result<Self>
+    where
+        Error: From<E>,
+    {
+        let dmem = Self::alloc_with_attrs(dev, gfp_flags, dma_attrs)?;
+        let ptr = dmem.as_mut_ptr();
+
+        // SAFETY:
+        // - `ptr` is valid, properly aligned, and points to exclusively owned memory.
+        // - If `__init` fails, `self` is dropped, which safely frees the underlying `Coherent`'s
+        //   DMA memory. `T: AsBytes + FromBytes` ensures there are no complex `Drop` requirements
+        //   we are bypassing.
+        unsafe { init.__init(ptr)? };
+
+        Ok(dmem)
+    }
+
+    /// Same as [`Coherent::zeroed`], but instead of a zero-initialization the memory is initialized
+    /// with `init`.
+    pub fn init<E>(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        init: impl Init<T, E>,
+    ) -> Result<Self>
+    where
+        Error: From<E>,
+    {
+        Self::init_with_attrs(dev, gfp_flags, Attrs(0), init)
+    }
+
     /// Allocates a region of `[T; len]` of coherent memory.
     fn alloc_slice_with_attrs(
         dev: &device::Device<Bound>,
-- 
2.53.0

