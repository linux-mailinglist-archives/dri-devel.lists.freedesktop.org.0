Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F49880C2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A52D10EC94;
	Fri, 27 Sep 2024 08:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JqhH8fNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3B110EC8D;
 Fri, 27 Sep 2024 08:49:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHWtwt/VM1Evi7dCzMSPzBi1E1dsLEANZPI3a4CNSDvfJlFqOofZZZ8PfUCwMV2N4hY2xZOTx3UHsdRwNpEW+qHoxLoMFb0kgUWnzExtGounVUA2GNHS3G6R0FZRcp70pnzMs0GKSwJBohCFbQjVsFijHgMl/W7QqNLnHG9u+NnnSZ32SQtu0E12u3Qpdg7gmHa5Uwz0XhFkMm7yIpJ+kqj7ByPM8AeK/wV1wdCp1LKfJX4DRIVMPYmHqbOo+JZ6RFttLXivRIcT/0jZJPyELHi/nu4/XGQOJXPqibEykeDTd2YKHZV23ueN+jFqF2Z953VKA7Xa/sKESaZRcgfGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMUvXfuM9MOggAOt1ZdfNfJXfG8ODxGRuWJFXsE80fI=;
 b=f+igef01FCNRezzyY/o6UHKcqU9NVWvTSOyfTrM/IAsbxby7f7KIk1wuAhPxJC1MwBfBI1GsivF/KwPYBh9aG5pbjbLFoVpSLzPXzopY8PW/b378ZVHlDlYTwabza1Fhu0Bqtrha54UgBTcAzx07VJJksMixSxxHvhsW67vGxJrASNbdmUgLWIPYcNow9MAAI9tUF0MymqynwE+LPOpaXftCoThrvV5a5O2GJvJQn3bQSPBtXmZHTkaB37ndYVSqGozY8gyJ001MWdkdCMNPcpZikRNbifshrAqm3ApRgONTiSTZ1krT0K4kNE1okDAfxTAnghz+y3FqwEySfTan1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMUvXfuM9MOggAOt1ZdfNfJXfG8ODxGRuWJFXsE80fI=;
 b=JqhH8fNd+ifo5YmiqHq/rHq7VsgDfIxUhLRJn+l2aqRCQEvkicj8SOOS8c62n/E+5ABkhJ5MPkLR3AOee0T+T/c7dXtml2dv5kg1NHFBSXixQwhJh21LP3V/xS3msPhvRIz+Lsl7+hLvSL8npfWpvRs8HDPDyZ1rP5sEJgzKAjA=
Received: from MN2PR20CA0066.namprd20.prod.outlook.com (2603:10b6:208:235::35)
 by MW6PR12MB8999.namprd12.prod.outlook.com (2603:10b6:303:247::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 08:49:42 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::61) by MN2PR20CA0066.outlook.office365.com
 (2603:10b6:208:235::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21 via Frontend
 Transport; Fri, 27 Sep 2024 08:49:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 08:49:41 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 03:49:36 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 4/6] drm/amdgpu: alloc and init vm::task_info from first
 submit
Date: Fri, 27 Sep 2024 10:48:40 +0200
Message-ID: <20240927084848.263718-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|MW6PR12MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c7a99d-7e3e-45fb-371c-08dcded153e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C5gRPKnoWcB6/FK7q1ac6XqFrhdt02oDd3xpoGE5quFSwW+fKEzfiSTSzMCk?=
 =?us-ascii?Q?l5QuS17M1u4Xf6yxt2LC9zS8jHTBOEGGm1mt8whJwWdmFIO3AeH3plFp7lSb?=
 =?us-ascii?Q?YvgL6KCFPSu3dMF4UbLhbafQz1DS7trhCEBfSrWVJd7QWxVA3l01wui0L8u4?=
 =?us-ascii?Q?4rQ3SRL0KQY5vrvKMINZu5kwN0zmCaVJcs1toAUWH0ubdQC+AdCh7mk/zhRh?=
 =?us-ascii?Q?AXqhClTXgN6+tZVxjQObUUUffPwCaEE4PNiOTUxjo/7xNsgJsC+pKF4cE5qb?=
 =?us-ascii?Q?fqXVOoXEgxpEVC17BfIl91UzI2NT5DWPpTb4RmcqTud49FoE2HiGHe34wx/1?=
 =?us-ascii?Q?9ECowVqdrXK7SqdK1JBvv0nbJ7fQ62SR4g65xDtLpnZ0Lor9nclvUIHTOYPZ?=
 =?us-ascii?Q?W1cdp8H2qtMjDx5bOKH1xwAZDt2YNpCrLUdGkR08UkTjiDPuFiyoVhOFAH3O?=
 =?us-ascii?Q?lxofMdoUdIE73M/ZNx3wxyJaT5DIBfThUy/sIGj/zCufApPF1u8PQALCa/FA?=
 =?us-ascii?Q?BglVP3AT+lQUDX1CMkc4yfX1hJEjxXw3unorMYxHEluv9rIOQyH7JFy6PpWu?=
 =?us-ascii?Q?2iErBVnXBU4h/Pg0yaFJFZ326jkXJqIPjQNA5e7jmaWT8odTFIIUoGA5b+VQ?=
 =?us-ascii?Q?oC4kOZiDkQQ8I8x+O78fOex17TFYJO9FrK/GXsp+mzPnckg86dH3cZgPHRcx?=
 =?us-ascii?Q?N3zQS4ElaEOaw7CuYk6CMg6joDgUimP3ifGVCcp484L9UulqcnAG9NWOGS3o?=
 =?us-ascii?Q?wvprcbT37yYuqSkiSYiJz9fXhCiR2Xtx8b3oeeKwfU/9ipml7KHt5wGMe6Qu?=
 =?us-ascii?Q?sO9h+LPTwlYf3Pk3gFd6J4nLij7sUCIbIYn/lBZtnQ2LOIPvFMSVLhL6Dfze?=
 =?us-ascii?Q?G1B8w+Pa+a5CiVzHUzp/clsi0Kbado7hnzo+ycq7oSN5DS22+cA1Fo60dgkT?=
 =?us-ascii?Q?kDePeB86qKff60ziSfcjT023hen66yll+IOgNTkkuowQHTM3URRPfdgz1N3H?=
 =?us-ascii?Q?BwWuDJbtM4kzJILR85IRXAewiJw91/V3T2elEuHTR8iHSxKQ1WcxwotpIwZ2?=
 =?us-ascii?Q?2uzNuOiud1MxycAMNlPBHlPCMkND0l/SOBJg07aQurvPe9URDjjls0pP3w2f?=
 =?us-ascii?Q?K7LGsh1WOhDbqV9V3N82xRMBoPAeIsqfS2VXyI6EpbqNqKWfM6jt7jP/fwiK?=
 =?us-ascii?Q?Sz3AQ6IM47dPJvkri7NKkRlOKbunMC4NkIMBdEX25kXnkvIUwSpSpiY2tTsK?=
 =?us-ascii?Q?LLw47p1o14h6jN1UZA0x6mgk3R3bF8rlVJTR+1Y1FLeaS8CUKcuNcD8uheLK?=
 =?us-ascii?Q?CgRJ3s2Qj+efCAnkFnWsVULw7ph9bpjwfTI1Ybn2fygD7TWHswkAPmbXTIP/?=
 =?us-ascii?Q?MFdIDS2K29Mhj29caaUVtk3C63gM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 08:49:41.5786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c7a99d-7e3e-45fb-371c-08dcded153e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8999
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

