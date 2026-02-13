Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLcNOHF+j2nZRAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 20:41:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E6D139410
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 20:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C9110E10D;
	Fri, 13 Feb 2026 19:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OfC5wtKz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941B510E10D;
 Fri, 13 Feb 2026 19:41:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7F98961337;
 Fri, 13 Feb 2026 19:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 284E1C19424;
 Fri, 13 Feb 2026 19:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771011690;
 bh=npawl3Sh8CB9l+1ZY62uo+ipDHKFXtD/V7TZlj5J+kE=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=OfC5wtKzDjjRTMyYDLfYtHcRXqV6U0vmPI2AWkLm7EB7Z/T1v0l2abeRgzhIjaq58
 Z6mXUTghHGpMEJjGZqbxnUxJF/dISX+OblcR09PaWXsct7GP+lZ/WGhM61zFVZyZvJ
 ezgUSifRI4TocQxH7uuzPA29NB6qSsXL9rjlOscWyTxleT5wdzhWwW3O5otlF5rb9J
 2YKoA3hcYhfFQdQo+4Bm0KBsyTKSD2wNZYHFxA9+XYiVpAe156iAJxrwUb8AvWdFWx
 c4/XK2w6SNRQtN0F3WrKjQ3Wh9Vj3BkIafCdUHHajvPr+aXIG8LGqNTYuBj87TzIiK
 BIkMyutGBksBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4CEEF99D7;
 Fri, 13 Feb 2026 19:41:30 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Date: Fri, 13 Feb 2026 14:40:13 -0500
Subject: [PATCH v2] gpu: nova-core: fix stack overflow in GSP memory allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ7CIBCF4as0s3YMjFrFlfcwXRQZLYtCM2BT0
 3B3sXuX/0vet0Ji8Zzg2qwgPPvkY6hBuwYeQx9ejN7VBlLUKtKETkaUd8oYeMlo2RrqmY07n6B
 +JuGnXzbv3tUefMpRPhs/69/6T5o1ajwqczAXq4lbfZsk5hj2I0NXSvkCJpNJDqoAAAA=
X-Change-ID: 20260212-drm-rust-next-beb92aee9d75
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tim Kovalenko <tim.kovalenko@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771011689; l=6183;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=TbEzlnu4V85B1wrxC0sGqgddAbgVIVV2UDPzTnjjCng=;
 b=1765X0vwFeNKmn7aEyMFKc6c5HTP2IxuQE8XcwSTcwhN9KrHAJ9dpgfoy/Ysb4YaVm3UM3IJh
 JbUXKzKcDEtDsz7mFSr+uHD5WK5p5zrFsDtx/d7Af6EsHRCj0EHcXNO
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[tim.kovalenko.proton.me];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[tim.kovalenko@proton.me]
X-Rspamd-Queue-Id: 43E6D139410
X-Rspamd-Action: no action

From: Tim Kovalenko <tim.kovalenko@proton.me>

The `Cmdq::new` function was allocating a `PteArray` struct on the stack
and was causing a stack overflow with 8216 bytes.

Remove the `PteArray` and instead calculate and write the Page Table
Entries directly into the coherent DMA buffer one-by-one. This reduces
the stack usage quite a lot.

Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>
---
Changes in v2:
- Missed a code formatting issue.
- Link to v1: https://lore.kernel.org/r/20260212-drm-rust-next-v1-1-409398b12e61@proton.me
---
 drivers/gpu/nova-core/gsp.rs      | 50 ++++++++++++++-------------------------
 drivers/gpu/nova-core/gsp/cmdq.rs | 27 ++++++++++++++++++---
 2 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b9269cf35286dec3acc4d60918904..316eeaf87ec5ae67422a34426eefa747c9b6502b 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,16 +2,14 @@
 
 mod boot;
 
+use core::iter::Iterator;
+
 use kernel::{
     device,
-    dma::{
-        CoherentAllocation,
-        DmaAddress, //
-    },
+    dma::CoherentAllocation,
     dma_write,
     pci,
-    prelude::*,
-    transmute::AsBytes, //
+    prelude::*, //
 };
 
 pub(crate) mod cmdq;
