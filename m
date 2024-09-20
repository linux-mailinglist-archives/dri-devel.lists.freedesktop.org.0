Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0C797D36B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 11:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2912010E2DD;
	Fri, 20 Sep 2024 09:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yCuZq9Zs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8742610E2DD;
 Fri, 20 Sep 2024 09:10:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUUjBq9MfbRfIcuUvw2UAHzRJRXJfIRajE1uCXhfZ7fv2knXnUUxW6l4wO903QOGMno1ecCgytpqyhGu5EJpodQEOykD3m+0PUMblIEZvGalPuQYjQPyslrlGxwQg3TSL31I5iDcQOjl4blLy/YlqDbYQsleAsOkThcNoGWL6B2yAYfoWuxaCnDNGBhpKE63WHIB+ID/5wlUK5A7OZWJ27FzqdN7QC+nOWh6Stcu8If+krddkP0OoTva7lK12w1O0c8wH6Ta2zn6WMdKN95IPFIBTo+vZcY0nRBopYTwEgAWVexSJ9//mTfR3ib5mQW0h8GUUdFsNG3GOu7TCUmwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhLWwvpA16TjFh0vRsEEdXs/mj4rKCQa3I0Mez4qh6Q=;
 b=uLvp3wmSmACT3xEZ3pTPtCweLucaXzTVRh1KxCxAZ4vUDXjjxjRoNSql44BxXJ8U8MqV1iElSB9HtLyjktJwta5zSiWigyaAM0kZBKYPfGLNKhZfGcS/QblQEL5DLFC2nvr13essnJRfG/NH0nz5v47MzSJGr+jQVxQwS1oq2upxZbiWcdCqdKCUygV2bZYV+aX1c9kDGrxwuX4lJB8/RTBW9VQ/ObWx5jcvLRRleqDqD9aVijbq2lTiZkij7NT5ovExRfzUCEivJfFf+zWzZzedbmz3o+Sbt4tZ6sbm8eY4ml4TzCAYiCplRHxikIKIubEZtQLzcCQTe1wxlAWDAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhLWwvpA16TjFh0vRsEEdXs/mj4rKCQa3I0Mez4qh6Q=;
 b=yCuZq9ZsZLe/t7cSQTtraCCcqRJqweF+3Mwq2+rWlfv8ZMfFq/4jIg+2YxyWH7JVk224feRbIEaJec6WfseYqt6TIqTUWWZuwYOwfrXjonIxuktCZNXke55RpvryNxBxa/FP6mxxwZMs4wAKMRaO0Z/SnKD7Gt/7BS1sDuZ52PE=
Received: from CH0PR13CA0057.namprd13.prod.outlook.com (2603:10b6:610:b2::32)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Fri, 20 Sep
 2024 09:10:02 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::3f) by CH0PR13CA0057.outlook.office365.com
 (2603:10b6:610:b2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Fri, 20 Sep 2024 09:10:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 09:10:01 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Sep
 2024 04:09:59 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 4/6] drm/amdgpu: alloc and init vm::task_info from first
 submit
