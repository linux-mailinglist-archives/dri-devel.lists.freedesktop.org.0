Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C984B9BAA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 10:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E21510EBAE;
	Thu, 17 Feb 2022 09:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E625910EBAE;
 Thu, 17 Feb 2022 09:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/LJavLhnBAGZXSR1yIb0NUT83JlqdN5ICabm5Yl4khFxz3q7aY6+gTOkKN4aelDtIZPBQ7NDoemzVSjrlVBiD+yDbYs9qG59D/nfJw7CLPD1/BX6fGw00VI+spNtakZ/TQdIZ4wi1EL5Ze6eq89scRc6RSk7tsyXJN7S3LQ9plcsBe3J8FMicLgVE1R0d00l2y/jdiNLMURkVvSNgUvrvGkwWfN1znPdLna8Q788mfPJLJSZSoWHykxMY5KvRo7ijEUwM0n/PqiQ/jvTO4AJIezoKzxSrFpgroO8E8yyTBwevoXG/i/QrVMPag7G/t5sW3H1ODGwFRMbiPby9K3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StHzjCXPDIh1RmTRrJTpZuB5CrJBaEqQAEe5wHy8V/E=;
 b=Z7xAgIggt+1tl0Los6aR7Oz4v0OIBNdCbzpXvh9tlvgfAXl1N0CuksUonv7QoIFsvki+F1hm477hLH5/La5FlwighkPjv6BRvpByVDDI7wYoka35V0dpzn2KSPAvCTMYqWnwJDY8kYBjReR9B4OJtVnfpM635v7aoloP+0c9qHGKaFoXlXoBCY4oXMSxbPfnEIl6XR5VW9twKyao8m69qxnVjYOxpN9xnx6SPCO+2+xBtIJg8NdMXUrRIExNUwEK942rxyQuecSlvCU/Y2BhBFUpCcwF3ESnJpL4zMiAgMl4rEwMxGGSnhjGAeZqHLDejxKg8j+w9O+CJk3zVezz5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StHzjCXPDIh1RmTRrJTpZuB5CrJBaEqQAEe5wHy8V/E=;
 b=k+A88yK0X8fni6rNzxh3vqRw0uG4onAigMpwD3egPc79J1e1uEy9mxuONQGIz/dxzId819+oFEGQPs/uBDxrCOlzOW+q5d5UUyyqwTdJ3MK3PdgXPp+O4qoqT92Wu1Ddb63TzGNi8z4Tf2Kg9rHyIV8wO/JBtgv7TImleDfySyA=
Received: from MW4PR03CA0358.namprd03.prod.outlook.com (2603:10b6:303:dc::33)
 by BY5PR12MB3858.namprd12.prod.outlook.com (2603:10b6:a03:1a7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Thu, 17 Feb
 2022 09:05:09 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::47) by MW4PR03CA0358.outlook.office365.com
 (2603:10b6:303:dc::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Thu, 17 Feb 2022 09:05:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Thu, 17 Feb 2022 09:05:09 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 03:05:01 -0600
From: Qiang Yu <qiang.yu@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
Date: Thu, 17 Feb 2022 17:04:40 +0800
Message-ID: <20220217090440.4468-1-qiang.yu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e408c89-bb10-4a9e-9248-08d9f1f49946
X-MS-TrafficTypeDiagnostic: BY5PR12MB3858:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB38584CBACA7582C99EC849908F369@BY5PR12MB3858.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pd3LYVcYFLpZwCSiUZpmHN0+UWsIRwJwVhUaX8PztcnS984npCdqc0ZFysAUIBN01H7dGcnalLWDuzkMCdbIZgsbzDzEOsY1jQaSo5eW1WF97EnIb1TypXlBDA1XcNxL+gODHAe4k3RQcI2UPy474YJSR/FGqZ4Qjr1+t79fGI2pNzFmVLDwzZNs5kCbdOiEk/etxYxfGDfCgN7rEPA1Wyih80mhRxwe4v/PZkUHyaqb4Hzfkj7qmRPUsBs+21ACFb5UitnT2noVhn3pJO5nB518SekU61IOyWLHu1jFE7vRxSCJVAM5KNQUs+N5/ZOgSCPnt+ClldlCZ87TCA7Sdqql029yJ+dOJLpyOFO7NCuWMgWKolLnwqKUxCfMrIwwHe5uXP73jThTO9e5qnZlHSYdvUXK70xvn9SkLqrLbKl69PtH/I+qUB0+pHhahj03IwJeYncjdJe+7+bdZEQKWtY2skEHS7JcLiCHLD5Hj/xZOQ7MSuuoTeL12pFXuFFkQxEclLe1gHr6NvZMm867yvTXerdfVnVG3ycDoh/ilzBaFDeY4v5QGnBwSinkp+DwBziwSNseiQbyfxZ2ZsQRDjF2wG7jtwESGNPw545zUtVcDBSY5JyB4z2k+ff2tffbcjGUcow1K47q2AMQLNaXhYnyGzRUQAfFS4BLkZH4jnpoy7VZIpSE6B8luZ7JDVI3yBmfyEtj2LN2rXTVqHdTZA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(356005)(316002)(8936002)(110136005)(54906003)(16526019)(5660300002)(26005)(426003)(1076003)(83380400001)(186003)(2616005)(2906002)(6666004)(36756003)(40460700003)(47076005)(70586007)(44832011)(336012)(36860700001)(82310400004)(8676002)(81166007)(70206006)(508600001)(4326008)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 09:05:09.3614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e408c89-bb10-4a9e-9248-08d9f1f49946
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3858
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Qiang Yu <qiang.yu@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Workstation application ANSA/META get this error dmesg:
[drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)

This is caused by:
1. create a 256MB buffer in invisible VRAM
2. CPU map the buffer and access it causes vm_fault and try to move
   it to visible VRAM
3. force visible VRAM space and traverse all VRAM bos to check if
   evicting this bo is valuable
4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
   will set amdgpu_vm->evicting, but latter due to not in visible
   VRAM, won't really evict it so not add it to amdgpu_vm->evicted
5. before next CS to clear the amdgpu_vm->evicting, user VM ops
   ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
   but fail in amdgpu_vm_bo_update_mapping() (check
   amdgpu_vm->evicting) and get this error log

This error won't affect functionality as next CS will finish the
waiting VM ops. But we'd better make the amdgpu_vm->evicting
correctly reflact the vm status and clear the error log.

Signed-off-by: Qiang Yu <qiang.yu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++-----------
 1 file changed, 47 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 5a32ee66d8c8..88a27911054f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
 	return flags;
 }
 
