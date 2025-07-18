Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F94B0A691
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 16:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8178A10E9D6;
	Fri, 18 Jul 2025 14:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E4hxUTSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF14110E9D2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 14:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmBYdz5tK/pr1hLuYcsNjlxp5+Co9aem4tqEDx0e5E0e6jlmGkif53/qYL2aSwGdvvJ4UFR0vlHWGInRsMImOmhld7g6SdC++K1vZC1nEmZmzVAVZPMuBygg512kqT2eCjnT/xL/D5xiJBWd28R25yVQNltsl7zzqgvi3HMvRWlUYfY3fHlwKX6dQhMBIB+XZCppWIOSnIvyb/R9xEraskB+N5ZIwn47+wdsBz8/LbYbsONagI0z0M46gMPVlg8RZioEiibS6GwMqd8qWVduJEdcYS0dGgCvlqEW6nUy+n4w0dJzfznKesVdi5DGZguuHDMKHoFTPzIdScyymGaDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICOJlNx5sbNtRPR+H5XZDJGlzWLnZegywcpkNr5ezCw=;
 b=qIJNliZTU1sCznuMbARA2wDGyNdXuMzIViub9cPFvxLLCqEu5fVZLEUyev2SHgFgU6u0OdTg5EUf3qaYIqmnbF9iHVJaa7lRsVZ6/KqOZENxIoJsavvx/7rVEHcP5SYW1UU5k+Tkk4ABUO6LZOmtJuUEEQFo153seAx1yt4dVOAAoEECX8YhcV2r122g9EjsYsrKVOSG+LBB7zr999ARF2B5JRajwxt04x0cBrIoHFQeFDe/rjShy5rior9tFmMVuUOc3owV/XzflWNegbUOLnAmk8ACRMCzhjdMUqoUTbBYjkaY1WeWvjbX6W9NhpBtILDW8fyMbmWK2ty9JMJL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICOJlNx5sbNtRPR+H5XZDJGlzWLnZegywcpkNr5ezCw=;
 b=E4hxUTSmZ6fk4uk+f0FxXPmTKxI8TGNs+3yMtIDE0eyRcVaahqm6eyOCq7R4r7XUw0GByshicpwQNC+1Pyx0Es23hxatoScsU1i89lkU7+N/4OfuxuaWKFOcGO0js/ak5YTkbpX6MA46rO0vSXgjUPHh8DhKtvq2lyXq35Nfi8k=
Received: from CH0PR13CA0006.namprd13.prod.outlook.com (2603:10b6:610:b1::11)
 by LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.40; Fri, 18 Jul
 2025 14:48:41 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::58) by CH0PR13CA0006.outlook.office365.com
 (2603:10b6:610:b1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Fri,
 18 Jul 2025 14:48:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 14:48:40 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 09:48:39 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH v8 2/3] drm/amdgpu: Add CRIU mapping info ioctl
