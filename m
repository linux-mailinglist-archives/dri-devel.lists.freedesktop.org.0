Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504BBB59FBA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 19:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7077C10E3B0;
	Tue, 16 Sep 2025 17:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ke8zvgBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013065.outbound.protection.outlook.com
 [40.107.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FD710E3B0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 17:49:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyIbdyoBSNZbkIhlPkqTEgyOU7q+Muxo76gJJbKrj/BwCSSJ7YriR/Xi8CF5r4Yrdh65WcZj/pE6l3tJKM24Pt69kMmdixrqvQpuIptVxAHy4KOdsYPRjFH6AE55J8SCdL9RLeHz8Kr1wTAFcGFZjISFtKYUopirYtZPXpxBDeu6RMS3DtJ+igMYOzTUpVyZ00uW5bQhfdsGlD+OiKkY5wJqXXanV63kTKPRd/U8PHFi+ppnr/+DgrMNcouJoEsAljAbdfKuPI72QnGVwMl0IEFap5Bom152ntvjcg4TvIfESy2U7s+fXwOQqP5VicxuFJBM3wR33jy3pHMN3DU7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NowBLbPpI/HduxwbxPHGhB1TlCWr1tQKsBKE//N5KP4=;
 b=qho6yqH7FBUQbYLif2tcPjwrVAXIIYmZRLXqXPcS44bA9pK0eRlwVLz59CyNrQ9DIQz8WnwMpZfBB4FH58FYJ4xRir1N8nAgV4/YUZ4hjrg3rzC9l5O+a1BnHOllKj0JADMZVUIqZKpNUjHjVyBuUCfTEICNu4PXxu2eOv5D/FNtqehLtFczEsJHQG0h6kzaUoCZv0KotLXRGTRgrtqTQEri3uzatzVmkrvv84M+NNFJfhanddBtdAkTb5aaTRY066WjX68EQO15TEzTqZxPfEceGuBhPvgVg7RkpGwAzVnZ0XNpPItltl0DnQSKpeWkSydXbzgrZsy5mksHAfamuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NowBLbPpI/HduxwbxPHGhB1TlCWr1tQKsBKE//N5KP4=;
 b=ke8zvgBQ56uov+NUpeJlN0QZbYH8rFxigg+H7W5OO61xnrSXCjfnhtsrzDA3K64bL9u0+w7ZcmNB4LZUUGFKrx7jGfknE/HaZs5b38FIZfMbJ08bgWnCiaAgo/vMt6N2VttKgaeQko+0IK2iOPuVHk4lqW3/GZE1q0KvRc9s1jc=
Received: from SJ0PR03CA0389.namprd03.prod.outlook.com (2603:10b6:a03:3a1::34)
 by CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 17:48:56 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::36) by SJ0PR03CA0389.outlook.office365.com
 (2603:10b6:a03:3a1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Tue,
 16 Sep 2025 17:48:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 17:48:55 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Sep
 2025 10:48:55 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 16 Sep 2025 10:48:54 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Call dma_buf_vmap_unlocked() for imported
 object
Date: Tue, 16 Sep 2025 10:48:42 -0700
Message-ID: <20250916174842.234709-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e94677d-1d83-4e4c-7b31-08ddf5494edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4CGoq3k2/F5hDxXfyr4otq9PcGsAcm4wPA10duSRf9qW5mU8Mk3ptzQ1qk0a?=
 =?us-ascii?Q?u5lGZodJke+BDz/Mi/KAbu7gnLYt40fC/+p5/QHDb68jgWMX0YeXHCTeoKCW?=
 =?us-ascii?Q?Y3bR3sEfqMdLMla/rLSkMO4Im6zf5HKZF6Cp16VVUcERS7YOgIFWxLwMDw4e?=
 =?us-ascii?Q?wM0UOHt++ou09VuV868RvALOAWZH6no/mUlO0soySkUbaWR1kaTYxlcBUkeq?=
 =?us-ascii?Q?ZGGWb9rXQGzgNxQMbqcNV++1ywSY4mf1TyhOoee7OVz5ta6A94e22IvHnbVs?=
 =?us-ascii?Q?VO6LTLfG97gD+7YWHpbuwe17uIf8ixp+JT77lTIqS59FIuQ/iAfx+raLe7Vt?=
 =?us-ascii?Q?sbB90/6E3dbTb8tM4oUe5QVnvBCVJZ7p7pM5DHadl+4vYiXHkLdLV5YhgXK3?=
 =?us-ascii?Q?pfot+xifHxlrYY399sTGhkgWSW8ZDgdRMwgQNGDDF7XWRq27qfIM1C32BpnU?=
 =?us-ascii?Q?qW5D6UPrgB66AWR8sUQ2TQfOLNhskdEnl0srdCB2JDy0ug7Ln3D/OAbgjaEy?=
 =?us-ascii?Q?akngvcsXIBJ+cjPDoSviZ1FmXM6kxAgqKL7G25BZrW0ysQwJuC2ivgqHLs18?=
 =?us-ascii?Q?QGp2w+5dCIyCq+8LoReggOeunpiXu0tFA8momPCoal7JvrLoR6HIA+kymhqa?=
 =?us-ascii?Q?AJESJLAwnrr4Ggk+0g/t9k87vjyDsgBUMya6yauXTuY+5mnT5SSW16BjXcL/?=
 =?us-ascii?Q?62txkQ+OX1AzZOAT5E1Gd/PukJ/t08LxFViIMbiZrimVcapH0fT2+ZyFSLcd?=
 =?us-ascii?Q?ZzS+F19TeAU/3bU7OUEXgvWwNvJB9byzOMKN1U/TA3cO5i8gNVtYzkZqQiWg?=
 =?us-ascii?Q?7BNFP1vd0owvsUBuGddUcgmIwyfZHsGE9iCcpnjSatpijvmR/Ha//NJksd07?=
 =?us-ascii?Q?acmMr8FWZG60ok2m+V/Nf8rBN3iDorrNq58AfGdLHRirtjku1LCZUwxPeBqq?=
 =?us-ascii?Q?7BumBn5Jqz/Jl+hMwegyKa66zRgykBggUgT/PJsI5QhG1zw/E9gW7DhxAhTJ?=
 =?us-ascii?Q?JWYRbwsYylIYLi0dGJkNSPKuCsSR3QQk5d8FeNHy6eHLXL1ru0JRsev8nnru?=
 =?us-ascii?Q?M6bI7UPptpFbt3DUXvTU6WUTbcUmqjDCCUwImRuVVLZ/plKUaAH0PKCNoQcv?=
 =?us-ascii?Q?d/XLXwcc+fwBOa0RCLGv/2p/eJ1GTTp6BvT9m8XYcZYC2Vd+Lk1bsB+d82q7?=
 =?us-ascii?Q?yQk3GKedxHFFZjf7bKEwLcywv0Uzf8NY5CoWhWqQFtHtprhIe08Ae7H6MSVY?=
 =?us-ascii?Q?Ee4odeqENgOE9wq2h81mrASdz7Fs6YSyWVh7i++gugqu5+4cmJZjHYf9TkAE?=
 =?us-ascii?Q?1Z+4p9CZfJmA4dBOEquetMYeXiC6dfWM2Ub6m0YuVWk1z/6+fyuiKkpivDbp?=
 =?us-ascii?Q?s8xgycr/H8YCy1KZnb47pQ6vsTVSGEFoEoae6vcurVW19P8bBPYGwSx2DR0g?=
 =?us-ascii?Q?FyYaD/f1ZPV0x0yYWByujZ9s5x8SJTQsDc8zEkWjKDrjdd3NNGjXWV+pf+dO?=
 =?us-ascii?Q?3KE1AJT/nn9Lwq53pNG3snaB7KZkV5jD8X8+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 17:48:55.9671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e94677d-1d83-4e4c-7b31-08ddf5494edd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646
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

In amdxdna_gem_obj_vmap(), calling dma_buf_vmap() triggers a kernel
warning if LOCKDEP is enabled. So for imported object, use
dma_buf_vmap_unlocked(). Then, use drm_gem_vmap() for other objects.
The similar change applies to vunmap code.

Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated buffer")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c | 47 ++++++++++++-----------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index d407a36eb412..7f91863c3f24 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -392,35 +392,33 @@ static const struct dma_buf_ops amdxdna_dmabuf_ops = {
 	.vunmap = drm_gem_dmabuf_vunmap,
 };
 
