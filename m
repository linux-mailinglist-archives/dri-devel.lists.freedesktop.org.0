Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3406E881BF7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 05:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E81D10EDD6;
	Thu, 21 Mar 2024 04:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C3810EDD6;
 Thu, 21 Mar 2024 04:38:51 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 42L4ckVb1056537; Thu, 21 Mar 2024 10:08:46 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 42L4ckAn1056536;
 Thu, 21 Mar 2024 10:08:46 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [PATCH v2] drm/amdgpu: refactor code to split devcoredump code
Date: Thu, 21 Mar 2024 10:08:43 +0530
Message-Id: <20240321043843.1056505-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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

Refractor devcoredump code into new files since its
functionality is expanded further and better to slit
and devcoredump to have its own file.

v2: Fix the build failure caught by arm compiler
of implicit function declaration with #ifdef

Cc: Ivan Lipski <ivan.lipski@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 218 ++++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  |  47 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     | 191 ---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h     |  16 --
 6 files changed, 270 insertions(+), 208 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 535e3936cfe0..1f6b56ec99f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -81,7 +81,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
 	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
 	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
 	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
-	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
+	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o
 
 amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
new file mode 100644
index 000000000000..f3a0f5857598
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#include <generated/utsrelease.h>
+
+#ifndef CONFIG_DEV_COREDUMP
+void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
+		     struct amdgpu_reset_context *reset_context)
+{
+}
+#else
+
+#include <linux/devcoredump.h>
+#include "amdgpu_dev_coredump.h"
+
+const char *hw_ip_names[MAX_HWIP] = {
+	[GC_HWIP]		= "GC",
+	[HDP_HWIP]		= "HDP",
+	[SDMA0_HWIP]		= "SDMA0",
+	[SDMA1_HWIP]		= "SDMA1",
+	[SDMA2_HWIP]		= "SDMA2",
+	[SDMA3_HWIP]		= "SDMA3",
+	[SDMA4_HWIP]		= "SDMA4",
+	[SDMA5_HWIP]		= "SDMA5",
+	[SDMA6_HWIP]		= "SDMA6",
+	[SDMA7_HWIP]		= "SDMA7",
+	[LSDMA_HWIP]		= "LSDMA",
+	[MMHUB_HWIP]		= "MMHUB",
+	[ATHUB_HWIP]		= "ATHUB",
+	[NBIO_HWIP]		= "NBIO",
+	[MP0_HWIP]		= "MP0",
+	[MP1_HWIP]		= "MP1",
+	[UVD_HWIP]		= "UVD/JPEG/VCN",
+	[VCN1_HWIP]		= "VCN1",
+	[VCE_HWIP]		= "VCE",
+	[VPE_HWIP]		= "VPE",
+	[DF_HWIP]		= "DF",
+	[DCE_HWIP]		= "DCE",
+	[OSSSYS_HWIP]		= "OSSSYS",
+	[SMUIO_HWIP]		= "SMUIO",
+	[PWR_HWIP]		= "PWR",
+	[NBIF_HWIP]		= "NBIF",
+	[THM_HWIP]		= "THM",
+	[CLK_HWIP]		= "CLK",
+	[UMC_HWIP]		= "UMC",
+	[RSMU_HWIP]		= "RSMU",
+	[XGMI_HWIP]		= "XGMI",
+	[DCI_HWIP]		= "DCI",
+	[PCIE_HWIP]		= "PCIE",
+};
+
+static ssize_t
+amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
+			void *data, size_t datalen)
+{
+	struct drm_printer p;
+	struct amdgpu_coredump_info *coredump = data;
+	struct drm_print_iterator iter;
+	struct amdgpu_vm_fault_info *fault_info;
+	int i, ver;
+
+	iter.data = buffer;
+	iter.offset = 0;
+	iter.start = offset;
+	iter.remain = count;
+
+	p = drm_coredump_printer(&iter);
+
+	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
+	drm_printf(&p, "version: " AMDGPU_COREDUMP_VERSION "\n");
+	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
+	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
+	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec,
+			coredump->reset_time.tv_nsec);
+
+	if (coredump->reset_task_info.pid)
+		drm_printf(&p, "process_name: %s PID: %d\n",
+			   coredump->reset_task_info.process_name,
+			   coredump->reset_task_info.pid);
+
+	/* GPU IP's information of the SOC */
+	drm_printf(&p, "\nIP Information\n");
+	drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
+	drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
+	drm_printf(&p, "SOC External Revision id: %d\n", coredump->adev->external_rev_id);
+
+	for (int i = 1; i < MAX_HWIP; i++) {
+		for (int j = 0; j < HWIP_MAX_INSTANCE; j++) {
+			ver = coredump->adev->ip_versions[i][j];
+			if (ver)
+				drm_printf(&p, "HWIP: %s[%d][%d]: v%d.%d.%d.%d.%d\n",
+					   hw_ip_names[i], i, j,
+					   IP_VERSION_MAJ(ver),
+					   IP_VERSION_MIN(ver),
+					   IP_VERSION_REV(ver),
+					   IP_VERSION_VARIANT(ver),
+					   IP_VERSION_SUBREV(ver));
+		}
+	}
+
+	if (coredump->ring) {
+		drm_printf(&p, "\nRing timed out details\n");
+		drm_printf(&p, "IP Type: %d Ring Name: %s\n",
+			   coredump->ring->funcs->type,
+			   coredump->ring->name);
+	}
+
+	/* Add page fault information */
+	fault_info = &coredump->adev->vm_manager.fault_info;
+	drm_printf(&p, "\n[%s] Page fault observed\n",
+		   fault_info->vmhub ? "mmhub" : "gfxhub");
+	drm_printf(&p, "Faulty page starting at address: 0x%016llx\n", fault_info->addr);
+	drm_printf(&p, "Protection fault status register: 0x%x\n\n", fault_info->status);
+
+	/* Add ring buffer information */
+	drm_printf(&p, "Ring buffer information\n");
+	for (int i = 0; i < coredump->adev->num_rings; i++) {
+		int j = 0;
+		struct amdgpu_ring *ring = coredump->adev->rings[i];
+
+		drm_printf(&p, "ring name: %s\n", ring->name);
+		drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask: %x\n",
+			   amdgpu_ring_get_rptr(ring),
+			   amdgpu_ring_get_wptr(ring),
+			   ring->buf_mask);
+		drm_printf(&p, "Ring size in dwords: %d\n",
+			   ring->ring_size / 4);
+		drm_printf(&p, "Ring contents\n");
+		drm_printf(&p, "Offset \t Value\n");
+
+		while (j < ring->ring_size) {
+			drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j/4]);
+			j += 4;
+		}
+	}
+
+	if (coredump->reset_vram_lost)
+		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
+	if (coredump->adev->reset_info.num_regs) {
+		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
+
+		for (i = 0; i < coredump->adev->reset_info.num_regs; i++)
+			drm_printf(&p, "0x%08x: 0x%08x\n",
+				   coredump->adev->reset_info.reset_dump_reg_list[i],
+				   coredump->adev->reset_info.reset_dump_reg_value[i]);
+	}
+
+	return count - iter.remain;
+}
+
+static void amdgpu_devcoredump_free(void *data)
+{
+	kfree(data);
+}
+
+void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
+		     struct amdgpu_reset_context *reset_context)
+{
+	struct amdgpu_coredump_info *coredump;
+	struct drm_device *dev = adev_to_drm(adev);
+	struct amdgpu_job *job = reset_context->job;
+	struct drm_sched_job *s_job;
+
+	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
+
+	if (!coredump) {
+		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
+		return;
+	}
+
+	coredump->reset_vram_lost = vram_lost;
+
+	if (reset_context->job && reset_context->job->vm) {
+		struct amdgpu_task_info *ti;
+		struct amdgpu_vm *vm = reset_context->job->vm;
+
+		ti = amdgpu_vm_get_task_info_vm(vm);
+		if (ti) {
+			coredump->reset_task_info = *ti;
+			amdgpu_vm_put_task_info(ti);
+		}
+	}
+
+	if (job) {
+		s_job = &job->base;
+		coredump->ring = to_amdgpu_ring(s_job->sched);
+	}
+
+	coredump->adev = adev;
+
+	ktime_get_ts64(&coredump->reset_time);
+
+	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
+		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
+}
+#endif
+
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
new file mode 100644
index 000000000000..52459512cb2b
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __AMDGPU_DEV_COREDUMP_H__
+#define __AMDGPU_DEV_COREDUMP_H__
+
+#include "amdgpu.h"
+#include "amdgpu_reset.h"
+
+#ifdef CONFIG_DEV_COREDUMP
+
+#define AMDGPU_COREDUMP_VERSION "1"
+
+struct amdgpu_coredump_info {
+	struct amdgpu_device            *adev;
+	struct amdgpu_task_info         reset_task_info;
+	struct timespec64               reset_time;
+	bool                            reset_vram_lost;
+	struct amdgpu_ring              *ring;
+};
+#endif
+
+void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
+		     struct amdgpu_reset_context *reset_context);
+
+#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3204b8f6edeb..95028f57cb56 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -75,6 +75,10 @@
 #include "amdgpu_reset.h"
 #include "amdgpu_virt.h"
 
