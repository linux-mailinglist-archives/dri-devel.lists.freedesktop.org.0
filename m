Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C3A70AE3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B023E10E035;
	Tue, 25 Mar 2025 20:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NMhKuMnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DA210E035
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:01:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPBQOtkf4qOQSa/yC66TtnXm8asjW7jE8mEfiAdQZtJp6LXOiR+rIyCL4og2+P8uHuqb+sAXwnzOBe+0LeCzxI79oZ4YUxzxzIGr2cBZIJ6Pgh3kX2iK6Eu/D2YcNCxEDSE24yGGH2H6PkZUnNY9A+BMVVStRtqF8kx2uVI5OzOwiAqU/j+JQ89JQMSUI/HJmYOD6/u1cG1/UxX4nwxNRuPtv+qdAxv4JHjcttVMM0Kgo/ZD5I+l8q5QrkpQ0P2wEiw8ZpmA3NlyZqUHeM7W7wxppsyWVK5xNi/Xjy3uAaUEzDEzMs2U0vcS24Umd/b8tyBfV4RhwCLGEXxpMCFeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ipsrizjF5h2s6cWcyY8pZXioJiMC2LwuHiFU092kuE=;
 b=OcrottEOaQo/Y01/T3gNGyuh1K6NPRt7ajm2xghnF0sCaHBKoB+EYGgHZ8tPQXtG7eCdR+PlJ2rrlEWZABhsImZaYUApMKhGf39nAsx+6dLDmz+V/YIAy/UQP1RzHzSRMZ40d+rktG7FF4Lcd/hDk/e+tGC26psoEWAC2b2w38VcZGAmnHotl4gLx/MGfHEkk4h3afNHmcwLpJ7xGRpzJ+0hNXmQ5esEqhylutJ3ztVuzUW5EHT2UXFpNc+qjoSTWoWgIUz9qeDBm4cZ/f15cDAbu5s1P/xQwV0q4254G3T/BPI8t6Z6qTGEDcCTCF8ees2IN6HEY2CggUhtagyzaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ipsrizjF5h2s6cWcyY8pZXioJiMC2LwuHiFU092kuE=;
 b=NMhKuMnqUDGqMNOM+p8WwOEOPWOVyPxCx92R6nrQWzkdH1L+nmYE+iJCMVZv4xsCKH3QmY2rVvT2NaPmjBu0OHCyKNPS1Lya/RYoQPC/X8kjfMnFwx6T5jYmaLQ94bqbd1iF1U8d4XP3mMs15hwSqJSB4gNjNseXG/W1MA2b5Pk=
Received: from MW4PR02CA0025.namprd02.prod.outlook.com (2603:10b6:303:16d::11)
 by SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Tue, 25 Mar
 2025 20:01:21 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:16d:cafe::73) by MW4PR02CA0025.outlook.office365.com
 (2603:10b6:303:16d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 20:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Tue, 25 Mar 2025 20:01:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 15:01:19 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Mar 2025 15:01:17 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <mario.limonciello@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V3] accel/amdxdna: Add BO import and export
