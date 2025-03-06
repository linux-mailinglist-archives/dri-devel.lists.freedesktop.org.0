Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61573A553F9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C88F10EA4E;
	Thu,  6 Mar 2025 18:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PTz3C3ge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F01010EA4E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 18:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrDUTjsHK9wUyI4zEyV/vDASHWApZoq+zXBAkX9ttPeQu/LRZRLyhmQkce9rJ2NcbW+pUlTBXshtT/T8ge09mXnYWTrD6ilaO69Kt7SzJD0DTm9N5GaFH7b5yY3evOQoSXgz4QP1A2tnauP+6BTMENPSK1TB9Y7Ua6AV4RoWQnjfRlhZoEUX6Fl7X9pFnVKrk3rEc6aNvDIvlHE09w3qiQAFl3dTcyg9H9a0Lc4nNNzLgl/u0bPhpeG2thSKxMcWqtOiFqdONM46lR8iqmsgUkpFBhPSPZkrMN8fdy1cJetk6gvgmutOJQPyXXPcy1yctTpcapuS1aCJyf6SOnqqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCELzq/NgO7QRgDVHKFGM0oL7TSob1oiiNtlARsLqM8=;
 b=o/5w7gXmSN1oQZrKhGX7Zzy+Wza461h77c6TAb6y72oT0NKFVHPqD6D+ebAuBjuITwXVruLQ5GHyziEvGMHceuegZJ8ELAiy9KHTOu72Atc5h+9JkFwF9xEofKQnBVGBQht9ueEOlQk8Jbtjrox3QJGOt6e2pbhEAhUyttq936xAd8Dtkuq2WYGWr2LYz+7qCeWMBd344fAv9V/RAdmtRvkXHOrFyDERcX/mNbbNDbwl3WH0Vv8oLsy1GYMB7PrzupH0WmrZPXoO2/U0j8nldACn/Kbav8e3KhOjxJJ/X8FJr+62Gp6gUJiLXWI1U6d8+WEj9bZdDrcMqO0H1eLA4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCELzq/NgO7QRgDVHKFGM0oL7TSob1oiiNtlARsLqM8=;
 b=PTz3C3gelaYqfpRdOOJB6TNwtr0sM1/zoy01L3vefNRPBdxSFVxbCmaJRKnbRnMihz9jgiqzLxtTewPwVq1qYQVXPjAxd+wUbUWUZStpPgGOnZdMBL39psLGaoEzycGVl+3HPIO6bEk2aRxPwQrHXfH3Vi/xMmRW6TY3kdfvJEA=
Received: from SJ0PR03CA0153.namprd03.prod.outlook.com (2603:10b6:a03:338::8)
 by MW6PR12MB8957.namprd12.prod.outlook.com (2603:10b6:303:23a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 18:03:52 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::62) by SJ0PR03CA0153.outlook.office365.com
 (2603:10b6:a03:338::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Thu,
 6 Mar 2025 18:03:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 18:03:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 12:03:51 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 12:03:51 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 12:03:50 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <mario.limonciello@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V1] accel/amdxdna: Add BO import and export
