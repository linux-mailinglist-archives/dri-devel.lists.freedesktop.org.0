Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C93AD945C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D4910E8E3;
	Fri, 13 Jun 2025 18:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="URqtpEVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2041.outbound.protection.outlook.com [40.107.96.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411CD10E8EF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 18:24:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wcm+MXkGxOHw2SrU2QgDb/P+ZcuY3l3tgyXfcQMN4lzi6UmDavjehqsDF/X5Ef5dFKd8PGfYOd/akAUcYo+Me4RcvGzqB8NtsiWowZJuabe5ucMdYqoOK1Tp1aE/amFtn33X0EGUYTVuoGv09dybhoD4G3Y7Gi9aLc1Ek+7aB4IOZ0ZOSb6aSieLBqBaK0AGbPUhQ/n2pnXYdXhuoISnDoYwpSbUl+lctr9Xk4ibPJ/aUlY1cp2t4h/9rYKOGknt18yY8yNeXaJgR0QuX43AdZ5dcBpnxzVaRJ3O5vESw/qmYc41lHIg55N6eHksKi8G65PKXLESuPCv+JOQ2nnKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLycVHhYKpLXKVF4tSQCvrB4qlvtZ1O1633JJru1fV8=;
 b=qeWz/COH98IxDxZ+PBUZjQb8J/q5F4jt6JobvL9z+X3jGjVEGRPfN/kSES9Ibc64pnKzsuhMSZlQcsCCR7jMbijshEkbpBdvWgsSOejPgmCraq2SGCtlhVCZpgGqfdY7+z1UpLi9VhGuK7iiUjGvAmYxUiQ9cLi+g/YYCKOgdIP9Tf2YBwtW9zS4bGmsTGF2qoVz1C+6WM2nwhTNw14qI4JebWP/DuFZj94alllslwpuev3WopqBoofDZ7Rt4ZedpLWY/4+qKM6Y8juUc141fNkrTRdFYWXAdeJnPDsY3IB37uDQVqLYnO7xexvZEUs0kIfymC/AnyDdLUH8TCggoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLycVHhYKpLXKVF4tSQCvrB4qlvtZ1O1633JJru1fV8=;
 b=URqtpEVugngsFluiWM0FrePXgASnC9gF19Gf4cOw7hLmMDrO+eXQmBBDzgLnSBBASu+9podMhtlDqehO49zDAUfHcW41NWnwiI3K1Wifwz8DUJEOOZhMZvAz9iqm37tPP4wOerjLg3Fgnz38jIHUYJTXK8pN+kFtjvAC+xLReRk=
