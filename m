Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKtOIlMwf2k8lQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B484C5A3F
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EDC10E136;
	Sun,  1 Feb 2026 10:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ry.rs header.i=@ry.rs header.b="J3QTneX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-108-mta119.mxroute.com (mail-108-mta119.mxroute.com
 [136.175.108.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C3610E3A2
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 17:21:12 +0000 (UTC)
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta119.mxroute.com (ZoneMTA) with ESMTPSA id
 19c1512a2380009140.006 for <dri-devel@lists.freedesktop.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 31 Jan 2026 17:21:08 +0000
X-Zone-Loop: 9c61f367bd261592bb26581e48056636729f926e2c93
X-Originating-IP: [136.175.111.3]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ry.rs; s=x; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=ieqzaWRiWdY02r7jkJvGUOeJVM3Ht/4jcBZxw4sl63k=; b=J3QTneX6znShPblBSOCVVL4eL2
 XQ+fzMub+SG/nGMQBZsYaR6EBtdqfIfWMeQd6Km6uv8m2dBUVAomm1eXprFqCqwEeWbphDb5As+HS
 4rOYw2ZpE3mB0Wu8SQWvFmmrLy5lfOpm3SSERabfiDXDO8rExlGI9zkpeRVP6LAXLfZdtUQjfwglK
 7NIp9BNHnGwTwaj/7yzksSdd+FPfVj13a/Rn9Jl3CEJht9I/Vq1IqcWTz+0j0jY6AAsS1ky2PAI/c
 w+AJ/A0B3Q54sbAY06y6Ocs0cgRAm5BuKetT7e4xder2elYEcuyGtDdKsSTm6vY9oLPTfBCSgH85U
 MrlyGwbQ==;
From: Zijing Zhang <zijing.zhang@ry.rs>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zijing.zhang@ry.rs,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v2] gpu: nova-core: vbios: harden falcon pointer parsing
Date: Sat, 31 Jan 2026 17:20:56 +0000
Message-ID: <20260131172056.1592923-1-zijing.zhang@ry.rs>
In-Reply-To: <20260131111619.1360414-1-zijing.zhang@ry.rs>
References: <20260131111619.1360414-1-zijing.zhang@ry.rs>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: zijing.zhang@ry.rs
X-Mailman-Approved-At: Sun, 01 Feb 2026 10:51:49 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[ry.rs:s=x];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[ry.rs : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,ry.rs,intel.com];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:acourbot@nvidia.com,m:aliceryhl@google.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:zijing.zhang@ry.rs,m:lkp@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[zijing.zhang@ry.rs,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijing.zhang@ry.rs,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ry.rs:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[entry.data:url]
X-Rspamd-Queue-Id: 1B484C5A3F
X-Rspamd-Action: no action

Use checked arithmetic and slice get() to avoid overflow/underflow and out-of-bounds access when parsing Falcon data pointers and FWSEC payloads.

This also clarifies the error message for pointers that still fall within the PciAt image.

Reported-by: kernel test robot <lkp@intel.com>

Closes: https://lore.kernel.org/oe-kbuild-all/202601311630.eoGwXUug-lkp@intel.com/

Signed-off-by: Zijing Zhang <zijing.zhang@ry.rs>
---
 drivers/gpu/nova-core/vbios.rs | 93 ++++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 72cba8659..2db481f45 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -784,22 +784,31 @@ fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
     fn falcon_data_ptr(&self) -> Result<u32> {
         let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
 
-        // Make sure we don't go out of bounds
-        if usize::from(token.data_offset) + 4 > self.base.data.len() {
-            return Err(EINVAL);
-        }
-
-        // read the 4 bytes at the offset specified in the token
         let offset = usize::from(token.data_offset);
-        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
-            dev_err!(self.base.dev, "Failed to convert data slice to array\n");
-            EINVAL
-        })?;
+        let end = offset.checked_add(4).ok_or(EINVAL)?;
+
+        // Read the 4 bytes at the offset specified in the token.
+        let bytes: [u8; 4] = self
+            .base
+            .data
+            .get(offset..end)
+            .ok_or(EINVAL)?
+            .try_into()
+            .map_err(|_| {
+                dev_err!(self.base.dev, "Failed to convert data slice to array\n");
+                EINVAL
+            })?;
 
         let data_ptr = u32::from_le_bytes(bytes);
 
