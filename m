Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C062A595B3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 14:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743AF10E459;
	Mon, 10 Mar 2025 13:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="FFHMnZrC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C01A10E453
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:11:04 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A7nW1j015329;
 Mon, 10 Mar 2025 13:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=8
 /EUoXyBm6cHGSTMYecQTdr7cNf+/afjOP6sdNTj7Ys=; b=FFHMnZrC4ts79rN8j
 sfYcAnJsVQ0DqAVMMaN9zxiPPGfvxUDBa0N7c953YWCj1/s4OuAwo6xFX7GUlb1q
 krkSr9jCT+O2CgGpFRElyynN+rd9K5MryoC+dte4QMwF/ntGsutc8yNA5FcLdHgl
 4dlmstDmE4GuFUgYNvSxPSwsivZhjsT6vyq2vm7czTXQqFyOeKosl5Z9W+JVfy7L
 aAga6w8hNBZz6UgRRGekBfPXB8zhHBtl4IMxnodZ8CjI+U6TFbaMCw/wowIEJxuP
 HP0fbl5FJpmJDpWanw6GFbmdY7yUumE6+FQDqVT5OfGCwox7Brc9bdZbUYC/7AMQ
 NZrKA==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 458d1wha4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 Mar 2025 13:10:52 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.0.133) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 13:10:50 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 10 Mar 2025 13:10:34 +0000
Subject: [PATCH v3 10/18] drm/imagination: Make has_fixed_data_addr a value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-sets-bxs-4-64-patch-v1-v3-10-143b3dbef02f@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
In-Reply-To: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, "Alessio
 Belle" <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4962;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=0aAy3lx4xJkC3E9Cd63Ve1a6BcqvYVGktGJkeezfx+k=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaSfe3Lxbf+lGgkxu1Ohmqp7Ozev8kg45sLUqKg8M7sth
 PnizbTlHaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCRy8sZ/mn9izG+3nr+Yn2M
 egLHstO3Qh9EnK5Z412ecPjX6h2bM8wYGdpnlRoJPatdVLE7zSVXyUzyWcVxZzFV8fcB59W27W3
 nYgIA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: dzPObRdYR2knv7jfZ1aTigmpgYO65JjU
X-Proofpoint-GUID: dzPObRdYR2knv7jfZ1aTigmpgYO65JjU
X-Authority-Analysis: v=2.4 cv=U8+SDfru c=1 sm=1 tr=0 ts=67cee4dc cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=_sBYpape5WJv0mR81mQA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

This is currently a callback function which takes no parameters; there's
no reason for this so let's make it a straightforward value in pvr_fw_defs.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v3:
- None
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-11-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-12-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_fw.c      |  2 +-
 drivers/gpu/drm/imagination/pvr_fw.h      | 23 ++++++++---------------
 drivers/gpu/drm/imagination/pvr_fw_meta.c |  8 +-------
 drivers/gpu/drm/imagination/pvr_fw_mips.c |  8 +-------
 4 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 9147c70edc0ef4e86d0b24c3568a43efbafb6bd8..c331d6001550a0b1d9cfbda2cd6629533ab6ee33 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -666,7 +666,7 @@ pvr_fw_process(struct pvr_device *pvr_dev)
 		return PTR_ERR(fw_code_ptr);
 	}
 
-	if (pvr_dev->fw_dev.defs->has_fixed_data_addr()) {
+	if (pvr_dev->fw_dev.defs->has_fixed_data_addr) {
 		u32 base_addr = private_data->base_addr & pvr_dev->fw_dev.fw_heap_info.offset_mask;
 
 		fw_data_ptr =
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index eead744835726712622d5aba9b3480fe264a089f..180d310074e3585c641e540a9e2576b5ab2a5705 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -166,21 +166,6 @@ struct pvr_fw_defs {
 	 */
 	int (*wrapper_init)(struct pvr_device *pvr_dev);
 
-	/**
-	 * @has_fixed_data_addr:
-	 *
-	 * Called to check if firmware fixed data must be loaded at the address given by the
-	 * firmware layout table.
-	 *
-	 * This function is mandatory.
-	 *
-	 * Returns:
-	 *  * %true if firmware fixed data must be loaded at the address given by the firmware
-	 *    layout table.
-	 *  * %false otherwise.
-	 */
-	bool (*has_fixed_data_addr)(void);
-
 	/**
 	 * @irq: FW Interrupt information.
 	 *
@@ -205,6 +190,14 @@ struct pvr_fw_defs {
 		/** @clear_mask: Value to write to the clear_reg in order to clear FW IRQs. */
 		u32 clear_mask;
 	} irq;
+
+	/**
+	 * @has_fixed_data_addr: Specify whether the firmware fixed data must be loaded at the
+	 *                       address given by the firmware layout table.
+	 *
+	 * This value is mandatory.
+	 */
+	bool has_fixed_data_addr;
 };
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index cf86701ca8f14920329ccb4c2811424b0c394b14..4433b04e0adb3684b86a4e90f63d670a81ecd826 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -531,12 +531,6 @@ pvr_meta_vm_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 		     fw_obj->fw_mm_node.size);
 }
 
-static bool
-pvr_meta_has_fixed_data_addr(void)
-{
-	return false;
-}
-
 const struct pvr_fw_defs pvr_fw_defs_meta = {
 	.init = pvr_meta_init,
 	.fw_process = pvr_meta_fw_process,
@@ -544,11 +538,11 @@ const struct pvr_fw_defs pvr_fw_defs_meta = {
 	.vm_unmap = pvr_meta_vm_unmap,
 	.get_fw_addr_with_offset = pvr_meta_get_fw_addr_with_offset,
 	.wrapper_init = pvr_meta_wrapper_init,
-	.has_fixed_data_addr = pvr_meta_has_fixed_data_addr,
 	.irq = {
 		.status_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
 		.clear_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
 		.status_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_EN,
 		.clear_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_CLRMSK,
 	},
+	.has_fixed_data_addr = false,
 };
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
index f195c602bb112066e88210d0106cb5ffc0a9abc6..2c3172841886b70eb7a9992ec3851f18adcad8d5 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -227,12 +227,6 @@ pvr_mips_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
 	       ROGUE_FW_HEAP_MIPS_BASE;
 }
 
-static bool
-pvr_mips_has_fixed_data_addr(void)
-{
-	return true;
-}
-
 const struct pvr_fw_defs pvr_fw_defs_mips = {
 	.init = pvr_mips_init,
 	.fini = pvr_mips_fini,
@@ -241,11 +235,11 @@ const struct pvr_fw_defs pvr_fw_defs_mips = {
 	.vm_unmap = pvr_vm_mips_unmap,
 	.get_fw_addr_with_offset = pvr_mips_get_fw_addr_with_offset,
 	.wrapper_init = pvr_mips_wrapper_init,
-	.has_fixed_data_addr = pvr_mips_has_fixed_data_addr,
 	.irq = {
 		.status_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS,
 		.clear_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR,
 		.status_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN,
 		.clear_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR_EVENT_EN,
 	},
+	.has_fixed_data_addr = true,
 };

-- 
2.48.1

