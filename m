Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A515C2FF89
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4627A10E581;
	Tue,  4 Nov 2025 08:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ideMB71i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B3710E57C;
 Tue,  4 Nov 2025 08:37:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnRkekE9cCUqo77ib0zZBN4WG8SiBf1QWxDu4ty8s5eVw3P9bf09wwUx7ZIiV/TZbuqhK44WDrsbX+qO6i+O0Nfen2iIxzxMUDByNMp+wbAYsvyFEZAziT/AiVezZo5q7IW1/l/CNz3wJ64PeAsdYvRfVuOoxxjIf5H9MBUb6Pv/tHZRXcwgD/2rYN2z9f80o0K+ldzurF/sAfxwg7uiiJK8CCofdRtojGPyiv6D7kWv4Py5vG14Tgjl/hOGqaiSpUDI5ka5EpSGgM/EmGNEIwyQgKXC3iWaSRbCgj5b0uKduaSSrrUcViekcv6qMRMgHRd5m9bnD7/jMKXLgCNs2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pmt+hhw/cLl/1dJtLkNzzN6ut+XG1sByWx9Mch+pq7g=;
 b=MzRnDPV1mH32KfG7t1j9IHJmLvBBKoxxIchq1s6NwKfb9j2gGd7VRkJhJqOzQfriDSHfwNi6v/Rr3EJYjW90+X9FObMy+oZMadrsLp7ajZt6JPMSweeNZFvRcxHZBGTxaOpzV5TfdLSKNw3H759+OXE7csiUaVPl6Outxt6j1/d832pB5hZZ6VaKwHuIo8w2SqPiHazza6WgB87wb5eVmlVEWRREzf3qesEETgMicYA8FyLPaJ/AcMeX1S/e/DdufYE9T0DhFwVW5Li/gh+xrqbW8Kl7WqipbcHQpVzv/St21zfD5LZs+3905YHle0Jsl2HB5WghWo2rTHLOZWPs4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pmt+hhw/cLl/1dJtLkNzzN6ut+XG1sByWx9Mch+pq7g=;
 b=ideMB71iRZ8cCgN3D8zOWb3/E/UPVJvD/k8nZNrZdIVtRl8FOc0fgsY+kJz+z2JHp/OEICVUUTf/SbYFKJhzUWPTesRLJOkTxlHhuk4YbZsv5hr2hynW/p9FhQ9txUunDcET9peAGMPFwhOauzcKJl515tefL5BpudhoqqkDrXE=
Received: from SJ0PR13CA0189.namprd13.prod.outlook.com (2603:10b6:a03:2c3::14)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:37:06 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::9) by SJ0PR13CA0189.outlook.office365.com
 (2603:10b6:a03:2c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 08:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:37:05 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:37:03 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 15/20] drm/amdgpu: introduce amdgpu_sdma_set_vm_pte_scheds
