Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D52BADDCA0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 21:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F1310E116;
	Tue, 17 Jun 2025 19:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mo4R0kv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F14910E138
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 19:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCFgijwCUeKLMMFh7T1hWmKXo7ywXt9t/4IkI4Viat39kk+sVo52q+z3+e97YLW+ZbczB5o5pgwPxnhhpqWCjkfxEJ3tZLy/IHnY6x2vD5qjczI9rObYjH2TtMuaGQOrKKRGpRfAitvwKrcaXAzcq8H5fFX3cnezrevKmuvMLLDfzz3q0JgCpVAIBd0kjQq6oFYDOVNkesVuyblY8yesqST1OO8do6702de8uvLn70kpyq3zrAsmY0+fPBA+oMzq38w7qjoFpQyUqryEbA1oC0MpdtUsRw5E17vZzalidns9LEXcNIaBJQMAvcMOieDvRDXW7X8Pph+OaUNgAbK6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTOafV+7kgrAmsaY/NgN0cG4aEH3wxYVMsGlQ3dMblg=;
 b=ZuB63kgfDS84zhgTC2n5oZCbnvGGHA1NkYN8TS6H18jEH3Z2krF1OR4xC5Yy1AKC1aHBPOMyybT4Md4FY61PjkkRQJpXIo/E0yK/Bdk9qLsHfAAF0b6j3UX+8UugpVSzT7ne1AeV4gf73Fexo1tnWSCUHpxZ9ctztYmy2xQUCKCsOBygz/gSdDdd8VQKCL72u/LmaSzybrlMQSJVXwZCS2e2Boo433aaUqyvmul5/8M9/ztDWocPIIoW4iVxSZtPTCPkW8aT6vSLEVKXhfQKoR0HPkhCvM/+gp8AqeauycW5KBd1zwu9GzpZIs8s00kwT/jhbhz3n8AlCaWcE5j1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTOafV+7kgrAmsaY/NgN0cG4aEH3wxYVMsGlQ3dMblg=;
 b=mo4R0kv1QNnhZ1ElfTD5xcuoaCRJANHZx05jbsT9eHE7jeDdEpf2sWOXc3QDpH0m98ViE2ZVQ3kBodo4kjowpAXn1IzKKEuq78qdGoGa40PFkZSCk3rVw9f+8UmmLsRK0eyFnz7awfQMM+0fx1sg2vCZatip5/g8IVwwCS4DLTc=