@@ -39,27 +37,6 @@
 /// Number of GSP pages to use in a RM log buffer.
 const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
 
-/// Array of page table entries, as understood by the GSP bootloader.
-#[repr(C)]
-struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
-
-/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around one.
-unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
-
-impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
-    /// Creates a new page table array mapping `NUM_PAGES` GSP pages starting at address `start`.
-    fn new(start: DmaAddress) -> Result<Self> {
-        let mut ptes = [0u64; NUM_PAGES];
-        for (i, pte) in ptes.iter_mut().enumerate() {
-            *pte = start
-                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
-                .ok_or(EOVERFLOW)?;
-        }
-
-        Ok(Self(ptes))
-    }
-}
-
 /// The logging buffers are byte queues that contain encoded printf-like
 /// messages from GSP-RM.  They need to be decoded by a special application
 /// that can parse the buffers.
@@ -86,16 +63,25 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
             NUM_PAGES * GSP_PAGE_SIZE,
             GFP_KERNEL | __GFP_ZERO,
         )?);
-        let ptes = PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
+
+        let start_addr = obj.0.dma_handle();
 
         // SAFETY: `obj` has just been created and we are its sole user.
-        unsafe {
-            // Copy the self-mapping PTE at the expected location.
+        let pte_region = unsafe {
             obj.0
-                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
-                .copy_from_slice(ptes.as_bytes())
+                .as_slice_mut(size_of::<u64>(), NUM_PAGES * size_of::<u64>())?
         };
 
+        // As in [`DmaGspMem`], this is a  one by one GSP Page write to the memory
+        // to avoid stack overflow when allocating the whole array at once.
+        for (i, chunk) in pte_region.chunks_exact_mut(size_of::<u64>()).enumerate() {
+            let pte_value = start_addr
+                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
+                .ok_or(EOVERFLOW)?;
+
+            chunk.copy_from_slice(&pte_value.to_ne_bytes());
+        }
+
         Ok(obj)
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51adc58423502d9d45730923b843656..7a6cb261f4e62ac6210a80f9ecb61213cdb91b15 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -35,7 +35,6 @@
             MsgqRxHeader,
             MsgqTxHeader, //
         },
-        PteArray,
         GSP_PAGE_SHIFT,
         GSP_PAGE_SIZE, //
     },
@@ -159,7 +158,7 @@ struct Msgq {
 #[repr(C)]
 struct GspMem {
     /// Self-mapping page table entries.
-    ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
+    ptes: [u64; GSP_PAGE_SIZE / size_of::<u64>()],
     /// CPU queue: the driver writes commands here, and the GSP reads them. It also contains the
     /// write and read pointers that the CPU updates.
     ///
@@ -201,7 +200,29 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
 
         let gsp_mem =
             CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
+        const NUM_PAGES: usize = GSP_PAGE_SIZE / size_of::<u64>();
+
+        // One by one GSP Page write to the memory to avoid stack overflow when allocating
+        // the whole array at once.
+        let item = gsp_mem.item_from_index(0)?;
+        for i in 0..NUM_PAGES {
+            let pte_value = gsp_mem
+                .dma_handle()
+                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
+                .ok_or(EOVERFLOW)?;
+
+            // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
+            // dereferenced. The compiler also further validates the expression on whether `field`
+            // is a member of `item` when expanded by the macro.
+            //
+            // Further, this is dma_write! macro expanded and modified to allow for individual
+            // page write.
+            unsafe {
+                let ptr_field = core::ptr::addr_of_mut!((*item).ptes[i]);
+                gsp_mem.field_write(ptr_field, pte_value);
+            }
+        }
+
         dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES))?;
         dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
 

---
base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
change-id: 20260212-drm-rust-next-beb92aee9d75

Best regards,
-- 
Tim Kovalenko <tim.kovalenko@proton.me>


