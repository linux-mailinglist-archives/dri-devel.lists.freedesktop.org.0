Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAfqKCALp2mJcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:24:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC401F3B84
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C724710E868;
	Tue,  3 Mar 2026 16:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iHDe3w0f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B9F10E87B;
 Tue,  3 Mar 2026 16:23:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 361E860123;
 Tue,  3 Mar 2026 16:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB26C2BCB0;
 Tue,  3 Mar 2026 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772555034;
 bh=MMf/7ThUQxA41boroXlWwAOlZa0iETTF8GP7vXiZQ5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iHDe3w0fwWuVhmuVJ9Wg7lfQiQ0XouM+RpO8ExbNmGccdaGyRHSpKxdJ0BLh22ipQ
 f3TmGLG4ehurQSe0ckEmsJXCPXG7lriFnLsuxX8VAgYZXZADsNgJE6064YHGdFF9IW
 1FQe5epZr7vZhjH+rU+rfpzaGPGZWRgwtTZpHWiuqu3piHaeVjIHyurJokSPrZqDyT
 4UcD8W2W9gJrlMik7Dov8F4aMXkE5zjs8z8K96b+F7JgupF3S50G9wwcVs95iIKc4C
 fDm5fDIQ9/GQoy50X0Vcambsxwzgm/hhbLiLxLC+DYJqPMD7lmr+eZeXUKBkB2We2S
 NajhB+FMH2zlQ==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 8/8] gpu: nova-core: convert to new dma::Coherent API
Date: Tue,  3 Mar 2026 17:22:59 +0100
Message-ID: <20260303162314.94363-9-dakr@kernel.org>
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
X-Rspamd-Queue-Id: 3DC401F3B84
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,garyguo.net:email]
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

Remove all usages of dma::CoherentAllocation and use the new
dma::Coherent type instead.

Note that there are still remainders of the old dma::CoherentAllocation
API, such as as_slice() and as_slice_mut().

Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/dma.rs      | 19 +++++------
 drivers/gpu/nova-core/falcon.rs   |  7 ++--
 drivers/gpu/nova-core/firmware.rs | 10 ++----
 drivers/gpu/nova-core/gsp.rs      | 18 ++++++----
 drivers/gpu/nova-core/gsp/cmdq.rs | 55 ++++++++++++-------------------
 5 files changed, 46 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 7215398969da..3c19d5ffcfe8 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -9,13 +9,13 @@
 
 use kernel::{
     device,
-    dma::CoherentAllocation,
+    dma::Coherent,
     page::PAGE_SIZE,
     prelude::*, //
 };
 
 pub(crate) struct DmaObject {
-    dma: CoherentAllocation<u8>,
+    dma: Coherent<[u8]>,
 }
 
 impl DmaObject {
@@ -24,23 +24,22 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
             .map_err(|_| EINVAL)?
             .pad_to_align()
             .size();
-        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
+        let dma = Coherent::zeroed_slice(dev, len, GFP_KERNEL)?;
 
         Ok(Self { dma })
     }
 
     pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
