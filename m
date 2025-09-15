Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3996DB581AF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 18:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E923710E00B;
	Mon, 15 Sep 2025 16:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="phh/7Kq8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011007.outbound.protection.outlook.com [52.101.57.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463A110E00B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 16:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abtvWPXA/Z+gzmk4kD5C6xuDkMJjs/tuH4e5n0U0xCUqSDUiJDvo4VtRbhQa5Srg3mZGLywliuLHuhskmsXZH9ltYdaC2V3ANe0jZd5v5h8pHtAer/jt8OnTZDFF7ox9Y1MqFV664FwAB5QAy5jlN5nlnbpsqYiaZXev6JcokLAGY87oBAA/zm+7VpknTppUCCqOx8aTzGYxX+kIe4xvcDCvk1FF9A96ehFnFoLEhfpwLjXteAOGsReQuebDzbgjb7a7UNhE4we5lG17G/mhIGtRJlz4/hKOLKw5xCQuPhVC6yVoTlPGr0yX8m++D+/SHvZQJszvXtU+zzQMTbJpmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaJLFsL7SJNBSxArsA8FzmfBwN8i3Y4OIRMyN4sMru0=;
 b=gfoCA62jB333IBDyKBhX+z3VQ00qKRjozEReYcKrBV+t8cCL3oPYTFUf6ELgqX6YBIh4Dls3Ylp55DcfW4VtAx+feB7s37nHiMK1rHrOo6czvWU/6i/bE4y+sVPUrXO1AB+NxxQe66wR2g4FkwJpQoF3boc0UuQZ2l7pTMPcHCftMn8Rm8Flt+mTVWLlGIWfVabLMEnVyV6ZPv2v4XkZXo1+OjWpTwfM8ip5TuX1mvpTdsIV/IrV6vZhHjqdcIaH6KdVNRiHYZPqXm+lYS7+xFSJx+jn+fIr5vrkECADLF4UMjvw/KtpwNH1iOMn4WFyQd0bytFCaF49b2P55Xk4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaJLFsL7SJNBSxArsA8FzmfBwN8i3Y4OIRMyN4sMru0=;
 b=phh/7Kq8Z6jNtO005wQ7kfOnbXG9nw+5SF71QDeNjQnjLV/FeMPznVIgT4CdCPMgLxA0fb8hPDjEEA9N6UoOqNpi1O7Hdxngr/EECXcJaXpkQnnCqOeMDWQCRcGMTrm/vbJBjPNkLj+eqbTRAR1AnXj8aDc8RxzhC8sN3Pk1MFY=