-static int amdxdna_gem_obj_vmap(struct drm_gem_object *obj, struct iosys_map *map)
+static int amdxdna_gem_obj_vmap(struct amdxdna_gem_obj *abo, void **vaddr)
 {
-	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
-
-	iosys_map_clear(map);
-
-	dma_resv_assert_held(obj->resv);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
+	int ret;
 
 	if (is_import_bo(abo))
-		dma_buf_vmap(abo->dma_buf, map);
+		ret = dma_buf_vmap_unlocked(abo->dma_buf, &map);
 	else
-		drm_gem_shmem_object_vmap(obj, map);
-
-	if (!map->vaddr)
-		return -ENOMEM;
+		ret = drm_gem_vmap(to_gobj(abo), &map);
 
-	return 0;
+	*vaddr = map.vaddr;
+	return ret;
 }
 
-static void amdxdna_gem_obj_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
+static void amdxdna_gem_obj_vunmap(struct amdxdna_gem_obj *abo)
 {
-	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
+	struct iosys_map map;
+
+	if (!abo->mem.kva)
+		return;
 
-	dma_resv_assert_held(obj->resv);
+	iosys_map_set_vaddr(&map, abo->mem.kva);
 
 	if (is_import_bo(abo))
-		dma_buf_vunmap(abo->dma_buf, map);
+		dma_buf_vunmap_unlocked(abo->dma_buf, &map);
 	else
-		drm_gem_shmem_object_vunmap(obj, map);
+		drm_gem_vunmap(to_gobj(abo), &map);
 }
 
 static struct dma_buf *amdxdna_gem_prime_export(struct drm_gem_object *gobj, int flags)