Date: Tue, 25 Mar 2025 13:01:05 -0700
Message-ID: <20250325200105.2744079-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eef931d-80f5-47de-b730-08dd6bd7cfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0sKqCEZW523Y/AbtjCBzNhYqO9IalXcu9SV/XP/vHaKOxlx2h8+ldVdeKu7o?=
 =?us-ascii?Q?588vsVtDsiZJridol10lfftjCsc/8zieNo+VUuci7sLzQyCfipRSeOHpdFOT?=
 =?us-ascii?Q?fbD4776fR+g5WBIUAltFKqC8fIyGwpkrW0sjg/r+UAxq11sTjyNwmybgffAw?=
 =?us-ascii?Q?XzrWV9zopT50irTcuCC/X5Vy6Uf5vsgG5+36WgQ/oMLUZus+Ts1cDWEdRK4y?=
 =?us-ascii?Q?lDovjKgezjCAxtfQ2SubDCTtmbbmnpBUNn9EsfZa9cJwFk9TwEyoQoeTle9k?=
 =?us-ascii?Q?HCf+eThR1mdlW67njRKTVtTZRDHlpF7PEhCq1rbhDpQ4A/zb2Sh90H6fzvi4?=
 =?us-ascii?Q?jKEGTan5hePveryL8hSgYdHwGTkGr25daCVw49KxKw6JmpkwuC8nMXBbQYF8?=
 =?us-ascii?Q?8P5FamECBfdy9Wmn16L69rjEEb92wVZ207gUaO5CHT+1P1QomfPn77NqrJPJ?=
 =?us-ascii?Q?AtvjY1JtmvLQJvZKWGLeymHHD2n8JftOltNytg+wM+G0VtnqnjOr3xQXfZrC?=
 =?us-ascii?Q?NOvyywoPnmL1lMXIVlPYOWE6l+/+EbhBok7hForEPmFkk1V28ENxikTOi3AQ?=
 =?us-ascii?Q?9okH6H520SzSCbrzJ/GTtKxAw3zjrYH7WX7TzpeHq7R28WXTU6aVtKtcFMO6?=
 =?us-ascii?Q?PL5dPEGuNsG2kP62+TWI6NpcxUGGfBOsGiWgPuFQcP2aZP29suzJj+hdnODH?=
 =?us-ascii?Q?eYaJtO+pEY0DhhReVYQ1KreGoIJqkdA4kxAzFS/iVbBOstf9lVA3RIC4XnfC?=
 =?us-ascii?Q?jjjHzwRApbJRdWkXGfqL7xpDPJx4q2p/wsE2gLf4GXp1ncYDeexLOMg/4KIM?=
 =?us-ascii?Q?DE3zSPPJyELFldw3HftEVZAocdo46K3PaCUkK4YJa7MIZ0zWuaJEt2v4B33F?=
 =?us-ascii?Q?WqkU7fQgoPtiTgzZCAfnRBwAgMjHxkcazS3I/4jdqhC+a1PXM1m20poaImqC?=
 =?us-ascii?Q?b2ffnEBZ6Bmo3OaWhJ97KO1fNcujRnIL6MXzBSeEm3qfC0TeiNw71lfd28UQ?=
 =?us-ascii?Q?bJpOxZIiGGZWb07sgemie7JVK9i/ZEb2WLtnb8Z2Qq52lgG6pRdcwRz61iSR?=
 =?us-ascii?Q?LNMix7CVDe1Cn7rbhhyNa8kSE+eJn1xOyTNGwp3a4a4U8t8RDNf74RT43pWI?=
 =?us-ascii?Q?fmucdalcWBd6vsPUtvtebZVkA1qwdi62uXCG6J5KU0vimbiIrcvvSelPGbeJ?=
 =?us-ascii?Q?T55Y19KHLWYoqrNvHYSjKUcbaiTXIGkp08XpSSd5FelDkq/72aCxzL8pVqAJ?=
 =?us-ascii?Q?jglxNCAXZOKNkBMB5mP4VmoRLdAbbz9nq3JyyTf2xfoIFp15rq6fJOJTQjmv?=
 =?us-ascii?Q?17saFBh+Oulb4Kld4g7GXp2qXOx3gzRB8A8eBCYGkpOp0tjdBN6Zk4hfS0dV?=
 =?us-ascii?Q?seBj+EEvOQOEeaWwvkmSFcHksLd4BOgZJvoqkwthlvtTg8RDBJNsOhggq8Bw?=
 =?us-ascii?Q?z9DFQN6TYW4yXLjdRtRuoLj47AF3luqjUo2cDA+urAmaX4drCbXE/PD/Qt2/?=
 =?us-ascii?Q?yWOXX50MT18nGkI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 20:01:20.3926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eef931d-80f5-47de-b730-08dd6bd7cfd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671
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
 drivers/accel/amdxdna/aie2_ctx.c        |  65 ++--
 drivers/accel/amdxdna/amdxdna_gem.c     | 409 +++++++++++++++++++-----
 drivers/accel/amdxdna/amdxdna_gem.h     |  24 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  11 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   2 +
 6 files changed, 404 insertions(+), 108 deletions(-)

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
index 606433d73236..5879eba83e9b 100644
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
@@ -55,57 +60,38 @@ amdxdna_gem_insert_node_locked(struct amdxdna_gem_obj *abo, bool use_vmap)
 	return 0;
 }
 
-static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
-{
-	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
-	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
-	struct iosys_map map = IOSYS_MAP_INIT_VADDR(abo->mem.kva);
-
-	XDNA_DBG(xdna, "BO type %d xdna_addr 0x%llx", abo->type, abo->mem.dev_addr);
-	if (abo->pinned)
-		amdxdna_gem_unpin(abo);
-
-	if (abo->type == AMDXDNA_BO_DEV) {
-		mutex_lock(&abo->client->mm_lock);
-		drm_mm_remove_node(&abo->mm_node);
-		mutex_unlock(&abo->client->mm_lock);
-
-		vunmap(abo->mem.kva);
-		drm_gem_object_put(to_gobj(abo->dev_heap));
-		drm_gem_object_release(gobj);
-		mutex_destroy(&abo->lock);
-		kfree(abo);
-		return;
-	}
-
-	if (abo->type == AMDXDNA_BO_DEV_HEAP)
-		drm_mm_takedown(&abo->mm);
-
-	drm_gem_vunmap_unlocked(gobj, &map);
-	mutex_destroy(&abo->lock);
-	drm_gem_shmem_free(&abo->base);
-}
-
-static const struct drm_gem_object_funcs amdxdna_gem_dev_obj_funcs = {
-	.free = amdxdna_gem_obj_free,
-};
-
 static bool amdxdna_hmm_invalidate(struct mmu_interval_notifier *mni,
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
 
+	if (range->event == MMU_NOTIFY_UNMAP) {
+		down_write(&xdna->notifier_lock);
+		if (!mapp->unmapped) {
+			queue_work(xdna->notifier_wq, &mapp->hmm_unreg_work);
+			mapp->unmapped = true;
+		}
+		up_write(&xdna->notifier_lock);
+	}
+
 	return true;
 }
 