Received: from BL0PR02CA0085.namprd02.prod.outlook.com (2603:10b6:208:51::26)
 by DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.19; Mon, 15 Sep 2025 16:10:50 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:51:cafe::30) by BL0PR02CA0085.outlook.office365.com
 (2603:10b6:208:51::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Mon,
 15 Sep 2025 16:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 15 Sep 2025 16:10:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Sep
 2025 09:10:50 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Sep
 2025 09:10:49 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Sep 2025 09:10:49 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [RESEND PATCH V1] accel/amdxdna: Call dma_buf_vmap_unlocked() for
 imported object
Date: Mon, 15 Sep 2025 09:10:46 -0700
Message-ID: <20250915161046.135243-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 877f2af0-a1f3-4db0-df6b-08ddf4727036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yLMBNfg7MBRPlX9UWkdisV3vKUNcPCg2+KvB9vBjL2oeK75rF/JWH4mnLro6?=
 =?us-ascii?Q?gwJ9+qX8w/UQveCFp3CLraKvf99qJ91oV4Ft7JRLkbUsX89dCJtgp74xLvyR?=
 =?us-ascii?Q?E5HNJm54hBYBmgUSc0hhCHy7dkZ/WPNKLvqyl9g8n4FvIwGoSK9FJUnaCeMe?=
 =?us-ascii?Q?9wXlAp5k3zoIDPZ4EpV5ir6ctRKHYEuOIWuIT+z9kPyOTZQiFkPDKKqS8V8A?=
 =?us-ascii?Q?Zcal0wcLwTI8ZPE8CdJ/lscjNRroE4oKpOAplacI/oIQaJXn1thQw2Ay2SEk?=
 =?us-ascii?Q?qSgf+9/MJe9efLkjDiNXMMZBZTOWgSdOHcXIJKFIXXyLaSvjJvHEtvQrX4zw?=
 =?us-ascii?Q?j4NnauOndnX0ftGlCFu2ovgaDr+czBQ86PlGQzweaVPTfOAiyIWUJnllwcAC?=
 =?us-ascii?Q?MyLF7T4Om0v41NU6yzCNtXpyqLmr+fN1KIosnA7mQjLQrUK2yUgi6YZOKlBk?=
 =?us-ascii?Q?rMbB2nT/NpM/2863PGY2TOc/nrd32ziU3LYNQXe33EtXqv0d97qSTAjNZQfN?=
 =?us-ascii?Q?u6FAkT64Uxa5uFmbyVGts0MCfU+x965V9FmXYnLw2kCX8bQ8hPMr2z1tcLzM?=
 =?us-ascii?Q?9V+yQ+td2NHPZcvZQxzcCdnVLAdwYgcdP3TQV8bMKitcO5SMi8tjafpUtbRr?=
 =?us-ascii?Q?mwcxt0hXurArPjqqUVQhFH4q9eZRVIncn2Bcj4vDM6iJ8440rigHRYlsbfV2?=
 =?us-ascii?Q?hk8rXmlTgISoUr3tGo3MZUBXbWzb3Jn8tnvYgT/RM2yY6aB9gBMBGc/PhmQ7?=
 =?us-ascii?Q?K+91ss3/bk0DqyxjK3kKbZM871id9j77AMc10sRVgdT/cM7DDWigwme8yRro?=
 =?us-ascii?Q?JkAkseP3Uds+zy+fiGW6pHiN2W509qIwH9Jc2jypDS8iMXWDFx7gama7MoPd?=
 =?us-ascii?Q?vzd0v6tO/m+GBDpH8yY6ubv5oT8z09oIhu8v8L5AABcsiXRnLDcwTQHVOUjh?=
 =?us-ascii?Q?AAyR0dXBX4dqM8H6IiSxONnhMRJ+hLZZoYDV4uGJ1T6K1KgojRI6aG600H2v?=
 =?us-ascii?Q?Y6TJl3cJO9ZHzED+IXBQiIdCZRt93AmAqPPMy56mg1k/8SCwOIR+2Ss6PurM?=
 =?us-ascii?Q?0WffxO/hOQMK9Kd9pH92+A4etViChOig40jVtLeFb1642r/QTPVDouvVyX05?=
 =?us-ascii?Q?KWif6cCBxL6Agqs1lVdOcqQ0ozHkEOT/+qDlj6Qc2OynAeWfVzcaAtGt/QnZ?=
 =?us-ascii?Q?Kkq+qI2+ZIrWxmWqwISOxuUaxF3lOwcOweoFvgUdgTqdW6oTVPccyV5QnRMF?=
 =?us-ascii?Q?BpDEaJqB3I2kBIOXBXTakNGoimzn64oBdafDeTjzpMTDnkZE50KO76NXW7Mg?=
 =?us-ascii?Q?Emor8UK44XhRqRlbU7g8ZGv0N2ifyB3ZM9qObRb+Xbj2pSoeX3zedM2E81ix?=
 =?us-ascii?Q?apS6es2TYem555PK9cu5JRp8vdTl46cQryegVPOL8NlPVrwO+El+DVZPiq/M?=
 =?us-ascii?Q?i4+YBaWPW6LojeJTA/uM40Gtco00Z8r8/CLn4u7akiuefX7WIa/7TM2iaRsi?=
 =?us-ascii?Q?1JtU3RrJfDbL08F/ZHJTijOfDmoL5yu+xN6I?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 16:10:50.2137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 877f2af0-a1f3-4db0-df6b-08ddf4727036
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293
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
 drivers/accel/amdxdna/amdxdna_gem.c | 38 +++++++++++------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index d407a36eb412..50950be189ae 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -392,35 +392,25 @@ static const struct dma_buf_ops amdxdna_dmabuf_ops = {
 	.vunmap = drm_gem_dmabuf_vunmap,
 };
 
-static int amdxdna_gem_obj_vmap(struct drm_gem_object *obj, struct iosys_map *map)
+static int amdxdna_gem_obj_vmap(struct amdxdna_gem_obj *abo, struct iosys_map *map)
 {
-	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
-
 	iosys_map_clear(map);
 
-	dma_resv_assert_held(obj->resv);
-
 	if (is_import_bo(abo))
-		dma_buf_vmap(abo->dma_buf, map);
-	else
-		drm_gem_shmem_object_vmap(obj, map);
-
-	if (!map->vaddr)
-		return -ENOMEM;
+		return dma_buf_vmap_unlocked(abo->dma_buf, map);
 
-	return 0;
+	return drm_gem_vmap(to_gobj(abo), map);
 }
 
-static void amdxdna_gem_obj_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
+static void amdxdna_gem_obj_vunmap(struct amdxdna_gem_obj *abo, struct iosys_map *map)
 {
-	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
-
-	dma_resv_assert_held(obj->resv);
+	if (iosys_map_is_null(map))
+		return;
 
 	if (is_import_bo(abo))
-		dma_buf_vunmap(abo->dma_buf, map);
-	else
-		drm_gem_shmem_object_vunmap(obj, map);
+		return dma_buf_vunmap_unlocked(abo->dma_buf, map);
+
+	return drm_gem_vunmap(to_gobj(abo), map);
 }
 
 static struct dma_buf *amdxdna_gem_prime_export(struct drm_gem_object *gobj, int flags)
@@ -468,7 +458,7 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
 	if (abo->type == AMDXDNA_BO_DEV_HEAP)
 		drm_mm_takedown(&abo->mm);
 
-	drm_gem_vunmap(gobj, &map);
+	amdxdna_gem_obj_vunmap(abo, &map);
 	mutex_destroy(&abo->lock);
 
 	if (is_import_bo(abo)) {
@@ -489,8 +479,8 @@ static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
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
@@ -692,7 +682,7 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
 	abo->mem.dev_addr = client->xdna->dev_info->dev_mem_base;
 	drm_mm_init(&abo->mm, abo->mem.dev_addr, abo->mem.size);
 
-	ret = drm_gem_vmap(to_gobj(abo), &map);
+	ret = amdxdna_gem_obj_vmap(abo, &map);
 	if (ret) {
 		XDNA_ERR(xdna, "Vmap heap bo failed, ret %d", ret);
 		goto release_obj;
@@ -770,7 +760,7 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
 	abo->type = AMDXDNA_BO_CMD;
 	abo->client = filp->driver_priv;
 
-	ret = drm_gem_vmap(to_gobj(abo), &map);
+	ret = amdxdna_gem_obj_vmap(abo, &map);
 	if (ret) {
 		XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
 		goto release_obj;
-- 
2.34.1

