Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A05ADDC9E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 21:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6E810E138;
	Tue, 17 Jun 2025 19:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ebdQNhLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD51010E116
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 19:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iokfwkwZgKmgZ1wd8RT7yG0+iXUGEwTh1C6vdK8p56EED0gSGLsRI/O4zdDcGsHo/9kpS3EVtgcWO37fH4RAcA6MzSpqKIpfu955klrphQD2Q3HR9bpvSIIKhS4egkehfyosc7HhDravNIXIXPydMMUgfYvKOSGUHy7+gc2y8RXUBjqsQxweooiJdPuUSCnnI1WMEUo4exB7vGn/mqzOZS31n6OLl2Su6hoBxVjMctx7RKuH5vsmd+7Pa6KkkKemAc1KwKKfmYlJtJiqewVeJZdh67DQlUkpP9A9G7YH4n9G6zX2YwGw4Z//AxkVqnNxBMRPxT8myplSY7ghI+NNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzIgaVVUlF121h/Li5NwjC99Wpkdf5tCFlNvvDm9UWg=;
 b=vDupQeufmn/ep+X8guKGpWcBurzmUW6pxVok1owlqkK4YhPS43gnz9vDl8NXjZKHjJ8NnXGPotBlYJQstOepNYq9QMsuaMY2qmwnHLS/xWHIE/8NRH6Gd35N4nMxrPCssjxVjTe5QjbzrryInzU+w8UPS/2QE3UMuMaMdEfe9w2+jla2+wfACM3O+hWjE1NKQMRWheJYhd+1uG2kCu42jgg65oI3N9C/pm0Ad5HH3wqudhbzmRhAFTi/9WCxSA0o+nrHb8PJGpQVlhGnP6EttR2Pd4UQwDNXOfiunbl1Ua6EVhWOiFNJ1EdgI1tvJ0Ph1Of8ZajKBeEFWWiUbMlaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzIgaVVUlF121h/Li5NwjC99Wpkdf5tCFlNvvDm9UWg=;
 b=ebdQNhLwxfZZTv6YQj99bHMEJSZGUqsLUAaIJrkT2QROcYaEdTTKHAgU0nLzbl06cQEPaBfDgwmhZA6VIpg/azR80L8ENTHm8BijxIipqwZOYQQFxvqi8z3dk66LYniQgmC+AE6oKL0yZWj9DzrCG3SWC/o/4Oeuov/XBJxW8LM=
Received: from CH3P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::19)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 17 Jun
 2025 19:45:59 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::ca) by CH3P220CA0008.outlook.office365.com
 (2603:10b6:610:1e8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 19:45:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 19:45:58 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 14:45:57 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 2/4] drm/amdgpu: Add CRIU ioctl to get bo info