Date: Thu, 6 Mar 2025 10:03:34 -0800
Message-ID: <20250306180334.3843850-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|MW6PR12MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e37c32d-b11a-42eb-e892-08dd5cd94101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S76EgRwBG31kRn7hB983LhUBayalIl+cQUYG4Jmc6MA3FfcRBdqGBBzC5zDR?=
 =?us-ascii?Q?Pofa6zLYBxHhyHN9bQqcNYoDAGEBhtdY3g78z8wmivuwpzVb8vtRk8lcvFz6?=
 =?us-ascii?Q?aygUUU5NtcvM6lDrwj5Kjk84buhOU+uQ2XvHjUA8Dnlwl57FI8NHrcAHC1cm?=
 =?us-ascii?Q?mDVvMU5CDAL/VkAuq6i56nx0ja7PuptsxX8VU0FS/505GETReqccaGOBcIYm?=
 =?us-ascii?Q?5El3X7jGnMa9t6wSZVPHvmR5bLNtZGiATPS6xBzMRTQGLzX6fnVi3W6rE4x6?=
 =?us-ascii?Q?yD7NcG6L6D4AR/eEkhOHXWYzCMHiMHW+oHjtSXhteHfdXB12A8527dYMQxlF?=
 =?us-ascii?Q?xAFSfnpI2QChFeP2d62K5Mzwg2UYR7JApwoBcOcKALPoj9xSi7oxgjm8ZDDZ?=
 =?us-ascii?Q?KKQC72l9atUZYdxmxd6TsJQ4IYsnVORWi4nQ6D95YP9Ye+/kJ277ndY9Uo8J?=
 =?us-ascii?Q?I46Tt8OiYkVq9Ik7vzyGr0WQmE/P4/yVRbELZXiI/svN9uJle58edTwCVzYc?=
 =?us-ascii?Q?rFsGYpX3jXuCGSkGO3N81pV4yTnsoEdC57M5hCKgSSdW1WaAJr11JvAsj41S?=
 =?us-ascii?Q?pXPKTzaG7LM39dTxSp+f4Jt8BLw0BKyoLJ8BSIMyMefqzwfMq1yOyTxrqGTn?=
 =?us-ascii?Q?xtZwVef8MEf9WgF7Il4OvWyqIBm5H9wh5k9ToASampZgbwEnnvbe9Efkfpbc?=
 =?us-ascii?Q?dhpArNRsDe/HouDSRzkZCY6zZICbg8YqgcigSPrzfguK1YSCKH0Fi/9c6jJl?=
 =?us-ascii?Q?dBvuH1XYjMPBe8Mp4spRv+v8jOVxJHmYdXEjojQb5nJ6+VcUzYjkTG1QD47y?=
 =?us-ascii?Q?/R4UMolLYCNQ6K27c5/OXlr/7P5ijexNtVrRXAfgj9VXZQfIDNKuiZIYnHgG?=
 =?us-ascii?Q?u5IVdZPFdVJ5ZEWPWy0TvNMJr4aROMDq4qPxcBde4XPfY2VXi0hMrmOlAo4s?=
 =?us-ascii?Q?ty/1Oyez2/tyI7T/Q7DTg0J23see1okd12VjmxaTNrXzbpid6WsOIRd0zHGd?=
 =?us-ascii?Q?sGIn7EXod5hILfHPq/KwAgyunjr2GBRVJZt+gbvOF3LcokBnvcph2TZA2GSz?=
 =?us-ascii?Q?OxPWLOdcLXQ8jM83mqPL77S0oLUFdYp+AdkOwXIXde+hbzTWV9iQqnby784+?=
 =?us-ascii?Q?hu2SEeOXYKQWjb4fDEhHosUbDfNbM+x0jN4bP6fBl7qmUySCAsMx5AywMwWK?=
 =?us-ascii?Q?himvSf3UbdLYp/n4ydC+3AdYVz/UqujNhDEy2bGHN+iIA3Y5Tzojf+y4cwRf?=
 =?us-ascii?Q?IgaYzQcbSWVXIdMBBCR+iZHQ0DJFkiqJFOp4UCFR9cExCAboVh8nEEV7VgFq?=
 =?us-ascii?Q?N9gQYJXzDpNyj0ilk9BbzxBmLzz29m5xjoAOHqR3RS7WG8Pz6wX01QxoMK/o?=
 =?us-ascii?Q?+A8WwQ5srGHKq2CGDlYuqfMgdETDDojNLBR09SIZvBscL6bbYztLQ7OT6il5?=
 =?us-ascii?Q?eLRtUKqvKPnQTsjRi1uU8Um4OVcnUO5Tkx8zb1XH+8GE4qVQPtxnfFNysX4R?=
 =?us-ascii?Q?rav9l4AV43JXnUE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 18:03:52.3217 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e37c32d-b11a-42eb-e892-08dd5cd94101
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8957
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

Add amdxdna_gem_prime_export() and amdxdna_gem_prime_import() for BO
import and export. Register mmu notifier for imported BO as well. When
MMU_NOTIFIER_UNMAP event is received, queue work to remove the notifier.

The same BO could be mapped multiple times if it is exported and imported
by an application. Use a link list to track VMAs the BO been mapped.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/TODO              |   1 -
 drivers/accel/amdxdna/aie2_ctx.c        |  65 +++--
 drivers/accel/amdxdna/amdxdna_gem.c     | 320 ++++++++++++++++++++----
 drivers/accel/amdxdna/amdxdna_gem.h     |  21 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  11 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   2 +
 6 files changed, 341 insertions(+), 79 deletions(-)

