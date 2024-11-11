Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A879C40EA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 15:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66AC10E4CE;
	Mon, 11 Nov 2024 14:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wx5bq172";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C86810E4CD;
 Mon, 11 Nov 2024 14:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8tpk1P0BZ5QK3ZVdRGAcocHI/zFh3HfomKJQ+VL1gejFsOK65kIV4ytCTtccXngZE57IWoQ0CPMCN9X9YuUX9HNmAdDKRQZy/mE4jd0QiIp9GZZra2OBbRn96Z17xXTh+xS3LpDIKZq+UlFYh6QPPI0YmgIJZMBuv/Xk7/MslV3lfLZNm+7vgsfnQ9TeMB6fYl7wUn07mi0kGtQaCinY9Utdy1dG/AufnoQupleVHJsGqpK2DJQCwoRu2DhM1XVV5Dv3OL9lBet1M3K7hagsZ54Yr43rWIu5HlWiQYfJtCWwlt2jW4/ig5Z5X48w2/WOSRt+SChDYdMfozUJo023w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPZCgDxdIbb+JD9MQ83YtSTYNt5rAhFLHHEAbamT6w8=;
 b=VVYalexB23KWAn7aRdOWI98Mxuw/5r56DCUm9/+6jQ8xHxOg4olYiwpJig1/tZt5UXJFAXKfq4KKDIVjH6X174WJtg7jaDVf5eSrMEJeY4Q7yB77JiyOM8Gx+gY6efqUaDD68r3bKca9rElDr/Tjtdv/U0mEInOMqtloxgXdHVlpwj5ZMbDSUANEHVxJ1kGc0k7y66FJzzkktkeWrK1KqWbQ/vD1gqkCc5HQxFOjsq5vzvyOfQA3IE8P1YWHRGCkcxZo9sLtWiJODSn4r/pyp4sw0brl0yvxYaA2u7Abkc6rL0dyeN2BzBZCuM57iR2yzT6xa8xssarwxYed2evD+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPZCgDxdIbb+JD9MQ83YtSTYNt5rAhFLHHEAbamT6w8=;
 b=wx5bq172Ml5NM6BTNkjUBK8hFyer84BmezYKyqLpIlvQtKTJ5/u6N/zaSJYdYdLSbOpr3bF3OE7Ada2eiOjjXk9DVUITYP7tHq/uWIq6fZwxC6pcV8xC4OgJ9/i64CA/3TtSVeXnH74zuzDWWns4j+QxxxMelJcRLpaYBdA8NKU=
Received: from MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::19)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 14:29:16 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::db) by MW4P222CA0014.outlook.office365.com
 (2603:10b6:303:114::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 14:29:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 14:29:15 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 08:29:14 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <intel-gfx@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 2/4] drm: make drm-active- stats optional
