Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEC098EF92
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47FD10E1EF;
	Thu,  3 Oct 2024 12:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E3trAgBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2334810E83B;
 Thu,  3 Oct 2024 12:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VI9HAckQ/MjDCKN5qtJVDsaxaq4hchMMrfv43ML56VmcEInRzYLny4d2gxPl1GoCDZ0qftbSLOLcgRnEzozGu2L2K1LuSPExVXX+L68ghAsgxS/ShUMAkFsTJ3kiz90RgxhoHJhE8nlGLNC/wRsjC4dUGC8BWSpnnITbst+sgSHKLHVlyu5SD2De/gjkNi7cAK8OcDUbg2qhDspfOXtVLx93ZDwOJiltIvtEvaRoRKK3GlPsLVHKj8f6QQddwFiZV4tdlTbsczOvuuxNcLjuekcsZ3VIfXb/YCRHk/EUt7lQLLagw9lQVat/8puh65dxFSHe5cBzlSZYubiNnwVSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMUvXfuM9MOggAOt1ZdfNfJXfG8ODxGRuWJFXsE80fI=;
 b=BQ/Zr/ZNGgbAd+veP6/KN7ZwpncSnnVPPuvJo0LAmwwyzI6cg2Rfteqr9cCD4aWH5qlmG7W9OoI2jWF0t1kZVIp3pjsrvr5XBIlu2+AsIa5LcbI1ISu79M7iEZxQ7fFUXZHC+GlRhsly2TI/YU1xS3leypOZGMKYeKSkdCXBpnQlrwKUilE9ipvLwGtyTK5fFmB4uhT9AcHjDuZUxNGJNeHPIxcZLJQIs+NsRbn3pD+H7Qn5x4w/r+DQznc6ACDCym4PsYYAimi0ZTZXQ7SEqS1aADu6oRL78EjTNmjo39MNH+d5fQeRZZGZ57vlGXmLrCt6rlWzf+qAbehENq2PxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMUvXfuM9MOggAOt1ZdfNfJXfG8ODxGRuWJFXsE80fI=;
 b=E3trAgBSDvmhBbBJ9+C86KtrlQAvUi0416JrV0TfZaIoqawtsVm6DiIkyfh1pkGy9s4kFS9n6jWgYBSeBCnrerFuiaQUm1pNx2csunIXO5VgmTOHzzgKqP7eFWT921S3gaqy/toSBLpRBdxjCEi3EY3SdKNhrWpmjsjdG2mQNYM=
Received: from SN4PR0501CA0007.namprd05.prod.outlook.com
 (2603:10b6:803:40::20) by BL1PR12MB5706.namprd12.prod.outlook.com
 (2603:10b6:208:385::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 12:45:44 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:803:40:cafe::4e) by SN4PR0501CA0007.outlook.office365.com
 (2603:10b6:803:40::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.9 via Frontend
 Transport; Thu, 3 Oct 2024 12:45:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 12:45:44 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 07:45:41 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>, <jani.nikula@linux.intel.com>,
 <christian.koenig@amd.com>, <tursulin@igalia.com>, <simona.vetter@ffwll.ch>,
 <robdclark@gmail.com>, <alexander.deucher@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v5 4/6] drm/amdgpu: alloc and init vm::task_info from first
 submit