@@ -113,102 +99,310 @@ static const struct mmu_interval_notifier_ops amdxdna_hmm_ops = {
 	.invalidate = amdxdna_hmm_invalidate,
 };
 
-static void amdxdna_hmm_unregister(struct amdxdna_gem_obj *abo)
+static void amdxdna_hmm_unregister(struct amdxdna_gem_obj *abo,
+				   struct vm_area_struct *vma)
 {
 	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
+	struct amdxdna_umap *mapp;
+
+	down_read(&xdna->notifier_lock);
+	list_for_each_entry(mapp, &abo->mem.umap_list, node) {
+		if (!vma || mapp->vma == vma) {
+			if (!mapp->unmapped) {
+				queue_work(xdna->notifier_wq, &mapp->hmm_unreg_work);
+				mapp->unmapped = true;
+			}
+			if (vma)
+				break;
+		}
+	}
+	up_read(&xdna->notifier_lock);
+}
 
-	if (!xdna->dev_info->ops->hmm_invalidate)
-		return;
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
+static const struct dma_buf_ops amdxdna_dmabuf_ops = {
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = drm_gem_map_dma_buf,
+	.unmap_dma_buf = drm_gem_unmap_dma_buf,
+	.release = drm_gem_dmabuf_release,
+	.mmap = amdxdna_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+};
+
+static struct dma_buf *amdxdna_gem_prime_export(struct drm_gem_object *gobj, int flags)
 {
-	return drm_gem_shmem_vm_ops.fault(vmf);
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+
+	exp_info.ops = &amdxdna_dmabuf_ops;
+	exp_info.size = gobj->size;
+	exp_info.flags = flags;
+	exp_info.priv = gobj;
+	exp_info.resv = gobj->resv;
+
+	return drm_gem_dmabuf_export(gobj->dev, &exp_info);
 }
 
-static void amdxdna_gem_vm_open(struct vm_area_struct *vma)
+static void amdxdna_imported_obj_free(struct amdxdna_gem_obj *abo)
 {
-	drm_gem_shmem_vm_ops.open(vma);
+	dma_buf_unmap_attachment_unlocked(abo->attach, abo->base.sgt, DMA_BIDIRECTIONAL);
+	dma_buf_detach(abo->dma_buf, abo->attach);
+	dma_buf_put(abo->dma_buf);
+	drm_gem_object_release(to_gobj(abo));
+	kfree(abo);
 }
 
-static void amdxdna_gem_vm_close(struct vm_area_struct *vma)
+static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 {
-	struct drm_gem_object *gobj = vma->vm_private_data;
+	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
+	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(abo->mem.kva);
+
+	XDNA_DBG(xdna, "BO type %d xdna_addr 0x%llx", abo->type, abo->mem.dev_addr);
+
+	amdxdna_hmm_unregister(abo, NULL);
+	flush_workqueue(xdna->notifier_wq);
+
+	if (abo->pinned)
+		amdxdna_gem_unpin(abo);
+
+	if (abo->type == AMDXDNA_BO_DEV) {
+		mutex_lock(&abo->client->mm_lock);
+		drm_mm_remove_node(&abo->mm_node);
+		mutex_unlock(&abo->client->mm_lock);
+
+		vunmap(abo->mem.kva);
+		drm_gem_object_put(to_gobj(abo->dev_heap));
+		drm_gem_object_release(gobj);
+		mutex_destroy(&abo->lock);
+		kfree(abo);
+		return;
+	}
+
+	if (abo->type == AMDXDNA_BO_DEV_HEAP)
+		drm_mm_takedown(&abo->mm);
+
+	drm_gem_vunmap_unlocked(gobj, &map);
+	mutex_destroy(&abo->lock);
+
+	if (is_import_bo(abo)) {
+		amdxdna_imported_obj_free(abo);
+		return;
+	}
 
-	amdxdna_hmm_unregister(to_xdna_obj(gobj));
-	drm_gem_shmem_vm_ops.close(vma);
+	drm_gem_shmem_free(&abo->base);
 }
 