diff --git a/drivers/accel/amdxdna/TODO b/drivers/accel/amdxdna/TODO
index 5119bccd1917..ad8ac6e315b6 100644
--- a/drivers/accel/amdxdna/TODO
+++ b/drivers/accel/amdxdna/TODO
@@ -1,3 +1,2 @@
-- Add import and export BO support
 - Add debugfs support
 - Add debug BO support
diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 00d215ac866e..e04549f64d69 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -758,27 +758,42 @@ int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *bu
 static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 {
 	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
-	struct mm_struct *mm = abo->mem.notifier.mm;
-	struct hmm_range range = { 0 };
+	struct amdxdna_umap *mapp;
 	unsigned long timeout;
+	struct mm_struct *mm;
+	bool found;
 	int ret;
 
-	XDNA_INFO_ONCE(xdna, "populate memory range %llx size %lx",
-		       abo->mem.userptr, abo->mem.size);
-	range.notifier = &abo->mem.notifier;
-	range.start = abo->mem.userptr;
-	range.end = abo->mem.userptr + abo->mem.size;
-	range.hmm_pfns = abo->mem.pfns;
-	range.default_flags = HMM_PFN_REQ_FAULT;
+	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+again:
+	found = false;
+	down_write(&xdna->notifier_lock);
+	list_for_each_entry(mapp, &abo->mem.umap_list, node) {
+		if (mapp->invalid) {
+			found = true;
+			break;
+		}
+	}
 
-	if (!mmget_not_zero(mm))
+	if (!found) {
+		abo->mem.map_invalid = false;
+		up_write(&xdna->notifier_lock);
+		return 0;
+	}
+	kref_get(&mapp->refcnt);
+	up_write(&xdna->notifier_lock);
+
+	XDNA_DBG(xdna, "populate memory range %lx %lx",
+		 mapp->vma->vm_start, mapp->vma->vm_end);
+	mm = mapp->notifier.mm;
+	if (!mmget_not_zero(mm)) {
+		amdxdna_umap_put(mapp);
 		return -EFAULT;
+	}
 
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
-again:
-	range.notifier_seq = mmu_interval_read_begin(&abo->mem.notifier);
+	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
 	mmap_read_lock(mm);
-	ret = hmm_range_fault(&range);
+	ret = hmm_range_fault(&mapp->range);
 	mmap_read_unlock(mm);
 	if (ret) {
 		if (time_after(jiffies, timeout)) {
@@ -786,21 +801,27 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 			goto put_mm;
 		}
 
-		if (ret == -EBUSY)
+		if (ret == -EBUSY) {
+			amdxdna_umap_put(mapp);
 			goto again;
+		}
 
 		goto put_mm;
 	}
 
-	down_read(&xdna->notifier_lock);
-	if (mmu_interval_read_retry(&abo->mem.notifier, range.notifier_seq)) {
-		up_read(&xdna->notifier_lock);
+	down_write(&xdna->notifier_lock);
+	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
+		up_write(&xdna->notifier_lock);
+		amdxdna_umap_put(mapp);
 		goto again;
 	}
-	abo->mem.map_invalid = false;
-	up_read(&xdna->notifier_lock);
+	mapp->invalid = false;
+	up_write(&xdna->notifier_lock);
+	amdxdna_umap_put(mapp);
+	goto again;
 
 put_mm:
+	amdxdna_umap_put(mapp);
 	mmput(mm);
 	return ret;
 }
@@ -908,10 +929,6 @@ void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo,
 	struct drm_gem_object *gobj = to_gobj(abo);
 	long ret;
 
-	down_write(&xdna->notifier_lock);
-	abo->mem.map_invalid = true;
-	mmu_interval_set_seq(&abo->mem.notifier, cur_seq);
-	up_write(&xdna->notifier_lock);
 	ret = dma_resv_wait_timeout(gobj->resv, DMA_RESV_USAGE_BOOKKEEP,
 				    true, MAX_SCHEDULE_TIMEOUT);
 	if (!ret || ret == -ERESTARTSYS)
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 606433d73236..abd7f9c99442 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -9,7 +9,10 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/gpu_scheduler.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-direct.h>
 #include <linux/iosys-map.h>
