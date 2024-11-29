Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21C09D1141
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E9410E4CB;
	Mon, 18 Nov 2024 13:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="kQC8TdVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC55910E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:02:54 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICJqTS027657;
 Mon, 18 Nov 2024 13:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=0
 UyjQuREwE/0CSKWeg0NtSX0+/8FbuGk6u6GkwyFq1I=; b=kQC8TdVpqSi9twTOn
 pik2Buo3Y3J2AViwTLl5XYYmWZTc5iPYAzoDIRJ6TAyFjNigUL/RTojLsk3Vudu2
 a5c9RzhcxXtmYntGmNCA75M6X1+HkLwBbt75ozGKKqk5Lrr0OfXDTG7XQ5RfzrHm
 lWlKkIb/q0HIxGwgMCc0FO7iw0VBJKgYO+1rK6Lit3esPqRTDPEZcV05Tg2z6GSV
 ukNYQj7fS06vswEoxzX4+vEVOiO+/pg9AStK4/K4JjX7ASjcg0JIpW0qQwoGHRdv
 1AtPZNxfXcDE/6BjdFxTzEeYRRTX/bhI7ECIyzKGSCZwlkPzU9H0251gvUcqvpTt
 dTkBw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmj5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2024 13:02:41 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:40 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:02:06 +0000
Subject: [PATCH v2 14/21] drm/imagination: Use callbacks for fw irq
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-14-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
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
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6860;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=HtINBE16dRwtsNH1r+/yJtIFe6VjO7f0xTf6DhF+fFg=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz0VkHtdaXzj2vug148M/v3eJ7bLukl6Kr9/bVmOP
 qvStJp3HaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCR1YcZ/mmybFuYdemlyh7R
 iLwdK6rF7fUOOz1fIfv5L8McDsb9pdaMDC+qN10IMHvDu8g+8cuZ1XUpq19NmDFPQezHkbXOlVs
 0vzEBAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: emWzKAM8_TEy1_qoVMKo2AJHeE-eeQyg
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3af1 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=6iF6CzAXET1p6JnpVhoA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: emWzKAM8_TEy1_qoVMKo2AJHeE-eeQyg
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

This allows for more versatility in checking and clearing firmware
registers used for interrupt handling.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-14-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_device.h  | 18 +++++++++++++
 drivers/gpu/drm/imagination/pvr_fw.h      | 45 +++++++++----------------------
 drivers/gpu/drm/imagination/pvr_fw_meta.c | 22 ++++++++++-----
 drivers/gpu/drm/imagination/pvr_fw_mips.c | 22 ++++++++++-----
 4 files changed, 63 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index ec5eb78af82a3f3c32d6c89b68b7bc0fcee0b9d2..76f79b18af354f0e0070530dfc5c8fe0f6a41ce1 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -738,4 +738,22 @@ pvr_ioctl_union_padding_check(void *instance, size_t union_offset,
 					      __union_size, __member_size);  \
 	})
 
+/*
+ * These utility functions should more properly be placed in pvr_fw.h, but that
+ * would cause a dependency cycle between that header and this one. Since
+ * they're primarily used in pvr_device.c, let's put them in here for now.
+ */
+
+static __always_inline bool
+pvr_fw_irq_pending(struct pvr_device *pvr_dev)
+{
+	return pvr_dev->fw_dev.defs->irq_pending(pvr_dev);
+}
+
+static __always_inline void
+pvr_fw_irq_clear(struct pvr_device *pvr_dev)
+{
+	pvr_dev->fw_dev.defs->irq_clear(pvr_dev);
+}
+
 #endif /* PVR_DEVICE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index 88ad713468ce3a1ee459b04dde5363c24791a4f1..ab69f40a7fbc6304171f16dd16d825a68b0362a5 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -167,29 +167,22 @@ struct pvr_fw_defs {
 	int (*wrapper_init)(struct pvr_device *pvr_dev);
 
 	/**
-	 * @irq: FW Interrupt information.
+	 * @irq_pending: Check interrupt status register for pending interrupts.
 	 *
-	 * Those are processor dependent, and should be initialized by the
-	 * processor backend in pvr_fw_funcs::init().
+	 * @pvr_dev: Target PowerVR device.
+	 *
+	 * This function is mandatory.
 	 */
