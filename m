Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1939DC2FF82
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA5110E57B;
	Tue,  4 Nov 2025 08:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EJrO7nFC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013071.outbound.protection.outlook.com
 [40.107.201.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32C810E57C;
 Tue,  4 Nov 2025 08:37:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bS37w5qrBl9YBcp+fdiG/fCnuSslkCjSgd3JLhKIz4WhH2LCQ65nbTi61qsmcpZ4IlV9KD5vuAbviYKb1f/BkUHaVUaBpfRPak3vQ2vliKeaGjuC2l2ypDK1SBCbiw1yCRNOXMcce5YBJIkJFNB88qRxlT4HOQQC5ZY1yLUaY7wLL6ALe3w+QzWBdSajEhTtqhaoRdz+wThaIpozevOlAsZYJgNTJ1Tqi634viv43tmBnikt+6R9zUh2ECgkG4ffqSYEAFqCK88H9BPXaFV+8UIdk4i4N+0/EDXVpZVpSlFKqIEJtveGMDuzD5ea37R7Rlm3+w9WJk27ifLYGiWTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnvGryC8bx3Os/YoAo0aNQyfsB3eAycrhjIdXoIf7Hc=;
 b=kEt8E6FTb+WsVQMKJxSPfGyU6cZRuACvvCDRoqYvbxjTfdoFyxrSAdF0qLSPUs99KgfYCcbyFX2i7Mf7Ln9r3KHE2kxpm7UXkw1gzwO7e71qmR1+bJJTnUzJusYJ5FiX0SHovhgeXaQhGvlCAw7dVF3wsDzBbrwc6HLiaPoge8ghrroCw7yMkvRmOpzHA76/qI9nVpxEPGamjwolR1kVVHs6MqDoyn8LLvSwg5805YhFgf5gsCL/tNfL2gnt72qSmB/H8ujN2dzkwYX9n0aPY195pvdYrPIfod5v+UdIdJpzb0/xaNuNPDMUdtChkB/sB0R94s/Gj93d2bA7hCLfKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnvGryC8bx3Os/YoAo0aNQyfsB3eAycrhjIdXoIf7Hc=;
 b=EJrO7nFCJBWADUQALlAwVEgC7C5Xd9wiPAYEWFP5XJA+qPs+GV/vum/vFvM0XujwHCxf2u+nsEJ3M46kldseghxBw726VNDvDvaRD3VZfWMbyP6KybtS/pgNOs6U9tXCCzJkQwn9LSbqZOdrTDwFnUIRI/9tyTd3ydNY16LaqYc=
Received: from SJ0PR03CA0089.namprd03.prod.outlook.com (2603:10b6:a03:331::34)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:37:02 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::ed) by SJ0PR03CA0089.outlook.office365.com
 (2603:10b6:a03:331::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:37:02 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:37:00 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 14/20] drm/amdgpu: pass all the sdma rings to amdgpu_mman
