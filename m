Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1089A3FC4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 15:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1BB10E92B;
	Fri, 18 Oct 2024 13:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZIAGzOF0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2DB10E92B;
 Fri, 18 Oct 2024 13:33:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2/e3uozGcpE06NkyXmIr9a1/iof1cXqNsEbgYDZxVEA9d+wtl4RX0Vib07t2pVP3IQLw3qMD+d3Jw1dyI3W8Mpm1H0YveasjzKlq/YmuCxCazYPtlg1oJAoeKBuFwoQouLo34Ry0AqHDUCmTcXxQiwQfEKQIfnOXuSePYANGedMY53XLoISSO+h6HZACBUprhWRU1XXWWgk/x1Kk9tFmSjVT53iCde0NujQznuiwckv1HPY4PYOc7oEj9H1NKrJNHLTP6rXFEcMcnCfshPKDBCFtQqYYL3IBjL98bTgFzqhgL6O/2lRwuxSXvSpPYIuzQXWvqck8gomK32nh1z/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO+7dCLe9uTh2aOMnLC2eLAtbafJaF+b4dRzmUMlYMo=;
 b=weggGrTyiHAGsVRww2qROEtOXC8EGlpv13i0P0lAAlEasLqaJz1cmJDnd82IJhYAPhz29wpBQ9wdhzBBtPR6SJxGhVPuZ1XPDAMQHrTZ6yan4f9Rzg0E5/RwubnPbGCd4gJXmIwk4CPG7tK/t+uDgj6fz0pCPq6lUFCbhQ/FUa6Rgthtzp1tXxkIrpA7nI/iU8iomLfuOUUzu8Me5UYnQK6khZta6/oglqVF7NWokR4eTT3AlfJE1uxTGcxBmCNClOCrsyKOYKmJysbm+7yFKmJmaQEPxi7P9GjorQEmMbztC6LribMvagPTj42pzRQjYs5QxUf8yvt1YzmG52I6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO+7dCLe9uTh2aOMnLC2eLAtbafJaF+b4dRzmUMlYMo=;
 b=ZIAGzOF069UVz4xCFNV3rbnQKXm20px4qUanyCz5eQZ3djpdNYsyziIpUwXInlKsmqh9s/DkyunysMUdMsu7u/lG/yVUoRqVyxKydxBZ4LZwssotlJFEZeB6dVGmCUdBpIBFD06t2KP0ddKvbVjachNKiK/Sr9/HqEWKzbNMhP8=
Received: from BLAPR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:335::7)
 by MW3PR12MB4425.namprd12.prod.outlook.com (2603:10b6:303:5e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 13:33:52 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::42) by BLAPR05CA0027.outlook.office365.com
 (2603:10b6:208:335::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.10 via Frontend
 Transport; Fri, 18 Oct 2024 13:33:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 13:33:52 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 08:33:49 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v5 3/4] drm/amdgpu: stop tracking visible memory stats
Date: Fri, 18 Oct 2024 09:33:07 -0400
Message-ID: <20241018133308.889-4-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018133308.889-1-Yunxiang.Li@amd.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|MW3PR12MB4425:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8e4708-9f2c-4c23-477e-08dcef798176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YGf14MpANixQty3E7pXrgcye2ayjBbUFJ6l3XiLBmicycvE6e/QPxBB6/12g?=
 =?us-ascii?Q?eGiwio2/Xzj+pSWE5yAjEI3/dF6s9e0Z4s4CrP0B2y0on0d8qvrZY9c7NtA9?=
 =?us-ascii?Q?nHCe8onAQ2Khj90IHyH4rlhGoG24lOhUZMrh3VUUIaqjTtLfJPi1mAdN7Q7A?=
 =?us-ascii?Q?qQIGKxEU8AsAfhkuYp8sBrfKHPhsaFCsApRY3f05NPJQ4Qj2lCpzFSlDTJCi?=
 =?us-ascii?Q?nHGnLhrvNy0c+R3lkP+WyZ2ik98SXr4sqx/T4XQRUYLOM55J0BXjsavRlH7p?=
 =?us-ascii?Q?RZeKpbzD4JaW3r+p6utB5MS/0Hty4iR4aptheOcJzBQJiSVuFSx1oYQ4xv/Z?=
 =?us-ascii?Q?1Rz94QkW/+4uA4ItX2++rMYdBcVUGt9tqssvp/6IEL0ADGKkAOHRPz4BJ1Ni?=
 =?us-ascii?Q?HjN8pH+7TFbcjXyTIQibz6VTohKmOIqq/xwGTgTiHyt2ABf+/aHmf7yuLMYI?=
 =?us-ascii?Q?ZUVw/xGLEJfwyBfPB3xHhgNZeucv1juJ4FAujLhN0nKKrJg+f+kw1WerxYST?=
 =?us-ascii?Q?6jReYM1H1G1QazDURLwosXHhq4ZB1V8z8Tf0kPPI+c/0mab5j6IAeGWSUNMt?=
 =?us-ascii?Q?CXoRLSdrV0Fc1dkIqfQBofdANmU+sFe022YsC06kyUMNhgP41LYmrcY9hg8j?=
 =?us-ascii?Q?EeNeENDG0C+81ahVFA1PdfYry//z6ektsUBtTwDyVWCioJrtpeqHN86ZStjc?=
 =?us-ascii?Q?bXbraXl78ZHaOVCT0Qqw7/eQyvAfdaUyYTucrc8GLQXqz5+KzzoG9AY8W/lA?=
 =?us-ascii?Q?J5rilAbdSznXsX7J0ngXsZGQBR2lefg9r6RXg7TH9oD/lkEJQsCViWqnKrEu?=
 =?us-ascii?Q?622MraOuyMwoiuir3y3AoDaxfDMhdIOpdECWR+ihfMHkZzsxLTYi3okAu2XZ?=
 =?us-ascii?Q?ou06fHjMsjxR1jHSHn+oDbNhb6oMh/1BsUWvYn9n1UE3gFTuV9UM+am4IYjC?=
 =?us-ascii?Q?DxW/R1bCgSl4UBJ3lbqCPcszbwooGCQC3yhaO8X9pWjTFMl+EguVX8E5ffyN?=
 =?us-ascii?Q?5KF1zVnPnEP4jQxhsAxwEdZKn48rORGgj2Hm+SNI0UsDu76B7gibbRkAU6NI?=
 =?us-ascii?Q?ZHBDFo87HMpxrsozTepYNfmtdRQPrNd0+QzBC2j0nwhK/TIEBqpQ7MpVAcHI?=
 =?us-ascii?Q?9RCoNiSIr+yoNBU7LAZb8KZ9bes/dW73mS4tDvn/0Pfnm6Mnwjnm4bpeX4/B?=
 =?us-ascii?Q?6U2hcn0caNZcUdYlwKgW2eT8jnCpMhXz8fDl0QSlFDmmtNkyCvtvtUVRmv08?=
 =?us-ascii?Q?JnHth3CC6/M54z2k+qGdWmTMG62/rCeyZb1ow/Smif31b9abRblAAJpX1e4Y?=
 =?us-ascii?Q?aixv20JxITgsCOXvQ/Pq1g4DOQbvPZqJ9H+E5LbOxGByGyhNXc0rnCNxpCIh?=
 =?us-ascii?Q?wQ92EvDsU+q7JZtjatHvlxvpzc0LN45tZCJ7qTPf4bnXBQsEtg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:33:52.1236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8e4708-9f2c-4c23-477e-08dcef798176
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4425
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