Received: from CH3P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::35)
 by PH8PR12MB6771.namprd12.prod.outlook.com (2603:10b6:510:1c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 17 Jun
 2025 19:46:00 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::3f) by CH3P220CA0007.outlook.office365.com
 (2603:10b6:610:1e8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
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
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 19:45:59 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 14:45:58 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 3/4] drm/amdgpu: Add CRIU mapping info ioctl
Date: Tue, 17 Jun 2025 15:45:35 -0400
Message-ID: <20250617194536.538681-4-David.Francis@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|PH8PR12MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d213b3c-5a4a-4142-86a1-08ddadd795c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?17n1t1+1tGU7amprwdnEaSEFypTI0OwNsCrmct0gPKW0PqaLRfS+QQWAnc+s?=
 =?us-ascii?Q?Am3npkaIrYBXHCWOa0gBHtQoDp9E3m7LqHduFo4VDzZ2pgi4UNXQYXOE+bKA?=
 =?us-ascii?Q?20us3uNTn+BjQngysJeg8MaGZz1Ux+IXxufQyXZcef58CP1cIxbKDsDZKp9Z?=
 =?us-ascii?Q?IK2nNyOqnQ3WpFMgsDGnpF1QnX017kCKx1l2SEA6He4yuWFUHbZESjS92z9s?=
 =?us-ascii?Q?bdD7i/EY46RsEG1dN3acpqzEf8bfz69/oi69fqtjPsmpIIKz1pUmivtj9YuN?=
 =?us-ascii?Q?lGWY8juSs2ATajTu8T++plmWA37Z++LURsgex9OmN70BiWRvNfz9etNyHNWe?=
 =?us-ascii?Q?HEQ35DLSRLmMIuHsJKByZQF5xzP86uO8UWi1hGXaiAsEJzrdv3wATLkAdovx?=
 =?us-ascii?Q?uWx/hcfJCJ8cYSIxhyjl+WmShpH/nKh6IABUHJeNye5HWPDZ8GhXjXPXy49F?=
 =?us-ascii?Q?4jlc/+ep7YGiu3ZghmmvybVEektOX/WfBHCIxnJpE9Vp3mpOnOGDEu65qtUb?=
 =?us-ascii?Q?n6NR14b85TWwQesfZI8qB9mHm39Pjv4Hgp68APs4osz32rp9R1uFLujqPuHJ?=
 =?us-ascii?Q?3I7l+Hb1/Bs/Kb5m3ykkUOzRx76WckX6LpMpML01iaGbeJtXxuflkDRDTf8v?=
 =?us-ascii?Q?u7jPHSsDkxrXHmM9XSTgQUHsrw37l2LkvTRG97sPPs9JfKCNzJfzEJHpV0W6?=
 =?us-ascii?Q?z746CmBKq11FTZIjm2sCG7YCcs4ne9/Tlcg2K8sx7g/OWe4ytuz6ZUeb1+xU?=
 =?us-ascii?Q?AoAj/Y1oWl/FWXQfKTF3N4cAPAdWVymMe7Q/picA4XjJLjxsP10+OAIn+tXS?=
 =?us-ascii?Q?Ib+VwX4OJu4x07sIwCAUDSuzAsMaLAEhTtBcHaG7idbVA5bAqwqKOkwdqalR?=
 =?us-ascii?Q?P4svKYsp1xvxsrcJ8fOR3fQSo/roey/UN7tMUIN9PEca7GshiGiUVTbn8c4X?=
 =?us-ascii?Q?Usdm4AyN+OTpH2fPRbF8cE0TKfFnkBEGb9cNFbTsYeUuTwASSZ0/LCfuJowE?=
 =?us-ascii?Q?GRZoA5awj172VwG4+rdHCDW/jwAFHc+2yuuZrrWj+0ZkhB+mt8sSpbg1cggz?=
 =?us-ascii?Q?y1thsbOi+KpEBfbS+AtoPxpQokOvrvg4zfb0DHatIC3yYOqviAlBc095ffwM?=
 =?us-ascii?Q?6GVlr72M1stPmEFdjTjVbJK/cV14wXeLl7VwtoIX8mWR4rgdTsAPDVuqGEx0?=
 =?us-ascii?Q?VdHXgCR6BvcC6JzMpuaciyugqYh6kgny3dmCBgdvnT9HMK6FFx8ZP8ELbqk8?=
 =?us-ascii?Q?1d6NASiB1/2esZ3JQ42VxQBKa/rgcRwP88ZKeVv9/M82kSQVQ/Q9ELz+SQRL?=
 =?us-ascii?Q?LC5d53X4sBLcUC2wQMHQMjtRBWwWjN0GQSqyAogjsErZ2ABXCo41nqF5YnJc?=
 =?us-ascii?Q?whmMrAjcvTHJvBO0H9EvsImKLrPgsBSC9AB/k70g0Ah2J6sjdbqXQRBq5h2X?=
 =?us-ascii?Q?TzMeDsTmrU+sgvkK8EB7XA9yRuLldVcdHanpco90heMfB0iuWOm/aJ6ZtrTk?=
 =?us-ascii?Q?q7EqvYLUtrqQtFNHXwZmiNO+C5TxD6cRJSei?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 19:45:59.8440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d213b3c-5a4a-4142-86a1-08ddadd795c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6771
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 96 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h   |  5 ++
 include/uapi/drm/amdgpu_drm.h            | 27 +++++++
 5 files changed, 131 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