Date: Fri, 18 Jul 2025 10:48:22 -0400
Message-ID: <20250718144823.1157760-3-David.Francis@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 314a5c71-4ac4-436c-09d8-08ddc60a2fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VcTcSmMQgKaJ7M6XL2f6X4hGPtcPxk+IHbsHDW5Xnacxwx96sCWqXJnlL0gt?=
 =?us-ascii?Q?c0B9UyaWpO7usNUZutL5P8KeJRrkhngDzgRX7X0ARN6ZhDb0iK8OTEBAP7BK?=
 =?us-ascii?Q?oiKlHaOm8jcFVO9JGEAlnt8U6HuNjMfwHnWQSApJcCTQkCOlKo/Tr9XpCNkS?=
 =?us-ascii?Q?PRHamVPMXMJrVxOzXhvJc/NwiKq8g8k96kZqN+eGnXLkZl+Iz6qsHJ16GvTo?=
 =?us-ascii?Q?xQiQNvhte2nrCDaQ2qoj91OXfVKxMM8I/FrKJISBBT+6qGY4br/Cf6Q/zK1g?=
 =?us-ascii?Q?WRYetj0DEyjdNJ8/rAnyCbPbCpqxMSzYnh6+DXP6DUyQFPfjZ2lu5lqrg1Id?=
 =?us-ascii?Q?m35VQTXWJth6z33f73BUoX42Ex824zzQzpH11tTcetX68IzQmwpdJEIYBRku?=
 =?us-ascii?Q?Jkp3mVe9XIr1FUjBr4827GBvsI66tqHEBXTX+MeBn5v33ToMiXEuFhpMR//h?=
 =?us-ascii?Q?y04O7/NpBQtkyC3WV5btIDKXDoGBiXoBxxt+Na7Ha3IzAaBKVj1E/ms4KurP?=
 =?us-ascii?Q?AUB9CC1JNxYEf1krg3V8zmncah4FbCreG1PZxPKxAfjLfkOhwoRIW/xFvANl?=
 =?us-ascii?Q?oSoKZgMjRDjTxjXSV2xYHvDlPCDocUubWMZshwmwzI0/AE3vZCDQVcSPGk2m?=
 =?us-ascii?Q?QRMEMRd6HhsZt5rqdy7GiiA5cUJyVyF6PV93ewAU0yxOw+2DxsvkYSJ6Sw3D?=
 =?us-ascii?Q?ceW96zt/VT02kkJHmjso42foJhvdxnKEr9QI9XSS5qjH9FBisG4u2IG5wj1/?=
 =?us-ascii?Q?+VHO8QK6PR9s0v3SdxeLw44TBclkmAF/F9ywkEA4Aff9s2PxrkahkpImyoA4?=
 =?us-ascii?Q?SPsG5Kbqm+G73IE9gmxNMvuxzdJGGq8KlqFxxhFc5Kwg+xoZ/jJ+r5XiBd/r?=
 =?us-ascii?Q?N6QEG0fbw6J/wMroSlFcqHBMX2V6ODmfqUPvHTs+KuciVhXq4qgqZrwMrof5?=
 =?us-ascii?Q?6EiOPKLv8rvKvUsiECKZPniDqfuCki60RpWSJ0/FNGbFus20jXB1ohWZjCOH?=
 =?us-ascii?Q?hW8tYedS6qpZOfdz7NHt1bkqRfaOFtkmHh0rMuvI5qJCVwoD/7geR1kCrWX9?=
 =?us-ascii?Q?rDubakjfNswIi6MHnOuL0g2deE3hTDCkHPoEfzdYeLzPkULZVaydT5fEn+M8?=
 =?us-ascii?Q?9fcKlOZiHwIU71XDKzApnkDHf+jXQuxSLBgrtIgReH6IHH4d+QZLGGQkAoIO?=
 =?us-ascii?Q?kSEkpVnPtOxDVUkPmkSXy6R6D18LTzhJ8LLDTah20ZQb7BF1TmtzFKR5y8Sw?=
 =?us-ascii?Q?9vvDuNvhqnAAKXbYj43sEov9VRUML4KviHLDrupAj2pUWaVJ+CAdXnj2S+yw?=
 =?us-ascii?Q?3shwjt7+35CTxgbwOyM+B38sLOrNTkVVVW+4awYT2SdXePTxNbnhyq1MRebS?=
 =?us-ascii?Q?l19ybZets7B2FXeu+7IkoeQwJV3IN1QLDhtxj2a/joWAoYJ1xPDfOBg3LZng?=
 =?us-ascii?Q?BrDSjIkHIfl9GIdok9u4mNcYrPP+C7sih8onwCFmNcBxC+45jJvw991MAGJV?=
 =?us-ascii?Q?PO+b2xKDLY3Irim7B74ewrRYkf6tttS/fIKb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 14:48:40.8488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 314a5c71-4ac4-436c-09d8-08ddc60a2fb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
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

Add new ioctl DRM_IOCTL_AMDGPU_CRIU_MAPPING_INFO, which
returns a list of mappings associated with a given bo, along with
their positions and offsets.

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 97 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h   |  5 ++
 include/uapi/drm/amdgpu_drm.h            | 27 +++++++
 5 files changed, 133 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
index 8bfcb2234166..176ea7c0ee3f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
@@ -24,6 +24,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_exec.h>
 
 #include "amdgpu_criu.h"
 #include "amdgpu.h"
@@ -99,3 +100,99 @@ int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
 
 	return ret;
 }