+#include <linux/pagemap.h>
 #include <linux/vmalloc.h>
 
 #include "amdxdna_ctx.h"
@@ -18,6 +21,8 @@
 
 #define XDNA_MAX_CMD_BO_SIZE	SZ_32K
 
+MODULE_IMPORT_NS("DMA_BUF");
+
 static int
 amdxdna_gem_insert_node_locked(struct amdxdna_gem_obj *abo, bool use_vmap)
 {
@@ -94,18 +99,28 @@ static bool amdxdna_hmm_invalidate(struct mmu_interval_notifier *mni,
 				   const struct mmu_notifier_range *range,
 				   unsigned long cur_seq)
 {
-	struct amdxdna_gem_obj *abo = container_of(mni, struct amdxdna_gem_obj,
-						   mem.notifier);
-	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+	struct amdxdna_umap *mapp = container_of(mni, struct amdxdna_umap, notifier);
+	struct amdxdna_gem_obj *abo = mapp->abo;
+	struct amdxdna_dev *xdna;
 
-	XDNA_DBG(xdna, "Invalid range 0x%llx, 0x%lx, type %d",
-		 abo->mem.userptr, abo->mem.size, abo->type);
+	xdna = to_xdna_dev(to_gobj(abo)->dev);
+	XDNA_DBG(xdna, "Invalidating range 0x%lx, 0x%lx, type %d",
+		 mapp->vma->vm_start, mapp->vma->vm_end, abo->type);
 
 	if (!mmu_notifier_range_blockable(range))
 		return false;
 
+	down_write(&xdna->notifier_lock);
+	abo->mem.map_invalid = true;
+	mapp->invalid = true;
+	mmu_interval_set_seq(&mapp->notifier, cur_seq);
+	up_write(&xdna->notifier_lock);
+
 	xdna->dev_info->ops->hmm_invalidate(abo, cur_seq);
 
+	if (range->event == MMU_NOTIFY_UNMAP)
+		queue_work(xdna->notifier_wq, &mapp->hmm_unreg_work);
+
 	return true;
 }
 
@@ -113,104 +128,257 @@ static const struct mmu_interval_notifier_ops amdxdna_hmm_ops = {
 	.invalidate = amdxdna_hmm_invalidate,
 };
 
-static void amdxdna_hmm_unregister(struct amdxdna_gem_obj *abo)
+static void amdxdna_hmm_unregister(struct amdxdna_gem_obj *abo,
+				   struct vm_area_struct *vma)
 {
 	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+	struct amdxdna_umap *mapp;
 
-	if (!xdna->dev_info->ops->hmm_invalidate)
-		return;
+	down_read(&xdna->notifier_lock);
+	list_for_each_entry(mapp, &abo->mem.umap_list, node) {
+		if (mapp->vma == vma) {
+			queue_work(xdna->notifier_wq, &mapp->hmm_unreg_work);
+			break;
+		}
+	}
+	up_read(&xdna->notifier_lock);
+}
+
+static void amdxdna_umap_release(struct kref *ref)
+{
+	struct amdxdna_umap *mapp = container_of(ref, struct amdxdna_umap, refcnt);
+	struct vm_area_struct *vma = mapp->vma;
+	struct amdxdna_dev *xdna;
+
+	mmu_interval_notifier_remove(&mapp->notifier);
+	if (is_import_bo(mapp->abo) && vma->vm_file && vma->vm_file->f_mapping)
+		mapping_clear_unevictable(vma->vm_file->f_mapping);
+
+	xdna = to_xdna_dev(to_gobj(mapp->abo)->dev);
+	down_write(&xdna->notifier_lock);
+	list_del(&mapp->node);
+	up_write(&xdna->notifier_lock);
+
+	drm_gem_object_put(to_gobj(mapp->abo));
+	kvfree(mapp->range.hmm_pfns);
+	kfree(mapp);
+}
+
+void amdxdna_umap_put(struct amdxdna_umap *mapp)
+{
+	kref_put(&mapp->refcnt, amdxdna_umap_release);
+}
+
+static void amdxdna_hmm_unreg_work(struct work_struct *work)
+{
+	struct amdxdna_umap *mapp = container_of(work, struct amdxdna_umap,
+						 hmm_unreg_work);
 
-	mmu_interval_notifier_remove(&abo->mem.notifier);
-	kvfree(abo->mem.pfns);
-	abo->mem.pfns = NULL;
+	amdxdna_umap_put(mapp);
 }
 
-static int amdxdna_hmm_register(struct amdxdna_gem_obj *abo, unsigned long addr,
-				size_t len)
+static int amdxdna_hmm_register(struct amdxdna_gem_obj *abo,
+				struct vm_area_struct *vma)
 {
 	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+	unsigned long len = vma->vm_end - vma->vm_start;
+	unsigned long addr = vma->vm_start;
+	struct amdxdna_umap *mapp;
 	u32 nr_pages;
 	int ret;
 
 	if (!xdna->dev_info->ops->hmm_invalidate)
 		return 0;
 
-	if (abo->mem.pfns)
-		return -EEXIST;
+	mapp = kzalloc(sizeof(*mapp), GFP_KERNEL);
+	if (!mapp)
+		return -ENOMEM;
 
 	nr_pages = (PAGE_ALIGN(addr + len) - (addr & PAGE_MASK)) >> PAGE_SHIFT;
-	abo->mem.pfns = kvcalloc(nr_pages, sizeof(*abo->mem.pfns),
-				 GFP_KERNEL);
-	if (!abo->mem.pfns)
-		return -ENOMEM;
+	mapp->range.hmm_pfns = kvcalloc(nr_pages, sizeof(*mapp->range.hmm_pfns),
+					GFP_KERNEL);
+	if (!mapp->range.hmm_pfns) {
+		ret = -ENOMEM;
+		goto free_map;
+	}
 
-	ret = mmu_interval_notifier_insert_locked(&abo->mem.notifier,
+	ret = mmu_interval_notifier_insert_locked(&mapp->notifier,
 						  current->mm,
 						  addr,
 						  len,
 						  &amdxdna_hmm_ops);
 	if (ret) {
 		XDNA_ERR(xdna, "Insert mmu notifier failed, ret %d", ret);
-		kvfree(abo->mem.pfns);
+		goto free_pfns;
 	}
-	abo->mem.userptr = addr;
 
+	mapp->range.notifier = &mapp->notifier;
+	mapp->range.start = vma->vm_start;
+	mapp->range.end = vma->vm_end;
+	mapp->range.default_flags = HMM_PFN_REQ_FAULT;
+	mapp->vma = vma;
+	mapp->abo = abo;
+	kref_init(&mapp->refcnt);
+	drm_gem_object_get(to_gobj(abo));
+
+	if (abo->mem.userptr == AMDXDNA_INVALID_ADDR)
+		abo->mem.userptr = addr;
+	INIT_WORK(&mapp->hmm_unreg_work, amdxdna_hmm_unreg_work);
+	if (is_import_bo(abo) && vma->vm_file && vma->vm_file->f_mapping)
+		mapping_set_unevictable(vma->vm_file->f_mapping);
+
+	down_write(&xdna->notifier_lock);
+	list_add_tail(&mapp->node, &abo->mem.umap_list);
+	up_write(&xdna->notifier_lock);
+
+	return 0;
+
+free_pfns:
+	kvfree(mapp->range.hmm_pfns);
+free_map:
+	kfree(mapp);
 	return ret;
 }
 
+static int amdxdna_insert_pages(struct amdxdna_gem_obj *abo,
+				struct vm_area_struct *vma)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+	unsigned long num_pages = vma_pages(vma);
+	unsigned long offset = 0;
+	int ret;
+
+	if (!is_import_bo(abo)) {
+		ret = drm_gem_shmem_mmap(&abo->base, vma);
+		if (ret) {
+			XDNA_ERR(xdna, "Failed shmem mmap %d", ret);
+			return ret;
+		}
+
+		/* The buffer is based on memory pages. Fix the flag. */
+		vm_flags_mod(vma, VM_MIXEDMAP, VM_PFNMAP);
+		ret = vm_insert_pages(vma, vma->vm_start, abo->base.pages,
+				      &num_pages);
+		if (ret) {
+			XDNA_ERR(xdna, "Failed insert pages %d", ret);
+			vma->vm_ops->close(vma);
+			return ret;
+		}
+
+		return 0;
+	}
+
+	vma->vm_private_data = NULL;
+	vma->vm_ops = NULL;
+	ret = dma_buf_mmap(to_gobj(abo)->dma_buf, vma, 0);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to mmap dma buf %d", ret);
+		return ret;
+	}
+
+	do {
+		vm_fault_t fault_ret;
+
+		fault_ret = handle_mm_fault(vma, vma->vm_start + offset,
+					    FAULT_FLAG_WRITE, NULL);
+		if (fault_ret & VM_FAULT_ERROR) {
+			vma->vm_ops->close(vma);
+			XDNA_ERR(xdna, "Fault in page failed");
+			return -EFAULT;
+		}
+
+		offset += PAGE_SIZE;
+	} while (--num_pages);
+
+	/* Drop the reference drm_gem_mmap_obj() acquired.*/
+	drm_gem_object_put(to_gobj(abo));
+
+	return 0;
+}
+
 static int amdxdna_gem_obj_mmap(struct drm_gem_object *gobj,
 				struct vm_area_struct *vma)
 {
+	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
 	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
-	unsigned long num_pages;
 	int ret;
 
-	ret = amdxdna_hmm_register(abo, vma->vm_start, gobj->size);
+	ret = amdxdna_hmm_register(abo, vma);
 	if (ret)
 		return ret;
 
+	ret = amdxdna_insert_pages(abo, vma);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed insert pages, ret %d", ret);
+		goto hmm_unreg;
+	}
+
+	XDNA_DBG(xdna, "BO map_offset 0x%llx type %d userptr 0x%lx size 0x%lx",
+		 drm_vma_node_offset_addr(&gobj->vma_node), abo->type,
+		 vma->vm_start, gobj->size);
+	return 0;
+
+hmm_unreg:
+	amdxdna_hmm_unregister(abo, vma);
+	return ret;
+}
+
+static int amdxdna_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
+{
+	struct drm_gem_object *gobj = dma_buf->priv;
+	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
+	unsigned long num_pages = vma_pages(vma);
+	int ret;
+
+	vma->vm_ops = &drm_gem_shmem_vm_ops;
+	vma->vm_private_data = gobj;
+
+	drm_gem_object_get(gobj);
 	ret = drm_gem_shmem_mmap(&abo->base, vma);
 	if (ret)
-		goto hmm_unreg;
+		goto put_obj;
 
-	num_pages = gobj->size >> PAGE_SHIFT;
-	/* Try to insert the pages */
+	/* The buffer is based on memory pages. Fix the flag. */
 	vm_flags_mod(vma, VM_MIXEDMAP, VM_PFNMAP);
-	ret = vm_insert_pages(vma, vma->vm_start, abo->base.pages, &num_pages);
+	ret = vm_insert_pages(vma, vma->vm_start, abo->base.pages,
+			      &num_pages);
 	if (ret)
-		XDNA_ERR(abo->client->xdna, "Failed insert pages, ret %d", ret);
+		goto close_vma;
 
 	return 0;
 
-hmm_unreg:
-	amdxdna_hmm_unregister(abo);
+close_vma:
+	vma->vm_ops->close(vma);
+put_obj:
+	drm_gem_object_put(gobj);
 	return ret;
 }
 
