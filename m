Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAiUHhsLp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1430D1F3B75
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AFD10E874;
	Tue,  3 Mar 2026 16:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OX5R1rGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9854910E871;
 Tue,  3 Mar 2026 16:23:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0B9F760008;
 Tue,  3 Mar 2026 16:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008EFC116C6;
 Tue,  3 Mar 2026 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772555030;
 bh=sjmFT1BethSxXRjKz3v5DqaLtJGPmc3qrxzO8Mx+Gkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OX5R1rGjIVQhugnA4adMhjT3v0fvbmh5Ql4V7W1aD96do/gGSRTvf7hSI/y0Srdzw
 6A1tCRsdvNvuUZw0la6UdZmaqrmcmnTRVOMJU3Fg+2HJp44h32EewzaZTP1wCYN6Ha
 aAR/yruJVRY0lwWK4+WbgPzASf47E7gb3G828E5wFe0WXAanp4iKoxeR2SpYlri/fn
 6hpn6sCE/hAiSNXpPYEqn0lnZLl9j6/blsAExJkq514JlFJH6fW//dRFkWTM0WvzBX
 +d3/aoazHoLtr7akyPzYQA89yB2XjSeN/CzllLEvE7QZhsU3EeTywPlxmupTBfL1gI
 yd0UPSFPce9NQ==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 7/8] gpu: nova-core: convert Gsp::new() to use CoherentInit
Date: Tue,  3 Mar 2026 17:22:58 +0100
Message-ID: <20260303162314.94363-8-dakr@kernel.org>
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
X-Rspamd-Queue-Id: 1430D1F3B75
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

