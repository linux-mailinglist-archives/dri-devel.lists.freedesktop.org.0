Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2051C9EB8E2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 19:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8709B10E2D0;
	Tue, 10 Dec 2024 18:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fTJbSE/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE3010E05B;
 Tue, 10 Dec 2024 18:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiO8JqFKMXcFIlQyGxaGvCd8KsW/Mtjfk0JdV9Bca/DyfnYhwKi+Mg71e56MTP9JUylpLL7mFMTECjNYOpX7W70cDwuf9d3FZtw78lqxhh5QtZTfpUoUkK4vZWwpff2yDzhQZGq59G2E16MDiXOiTEQ65b9OwcNe7dpfz6SOnnsugKDOIfiWijMxCmc/SPYxN0pkr/aOntiNSTtznLd4DMrW8YQ1JJ77zKA1+suEecZMXHqzLfuJiFARcpLs4SfO7PAZ38G1elJy1ALVFirrjv+H4wIGXkcboWziX3rpk9dTAtxhjWdjTOYGqwWGnEeOGcU5+M4TCgYT/cFCCHN1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVmkT4EaULOWwtspVkBfamFqLzxiMmRZafqnbZwevig=;
 b=zEsLLXm6DgOXNsWiUFKGitZT3YFEgpRhE/eJ2jU984l7MI+4qj0nNdSvAmto5QgE8SIPhij2OnVI6EMu1uj8cpeM0pBomDe6rdeRALCRR7GKVIwxPzFVqotoZmIXuLrsds3+VRDN/+xnuWKPtfvatU22RWFHzx+XkN6iwr6FZSqHB0/zt84MI/V9PEFZ4p2/f+JmFi+uhALU2VhjHz50HaKZFuSr4q26u/sMS6VBbauLvTSpE3S4z4ZzFQPvkxxLD9YZCIJMi66TUR6qoVI2Df5d6iaDR0uY9Y9GO37EOF0a9fFL2muG7nx2PmG4iMU2Ib9YhXgnlmjEAQ7FnxuvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVmkT4EaULOWwtspVkBfamFqLzxiMmRZafqnbZwevig=;
 b=fTJbSE/kiTm2UYNIQrJwzjPcjYvQXXsQAS8wrQ4NrMIm9s4FMZM1NNJ5rzznYCDhC2F+/PCN2XkdlsROaDvz1GmwZJ7wTPbpSk1rEapqYLKGpcAmTv2EbU0t3qFq8xF11f0HSQKxLGRSayoACibXZTmgkCK9EzSFqSyCqR895dE=
Received: from SJ0PR05CA0044.namprd05.prod.outlook.com (2603:10b6:a03:33f::19)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 10 Dec
 2024 18:00:06 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::1a) by SJ0PR05CA0044.outlook.office365.com
 (2603:10b6:a03:33f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.13 via Frontend Transport; Tue,
 10 Dec 2024 18:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 10 Dec 2024 18:00:05 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 12:00:03 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v10 2/6] drm: make drm-active- stats optional