Date: Tue, 4 Nov 2025 09:35:29 +0100
Message-ID: <20251104083605.13677-15-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 9170b2eb-51b5-46cf-b32b-08de1b7d53f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ci601XBdd0+YAFO8Q5svZtkGXSMVq3iUpJ58SGv7eV8rfeAHOSzUAP2MktMU?=
 =?us-ascii?Q?nlrW8drGL5jRHSM0chrFq31hHxEgkdILA8SLt4xFG1LjfNTq/0scG9bnHBaN?=
 =?us-ascii?Q?fT6ot3MpNC5iU19TbM1dNc8pYO3lTXZb1pSVcAHC6Qa9Vc+lAuZJg2TKyqUj?=
 =?us-ascii?Q?VfiLATxXqRtJJ0/M64aI06OmQ6OUdcs8JSJpsbF14Cosqr+/xaIV69Q4oeI/?=
 =?us-ascii?Q?im+hc7kCs047MeQp39cHgHpr1t3cpXFAYUUhCAtyX1ckKW7FjSIwAt54Sxv2?=
 =?us-ascii?Q?r1gAjMgaTQzbtWH07Ft1j77P2gbhu4H8+U2NgBgZ+yunXVUpZuDBVnDwVhd6?=
 =?us-ascii?Q?E/Gu+JR21mOmBa4kdP7ZeARBudXRg4oSdxqPj55i2uNCtM83u2F/Bl9krzy3?=
 =?us-ascii?Q?nqLtW9F87TO/Zvs+qmKvfOGE5w+5+/FS+UeqgXq/GbTnz97b/NCg7SbxlpYL?=
 =?us-ascii?Q?4UeqLk0pwIcrvJx3TrVyl0Py8Q8ppLWMFa++2AKZg/Xw7ExYxj1hL7W1xzxw?=
 =?us-ascii?Q?cuZNTyN7Tjq4pJLnmHxu80FL0eAQt5sJftTuhg29cPO+jp4GAt/Bp2hMRhgs?=
 =?us-ascii?Q?kW8BX1OkCUPTR62Qwdf5ZeqD+v8TSXJjefMXQXfrLyMTtxZZ7KYY1nI7I72m?=
 =?us-ascii?Q?RojljVTMwU+MDTAF1zxDP0VLuO/7Eqd3LXZSul5pccTM67U6nO6B4ZIfQNc9?=
 =?us-ascii?Q?t8a8ButnJ/DmysMEGmse8jMSEhzk6d+FvscOn0CYAUM6ygQILr6Sn/9eySwV?=
 =?us-ascii?Q?wnWKSaozgzUbBEaLBYh3QTNLPurG7ZNumlSq33O7Ph4p3kRjzUoBVUQ3VAr5?=
 =?us-ascii?Q?vRbazMUURIV/rl4I3XoHwvZONWHPNvMunZ70gCbzoM30+fnO+31x8KROjlkH?=
 =?us-ascii?Q?8XyqQnCjjIbm0YtBq+jKt2gQajGzvz1NRcR51Fh/VzuoYppTm5z9CkVu43wg?=
 =?us-ascii?Q?fP/vNbDNr9P2koWgm2S37C3qXibx6upoEtdW2FrZ0e9Hdy8Om1dzyG0uDLj+?=
 =?us-ascii?Q?5BaNs4/vG91GZTHEYJkGQlGfubv3Ulq/2vgOtPfRs0V7LwSIM7IKG8i4nWMO?=
 =?us-ascii?Q?wGgpN3FEiaMz4re//i6RgmhTkm3RN4jKkpyMtmXu49Hu8F83UMiQj/VonyGd?=
 =?us-ascii?Q?+D4byIyUU/cAEVz/v8uTWycW7i1pBeJeM/flzS1yyjApyKL0YpIxQtCApOTE?=
 =?us-ascii?Q?C4F9x2rX0SCVSgx0UotiGec/t4VROmH7lo5z+zQk4OOxzDAIHoVxhivhQYcS?=
 =?us-ascii?Q?Eds6jPXd6YpB8vOHZ0jBtd3RlBM2UR9H4FuDXneBW5z8/ELCvU67zq6WUWP1?=
 =?us-ascii?Q?2s6jcRBtB19UfeQF1qX21Fz33N8foVQzSRKFeq/CG7RAaM/OMlWsk2kGH0G0?=
 =?us-ascii?Q?kS4pChhKuj7d1JDZcu9edtNKqFf8k4NnGLyjFl909kU5XcntK2Ol7I834rWO?=
 =?us-ascii?Q?F9tKgV7Hdm8KmjZZI2o1pThmnYH4WkFY1hGFCvqfZ7WIGNZSKPveUzqLfn2F?=
 =?us-ascii?Q?yLzNLZCV/AlGjJoC2dkRYKVWO74qo6qVTDut7CWtUIheSlGXfJbhio6kDOeu?=
 =?us-ascii?Q?X7sHDlqE7kj9nifGpvg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:37:02.5069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9170b2eb-51b5-46cf-b32b-08de1b7d53f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
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

