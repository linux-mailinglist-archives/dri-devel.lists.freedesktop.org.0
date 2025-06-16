Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BB9ADAB97
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B3410E2EA;
	Mon, 16 Jun 2025 09:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="apJXT+fN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F3110E2EA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1a6TqwDICMuK5QJNLTVZZxZEG0aEmgkTnLlJiY3T+4TU5ODjbNYYeynGcP14qK+SbMty2RqaeSq8i82MJiIG8blBt2w9tkFiB+euM9wrjC88fbmkOxoqDPdSTCjQnmqDHco/i+t5CQ2WpIE07Mj8OJ7NYmPb2GWV18BMrcYBkGCGmn1NeScpW/A+YVvJF7vBUpbSQEbHgEErwgB0PC9OYqX370hOH5rIhndkkQWtUJL/nEk6erezfckguXj8lUL0WY8b0qfmyZbCps7rhvc+dWyN7SCxwAF07UHsTNFFhYNdIqsIuY03sORNKl9dL72GGcB2t0EM4/wHXj49o57qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMiS6JPe9/ZICImY7BJtnRmjcb07tL0z+4sWPztZvnM=;
 b=nJXEdJ1mcT5Ay4NSVr0wpGz2OQ3+2gjDybfJg41ovhEa5d7McH/dumko5ZoC/8A6ERw/47VO9vRFHMtxJ6yl1Gz0yjuLy08ekOHK3hu0YWAHMCedYGU9jXRPbOYyWCDnCdDPUJsJkxWhVuTxMT6pBYrWbDobMXm5s2V4rwhIg+lG5ca2BrGE7Li3i3OaCcOBBEhZ3tGtOyqx8J9HgcpL5Ucjt1tsgp9pgjQcuo0pzY7xrPtxkplYvbIhIgoU6HKMcbVoG+20cZnQXw7LrJFME06Sinr6UNen2FMOuDZslbqFRFl9WDQh/14cDYpJ0yd1YIVllnJNFJJl4akRLSyzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMiS6JPe9/ZICImY7BJtnRmjcb07tL0z+4sWPztZvnM=;
 b=apJXT+fNrtolKzFN15yZDG6W9Ox18+fL/O3+iG6RTRTEqDB1sf72/A7PDkNGF/HLF9uHesdN/fHrdv8TjGpGWLuRV1a2UhPhAato0xn5mSbSgRuEuvCeLWrwy0E0xXS1ApmgMSMsdZCrBHlgPrUfk7ya1AcZkzcBh2qHGhV1aO4=
