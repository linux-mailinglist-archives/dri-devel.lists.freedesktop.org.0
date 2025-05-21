Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EDCABF72D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 16:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BF210E8DE;
	Wed, 21 May 2025 14:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IONI9k3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28D910E855
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 14:07:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zW9zLuXuHQRYz/asRJ9DlvdnxmhLRtusjeYQ9q9Whvl5oeIFpmlqQbEcfF0NERDyNvH6mbQY41RZouJJ1S/TRTBYC7FxIw3UHCOQYiKSI5twTU7HEQTGeqhzO7xXNtJC+O5L2eVyyWjQ9Tg16kiFJN2+JGlF/k2hviqPhY6BIF0Wvk7kiXVx+uOvVjy21j1wuDlkBncvjysodlV6tovYRznPlSLefzGRWLmZF9oNIEYioHN05XSTv6UAQbM6bi/NR1vTmnkqjT/v9pui7zSWMzpDCa/KOI01pZiJaPsP2OwVTnO5PndczSzFI+A8p1ltAU3vStGw6bbVpaELKZ9bIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcsBijFpofWiESuionmewEPTcw97VFXbcsv9cnrdqek=;
 b=Zq2Q3UEPdb+ogG/Q3hyyxcN5DhbpWU//8bVYEyLwgrpIvqmX1YOJic/eNmPcpHhswCRgLhrM4TQWc/w85f3pF6k69SbfcN+6kd8hNSE0qcqMqrA77n7DmMzdny8O5zbiLJrpF55AD6YEvS9TODMUjNejOTH20oD78bK8Ehwp9o8nuj06b/nsrwbW7XIuOkvvzwl5Y/ldclB8LWjWEOERW3IcoZDJftprmp0PplAEInmhbfzu0FNsasaLLb6dG9Rpjoc27umr9X4Sbml4vKvIpP4Zg3H6vBilHCE/mTmWaD5MFhT9LiN5X0CLoy28FQQFNqxqlGJnGAwq1VsaGfBUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcsBijFpofWiESuionmewEPTcw97VFXbcsv9cnrdqek=;
 b=IONI9k3O74nUT4K2p+jlmMFaBAS1DYI+LI21a6yx3si3Igu1UJ6Toe8KCBb0+I2Ct88TE13yeGauJlc08ftKB3G3sXuc84QKUHCa/T9d1etv1B9FeNbBBlYeZ71hewusw81rA+oVcU8Fe4y0oFBjS27mn7RxKt+PgwYJjwRk48M=
