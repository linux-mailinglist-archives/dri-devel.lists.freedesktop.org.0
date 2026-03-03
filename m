Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBE+HRcLp2mJcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA19D1F3B63
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C2710E859;
	Tue,  3 Mar 2026 16:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AXJ+vRwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0E610E859;
 Tue,  3 Mar 2026 16:23:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CF8F160008;
 Tue,  3 Mar 2026 16:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77E6C19425;
 Tue,  3 Mar 2026 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772555026;
 bh=RRwlxYxwMBwbZCAUZL3IuCb0Hwkrc8JPcDDRIvn48Qw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AXJ+vRwpD+EC7R58rTnSZ/QZYMKFuXqSXO3N90797MlZ9vYi3KprMBIs8w+G2RZD+
 2kN6PvgKj34HKMHJhIzKXtVaeylMgeF56kentZ9Z9C09Yg1O53lPcZYOVNxXr7gbi3
 jINaPy0/1NcOm7jOt3Vh9vaMj3FWtgqTBZAhcgwyeOhi4Gbp5fRzxoJxG9C5pvGwSo
 YXJSBpUDyzqSVWqFcWC8DvlGuWgBZTMkHljj0xCicQYs1BuGQTdLtBWf5gJCRyn+im
 et4kuO34LXSpgiC2zi5PxvGiBDFsNw0H8/iNP6nKFYClKVa7pE27bJ9H2LB68qKy1s
 ELA3SlfZZ+GNg==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 6/8] gpu: nova-core: use Coherent::init to initialize
 GspFwWprMeta
Date: Tue,  3 Mar 2026 17:22:57 +0100
Message-ID: <20260303162314.94363-7-dakr@kernel.org>
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
X-Rspamd-Queue-Id: EA19D1F3B63
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

Convert wpr_meta to use Coherent::init() and simplify the
initialization.  It also avoids a separate initialization of
GspFwWprMeta on the stack.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gsp/boot.rs |  7 ++-----
 drivers/gpu/nova-core/gsp/fw.rs   | 20 +++++++++++++++-----
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 7f46fa5e9b50..1a4d9ee4f256 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -2,8 +2,7 @@
 
 use kernel::{
     device,
-    dma::CoherentAllocation,
-    dma_write,
+    dma::Coherent,
     io::poll::read_poll_timeout,
     pci,
     prelude::*,
@@ -155,9 +154,7 @@ pub(crate) fn boot(
             bar,
         )?;
 
-        let wpr_meta =
-            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(wpr_meta, [0]?, GspFwWprMeta::new(&gsp_fw, &fb_layout));
+        let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f1797e1f0d9d..751d5447214d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -131,7 +131,9 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 /// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
-pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
+pub(crate) struct GspFwWprMeta {
+    inner: bindings::GspFwWprMeta,
+}
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.
 unsafe impl AsBytes for GspFwWprMeta {}
@@ -144,10 +146,14 @@ unsafe impl FromBytes for GspFwWprMeta {}
 type GspFwWprMetaBootInfo = bindings::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
 
 impl GspFwWprMeta {
-    /// Fill in and return a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
+    /// Returns an initializer for a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
     /// `fb_layout` layout.
-    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
-        Self(bindings::GspFwWprMeta {
+    pub(crate) fn new<'a>(
+        gsp_firmware: &'a GspFirmware,
+        fb_layout: &'a FbLayout,
+    ) -> impl Init<Self> + 'a {
+        #[allow(non_snake_case)]
+        let init_inner = init!(bindings::GspFwWprMeta {
             // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC` unmodified.
             magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
             revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
@@ -182,7 +188,11 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
-            ..Default::default()
+            ..Zeroable::init_zeroed()
+        });
+
+        init!(GspFwWprMeta {
+            inner <- init_inner,
         })
     }
 }
-- 
2.53.0

