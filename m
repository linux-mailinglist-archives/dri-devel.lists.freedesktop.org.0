Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE1C7870F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD46010E832;
	Fri, 21 Nov 2025 10:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Al5jV6hU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012013.outbound.protection.outlook.com
 [40.107.200.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FA410E831;
 Fri, 21 Nov 2025 10:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2qRnLgvEzF0SchlTG0LG5uRuFW5VtobbB3VW1uZJWKb87fns/EUzN6vW0evi1n1znYz30CzSwJ70dNqH0m9JBo7U604O1TGYSwB5rJxkNOpaoNp2JZOjrrbnJrzKGMpIpm6DZMoEpOjxWQng3bkI5IxlDkTNqP2J1RJSWO1Aqps0XT7t7BzDll/TffYPQGEIcOmEN83RGgkE8+sGjXNp7ZUARBKlJkzXvV+pWY4dxELItCGpFJj0O/CTqbxACsIaAqOYTHkLcj4EZcndCk/eXwU4//8T6gOZZtjVdRss17uRY+RhPgON0NhfCvaPKdaVrQLFHtixsXCAjQyTpy8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNUx8BQ1JJsXhzyti5kJ8AB0aapQDuXGnS6dSlOYifw=;
 b=YR0IKlXpya+SJp7Nx5FyOilo7Kq5M+m9ugCyLbFR9abnrepUNnLWhGxKPn5rTStWm/T4v5PabujeDxeDfjoBjj3Q6E2L1QAwtXCyj9HYJiAp2UtcsT7MqsrolPpTj1RMs663N8TyHxWL6QpPzs/Xc42Za4tCDQrXbbE/s9bgInxcik5jg3agFrNe+R6zl3rjf8y2S5c+XsAKwz99aqtKap5bsOSK/GwdmpIkwr2rCEkQFw5RUaC0Cfb0UWcQMUjMfZG9nEBYIywM9vG8BlI4mTkxKkTLm9xBOw+Bbq2HHYCEEWGRSfQVbcgvUvyD9ShSIlNbe8WTqciGb9DAIZKRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNUx8BQ1JJsXhzyti5kJ8AB0aapQDuXGnS6dSlOYifw=;
 b=Al5jV6hUoWUT2/5mPRSC+tWM/oHxTyV73e+JAQYsylX7wG2uKupZTzsvzvCfB0lFlLKAeWB70TzlFL8fgN7wftb6VDGfEVzuMV/6MYV9GV5CaKBo9KBVW0DobZN0piUkcOpP4ManghYNHljGnA4FXDXIuvNV43gWoXTr01Vwfzc=
Received: from MN2PR07CA0004.namprd07.prod.outlook.com (2603:10b6:208:1a0::14)
 by CH3PR12MB8546.namprd12.prod.outlook.com (2603:10b6:610:15f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:17:41 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::6) by MN2PR07CA0004.outlook.office365.com
 (2603:10b6:208:1a0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:17:41 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:17:39 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 17/28] drm/amdgpu: introduce amdgpu_sdma_set_vm_pte_scheds
Date: Fri, 21 Nov 2025 11:12:27 +0100
Message-ID: <20251121101315.3585-18-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|CH3PR12MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: ff97a502-34f5-4ad6-5043-08de28e7344d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BzWAxXtoa1NixFph41cI37ASbJ1Fi5yaJEiA1jnG+7z98uxxYnu6gKlhbtRv?=
 =?us-ascii?Q?4hurAGpN2kTbXBRAoVpkasfmTZWOlazzRgwZnpsP0ohm//glfzkvh/7UL4LU?=
 =?us-ascii?Q?lgYZ+Aewll3hmSVbzbrvV4kAptcEpokaWl3iS2bmOY0FE8gXlj/gq2dicb3W?=
 =?us-ascii?Q?0vJp3OdavbZ+wK70lP3gFU3f4eigoAgFqGEMicPqr+Q97dPDy/K3HY7RK2bx?=
 =?us-ascii?Q?HrWtab6JRm0OON+Hf8cQQ9Yjud7DVlrvxWQPD53Oas3leyCXy3OpUXGyVK8Q?=
 =?us-ascii?Q?oZohSye+PrRfXLZZoqmcTDFPzAdmzwLJPHi2LJllyuCC8BJ8AQm7GmhP595C?=
 =?us-ascii?Q?VA32Euja5bagbAdvK9u4ttR7I9cICdl+i74AtlHTG7kNLtiBqLuntQ5/b3Rv?=
 =?us-ascii?Q?o56Ewr5qgnYRqbFiKpxbekQxMvvl/T6nLYWmsWayjDnOTxibNXc22tQ8fjBT?=
 =?us-ascii?Q?MsAPWttfxoF+R1Plx0cRyIHwheK8TaeO3zKv2cvj60BiYV+46LeF1xbpLJXC?=
 =?us-ascii?Q?0uC8aCoNbsnUwGqq8pdxd1sbRyj9/yHu6R5ldPEQ8Mg0TyfDjGnWeMkYQoYs?=
 =?us-ascii?Q?X7KAeU9StL4K1pmvXFvSKzZJ9Y0HcRlPgXjkWwcon3kD1Tu/P+fFgdS8lS1/?=
 =?us-ascii?Q?rUbIRMI46ecg82YmGzgKiFWsVczs2qpC1BVxsFg2HGIwcfFu7E8WEx97SKR5?=
 =?us-ascii?Q?8ekKX8Ejq1q+sOLB9pl91zZP7mBWOae5e5r4ton5Zu1mKXGUv0/IOQAP98X9?=
 =?us-ascii?Q?bnYWyJcSA+Rzo92bcyFe8jURh1XOU6YCF3RPiyXoVoq7LiZ2xtgcq/wssbCR?=
 =?us-ascii?Q?/kpchmBWst2I87jG8diD0BZNPeQbQZVkMq3ijNLfQy/VViwBFrTwnXiyLw6u?=
 =?us-ascii?Q?3fs5fPCVXx7lTEDoidDqzJMYj07VOG3L7ESCDeIu6ziUgwHzKngWGbUvvMOt?=
 =?us-ascii?Q?A2eXz1VxdaZrXnpJGxmI5wPJP+sSgVsJaPIOPZoUiVb75qQ9hC6duBPIqTWX?=
 =?us-ascii?Q?z7FIQjrrD3UkDBXy4RIiHuLVDebyz5GG/cl/f5W/qyOP2MQl2EDTpjImkyDG?=
 =?us-ascii?Q?QDqbE9sCJwQf8e6cgx7K2hMoYySwO4S9nnqN+jmAiumBfFSEqSSAg1clKIfq?=
 =?us-ascii?Q?PxTTbxMfXj+nOddMhT7TKr3nkyYi3xsNX+TzdIHwJxx+DJRSNQ2PbF2CvhBs?=
 =?us-ascii?Q?iV+1Ni1Iwmg7hMqJQq+DR0LAzXSwEiZAc99NDmzAjLxEKUZsl87VnqyBPCgo?=
 =?us-ascii?Q?VKXJI26X1YsPi0asAkLUshZafDwkESgwQAXfKCGcvDGwZWJ2mVcsS46XRYS1?=
 =?us-ascii?Q?MQrRr6r81Gr1UAuT+VZckxdVhRBvyduc4VUtNv7Efdr8wmrplYGZrpx7ktfQ?=
 =?us-ascii?Q?59yUPuWcqdA8kQitNK7pCtea78LlNxn7z8MIs1mBgTDIaGtrH7RopHjtKGpZ?=
 =?us-ascii?Q?TKee9HTfrIcZ2SmRX9E4gm+K416kTK+wgJTw+XHJ+wcwKjEpTOz7yIMFs9G1?=
 =?us-ascii?Q?2iXIbpCoh52KpOSLrI0OxciFGzQohfAWzDGNODwBKj7r3IFjQ7hDs1kNCwWe?=
 =?us-ascii?Q?DtE/7450h9UgUDyHBUI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:17:41.2805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff97a502-34f5-4ad6-5043-08de28e7344d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8546
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

All sdma versions used the same logic, so add a helper and move the
common code to a single place.

---
v2: pass amdgpu_vm_pte_funcs as well
v3: drop all the *_set_vm_pte_funcs one liners
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   | 17 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c    | 31 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   | 31 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   | 31 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 35 ++++++------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 35 ++++++------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 31 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 31 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 29 ++++++--------------
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   | 29 ++++++--------------
 drivers/gpu/drm/amd/amdgpu/si_dma.c      | 31 ++++++---------------
 12 files changed, 105 insertions(+), 228 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 790e84fec949..a50e3c0a4b18 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1612,6 +1612,8 @@ struct dma_fence *amdgpu_device_enforce_isolation(struct amdgpu_device *adev,
 bool amdgpu_device_has_display_hardware(struct amdgpu_device *adev);
 ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
 ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
+void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
+				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 193de267984e..5061d5b0f875 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3228,3 +3228,20 @@ void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
 		task_info->process_name, task_info->tgid,
 		task_info->task.comm, task_info->task.pid);
 }