Date: Tue, 17 Jun 2025 15:45:34 -0400
Message-ID: <20250617194536.538681-3-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617194536.538681-1-David.Francis@amd.com>
References: <20250617194536.538681-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: b399840d-a077-4d7c-15a1-08ddadd79505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y3hpOFFFgr0UdaVt8TZxqFs69tb/MtzsKDNJki1C1c//m/GX20svfSHQSl11?=
 =?us-ascii?Q?Smyv00ZUa37hIK0VFTNFFSlfBMDQdCJPRjQYOtrCAd/tWfbiqW2PKbDtVVzk?=
 =?us-ascii?Q?7lbeuLJqV3qGFdZrYzNSOM0KG5Z/91ff0au3ex1ols/G4Dtz5AeDiISpCh77?=
 =?us-ascii?Q?vhoi7D3rDUgt2lpw7HrUW6m2aMcut+biSh5BZ6fiW2Il8JzQdoGYFv8FsNl/?=
 =?us-ascii?Q?/FNyDKmlcngDzK1iVta7kNk9+7yTbyXpw6I3EC5Bu18v7TZ1pBANWwX1qrjz?=
 =?us-ascii?Q?p1n+YvL8KNmGb3VIucH5cx0fRFHKYE7YF/0tGhGhuwcCNT6Wn0IE8bam4HEC?=
 =?us-ascii?Q?fGOH946xBn5CVm2RwcS0Rv4wtNqimrS2dwwSaklkLfd6NDhJz8hDkU2lRvmG?=
 =?us-ascii?Q?UQ8RW6HcTvAVKit+0bJuf2pPx/wganwKAQs2pfNE+yV6FR0spMjeUt2HMDtR?=
 =?us-ascii?Q?xGKrZWUojV7OeRVleHkGORLOhLEdhYfdt0xPr01j3mjDzbdvgvROsgFjvtx9?=
 =?us-ascii?Q?SQ2gLl8FhaEWjIGArRAH9jiUDn8D69rVC7mMHtgL739eXjy4+QP1VPxCQsbJ?=
 =?us-ascii?Q?IJRIjxaFF6IvkuWqt5mI+VV2A1i/c2X6OXT9gayQqR811AKT49ShJAtHMtKZ?=
 =?us-ascii?Q?WSDqfFM4iJZOxWNddpB9GFcmMabmT2ZASAQT59bRwjHL9/CS16YY9nXgocrI?=
 =?us-ascii?Q?v9unC+K6xdL1nv5FatOL4pKQ5Xz0oS9kmb2yV/a6EFv34GrrdcbtXABubXSA?=
 =?us-ascii?Q?k7zp8eXeMjUEvZQbCD+xi8M7B33fRbVicGSx2kNuAr/EHCon1N+z0g3I+4J9?=
 =?us-ascii?Q?OGiG2Xr5AE1dpQyTQnJ2+YNv4al5lxF/mDOH6ler4frAoNNiYdFQId5V4jbu?=
 =?us-ascii?Q?Wo5GPDkUBpQTn4EFi5P9IOxoKKlgZVfUoURyRYXku3xuE5Sh5DOSZYYvJGLH?=
 =?us-ascii?Q?q5+qdvCjdmNcX2+qW4KICfnjnLZ+5z8Qpn0aWepnN3s0euWeNjfk+ucG//ah?=
 =?us-ascii?Q?oqeYHPuAdk8O8CxG56S6haowaW9ryopArl8l3fIMtL/VUPcSIMM7c2R/5E1W?=
 =?us-ascii?Q?12wka5Kr9P89ebUZ3gCQumy+SrLD8tGFizI25FwYgLr4YpJf+hqIZZGyrgCa?=
 =?us-ascii?Q?8Q70pNul+HYwxmHztNhN9z2m2PQMviTIffJ7LRtd0DmcAX6IVhTnhkjn6AlN?=
 =?us-ascii?Q?AFMFeGwTEnB+dOFgZyPvACaWtAVU7UWLnKALhw2XRCO9wfN+KCrcTqdWCEkB?=
 =?us-ascii?Q?++KSMS0WEaKYPf/oWCvwMJYzGDQ2nVib8IKYPJx4A7XAKQVgXrh0Xm3zWqkC?=
 =?us-ascii?Q?TAmbfTqUEBO87CjtRvYAvRfCZwfM9Wh8yKJoGLRvpQKDVB5yJI+FZn+jlMyT?=
 =?us-ascii?Q?xqdr9NNWzD9KR0FTMi64N6bmag/4gLSbqY6+x37wQBf8lASoPgSbz/3qx9g2?=
 =?us-ascii?Q?+qKHSNYQokE+uhAEcmVLR0e+NDsaM4KCr0Pg+BmUNJgLtk6DftF+TC5PIgwo?=
 =?us-ascii?Q?WCgmDcMZX96CmZuHHwnzJoWR297WWITGI93M?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 19:45:58.5650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b399840d-a077-4d7c-15a1-08ddadd79505
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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

Add new ioctl DRM_IOCTL_AMDGPU_CRIU_BO_INFO.

This ioctl returns a list of bos with their handles, sizes,
and flags and domains.

This ioctl is meant to be used during CRIU checkpoint and
provide information needed to reconstruct the bos
in CRIU restore.

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 144 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  32 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   2 +
 include/uapi/drm/amdgpu_drm.h            |  28 +++++
 6 files changed, 209 insertions(+), 1 deletion(-)
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
index 000000000000..34a0358946b6
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
@@ -0,0 +1,144 @@
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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
new file mode 100644
index 000000000000..1b18ffee6587
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
@@ -0,0 +1,32 @@
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
+
+#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4db92e0a60da..bf33567bb166 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -53,6 +53,7 @@
 #include "amdgpu_xgmi.h"
 #include "amdgpu_userq.h"
 #include "amdgpu_userq_fence.h"
+#include "amdgpu_criu.h"
 #include "../amdxcp/amdgpu_xcp_drv.h"
 
 /*
@@ -3021,6 +3022,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgpu_criu_bo_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver amdgpu_kms_driver = {
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
index 45c4fa13499c..1508c55ff92a 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -57,6 +57,7 @@ extern "C" {
 #define DRM_AMDGPU_USERQ		0x16
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
+#define DRM_AMDGPU_CRIU_BO_INFO	0x19
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -77,6 +78,7 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
+#define DRM_IOCTL_AMDGPU_CRIU_BO_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_BO_INFO, struct drm_amdgpu_criu_bo_info_args)
 
 /**
  * DOC: memory domains
@@ -1626,6 +1628,32 @@ struct drm_color_ctm_3x4 {
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
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