index 34a0358946b6..dd677367a82e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
@@ -142,3 +142,99 @@ int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
 
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
+                struct drm_file *filp)
+{
+    struct drm_amdgpu_criu_mapping_info_args *args = data;
+    struct drm_gem_object *gobj = idr_find(&filp->object_idr, args->gem_handle);
+    struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)filp->driver_priv)->vm;
+    struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
+    struct amdgpu_bo_va *bo_va = amdgpu_vm_bo_find(avm, bo);
+    struct amdgpu_fpriv *fpriv = filp->driver_priv;
+    struct drm_amdgpu_criu_vm_bucket *vm_buckets;
+    struct amdgpu_bo_va_mapping *mapping;
+    struct drm_exec exec;
+    int num_mappings = 0;
+    int ret;
+
+    vm_buckets = kvzalloc(args->num_mappings * sizeof(*vm_buckets), GFP_KERNEL);
+    if (!vm_buckets) {
+        ret = -ENOMEM;
+        goto free_vms;
+    }
+
+    drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
+              DRM_EXEC_IGNORE_DUPLICATES, 0);
+    drm_exec_until_all_locked(&exec) {
+        if (gobj) {
+            ret = drm_exec_lock_obj(&exec, gobj);
+            drm_exec_retry_on_contention(&exec);
+            if (ret)
+                goto unlock_exec;
+        }
+
+        ret = amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
+        drm_exec_retry_on_contention(&exec);
+        if (ret)
+            goto unlock_exec;
+    }
+
+	amdgpu_vm_bo_va_for_each_valid_mapping(bo_va, mapping) {
+        if (num_mappings < args->num_mappings) {
+            vm_buckets[num_mappings].start = mapping->start;
+            vm_buckets[num_mappings].last = mapping->last;
+            vm_buckets[num_mappings].offset = mapping->offset;
+            vm_buckets[num_mappings].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
+        }
+        num_mappings += 1;
+	}
+
+	amdgpu_vm_bo_va_for_each_invalid_mapping(mapping, bo_va) {
+        if (num_mappings < args->num_mappings) {
+            vm_buckets[num_mappings].start = mapping->start;
+            vm_buckets[num_mappings].last = mapping->last;
+            vm_buckets[num_mappings].offset = mapping->offset;
+            vm_buckets[num_mappings].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
+        }
+        num_mappings += 1;
+	}
+
+    drm_exec_fini(&exec);
+
+    if (num_mappings > 0) {
+        if (num_mappings <= args->num_mappings) {
+            ret = copy_to_user((void __user *)args->vm_buckets, vm_buckets, num_mappings * sizeof(*vm_buckets));
+            if (ret) {
+                pr_debug("Failed to copy BO information to user\n");
+                ret = -EFAULT;
+            }
+        }
+    }
+    args->num_mappings = num_mappings;
+
+    kvfree(vm_buckets);
+
+    return ret;
+unlock_exec:
+    drm_exec_fini(&exec);
+free_vms:
+    kvfree(vm_buckets);
+
+    return ret;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
index 1b18ffee6587..486c341729ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
@@ -28,5 +28,7 @@
 
 int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *filp);
+int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data,
+                struct drm_file *filp);
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index bf33567bb166..5f3de93a665d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -3023,6 +3023,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgpu_criu_bo_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_MAPPING_INFO, amdgpu_criu_mapping_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver amdgpu_kms_driver = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index f3ad687125ad..978d6b29e626 100644
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
index 1508c55ff92a..ab09ae9890e7 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -58,6 +58,7 @@ extern "C" {
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
 #define DRM_AMDGPU_CRIU_BO_INFO	0x19
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
@@ -1654,6 +1656,31 @@ struct drm_amdgpu_criu_bo_bucket {
     __u32 gem_handle;
 };
 
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