Convert libos (LibosMemoryRegionInitArgument) and rmargs
(GspArgumentsPadded) to use CoherentInit / Coherent::init() and simplify
the initialization. This also avoids separate initialization on the
stack.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gsp.rs    | 47 +++++++++++--------------
 drivers/gpu/nova-core/gsp/fw.rs | 62 +++++++++++++++++++++++----------
 2 files changed, 65 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 25cd48514c77..cb7f6b4dc0f8 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -5,10 +5,11 @@
 use kernel::{
     device,
     dma::{
+        Coherent,
         CoherentAllocation,
+        CoherentInit,
         DmaAddress, //
     },
-    dma_write,
     pci,
     prelude::*,
     transmute::AsBytes, //
@@ -104,7 +105,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
 #[pin_data]
 pub(crate) struct Gsp {
     /// Libos arguments.
-    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    pub(crate) libos: Coherent<[LibosMemoryRegionInitArgument]>,
     /// Init log buffer.
     loginit: LogBuffer,
     /// Interrupts log buffer.
@@ -114,7 +115,7 @@ pub(crate) struct Gsp {
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
-    rmargs: CoherentAllocation<GspArgumentsPadded>,
+    rmargs: Coherent<GspArgumentsPadded>,
 }
 
 impl Gsp {
@@ -123,34 +124,28 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
+            // Initialise the logging structures. The OpenRM equivalents are in:
+            // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+            // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
             Ok(try_pin_init!(Self {
-                libos: CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
-                    dev,
-                    GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
-                    GFP_KERNEL | __GFP_ZERO,
-                )?,
                 loginit: LogBuffer::new(dev)?,
                 logintr: LogBuffer::new(dev)?,
                 logrm: LogBuffer::new(dev)?,
                 cmdq: Cmdq::new(dev)?,
-                rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_coherent(
-                    dev,
-                    1,
-                    GFP_KERNEL | __GFP_ZERO,
-                )?,
-                _: {
-                    // Initialise the logging structures. The OpenRM equivalents are in:
-                    // _kgspInitLibosLoggingStructures (allocates memory for buffers)
-                    // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
-                    dma_write!(
-                        libos, [0]?, LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)
-                    );
-                    dma_write!(
-                        libos, [1]?, LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
-                    );
-                    dma_write!(libos, [2]?, LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0));
-                    dma_write!(rmargs, [0]?.inner, fw::GspArgumentsCached::new(cmdq));
-                    dma_write!(libos, [3]?, LibosMemoryRegionInitArgument::new("RMARGS", rmargs));
+                rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadded::new(cmdq))?,
+                libos: {
+                    let mut libos = CoherentInit::zeroed_slice(
+                        dev,
+                        GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+                        GFP_KERNEL,
+                    )?;
+
+                    libos.init_at(0, LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
+                    libos.init_at(1, LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
+                    libos.init_at(2, LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+                    libos.init_at(3, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
+
+                    libos.into()
                 },
             }))
         })
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 751d5447214d..59cb03a9b238 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -9,11 +9,12 @@
 use core::ops::Range;
 
 use kernel::{
-    dma::CoherentAllocation,
+    dma::Coherent,
     prelude::*,
     ptr::{
         Alignable,
-        Alignment, //
+        Alignment,
+        KnownSize, //
     },
     sizes::{
         SZ_128K,
@@ -568,7 +569,9 @@ unsafe impl AsBytes for RunCpuSequencer {}
 /// The memory allocated for the arguments must remain until the GSP sends the
 /// init_done RPC.
 #[repr(transparent)]
-pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
+pub(crate) struct LibosMemoryRegionInitArgument {
+    inner: bindings::LibosMemoryRegionInitArgument,
+}
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.
 unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
@@ -578,10 +581,10 @@ unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
 unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
 
 impl LibosMemoryRegionInitArgument {
-    pub(crate) fn new<A: AsBytes + FromBytes>(
+    pub(crate) fn new<'a, A: AsBytes + FromBytes + KnownSize + ?Sized>(
         name: &'static str,
-        obj: &CoherentAllocation<A>,
-    ) -> Self {
+        obj: &'a Coherent<A>,
+    ) -> impl Init<Self> + 'a {
         /// Generates the `ID8` identifier required for some GSP objects.
         fn id8(name: &str) -> u64 {
             let mut bytes = [0u8; core::mem::size_of::<u64>()];
@@ -593,7 +596,8 @@ fn id8(name: &str) -> u64 {
             u64::from_ne_bytes(bytes)
         }
 
-        Self(bindings::LibosMemoryRegionInitArgument {
+        #[allow(non_snake_case)]
+        let init_inner = init!(bindings::LibosMemoryRegionInitArgument {
             id8: id8(name),
             pa: obj.dma_handle(),
             size: num::usize_as_u64(obj.size()),
@@ -603,7 +607,11 @@ fn id8(name: &str) -> u64 {
             loc: num::u32_into_u8::<
                 { bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM },
             >(),
-            ..Default::default()
+            ..Zeroable::init_zeroed()
+        });
+
+        init!(LibosMemoryRegionInitArgument {
+            inner <- init_inner,
         })
     }
 }
@@ -814,15 +822,23 @@ unsafe impl FromBytes for GspMsgElement {}
 
 /// Arguments for GSP startup.
 #[repr(transparent)]
-pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
+#[derive(Zeroable)]
+pub(crate) struct GspArgumentsCached {
+    inner: bindings::GSP_ARGUMENTS_CACHED,
+}
 
 impl GspArgumentsCached {
     /// Creates the arguments for starting the GSP up using `cmdq` as its command queue.
-    pub(crate) fn new(cmdq: &Cmdq) -> Self {
-        Self(bindings::GSP_ARGUMENTS_CACHED {
-            messageQueueInitArguments: MessageQueueInitArguments::new(cmdq).0,
+    pub(crate) fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
+        #[allow(non_snake_case)]
+        let init_inner = init!(bindings::GSP_ARGUMENTS_CACHED {
+            messageQueueInitArguments <- MessageQueueInitArguments::new(cmdq),
             bDmemStack: 1,
-            ..Default::default()
+            ..Zeroable::init_zeroed()
+        });
+
+        init!(GspArgumentsCached {
+            inner <- init_inner,
         })
     }
 }
@@ -834,11 +850,21 @@ unsafe impl AsBytes for GspArgumentsCached {}
 /// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to force it
 /// to that size.
 #[repr(C)]
+#[derive(Zeroable)]
 pub(crate) struct GspArgumentsPadded {
     pub(crate) inner: GspArgumentsCached,
     _padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CACHED>()],
 }
 
+impl GspArgumentsPadded {
+    pub(crate) fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
+        init!(GspArgumentsPadded {
+            inner <- GspArgumentsCached::new(cmdq),
+            ..Zeroable::init_zeroed()
+        })
+    }
+}
+
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspArgumentsPadded {}
 
@@ -847,18 +873,18 @@ unsafe impl AsBytes for GspArgumentsPadded {}
 unsafe impl FromBytes for GspArgumentsPadded {}
 
 /// Init arguments for the message queue.
-#[repr(transparent)]
-struct MessageQueueInitArguments(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS);
+type MessageQueueInitArguments = bindings::MESSAGE_QUEUE_INIT_ARGUMENTS;
 
 impl MessageQueueInitArguments {
     /// Creates a new init arguments structure for `cmdq`.
-    fn new(cmdq: &Cmdq) -> Self {
-        Self(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS {
+    #[allow(non_snake_case)]
+    fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
+        init!(MessageQueueInitArguments {
             sharedMemPhysAddr: cmdq.dma_handle(),
             pageTableEntryCount: num::usize_into_u32::<{ Cmdq::NUM_PTES }>(),
             cmdQueueOffset: num::usize_as_u64(Cmdq::CMDQ_OFFSET),
             statQueueOffset: num::usize_as_u64(Cmdq::STATQ_OFFSET),
-            ..Default::default()
+            ..Zeroable::init_zeroed()
         })
     }
 }
-- 
2.53.0

