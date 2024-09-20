Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265297D370
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 11:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66ECF10E7F5;
	Fri, 20 Sep 2024 09:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z5vW1CtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD4810E7F2;
 Fri, 20 Sep 2024 09:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeVkYcn7brmBw2wjUltWV7dH7MlrblRqCGm35s+tpvh+qfOeTUxgnTDkO5JyaTfAOMk6SJRRgs0aOeIwHs5hPtM/tc+eHWwQnOiT+WrUkFWKsKbEzAHF71LprGSDnhli0CCDOJynC420nOkEpWWvCOqjNB9Y89xj5IdCjbdfjAn7/T+hXH1F8wYhSYSuvE8inJPqZ0bn5dSbK0ME2u265QEczERSIcQBmZby2BKS9BynKOJE3iRvp59fSjx9WlRSKkNpj56O8ndACgK16ZDWEQXWNh7BOqNDNJQrnYpjrRscgKBVFZRRxvKwH9XLsUjXpa5U2ElLzkCNa/dJwRPV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hq6yZZotLfHWb+83Pw0AhKPXvnCBuuddgKSNSPQ9/QY=;
 b=Eyr15BNzxGZQAFFo8obeC5Dp4scFaQG+CDUUIEjT/NjIb0uxLjgh6HIcp708d3EWAEpnOzX9+9DwMlG2EVw3n7h9b2x6MhVhQF0d2c8DX/JcnPD61+lO94je/i5tvLdbMhwO8XJSJcyZiFQk9/lqORxJNP0if/nZQYIsc0Jjhip3hjWVUSuS7LHKOsJex6eKLuDZ2sNhPo/18RgfMavebCEjKdDlIAvu7dM3b9I+n6uik4g48diAVvS39oxKKWrtC34r6E9uOvQJtRq+Cr+OIpyBCDMC2JTiqRclibEHTqDRDvU6B1P9SQe6WXOkWYlSxhRznk8yqQPDTKH1QbPfNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hq6yZZotLfHWb+83Pw0AhKPXvnCBuuddgKSNSPQ9/QY=;
 b=z5vW1CtY9sJc2XAgj8vRAxRU4VvzOLBM0RHasXwTAApcwk9O63A2WwW2I/k5yVPMODJ+h6myH7WNNwH7nJ/QpXc0gPDo9OVvetdJKJUuf3UxHhTnhbWXeeY43W8sw5Z8iG8vrGE7oV2+z7QUoUXT6PeUIvXvzeIr3S89+Wn/6pI=
Received: from CH0PR13CA0052.namprd13.prod.outlook.com (2603:10b6:610:b2::27)
 by CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 09:10:05 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::76) by CH0PR13CA0052.outlook.office365.com
 (2603:10b6:610:b2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16 via Frontend
 Transport; Fri, 20 Sep 2024 09:10:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 09:10:05 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Sep
 2024 04:10:03 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 6/6] drm/amdgpu: use drm_file::name in
 task_info::process_desc
