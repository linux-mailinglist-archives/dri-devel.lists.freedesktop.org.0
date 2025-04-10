Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E92A83F8C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8DE10E8E2;
	Thu, 10 Apr 2025 09:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Ty4LvjWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF50A10E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:55:43 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A60F8V032471;
 Thu, 10 Apr 2025 10:55:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=4
 fNZA+lk5C21yXUFwCx6jyNHzAoSsvMZ7ySKgArljjo=; b=Ty4LvjWqlGtJQfMvC
 g++UB2sTyBxiLMP7jCLcVUXmL9J7skBsypbu20aIdv5wu1HF/yZDlrZq+Lkb4IAW
 +l6OILshGF3Z2q1n2IVBL5ERsUiCL9Ib+sBVeQL0wzvRJ/+bc4R4fizYjui16c1W
 pRvxidRS5lhr6EQF7LiMP1DoMWOVQPRXAqNTmecCE7CHd5wakt49G7jcNm7poU2E
 g9W31g5+Tu6tmNT2GfYMLKrQ6D06VGAOTXmCJZYewZla5sfR6rtse03IwlXMwUKa
 QiSW5qYeteNVsp8yYncSUh5W7YRt0EmprKdCEFGO/QBl+Lzq7laQ15XsdRV7pTvK
 YVYLA==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45w86h1d34-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Apr 2025 10:55:28 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Apr 2025 10:55:25 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 10 Apr 2025 10:55:11 +0100
Subject: [PATCH v6 12/18] drm/imagination: Use callbacks for fw irq
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-sets-bxs-4-64-patch-v1-v6-12-eda620c5865f@imgtec.com>
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7452;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=jpHwzrjowDkpdHoaZcO1f45rsyO9HISv2/yS1c3RlZ0=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaR/n9qUEXpULHcdd3TQ0VOKN+1fvzx5ou8u34TIcw7eg
 Vobz5iu6ChlYRDjYJAVU2TZscJyhdofNS2JG7+KYeawMoEMYeDiFICJPLvF8L+Up3umaJ7bCu0P
 bOY/tURbFghvSlFxuMjaO/HIY+sM1sOMDCvk3at1L92rl7tg6Lp1U+odSf4dE2OsmC9rv8k922k
 zkxUA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=MLNgmNZl c=1 sm=1 tr=0 ts=67f79590 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=Y33Pwm5EY2qbWUOeHhAA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: LOWUnrvZyHmim4GrOCePZKS6wa-K1QzH
X-Proofpoint-ORIG-GUID: LOWUnrvZyHmim4GrOCePZKS6wa-K1QzH
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
Reviewed-by: Frank Binns <frank.binns@imgtec.com>
---
Changes in v6:
- Add Frank's Rb
- Link to v5: https://lore.kernel.org/r/20250326-sets-bxs-4-64-patch-v1-v5-12-e4c46e8280a9@imgtec.com
Changes in v5:
- None
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-12-d987cf4ca439@imgtec.com
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-12-143b3dbef02f@imgtec.com
Changes in v3:
- None
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-14-3fd45d9fb0cf@imgtec.com
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
index 12bf0b9e5bfb48ef9e5ed9faa44e0896b7555f49..eb5da8c7040fc9e9751f433279cb0c92fd4d1336 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -739,4 +739,22 @@ pvr_ioctl_union_padding_check(void *instance, size_t union_offset,
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
index 41485769fc7cfb643ce7b0ac814d142fa7e15325..60db3668ad3ca355b797693b000c0b1ac816316e 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -532,6 +532,20 @@ pvr_meta_vm_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 			 fw_obj->fw_mm_node.start, fw_obj->fw_mm_node.size);
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
@@ -539,11 +553,7 @@ const struct pvr_fw_defs pvr_fw_defs_meta = {
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
index 5feae0dc85ab51cb3c4e67885bf53cf88d8fa531..7526dddbf5205f3472287f32af8ec7e97ba0fce4 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -225,6 +225,20 @@ pvr_mips_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
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
@@ -233,11 +247,7 @@ const struct pvr_fw_defs pvr_fw_defs_mips = {
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
2.49.0