+
+/**
+ * amdgpu_criu_mapping_info_ioctl - get information about a buffer's mappings
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
+				   struct drm_file *filp)
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
+	int num_mappings = 0;
+	int ret;
+
+	vm_buckets = kvcalloc(args->num_mappings, sizeof(*vm_buckets), GFP_KERNEL);
+	if (!vm_buckets) {
+		ret = -ENOMEM;
+		goto free_vms;
+	}
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
+			  DRM_EXEC_IGNORE_DUPLICATES, 0);
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
+	amdgpu_vm_bo_va_for_each_valid_mapping(bo_va, mapping) {
+		if (num_mappings < args->num_mappings) {
+			vm_buckets[num_mappings].start = mapping->start;
+			vm_buckets[num_mappings].last = mapping->last;
+			vm_buckets[num_mappings].offset = mapping->offset;
+			vm_buckets[num_mappings].flags = mapping->flags;
+		}
+		num_mappings += 1;
+	}
+
+	amdgpu_vm_bo_va_for_each_invalid_mapping(bo_va, mapping) {
+		if (num_mappings < args->num_mappings) {
+			vm_buckets[num_mappings].start = mapping->start;
+			vm_buckets[num_mappings].last = mapping->last;
+			vm_buckets[num_mappings].offset = mapping->offset;
+			vm_buckets[num_mappings].flags = mapping->flags;
+		}
+		num_mappings += 1;
+	}
+
+	drm_exec_fini(&exec);
+
+	if (num_mappings > 0) {
+		if (num_mappings <= args->num_mappings) {
+			ret = copy_to_user((void __user *)args->vm_buckets, vm_buckets, num_mappings * sizeof(*vm_buckets));
+			if (ret) {
+				pr_debug("Failed to copy BO information to user\n");
+				ret = -EFAULT;
+			}
+		}
+	}
+	args->num_mappings = num_mappings;
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
index c991d08262c1..d2edce3b75f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
@@ -27,4 +27,7 @@
 int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *filp);
 
+int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data,
+				   struct drm_file *filp);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 28a057db4718..cefa2661449a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -3029,6 +3029,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgpu_criu_bo_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_MAPPING_INFO, amdgpu_criu_mapping_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver amdgpu_kms_driver = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index f9549f6b3d1f..5a63ae490b0e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -668,4 +668,9 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev,
 				 struct amdgpu_vm *vm,
 				 struct dma_fence **fence);
 
+#define amdgpu_vm_bo_va_for_each_valid_mapping(bo_va, mapping) \
+		list_for_each_entry(mapping, &bo_va->valids, list)
+#define amdgpu_vm_bo_va_for_each_invalid_mapping(bo_va, mapping) \
+		list_for_each_entry(mapping, &bo_va->invalids, list)
+
 #endif
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 6a69db9f8648..0d04cb5bc5e4 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -58,6 +58,7 @@ extern "C" {
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
 #define DRM_AMDGPU_CRIU_BO_INFO		0x19
+#define DRM_AMDGPU_CRIU_MAPPING_INFO    0x20
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -79,6 +80,7 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
 #define DRM_IOCTL_AMDGPU_CRIU_BO_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_BO_INFO, struct drm_amdgpu_criu_bo_info_args)
+#define DRM_IOCTL_AMDGPU_CRIU_MAPPING_INFO  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_MAPPING_INFO, struct drm_amdgpu_criu_mapping_info_args)
 
 /**
  * DOC: memory domains
@@ -1656,6 +1658,31 @@ struct drm_amdgpu_criu_bo_bucket {
 	__u32 gem_handle;
 };
 
+struct drm_amdgpu_criu_mapping_info_args {
+	/* Handle of bo to get mappings of */
+	__u32   gem_handle;
+
+	/* IN: Size of vm_buckets buffer. OUT: Number of bos in process (if larger than size of buffer, must retry) */
+	__u32   num_mappings;
+
+	/* User pointer to array of drm_amdgpu_criu_vm_bucket */
+	__u64   vm_buckets;
+};
+
+struct drm_amdgpu_criu_vm_bucket {
+	/* Start of mapping (in number of pages) */
+	__u64 start;
+
+	/* End of mapping (in number of pages) */
+	__u64 last;
+
+	/* Mapping offset */
+	__u64 offset;
+
+	/* flags needed to recreate mapping */
+	__u64 flags;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