+
+void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
+				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs)
+{
+	struct drm_gpu_scheduler *sched;
+	int i;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		if (adev->sdma.has_page_queue)
+			sched = &adev->sdma.instance[i].page.sched;
+		else
+			sched = &adev->sdma.instance[i].ring.sched;
+		adev->vm_manager.vm_pte_scheds[i] = sched;
+	}
+	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	adev->vm_manager.vm_pte_funcs = vm_pte_funcs;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 9e8715b4739d..22780c09177d 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -53,7 +53,6 @@ static const u32 sdma_offsets[SDMA_MAX_INSTANCE] =
 static void cik_sdma_set_ring_funcs(struct amdgpu_device *adev);
 static void cik_sdma_set_irq_funcs(struct amdgpu_device *adev);
 static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev);
-static void cik_sdma_set_vm_pte_funcs(struct amdgpu_device *adev);
 static int cik_sdma_soft_reset(struct amdgpu_ip_block *ip_block);
 
 u32 amdgpu_cik_gpu_check_soft_reset(struct amdgpu_device *adev);
@@ -919,6 +918,14 @@ static void cik_enable_sdma_mgls(struct amdgpu_device *adev,
 	}
 }
 
+static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = cik_sdma_vm_copy_pte,
+
+	.write_pte = cik_sdma_vm_write_pte,
+	.set_pte_pde = cik_sdma_vm_set_pte_pde,
+};
+
 static int cik_sdma_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -933,7 +940,7 @@ static int cik_sdma_early_init(struct amdgpu_ip_block *ip_block)
 	cik_sdma_set_ring_funcs(adev);
 	cik_sdma_set_irq_funcs(adev);
 	cik_sdma_set_buffer_funcs(adev);