Date: Fri, 20 Sep 2024 11:06:46 +0200
Message-ID: <20240920090920.1342694-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: b7986ac9-b28d-47c1-6251-08dcd954023d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2+GGZJXd5HzJSMuQKlrzvrYXFsrgIeHCmbpcJZuHkBrwhHMcrlxtD2RLbQQ2?=
 =?us-ascii?Q?rTqJseZ2GYbbI4ne6Lat7cdGHSgXHBm6v/dos9VZge99Pcfro3EZ31ibVTcY?=
 =?us-ascii?Q?pjXprdaTADBQ1Bk1IusNmV9QfWEE/ai1ePHMo4zTHRL2NQZlaWnGB3NE4x4o?=
 =?us-ascii?Q?au49K0Hk0PKOHu4JOq/+/ShiSpOO2EmPM6Q7Um0kSKm25i11yNMzR8LUkg5F?=
 =?us-ascii?Q?5p34BIf1Xvw9bsNSrXfycrwHpqjO6Z8bgQUhdsxogd00l89r7LaEXZutjVsA?=
 =?us-ascii?Q?tSlY5mEFTNxAIyZECS5EMaZCp2EIfIdxoTg3ZOfb6mSZD678HpOQ8NbcK8Nc?=
 =?us-ascii?Q?gDXTXhhxhVvZzYwlb28AxWt6/WIgf7SDsYPNGl2joyWIlsKVytHcQVHdZPq8?=
 =?us-ascii?Q?9+AHUkRz8JbF5pWFHCZq5ortLmaaHFRJfBAZPYGgKuZr/RgyFrvXIme+Kr4E?=
 =?us-ascii?Q?gPLzLEcqxld6Lt9ProNXgtQqmwphtzKQ66jOdEJdq4RDbcWcFsB5tbO7+Il5?=
 =?us-ascii?Q?oAPmw8CZ+xWsEWOrLNoYnswHOGcVYgCel61ImT7ZuNDTjoFUid7/+QIAX7sI?=
 =?us-ascii?Q?MptD1ugP96qHvDBTVbYqfNEWjM2FxxoUWoXVtXJ8t+qeDJns/U+aB92pEy/3?=
 =?us-ascii?Q?PORiuSoqC4ukfhSqEce9JQhatOgpouso0wVcqNyyDMOUtrlPk1SGqecFiUXe?=
 =?us-ascii?Q?DeGZ268wHoz/LkGQZoemHmVhUziD9BisYL62JHZSUh0GkDy7d56kKh4Ioy7E?=
 =?us-ascii?Q?a8jKcHCRxjDX/ALFBEcMhPvl89E0Zc24BLBeOoUXGrWC3Pfweul5qxHtL4nf?=
 =?us-ascii?Q?iCXl6INVWuW/9onhxOFLmjOgerVVBi0qVQ2YDegboDRPT4qOKAA6h4D4KXYv?=
 =?us-ascii?Q?3H96BTmm71evvAi/9Bii71Wa2/zLnhQmadPUZVH+uecF5zLYkK94xxvSbl63?=
 =?us-ascii?Q?MAKQIwzjhPKS9zemOrz/UedNZkxgsTdrwElccbiiz5b6u/hvVGRATP5tgwyY?=
 =?us-ascii?Q?1bsOXryTOwT5W+NxWa+I0iwikic8x9LRdKf3JxWNYoIXDGVtlLRWC+SDmYLO?=
 =?us-ascii?Q?mZUBsFoJOdyfsqn0/gDAkHruFMrzmIcx7Rw8r0JET8cXVFgosIQtaH6ZrXo9?=
 =?us-ascii?Q?OuuJ80ztASFzWKcF+/0HwXn+h3Lz6+y8ozmaBuR30UBcMn+XhoKnjQLg8n/Z?=
 =?us-ascii?Q?WAN0av778k6u7/GbULEN55srP9D3/vmMVhInniBFqTlvHhF7X6jbKMA+0E6O?=
 =?us-ascii?Q?I9220B/FyvoTkvAA9x3mNTDbOK+9dk3psB3jgVMeEUEUlE7ghqDu20JfPvWz?=
 =?us-ascii?Q?15ifZCx7z4TmV5LrwJmhUdonl0Ly9S6r2NAzQ9U0LJ11qkxjl66zXSUiCNtm?=
 =?us-ascii?Q?z+6xhQ0lSKmbqVHIdR5JnATGMrmv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:10:01.7044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7986ac9-b28d-47c1-6251-08dcd954023d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index e20d19ae01b2..690676cab022 100644
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
@@ -2372,8 +2372,12 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
  */
 void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
 {
-	if (!vm->task_info)
-		return;
+	if (!vm->task_info) {
+		if (amdgpu_vm_create_task_info(vm))
+			return;
+
+		get_task_comm(vm->task_info->process_name, current->group_leader);
+	}
 
 	if (vm->task_info->pid == current->pid)
 		return;
@@ -2385,7 +2389,6 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
 		return;
 
 	vm->task_info->tgid = current->group_leader->pid;
-	get_task_comm(vm->task_info->process_name, current->group_leader);
 }
 
 /**
@@ -2482,7 +2485,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		goto error_free_root;
 
-	r = amdgpu_vm_create_task_info(vm);
 	if (r)
 		DRM_DEBUG("Failed to create task info for VM\n");
 
@@ -2608,7 +2610,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 
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

