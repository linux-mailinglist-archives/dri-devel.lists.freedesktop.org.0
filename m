Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D037C589E2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DBF10E89C;
	Thu, 13 Nov 2025 16:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vMJHph8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010054.outbound.protection.outlook.com [52.101.85.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A6710E89C;
 Thu, 13 Nov 2025 16:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVDgRL8OIWyHQCTCWTupN2YFHRN6YdEaXv2inp2bvolWPti+Zsf77OY5LTsWwVLiH5WcsVATo7QIBcNgJkOdz0mD5HSV4mWprbXoUB7wM7+6CElYFn56CC7sCZthk1Ot065/irX+K3xLe2qYl3xUIUmnAdZCoen7aaYDW+BJGYk+p7Z4RW45ZDdqSy7c5Cs9qIW3TbtW6s3vyoidFTrgPTTifHxhOvdWpVnIiePetbn7Yiw1TrQ5u+eC5X0icVJTcoSlF3nAamWLeNtMz004/zA+7TOPq6l/PkjKULfuJ670le77KDyTgxA3BWAn1haLxT2EBS5L11rkLe2yIPv22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k62Zm/CESU3z+3bssB7l3iKZCfCJd5cB7pWm/VLjpuE=;
 b=QoRODjwXdIVjxsKrA+Qx7omL23CntJTDKJUYpfkl8GRhPucnJ1tywIGXFtYsWSfj82P1mAxRJPkkleqmvPhHjfcIouZa9LIupioYV6d+bJ/rgZoY6Ey3fON7izSJ0hmXBtsauyXG8wMMAIjs1r96BQgLqhzjrFN/K2W4jVsGRR2z5A0s1usxJTfln3s7GNvzvTnAZbQynvkuuwStf4ock4O0A/wplIiHuqTikeqgeUULP3VLmep3ghRskDIv58l4z2LY7XgjSIJlCl5HACI8uOudErcqmeiXJFqOSglSVci96e13iTJHuYJDe5zpAK1r1+JPoH+OPwpAQXKw2+2ERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k62Zm/CESU3z+3bssB7l3iKZCfCJd5cB7pWm/VLjpuE=;
 b=vMJHph8EYk2gFhf5LkDKJeWvjiiv56Hnaw2gBdWXhlOuKlaUPhAi86KBArYdWeFVdgCRZcbj4o0ubsyO8ixaktEIr1EatP8JY5TfKuCgwZUTx4Cv97h2sMmY4rMNrZGmAu69vR4jvZGAlnYLQaQNB1JMJkXUTD1caP88zl5CH9Y=
Received: from MN2PR08CA0018.namprd08.prod.outlook.com (2603:10b6:208:239::23)
 by MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 16:11:29 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::14) by MN2PR08CA0018.outlook.office365.com
 (2603:10b6:208:239::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:11:29 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:11:28 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 14/20] drm/amdgpu: introduce amdgpu_sdma_set_vm_pte_scheds