Received: from SN7PR04CA0170.namprd04.prod.outlook.com (2603:10b6:806:125::25)
 by CH1PPFDB1826343.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::628) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 09:14:45 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::29) by SN7PR04CA0170.outlook.office365.com
 (2603:10b6:806:125::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 09:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 09:14:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 04:14:43 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Jun 2025 04:14:43 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <min.ma@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Revise device bo creation and free
Date: Mon, 16 Jun 2025 02:14:16 -0700
Message-ID: <20250616091418.2605476-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|CH1PPFDB1826343:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa06b8f-0322-48c9-9703-08ddacb63be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3d6cXxtbe3etvnWdMKKk9+xhp+9bo9cWD/TC7NjT9OWMkK+GcPEs5f+SPHu2?=
 =?us-ascii?Q?FcCDxD/tvrOb+BFb0dhf4sJwWIuPLXxipyrVoguqhUgbkBMg8y0LsSX32Yp7?=
 =?us-ascii?Q?xR6d9mLE0HPL7E6/eoclIg7UXW/HS0JsT0RrCs4K+T9sHJ7MRUf+zvNCHLur?=
 =?us-ascii?Q?WVLWGAFaBZPzv0l4CrMWI1phP6jXWVj9nSO7RRmW7H17m8Viqir539LYrBlU?=
 =?us-ascii?Q?VbC3AXiQOQ6mRtQjwPXVLeQ9oQxHDyjI3qMYGrWw02kLgCV9W2VPMcYhNouW?=
 =?us-ascii?Q?J8a//fMpVEquQRDR7VcflVPVBoezKGESMMLJIVDpc/19QSa69vlBdOqtVTA9?=
 =?us-ascii?Q?d9dotFmebaZYj+hqEfyTaX5b9fSAEmiCHmEAIodQRl072H2vLwTuiPy/pV0f?=
 =?us-ascii?Q?Jf+QwwPMkesj3cz15zn/20iGVGnPrZrUYZPKW+KngQcjtLMBkfinZH21Gqls?=
 =?us-ascii?Q?2uFT0vZxrtFhVyzutx5e6U0/m2y7Wmm7Q1A3semPZnVu4Mi1zqqrUj8WTcqF?=
 =?us-ascii?Q?Mo9e1IyR2qDzAQGjFS6ci48CN5TTzgPoLfks2TwDiXgBsjhqtEjBdH7UI1cb?=
 =?us-ascii?Q?xn5n3AYq/8mD6PP7Jnk2oK3o3IIe39iRw5OYfZ2SDXAVs0SMc8bhtVGu03KP?=
 =?us-ascii?Q?46ht9TWTLqyy6eIuAAer4DOtBnuIEQk6we/rygclJcfYUJk1nSy8dlk4Y7r6?=
 =?us-ascii?Q?b+WZ2yTkjOy6rP1LTIxU0Tom4YgtIGKcSTsaQ9mqJimAf/K/hC1pHaSIVNGr?=
 =?us-ascii?Q?1XShzpVj8rHUSUrrKesggl0vfACLFaTwe9vEQFAYUy4zPYS6EDSmO0STKU9K?=
 =?us-ascii?Q?Yb9a9RLGNcy4yeTr3kHIUVgiXROusi22aY6Wlb7r8cSDhtCXgcinSd7jFyoX?=
 =?us-ascii?Q?05TdS2OAFK583lNniU6RHXlc/e/1ZGTRZPOGO15SVgHxjqiFlaDcX2gzH3rN?=
 =?us-ascii?Q?NvjxJ8+Kv7POgQgzPL7ei9CJLeP4AMHY77L85XGoew4CoQz25ELEv1MA3vvn?=
 =?us-ascii?Q?SBvLVwnwv9iSN5igqkQLDZUNuQc6Ce7f0ZHqVs5zTKQe7VYPWj1N1Gmw1k+R?=
 =?us-ascii?Q?9Ok9BF1C6cbnAqKwUVW6ebbEj8UHrY38PXwUJL5mwgPY9gZPjMmknJK4z5ov?=
 =?us-ascii?Q?/u0okFKqQa0qivfLkqf0Jg7D9uhmyF6ixjkZ9MCqQMM1MwLzJZwFKSuh4RXA?=
 =?us-ascii?Q?MBQQ91ga/tdG1xfEq02GJT8n5AHFyDvJ6JwX6Oh2u1P1fUXGJFTxEHbJFrdh?=
 =?us-ascii?Q?vpBzPJcj7zN8uztPeSwHCVLEOJh70P7GtBVXccyUeHtdXZPFlR/14qxPWMRP?=
 =?us-ascii?Q?fZ2JNrzwlqg8YdlkLVfHc5srVxN4tH4UvPWOxsP5JbD1BvJglnDMIeiMyaGR?=
 =?us-ascii?Q?BhsqPZVpGm+hhySsn2oPgw/PzfrC4pYiluphLNcRaYSHod42yZLdPQtZgjYx?=
 =?us-ascii?Q?2Gh4mf/gSyU3Q9f8lS3LYOa1CFrMA2cDIpgtlp93IlXVHPxD0v2kls8KQZVa?=
 =?us-ascii?Q?IsJ+qkQXT9mw5bOTzIMTxzZng4WwGs4z1sy1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 09:14:44.4387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa06b8f-0322-48c9-9703-08ddacb63be1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDB1826343
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

The device bo is allocated from the device heap memory. (a trunk of
memory dedicated to device)

Rename amdxdna_gem_insert_node_locked to amdxdna_gem_heap_alloc
and move related sanity checks into it.

Add amdxdna_gem_dev_obj_free and move device bo free code into it.

Calculate the kernel virtual address of device bo by the device
heap memory address and offset.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c    |   2 +-
 drivers/accel/amdxdna/amdxdna_gem.c | 193 +++++++++++++++-------------
 drivers/accel/amdxdna/amdxdna_gem.h |   3 +-
 3 files changed, 106 insertions(+), 92 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 3e38a5f637ea..f20999f2d668 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -566,7 +566,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 			.size = MAX_CHAIN_CMDBUF_SIZE,
 		};
 
