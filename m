Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C79880BE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B2510EC91;
	Fri, 27 Sep 2024 08:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uxUEHx05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBF010EC91;
 Fri, 27 Sep 2024 08:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqwtbOSfZJVM5TGj8rDm6MvMCp9rcUtdemSCMvEU3GCdpp3Lhzuay03bAR/+OHTYlGJKaiDGGtBsjxxPXQIzSpSUgM9a/GRXEbUjRyvIEV4L/dwlOfLywKou1yJdK6+2R0ooPXU1Mk1XZSR9q1Es2adyB8eKqtkAdaVds0cME3IeGP3pHuJxYPvqUnthTkz5EHK3/CkhPiaVZ/YAeQiLHs7klRRF+A7FU495mpk8O1AR8Q9qnyEGBol1JCOsIYAH6FDkpF3rWP8MtzoroBlPbzRsetrv4u4GTQ2dJejvCIO4Y9keZ/HrJ3hVcs1EGQZCfnDQfb5Uw82FDCIUtIBtAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IH7FhNaOJojb17QkzJTj03dM9VACVcDjDPBTbLbg2m0=;
 b=NWFimuSyOjsHENsbhqPTVsBwpeNGhsBb9g1UrbabjlL1EhhTDA28y2kuQQ5C2Y3sGMC5UsTsHmE0pUXAqSeWle3djec7lQw10ylSVBNr/5b4kWxb3b26mR37luhANFuJXPs/hhBEyKaZd+O3xuDHFy/dlR7wqBrj72XTc1fO7rYITBes9hIlw/iHe8koSlw7fpbkEIh1yVJ2rR3Z5rrBOU3912NpB+wcer6ZeHLZjfD4+Pdf8Sb4qWefmlFzgdVSvA8+hdxBB5vnFisM3taKAUAVxHYoVkUW4KrWxSg/ximDODlzGiuikfiIkRCCYDgOF5q++yn94H8SyvUEhRUsVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH7FhNaOJojb17QkzJTj03dM9VACVcDjDPBTbLbg2m0=;
 b=uxUEHx05kjsWPCsG8fmCeBuQUnbk2pppJZrQRpQfv+F6RwYfNqK9blIBgqN1wf/42QQzkr4Yva2RQ4yAkz2C2DDfontA+P+6mo7w13x5HJQwL8TANZ1Z3tH6ZsvLwFtCdUPZM1VYNVC4Rrh8dTPIEZobjCXpW915nUKq25MTC+E=
Received: from MN2PR20CA0053.namprd20.prod.outlook.com (2603:10b6:208:235::22)
 by SJ0PR12MB5611.namprd12.prod.outlook.com (2603:10b6:a03:426::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.23; Fri, 27 Sep
 2024 08:49:43 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::42) by MN2PR20CA0053.outlook.office365.com
 (2603:10b6:208:235::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22 via Frontend
 Transport; Fri, 27 Sep 2024 08:49:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 08:49:42 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 03:49:40 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 6/6] drm/amdgpu: use drm_file::name in
 task_info::process_desc