-/*
- * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
- * object.
- *
- * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
- * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
- * it can find space for a new object and by ttm_bo_force_list_clean() which is
- * used to clean out a memory space.
- */
-static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
-					    const struct ttm_place *place)
+static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_object *bo,
+					     const struct ttm_place *place)
 {
 	unsigned long num_pages = bo->resource->num_pages;
 	struct amdgpu_res_cursor cursor;
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
-	int i;
-
-	/* Swapout? */
-	if (bo->resource->mem_type == TTM_PL_SYSTEM)
-		return true;
-
-	if (bo->type == ttm_bo_type_kernel &&
-	    !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
-		return false;
-
-	/* If bo is a KFD BO, check if the bo belongs to the current process.
-	 * If true, then return false as any KFD process needs all its BOs to
-	 * be resident to run successfully
-	 */
-	flist = dma_resv_shared_list(bo->base.resv);
-	if (flist) {
-		for (i = 0; i < flist->shared_count; ++i) {
-			f = rcu_dereference_protected(flist->shared[i],
-				dma_resv_held(bo->base.resv));
-			if (amdkfd_fence_check_mm(f, current->mm))
-				return false;
-		}
-	}
 
 	switch (bo->resource->mem_type) {
 	case AMDGPU_PL_PREEMPT:
@@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 		return false;
 
 	default:
-		break;
+		return ttm_bo_eviction_valuable(bo, place);
 	}
+}
 
-	return ttm_bo_eviction_valuable(bo, place);
+/*
+ * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
+ * object.
+ *
+ * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
+ * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
+ * it can find space for a new object and by ttm_bo_force_list_clean() which is
+ * used to clean out a memory space.
+ */
+static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
+					    const struct ttm_place *place)
+{
+	struct dma_resv_list *flist;
+	struct dma_fence *f;
+	int i;
+
+	/* Swapout? */
+	if (bo->resource->mem_type == TTM_PL_SYSTEM)
+		return true;
+
+	/* If bo is a KFD BO, check if the bo belongs to the current process.
+	 * If true, then return false as any KFD process needs all its BOs to
+	 * be resident to run successfully
+	 */
+	flist = dma_resv_shared_list(bo->base.resv);
+	if (flist) {
+		for (i = 0; i < flist->shared_count; ++i) {
+			f = rcu_dereference_protected(flist->shared[i],
+				dma_resv_held(bo->base.resv));
+			if (amdkfd_fence_check_mm(f, current->mm))
+				return false;
+		}
+	}
+
+	/* Check by different mem type. */
+	if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
+		return false;
+
+	/* VM bo should be checked at last because it will mark VM evicting. */
+	if (bo->type == ttm_bo_type_kernel)
+		return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
+
+	return true;
 }
 
 static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t pos,
-- 
2.25.1