-	struct {
-		/** @status_reg: FW interrupt status register. */
-		u32 status_reg;
+	bool (*irq_pending)(struct pvr_device *pvr_dev);
 
-		/**
-		 * @clear_reg: FW interrupt clear register.
-		 *
-		 * If @status_reg == @clear_reg, we clear by write a bit to zero,
-		 * otherwise we clear by writing a bit to one.
-		 */
-		u32 clear_reg;
-
-		/** @status_mask: Bitmask of events to listen for in the status_reg. */
-		u32 status_mask;
-
-		/** @clear_mask: Value to write to the clear_reg in order to clear FW IRQs. */
-		u32 clear_mask;
-	} irq;
+	/**
+	 * @irq_clear: Clear pending interrupts.
+	 *
+	 * @pvr_dev: Target PowerVR device.
+	 *
+	 * This function is mandatory.
+	 */
+	void (*irq_clear)(struct pvr_device *pvr_dev);
 
 	/**
 	 * @has_fixed_data_addr: Specify whether the firmware fixed data must be loaded at the
@@ -390,18 +383,6 @@ struct pvr_fw_device {
 	} fw_objs;
 };
 
-#define pvr_fw_irq_read_reg(pvr_dev, name) \
-	pvr_cr_read32((pvr_dev), (pvr_dev)->fw_dev.defs->irq.name ## _reg)
-
-#define pvr_fw_irq_write_reg(pvr_dev, name, value) \
-	pvr_cr_write32((pvr_dev), (pvr_dev)->fw_dev.defs->irq.name ## _reg, value)
-
-#define pvr_fw_irq_pending(pvr_dev) \
-	(pvr_fw_irq_read_reg(pvr_dev, status) & (pvr_dev)->fw_dev.defs->irq.status_mask)
-
-#define pvr_fw_irq_clear(pvr_dev) \
-	pvr_fw_irq_write_reg(pvr_dev, clear, (pvr_dev)->fw_dev.defs->irq.clear_mask)
-
 enum pvr_fw_processor_type {
 	PVR_FW_PROCESSOR_TYPE_META = 0,
 	PVR_FW_PROCESSOR_TYPE_MIPS,
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 4433b04e0adb3684b86a4e90f63d670a81ecd826..09de3a30b625013c190196e02074fe72d08629a6 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -531,6 +531,20 @@ pvr_meta_vm_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 		     fw_obj->fw_mm_node.size);
 }
 
+static bool
+pvr_meta_irq_pending(struct pvr_device *pvr_dev)
+{
+	return pvr_cr_read32(pvr_dev, ROGUE_CR_META_SP_MSLVIRQSTATUS) &
+	       ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_EN;
+}
+
+static void
+pvr_meta_irq_clear(struct pvr_device *pvr_dev)
+{
+	pvr_cr_write32(pvr_dev, ROGUE_CR_META_SP_MSLVIRQSTATUS,
+		       ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_CLRMSK);
+}
+
 const struct pvr_fw_defs pvr_fw_defs_meta = {
 	.init = pvr_meta_init,
 	.fw_process = pvr_meta_fw_process,
@@ -538,11 +552,7 @@ const struct pvr_fw_defs pvr_fw_defs_meta = {
 	.vm_unmap = pvr_meta_vm_unmap,
 	.get_fw_addr_with_offset = pvr_meta_get_fw_addr_with_offset,
 	.wrapper_init = pvr_meta_wrapper_init,
-	.irq = {
-		.status_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
-		.clear_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
-		.status_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_EN,
-		.clear_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_CLRMSK,
-	},
+	.irq_pending = pvr_meta_irq_pending,
+	.irq_clear = pvr_meta_irq_clear,
 	.has_fixed_data_addr = false,
 };
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
index 2c3172841886b70eb7a9992ec3851f18adcad8d5..524a9bd0a20b64c509f5708cc61d93b4c864b835 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -227,6 +227,20 @@ pvr_mips_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
 	       ROGUE_FW_HEAP_MIPS_BASE;
 }
 
+static bool
+pvr_mips_irq_pending(struct pvr_device *pvr_dev)
+{
+	return pvr_cr_read32(pvr_dev, ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS) &
+	       ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN;
+}
+
+static void
+pvr_mips_irq_clear(struct pvr_device *pvr_dev)
+{
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR,
+		       ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR_EVENT_EN);
+}
+
 const struct pvr_fw_defs pvr_fw_defs_mips = {
 	.init = pvr_mips_init,
 	.fini = pvr_mips_fini,
@@ -235,11 +249,7 @@ const struct pvr_fw_defs pvr_fw_defs_mips = {
 	.vm_unmap = pvr_vm_mips_unmap,
 	.get_fw_addr_with_offset = pvr_mips_get_fw_addr_with_offset,
 	.wrapper_init = pvr_mips_wrapper_init,
-	.irq = {
-		.status_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS,
-		.clear_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR,
-		.status_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN,
-		.clear_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR_EVENT_EN,
-	},
+	.irq_pending = pvr_mips_irq_pending,
+	.irq_clear = pvr_mips_irq_clear,
 	.has_fixed_data_addr = true,
 };

-- 
2.47.0