Received: from DS7PR03CA0156.namprd03.prod.outlook.com (2603:10b6:5:3b2::11)
 by BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Fri, 13 Jun
 2025 18:24:02 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::3a) by DS7PR03CA0156.outlook.office365.com
 (2603:10b6:5:3b2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Fri,
 13 Jun 2025 18:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 18:24:01 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 13:23:52 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
Date: Fri, 13 Jun 2025 14:23:36 -0400
Message-ID: <20250613182337.3767389-3-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613182337.3767389-1-David.Francis@amd.com>
References: <20250613182337.3767389-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: d8044ab5-7cd0-4ff6-b60f-08ddaaa77862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZB35NMxB9ZNsLWpf2SdTZSUrlwj0WAouS4Zzohbw5L7t7awppaOpcWABaF8v?=
 =?us-ascii?Q?Dj2cwi5lNm9HrwFtGWFL63Wb0AB7Ec/1asIUugfgGJyq8c4FgkgEnIK1zuSg?=
 =?us-ascii?Q?uqBat4Wwt/f14qbeuCVi9F1lARz/3OzbcmzoRUvV6fSCfjAdC57Vdg3u8MQO?=
 =?us-ascii?Q?zN+eExwnKuJRj9K87EGDT4E/2G2rOxdrp7cy4v1uK8baNhaao2fhGYAM/BAb?=
 =?us-ascii?Q?fl34c+1gob/uPvqD5xlSGIHt0WnqS8WDLyRvZo6a//VxadIY9j/obhFnltvF?=
 =?us-ascii?Q?AOliG6e54x7+2qaqqPrNUeL0T82+VpMAUlosxF1Qb7KwLGY57an8rmrBtcEY?=
 =?us-ascii?Q?yfeGfxGYH6v86IrN6qJ3OejD/B+/Rc9Uv8iw4T5+NFQLAYNocyEjkBv0N/Bn?=
 =?us-ascii?Q?ouujf8QcE5wGGfejsp0BBwOscoUHzRTv3pvMZ3KT6AfZBCamU/qPjYkLmfPY?=
 =?us-ascii?Q?7+ipVMiRBhhauFNpdZNhKyk4XB1uBwOq6/3IBbcB5mqV9oZY4Up5WwyzDJaf?=
 =?us-ascii?Q?gEqAsjFIcrvEDKK4SuXkYi3pIYn2n7yg3sFDCvnNMLzpNf0pgNBEbV6AQg1L?=
 =?us-ascii?Q?T7ubLS/iKhfe9dLYckX5qom/UFKffpoWvK3hYjELbv+I9SRndxyOxaAiYrZP?=
 =?us-ascii?Q?5HMQOcttOTqo39Wx3CfRMzlYeaeszfOK/Umxu3mVvVPnBvH5kYYlb6KYWMNo?=
 =?us-ascii?Q?5P1fjRSTD4Oyeh4NNHb8IOkVQ71bdTj2ouk+4Lv9MzB7Jkw1pgLWLw2eldoQ?=
 =?us-ascii?Q?cu/0UI0QBgzPlFyJHd9BIC4lxuC30+x4aen/u3jUeJXwd2b7EDn4BlDrQOAJ?=
 =?us-ascii?Q?Ug/dtrMa/SnObAFAxIdkxOwMyIK/wFD20QgfJoKMCsQ7OQ1llrN0WGVERD1O?=
 =?us-ascii?Q?enTfFZiL8QuqJ3NkZAK7AUUDdfT+joavR6sAHz0RmuhoA4vOpltMa0kQgHzj?=
 =?us-ascii?Q?gDH5A/Z5+XQEWWHkX5Sis/oD9wx6nhJm6fixmF7DjP2c4O0AsrwTzY4etjA2?=
 =?us-ascii?Q?eYC4bc8/lAv2EVxtwwDZ6On/vugiQm/79zCmogIzNg6obG/MmcmYsqcjee9N?=
 =?us-ascii?Q?TObeAiwdJ/gwi0LqxGsWVsg572zY1BH0VYiwUybEG8rNlsHNPte5SU0K2bEc?=
 =?us-ascii?Q?bAWIJnIcA9ySjClyp4/TO32Vr3PeI/XCbwJJtFV9PxE9wcP38YqUruYQSctn?=
 =?us-ascii?Q?xbBvQBVzCBAY7wuuBtGqCJbrt13LjFF2FvGmk1ltOZ2BCadJuc4rmzbohU/y?=
 =?us-ascii?Q?BWAhU4R1F22EbOcvsYRXw72a50eMaewEspwLpUg869OFYWYgTehv5vlWWIhN?=
 =?us-ascii?Q?oVoxArHDkLDXvY/Yy90WJNNoqfrkvbKlNrRMFXbl2In5S0VUzk1RbRF+P/Uz?=
 =?us-ascii?Q?Okr2HWh17w+YC04Hx4ARWM3MV5TQaBA76Qm2Iew/ZaeHTFhrMAp8pe5NMzSr?=
 =?us-ascii?Q?LVo8fmf+xGJEzRCdq4ly6l0CfYzksGRItTJ2DZ35M1WDVc5OG2XwjmiilK4F?=
 =?us-ascii?Q?c1XzYW/+b50pHiG4R15h+01/iWKg/ZKUNshL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:24:01.1668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8044ab5-7cd0-4ff6-b60f-08ddaaa77862
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620
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

amdgpu CRIU requires an amdgpu CRIU ioctl. This ioctl
has a similar interface to the amdkfd CRIU ioctl.

The objects that can be checkpointed and restored are bos and vm
mappings. Because a single amdgpu bo can have multiple mappings.
the mappings are recorded separately.

The ioctl has two modes: PROCESS_INFO, which sends to the user
how many bos and vms to expect, and CHECKPOINT, which copies
data about bos and vms into user-provided buffers.

Restore is handled using existing amdgpu and drm ioctls.

The new ioctl lives in a new file amdgpu_criu.c with its own
header amdgpu_criu.h

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 234 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  34 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h   |  10 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   2 +
 include/uapi/drm/amdgpu_drm.h            |  62 ++++++
 8 files changed, 357 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 87080c06e5fc..0863edcdd03f 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -63,7 +63,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
 	amdgpu_xgmi.o amdgpu_csa.o amdgpu_ras.o amdgpu_vm_cpu.o \
 	amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nbio.o \
 	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
-	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
+	amdgpu_fw_attestation.o amdgpu_securedisplay.o amdgpu_criu.o \
 	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
 	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o \
 	amdgpu_cper.o amdgpu_userq_fence.o amdgpu_eviction_fence.o
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
new file mode 100644
index 000000000000..8141ab09698c
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
@@ -0,0 +1,234 @@
+/* SPDX-License-Identifier: MIT */
+/*
+* Copyright 2025 Advanced Micro Devices, Inc.
+*
+* Permission is hereby granted, free of charge, to any person obtaining a
+* copy of this software and associated documentation files (the "Software"),
+* to deal in the Software without restriction, including without limitation
+* the rights to use, copy, modify, merge, publish, distribute, sublicense,
+* and/or sell copies of the Software, and to permit persons to whom the
+* Software is furnished to do so, subject to the following conditions:
+*
+* The above copyright notice and this permission notice shall be included in
+* all copies or substantial portions of the Software.
+*
+* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+* OTHER DEALINGS IN THE SOFTWARE.
+*/
+
+#include <linux/dma-buf.h>
+#include <linux/hashtable.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+
+#include <drm/amdgpu_drm.h>
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+
+#include "amdgpu_criu.h"
+
+#include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_exec.h>
+#include <drm/drm_gem_ttm_helper.h>
+#include <drm/ttm/ttm_tt.h>
+#include <linux/interval_tree_generic.h>
+
+#include "amdgpu.h"
+#include "amdgpu_display.h"
+#include "amdgpu_dma_buf.h"
+#include "amdgpu_hmm.h"
+#include "amdgpu_xgmi.h"
+
+static uint32_t hardware_flags_to_uapi_flags(struct amdgpu_device *adev, uint64_t pte_flags)
+{
+	uint32_t gem_flags = 0;
+
+	//This function will be replaced by the mapping flags rework
+
+	if (pte_flags & AMDGPU_PTE_EXECUTABLE)
+		gem_flags |= AMDGPU_VM_PAGE_EXECUTABLE;
+	if (pte_flags & AMDGPU_PTE_READABLE)
+		gem_flags |= AMDGPU_VM_PAGE_READABLE;
+	if (pte_flags & AMDGPU_PTE_WRITEABLE)
+		gem_flags |= AMDGPU_VM_PAGE_WRITEABLE;
+	if (pte_flags & AMDGPU_PTE_PRT_FLAG(adev))
+		gem_flags |= AMDGPU_VM_PAGE_PRT;
+	if (pte_flags & AMDGPU_PTE_NOALLOC)
+		gem_flags |= AMDGPU_VM_PAGE_NOALLOC;
+
+	return gem_flags;
+}
+
+
+/**
+ * amdgpu_criu_bo_info_ioctl - get information about a process' buffer objects
+ *
+ * @dev: drm device pointer
+ * @data: drm_amdgpu_criu_bo_info_args
+ * @filp: drm file pointer
+ *
+ * num_bos is set as an input to the size of the bo_buckets array.
+ * num_bos is sent back as output as the number of bos in the process.
+ * If that number is larger than the size of the array, the ioctl must
+ * be retried.
+ *
+ * Returns:
+ * 0 for success, -errno for errors.
+ */
+int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *filp)
+{
+	struct drm_amdgpu_criu_bo_info_args *args = data;
+	struct drm_amdgpu_criu_bo_bucket *bo_buckets;
+	struct drm_gem_object *gobj;
+	int id, ret = 0;
+	int bo_index = 0;
+	int num_bos = 0;
+
+	spin_lock(&filp->table_lock);
+	idr_for_each_entry(&filp->object_idr, gobj, id)
+		num_bos += 1;
+	spin_unlock(&filp->table_lock);
+
+	if (args->num_bos < num_bos) {
+		args->num_bos = num_bos;
+		goto exit;
+	}
+	args->num_bos = num_bos;
+	if (num_bos == 0) {
+		goto exit;
+	}
+
+	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
+	if (!bo_buckets) {
+		ret = -ENOMEM;
+		goto free_buckets;
+	}
+
+	spin_lock(&filp->table_lock);
+	idr_for_each_entry(&filp->object_idr, gobj, id) {
+		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
+		struct drm_amdgpu_criu_bo_bucket *bo_bucket;
+
+		bo_bucket = &bo_buckets[bo_index];
+
+		bo_bucket->size = amdgpu_bo_size(bo);
+		bo_bucket->offset = amdgpu_bo_mmap_offset(bo);
+		bo_bucket->alloc_flags = bo->flags & (~AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
+		bo_bucket->preferred_domains = bo->preferred_domains;
+		bo_bucket->gem_handle = id;
+
+		if (bo->tbo.base.import_attach)
+			bo_bucket->flags |= AMDGPU_CRIU_BO_FLAG_IS_IMPORT;
+
+		bo_index += 1;
+	}
+	spin_unlock(&filp->table_lock);
+
+	ret = copy_to_user((void __user *)args->bo_buckets, bo_buckets, num_bos * sizeof(*bo_buckets));
+	if (ret) {
+		pr_debug("Failed to copy BO information to user\n");
+		ret = -EFAULT;
+	}
+
+free_buckets:
+	kvfree(bo_buckets);
+exit:
+
+	return ret;
+}
+
+/**
+ * amdgpu_criu_bo_info_ioctl - get information about a process' buffer objects
+ *
+ * @dev: drm device pointer
+ * @data: drm_amdgpu_criu_mapping_info_args
+ * @filp: drm file pointer
+ *
+ * num_mappings is set as an input to the size of the vm_buckets array.
+ * num_mappings is sent back as output as the number of mappings the bo has.
+ * If that number is larger than the size of the array, the ioctl must
+ * be retried.
+ *
+ * Returns:
+ * 0 for success, -errno for errors.
+ */
+int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *filp)
+{
+	struct drm_amdgpu_criu_mapping_info_args *args = data;
+	struct drm_gem_object *gobj = idr_find(&filp->object_idr, args->gem_handle);
+	struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)filp->driver_priv)->vm;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
+	struct amdgpu_bo_va *bo_va = amdgpu_vm_bo_find(avm, bo);
+	struct amdgpu_fpriv *fpriv = filp->driver_priv;
+	struct drm_amdgpu_criu_vm_bucket *vm_buckets;
+	struct amdgpu_bo_va_mapping *mapping;
+	struct drm_exec exec;
+	int vm_index = 0;
+	int ret = 0;
+
+	vm_buckets = kvzalloc(args->num_mappings * sizeof(*vm_buckets), GFP_KERNEL);
+	if (!vm_buckets) {
+		ret = -ENOMEM;
+		goto free_vms;
+	}
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
+		      DRM_EXEC_IGNORE_DUPLICATES, 0);
+	drm_exec_until_all_locked(&exec) {
+		if (gobj) {
+			ret = drm_exec_lock_obj(&exec, gobj);
+			drm_exec_retry_on_contention(&exec);
+			if (ret)
+				goto unlock_exec;
+		}
+
+		ret = amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			goto unlock_exec;
+	}
+
+	amdgpu_vm_it_for_each_entry(avm, mapping, 0, U64_MAX) {
+		if (mapping->bo_va == bo_va) {
+			if (vm_index < args->num_mappings) {
+				vm_buckets[vm_index].start = mapping->start;
+				vm_buckets[vm_index].last = mapping->last;
+				vm_buckets[vm_index].offset = mapping->offset;
+				vm_buckets[vm_index].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
+			}
+			vm_index += 1;
+		}
+	}
+
+	drm_exec_fini(&exec);
+
+	if (vm_index > 0) {
+		if (vm_index <= args->num_mappings) {
+			ret = copy_to_user((void __user *)args->vm_buckets, vm_buckets, vm_index * sizeof(*vm_buckets));
+			if (ret) {
+				pr_debug("Failed to copy BO information to user\n");
+				ret = -EFAULT;
+			}
+		}
+	}
+	args->num_mappings = vm_index;
+
+
+	kvfree(vm_buckets);
+
+	return ret;
+unlock_exec:
+	drm_exec_fini(&exec);
+free_vms:
+	kvfree(vm_buckets);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
new file mode 100644
index 000000000000..9c196973ed0f
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+* Copyright 2025 Advanced Micro Devices, Inc.
+*
+* Permission is hereby granted, free of charge, to any person obtaining a
+* copy of this software and associated documentation files (the "Software"),
+* to deal in the Software without restriction, including without limitation
+* the rights to use, copy, modify, merge, publish, distribute, sublicense,
+* and/or sell copies of the Software, and to permit persons to whom the
+* Software is furnished to do so, subject to the following conditions:
+*
+* The above copyright notice and this permission notice shall be included in
+* all copies or substantial portions of the Software.
+*
+* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+* OTHER DEALINGS IN THE SOFTWARE.
+*/
+
+#ifndef __AMDGPU_CRIU_H__
+#define __AMDGPU_CRIU_H__
+
+#include <drm/amdgpu_drm.h>
+
+int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *filp);
+int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *filp);
+
+#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4db92e0a60da..5f3de93a665d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -53,6 +53,7 @@
 #include "amdgpu_xgmi.h"
 #include "amdgpu_userq.h"
 #include "amdgpu_userq_fence.h"