-	cik_sdma_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &cik_sdma_vm_pte_funcs);
 
 	return 0;
 }
@@ -1337,26 +1344,6 @@ static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = cik_sdma_vm_copy_pte,
-
-	.write_pte = cik_sdma_vm_write_pte,
-	.set_pte_pde = cik_sdma_vm_set_pte_pde,
-};
-
-static void cik_sdma_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &cik_sdma_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version cik_sdma_ip_block =
 {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 92ce580647cd..0090ace49024 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -51,7 +51,6 @@
 
 static void sdma_v2_4_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v2_4_set_irq_funcs(struct amdgpu_device *adev);
 
 MODULE_FIRMWARE("amdgpu/topaz_sdma.bin");
@@ -809,6 +808,14 @@ static void sdma_v2_4_ring_emit_wreg(struct amdgpu_ring *ring,
 	amdgpu_ring_write(ring, val);
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v2_4_vm_copy_pte,
+
+	.write_pte = sdma_v2_4_vm_write_pte,
+	.set_pte_pde = sdma_v2_4_vm_set_pte_pde,
+};
+
 static int sdma_v2_4_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -822,7 +829,7 @@ static int sdma_v2_4_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v2_4_set_ring_funcs(adev);
 	sdma_v2_4_set_buffer_funcs(adev);
-	sdma_v2_4_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v2_4_vm_pte_funcs);
 	sdma_v2_4_set_irq_funcs(adev);
 
 	return 0;
@@ -1232,26 +1239,6 @@ static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v2_4_vm_copy_pte,
-
-	.write_pte = sdma_v2_4_vm_write_pte,
-	.set_pte_pde = sdma_v2_4_vm_set_pte_pde,
-};
-
-static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v2_4_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 2,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 1c076bd1cf73..2526d393162a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -51,7 +51,6 @@
 
 static void sdma_v3_0_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v3_0_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v3_0_set_irq_funcs(struct amdgpu_device *adev);
 
 MODULE_FIRMWARE("amdgpu/tonga_sdma.bin");