-        Self::new(dev, data.len()).and_then(|mut dma_obj| {
-            // SAFETY: We have just allocated the DMA memory, we are the only users and
-            // we haven't made the device aware of the handle yet.
-            unsafe { dma_obj.write(data, 0)? }
-            Ok(dma_obj)
-        })
+        let dma_obj = Self::new(dev, data.len())?;
+        // SAFETY: We have just allocated the DMA memory, we are the only users and
+        // we haven't made the device aware of the handle yet.
+        unsafe { dma_obj.as_mut()[..data.len()].copy_from_slice(data) };
+        Ok(dma_obj)
     }
 }
 
 impl Deref for DmaObject {
-    type Target = CoherentAllocation<u8>;
+    type Target = Coherent<[u8]>;
 
     fn deref(&self) -> &Self::Target {
         &self.dma
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37bfee1d0949..39f5df568ddb 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -25,10 +25,7 @@
     driver::Bar0,
     falcon::hal::LoadMethod,
     gpu::Chipset,
-    num::{
-        FromSafeCast,
-        IntoSafeCast, //
-    },
+    num::FromSafeCast,
     regs,
     regs::macros::RegisterBase, //
 };
@@ -434,7 +431,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             }
             FalconMem::Dmem => (
                 0,
-                fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
+                fw.dma_handle() + DmaAddress::from(load_offsets.src_start),
             ),
         };
         if dma_start % DmaAddress::from(DMA_LEN) > 0 {
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 815e8000bf81..efb20ef34f31 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -310,7 +310,7 @@ trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
 impl<F: FalconFirmware> FirmwareDmaObject<F, Unsigned> {
     /// Patches the firmware at offset `sig_base_img` with `signature`.
     fn patch_signature<S: FirmwareSignature<F>>(
-        mut self,
+        self,
         signature: &S,
         sig_base_img: usize,
     ) -> Result<FirmwareDmaObject<F, Signed>> {
@@ -320,12 +320,8 @@ fn patch_signature<S: FirmwareSignature<F>>(
         }
 
         // SAFETY: We are the only user of this object, so there cannot be any race.
-        let dst = unsafe { self.0.start_ptr_mut().add(sig_base_img) };
-
-        // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
-        unsafe {
-            core::ptr::copy_nonoverlapping(signature_bytes.as_ptr(), dst, signature_bytes.len())
-        };
+        let dst = unsafe { self.0.as_mut() };
+        dst[sig_base_img..][..signature_bytes.len()].copy_from_slice(signature_bytes);
 
         Ok(FirmwareDmaObject(self.0, PhantomData))
     }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index cb7f6b4dc0f8..fcb3020acf8d 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -6,13 +6,15 @@
     device,
     dma::{
         Coherent,
-        CoherentAllocation,
         CoherentInit,
         DmaAddress, //
     },
     pci,
     prelude::*,
-    transmute::AsBytes, //
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
 };
 
 pub(crate) mod cmdq;
@@ -44,6 +46,9 @@
 #[repr(C)]
 struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
 
+/// SAFETY: arrays of `u64` implement `FromBytes` and we are but a wrapper around one.
+unsafe impl<const NUM_ENTRIES: usize> FromBytes for PteArray<NUM_ENTRIES> {}
+
 /// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around one.
 unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
 
@@ -75,25 +80,24 @@ fn new(start: DmaAddress) -> Result<Self> {
 /// then pp points to index into the buffer where the next logging entry will
 /// be written. Therefore, the logging data is valid if:
 ///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer(CoherentAllocation<u8>);
+struct LogBuffer(Coherent<[u8]>);
 
 impl LogBuffer {
     /// Creates a new `LogBuffer` mapped on `dev`.
     fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         const NUM_PAGES: usize = RM_LOG_BUFFER_NUM_PAGES;
 
-        let mut obj = Self(CoherentAllocation::<u8>::alloc_coherent(
+        let obj = Self(Coherent::<u8>::zeroed_slice(
             dev,
             NUM_PAGES * GSP_PAGE_SIZE,
-            GFP_KERNEL | __GFP_ZERO,
+            GFP_KERNEL,
         )?);
         let ptes = PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
 
         // SAFETY: `obj` has just been created and we are its sole user.
         unsafe {
             // Copy the self-mapping PTE at the expected location.
-            obj.0
-                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
+            obj.0.as_mut()[size_of::<u64>()..][..size_of_val(&ptes)]
                 .copy_from_slice(ptes.as_bytes())
         };
 
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 0056bfbf0a44..05c5f70dd4a9 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -11,7 +11,7 @@
 use kernel::{
     device,
     dma::{
-        CoherentAllocation,
+        Coherent,
         DmaAddress, //
     },
     dma_write,
@@ -181,7 +181,7 @@ unsafe impl AsBytes for GspMem {}
 // that is not a problem because they are not used outside the kernel.
 unsafe impl FromBytes for GspMem {}
 
-/// Wrapper around [`GspMem`] to share it with the GPU using a [`CoherentAllocation`].
+/// Wrapper around [`GspMem`] to share it with the GPU using a [`Coherent`].
 ///
 /// This provides the low-level functionality to communicate with the GSP, including allocation of
 /// queue space to write messages to and management of read/write pointers.
@@ -192,7 +192,7 @@ unsafe impl FromBytes for GspMem {}
 ///   pointer and the GSP read pointer. This region is returned by [`Self::driver_write_area`].
 /// * The driver owns (i.e. can read from) the part of the GSP message queue between the CPU read
 ///   pointer and the GSP write pointer. This region is returned by [`Self::driver_read_area`].
-struct DmaGspMem(CoherentAllocation<GspMem>);
+struct DmaGspMem(Coherent<GspMem>);
 
 impl DmaGspMem {
     /// Allocate a new instance and map it for `dev`.
@@ -200,15 +200,10 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         const MSGQ_SIZE: u32 = num::usize_into_u32::<{ size_of::<Msgq>() }>();
         const RX_HDR_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, rx) }>();
 
-        let gsp_mem =
-            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_handle())?);
-        dma_write!(
-            gsp_mem,
-            [0]?.cpuq.tx,
-            MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES)
-        );
-        dma_write!(gsp_mem, [0]?.cpuq.rx, MsgqRxHeader::new());
+        let gsp_mem = Coherent::<GspMem>::zeroed(dev, GFP_KERNEL)?;
+        dma_write!(gsp_mem, .ptes, PteArray::new(gsp_mem.dma_handle())?);
+        dma_write!(gsp_mem, .cpuq.tx, MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES));
+        dma_write!(gsp_mem, .cpuq.rx, MsgqRxHeader::new());
 
         Ok(Self(gsp_mem))
     }
