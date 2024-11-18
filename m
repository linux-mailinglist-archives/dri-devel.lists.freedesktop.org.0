Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE49D1139
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A53310E4C3;
	Mon, 18 Nov 2024 13:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="fWQCwr1p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D546810E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:02:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICJqTU027657;
 Mon, 18 Nov 2024 13:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=C
 2pYRbTitfQkZVCPd52JrM2BtH1tJjpTazLbGTXYvSI=; b=fWQCwr1picOlC+BX6
 XgiHLnw782Zl+1DC33jrZXKRv5m6wMpbQvMbVht/r4GVLTWhxk8U4lOJno+mVTfl
 sRFlmlMEmXMwj8XSlQkDnzCUU0Es2c/Y9Pv/SSg5zQavmPB4mksRIqAKPDfcnp8H
 2OPoLFBao+bDazj28jAB2hgnR+241sTd6ymyQOp0Yl28tEwG6oBwZhDsGbvzGTg8
 rZyRVDfvvalgmpFjjf251BMB8ZyHkUN4VvYG7HM2ELrwcARVyKSMFvdhC0ZbCk3F
 /Rgpn3oIMM3zt+ljDL18BPVInFYJsMuoMpYfD9wHs9vfxm7bjG3TlARTLAKpvUuL
 3iX/g==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmj5-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2024 13:02:43 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:42 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:02:08 +0000
Subject: [PATCH v2 16/21] drm/imagination: Move ELF fw utils to common file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-16-3fd45d9fb0cf@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7232;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=xXbzl2XXxqkx/Lfmf4ybowFt9Rq0TJ6W0fChWIkO/O0=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz27m3j91jbLQM3+GSzfWThaKmylXUVvyXTzNb1iW
 ipw6XJXRykLgxgHg6yYIsuOFZYr1P6oaUnc+FUMM4eVCWQIAxenAExkWw3DX3mDyGNdjjGvus4/
 LcvUuBN16nvRotfLXZyV/Q58N75xLZyR4bJyhuc3/fBH6/4tnq7QO7npldd2P//Q1WGSi5l1P90
 R4wMA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 03jTR1EQgqUoVGFkkscmnqrGGxI_nylN
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3af3 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=gtgaOig2gG6QrLUE_6sA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 03jTR1EQgqUoVGFkkscmnqrGGxI_nylN
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

Currently only MIPS firmware processors use ELF-formatted firmware. When
adding support for RISC-V firmware processors, it will be useful to have
ELF handling functions ready to go.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-16-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/Makefile      |  1 +
 drivers/gpu/drm/imagination/pvr_fw.h      |  5 +++
 drivers/gpu/drm/imagination/pvr_fw_mips.c | 59 +--------------------------
 drivers/gpu/drm/imagination/pvr_fw_util.c | 67 +++++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 9bc6a3884c2239e44265f3cdebee149841b270de..077e4762c7c383b6e339da1584c3865d830ef8d6 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -16,6 +16,7 @@ powervr-y := \
 	pvr_fw_mips.o \
 	pvr_fw_startstop.o \
 	pvr_fw_trace.o \
+	pvr_fw_util.o \
 	pvr_gem.o \
 	pvr_hwrt.o \
 	pvr_job.o \
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index ab69f40a7fbc6304171f16dd16d825a68b0362a5..8d3f0ee0aac69373f15ac5919d5b0f27c67cb284 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -478,4 +478,9 @@ pvr_fw_object_get_fw_addr(struct pvr_fw_object *fw_obj, u32 *fw_addr_out)
 	pvr_fw_object_get_fw_addr_offset(fw_obj, 0, fw_addr_out);
 }
 
+/* Util functions defined in pvr_util.c. These are intended for use in pvr_fw_<arch>.c files. */
+int
+pvr_fw_process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw, u8 *fw_code_ptr,
+				  u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr);
+
 #endif /* PVR_FW_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
index 524a9bd0a20b64c509f5708cc61d93b4c864b835..7f341ceb0661c61ac059654faeec91e149036467 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -8,7 +8,6 @@
 #include "pvr_rogue_mips.h"
 #include "pvr_vm_mips.h"
 
-#include <linux/elf.h>
 #include <linux/err.h>
 #include <linux/types.h>
 
@@ -16,60 +15,6 @@
 #define ROGUE_FW_HEAP_MIPS_SHIFT 24 /* 16 MB */
 #define ROGUE_FW_HEAP_MIPS_RESERVED_SIZE SZ_1M
 