Date: Tue, 10 Dec 2024 12:59:35 -0500
Message-ID: <20241210175939.2498-3-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210175939.2498-1-Yunxiang.Li@amd.com>
References: <20241210175939.2498-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: adba262d-aac6-4ce0-cc1a-08dd19447a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OlpRPNNDOZwlhhTy9KcBKVaTjGm2IoVEpH/S6PT6dHlTdjCy+bIn0/s+nUlv?=
 =?us-ascii?Q?x+gcQzuV8vfAPQ0lX90gKxJaUO+lb0Z19h1ixIBxFaqPKpI6UIfumVGjSbEm?=
 =?us-ascii?Q?4c8Vff3gUQQw2rpkXMZauk603Vepn6F5rPkPLoBiMWl7RmEVt4Pky8wFs72X?=
 =?us-ascii?Q?HNXR3VmAdYWqtrQDiKZhbIBO5X/RdvhGOku5W0urb2AGgVU6BHnZ3R5w+8NP?=
 =?us-ascii?Q?WjJJPl5X0roP85Q3Lznc4h5tzLnB+SO6o7/F0Z8YUGHkM5+oxFBflMFfXxrg?=
 =?us-ascii?Q?UQDDdLZLzKIgb+hv7U1i5K9BX/oSx4YQ6Qdeuv2xgPUpxU2z+U5Vv6NWTeZZ?=
 =?us-ascii?Q?wOlK6ukQACbY8QhAf+E1bKc+u9mRJb/C9DJ7cVJSgc2WDDZV6CNRJrl+WuRK?=
 =?us-ascii?Q?5teJx587bxul/qhOLppCL+wBbX7OQgGGKmZlPnbk7brSgQ0BKd/eLFHqB1UP?=
 =?us-ascii?Q?M13Mdv2PmXz3ex5Dc9WjigpXOcyNI1GnMbRrFGCmMHXR1Ci4eRUl6EfxDF1C?=
 =?us-ascii?Q?OERlAJN9QHW8oedzkcFJyK99EU7fH0N12i/IfCfNfWu4NyaXdMNvhZWtrHEt?=
 =?us-ascii?Q?eG1+aIp3tc4/7w2uOUnAfKfCksduCOHCjXmPLrG/Szb3PT0RyJ94m5NtKryE?=
 =?us-ascii?Q?PMVFsVSO+TefIiWZ7eJnOqlaW8Wm4tApTc+t+Ee0l1B69TDza8g4zI7XhJff?=
 =?us-ascii?Q?mq9y0IffV4UE7Hs4259ZECLix1JZPubQd8y74vTvU/8LvANExejrULb4Q9Go?=
 =?us-ascii?Q?lBF0yAVT5yObF/szcr/8FGknSe94RAnO7yq/4BgyABrU1wsWjQSjxjpypy4l?=
 =?us-ascii?Q?81tKEyA1PBe5Wg0AofbqGWKXrI5NGf5VOZ30/0sVbyQCG6/pZQU9Ej4rIDSz?=
 =?us-ascii?Q?E1dG9tlDOL77K8vND5I6OVh8YOp0RyugnPHvk2hNchTX7PDMRadAdfXlULon?=
 =?us-ascii?Q?d9peBMqqSchzl8ZVQvp/04ZAZ85nd9WQwk7EWjPkyjWfWzt/aOw00NeBO2JF?=
 =?us-ascii?Q?ZehOMII4NvuOPcU+amPDlKwK5coTCnVwSopS6C8+QYIpOppeOdUWe5B4YmIr?=
 =?us-ascii?Q?lopT9T1jbZG70xwhWKDoUCi9edpMmtD5nGZmJNArkfx4NfdyDvO6Oisu8aHZ?=
 =?us-ascii?Q?MV0WKTQ4z/4BS/cQLhprhJ2r8p1I0+8yAiz02Mf2LTB/v/u7N6DYRU1NcDm5?=
 =?us-ascii?Q?T1ousDeLIhgEcdf0xWDVCybmct5oc+Fmon+mAfms8qGv5bpHO7zC5uS/tS7+?=
 =?us-ascii?Q?Dnq5lR+iKSk6X0g7qjOfTzE1cd+a2vcZeoD3zGlNjptBdjJzh0r2MKHT25yJ?=
 =?us-ascii?Q?0E6bxLlxUIREsInTc+xvKfuPE8UPh094M8nZWrbmxOSFQQDZkxuPyqlQlQEO?=
 =?us-ascii?Q?zLP2bGh+/5w7PHVXfmPvlficZGCRdrk3DV0W0o2bTCe/cdkBge0L1lmvO3Zh?=
 =?us-ascii?Q?LS5maQYu+0iTfVcZ/6ZZVz0PO6B+Wp7I?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 18:00:05.5960 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adba262d-aac6-4ce0-cc1a-08dd19447a57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446
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

When memory stats is generated fresh everytime by going though all the
BOs, their active information is quite easy to get. But if the stats are
tracked with BO's state this becomes harder since the job scheduling
part doesn't really deal with individual buffers.

Make drm-active- optional to enable amdgpu to switch to the second
method.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