@@ -223,10 +218,9 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         let rx = self.gsp_read_ptr() as usize;
 
         // SAFETY:
-        // - The `CoherentAllocation` contains exactly one object.
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
-        let gsp_mem = &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0];
+        let gsp_mem = unsafe { &mut *self.0.as_mut_ptr() };
         // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_NUM_PAGES`.
         let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
 
@@ -264,10 +258,9 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         let rx = self.cpu_read_ptr() as usize;
 
         // SAFETY:
-        // - The `CoherentAllocation` contains exactly one object.
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
-        let gsp_mem = &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
+        let gsp_mem = unsafe { &*self.0.as_ptr() };
         let data = &gsp_mem.gspq.msgq.data;
 
         // The area starting at `rx` and ending at `tx - 1` modulo MSGQ_NUM_PAGES, inclusive,
@@ -334,11 +327,10 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_write_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
+        let gsp_mem = self.0.as_ptr();
 
         // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
+        //  - By the invariants of `Coherent` the pointer is valid.
         (unsafe { (*gsp_mem).gspq.tx.write_ptr() } % MSGQ_NUM_PAGES)
     }
 
@@ -348,11 +340,10 @@ fn gsp_write_ptr(&self) -> u32 {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_read_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
+        let gsp_mem = self.0.as_ptr();
 
         // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
+        //  - By the invariants of `Coherent` the pointer is valid.
         (unsafe { (*gsp_mem).gspq.rx.read_ptr() } % MSGQ_NUM_PAGES)
     }
 
@@ -362,11 +353,10 @@ fn gsp_read_ptr(&self) -> u32 {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_read_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
+        let gsp_mem = self.0.as_ptr();
 
         // SAFETY:
-        //  - The ['CoherentAllocation'] contains at least one object.
-        //  - By the invariants of CoherentAllocation the pointer is valid.
+        //  - By the invariants of `Coherent` the pointer is valid.
         (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
     }
 
@@ -377,11 +367,10 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
         // Ensure read pointer is properly ordered.
         fence(Ordering::SeqCst);
 
-        let gsp_mem = self.0.start_ptr_mut();
+        let gsp_mem = self.0.as_mut_ptr();
 
         // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
+        //  - By the invariants of `Coherent` the pointer is valid.
         unsafe { (*gsp_mem).cpuq.rx.set_read_ptr(rptr) };
     }
 
@@ -391,22 +380,20 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_write_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
+        let gsp_mem = self.0.as_ptr();
 
         // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
+        //  - By the invariants of `Coherent` the pointer is valid.
         (unsafe { (*gsp_mem).cpuq.tx.write_ptr() } % MSGQ_NUM_PAGES)
     }
 
     // Informs the GSP that it can process `elem_count` new pages from the command queue.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
         let wptr = self.cpu_write_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
-        let gsp_mem = self.0.start_ptr_mut();
+        let gsp_mem = self.0.as_mut_ptr();
 
         // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
+        //  - By the invariants of `Coherent` the pointer is valid.
         unsafe { (*gsp_mem).cpuq.tx.set_write_ptr(wptr) };
 
         // Ensure all command data is visible before triggering the GSP read.
-- 
2.53.0

