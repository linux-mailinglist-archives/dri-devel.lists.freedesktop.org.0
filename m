Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGD1HGUcpmmeKQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEAE1E699A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA38810E5EB;
	Mon,  2 Mar 2026 23:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="QL2vUVf6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E9A10E5EA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 23:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772493915; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=O5u9Coe86yj9YikzsPPAOyOIKz+w0MHgdxq25Mexw8OF+iAgwW2UaKC9jRNPQtD0CvbNxjwpAPCs+APdxpuMHB+fdWJfk9+jWSLsIUGXChoU4ltB5UQGhrTAOLBkTDFsL4wEslxJogKeNvky+4Vhq3Xh7CnYtaBnkJ9ZztNxsp8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772493915;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=bu4D4snX8cyZjUYzqHIFG8QvoqBi3uhpfEBSBPPOl4U=; 
 b=fnlQsidDK0AQ6HvEN5iuhQoFpQhQp2wgalh0WoRZt/OqiAX0wedcUl05W0fUYENFEwS31wz/9GjpaYBwMyq4SLf9MQhBL3NdgBjpo32AADiDA2dS3PhG0Q4QXkAESASIuK82Y+uEJU+/95OkfBSQ/wisQQwjoGFcg9+o6pEDoAU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493915; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=bu4D4snX8cyZjUYzqHIFG8QvoqBi3uhpfEBSBPPOl4U=;
 b=QL2vUVf6Rr/1fTYzUzotn/KaT82bYij+gdkhYbYg6sPrNHzFfA0t3s1mEeRpBkxr
 JfNhY8eAmZTzKc5JwvTsASuOysfXpUzb9ersSsMd5Jyawy4xd4Y+YzLjMYfUQSi8GGu
 XSn4XNwZ/v2hKJ1lagbSEOZM4EGkSfULecKj2/KA=
Received: by mx.zohomail.com with SMTPS id 177249391385843.936446635855305;
 Mon, 2 Mar 2026 15:25:13 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 work@onurozkan.dev, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 05/12] drm/tyr: add MMU address space registers
Date: Mon,  2 Mar 2026 15:24:53 -0800
Message-ID: <20260302232500.244489-6-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260302232500.244489-1-deborah.brouwer@collabora.com>
References: <20260302232500.244489-1-deborah.brouwer@collabora.com>
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
X-Rspamd-Queue-Id: 1CEAE1E699A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Daniel Almeida <daniel.almeida@collabora.com>

Add register definitions and constants for managing MMU address space,
including:
  - Address space translation configuration (page table format, attributes)
  - Memory attributes (cacheability, shareability)
  - Address space commands (update, lock, flush)
  - AsRegister helper for per-AS register access

These will be used by the MMU/VM manager to configure page tables and
control address space operations.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Change the author from Boris Brezillon to Daniel Almeida.
- Reduce MAX_AS_REGISTERS from 32 to 16 as stated in specs.

 drivers/gpu/drm/tyr/regs.rs | 101 +++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 611870c2e6af..489895d47c42 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -8,7 +8,10 @@
 #![allow(dead_code)]
 
 use kernel::{
-    bits::bit_u32,
+    bits::{
+        bit_u32,
+        bit_u64, //
+    },
     device::{
         Bound,
         Device, //
@@ -111,3 +114,99 @@ pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u3
 pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> = Register;
 pub(crate) const MMU_IRQ_MASK: Register<0x2008> = Register;
 pub(crate) const MMU_IRQ_STAT: Register<0x200c> = Register;
+
+pub(crate) const AS_TRANSCFG_ADRMODE_UNMAPPED: u64 = bit_u64(0);
+pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_4K: u64 = bit_u64(2) | bit_u64(1);
+pub(crate) const AS_TRANSCFG_PTW_MEMATTR_WB: u64 = bit_u64(25);
+pub(crate) const AS_TRANSCFG_PTW_RA: u64 = bit_u64(30);
+
+pub(crate) const fn as_transcfg_ina_bits(x: u64) -> u64 {
+    x << 6
+}
+
+pub(crate) const AS_MEMATTR_AARCH64_SH_MIDGARD_INNER: u32 = 0 << 4;
+pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_NC: u32 = 1 << 6;
+pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_WB: u32 = 2 << 6;
+
+pub(crate) fn as_memattr_aarch64_inner_alloc_expl(w: bool, r: bool) -> u32 {
+    (3 << 2) | (u32::from(w)) | ((u32::from(r)) << 1)
+}
+
+pub(crate) const AS_COMMAND_UPDATE: u32 = 1;
+pub(crate) const AS_COMMAND_LOCK: u32 = 2;
+pub(crate) const AS_COMMAND_FLUSH_PT: u32 = 4;
+pub(crate) const AS_COMMAND_FLUSH_MEM: u32 = 5;
+
+pub(crate) const AS_STATUS_ACTIVE: u32 = bit_u32(0);
+
+pub(crate) const AS_LOCK_REGION_MIN_SIZE: u32 = bit_u32(15);
+
+/// Maximum number of hardware address space slots.
+/// The actual number of slots available is usually lower.
+pub(crate) const MAX_AS_REGISTERS: usize = 16;
+
+const MMU_BASE: usize = 0x2400;
+const MMU_AS_SHIFT: usize = 6;
+
+const fn mmu_as(as_nr: usize) -> usize {
+    MMU_BASE + (as_nr << MMU_AS_SHIFT)
+}
+
+pub(crate) struct AsRegister(usize);
+
+impl AsRegister {
+    fn new(as_nr: usize, offset: usize) -> Result<Self> {
+        Ok(AsRegister(mmu_as(as_nr) + offset))
+    }
+
+    #[inline]
+    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
+        let value = (*iomem).access(dev)?.try_read32(self.0)?;
+        Ok(value)
+    }
+
+    #[inline]
+    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
+        (*iomem).access(dev)?.try_write32(value, self.0)?;
+        Ok(())
+    }
+}
+
+pub(crate) fn as_transtab_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x0)
+}
+
+pub(crate) fn as_transtab_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x4)
+}
+
+pub(crate) fn as_memattr_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x8)
+}
+
+pub(crate) fn as_memattr_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0xc)
+}
+
+pub(crate) fn as_lockaddr_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x10)
+}
+
+pub(crate) fn as_lockaddr_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x14)
+}
+
+pub(crate) fn as_command(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x18)
+}
+
+pub(crate) fn as_status(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x28)
+}
+
+pub(crate) fn as_transcfg_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x30)
+}
+pub(crate) fn as_transcfg_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x34)
+}
-- 
2.52.0