+#include "amdgpu_criu.h"
 #include "../amdxcp/amdgpu_xcp_drv.h"
 
 /*
@@ -3021,6 +3022,8 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgpu_criu_bo_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_MAPPING_INFO, amdgpu_criu_mapping_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver amdgpu_kms_driver = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3911c78f8282..f803908cf46d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3156,3 +3156,14 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo)
 {
 	return bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv;
 }
+
+
+struct amdgpu_bo_va_mapping *amdgpu_vm_it_first_mapping_in_range(struct amdgpu_vm *avm, uint64_t start, uint64_t end)
+{
+	return amdgpu_vm_it_iter_first(&avm->va, start, end);
+}
+
+struct amdgpu_bo_va_mapping *amdgpu_vm_it_next_mapping_in_range(struct amdgpu_bo_va_mapping *mapping, uint64_t start, uint64_t end)
+{
+	return amdgpu_vm_it_iter_next(mapping, start, end);
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index f3ad687125ad..cd7d3940cc7a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -668,4 +668,14 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev,
 				 struct amdgpu_vm *vm,
 				 struct dma_fence **fence);
 
+struct amdgpu_bo_va_mapping *amdgpu_vm_it_first_mapping_in_range(
+	struct amdgpu_vm *avm, uint64_t start, uint64_t end);
+struct amdgpu_bo_va_mapping *amdgpu_vm_it_next_mapping_in_range(
+	struct amdgpu_bo_va_mapping *mapping, uint64_t start, uint64_t end);
+
+#define amdgpu_vm_it_for_each_entry(avm, mapping, start, end) \
+	for (mapping = amdgpu_vm_it_first_mapping_in_range(avm, start, end); \
+		mapping; \
+		mapping = amdgpu_vm_it_next_mapping_in_range(mapping, start, end))
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a2149afa5803..a8cf2d4580cc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -45,6 +45,8 @@
 #include "amdgpu_dma_buf.h"
 #include "kfd_debug.h"
 
+#include "amdgpu_criu.h"
+
 static long kfd_ioctl(struct file *, unsigned int, unsigned long);
 static int kfd_open(struct inode *, struct file *);
 static int kfd_release(struct inode *, struct file *);
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 45c4fa13499c..16aee825e116 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -57,6 +57,10 @@ extern "C" {
 #define DRM_AMDGPU_USERQ		0x16
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
+#define DRM_AMDGPU_CRIU_OP		0x19
+
+#define DRM_AMDGPU_CRIU_BO_INFO	0x20
+#define DRM_AMDGPU_CRIU_MAPPING_INFO	0x21
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -77,6 +81,10 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
+#define DRM_IOCTL_AMDGPU_CRIU_OP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_OP, struct drm_amdgpu_criu_args)
+
+#define DRM_IOCTL_AMDGPU_CRIU_BO_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_BO_INFO, struct drm_amdgpu_criu_bo_info_args)
+#define DRM_IOCTL_AMDGPU_CRIU_MAPPING_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_MAPPING_INFO, struct drm_amdgpu_criu_mapping_info_args)
 
 /**
  * DOC: memory domains
@@ -1626,6 +1634,60 @@ struct drm_color_ctm_3x4 {
 	__u64 matrix[12];
 };
 
+#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT	(1 << 0)
+
+struct drm_amdgpu_criu_bo_info_args {
+    /* IN: Size of bo_buckets buffer. OUT: Number of bos in process (if larger than size of buffer, must retry) */
+    __u32   num_bos;
+
+    /* User pointer to array of drm_amdgpu_criu_bo_bucket */
+    __u64   bo_buckets;
+};
+
+struct drm_amdgpu_criu_bo_bucket {
+    /* Size of bo */
+    __u64 size;
+
+    /* Offset of bo in device file */
+    __u64 offset;
+
+    /* GEM_CREATE flags for re-creation of buffer */
+    __u64 alloc_flags;
+
+    /* Pending how to handle this; provides information needed to remake the buffer on restore */
+    __u32 preferred_domains;
+
+    /* Currently just one flag: IS_IMPORT */
+    __u32 flags;
+
+    __u32 gem_handle;
+};
+
+struct drm_amdgpu_criu_mapping_info_args {
+    /* Handle of bo to get mappings of */
+    __u32   gem_handle;
+
+    /* IN: Size of vm_buckets buffer. OUT: Number of bos in process (if larger than size of buffer, must retry) */
+    __u32   num_mappings;
+
+    /* User pointer to array of drm_amdgpu_criu_vm_bucket */
+    __u64   vm_buckets;
+};
+
+struct drm_amdgpu_criu_vm_bucket {
+    /* Start of mapping (in number of pages) */
+    __u64 start;
+
+    /* End of mapping (in number of pages) */
+    __u64 last;
+
+    /* Mapping offset */
+    __u64 offset;
+
+    /* flags needed to recreate mapping; still pending how to get these */
+    __u64 flags;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