-static vm_fault_t amdxdna_gem_vm_fault(struct vm_fault *vmf)
-{
-	return drm_gem_shmem_vm_ops.fault(vmf);
-}
+static const struct dma_buf_ops amdxdna_dmabuf_ops = {
+	.cache_sgt_mapping = true,
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = drm_gem_map_dma_buf,
+	.unmap_dma_buf = drm_gem_unmap_dma_buf,
+	.release = drm_gem_dmabuf_release,
+	.mmap = amdxdna_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+};
 
-static void amdxdna_gem_vm_open(struct vm_area_struct *vma)
+static struct dma_buf *amdxdna_gem_prime_export(struct drm_gem_object *gobj, int flags)
 {
-	drm_gem_shmem_vm_ops.open(vma);
-}
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 
-static void amdxdna_gem_vm_close(struct vm_area_struct *vma)
-{
-	struct drm_gem_object *gobj = vma->vm_private_data;
+	exp_info.ops = &amdxdna_dmabuf_ops;
+	exp_info.size = gobj->size;
+	exp_info.flags = flags;
+	exp_info.priv = gobj;
+	exp_info.resv = gobj->resv;
 
-	amdxdna_hmm_unregister(to_xdna_obj(gobj));
-	drm_gem_shmem_vm_ops.close(vma);
+	return drm_gem_dmabuf_export(gobj->dev, &exp_info);
 }
 