Date: Thu, 3 Oct 2024 14:43:12 +0200
Message-ID: <20241003124506.470931-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|BL1PR12MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 52678788-1eee-4e53-780c-08dce3a94bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5W/2RBUsdcPjrZQ/K0376Xlz0sLZ/3YMxNh2t6E+l14ZR3MKC5is0dEw2V26?=
 =?us-ascii?Q?LLp/7KGB7plpmD+o+34diiWrWoQbYOE9cfjzesahp7SrX6/HifI2dZ//NiNS?=
 =?us-ascii?Q?AiRkEn2jbZ2Qwz2eX2guPSl13VJP2SBZjouYJisTgVB6UYKI0YfKS4iGBEsn?=
 =?us-ascii?Q?XFgWHJCEk7f+fKAM1B7CfrqjSh1QJ7IIvu1x15slgtBPeegXwyciQWQxOq/P?=
 =?us-ascii?Q?hjK3raZZOP1srhZkVwPw+wc2JLEpGxacA4bHujLbBxgFeijRrcWDIQ6YQhVf?=
 =?us-ascii?Q?te+2x67q0MOwTBPveI1RrRMNw0Cl5ArLBG7bGV6hDjpCQf/558QE2VpcXPpi?=
 =?us-ascii?Q?agfZBx1VvKX/Mla75J3fLFrYhf0+Ja44Wlg9i26C0cYwclpLhZU4kWQRvMxL?=
 =?us-ascii?Q?TzXguDD+RH4DbSiJujvxQ+Cq5f15Ec/SbPI6vJZkYvqTQJdE584osA2hfh/B?=
 =?us-ascii?Q?TLfFhOg6YxkpCMFH7LizmAjMlIuvfmCdF1YdNLhyS/Xv3aGOWLX8XsuPQi0+?=
 =?us-ascii?Q?cVxLAQ9yCFTW5ygd7EFRgQipy7McJkVCHUNJ+xlDu40d03Kb//q54uSGuVve?=
 =?us-ascii?Q?Zs9MibG8FcReonzSo/1Meqafddoym4GabMOoLc6OF2OwgReW39/kopLBTLwn?=
 =?us-ascii?Q?rsKfcHDGEKeGgwnw3Ax20BsKoAnBUnfotY/zlB2nCU4z5Xi4GzB0e8N3YpVE?=
 =?us-ascii?Q?n0SH1mk2LW5Xv2TyjJVQAHF2PVypwSYIo0ioakkmrWcMq6PDhx77awkz2bre?=
 =?us-ascii?Q?4KWlzKWR6JyMOlZ28IwmjFV9ZlUQoDRNPWhv5HsXwFluO6Yd5NJMQe4UQ6vU?=
 =?us-ascii?Q?oKzhqJdtGACpyThflg7NGimm0K4LT/7eMGJZyaA6uEn30DU4SpU5pFg2GBNp?=
 =?us-ascii?Q?F278UmWtTCEMz3QvAYRUm782e+VzuVFEaY5MoVieoMvorz6mxFMZc8lJccQ7?=
 =?us-ascii?Q?QZuU+VR7teR4r8RG/G5YkmLS6m7rBhyuJyz4uDUQ1yb5ev4yljrsTC3Am5/K?=
 =?us-ascii?Q?UOkgtslmrklaRUMshI4yZFS/f6DCOP3bufW4MDlcAEx13q9iJEFOSY5W4tIP?=
 =?us-ascii?Q?0UearV+SBumrV/gdqqmlTqRxlJYOfCAIS2ZwWlyNCHjmYO10H0UVxLJ6l39/?=
 =?us-ascii?Q?f+Fn18FmudUOqV09EJfrZvolO0m5NTiXBaHvVl9f8yduj4SP7NXNek4zlgN5?=
 =?us-ascii?Q?XUSd3mpmfmPW3d3A1MojZqbgffmWY4pUbi/NeqPn+/H79em/8MkoB7+ML/Se?=
 =?us-ascii?Q?zh5D1yG8EqQzwgQcZcEu+wnFaERLB2atz9ZWuhS/NOKgH0XBIu0RbkkBN7T3?=
 =?us-ascii?Q?K20cqJF3SiFkxpQf4eEtGBXWltO5qsYlkwz0mkWx25NXextt37lzr2QAf7Zn?=
 =?us-ascii?Q?LBTqphMfNz4kD+o3rVreYOU5hxLo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:45:44.1349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52678788-1eee-4e53-780c-08dce3a94bed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5706
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

This will allow to use flexible array to store the process name and
other information.

This also means that process name will be determined once and for all,
instead of at each submit.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 29 ++++++++++++--------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index e20d19ae01b2..6cd5bd5362d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2331,7 +2331,7 @@ amdgpu_vm_get_task_info_vm(struct amdgpu_vm *vm)
 {
 	struct amdgpu_task_info *ti = NULL;
 
-	if (vm) {
+	if (vm && vm->task_info) {
 		ti = vm->task_info;
 		kref_get(&vm->task_info->refcount);
 	}
@@ -2361,6 +2361,10 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
 	if (!vm->task_info)
 		return -ENOMEM;
 
+	/* Set process attributes now. */
+	vm->task_info->tgid = current->group_leader->pid;
+	get_task_comm(vm->task_info->process_name, current->group_leader);
+
 	kref_init(&vm->task_info->refcount);
 	return 0;
 }
@@ -2372,20 +2376,16 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
  */
 void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
 {
-	if (!vm->task_info)
-		return;
-
-	if (vm->task_info->pid == current->pid)
+	if (!vm->task_info) {
+		if (amdgpu_vm_create_task_info(vm))
+			return;
+	} else if (vm->task_info->pid == current->pid) {
 		return;
+	}
 
+	/* Update task attributes. */
 	vm->task_info->pid = current->pid;
 	get_task_comm(vm->task_info->task_name, current);
-
-	if (current->group_leader->mm != current->mm)
-		return;
-
-	vm->task_info->tgid = current->group_leader->pid;
-	get_task_comm(vm->task_info->process_name, current->group_leader);
 }
 
 /**
@@ -2482,10 +2482,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		goto error_free_root;
 
-	r = amdgpu_vm_create_task_info(vm);
-	if (r)
-		DRM_DEBUG("Failed to create task info for VM\n");
-
 	amdgpu_bo_unreserve(vm->root.bo);
 	amdgpu_bo_unref(&root_bo);
 
@@ -2608,7 +2604,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 
 	root = amdgpu_bo_ref(vm->root.bo);
 	amdgpu_bo_reserve(root, true);
-	amdgpu_vm_put_task_info(vm->task_info);
+	if (vm->task_info)
+		amdgpu_vm_put_task_info(vm->task_info);
 	amdgpu_vm_set_pasid(adev, vm, 0);
 	dma_fence_wait(vm->last_unlocked, false);
 	dma_fence_put(vm->last_unlocked);
-- 
2.40.1