Date: Tue, 4 Nov 2025 09:35:30 +0100
Message-ID: <20251104083605.13677-16-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: bc627851-fcf7-4862-876f-08de1b7d55c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BsZrri272rE1/w1s0sEzFy5dBtRnzzhDUT+pglUm+aVCJm4AM6hhYOHPSuNY?=
 =?us-ascii?Q?LemJy6fb2pYpNgju7/2FDp+TzOaypoz3htQM9MLtrht62oiutKXr0dYwBEta?=
 =?us-ascii?Q?5mghKs072tsHE6vDDIPnNzfZxE80ttS4yXvO6CTmEBnU8HgqspQJ72fXXFKm?=
 =?us-ascii?Q?8grrHCJEuFPggfwddVWDDWksbJDMa2znpSD5EaMa+DrcWzgSw9STS0bsc6Au?=
 =?us-ascii?Q?d78g+vAN4GWmOVBRIY1/gg/AhmFQV7pcT/9ro8MVHpNHPYwxFXJ15tVOUVMJ?=
 =?us-ascii?Q?VL0gdxbF5vZxMZG9HmjrVCgTByi5XkzTP81fllKSCBHgdx0d5r3jfNDjuy0C?=
 =?us-ascii?Q?IDEkFGEj5eE1nOJL9KIRz3xFTYt5iDf3VdjrJNZLgNP8Vt6G8nmTRyCYK8aw?=
 =?us-ascii?Q?Eop0Ga5biFKDk9k7NXArTJyB2xCMFDoAOqi/BPsVKZ4FSMuZeU8r7iibs4S5?=
 =?us-ascii?Q?C+dYqyTxJgRTr+GzPcVyfZ9dfTTwA47QgDB3BDkkl2Sn1mb7V5dFtLWVHQPD?=
 =?us-ascii?Q?N5umRpPTt7AeWouwiakL2RiRY8oA+SzgSU7PifNOfs6IkbkRFITwLi4vX77C?=
 =?us-ascii?Q?gtqeDg5BEiBF6prMr1APazQd77HuqWePWWURDl9/NK2AgT0IwHdcKJH18ib+?=
 =?us-ascii?Q?xewbP3eoaKbDr9R3jsTMO155e78iynprOgg+TMDxVtChRcNmrfD37LNqK0Cx?=
 =?us-ascii?Q?E+kJFA9N7PLd0bJ4qaSDEVHNlST8xu+Sq8rCyiRvujclFuJ7XQdaW8RDRIJR?=
 =?us-ascii?Q?LmZLNXFtGWQe3IQ75bHAIF7XEgWFBn6WqVucDvYgAm5X7RFHrdWv1FajRbo6?=
 =?us-ascii?Q?cpPT0dSxyLg2ZAaWXM4pIS667QzyfaYILPtEP3i4DI5qXm5Qiv65j2/WCiEv?=
 =?us-ascii?Q?UtHbeTpOAboHs6FrZDtLM858rmHrCfBJH1swygwuqehM8OAL5vaeQ96XbM15?=
 =?us-ascii?Q?cVx2OZNb7LlZ+rQkaetqyybP/9EC1+kBYXChCy0sICN9yh0nTXQDtu01RQ/U?=
 =?us-ascii?Q?i3ZceWDlng30YC37169+b+VQCcS2nczzhIAA+Hc/xorWIjn6x6Enh4VrHG3w?=
 =?us-ascii?Q?LzThqmFLh+OKXC2o4r2EFNpqfIkJk55FU1HKfiM0FhpLvx/tE4z7MhjLcenb?=
 =?us-ascii?Q?aYwk8H5jM/gLBMuFEi2KBJz0jZ5mcwtMgk+vOJ09oy4hhndraT7iMnQG4lbF?=
 =?us-ascii?Q?41XhOL3AirQImEzM9bOSffxjrseb6O+tMB8sASCico+w1MX3yXpx3qrmR720?=
 =?us-ascii?Q?WsU9DhuHnY5IoTebXv6TavxEl2uB7Qf1ewqHXgndqu4jMzDwx3vGPSs1G67I?=
 =?us-ascii?Q?aCMyZNhThOsduOrY92KKoKSTSuz1gzvkdl0kZS03yAIRmfYbtzNjvCr7cz/J?=
 =?us-ascii?Q?o2UP0pbm1OZj61msRO66bqF45P0Z14ehVJRukVw66Ku7cFNV6GAWhjl+qNLw?=
 =?us-ascii?Q?fdHQCyKEauunTxLNKgbRh1pc/cBaZfgm9iokHTj7oqTiYKCFniQ6hbjPHcth?=
 =?us-ascii?Q?QlHYU1axzFHrRn/b4L6viRQ6uIMbX9SsIpxIZ3VGOv8Eh0JS9kNu5vVhKNyw?=
 =?us-ascii?Q?ajTxqrDl/+SrtpC8Y9U=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:37:05.5521 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc627851-fcf7-4862-876f-08de1b7d55c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620
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

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   | 15 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c    |  8 +-------
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   |  8 +-------
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   |  8 +-------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 12 +-----------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 12 +-----------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   |  8 +-------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   |  8 +-------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   |  8 +-------
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   |  8 +-------
 drivers/gpu/drm/amd/amdgpu/si_dma.c      |  8 +-------
 12 files changed, 26 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a9dc13659899..dead938a59a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1614,6 +1614,7 @@ bool amdgpu_device_has_display_hardware(struct amdgpu_device *adev);
 ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
 ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
 void amdgpu_sdma_set_buffer_funcs_rings(struct amdgpu_device *adev);