Received: from BL1PR13CA0242.namprd13.prod.outlook.com (2603:10b6:208:2ba::7)
 by CY3PR12MB9677.namprd12.prod.outlook.com (2603:10b6:930:101::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.35; Wed, 21 May
 2025 14:07:11 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::70) by BL1PR13CA0242.outlook.office365.com
 (2603:10b6:208:2ba::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Wed,
 21 May 2025 14:07:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 14:07:10 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 09:07:09 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
Date: Wed, 21 May 2025 10:06:48 -0400
Message-ID: <20250521140649.4058526-3-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521140649.4058526-1-David.Francis@amd.com>
References: <20250521140649.4058526-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|CY3PR12MB9677:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a5741a-36c4-4df4-84d0-08dd9870c7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rMK9qQUB6TB3teuhfIthxaEMb1ZBUeZZLX16LHjkZX63NXlg/UYOZyhtTcv4?=
 =?us-ascii?Q?B05GqGi0YhsRXqkm7z62U8G1Qy/3/0a4NYLDZ06f5DCTixucSdxHvlAiWooN?=
 =?us-ascii?Q?HN5edcFGhU78UjdFXCAcdrTcrxXQXCqjW1S3OgRO+UMF8GJ61Ro3R+NkQI/X?=
 =?us-ascii?Q?L3IzrH+DypPQSLp7/9acElPtiZzVqu5/qeEfeOrcpJWGUiWNqRyks1Gw+4eW?=
 =?us-ascii?Q?5jj0sHFD+aQRE9fzIzdFINSB2vpXBTz+JlJJYNVWHV/J+EchRcPY9TC/LTD6?=
 =?us-ascii?Q?nWk8nh/QN+Eh4rJWRxyiiBcFl5pGLX0DYyiU9wh2AyeInow9zkGP6l2IwQC8?=
 =?us-ascii?Q?PW8tzlUb/wyjBkjQw19iveZxLFWj/0HYfVLoSaf3i9FktNPebY4rvi6+r7SN?=
 =?us-ascii?Q?Azvtb0xjP9rPP936N3zRYzcyN8A+IJ7opmG/WHDev2pNDFW0Ogsjf7VvoGFB?=
 =?us-ascii?Q?OWO6aSTrncTMmf33bIwEQ9I2BxkkwUBzBEjZQQwg0sAzHNrkXsRGje59ZIAC?=
 =?us-ascii?Q?Vq+XpBh/NnGIbiS22z8+VNpWLdJBD8Oi4APZLrtBHLh2SUlGfZ6u9Wt9JBnT?=
 =?us-ascii?Q?iteVz9NuVVn/wczyIi4PyCFWW+L9/9/hObITrdOmRUNyKRWrjRNWt1d6iSuz?=
 =?us-ascii?Q?yjO37LXOlu6nuh+Tyb4c+8k7Ddccnr4FLEa7KUiBgly0R0eglXJD6i0H6vJG?=
 =?us-ascii?Q?2ujdN36Ae+gVcfeV9fuwN9vmOP+NjsdZtoYZERyS+vBfNvS6eTEkRELnJuw1?=
 =?us-ascii?Q?i16ucR0xwIIUvjlKE2ksKBrFiS4A7NaedFsXhjjdnclt6HP3v4V0QL0mPnEO?=
 =?us-ascii?Q?K6Bl2GvaPfPYMXB1IRc4rczGKSRyxnBg+RySucoWrvDU9vtf5Dh0KbGsKN+u?=
 =?us-ascii?Q?qCF/8TsKsixWogx10Ckxz+bGI2V++7mUfIdaB/4DvtqASyQ7yR+HA1ftd1B2?=
 =?us-ascii?Q?iQtUcjrxbrPEEBYP5zq2MgViFlnVORM+CLmqcH6+GCFvAkZ9xe5pldGvK6Pb?=
 =?us-ascii?Q?XuMAiUz6mQcAGlKB4F8Xguv4mFPh+uxHaywNQ+dEdXCThhw4ldXT7WorKupi?=
 =?us-ascii?Q?yBJjGTowtssHOxcFaab3kuNr9joe5hb3QV3zRSgP5A7OA7NiEuV7/rl/c1qV?=
 =?us-ascii?Q?Ue3Q2KAkZarZHAvb1ZWl0+K8dFW53y9e2MgC/kTs6bZ6l1WlLwJJWHnHCpvd?=
 =?us-ascii?Q?RRwdQpEvjFwk38BCz94Hu/lMtf2aIMLXA4uv0sOrNE5vQNytEny8xbHDHl5R?=
 =?us-ascii?Q?wD4oBnELa6bWvMGNwgNFEeI2dumZAvdP2uPv5cve9rbnerk3qIySC9NIQPcr?=
 =?us-ascii?Q?z7up7kWMkXHilW+anTx7W5BENzscQ2ROuwxL9PSTg0bP0gjI3gz7mmLgmwW9?=
 =?us-ascii?Q?YWqsqnpfllBEnPLIhbLF4u6TJ+7sG+GF9gZVQ26O8y7I7UrpKEgDKk0Hskkw?=
 =?us-ascii?Q?Quoe4OACZyQpflyOVq5FxQtjjgaBeaF61ud6ODoshCHR+mkkL94PcEXRjw3K?=
 =?us-ascii?Q?597mahg6APyHOAGXFQwNr6T13t+CW54WyPZ7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:07:10.9675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a5741a-36c4-4df4-84d0-08dd9870c7ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9677
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 247 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  35 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   2 +
 include/uapi/drm/amdgpu_drm.h            |  45 +++++
 6 files changed, 332 insertions(+), 1 deletion(-)
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
index 000000000000..dbd2d5049eb6
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
@@ -0,0 +1,247 @@
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
+
+#include "amdgpu.h"
+#include "amdgpu_display.h"
+#include "amdgpu_dma_buf.h"
+#include "amdgpu_hmm.h"
+#include "amdgpu_xgmi.h"
+
+static bool is_import(struct amdgpu_bo *bo)
+{
+	if (bo->tbo.base.import_attach)
+		return &bo->tbo.base != (struct drm_gem_object *)bo->tbo.base.import_attach->dmabuf->priv;
+	return false;
+}
+
+static int amdgpu_criu_process_info(struct drm_device *dev, struct drm_file *data,
+			    struct drm_amdgpu_criu_args *args)
+{
+	struct drm_gem_object *gobj;
+	int id;
+	int num_bos = 0;
+	int num_vm_mappings = 0;
+	struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)data->driver_priv)->vm;
+
+	spin_lock(&data->table_lock);
+	idr_for_each_entry(&data->object_idr, gobj, id) {
+		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
+		struct amdgpu_vm_bo_base *vm_bo_base;
+
+		num_bos += 1;
+
+		vm_bo_base = bo->vm_bo;
+
+		while (vm_bo_base) {
+			struct amdgpu_bo_va *bo_va = container_of(vm_bo_base, struct amdgpu_bo_va, base);
+			struct amdgpu_bo_va_mapping *mapping;
+
+			if (vm_bo_base->vm == avm) {
+
+				list_for_each_entry(mapping, &bo_va->invalids, list) {
+					num_vm_mappings += 1;
+				}
+				list_for_each_entry(mapping, &bo_va->valids, list) {
+					num_vm_mappings += 1;
+				}
+			}
+
+			vm_bo_base = vm_bo_base->next;
+		}
+	}
+	spin_unlock(&data->table_lock);
+
+	args->num_bos = num_bos;
+	args->num_vms = num_vm_mappings;
+	args->pid = avm->task_info->pid;
+
+	return 0;
+}
+
+static uint32_t hardware_flags_to_uapi_flags(struct amdgpu_device *adev, uint64_t pte_flags)
+{
+	uint32_t gem_flags = 0;
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
+static int amdgpu_criu_checkpoint(struct drm_device *dev, struct drm_file *data,
+			    struct drm_amdgpu_criu_args *args)
+{
+
+	struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)data->driver_priv)->vm;
+	struct drm_amdgpu_criu_bo_bucket *bo_buckets;
+	struct drm_amdgpu_criu_vm_bucket *vm_buckets;
+	struct drm_gem_object *gobj;
+	int vm_priv_index = 0;
+	int bo_index = 0;
+	int num_bos = 0;
+	int fd, id, ret;
+
+	spin_lock(&data->table_lock);
+	idr_for_each_entry(&data->object_idr, gobj, id)
+		num_bos += 1;
+	spin_unlock(&data->table_lock);
+
+	if (args->num_bos != num_bos) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
+	if (!bo_buckets) {
+		ret = -ENOMEM;
+		goto free_buckets;
+	}
+
+	vm_buckets = kvzalloc(args->num_vms * sizeof(*vm_buckets), GFP_KERNEL);
+	if (!vm_buckets) {
+		ret = -ENOMEM;
+		goto free_vms;
+	}
+
+	idr_for_each_entry(&data->object_idr, gobj, id) {
+		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
+		struct drm_amdgpu_criu_bo_bucket *bo_bucket;
+		struct amdgpu_vm_bo_base *vm_bo_base;
+
+		bo_bucket = &bo_buckets[bo_index];
+
+		bo_bucket->size = amdgpu_bo_size(bo);
+		bo_bucket->offset = amdgpu_bo_mmap_offset(bo);
+		bo_bucket->alloc_flags = bo->flags & (!AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
+		bo_bucket->preferred_domains = bo->preferred_domains;
+
+		if (is_import(bo))
+			bo_bucket->flags |= AMDGPU_CRIU_BO_FLAG_IS_IMPORT;
+
+		drm_gem_prime_handle_to_fd(dev, data, id, 0, &fd);
+		if (fd)
+			bo_bucket->dmabuf_fd = fd;
+
+		vm_bo_base = bo->vm_bo;
+
+		while (vm_bo_base) {
+			struct amdgpu_bo_va *bo_va = container_of(vm_bo_base, struct amdgpu_bo_va, base);
+			struct amdgpu_bo_va_mapping *mapping;
+
+			if (vm_bo_base->vm == avm) {
+				list_for_each_entry(mapping, &bo_va->invalids, list) {
+					vm_buckets[vm_priv_index].start = mapping->start;
+					vm_buckets[vm_priv_index].last = mapping->last;
+					vm_buckets[vm_priv_index].offset = mapping->offset;
+					vm_buckets[vm_priv_index].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
+					vm_buckets[vm_priv_index].gem_handle = id;
+					vm_priv_index += 1;
+
+					bo_bucket->addr = mapping->start * AMDGPU_GPU_PAGE_SIZE;
+				}
+				list_for_each_entry(mapping, &bo_va->valids, list) {
+					vm_buckets[vm_priv_index].start = mapping->start;
+					vm_buckets[vm_priv_index].last = mapping->last;
+					vm_buckets[vm_priv_index].offset = mapping->offset;
+					vm_buckets[vm_priv_index].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
+					vm_buckets[vm_priv_index].gem_handle = id;
+					vm_priv_index += 1;
+
+					bo_bucket->addr = mapping->start * AMDGPU_GPU_PAGE_SIZE;
+				}
+			}
+
+			vm_bo_base = vm_bo_base->next;
+		}
+
+		bo_index += 1;
+	}
+
+	ret = copy_to_user((void __user *)args->bos, bo_buckets, num_bos * sizeof(*bo_buckets));
+	if (ret) {
+		pr_debug("Failed to copy BO information to user\n");
+		ret = -EFAULT;
+		goto free_vms;
+	}
+
+	ret = copy_to_user((void __user *)args->vms, vm_buckets, args->num_vms * sizeof(*vm_buckets));
+	if (ret) {
+		pr_debug("Failed to copy BO information to user\n");
+		ret = -EFAULT;
+		goto free_vms;
+	}
+
+free_vms:
+	kvfree(vm_buckets);
+free_buckets:
+	kvfree(bo_buckets);
+exit:
+
+	return ret;
+}
+
+int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *filp)
+{
+	struct drm_amdgpu_criu_args *args = data;
+	int ret;
+
+	switch (args->op) {
+	case AMDGPU_CRIU_OP_PROCESS_INFO:
+		ret = amdgpu_criu_process_info(dev, filp, args);
+		break;
+	case AMDGPU_CRIU_OP_CHECKPOINT:
+		ret = amdgpu_criu_checkpoint(dev, filp, args);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
new file mode 100644
index 000000000000..01677072f0ed
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
@@ -0,0 +1,35 @@
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
+int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *filp);
+
+struct amdgpu_bo *bo_from_criu_global_handle(uint8_t *handle);
+int insert_bo_at_criu_global_handle(struct amdgpu_bo *bo, uint8_t *handle);
+
+#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4db92e0a60da..1b8154395615 100644
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
+	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_OP, amdgpu_criu_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
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
index 45c4fa13499c..f7c3b160f396 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -57,6 +57,7 @@ extern "C" {
 #define DRM_AMDGPU_USERQ		0x16
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
+#define DRM_AMDGPU_CRIU_OP		0x19
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -77,6 +78,7 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
+#define DRM_IOCTL_AMDGPU_CRIU_OP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_OP, struct drm_amdgpu_criu_args)
 
 /**
  * DOC: memory domains
@@ -1626,6 +1628,49 @@ struct drm_color_ctm_3x4 {
 	__u64 matrix[12];
 };
 
+/* CRIU ioctl
+ *
+ * When checkpointing a process, the CRIU amdgpu plugin will perform:
+ * 1. INFO op to get information about state that needs to be saved. This
+ *    pauses execution until the checkpoint is done.
+ * 2. CHECKPOINT op to save state
+ *
+ * Restore uses other ioctls.
+ */
+enum drm_amdgpu_criu_op {
+	AMDGPU_CRIU_OP_PROCESS_INFO,
+	AMDGPU_CRIU_OP_CHECKPOINT,
+};
+
+struct drm_amdgpu_criu_args {
+	__u64 bos; /* user pointer to bos array */
+	__u64 vms; /* user pointer to private data */
+	__u32 num_bos;
+	__u32 num_vms;
+	__u32 pid;
+	__u32 op;
+};
+
+#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT	(1 << 0)
+
+struct drm_amdgpu_criu_bo_bucket {
+	__u64 addr;
+	__u64 size;
+	__u64 offset;
+	__u64 alloc_flags;
+	__u32 preferred_domains;
+	__u32 dmabuf_fd;
+	__u32 flags;
+};
+
+struct drm_amdgpu_criu_vm_bucket {
+	__u64 start;
+	__u64 last;
+	__u64 offset;
+	__u64 flags;
+	__u32 gem_handle;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