+#ifdef CONFIG_DEV_COREDUMP
+#include "amdgpu_dev_coredump.h"
+#endif
+
 #include <linux/suspend.h>
 #include <drm/task_barrier.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 3398f2a368d5..ea4873f6ccd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -21,50 +21,11 @@
  *
  */
 
-#include <linux/devcoredump.h>
-#include <generated/utsrelease.h>
-
 #include "amdgpu_reset.h"
 #include "aldebaran.h"
 #include "sienna_cichlid.h"
 #include "smu_v13_0_10.h"
 
-const char *hw_ip_names[MAX_HWIP] = {
-	[GC_HWIP]		= "GC",
-	[HDP_HWIP]		= "HDP",
-	[SDMA0_HWIP]		= "SDMA0",
-	[SDMA1_HWIP]		= "SDMA1",
-	[SDMA2_HWIP]		= "SDMA2",
-	[SDMA3_HWIP]		= "SDMA3",
-	[SDMA4_HWIP]		= "SDMA4",
-	[SDMA5_HWIP]		= "SDMA5",
-	[SDMA6_HWIP]		= "SDMA6",
-	[SDMA7_HWIP]		= "SDMA7",
-	[LSDMA_HWIP]		= "LSDMA",
-	[MMHUB_HWIP]		= "MMHUB",
-	[ATHUB_HWIP]		= "ATHUB",
-	[NBIO_HWIP]		= "NBIO",
-	[MP0_HWIP]		= "MP0",
-	[MP1_HWIP]		= "MP1",
-	[UVD_HWIP]		= "UVD/JPEG/VCN",
-	[VCN1_HWIP]		= "VCN1",
-	[VCE_HWIP]		= "VCE",
-	[VPE_HWIP]		= "VPE",
-	[DF_HWIP]		= "DF",
-	[DCE_HWIP]		= "DCE",
-	[OSSSYS_HWIP]		= "OSSSYS",
-	[SMUIO_HWIP]		= "SMUIO",
-	[PWR_HWIP]		= "PWR",
-	[NBIF_HWIP]		= "NBIF",
-	[THM_HWIP]		= "THM",
-	[CLK_HWIP]		= "CLK",
-	[UMC_HWIP]		= "UMC",
-	[RSMU_HWIP]		= "RSMU",
-	[XGMI_HWIP]		= "XGMI",
-	[DCI_HWIP]		= "DCI",
-	[PCIE_HWIP]		= "PCIE",
-};
-
 int amdgpu_reset_init(struct amdgpu_device *adev)
 {
 	int ret = 0;
@@ -197,155 +158,3 @@ void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain)
 	atomic_set(&reset_domain->in_gpu_reset, 0);
 	up_write(&reset_domain->sem);
 }