This will allow the use of all of them for clear/fill buffer
operations.
Since the code is the same for all sdma versions, add a new
helper amdgpu_sdma_set_buffer_funcs_rings to set buffer_funcs_rings
based on the number of sdma instances.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  8 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 22 ++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 ++-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  5 +----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  5 +----
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  2 +-
 17 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 50079209c472..a9dc13659899 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1613,6 +1613,7 @@ struct dma_fence *amdgpu_device_enforce_isolation(struct amdgpu_device *adev,
 bool amdgpu_device_has_display_hardware(struct amdgpu_device *adev);
 ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
 ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
+void amdgpu_sdma_set_buffer_funcs_rings(struct amdgpu_device *adev);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index b59040a8771f..7147ac477996 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -37,7 +37,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 
 	stime = ktime_get();
 	for (i = 0; i < n; i++) {
-		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+		struct amdgpu_ring *ring = adev->mman.buffer_funcs_rings[0];
 		r = amdgpu_copy_buffer(ring, &adev->mman.default_entity.base,
 				       saddr, daddr, size, NULL, &fence,
 				       false, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b92234d63562..34e9e898568f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3303,7 +3303,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	if (adev->mman.buffer_funcs_ring->sched.ready)
+	if (adev->mman.buffer_funcs_rings[0]->sched.ready)
 		amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	/* Don't init kfd if whole hive need to be reset during init */
@@ -4143,7 +4143,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
 
 	r = amdgpu_device_ip_resume_phase2(adev);
 
-	if (adev->mman.buffer_funcs_ring->sched.ready)
+	if (adev->mman.buffer_funcs_rings[0]->sched.ready)
 		amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	if (r)
@@ -4493,7 +4493,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	adev->num_rings = 0;
 	RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
 	adev->mman.buffer_funcs = NULL;
-	adev->mman.buffer_funcs_ring = NULL;
+	adev->mman.num_buffer_funcs_rings = 0;
 	adev->vm_manager.vm_pte_funcs = NULL;
 	adev->vm_manager.vm_pte_num_scheds = 0;
 	adev->gmc.gmc_funcs = NULL;
@@ -5965,7 +5965,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
-				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
+				if (tmp_adev->mman.buffer_funcs_rings[0]->sched.ready)
 					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
 
 				r = amdgpu_device_ip_resume_phase3(tmp_adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 2713dd51ab9a..e21ab1542298 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -651,7 +651,7 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
 void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 			      uint32_t vmhub, uint32_t flush_type)
 {
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring = adev->mman.buffer_funcs_rings[0];
 	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
 	struct dma_fence *fence;
 	struct amdgpu_job *job;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c3a88574f143..47eaab9350ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -308,7 +308,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 				      struct dma_resv *resv,
 				      struct dma_fence **f)
 {
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring = adev->mman.buffer_funcs_rings[0];
 	struct amdgpu_res_cursor src_mm, dst_mm;
 	struct dma_fence *fence = NULL;
 	int r = 0;
@@ -1530,7 +1530,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
 				PAGE_SIZE, 0);
 
-	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
+	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_rings[0], &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
 
 	fence = amdgpu_job_submit(job);
@@ -2200,7 +2200,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		struct amdgpu_ring *ring;
 		struct drm_gpu_scheduler *sched;
 
-		ring = adev->mman.buffer_funcs_ring;
+		ring = adev->mman.buffer_funcs_rings[0];
 		sched = &ring->sched;
 		r = drm_sched_entity_init(&adev->mman.default_entity.base,
 					  DRM_SCHED_PRIORITY_KERNEL, &sched,
@@ -2433,7 +2433,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring = adev->mman.buffer_funcs_rings[0];
 	struct amdgpu_ttm_entity *entity;
 	struct amdgpu_res_cursor cursor;
 	u64 addr;
@@ -2506,7 +2506,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 		       u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring = adev->mman.buffer_funcs_rings[0];
 	struct dma_fence *fences[TTM_FENCES_MAX_SLOT_COUNT] = {};
 	struct dma_fence *fence = NULL;
 	struct dma_resv *resv = NULL;
@@ -2645,6 +2645,18 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
 	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
 }
 
+void amdgpu_sdma_set_buffer_funcs_rings(struct amdgpu_device *adev)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
+	int i;
+
+	for (i = 0; i < adev->sdma.num_instances; i++)
+		adev->mman.buffer_funcs_rings[i] = &adev->sdma.instance[i].ring;
+
+	adev->mman.num_buffer_funcs_rings = hub->sdma_invalidation_workaround ?
+		1 : adev->sdma.num_instances;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static int amdgpu_ttm_page_pool_show(struct seq_file *m, void *unused)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index c3df9d24fb96..d7fee371b814 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -66,7 +66,8 @@ struct amdgpu_mman {
 
 	/* buffer handling */
 	const struct amdgpu_buffer_funcs	*buffer_funcs;
-	struct amdgpu_ring			*buffer_funcs_ring;
+	struct amdgpu_ring			*buffer_funcs_rings[AMDGPU_MAX_RINGS];
+	u32					num_buffer_funcs_rings;
 	bool					buffer_funcs_enabled;
 
 	struct mutex				gtt_window_lock;
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 9e8715b4739d..25040997c367 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1334,7 +1334,7 @@ static const struct amdgpu_buffer_funcs cik_sdma_buffer_funcs = {
 static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev)
 {
 	adev->mman.buffer_funcs = &cik_sdma_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_rings(adev);
 }
 
 static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 92ce580647cd..149356c9346a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -1229,7 +1229,7 @@ static const struct amdgpu_buffer_funcs sdma_v2_4_buffer_funcs = {
 static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev)
 {
 	adev->mman.buffer_funcs = &sdma_v2_4_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_rings(adev);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 1c076bd1cf73..6b538b6bd18f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1671,7 +1671,7 @@ static const struct amdgpu_buffer_funcs sdma_v3_0_buffer_funcs = {
 static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
 	adev->mman.buffer_funcs = &sdma_v3_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_rings(adev);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index f38004e6064e..60a97d1a82f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2609,10 +2609,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_0_buffer_funcs = {
 static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
 	adev->mman.buffer_funcs = &sdma_v4_0_buffer_funcs;
-	if (adev->sdma.has_page_queue)
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
-	else
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_rings(adev);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 36b1ca73c2ed..d265157bc4e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -2310,10 +2310,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_4_2_buffer_funcs = {
 static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
 {
 	adev->mman.buffer_funcs = &sdma_v4_4_2_buffer_funcs;
-	if (adev->sdma.has_page_queue)
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
-	else
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_rings(adev);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 7dc67a22a7a0..127f001ebb5a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -2068,7 +2068,7 @@ static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
 	if (adev->mman.buffer_funcs == NULL) {
 		adev->mman.buffer_funcs = &sdma_v5_0_buffer_funcs;
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+		amdgpu_sdma_set_buffer_funcs_rings(adev);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 3bd44c24f692..78654ac3047d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -2078,7 +2078,7 @@ static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev)
 {
 	if (adev->mman.buffer_funcs == NULL) {
 		adev->mman.buffer_funcs = &sdma_v5_2_buffer_funcs;
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+		amdgpu_sdma_set_buffer_funcs_rings(adev);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index db6e41967f12..d1a7eb6e7ce2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1885,7 +1885,7 @@ static const struct amdgpu_buffer_funcs sdma_v6_0_buffer_funcs = {
 static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
 	adev->mman.buffer_funcs = &sdma_v6_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_rings(adev);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 326ecc8d37d2..9f15aa1df636 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1827,7 +1827,7 @@ static const struct amdgpu_buffer_funcs sdma_v7_0_buffer_funcs = {
 static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
 	adev->mman.buffer_funcs = &sdma_v7_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_rings(adev);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 7f18e4875287..621c6c17e6dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -827,7 +827,7 @@ static const struct amdgpu_buffer_funcs si_dma_buffer_funcs = {
 static void si_dma_set_buffer_funcs(struct amdgpu_device *adev)
 {
 	adev->mman.buffer_funcs = &si_dma_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_rings(adev);
 }
 
 static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 5daacb816cf7..852b9df0a0dc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -129,7 +129,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 			     struct dma_fence **mfence)
 {
 	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring = adev->mman.buffer_funcs_rings[0];
 	struct amdgpu_ttm_entity *entity;
 	u64 gart_s, gart_d;
 	struct dma_fence *next;
-- 
2.43.0