CC: dri-devel@lists.freedesktop.org
CC: intel-gfx@lists.freedesktop.org
CC: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  1 +
 drivers/gpu/drm/drm_file.c                 | 13 +++++++------
 drivers/gpu/drm/i915/i915_drm_client.c     |  1 +
 drivers/gpu/drm/xe/xe_drm_client.c         |  1 +
 include/drm/drm_gem.h                      | 14 ++++++++------
 5 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index df2cf5c339255..7717e3e4f05b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -97,6 +97,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 		drm_print_memory_stats(p,
 				       &stats[i].drm,
+				       DRM_GEM_OBJECT_ACTIVE |
 				       DRM_GEM_OBJECT_RESIDENT |
 				       DRM_GEM_OBJECT_PURGEABLE,
 				       pl_name[i]);
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index e285fcc28c59c..fd06671054723 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -884,7 +884,9 @@ void drm_print_memory_stats(struct drm_printer *p,
 {
 	print_size(p, "total", region, stats->private + stats->shared);
 	print_size(p, "shared", region, stats->shared);
-	print_size(p, "active", region, stats->active);
+
+	if (supported_status & DRM_GEM_OBJECT_ACTIVE)
+		print_size(p, "active", region, stats->active);
 
 	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
 		print_size(p, "resident", region, stats->resident);
@@ -917,15 +919,13 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 
 		if (obj->funcs && obj->funcs->status) {
 			s = obj->funcs->status(obj);
-			supported_status = DRM_GEM_OBJECT_RESIDENT |
-					DRM_GEM_OBJECT_PURGEABLE;
+			supported_status |= s;
 		}
 
-		if (drm_gem_object_is_shared_for_memory_stats(obj)) {
+		if (drm_gem_object_is_shared_for_memory_stats(obj))
 			status.shared += obj->size;
-		} else {
+		else
 			status.private += obj->size;
-		}
 
 		if (s & DRM_GEM_OBJECT_RESIDENT) {
 			status.resident += add_size;
@@ -938,6 +938,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 
 		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
 			status.active += add_size;
+			supported_status |= DRM_GEM_OBJECT_ACTIVE;
 
 			/* If still active, don't count as purgeable: */
 			s &= ~DRM_GEM_OBJECT_PURGEABLE;
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index f586825054918..168d7375304bc 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -102,6 +102,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	for_each_memory_region(mr, i915, id)
 		drm_print_memory_stats(p,
 				       &stats[id],
+				       DRM_GEM_OBJECT_ACTIVE |
 				       DRM_GEM_OBJECT_RESIDENT |
 				       DRM_GEM_OBJECT_PURGEABLE,
 				       mr->uabi_name);
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 6a26923fa10e0..54941b4e850c4 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -229,6 +229,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 		if (man) {
 			drm_print_memory_stats(p,
 					       &stats[mem_type],
+					       DRM_GEM_OBJECT_ACTIVE |
 					       DRM_GEM_OBJECT_RESIDENT |
 					       (mem_type != XE_PL_SYSTEM ? 0 :
 					       DRM_GEM_OBJECT_PURGEABLE),
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bae4865b2101a..da11c16e212aa 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -48,19 +48,21 @@ struct drm_gem_object;
  * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
  * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
  * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
+ * @DRM_GEM_OBJECT_ACTIVE: object is currently used by an active submission
  *
  * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
- * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if
- * it still active or not resident, in which case drm_show_fdinfo() will not
+ * and drm_show_fdinfo().  Note that an object can report DRM_GEM_OBJECT_PURGEABLE
+ * and be active or not resident, in which case drm_show_fdinfo() will not
  * account for it as purgeable.  So drivers do not need to check if the buffer
- * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
- * as purgeable even while it is still busy on the GPU.. it does not _actually_
- * become puregeable until it becomes idle.  The status gem object func does
- * not need to consider this.)
+ * is idle and resident to return this bit, i.e. userspace can mark a buffer as
+ * purgeable even while it is still busy on the GPU. It will not get reported in
+ * the puregeable stats until it becomes idle.  The status gem object func does
+ * not need to consider this.
  */
 enum drm_gem_object_status {
 	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
 	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
+	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
 };
 
 /**
-- 
2.34.1