Date: Fri, 20 Sep 2024 11:06:48 +0200
Message-ID: <20240920090920.1342694-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|CH3PR12MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: a617ce2f-0f7e-445a-6f15-08dcd9540491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f1Mm0zvSfZcXWW49sLjkHJzOSBjoGVwRcdudp9g/wSn+PBVhAxK+53vAvJQz?=
 =?us-ascii?Q?gmizgd8e8NLj9IRK3CGBMagYVQqfHalGeisCcHIu60LU2oPu3r4WFhy5YMCW?=
 =?us-ascii?Q?pLNIM7VZGCvh5MefzXFM5LI+KJZgEjX26Fb6APyoJPsx0OG/vX5k5yZG1C9N?=
 =?us-ascii?Q?W9BgUqKedB1v/L+ys+QLeEQr5d1DS8tDrqKSn3w1JlfLDKBzK0BRiBf0HSwd?=
 =?us-ascii?Q?/UosPgDVZajDbiygf9QPTDPRASc3NVfV1pG7FBKkFsTrZJJKdzoeY7k0vZhH?=
 =?us-ascii?Q?CfMlxX8Xzg/jI2jTijQeI1fAveEPviF8DtiVMcWGoyVv8F7RkgVFcyI6upil?=
 =?us-ascii?Q?Ui7UmHjd5QYddc526gJCUSMZRUnN9xuKjBk887GLTSjKJs4ZnFN2aJB1fPLc?=
 =?us-ascii?Q?ruPLR6qfHGQvM7fdKNnUYIKaeKyMiiJrEsuIvEG49NzGK5t4ski1p4WIUl/Y?=
 =?us-ascii?Q?rPjC47m7DM7xH0zYGAewqujyXtK/vmXqt+N8eTRHM6pGnd2Dqplnet2Is0Ly?=
 =?us-ascii?Q?hqb6uayppgq71dSWmqf25YcGlPJF08TsR0q05/AeeskAKgsdB11ybb+zpDjA?=
 =?us-ascii?Q?C2q5V6oNmNXHiAPI29ufeGTRqUBFVcRoeOTYhinMHyMUJ+4fxGgMpbsLQ2HM?=
 =?us-ascii?Q?CRNAkv22+ZyycUSbA542KFsUBUxoY8vDGQhWy66P9VBayMcaSmD/PYtcNDvb?=
 =?us-ascii?Q?OIoF1IxhFYD9Ul3qa8LT3E2mX2hGIyLJ80ByGkk3hYp+0xJR1R4dqugea4QC?=
 =?us-ascii?Q?Orpsk5bDs4l+325+T9Yo7pjxwpN08S2Ba03+D7UI5xg6Y5+8qMTo9tWtRghq?=
 =?us-ascii?Q?QiA2/MegIZlhJKrbudUSAjCvR7FeBYhvz4cqJdywDi+pxvo0DRTCPEQrRbF+?=
 =?us-ascii?Q?xgwtX+gc632/U1VXN/HfStFXELpZHt+Vx78Y6EeBiLJqX2Qocy6VSNXXVk8m?=
 =?us-ascii?Q?9XZmkMFow6ZlHq1t+jheUCZkumf6YKaetaPtlk45U6hshH6QUF+70g3D3gB+?=
 =?us-ascii?Q?Cd53l6OQYTQkASioxNxHfQtHCQ5s3E6Grx+gAgnHVlz4Uil351I5D3tqRvNj?=
 =?us-ascii?Q?/B6EJnxg4/hu2dGr71wjQ59CCd3MijRunTJVQkKx0VBmGVo5ixCZm2qxfB5d?=
 =?us-ascii?Q?TyL6qTokk+MlYHu40PK7LVfNtJ7Tlwe5cfivASyOGwIQnwm68OU+vCmjQE2q?=
 =?us-ascii?Q?nYuKcCcM5c3b3Dc/hPgqi08Rar+ZUWR0nnYWkNcLWEPGGV1EWuHIjXA+2Oss?=
 =?us-ascii?Q?/D41cSLT3+pL7T9olOlMQEKE2im9115d+QNYIxhH8JgrAGUARQROf6ovNkjS?=
 =?us-ascii?Q?WDLRwjnPQytxfIiX+/Y7qRwJoRpWQVmDYdgS9aBhm5eF48sDNfj4MTw4Ewp8?=
 =?us-ascii?Q?2Jml/gUpqRO0BeHt8OiolobIyU9M7mSva4qGvX6v3tw2Vr+RwjXAvT8ppCSf?=
 =?us-ascii?Q?yO3dGA8JX090zBfxdnIXiACofJAz7RW/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:10:05.5638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a617ce2f-0f7e-445a-6f15-08dcd9540491
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852
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

If a drm_file name is set append it to the process name.

This information is useful with the virtio/native-context driver: this
allows the guest applications identifier to visible in amdgpu's output.

