Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32E0B0A68F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 16:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3738610E9D2;
	Fri, 18 Jul 2025 14:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mDy5tL3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C4910E9D2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 14:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nM+W0x5H5Docd5mOdCmeEu/RtpzoflHhZSIZ+rVM0Vb0ZogthR3XJbawebnPsUOsd7JhIk3ilkePSOZhSjSi9CmE412cIrUC8c6PGLq6UobGk7P1RL0s+0OXxrBm6wrAPIkn8J280ZphoQojbBJE2HGj94Y9vDxRqxEOHzh9WiIpxywtjtlVkg5nZnV8rXLFDTqe7RxFhO8in1voKbs3ICyvP8JSeG2e5gze6obytYnWgoDibo9n/MnL0s2l080MeLOwK4fpKPtceMX84m67DLPSENVawpmYLzJmtjYimNyKX/65C1XRVQQgrmY0sn7ovJgbBW4PrU4kHeAax3oU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt4nFfA/EBjBH3pNuKzdUMI0OgBnZ/yCJ56ozMeUvb0=;
 b=k62UeQJQ8pyXPS70XVCY3bd1jDefJHKodjZMNZfjvDIJ0YbYerewlpXOE/I81x6q6LL7ppU64NXwSJslWDXxZZ2ksz5PQwCl5UmifWIyBiYWkMs8oljAvbWgz6OMGYAWmUEmFaAV2Gkf3/HgDXTotcZhnd5WHqnwItysB0d3jz4tzSEpl9/Hk7vOeHNRi6DCTy9TeaWwaQuUintLXgU+D1M5cSI7r9Fg01LK2J87gYPcC2LgihezHN20Lij5lQTd3iPBRofIqO8ntGLWgWzGp4Ms8jzYJlHEYRX2OoKQI7ywIdVK4zrhDgU2s0QwaI6W5+NB7ntuLb832Tkd839P1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt4nFfA/EBjBH3pNuKzdUMI0OgBnZ/yCJ56ozMeUvb0=;
 b=mDy5tL3plhKJmCDzhbkZrHCojyRUbBv8ZvDtnyEqXMB2egzDmgBf6f3V6sGZWSee/NZTs+po0+5VX1QCUmSeCL1Y39NXbv8RUPBsujel8jOgcADcxG6dz8lNZPlVSoa+id9rCIIZ47gG8iR51rUeL33Hq3rzIBXXO1mBd9yMcEE=
Received: from CH0PR13CA0019.namprd13.prod.outlook.com (2603:10b6:610:b1::24)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 14:48:39 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::a5) by CH0PR13CA0019.outlook.office365.com
 (2603:10b6:610:b1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.15 via Frontend Transport; Fri,
 18 Jul 2025 14:48:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 14:48:39 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 09:48:38 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH v8 1/3] drm/amdgpu: Add CRIU ioctl to get bo info