-static const struct vm_operations_struct amdxdna_gem_vm_ops = {
-	.fault = amdxdna_gem_vm_fault,
-	.open = amdxdna_gem_vm_open,
-	.close = amdxdna_gem_vm_close,
-};
-
 static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
 	.free = amdxdna_gem_obj_free,
 	.print_info = drm_gem_shmem_object_print_info,
@@ -220,7 +388,8 @@ static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = amdxdna_gem_obj_mmap,
-	.vm_ops = &amdxdna_gem_vm_ops,
+	.vm_ops = &drm_gem_shmem_vm_ops,
+	.export = amdxdna_gem_prime_export,
 };
 
 static struct amdxdna_gem_obj *
@@ -239,6 +408,7 @@ amdxdna_gem_create_obj(struct drm_device *dev, size_t size)
 	abo->mem.userptr = AMDXDNA_INVALID_ADDR;
 	abo->mem.dev_addr = AMDXDNA_INVALID_ADDR;
 	abo->mem.size = size;
+	INIT_LIST_HEAD(&abo->mem.umap_list);
 
 	return abo;
 }
@@ -258,6 +428,46 @@ amdxdna_gem_create_object_cb(struct drm_device *dev, size_t size)
 	return to_gobj(abo);
 }
 
+struct drm_gem_object *
+amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
+{
+	struct dma_buf_attachment *attach;
+	struct drm_gem_object *gobj;
+	struct sg_table *sgt;
+	int ret;
+
+	attach = dma_buf_attach(dma_buf, dev->dev);
+	if (IS_ERR(attach))
+		return ERR_CAST(attach);
+
+	get_dma_buf(dma_buf);
+
+	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto fail_detach;
+	}
+
+	gobj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
+	if (IS_ERR(gobj)) {
+		ret = PTR_ERR(gobj);
+		goto fail_unmap;
+	}
+
+	gobj->import_attach = attach;
+	gobj->resv = dma_buf->resv;
+
+	return gobj;
+
+fail_unmap:
+	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
+fail_detach:
+	dma_buf_detach(dma_buf, attach);
+	dma_buf_put(dma_buf);
+
+	return ERR_PTR(ret);
+}
+
 static struct amdxdna_gem_obj *
 amdxdna_drm_alloc_shmem(struct drm_device *dev,
 			struct amdxdna_drm_create_bo *args,
@@ -483,6 +693,9 @@ int amdxdna_gem_pin_nolock(struct amdxdna_gem_obj *abo)
 	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
 	int ret;
 
+	if (is_import_bo(abo))
+		return 0;
+
 	switch (abo->type) {
 	case AMDXDNA_BO_SHMEM:
 	case AMDXDNA_BO_DEV_HEAP:
@@ -515,6 +728,9 @@ int amdxdna_gem_pin(struct amdxdna_gem_obj *abo)
 
 void amdxdna_gem_unpin(struct amdxdna_gem_obj *abo)
 {
+	if (is_import_bo(abo))
+		return;
+
 	if (abo->type == AMDXDNA_BO_DEV)
 		abo = abo->dev_heap;
 
@@ -606,7 +822,9 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
 		goto put_obj;
 	}
 
-	if (abo->type == AMDXDNA_BO_DEV)
+	if (is_import_bo(abo))
+		drm_clflush_sg(abo->base.sgt);
+	else if (abo->type == AMDXDNA_BO_DEV)
 		drm_clflush_pages(abo->mem.pages, abo->mem.nr_pages);
 	else
 		drm_clflush_pages(abo->base.pages, gobj->size >> PAGE_SHIFT);
diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
index 8ccc0375dd9d..5101d632c800 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.h
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -6,6 +6,19 @@
 #ifndef _AMDXDNA_GEM_H_
 #define _AMDXDNA_GEM_H_
 
+#include <linux/hmm.h>
+
+struct amdxdna_umap {
+	struct vm_area_struct		*vma;
+	struct mmu_interval_notifier	notifier;
+	struct hmm_range		range;
+	struct work_struct		hmm_unreg_work;
+	struct amdxdna_gem_obj		*abo;
+	struct list_head		node;
+	struct kref			refcnt;
+	bool				invalid;
+};
+
 struct amdxdna_mem {
 	u64				userptr;
 	void				*kva;
@@ -13,8 +26,7 @@ struct amdxdna_mem {
 	size_t				size;
 	struct page			**pages;
 	u32				nr_pages;
-	struct mmu_interval_notifier	notifier;
-	unsigned long			*pfns;
+	struct list_head		umap_list;
 	bool				map_invalid;
 };
 
@@ -34,6 +46,7 @@ struct amdxdna_gem_obj {
 };
 
 #define to_gobj(obj)    (&(obj)->base.base)
+#define is_import_bo(obj) (to_gobj(obj)->import_attach)
 
 static inline struct amdxdna_gem_obj *to_xdna_obj(struct drm_gem_object *gobj)
 {
@@ -47,8 +60,12 @@ static inline void amdxdna_gem_put_obj(struct amdxdna_gem_obj *abo)
 	drm_gem_object_put(to_gobj(abo));
 }
 
+void amdxdna_umap_put(struct amdxdna_umap *mapp);
+
 struct drm_gem_object *
 amdxdna_gem_create_object_cb(struct drm_device *dev, size_t size);
+struct drm_gem_object *
+amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
 struct amdxdna_gem_obj *
 amdxdna_drm_alloc_dev_bo(struct drm_device *dev,
 			 struct amdxdna_drm_create_bo *args,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index f5b8497cf5ad..f2bf1d374cc7 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -226,6 +226,7 @@ const struct drm_driver amdxdna_drm_drv = {
 	.num_ioctls = ARRAY_SIZE(amdxdna_drm_ioctls),
 
 	.gem_create_object = amdxdna_gem_create_object_cb,
+	.gem_prime_import = amdxdna_gem_prime_import,
 };
 
 static const struct amdxdna_dev_info *
@@ -266,12 +267,16 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		fs_reclaim_release(GFP_KERNEL);
 	}
 
+	xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", 0);
+	if (!xdna->notifier_wq)
+		return -ENOMEM;
+
 	mutex_lock(&xdna->dev_lock);
 	ret = xdna->dev_info->ops->init(xdna);
 	mutex_unlock(&xdna->dev_lock);
 	if (ret) {
 		XDNA_ERR(xdna, "Hardware init failed, ret %d", ret);
-		return ret;
+		goto destroy_notifier_wq;
 	}
 
 	ret = amdxdna_sysfs_init(xdna);
@@ -301,6 +306,8 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mutex_lock(&xdna->dev_lock);
 	xdna->dev_info->ops->fini(xdna);
 	mutex_unlock(&xdna->dev_lock);
+destroy_notifier_wq:
+	destroy_workqueue(xdna->notifier_wq);
 	return ret;
 }
 
@@ -310,6 +317,8 @@ static void amdxdna_remove(struct pci_dev *pdev)
 	struct device *dev = &pdev->dev;
 	struct amdxdna_client *client;
 
+	destroy_workqueue(xdna->notifier_wq);
+
 	pm_runtime_get_noresume(dev);
 	pm_runtime_forbid(dev);
 
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 37848a8d8031..ab79600911aa 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -6,6 +6,7 @@
 #ifndef _AMDXDNA_PCI_DRV_H_
 #define _AMDXDNA_PCI_DRV_H_
 
+#include <linux/workqueue.h>
 #include <linux/xarray.h>
 
 #define XDNA_INFO(xdna, fmt, args...)	drm_info(&(xdna)->ddev, fmt, ##args)
@@ -98,6 +99,7 @@ struct amdxdna_dev {
 	struct list_head		client_list;
 	struct amdxdna_fw_ver		fw_ver;
 	struct rw_semaphore		notifier_lock; /* for mmu notifier*/
+	struct workqueue_struct		*notifier_wq;
 };
 
 /*
-- 
2.34.1