-		abo = amdxdna_drm_alloc_dev_bo(&xdna->ddev, &args, client->filp, true);
+		abo = amdxdna_drm_alloc_dev_bo(&xdna->ddev, &args, client->filp);
 		if (IS_ERR(abo)) {
 			ret = PTR_ERR(abo);
 			goto free_cmd_bufs;
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 26831ec69f89..51b3310dfd4d 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -24,40 +24,79 @@
 MODULE_IMPORT_NS("DMA_BUF");
 
 static int
-amdxdna_gem_insert_node_locked(struct amdxdna_gem_obj *abo, bool use_vmap)
+amdxdna_gem_heap_alloc(struct amdxdna_gem_obj *abo)
 {
 	struct amdxdna_client *client = abo->client;
 	struct amdxdna_dev *xdna = client->xdna;
 	struct amdxdna_mem *mem = &abo->mem;
+	struct amdxdna_gem_obj *heap;
 	u64 offset;
 	u32 align;
 	int ret;
 
+	mutex_lock(&client->mm_lock);
+
+	heap = client->dev_heap;
+	if (!heap) {
+		ret = -EINVAL;
+		goto unlock_out;
+	}
+
+	if (heap->mem.userptr == AMDXDNA_INVALID_ADDR) {
+		XDNA_ERR(xdna, "Invalid dev heap userptr");
+		ret = -EINVAL;
+		goto unlock_out;
+	}
+
+	if (mem->size == 0 || mem->size > heap->mem.size) {
+		XDNA_ERR(xdna, "Invalid dev bo size 0x%lx, limit 0x%lx",
+			 mem->size, heap->mem.size);
+		ret = -EINVAL;
+		goto unlock_out;
+	}
+
 	align = 1 << max(PAGE_SHIFT, xdna->dev_info->dev_mem_buf_shift);
-	ret = drm_mm_insert_node_generic(&abo->dev_heap->mm, &abo->mm_node,
+	ret = drm_mm_insert_node_generic(&heap->mm, &abo->mm_node,
 					 mem->size, align,
 					 0, DRM_MM_INSERT_BEST);
 	if (ret) {
 		XDNA_ERR(xdna, "Failed to alloc dev bo memory, ret %d", ret);
-		return ret;
+		goto unlock_out;
 	}
 
 	mem->dev_addr = abo->mm_node.start;
-	offset = mem->dev_addr - abo->dev_heap->mem.dev_addr;
-	mem->userptr = abo->dev_heap->mem.userptr + offset;
-	mem->pages = &abo->dev_heap->base.pages[offset >> PAGE_SHIFT];
-	mem->nr_pages = mem->size >> PAGE_SHIFT;
-
-	if (use_vmap) {
-		mem->kva = vmap(mem->pages, mem->nr_pages, VM_MAP, PAGE_KERNEL);
-		if (!mem->kva) {
-			XDNA_ERR(xdna, "Failed to vmap");
-			drm_mm_remove_node(&abo->mm_node);
-			return -EFAULT;
-		}
-	}
+	offset = mem->dev_addr - heap->mem.dev_addr;
+	mem->userptr = heap->mem.userptr + offset;
+	mem->kva = heap->mem.kva + offset;
 
-	return 0;
+	drm_gem_object_get(to_gobj(heap));
+
+unlock_out:
+	mutex_unlock(&client->mm_lock);
+
+	return ret;
+}
+
+static void
+amdxdna_gem_destroy_obj(struct amdxdna_gem_obj *abo)
+{
+	mutex_destroy(&abo->lock);
+	kfree(abo);
+}
+
+static void
+amdxdna_gem_heap_free(struct amdxdna_gem_obj *abo)
+{
+	struct amdxdna_gem_obj *heap;
+
+	mutex_lock(&abo->client->mm_lock);
+
+	drm_mm_remove_node(&abo->mm_node);
+
+	heap = abo->client->dev_heap;
+	drm_gem_object_put(to_gobj(heap));
+
+	mutex_unlock(&abo->client->mm_lock);
 }
 
 static bool amdxdna_hmm_invalidate(struct mmu_interval_notifier *mni,
@@ -213,6 +252,20 @@ static int amdxdna_hmm_register(struct amdxdna_gem_obj *abo,
 	return ret;
 }
 
+static void amdxdna_gem_dev_obj_free(struct drm_gem_object *gobj)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
+	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
+
+	XDNA_DBG(xdna, "BO type %d xdna_addr 0x%llx", abo->type, abo->mem.dev_addr);
+	if (abo->pinned)
+		amdxdna_gem_unpin(abo);
+
+	amdxdna_gem_heap_free(abo);
+	drm_gem_object_release(gobj);
+	amdxdna_gem_destroy_obj(abo);
+}
+
 static int amdxdna_insert_pages(struct amdxdna_gem_obj *abo,
 				struct vm_area_struct *vma)
 {
@@ -374,19 +427,6 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 	if (abo->pinned)
 		amdxdna_gem_unpin(abo);
 
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
 	if (abo->type == AMDXDNA_BO_DEV_HEAP)
 		drm_mm_takedown(&abo->mm);
 
@@ -402,7 +442,7 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 }
 
 static const struct drm_gem_object_funcs amdxdna_gem_dev_obj_funcs = {
-	.free = amdxdna_gem_obj_free,
+	.free = amdxdna_gem_dev_obj_free,
 };
 
 static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
@@ -527,6 +567,7 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
 			    struct drm_file *filp)
 {
 	struct amdxdna_client *client = filp->driver_priv;
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
 	struct drm_gem_shmem_object *shmem;
 	struct amdxdna_gem_obj *abo;
@@ -553,18 +594,26 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
 
 	shmem->map_wc = false;
 	abo = to_xdna_obj(&shmem->base);
-
 	abo->type = AMDXDNA_BO_DEV_HEAP;
 	abo->client = client;
 	abo->mem.dev_addr = client->xdna->dev_info->dev_mem_base;
 	drm_mm_init(&abo->mm, abo->mem.dev_addr, abo->mem.size);
 
+	ret = drm_gem_vmap(to_gobj(abo), &map);
+	if (ret) {
+		XDNA_ERR(xdna, "Vmap heap bo failed, ret %d", ret);
+		goto release_obj;
+	}
+	abo->mem.kva = map.vaddr;
+
 	client->dev_heap = abo;
 	drm_gem_object_get(to_gobj(abo));
 	mutex_unlock(&client->mm_lock);
 
 	return abo;
 
+release_obj:
+	drm_gem_object_put(to_gobj(abo));
 mm_unlock:
 	mutex_unlock(&client->mm_lock);
 	return ERR_PTR(ret);
@@ -573,58 +622,32 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
 struct amdxdna_gem_obj *
 amdxdna_drm_alloc_dev_bo(struct drm_device *dev,
 			 struct amdxdna_drm_create_bo *args,
-			 struct drm_file *filp, bool use_vmap)
+			 struct drm_file *filp)
 {
 	struct amdxdna_client *client = filp->driver_priv;
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
 	size_t aligned_sz = PAGE_ALIGN(args->size);
-	struct amdxdna_gem_obj *abo, *heap;
+	struct amdxdna_gem_obj *abo;
 	int ret;
 
-	mutex_lock(&client->mm_lock);
-	heap = client->dev_heap;
-	if (!heap) {
-		ret = -EINVAL;
-		goto mm_unlock;
-	}
-
-	if (heap->mem.userptr == AMDXDNA_INVALID_ADDR) {
-		XDNA_ERR(xdna, "Invalid dev heap userptr");
-		ret = -EINVAL;
-		goto mm_unlock;
-	}
-
-	if (args->size > heap->mem.size) {
-		XDNA_ERR(xdna, "Invalid dev bo size 0x%llx, limit 0x%lx",
-			 args->size, heap->mem.size);
-		ret = -EINVAL;
-		goto mm_unlock;
-	}
-
 	abo = amdxdna_gem_create_obj(&xdna->ddev, aligned_sz);
-	if (IS_ERR(abo)) {
-		ret = PTR_ERR(abo);
-		goto mm_unlock;
-	}
+	if (IS_ERR(abo))
+		return abo;
+
 	to_gobj(abo)->funcs = &amdxdna_gem_dev_obj_funcs;
 	abo->type = AMDXDNA_BO_DEV;
 	abo->client = client;
-	abo->dev_heap = heap;
-	ret = amdxdna_gem_insert_node_locked(abo, use_vmap);
+
+	ret = amdxdna_gem_heap_alloc(abo);
 	if (ret) {
 		XDNA_ERR(xdna, "Failed to alloc dev bo memory, ret %d", ret);
-		goto mm_unlock;
+		amdxdna_gem_destroy_obj(abo);
+		return ERR_PTR(ret);
 	}
 
-	drm_gem_object_get(to_gobj(heap));
 	drm_gem_private_object_init(&xdna->ddev, to_gobj(abo), aligned_sz);
 
-	mutex_unlock(&client->mm_lock);
 	return abo;
-
-mm_unlock:
-	mutex_unlock(&client->mm_lock);
-	return ERR_PTR(ret);
 }
 
 static struct amdxdna_gem_obj *
@@ -632,10 +655,10 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
 			  struct amdxdna_drm_create_bo *args,
 			  struct drm_file *filp)
 {
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
 	struct drm_gem_shmem_object *shmem;
 	struct amdxdna_gem_obj *abo;
-	struct iosys_map map;
 	int ret;
 
 	if (args->size > XDNA_MAX_CMD_BO_SIZE) {
@@ -692,7 +715,7 @@ int amdxdna_drm_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_f
 		abo = amdxdna_drm_create_dev_heap(dev, args, filp);
 		break;
 	case AMDXDNA_BO_DEV:
-		abo = amdxdna_drm_alloc_dev_bo(dev, args, filp, false);
+		abo = amdxdna_drm_alloc_dev_bo(dev, args, filp);
 		break;
 	case AMDXDNA_BO_CMD:
 		abo = amdxdna_drm_create_cmd_bo(dev, args, filp);
@@ -724,20 +747,13 @@ int amdxdna_gem_pin_nolock(struct amdxdna_gem_obj *abo)
 	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
 	int ret;
 
+	if (abo->type == AMDXDNA_BO_DEV)
+		abo = abo->client->dev_heap;
+
 	if (is_import_bo(abo))
 		return 0;
 
-	switch (abo->type) {
-	case AMDXDNA_BO_SHMEM:
-	case AMDXDNA_BO_DEV_HEAP:
-		ret = drm_gem_shmem_pin(&abo->base);
-		break;
-	case AMDXDNA_BO_DEV:
-		ret = drm_gem_shmem_pin(&abo->dev_heap->base);
-		break;
-	default:
-		ret = -EOPNOTSUPP;
-	}
+	ret = drm_gem_shmem_pin(&abo->base);
 
 	XDNA_DBG(xdna, "BO type %d ret %d", abo->type, ret);
 	return ret;
@@ -747,9 +763,6 @@ int amdxdna_gem_pin(struct amdxdna_gem_obj *abo)
 {
 	int ret;
 
-	if (abo->type == AMDXDNA_BO_DEV)
-		abo = abo->dev_heap;
-
 	mutex_lock(&abo->lock);
 	ret = amdxdna_gem_pin_nolock(abo);
 	mutex_unlock(&abo->lock);
@@ -759,12 +772,12 @@ int amdxdna_gem_pin(struct amdxdna_gem_obj *abo)
 
 void amdxdna_gem_unpin(struct amdxdna_gem_obj *abo)
 {
+	if (abo->type == AMDXDNA_BO_DEV)
+		abo = abo->client->dev_heap;
+
 	if (is_import_bo(abo))
 		return;
 
-	if (abo->type == AMDXDNA_BO_DEV)
-		abo = abo->dev_heap;
-
 	mutex_lock(&abo->lock);
 	drm_gem_shmem_unpin(&abo->base);
 	mutex_unlock(&abo->lock);
@@ -855,10 +868,12 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
 
 	if (is_import_bo(abo))
 		drm_clflush_sg(abo->base.sgt);
-	else if (abo->type == AMDXDNA_BO_DEV)
-		drm_clflush_pages(abo->mem.pages, abo->mem.nr_pages);
-	else
+	else if (abo->mem.kva)
+		drm_clflush_virt_range(abo->mem.kva + args->offset, args->size);
+	else if (abo->base.pages)
 		drm_clflush_pages(abo->base.pages, gobj->size >> PAGE_SHIFT);
+	else
+		WARN(1, "Can not get flush memory");
 
 	amdxdna_gem_unpin(abo);
 
diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
index aee97e971d6d..ae29db94a9d3 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.h
+++ b/drivers/accel/amdxdna/amdxdna_gem.h
@@ -41,7 +41,6 @@ struct amdxdna_gem_obj {
 
 	/* Below members is uninitialized when needed */
 	struct drm_mm			mm; /* For AMDXDNA_BO_DEV_HEAP */
-	struct amdxdna_gem_obj		*dev_heap; /* For AMDXDNA_BO_DEV */
 	struct drm_mm_node		mm_node; /* For AMDXDNA_BO_DEV */
 	u32				assigned_hwctx;
 	struct dma_buf			*dma_buf;
@@ -72,7 +71,7 @@ amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
 struct amdxdna_gem_obj *
 amdxdna_drm_alloc_dev_bo(struct drm_device *dev,
 			 struct amdxdna_drm_create_bo *args,
-			 struct drm_file *filp, bool use_vmap);
+			 struct drm_file *filp);
 
 int amdxdna_gem_pin_nolock(struct amdxdna_gem_obj *abo);
 int amdxdna_gem_pin(struct amdxdna_gem_obj *abo);
-- 
2.34.1