@@ -1082,6 +1081,14 @@ static void sdma_v3_0_ring_emit_wreg(struct amdgpu_ring *ring,
 	amdgpu_ring_write(ring, val);
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v3_0_vm_copy_pte,
+
+	.write_pte = sdma_v3_0_vm_write_pte,
+	.set_pte_pde = sdma_v3_0_vm_set_pte_pde,
+};
+
 static int sdma_v3_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1102,7 +1109,7 @@ static int sdma_v3_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v3_0_set_ring_funcs(adev);
 	sdma_v3_0_set_buffer_funcs(adev);
-	sdma_v3_0_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v3_0_vm_pte_funcs);
 	sdma_v3_0_set_irq_funcs(adev);
 
 	return 0;
@@ -1674,26 +1681,6 @@ static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v3_0_vm_copy_pte,
-
-	.write_pte = sdma_v3_0_vm_write_pte,
-	.set_pte_pde = sdma_v3_0_vm_set_pte_pde,
-};
-
-static void sdma_v3_0_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v3_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			 &adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version sdma_v3_0_ip_block =
 {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index f38004e6064e..a35d9951e22a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -129,7 +129,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_4_0[] = {
 
 static void sdma_v4_0_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v4_0_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v4_0_set_irq_funcs(struct amdgpu_device *adev);
 static void sdma_v4_0_set_ras_funcs(struct amdgpu_device *adev);
 
@@ -1751,6 +1750,14 @@ static bool sdma_v4_0_fw_support_paging_queue(struct amdgpu_device *adev)
 	}
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v4_0_vm_copy_pte,
+
+	.write_pte = sdma_v4_0_vm_write_pte,
+	.set_pte_pde = sdma_v4_0_vm_set_pte_pde,
+};
+
 static int sdma_v4_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1769,7 +1776,7 @@ static int sdma_v4_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v4_0_set_ring_funcs(adev);
 	sdma_v4_0_set_buffer_funcs(adev);
-	sdma_v4_0_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_0_vm_pte_funcs);
 	sdma_v4_0_set_irq_funcs(adev);
 	sdma_v4_0_set_ras_funcs(adev);
 
@@ -2615,30 +2622,6 @@ static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
 		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v4_0_vm_copy_pte,
-
-	.write_pte = sdma_v4_0_vm_write_pte,
-	.set_pte_pde = sdma_v4_0_vm_set_pte_pde,
-};
-
-static void sdma_v4_0_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	struct drm_gpu_scheduler *sched;
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v4_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (adev->sdma.has_page_queue)
-			sched = &adev->sdma.instance[i].page.sched;
-		else
-			sched = &adev->sdma.instance[i].ring.sched;
-		adev->vm_manager.vm_pte_scheds[i] = sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 static void sdma_v4_0_get_ras_error_count(uint32_t value,
 					uint32_t instance,
 					uint32_t *sec_count)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index a1443990d5c6..7f77367848d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -104,7 +104,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_4_4_2[] = {
 
 static void sdma_v4_4_2_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v4_4_2_set_irq_funcs(struct amdgpu_device *adev);
 static void sdma_v4_4_2_set_ras_funcs(struct amdgpu_device *adev);
 static void sdma_v4_4_2_update_reset_mask(struct amdgpu_device *adev);
@@ -1347,6 +1346,14 @@ static const struct amdgpu_sdma_funcs sdma_v4_4_2_sdma_funcs = {
 	.soft_reset_kernel_queue = &sdma_v4_4_2_soft_reset_engine,
 };
 
+static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v4_4_2_vm_copy_pte,
+
+	.write_pte = sdma_v4_4_2_vm_write_pte,
+	.set_pte_pde = sdma_v4_4_2_vm_set_pte_pde,
+};
+
 static int sdma_v4_4_2_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1362,7 +1369,7 @@ static int sdma_v4_4_2_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v4_4_2_set_ring_funcs(adev);
 	sdma_v4_4_2_set_buffer_funcs(adev);
-	sdma_v4_4_2_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_4_2_vm_pte_funcs);
 	sdma_v4_4_2_set_irq_funcs(adev);
 	sdma_v4_4_2_set_ras_funcs(adev);
 	return 0;
@@ -2316,30 +2323,6 @@ static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
 		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v4_4_2_vm_copy_pte,