Date: Fri, 27 Sep 2024 10:48:42 +0200
Message-ID: <20240927084848.263718-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|SJ0PR12MB5611:EE_
X-MS-Office365-Filtering-Correlation-Id: f80de1ac-01ed-4b51-69ca-08dcded154b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UTlVMwOYZHKvkMlh3H448rGMdmVCqTu8jxvtqu4Wk9dTPmDY7D5MuPNWq4Nd?=
 =?us-ascii?Q?9Dw2SJGgWc0I7b4o/LPIFHXlT4nT+UoYJEYzt7vUXYzucHBHni5skFul2qOx?=
 =?us-ascii?Q?yxW42Q+C4KZCiwLhT9WLAnZ16A3V+6Ukw5jP7Exx/hWtbwQ1hln/RInaMnys?=
 =?us-ascii?Q?b4V56XT/QsMvzdkkHcIP0Ev1FP4p9djAJjI6rN3qCugqkoEVrDY313Q555UL?=
 =?us-ascii?Q?iMg2at02enK/t6yj3aqx2BUK34h09piFmZRET4WIFKLN0uxC+yevDlAU6Fi4?=
 =?us-ascii?Q?dM5wBQ8qb12NMQ7KxWRdX8G343NaOi87GilLyDxHxTYtkjF0AqNE/oAVwbcv?=
 =?us-ascii?Q?yxZ0qTMZA7k1ckxuFzo25VZ6bbZPJ0Je+OHx1JEFGJA8zXCb62gL/4qDMpfa?=
 =?us-ascii?Q?sf7krzJtzSB2fQeQZpdItePcSwgf3kMaZ9oevxbQWuI3pjLuy7ukPUphq35q?=
 =?us-ascii?Q?d7Mxgfz96QxjYd+3N23a8JnRY1SEKynkJSYHE0fIIpco3vH6ibG2qwY64Que?=
 =?us-ascii?Q?Mie8Y4GcsNu92JwAkenMeDpBSi0tN+g8hLkUtD2UshJ572n6wP+cztJEAcWy?=
 =?us-ascii?Q?ZxegwkfAdS+7i0gzSP1OAmBsEFdO07BvLvTFhAQE8Dd7EMf0tBNe/ZzLnUJ8?=
 =?us-ascii?Q?BFzpVL4qgkzTTARNHq/CVCJFd879etK4BD/MLeR3a+oUq909v999ElO4Ro9l?=
 =?us-ascii?Q?+NuVkqSdDtxEgLYLPPT1nKh7NFWR1LJXHsCMlDIMU3TlQMeEQboDlb2ANI4P?=
 =?us-ascii?Q?PznmLHjruqwMYkHbF1dv70+Npmo6AYbBsBgzwlsyahTSTOk7b9fG6G1YSbXv?=
 =?us-ascii?Q?Xou0zYhhMNbF2MbAtjgPy8ye+wVpN9AJ2URte6fa2GPW5gsAY5FxUq1oZtv1?=
 =?us-ascii?Q?NooByISUcd166Js6Tzrn5XOc1I97flg/MqbPSgU51XWxWoFgUweEUVP2mUh4?=
 =?us-ascii?Q?4puNLoikQOBZr6pM3tDekq7M3M5fRWugVxQ5G0h30DUwzCZumSj2tOJ/QRLQ?=
 =?us-ascii?Q?TlRF6BHx6iPL+G9h1FHoBGkd3kStYLJOkkjvsNEakw1XTmKwMAD6g2o7pt+V?=
 =?us-ascii?Q?k/nutntAOzaPmNzCtandhPePb1w6PPOvITKjEllPiYkpWGl9Oth3wxSoyHCn?=
 =?us-ascii?Q?Gm4WGtKX+UnOW4pxD6LWVzDrkeVic+a7cxl0dsQrQK57+8s1u/SZeMZP1ZcC?=
 =?us-ascii?Q?QVhewzg+DyAfjrx88b3bJXPEHQqzg/jEvUiFE3Cw8agar70haS4J8+WujbFO?=
 =?us-ascii?Q?6zkiDh+kPyBA61MOUXxdjGuKBBfNQ8qPnh9/e79g0aDvEQm+O1XRoYTahlUg?=
 =?us-ascii?Q?aGvypK6g6bEeMkfQsBqA0ugSS+BmbWM8843Kbs2KqYGicwZCzqqBXFOOxu3H?=
 =?us-ascii?Q?dRZ7SgkMAUbT2VegXdFOQ8QyIY3lI6N/klh6AxROpp7HOgLYx1wjbxSWiJwT?=
 =?us-ascii?Q?kWlfNOzps7sbEDmAM1j9b3H3Ec/8SAUl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 08:49:42.9692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80de1ac-01ed-4b51-69ca-08dcded154b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5611
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 26 +++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 +++
 6 files changed, 29 insertions(+), 8 deletions(-)

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
index cec0a5cffcc8..f6e2be6d4e9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2355,25 +2355,40 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
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
 
+	mutex_lock(&filp->client_name_lock);
+	if (filp->client_name)
+		desc_len += 1 + strlen(filp->client_name);
+
 	vm->task_info = kzalloc(
 		struct_size(vm->task_info, process_desc, desc_len + 1),
 		GFP_KERNEL);
 
-	if (!vm->task_info)
+	if (!vm->task_info) {
+		mutex_unlock(&filp->client_name_lock);
 		return -ENOMEM;
+	}
 
 	/* Set process attributes now. */
 	vm->task_info->tgid = current->group_leader->pid;
 	strscpy(vm->task_info->process_desc, process_name, desc_len + 1);
 
+	if (filp->client_name) {
+		size_t p_len = strlen(process_name);
+
+		vm->task_info->process_desc[p_len] = '/';
+		strscpy(&vm->task_info->process_desc[p_len + 1],
+			filp->client_name, (desc_len + 1) - (p_len + 1));
+	}
+	mutex_unlock(&filp->client_name_lock);
+
 	kref_init(&vm->task_info->refcount);
 	return 0;
 }
@@ -2382,11 +2397,12 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
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
 	} else if (vm->task_info->pid == current->pid) {
 		return;
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