The output in amdgpu_vm_info/amdgpu_gem_info looks like this:
   pid:12255	Process:glxgears/test-set-fd-name ----------

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 26 ++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 +++
 6 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index f9d119448442..ad909173e419 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -299,6 +299,7 @@ int amdgpu_amdkfd_gpuvm_set_vm_pasid(struct amdgpu_device *adev,
 				     struct amdgpu_vm *avm, u32 pasid);
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
 					struct amdgpu_vm *avm,
+					struct drm_file *filp,
 					void **process_info,
 					struct dma_fence **ef);
 void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 6d5fd371d5ce..172882af6705 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1558,6 +1558,7 @@ int amdgpu_amdkfd_gpuvm_set_vm_pasid(struct amdgpu_device *adev,
 
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
 					   struct amdgpu_vm *avm,
+					   struct drm_file *filp,
 					   void **process_info,
 					   struct dma_fence **ef)
 {
@@ -1577,7 +1578,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
 	if (ret)
 		return ret;
 
-	amdgpu_vm_set_task_info(avm);
+	amdgpu_vm_set_task_info(avm, filp);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 891128ecee6d..5d43e24906d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1178,7 +1178,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	}
 
 	/* Use this opportunity to fill in task info for the vm */
-	amdgpu_vm_set_task_info(vm);
+	amdgpu_vm_set_task_info(vm, p->filp);
 
 	if (adev->debug_vm) {
 		/* Invalidate all BOs to test for userspace bugs */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 7f852029d6e1..a2b12f0c3253 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2355,14 +2355,20 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
 			amdgpu_vm_get_vm_from_pasid(adev, pasid));
 }
 
-static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
+static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
 {
 	char process_name[TASK_COMM_LEN];
-	int desc_len;
+	size_t desc_len;
 
 	get_task_comm(process_name, current->group_leader);
 	desc_len = strlen(process_name);
 
+	if (filp) {
+		mutex_lock(&filp->name_lock);
+		if (filp->name)
+			desc_len += 1 + strlen(filp->name);
+	}
+
 	vm->task_info = kzalloc(
 		struct_size(vm->task_info, process_desc, desc_len + 1),
 		GFP_KERNEL);
@@ -2371,6 +2377,17 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
 		return -ENOMEM;
 
 	strscpy(vm->task_info->process_desc, process_name, desc_len + 1);
+	if (filp) {
+		if (filp->name) {
+			size_t p_len = strlen(process_name);
+
+			vm->task_info->process_desc[p_len] = '/';
+			strscpy(&vm->task_info->process_desc[p_len + 1],
+				filp->name, (desc_len + 1) - (p_len + 1));
+		}
+		mutex_unlock(&filp->name_lock);
+	}
+
 
 	kref_init(&vm->task_info->refcount);
 	return 0;
@@ -2380,11 +2397,12 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
  * amdgpu_vm_set_task_info - Sets VMs task info.
  *
  * @vm: vm for which to set the info
+ * @filp: drm_file instance
  */
-void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
+void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
 {
 	if (!vm->task_info) {
-		if (amdgpu_vm_create_task_info(vm))
+		if (amdgpu_vm_create_task_info(vm, filp))
 			return;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 44da250217be..8df3dece54c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -561,7 +561,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
 			    bool write_fault);
 
-void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
+void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp);
 
 void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index a902950cc060..e473fe433d3f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1654,6 +1654,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 			       struct file *drm_file)
 {
 	struct amdgpu_fpriv *drv_priv;
+	struct drm_file *filp;
 	struct amdgpu_vm *avm;
 	struct kfd_process *p;
 	struct dma_fence *ef;
@@ -1673,8 +1674,10 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 
 	p = pdd->process;
 	dev = pdd->dev;
+	filp = drm_file->private_data;
 
 	ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(dev->adev, avm,
+						     filp,
 						     &p->kgd_process_info,
 						     &ef);
 	if (ret) {
-- 
2.40.1