@@ -455,7 +453,6 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 {
 	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
 	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
-	struct iosys_map map = IOSYS_MAP_INIT_VADDR(abo->mem.kva);
 
 	XDNA_DBG(xdna, "BO type %d xdna_addr 0x%llx", abo->type, abo->mem.dev_addr);
 
@@ -468,7 +465,7 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 	if (abo->type == AMDXDNA_BO_DEV_HEAP)
 		drm_mm_takedown(&abo->mm);
 
-	drm_gem_vunmap(gobj, &map);
+	amdxdna_gem_obj_vunmap(abo);
 	mutex_destroy(&abo->lock);
 
 	if (is_import_bo(abo)) {
@@ -489,8 +486,8 @@ static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
 	.pin = drm_gem_shmem_object_pin,
 	.unpin = drm_gem_shmem_object_unpin,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = amdxdna_gem_obj_vmap,
-	.vunmap = amdxdna_gem_obj_vunmap,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = amdxdna_gem_obj_mmap,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 	.export = amdxdna_gem_prime_export,
@@ -663,7 +660,6 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
 			    struct drm_file *filp)
 {
 	struct amdxdna_client *client = filp->driver_priv;
-	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
 	struct amdxdna_gem_obj *abo;
 	int ret;
@@ -692,12 +688,11 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
 	abo->mem.dev_addr = client->xdna->dev_info->dev_mem_base;
 	drm_mm_init(&abo->mm, abo->mem.dev_addr, abo->mem.size);
 
-	ret = drm_gem_vmap(to_gobj(abo), &map);
+	ret = amdxdna_gem_obj_vmap(abo, &abo->mem.kva);
 	if (ret) {
 		XDNA_ERR(xdna, "Vmap heap bo failed, ret %d", ret);
 		goto release_obj;
 	}
-	abo->mem.kva = map.vaddr;
 
 	client->dev_heap = abo;
 	drm_gem_object_get(to_gobj(abo));
@@ -748,7 +743,6 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
 			  struct amdxdna_drm_create_bo *args,
 			  struct drm_file *filp)
 {
-	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
 	struct amdxdna_gem_obj *abo;
 	int ret;
@@ -770,12 +764,11 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
 	abo->type = AMDXDNA_BO_CMD;
 	abo->client = filp->driver_priv;
 
-	ret = drm_gem_vmap(to_gobj(abo), &map);
+	ret = amdxdna_gem_obj_vmap(abo, &abo->mem.kva);
 	if (ret) {
 		XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
 		goto release_obj;
 	}
-	abo->mem.kva = map.vaddr;
 
 	return abo;
 
-- 
2.34.1