+void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index bc11e212f08c..b66e41e979ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3210,3 +3210,18 @@ void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
 		task_info->process_name, task_info->tgid,
 		task_info->task.comm, task_info->task.pid);
 }
+
+void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev)
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
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 25040997c367..f2515de65597 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1347,14 +1347,8 @@ static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
 
 static void cik_sdma_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
 	adev->vm_manager.vm_pte_funcs = &cik_sdma_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev);
 }
 
 const struct amdgpu_ip_block_version cik_sdma_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 149356c9346a..4b2c7f75eadb 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -1242,14 +1242,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
 
 static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
 	adev->vm_manager.vm_pte_funcs = &sdma_v2_4_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev);
 }
 
 const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 6b538b6bd18f..fe0c855a803a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1684,14 +1684,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
 
 static void sdma_v3_0_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
 	adev->vm_manager.vm_pte_funcs = &sdma_v3_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			 &adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev);
 }
 
 const struct amdgpu_ip_block_version sdma_v3_0_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 60a97d1a82f2..405ccdfbafad 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2622,18 +2622,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
 
 static void sdma_v4_0_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	struct drm_gpu_scheduler *sched;
-	unsigned i;
-
 	adev->vm_manager.vm_pte_funcs = &sdma_v4_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (adev->sdma.has_page_queue)
-			sched = &adev->sdma.instance[i].page.sched;
-		else
-			sched = &adev->sdma.instance[i].ring.sched;
-		adev->vm_manager.vm_pte_scheds[i] = sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev);
 }
 
 static void sdma_v4_0_get_ras_error_count(uint32_t value,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index d265157bc4e1..1b2868b16859 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -2323,18 +2323,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
 
 static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	struct drm_gpu_scheduler *sched;
-	unsigned i;
-
 	adev->vm_manager.vm_pte_funcs = &sdma_v4_4_2_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (adev->sdma.has_page_queue)
-			sched = &adev->sdma.instance[i].page.sched;
-		else
-			sched = &adev->sdma.instance[i].ring.sched;
-		adev->vm_manager.vm_pte_scheds[i] = sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 127f001ebb5a..af920e100400 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -2081,15 +2081,9 @@ static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
 
 static void sdma_v5_0_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
 	if (adev->vm_manager.vm_pte_funcs == NULL) {
 		adev->vm_manager.vm_pte_funcs = &sdma_v5_0_vm_pte_funcs;
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			adev->vm_manager.vm_pte_scheds[i] =
-				&adev->sdma.instance[i].ring.sched;
-		}
-		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+		amdgpu_sdma_set_vm_pte_scheds(adev);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 78654ac3047d..29f597d56bcb 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -2091,15 +2091,9 @@ static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
 
 static void sdma_v5_2_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
 	if (adev->vm_manager.vm_pte_funcs == NULL) {
 		adev->vm_manager.vm_pte_funcs = &sdma_v5_2_vm_pte_funcs;
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			adev->vm_manager.vm_pte_scheds[i] =
-				&adev->sdma.instance[i].ring.sched;
-		}
-		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+		amdgpu_sdma_set_vm_pte_scheds(adev);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index d1a7eb6e7ce2..03365db70d9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1897,14 +1897,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
 
 static void sdma_v6_0_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
 	adev->vm_manager.vm_pte_funcs = &sdma_v6_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev);
 }
 
 const struct amdgpu_ip_block_version sdma_v6_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 9f15aa1df636..90d291c304d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1839,14 +1839,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
 
 static void sdma_v7_0_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
 	adev->vm_manager.vm_pte_funcs = &sdma_v7_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev);
 }
 
 const struct amdgpu_ip_block_version sdma_v7_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 621c6c17e6dd..4422aaeb99e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -840,14 +840,8 @@ static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
 
 static void si_dma_set_vm_pte_funcs(struct amdgpu_device *adev)
 {
-	unsigned i;
-
 	adev->vm_manager.vm_pte_funcs = &si_dma_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	amdgpu_sdma_set_vm_pte_scheds(adev);
 }
 
 const struct amdgpu_ip_block_version si_dma_ip_block =
-- 
2.43.0