-
-#ifndef CONFIG_DEV_COREDUMP
-void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
-		     struct amdgpu_reset_context *reset_context)
-{
-}
-#else
-static ssize_t
-amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
-			void *data, size_t datalen)
-{
-	struct drm_printer p;
-	struct amdgpu_coredump_info *coredump = data;
-	struct drm_print_iterator iter;
-	struct amdgpu_vm_fault_info *fault_info;
-	int i, ver;
-
-	iter.data = buffer;
-	iter.offset = 0;
-	iter.start = offset;
-	iter.remain = count;
-
-	p = drm_coredump_printer(&iter);
-
-	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
-	drm_printf(&p, "version: " AMDGPU_COREDUMP_VERSION "\n");
-	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
-	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
-	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec,
-			coredump->reset_time.tv_nsec);
-
-	if (coredump->reset_task_info.pid)
-		drm_printf(&p, "process_name: %s PID: %d\n",
-			   coredump->reset_task_info.process_name,
-			   coredump->reset_task_info.pid);
-
-	/* GPU IP's information of the SOC */
-	drm_printf(&p, "\nIP Information\n");
-	drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
-	drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
-	drm_printf(&p, "SOC External Revision id: %d\n", coredump->adev->external_rev_id);
-
-	for (int i = 1; i < MAX_HWIP; i++) {
-		for (int j = 0; j < HWIP_MAX_INSTANCE; j++) {
-			ver = coredump->adev->ip_versions[i][j];
-			if (ver)
-				drm_printf(&p, "HWIP: %s[%d][%d]: v%d.%d.%d.%d.%d\n",
-					   hw_ip_names[i], i, j,
-					   IP_VERSION_MAJ(ver),
-					   IP_VERSION_MIN(ver),
-					   IP_VERSION_REV(ver),
-					   IP_VERSION_VARIANT(ver),
-					   IP_VERSION_SUBREV(ver));
-		}
-	}
-
-	if (coredump->ring) {
-		drm_printf(&p, "\nRing timed out details\n");
-		drm_printf(&p, "IP Type: %d Ring Name: %s\n",
-			   coredump->ring->funcs->type,
-			   coredump->ring->name);
-	}
-
-	/* Add page fault information */
-	fault_info = &coredump->adev->vm_manager.fault_info;
-	drm_printf(&p, "\n[%s] Page fault observed\n",
-		   fault_info->vmhub ? "mmhub" : "gfxhub");
-	drm_printf(&p, "Faulty page starting at address: 0x%016llx\n", fault_info->addr);
-	drm_printf(&p, "Protection fault status register: 0x%x\n\n", fault_info->status);
-
-	/* Add ring buffer information */
-	drm_printf(&p, "Ring buffer information\n");
-	for (int i = 0; i < coredump->adev->num_rings; i++) {
-		int j = 0;
-		struct amdgpu_ring *ring = coredump->adev->rings[i];
-
-		drm_printf(&p, "ring name: %s\n", ring->name);
-		drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask: %x\n",
-			   amdgpu_ring_get_rptr(ring),
-			   amdgpu_ring_get_wptr(ring),
-			   ring->buf_mask);
-		drm_printf(&p, "Ring size in dwords: %d\n",
-			   ring->ring_size / 4);
-		drm_printf(&p, "Ring contents\n");
-		drm_printf(&p, "Offset \t Value\n");
-
-		while (j < ring->ring_size) {
-			drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j/4]);
-			j += 4;
-		}
-	}
-
-	if (coredump->reset_vram_lost)
-		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
-	if (coredump->adev->reset_info.num_regs) {
-		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
-
-		for (i = 0; i < coredump->adev->reset_info.num_regs; i++)
-			drm_printf(&p, "0x%08x: 0x%08x\n",
-				   coredump->adev->reset_info.reset_dump_reg_list[i],
-				   coredump->adev->reset_info.reset_dump_reg_value[i]);
-	}
-
-	return count - iter.remain;
-}
-
-static void amdgpu_devcoredump_free(void *data)
-{
-	kfree(data);
-}
-
-void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
-		     struct amdgpu_reset_context *reset_context)
-{
-	struct amdgpu_coredump_info *coredump;
-	struct drm_device *dev = adev_to_drm(adev);
-	struct amdgpu_job *job = reset_context->job;
-	struct drm_sched_job *s_job;
-
-	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
-
-	if (!coredump) {
-		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
-		return;
-	}
-
-	coredump->reset_vram_lost = vram_lost;
-
-	if (reset_context->job && reset_context->job->vm) {
-		struct amdgpu_task_info *ti;
-		struct amdgpu_vm *vm = reset_context->job->vm;
-
-		ti = amdgpu_vm_get_task_info_vm(vm);
-		if (ti) {
-			coredump->reset_task_info = *ti;
-			amdgpu_vm_put_task_info(ti);
-		}
-	}
-
-	if (job) {
-		s_job = &job->base;
-		coredump->ring = to_amdgpu_ring(s_job->sched);
-	}
-
-	coredump->adev = adev;
-
-	ktime_get_ts64(&coredump->reset_time);
-
-	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
-		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
-}
-#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index 60522963aaca..66125d43cf21 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -88,19 +88,6 @@ struct amdgpu_reset_domain {
 	atomic_t reset_res;
 };
 
-#ifdef CONFIG_DEV_COREDUMP
-
-#define AMDGPU_COREDUMP_VERSION "1"
-
-struct amdgpu_coredump_info {
-	struct amdgpu_device		*adev;
-	struct amdgpu_task_info         reset_task_info;
-	struct timespec64               reset_time;
-	bool                            reset_vram_lost;
-	struct amdgpu_ring			*ring;
-};
-#endif
-
 int amdgpu_reset_init(struct amdgpu_device *adev);
 int amdgpu_reset_fini(struct amdgpu_device *adev);
 
@@ -141,9 +128,6 @@ void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain);
 
 void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain);
 
-void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
-		     struct amdgpu_reset_context *reset_context);
-
 #define for_each_handler(i, handler, reset_ctl)                  \
 	for (i = 0; (i < AMDGPU_RESET_MAX_HANDLERS) &&           \
 		    (handler = (*reset_ctl->reset_handlers)[i]); \
-- 
2.34.1