-static const struct vm_operations_struct amdxdna_gem_vm_ops = {
-	.fault = amdxdna_gem_vm_fault,
-	.open = amdxdna_gem_vm_open,
-	.close = amdxdna_gem_vm_close,
+static const struct drm_gem_object_funcs amdxdna_gem_dev_obj_funcs = {
+	.free = amdxdna_gem_obj_free,
 };
 
 static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
@@ -220,7 +414,8 @@ static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = amdxdna_gem_obj_mmap,
-	.vm_ops = &amdxdna_gem_vm_ops,
+	.vm_ops = &drm_gem_shmem_vm_ops,
+	.export = amdxdna_gem_prime_export,
 };
 
 static struct amdxdna_gem_obj *
@@ -239,6 +434,7 @@ amdxdna_gem_create_obj(struct drm_device *dev, size_t size)
 	abo->mem.userptr = AMDXDNA_INVALID_ADDR;
 	abo->mem.dev_addr = AMDXDNA_INVALID_ADDR;
 	abo->mem.size = size;
+	INIT_LIST_HEAD(&abo->mem.umap_list);
 
 	return abo;
 }
@@ -258,6 +454,51 @@ amdxdna_gem_create_object_cb(struct drm_device *dev, size_t size)
 	return to_gobj(abo);
 }
 
+struct drm_gem_object *
+amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
+{
+	struct dma_buf_attachment *attach;
+	struct amdxdna_gem_obj *abo;
+	struct drm_gem_object *gobj;
+	struct sg_table *sgt;
+	int ret;
+
+	get_dma_buf(dma_buf);
+
+	attach = dma_buf_attach(dma_buf, dev->dev);
+	if (IS_ERR(attach)) {
+		ret = PTR_ERR(attach);
+		goto put_buf;
+	}
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
+	abo = to_xdna_obj(gobj);
+	abo->attach = attach;
+	abo->dma_buf = dma_buf;
+
+	return gobj;
+
+fail_unmap:
+	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
+fail_detach:
+	dma_buf_detach(dma_buf, attach);
+put_buf:
+	dma_buf_put(dma_buf);
+
+	return ERR_PTR(ret);
+}
+
 static struct amdxdna_gem_obj *
 amdxdna_drm_alloc_shmem(struct drm_device *dev,
 			struct amdxdna_drm_create_bo *args,
@@ -483,6 +724,9 @@ int amdxdna_gem_pin_nolock(struct amdxdna_gem_obj *abo)
 	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
 	int ret;
 
+	if (is_import_bo(abo))
+		return 0;
+
 	switch (abo->type) {
 	case AMDXDNA_BO_SHMEM:
 	case AMDXDNA_BO_DEV_HEAP:
@@ -515,6 +759,9 @@ int amdxdna_gem_pin(struct amdxdna_gem_obj *abo)
 
 void amdxdna_gem_unpin(struct amdxdna_gem_obj *abo)
 {
+	if (is_import_bo(abo))
+		return;
+
 	if (abo->type == AMDXDNA_BO_DEV)
 		abo = abo->dev_heap;
 
@@ -606,7 +853,9 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
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
index 8ccc0375dd9d..aee97e971d6d 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.h
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -6,6 +6,20 @@
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
+	bool				unmapped;
+};
+
 struct amdxdna_mem {
 	u64				userptr;
 	void				*kva;
@@ -13,8 +27,7 @@ struct amdxdna_mem {
 	size_t				size;
 	struct page			**pages;
 	u32				nr_pages;
-	struct mmu_interval_notifier	notifier;
-	unsigned long			*pfns;
+	struct list_head		umap_list;
 	bool				map_invalid;
 };
 
@@ -31,9 +44,12 @@ struct amdxdna_gem_obj {
 	struct amdxdna_gem_obj		*dev_heap; /* For AMDXDNA_BO_DEV */
 	struct drm_mm_node		mm_node; /* For AMDXDNA_BO_DEV */
 	u32				assigned_hwctx;
+	struct dma_buf			*dma_buf;
+	struct dma_buf_attachment	*attach;
 };
 
 #define to_gobj(obj)    (&(obj)->base.base)
+#define is_import_bo(obj) ((obj)->attach)
 
 static inline struct amdxdna_gem_obj *to_xdna_obj(struct drm_gem_object *gobj)
 {
@@ -47,8 +63,12 @@ static inline void amdxdna_gem_put_obj(struct amdxdna_gem_obj *abo)
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