Date: Fri, 18 Jul 2025 10:48:21 -0400
Message-ID: <20250718144823.1157760-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718144823.1157760-1-David.Francis@amd.com>
References: <20250718144823.1157760-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: a4244b70-0038-4118-fb3e-08ddc60a2eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TIE2v7uZigFbaI3aQ6K+ERSacIwSSyxzSFw1LOVTMq1eg5vLW9xopS6okwGl?=
 =?us-ascii?Q?fHLyGJn4qa2aeLakdKoxH9dlGkOAyyYj+R2D2P5c3qt2lkc65q5jG+M6ZRN/?=
 =?us-ascii?Q?zpl6xh3Lf3dxEAtMF5hnQLzNwOXv+ITXvdEtzJ0T4pfOiNmC1y3K8dKSnKCH?=
 =?us-ascii?Q?6M4digKqh1ikRfquOKX77LGVzKRKANGlC4zMaGXk0Tnh2fWFg+PYhO+QWtez?=
 =?us-ascii?Q?u3EcBMLNPVRkRKuacWbY87hDdP/fz8LjOpmYvolCfZ3fXDPfa0/xh7mhZy5N?=
 =?us-ascii?Q?g2H6WPIN1QklbeXx1nYHXMjSPMEY+827A0NKkLpNAszg0ZXxy65qKB65qP0w?=
 =?us-ascii?Q?qEz+YIjX3LCdmmEzhdV0krSVQjyasf/q4LmIXCRN/5Lnh5FcT2wt0nak07w1?=
 =?us-ascii?Q?anJa8fZqRXi5zdNGw5ZO6z+8Pej9hgrp0fT7ahI5O9mEmzsL1ursCxVwI3y1?=
 =?us-ascii?Q?v5r+fSEqZHoD9A2UP2Pw2WwRJ4hrhPf4Dqw6xP7yecCwnIyq+8jnihMPHrLQ?=
 =?us-ascii?Q?52Gb65jbilhAK4mgRMs2zZVhxcvPUgQB5746sZRue3wbLbrsFgxicuVvvQAV?=
 =?us-ascii?Q?OD319iVt7l4GIDlo6tSVfV4svBa9A+cgFKuOmBGqtPjwjecoRMDsAWjnHtF7?=
 =?us-ascii?Q?qNwS3Kh6yOD7a6iMK4nbM78G/rhSNwbvp1zUoZm4mWJe4CVGkChfPi3/mZmH?=
 =?us-ascii?Q?EDkIQp1wWFiqSpydTwr9eYTKCog9+XeDNHzuHWnQKEDp2tJa1/9NdFNVviC5?=
 =?us-ascii?Q?qAgriwJVYpmNCUqquU7q6DNeSnciWjbBXPgVYyvbahQcvNpfGgJSeqohbAoA?=
 =?us-ascii?Q?CYjsORbIdji82lXEUHFg/B5zQHKkdahOU0PEHVvBYhnxwenlPuKlvxaK/fmF?=
 =?us-ascii?Q?yfA314nnDXAwF2pRGd2JjrvQc6PJmmHeHTGxmytJvcvJuDeFBwevc5PHu19V?=
 =?us-ascii?Q?DzBqnDx8wzmXOd+gfrDxzoJjFUnHlUt9LllKy957Wu4bUdqQKvly5GV9lZmy?=
 =?us-ascii?Q?Gt/q5ymApYULSWqhrevpt9CkhS+YJVtg8e2L+d8vpYM6+oqV0Q2jq4rd1kvR?=
 =?us-ascii?Q?iWVlYRr51Eo5StqMjjXFCVZiUFKQws+iUiMC8hotIbckp8xmhaTq5wBnGRjr?=
 =?us-ascii?Q?Rz0HFyFW7axbdh2wT8nXlTUXjTxLNRPhm9L+DD0b2I39u09v8T+ed+Zkzd7/?=
 =?us-ascii?Q?BDX+ppRy6YjgZ/b5dFa9thFzSWaTe9y6kxrC+pbyfEMPdEOFP0+K1RZfp8gq?=
 =?us-ascii?Q?71phIuCba0pHu5RyUmCk8YpDnystdSLdR2VNE+Ty3mdd/NUBbs9eIdOUlwsl?=
 =?us-ascii?Q?IR8j2sUm1usWWIZrLu2lFyUrsOSwGvFY8IQm/Oa7mHi1SJftOY5mw1AJkw99?=
 =?us-ascii?Q?77TReno8Ort3OgFt8A/JGDfjUqZ+b/nCONhDGobD94hjFywbUD8WhY2n7E+y?=
 =?us-ascii?Q?oPOZHwu+xjEcrJaira+UcIj46XE03E+OFFMIOur7U/YoSXYFCH9m0McvRYpv?=
 =?us-ascii?Q?Uq0gEs8C8fyq1Wc6QTCQ3sXKkdmfA9xxJ4Yv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 14:48:39.5181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4244b70-0038-4118-fb3e-08ddc60a2eec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 101 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  30 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +
 include/uapi/drm/amdgpu_drm.h            |  28 +++++++
 5 files changed, 162 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 930de203d533..b545893cb1a8 100644
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
 	amdgpu_cper.o amdgpu_userq_fence.o amdgpu_eviction_fence.o amdgpu_ip.o
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
new file mode 100644
index 000000000000..8bfcb2234166
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
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
+ */
+
+#include <drm/amdgpu_drm.h>
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+
+#include "amdgpu_criu.h"
+#include "amdgpu.h"
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
+			      struct drm_file *filp)
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
+		return 0;
+	}
+	args->num_bos = num_bos;
+	if (num_bos == 0)
+		return 0;
+
+	bo_buckets = kvcalloc(num_bos, sizeof(*bo_buckets), GFP_KERNEL);
+	if (!bo_buckets)
+		return -ENOMEM;
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
+	kvfree(bo_buckets);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
new file mode 100644
index 000000000000..c991d08262c1
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
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
+ */
+
+#ifndef __AMDGPU_CRIU_H__
+#define __AMDGPU_CRIU_H__
+
+int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *filp);
+
+#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 3bb9b25cd121..28a057db4718 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -53,6 +53,7 @@
 #include "amdgpu_xgmi.h"
 #include "amdgpu_userq.h"
 #include "amdgpu_userq_fence.h"
+#include "amdgpu_criu.h"
 #include "../amdxcp/amdgpu_xcp_drv.h"
 
 /*
@@ -3027,6 +3028,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgpu_criu_bo_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver amdgpu_kms_driver = {
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index bdedbaccf776..6a69db9f8648 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -57,6 +57,7 @@ extern "C" {
 #define DRM_AMDGPU_USERQ		0x16
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
+#define DRM_AMDGPU_CRIU_BO_INFO		0x19
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -77,6 +78,7 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
+#define DRM_IOCTL_AMDGPU_CRIU_BO_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_BO_INFO, struct drm_amdgpu_criu_bo_info_args)
 
 /**
  * DOC: memory domains
@@ -1628,6 +1630,32 @@ struct drm_color_ctm_3x4 {
 	__u64 matrix[12];
 };
 
+#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT	(1 << 0)
+
+struct drm_amdgpu_criu_bo_info_args {
+	/* IN: Size of bo_buckets buffer. OUT: Number of bos in process (if larger than size of buffer, must retry) */
+	__u32   num_bos;
+
+	/* User pointer to array of drm_amdgpu_criu_bo_bucket */
+	__u64   bo_buckets;
+};
+
+struct drm_amdgpu_criu_bo_bucket {
+	/* Size of bo */
+	__u64 size;
+
+	/* GEM_CREATE flags for re-creation of buffer */
+	__u64 alloc_flags;
+
+	/* Pending how to handle this; provides information needed to remake the buffer on restore */
+	__u32 preferred_domains;
+
+	/* Currently just one flag: IS_IMPORT */
+	__u32 flags;
+
+	__u32 gem_handle;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