Since on modern systems all of vram can be made visible anyways, to
simplify the new implementation, drops tracking how much memory is
visible for now. If this is really needed we can add it back on top of
the new implementation, or just report all the BOs as visible.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 10 ----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h     | 11 ++++++++++-
 4 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 8281dd45faaa0..7a9573958d87c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -103,16 +103,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 		   stats[TTM_PL_SYSTEM].drm.resident/1024UL);
 
 	/* Amdgpu specific memory accounting keys: */
-	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
-		   stats[TTM_PL_VRAM].visible/1024UL);
 	drm_printf(p, "amd-evicted-vram:\t%llu KiB\n",
 		   stats[TTM_PL_VRAM].evicted/1024UL);
-	drm_printf(p, "amd-evicted-visible-vram:\t%llu KiB\n",
-		   stats[TTM_PL_VRAM].evicted_visible/1024UL);
 	drm_printf(p, "amd-requested-vram:\t%llu KiB\n",
 		   stats[TTM_PL_VRAM].requested/1024UL);
-	drm_printf(p, "amd-requested-visible-vram:\t%llu KiB\n",
-		   stats[TTM_PL_VRAM].requested_visible/1024UL);
 	drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
 		   stats[TTM_PL_TT].requested/1024UL);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 2a53e72f3964f..2436b7c9ad12b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -40,6 +40,7 @@
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
 #include "amdgpu_vram_mgr.h"
+#include "amdgpu_vm.h"
 
 /**
  * DOC: amdgpu_object
@@ -1235,23 +1236,14 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
 			stats[type].drm.active += size;
 		else if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
 			stats[type].drm.purgeable += size;
-
-		if (type == TTM_PL_VRAM && amdgpu_res_cpu_visible(adev, res))
-			stats[type].visible += size;
 	}
 
 	/* amdgpu specific stats: */
 
 	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
 		stats[TTM_PL_VRAM].requested += size;
-		if (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
-			stats[TTM_PL_VRAM].requested_visible += size;
-
-		if (type != TTM_PL_VRAM) {
+		if (type != TTM_PL_VRAM)
 			stats[TTM_PL_VRAM].evicted += size;
-			if (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
-				stats[TTM_PL_VRAM].evicted_visible += size;
-		}
 	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
 		stats[TTM_PL_TT].requested += size;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index a5653f474f85c..be6769852ece4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -139,16 +139,6 @@ struct amdgpu_bo_vm {
 	struct amdgpu_vm_bo_base        entries[];
 };
 
-struct amdgpu_mem_stats {
-	struct drm_memory_stats drm;
-
-	uint64_t visible;
-	uint64_t evicted;
-	uint64_t evicted_visible;
-	uint64_t requested;
-	uint64_t requested_visible;
-};
-
 static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
 {
 	return container_of(tbo, struct amdgpu_bo, tbo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 428f7379bd759..6a1b344e15e1b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -42,7 +42,6 @@ struct amdgpu_bo_va;
 struct amdgpu_job;
 struct amdgpu_bo_list_entry;
 struct amdgpu_bo_vm;
-struct amdgpu_mem_stats;
 
 /*
  * GPUVM handling
@@ -322,6 +321,16 @@ struct amdgpu_vm_fault_info {
 	unsigned int	vmhub;
 };
 
+struct amdgpu_mem_stats {
+	struct drm_memory_stats drm;
+
+	/* buffers that requested this placement */
+	uint64_t requested;
+	/* buffers that requested this placement
+	 * but are currently evicted */
+	uint64_t evicted;
+};
+
 struct amdgpu_vm {
 	/* tree of virtual addresses mapped */
 	struct rb_root_cached	va;
-- 
2.34.1

