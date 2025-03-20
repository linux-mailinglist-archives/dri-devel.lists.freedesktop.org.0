Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD4A6A4FA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5B410E246;
	Thu, 20 Mar 2025 11:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="eub8fp41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F9B10E264
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:32:47 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K7I9lU006831;
 Thu, 20 Mar 2025 11:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=F
 rZ2l0PeQkvsMON92bdUn2GFVDwEcZ5a2p2Dg8S4mQE=; b=eub8fp41cbf6U2eyU
 jeDvRdmziGYakhZf6G74eV1zZWxCwCiE5E5LrSuIlxYVJva2VL/rmw8KqmO1QtBz
 ky+zDCKzUrOnUUgXi2h372/4ogD8pwS1iyJJqDMSkgsbX68CqqaW2k965Wd6RmGw
 9AVhd9aW/Fuwh0dV1vzDey/1zvYtEkFs9ssHO4eVgP+Y8PX3uzU+CrTWhTb/wFTG
 qrFAwgo6dyziMTc+y+PsTSiKND1OTJWjTCvCjKEFKlxMYG+Sfvm3kjJdCzFmnRUf
 od2Tt4UvE/HvMFShHWxgK0fYOBnRQfbbazR9smG9f6u0AswJ5M5KE7ZL8rts6xvR
 sFmXQ==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45d2h1kwg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Mar 2025 11:32:31 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.0.133) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 11:32:30 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 20 Mar 2025 11:32:20 +0000
Subject: [PATCH v4 10/18] drm/imagination: Make has_fixed_data_addr a value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-sets-bxs-4-64-patch-v1-v4-10-d987cf4ca439@imgtec.com>
References: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
In-Reply-To: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
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
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, "Michal
 Wilczynski" <m.wilczynski@samsung.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5112;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=0jvqKyl0DTi7pPLvPyDmMt6HACApaVo/AwCKCLzJVQs=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaTf/nP0zeOVTJN3sRhyLX+2ZHpvyP2As2E6TfZCOdYft
 57Q/VH1oKOUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmMtOL4Z+xVbnJKcMmlosd
 qtuu3fy7u9ou+plhVNC++h6Rbcf4zfwZ/tmlTNp77MC1zL2bp5nv7Q4y+Bp/Tok/MXTWVh8mj5j
 /GlwA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: WZ0l_ggqCQ6oY0BJ_jbGVS9FFLX-ImFM
X-Proofpoint-ORIG-GUID: WZ0l_ggqCQ6oY0BJ_jbGVS9FFLX-ImFM
X-Authority-Analysis: v=2.4 cv=V8Z90fni c=1 sm=1 tr=0 ts=67dbfccf cx=c_pps
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
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-10-143b3dbef02f@imgtec.com
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
index 555b5ca4a27de78ac092bf94c601d284abe41ea6..74ea83b5c1a5f1edd79d2f5ccf1c6b1b400524a9 100644
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
index 6786e0153970691fa51ba3a0e62c00a46244a3a3..62ddfea6b7306784b979ce209bfdf4a9938f8984 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -533,12 +533,6 @@ pvr_meta_vm_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 			 fw_obj->fw_mm_node.start, fw_obj->fw_mm_node.size);
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
@@ -546,11 +540,11 @@ const struct pvr_fw_defs pvr_fw_defs_meta = {
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
2.49.0