-        if (usize::from_safe_cast(data_ptr)) < self.base.data.len() {
-            dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
+        // The BIT Falcon data pointer is expected to point outside the PciAt image (into a later
+        // image in the ROM chain). Reject pointers that still fall within this PciAt image, since
+        // downstream code will subtract `self.base.data.len()` from this offset.
+        if usize::from_safe_cast(data_ptr) < self.base.data.len() {
+            dev_err!(
+                self.base.dev,
+                "Falcon data pointer points inside PciAt image\n"
+            );
             return Err(EINVAL);
         }
 
@@ -920,14 +929,17 @@ fn setup_falcon_data(
         pci_at_image: &PciAtBiosImage,
         first_fwsec: &FwSecBiosBuilder,
     ) -> Result {
-        let mut offset = usize::from_safe_cast(pci_at_image.falcon_data_ptr()?);
+        let data_ptr = pci_at_image.falcon_data_ptr()?;
+        let mut offset = usize::from_safe_cast(data_ptr);
         let mut pmu_in_first_fwsec = false;
 
         // The falcon data pointer assumes that the PciAt and FWSEC images
         // are contiguous in memory. However, testing shows the EFI image sits in
         // between them. So calculate the offset from the end of the PciAt image
         // rather than the start of it. Compensate.
-        offset -= pci_at_image.base.data.len();
+        offset = offset
+            .checked_sub(pci_at_image.base.data.len())
+            .ok_or(EINVAL)?;
 
         // The offset is now from the start of the first Fwsec image, however
         // the offset points to a location in the second Fwsec image. Since
@@ -937,7 +949,9 @@ fn setup_falcon_data(
         if offset < first_fwsec.base.data.len() {
             pmu_in_first_fwsec = true;
         } else {
-            offset -= first_fwsec.base.data.len();
+            offset = offset
+                .checked_sub(first_fwsec.base.data.len())
+                .ok_or(EINVAL)?;
         }
 
         self.falcon_data_offset = Some(offset);
@@ -945,12 +959,16 @@ fn setup_falcon_data(
         if pmu_in_first_fwsec {
             self.pmu_lookup_table = Some(PmuLookupTable::new(
                 &self.base.dev,
-                &first_fwsec.base.data[offset..],
+                first_fwsec.base.data.get(offset..).ok_or(EINVAL)?,
             )?);
         } else {
+            if offset >= self.base.data.len() {
+                dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
+                return Err(EINVAL);
+            }
             self.pmu_lookup_table = Some(PmuLookupTable::new(
                 &self.base.dev,
-                &self.base.data[offset..],
+                self.base.data.get(offset..).ok_or(EINVAL)?,
             )?);
         }
 
@@ -962,12 +980,20 @@ fn setup_falcon_data(
         {
             Ok(entry) => {
                 let mut ucode_offset = usize::from_safe_cast(entry.data);
-                ucode_offset -= pci_at_image.base.data.len();
+                ucode_offset = ucode_offset
+                    .checked_sub(pci_at_image.base.data.len())
+                    .ok_or(EINVAL)?;
                 if ucode_offset < first_fwsec.base.data.len() {
                     dev_err!(self.base.dev, "Falcon Ucode offset not in second Fwsec.\n");
                     return Err(EINVAL);
                 }
-                ucode_offset -= first_fwsec.base.data.len();
+                ucode_offset = ucode_offset
+                    .checked_sub(first_fwsec.base.data.len())
+                    .ok_or(EINVAL)?;
+                if ucode_offset >= self.base.data.len() {
+                    dev_err!(self.base.dev, "Falcon Ucode offset out of bounds.\n");
+                    return Err(EINVAL);
+                }
                 self.falcon_ucode_offset = Some(ucode_offset);
             }
             Err(e) => {
@@ -1006,7 +1032,11 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // Read the first 4 bytes to get the version.
-        let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
+        let hdr_bytes: [u8; 4] = self
+            .base
+            .data
+            .get(falcon_ucode_offset..falcon_ucode_offset.checked_add(4).ok_or(EINVAL)?)
+            .ok_or(EINVAL)?
             .try_into()
             .map_err(|_| EINVAL)?;
         let hdr = u32::from_le_bytes(hdr_bytes);
@@ -1038,13 +1068,18 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDesc) -> Result<&[u8]> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // The ucode data follows the descriptor.
-        let ucode_data_offset = falcon_ucode_offset + desc.size();
-        let size = usize::from_safe_cast(desc.imem_load_size() + desc.dmem_load_size());
+        let ucode_data_offset = falcon_ucode_offset.checked_add(desc.size()).ok_or(ERANGE)?;
+        let size_u32 = desc
+            .imem_load_size()
+            .checked_add(desc.dmem_load_size())
+            .ok_or(ERANGE)?;
+        let size = usize::from_safe_cast(size_u32);
+        let ucode_data_end = ucode_data_offset.checked_add(size).ok_or(ERANGE)?;
 
         // Get the data slice, checking bounds in a single operation.
         self.base
             .data
-            .get(ucode_data_offset..ucode_data_offset + size)
+            .get(ucode_data_offset..ucode_data_end)
             .ok_or(ERANGE)
             .inspect_err(|_| {
                 dev_err!(
@@ -1061,12 +1096,18 @@ pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignatu
             FalconUCodeDesc::V3(_v3) => core::mem::size_of::<FalconUCodeDescV3>(),
         };
         // The signatures data follows the descriptor.
-        let sigs_data_offset = self.falcon_ucode_offset + hdr_size;
+        let sigs_data_offset = self
+            .falcon_ucode_offset
+            .checked_add(hdr_size)
+            .ok_or(ERANGE)?;
         let sigs_count = usize::from(desc.signature_count());
-        let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
+        let sigs_size = sigs_count
+            .checked_mul(core::mem::size_of::<Bcrt30Rsa3kSignature>())
+            .ok_or(ERANGE)?;
 
         // Make sure the data is within bounds.
-        if sigs_data_offset + sigs_size > self.base.data.len() {
+        let end = sigs_data_offset.checked_add(sigs_size).ok_or(ERANGE)?;
+        if end > self.base.data.len() {
             dev_err!(
                 self.base.dev,
                 "fwsec signatures data not contained within BIOS bounds\n"
-- 
2.52.0