Date: Mon, 11 Nov 2024 09:28:19 -0500
Message-ID: <20241111142819.2324-1-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87ttcecet8.fsf@intel.com>
References: <87ttcecet8.fsf@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d42b9ed-a2b2-46c9-172a-08dd025d3886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4WWlUnOULuXEHUe3ookNSTr2Xhso7yJKCJpHisEy58KQJz4nEbqEJHnlL7t9?=
 =?us-ascii?Q?jWGn72fl6ycXfHrQj/2pqu+s6kyA55kqVv2Mla+h4T3EvpoRG2asyJX/mFns?=
 =?us-ascii?Q?BxL1NeSVlBix9DJwswTqyPrrBQBjX0fhzyb6q/U8/RzYl79ukfUVWzjEs1BM?=
 =?us-ascii?Q?Hci1iun6oQqqScD9EXppiIL10jdAU0YLztGNXQXPFZ5lST4QBjhRwQc42ggt?=
 =?us-ascii?Q?AiosK/Fkk5xvOyOPxadgddefoRmcK7cAVTk8xGTPusAzzSulN0Is9DYKW0SO?=
 =?us-ascii?Q?hj5lR2uXqXmu2iqznR81q+KuI8hCUse5eIjHfFpBvBmRkywMyKWRjqaNUgjH?=
 =?us-ascii?Q?nImZOulis3KDnYKULnhL6uD5Bqw9U+gtqi6sZn5C7H84JZhPvUsFzZ9JtpxX?=
 =?us-ascii?Q?Oco9WMwbvVjpOLk/68zpkL1f+r9JSUkz6R2llzsoBdQWymsVXo0xv3tgeXFR?=
 =?us-ascii?Q?Xhv8SRG4O5Nh08qqPvEFotVgYwxakdvVW0A/ogyaMkx77ZMJjDQYWvVXvGs9?=
 =?us-ascii?Q?zKTMCoiY7AVMRe+O/FsFeTWxUyhJYfhy7yOglryKZvcaRGSyFKrwMtoso1uK?=
 =?us-ascii?Q?1YJainBwfK3nRXbsssRW1yRsO2n8miH/gORN5yap3Qk2nozhjlyDRI8k5fg8?=
 =?us-ascii?Q?Yz1aVB+IlNEPF7SVMcKS7H7ELLmO2XayK3uP7HTVrwEBzYJo0Sc5JN6FzUAS?=
 =?us-ascii?Q?/UZplAVjCimpncq5YRuOYdspnl465YeT5VFBksnXnikItCwYvnOsLV9aUouK?=
 =?us-ascii?Q?kTH1QQOIwiryV0/K2l1WSqW9f5HMVGsBJwETrtME1p9WZKn4mZBCBfbvG7FM?=
 =?us-ascii?Q?3lRSrUrjo78h/z7DsgbMD4tsttCwLJtIg1PdUgfmySuhCZlWcyxE5USDbdSw?=
 =?us-ascii?Q?z+S4Mx1wnqANdCBNTryut8l/wuaLec3hhTWfvbIpc3oIgEJ6IFBD2dF7aOHw?=
 =?us-ascii?Q?bNclC6a8rCdiBM2N/lK8K6DjIzyPGIrQpdtRcKL/PaVvC6w0PduMyPL8jr5I?=
 =?us-ascii?Q?uKaR1US5Q69k33GaOWds3xdjKJC3SENnfdvZz1+uud2RIiX7B4VTgZ5mtpWD?=
 =?us-ascii?Q?Y1fdsscBOEuBJnk0fnMcQVli+nfbslb/nSUOZAtwRe05/7427HkOFHXjyXmq?=
 =?us-ascii?Q?6t5KorsKkagvnRNRagO7NllsojIW8Jm9sLcA9fLvQIYmZalkZLxqd6mvJVtp?=
 =?us-ascii?Q?Gy0tVh2YrbquYd0i7pXVwypL/M9rLvNxkjW0T+Z+sO9vOywvgOgc+hRXDog9?=
 =?us-ascii?Q?3HJjvrFjENzxeIvrFeVR4o45PUMgE/gH6MqFsef1PGGvQLxPRH2ToEvx2NmG?=
 =?us-ascii?Q?ZTQWAoGNPN3tKAXW53doqjS7gOG2nskBl94PHqJOLXojwA3MWdz2XAMRIfzQ?=
 =?us-ascii?Q?sCp5YASGW2sexXJqAkiyf5E6w5DVpyQbFRA8ktdzy75CnuuctQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 14:29:15.7348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d42b9ed-a2b2-46c9-172a-08dd025d3886
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949
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
tracked alongside BO's state changes this becomes harder since the job
scheduling part doesn't really deal with individual buffers.

Make drm-active- optional to enable amdgpu to switch to the second
method.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
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
index bae4865b2101a..584ffdf5c2542 100644
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
+ * purgeable even while it is still busy on the GPU. It whill not get reported
+ * in the puregeable stats until it becomes idle.  The status gem object func
+ * does not need to consider this.
  */
 enum drm_gem_object_status {
 	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
 	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
+	DRM_GEM_OBJECT_ACTIVE = BIT(2),
 };
 
 /**
-- 
2.34.1