-
-	.write_pte = sdma_v4_4_2_vm_write_pte,
-	.set_pte_pde = sdma_v4_4_2_vm_set_pte_pde,
-};
-
-static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	struct drm_gpu_scheduler *sched;
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v4_4_2_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (adev->sdma.has_page_queue)
-			sched = &adev->sdma.instance[i].page.sched;
-		else
-			sched = &adev->sdma.instance[i].ring.sched;
-		adev->vm_manager.vm_pte_scheds[i] = sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 /**
  * sdma_v4_4_2_update_reset_mask - update  reset mask for SDMA
  * @adev: Pointer to the AMDGPU device structure
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 8ddc4df06a1f..7ce13c5d4e61 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -110,7 +110,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_5_0[] = {
 
 static void sdma_v5_0_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v5_0_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v5_0_set_irq_funcs(struct amdgpu_device *adev);
 static int sdma_v5_0_stop_queue(struct amdgpu_ring *ring);
 static int sdma_v5_0_restore_queue(struct amdgpu_ring *ring);
@@ -1357,6 +1356,13 @@ static const struct amdgpu_sdma_funcs sdma_v5_0_sdma_funcs = {
 	.soft_reset_kernel_queue = &sdma_v5_0_soft_reset_engine,
 };
 
+static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v5_0_vm_copy_pte,
+	.write_pte = sdma_v5_0_vm_write_pte,
+	.set_pte_pde = sdma_v5_0_vm_set_pte_pde,
+};
+
 static int sdma_v5_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1368,7 +1374,7 @@ static int sdma_v5_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v5_0_set_ring_funcs(adev);
 	sdma_v5_0_set_buffer_funcs(adev);
-	sdma_v5_0_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_0_vm_pte_funcs);
 	sdma_v5_0_set_irq_funcs(adev);
 	sdma_v5_0_set_mqd_funcs(adev);
 
@@ -2073,27 +2079,6 @@ static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev)
 	}
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v5_0_vm_copy_pte,
-	.write_pte = sdma_v5_0_vm_write_pte,
-	.set_pte_pde = sdma_v5_0_vm_set_pte_pde,
-};
-
-static void sdma_v5_0_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	if (adev->vm_manager.vm_pte_funcs == NULL) {
-		adev->vm_manager.vm_pte_funcs = &sdma_v5_0_vm_pte_funcs;
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			adev->vm_manager.vm_pte_scheds[i] =
-				&adev->sdma.instance[i].ring.sched;
-		}
-		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-	}
-}
-
 const struct amdgpu_ip_block_version sdma_v5_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 5,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 51101b0aa2fa..98beff18cf28 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -111,7 +111,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_5_2[] = {
 
 static void sdma_v5_2_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v5_2_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v5_2_set_irq_funcs(struct amdgpu_device *adev);
 static int sdma_v5_2_stop_queue(struct amdgpu_ring *ring);
 static int sdma_v5_2_restore_queue(struct amdgpu_ring *ring);
@@ -1248,6 +1247,13 @@ static void sdma_v5_2_ring_emit_reg_write_reg_wait(struct amdgpu_ring *ring,
 	amdgpu_ring_emit_reg_wait(ring, reg1, mask, mask);
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v5_2_vm_copy_pte,
+	.write_pte = sdma_v5_2_vm_write_pte,
+	.set_pte_pde = sdma_v5_2_vm_set_pte_pde,
+};
+
 static int sdma_v5_2_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1259,7 +1265,7 @@ static int sdma_v5_2_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v5_2_set_ring_funcs(adev);
 	sdma_v5_2_set_buffer_funcs(adev);
-	sdma_v5_2_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_2_vm_pte_funcs);
 	sdma_v5_2_set_irq_funcs(adev);
 	sdma_v5_2_set_mqd_funcs(adev);
 
@@ -2084,27 +2090,6 @@ static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev)
 	}
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v5_2_vm_copy_pte,
-	.write_pte = sdma_v5_2_vm_write_pte,
-	.set_pte_pde = sdma_v5_2_vm_set_pte_pde,
-};
-
-static void sdma_v5_2_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	if (adev->vm_manager.vm_pte_funcs == NULL) {
-		adev->vm_manager.vm_pte_funcs = &sdma_v5_2_vm_pte_funcs;
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			adev->vm_manager.vm_pte_scheds[i] =
-				&adev->sdma.instance[i].ring.sched;
-		}
-		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-	}
-}
-
 const struct amdgpu_ip_block_version sdma_v5_2_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 5,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index e3f725bc2f29..c32331b72ba0 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -119,7 +119,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_6_0[] = {
 
 static void sdma_v6_0_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v6_0_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v6_0_set_irq_funcs(struct amdgpu_device *adev);
 static int sdma_v6_0_start(struct amdgpu_device *adev);
 
@@ -1268,6 +1267,13 @@ static void sdma_v6_0_set_ras_funcs(struct amdgpu_device *adev)
 	}
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v6_0_vm_copy_pte,
+	.write_pte = sdma_v6_0_vm_write_pte,
+	.set_pte_pde = sdma_v6_0_vm_set_pte_pde,
+};
+
 static int sdma_v6_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1296,7 +1302,7 @@ static int sdma_v6_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v6_0_set_ring_funcs(adev);
 	sdma_v6_0_set_buffer_funcs(adev);
-	sdma_v6_0_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v6_0_vm_pte_funcs);
 	sdma_v6_0_set_irq_funcs(adev);
 	sdma_v6_0_set_mqd_funcs(adev);
 	sdma_v6_0_set_ras_funcs(adev);
@@ -1889,25 +1895,6 @@ static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v6_0_vm_copy_pte,
-	.write_pte = sdma_v6_0_vm_write_pte,
-	.set_pte_pde = sdma_v6_0_vm_set_pte_pde,
-};
-
-static void sdma_v6_0_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v6_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version sdma_v6_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 6,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 7fee98d37720..9318d23eb71e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -119,7 +119,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_7_0[] = {
 
 static void sdma_v7_0_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v7_0_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v7_0_set_irq_funcs(struct amdgpu_device *adev);
 static int sdma_v7_0_start(struct amdgpu_device *adev);
 
@@ -1253,6 +1252,13 @@ static void sdma_v7_0_ring_emit_reg_write_reg_wait(struct amdgpu_ring *ring,
 	amdgpu_ring_emit_reg_wait(ring, reg1, mask, mask);
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
+	.copy_pte_num_dw = 8,
+	.copy_pte = sdma_v7_0_vm_copy_pte,
+	.write_pte = sdma_v7_0_vm_write_pte,
+	.set_pte_pde = sdma_v7_0_vm_set_pte_pde,
+};
+
 static int sdma_v7_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1283,7 +1289,7 @@ static int sdma_v7_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v7_0_set_ring_funcs(adev);
 	sdma_v7_0_set_buffer_funcs(adev);
-	sdma_v7_0_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v7_0_vm_pte_funcs);
 	sdma_v7_0_set_irq_funcs(adev);
 	sdma_v7_0_set_mqd_funcs(adev);
 
@@ -1831,25 +1837,6 @@ static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
-	.copy_pte_num_dw = 8,
-	.copy_pte = sdma_v7_0_vm_copy_pte,
-	.write_pte = sdma_v7_0_vm_write_pte,
-	.set_pte_pde = sdma_v7_0_vm_set_pte_pde,
-};
-
-static void sdma_v7_0_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v7_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version sdma_v7_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 7,
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 7f18e4875287..b85df997ed49 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -37,7 +37,6 @@ const u32 sdma_offsets[SDMA_MAX_INSTANCE] =
 
 static void si_dma_set_ring_funcs(struct amdgpu_device *adev);
 static void si_dma_set_buffer_funcs(struct amdgpu_device *adev);
-static void si_dma_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void si_dma_set_irq_funcs(struct amdgpu_device *adev);
 
 /**
@@ -473,6 +472,14 @@ static void si_dma_ring_emit_wreg(struct amdgpu_ring *ring,
 	amdgpu_ring_write(ring, val);
 }
 
+static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
+	.copy_pte_num_dw = 5,
+	.copy_pte = si_dma_vm_copy_pte,
+
+	.write_pte = si_dma_vm_write_pte,
+	.set_pte_pde = si_dma_vm_set_pte_pde,
+};
+
 static int si_dma_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -481,7 +488,7 @@ static int si_dma_early_init(struct amdgpu_ip_block *ip_block)
 
 	si_dma_set_ring_funcs(adev);
 	si_dma_set_buffer_funcs(adev);
-	si_dma_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &si_dma_vm_pte_funcs);
 	si_dma_set_irq_funcs(adev);
 
 	return 0;
@@ -830,26 +837,6 @@ static void si_dma_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
-	.copy_pte_num_dw = 5,
-	.copy_pte = si_dma_vm_copy_pte,
-
-	.write_pte = si_dma_vm_write_pte,
-	.set_pte_pde = si_dma_vm_set_pte_pde,
-};
-
-static void si_dma_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &si_dma_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version si_dma_ip_block =
 {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
-- 
2.43.0