-/**
- * process_elf_command_stream() - Process ELF firmware image and populate
- *                                firmware sections
- * @pvr_dev: Device pointer.
- * @fw: Pointer to firmware image.
- * @fw_code_ptr: Pointer to FW code section.
- * @fw_data_ptr: Pointer to FW data section.
- * @fw_core_code_ptr: Pointer to FW coremem code section.
- * @fw_core_data_ptr: Pointer to FW coremem data section.
- *
- * Returns :
- *  * 0 on success, or
- *  * -EINVAL on any error in ELF command stream.
- */
-static int
-process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw, u8 *fw_code_ptr,
-			   u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr)
-{
-	struct elf32_hdr *header = (struct elf32_hdr *)fw;
-	struct elf32_phdr *program_header = (struct elf32_phdr *)(fw + header->e_phoff);
-	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
-	u32 entry;
-	int err;
-
-	for (entry = 0; entry < header->e_phnum; entry++, program_header++) {
-		void *write_addr;
-
-		/* Only consider loadable entries in the ELF segment table */
-		if (program_header->p_type != PT_LOAD)
-			continue;
-
-		err = pvr_fw_find_mmu_segment(pvr_dev, program_header->p_vaddr,
-					      program_header->p_memsz, fw_code_ptr, fw_data_ptr,
-					      fw_core_code_ptr, fw_core_data_ptr, &write_addr);
-		if (err) {
-			drm_err(drm_dev,
-				"Addr 0x%x (size: %d) not found in any firmware segment",
-				program_header->p_vaddr, program_header->p_memsz);
-			return err;
-		}
-
-		/* Write to FW allocation only if available */
-		if (write_addr) {
-			memcpy(write_addr, fw + program_header->p_offset,
-			       program_header->p_filesz);
-
-			memset((u8 *)write_addr + program_header->p_filesz, 0,
-			       program_header->p_memsz - program_header->p_filesz);
-		}
-	}
-
-	return 0;
-}
-
 static int
 pvr_mips_init(struct pvr_device *pvr_dev)
 {
@@ -100,8 +45,8 @@ pvr_mips_fw_process(struct pvr_device *pvr_dev, const u8 *fw,
 	u32 page_nr;
 	int err;
 
-	err = process_elf_command_stream(pvr_dev, fw, fw_code_ptr, fw_data_ptr, fw_core_code_ptr,
-					 fw_core_data_ptr);
+	err = pvr_fw_process_elf_command_stream(pvr_dev, fw, fw_code_ptr, fw_data_ptr,
+						fw_core_code_ptr, fw_core_data_ptr);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw_util.c b/drivers/gpu/drm/imagination/pvr_fw_util.c
new file mode 100644
index 0000000000000000000000000000000000000000..7bc8a5c48e9b0eed2045607ab2cfed80a60a32b5
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_util.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/* Copyright (c) 2024 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+
+#include <linux/elf.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+/**
+ * pvr_fw_process_elf_command_stream() - Process ELF firmware image and populate
+ *                                       firmware sections
+ * @pvr_dev: Device pointer.
+ * @fw: Pointer to firmware image.
+ * @fw_code_ptr: Pointer to FW code section.
+ * @fw_data_ptr: Pointer to FW data section.
+ * @fw_core_code_ptr: Pointer to FW coremem code section.
+ * @fw_core_data_ptr: Pointer to FW coremem data section.
+ *
+ * Returns :
+ *  * 0 on success, or
+ *  * -EINVAL on any error in ELF command stream.
+ */
+int
+pvr_fw_process_elf_command_stream(struct pvr_device *pvr_dev, const u8 *fw,
+				  u8 *fw_code_ptr, u8 *fw_data_ptr,
+				  u8 *fw_core_code_ptr, u8 *fw_core_data_ptr)
+{
+	struct elf32_hdr *header = (struct elf32_hdr *)fw;
+	struct elf32_phdr *program_header = (struct elf32_phdr *)(fw + header->e_phoff);
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	u32 entry;
+	int err;
+
+	for (entry = 0; entry < header->e_phnum; entry++, program_header++) {
+		void *write_addr;
+
+		/* Only consider loadable entries in the ELF segment table */
+		if (program_header->p_type != PT_LOAD)
+			continue;
+
+		err = pvr_fw_find_mmu_segment(pvr_dev, program_header->p_vaddr,
+					      program_header->p_memsz, fw_code_ptr, fw_data_ptr,
+					      fw_core_code_ptr, fw_core_data_ptr, &write_addr);
+		if (err) {
+			drm_err(drm_dev,
+				"Addr 0x%x (size: %d) not found in any firmware segment",
+				program_header->p_vaddr, program_header->p_memsz);
+			return err;
+		}
+
+		/* Write to FW allocation only if available */
+		if (write_addr) {
+			memcpy(write_addr, fw + program_header->p_offset,
+			       program_header->p_filesz);
+
+			memset((u8 *)write_addr + program_header->p_filesz, 0,
+			       program_header->p_memsz - program_header->p_filesz);
+		}
+	}
+
+	return 0;
+}

-- 
2.47.0