Date: Thu, 13 Nov 2025 17:05:55 +0100
Message-ID: <20251113160632.5889-15-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad9dd87-f478-4ccf-196d-08de22cf4e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YVp/TNrblRixm3bU79y6gYxDVRMp5wlwL53PsmRYPoadtYQv+w5Ee4hhqjpd?=
 =?us-ascii?Q?RyHd+zB3jrKOANXC/ApAkJT14k/abazQn1m4IIrTvx+ubnRwdhTo0CCda3NG?=
 =?us-ascii?Q?9qzXidDE37bs+y5j/ertN9op5yRcRsWLZDHnF/wC1nj7Qo20XnSIQNODRjEX?=
 =?us-ascii?Q?cuwBkyHd6zfL9nv7OXzEmq5KSHWFrGRVNwVmeadXfQrxy0nSxQ69lTFTnjKl?=
 =?us-ascii?Q?7gNitbzan+eE+TnrZPhgF+KULdiLq2gMgCcWT4RdnZsnfpCcxx+eLfsxSvgr?=
 =?us-ascii?Q?ML7+ZZ7Onk17KtP7wyadftcHuZ5pRMfCLVCXksLpJB3/fs995rR81yIFD5jz?=
 =?us-ascii?Q?adIBGucZKqhW3wCxJCeYk+UGMo+FCD7auJf4axh1XhE0/diw9FydfdauI+WP?=
 =?us-ascii?Q?xpOghRG6Zr11l6Y4E1fZkiutqgxKboosIf3N5i/YED/GPEJerxvJtFfETmOf?=
 =?us-ascii?Q?e7k4bcNaZSuvB2t9BXOi6SKbucSInh+lGle6gUlvTX3IPEmnIJITcESqEnAC?=
 =?us-ascii?Q?bCLUsPBHIuG8EZBGhh9X4SVawDAtXd/bO6seHMTLt/iNrhtTK1Nx/n+HvGfE?=
 =?us-ascii?Q?bePRNMyGv1XaoUI0zu+O3x2X2/ErJw6NwEeZbBKEfAxfW7ltK4YwQLrz9AAr?=
 =?us-ascii?Q?PjzCi9RUqFd/tSIJ8jETxdWAdjbIWhfiaY3XiRRXK9iPMiYY1LjLLXwJtkTL?=
 =?us-ascii?Q?KHv8SCUju3g/28ItxUKjN/2MhU053xNm4uG1MaGtSlbiYcsD5fe3fHH6kkkM?=
 =?us-ascii?Q?ym1HOkwkYHqafTapxBMqt6pb2pU7a9mvDcpM/6h4KrdpYy+SgIwPoQy6ZBAF?=
 =?us-ascii?Q?K+UZxHjeTfA7A6qbLhcprN01UzqytGAe1AY9YjBnYXvqrqFgFfxRpw4YbDcP?=
 =?us-ascii?Q?9J+gQcOAxRfS6r4th3/vdrs9VW7qYwo7VcbRdjPJN+Z54vxNZyeZj3dVa0YM?=
 =?us-ascii?Q?Egwy0eEGZihmAcOZDVs3A+jJJx7MXRhilcoEwgGzcfsVHo+DRFlC+DCZl+El?=
 =?us-ascii?Q?OIAa52vaeaV8Sk5pcWmvHOrR+Av585VhOcHBkHTxpoXqjKq3l6OrRZmXal0j?=
 =?us-ascii?Q?xInWAMY++TP/QnGwfypjZEi71OqPCJI+r8SUH7tbF/1CYCdt/qgSiiThAjF3?=
 =?us-ascii?Q?AcSFBTwu11sECMdJzOyh4K7IbIyy22U016BN8eLFgZXQUC7oOLcERrQ49c6N?=
 =?us-ascii?Q?2xOEAZcu7uYvfjFvS1ti3WKDEmYAJ+JKY+7ReryqJ5kDutVrcqHENUYB/KAj?=
 =?us-ascii?Q?5l8dwpFIZKIwlU95CO/rsRK+EcxFft1jxKG18TI/7Drl8ZtpUH4KuSxCcjA5?=
 =?us-ascii?Q?Ndm9ZOsuzKFjq+QFOEJwC0aRIotLbvbYg/YJyXTwLa9KuYV059tPGFhylwz6?=
 =?us-ascii?Q?pIbEjJOS07RTpiEMzDw2gdnXVOJy+v2Gk/juHcfDrl5CvbO5mROXUJ39//c4?=
 =?us-ascii?Q?lPCDFjIAGeXYNmFG2IZk87xkgHT3eRJUjtWw7zae3wTYxO1AcREXPIh475Wo?=
 =?us-ascii?Q?ZP01S59VEB8OyVW50qV9IUr8qHtp+rwtdHyj8voxK+zaxTpZn+qSso6AaTYb?=
 =?us-ascii?Q?Xnb8eS6G9azZ7Ppv99A=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:11:29.8026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad9dd87-f478-4ccf-196d-08de22cf4e31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541
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
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   | 17 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c    |  9 +--------
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   |  9 +--------
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   |  9 +--------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 13 +------------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 13 +------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 12 ++----------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 12 ++----------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   |  9 +--------
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   |  9 +--------
 drivers/gpu/drm/amd/amdgpu/si_dma.c      |  9 +--------
 12 files changed, 31 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 50079209c472..3fab3dc9f3e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1613,6 +1613,8 @@ struct dma_fence *amdgpu_device_enforce_isolation(struct amdgpu_device *adev,
 bool amdgpu_device_has_display_hardware(struct amdgpu_device *adev);
 ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
 ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
+void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
+				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index aaa44199e9f4..3d29c3642d1a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3210,3 +3210,20 @@ void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
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
index 9e8715b4739d..5fe162f52c92 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1347,14 +1347,7 @@ static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
 
 static void cik_sdma_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &cik_sdma_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev, &cik_sdma_vm_pte_funcs);
 }
 
 const struct amdgpu_ip_block_version cik_sdma_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 92ce580647cd..63636643db3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -1242,14 +1242,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
 
 static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v2_4_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v2_4_vm_pte_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 1c076bd1cf73..0153626b5df2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1684,14 +1684,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
 
 static void sdma_v3_0_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v3_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			 &adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v3_0_vm_pte_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v3_0_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index f38004e6064e..96a67b30854c 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2625,18 +2625,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
 
 static void sdma_v4_0_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
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
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_0_vm_pte_funcs);
 }
 
 static void sdma_v4_0_get_ras_error_count(uint32_t value,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 36b1ca73c2ed..04dc8a8f4d66 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -2326,18 +2326,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
 
 static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
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
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_4_2_vm_pte_funcs);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 7dc67a22a7a0..19c717f2c602 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -2081,16 +2081,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
 
 static void sdma_v5_0_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
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
+	if (adev->vm_manager.vm_pte_funcs == NULL)
+		amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_0_vm_pte_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v5_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 3bd44c24f692..7a07b8f4e86d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -2091,16 +2091,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
 
 static void sdma_v5_2_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
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
+	if (adev->vm_manager.vm_pte_funcs == NULL)
+		amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_2_vm_pte_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v5_2_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index db6e41967f12..8f8228c7adee 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1897,14 +1897,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
 
 static void sdma_v6_0_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v6_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v6_0_vm_pte_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v6_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 326ecc8d37d2..cf412d8fb0ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1839,14 +1839,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
 
 static void sdma_v7_0_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v7_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v7_0_vm_pte_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v7_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 7f18e4875287..863e00086c30 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -840,14 +840,7 @@ static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
 
 static void si_dma_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &si_dma_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev, &si_dma_vm_pte_funcs);
 }
 
 const struct amdgpu_ip_block_version si_dma_ip_block =
-- 
2.43.0

