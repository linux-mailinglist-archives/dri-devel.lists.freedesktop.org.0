Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC48F9CFCB1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 05:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FED810E182;
	Sat, 16 Nov 2024 04:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SBpC/SgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3990310E11A;
 Sat, 16 Nov 2024 04:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlOA6K79VCg8jOIYVabjKqHUcCoK4skuZCiGgpNjx2oQWFqW+hPid8AYzfbJ9qQI0uRKOlgAXQsscFd1lnyytQC98fhCxcrenai+fHfXbIeMQcHlctRWuR/sq2pcEksAXPYAQbjFZ75gxXccw5H4tpv1pxvof2ZiC8wO5e6shy8TAj5MlDmKhiRsgtKRm7jhsi/B1hHumK31Ac7aQm/fQsm7In+VO5oERaJEgwoQUVDXn137PMucG7HX4H2nRWfJLAyLMC9I4La8cKMMLtI0NeQZmdWc+wN/a/kp61oGY2YaxvMo6Uqc5fFpjSKs6nHTqiIDb7tpqV8MvYQcqwnD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+ihOkrlIkchnLBdgCxgHpbTJFVZ+GSBpFg3OZ/vFVs=;
 b=eyF+f/xfQUlF6nBu5+Fq3yL4vvXhe134j2IfXmYXkjy1VFnGTpdwl1AfYj2Rx6BaF0iVjJIO1UoQOxoau1wj8A3jwILuTxAMRG6rJrFYCNSb+ODQsc0hTfYTT+IpqSUZw3mGLYWEBBH7TCdkZED1FllO/+GaJx0IfsXBWYo1P7mUmVRZj1nkc85BBbR/Kr9prYN2L5lkvOlnfl3qBa/5s+ywFKZJLJ+9qVcC8KwAP6qukfIOvJaEIr4XZ43zv3rtjD+sR+fWDbJ5NTb3BsEUx1lvovqHRf6fWUg9GCbwtcbjmCikSnTCd7jLs8OR0NMpVj5B4rf8RuQlJHbL5HMayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+ihOkrlIkchnLBdgCxgHpbTJFVZ+GSBpFg3OZ/vFVs=;
 b=SBpC/SgVkFvFf2UGH3LbhYfQz4XKG5zWzdk4xpnnM9vjSjTrSXMYLgtn5bpc7kqzL1iC7J9qN3x5KIB0Xr02hH6XGyXbff3XeYR4doBIBAJTsuiZB1w5a8W4nz6x3oWg0alcNLcdC1Twmqd0/9cD8P6FsaYAhwD3a3svm7CLCqU=
Received: from CH0PR03CA0318.namprd03.prod.outlook.com (2603:10b6:610:118::26)
 by LV2PR12MB5917.namprd12.prod.outlook.com (2603:10b6:408:175::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Sat, 16 Nov
 2024 04:45:14 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::10) by CH0PR03CA0318.outlook.office365.com
 (2603:10b6:610:118::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Sat, 16 Nov 2024 04:45:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Sat, 16 Nov 2024 04:45:14 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 22:45:11 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v8 2/5] drm: make drm-active- stats optional
Date: Fri, 15 Nov 2024 23:44:49 -0500
Message-ID: <20241116044452.5925-3-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241116044452.5925-1-Yunxiang.Li@amd.com>
References: <20241116044452.5925-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|LV2PR12MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc21e8e-1d1c-42c3-5ac5-08dd05f9762f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1pI9uFrYr/CcVDsex/wqJBvmYyPIp852DZjlD0rTjCH+Q9qN5892p7/h9Dez?=
 =?us-ascii?Q?GxQ7//4yvsioYQOBMGaHFLrQ64fnUdqxLdi4E1Q8FGj2hu1PdqqXn2D8qu9l?=
 =?us-ascii?Q?3cie8z+WCOq3BFfE1cm+qO8PLWk/5G4rxMownxS0q4noN4WTfYypVZxLEsPI?=
 =?us-ascii?Q?rfrRRi4QhMg9uynDnH3d4Ld1BnSyWbmfN/zv0xE5SA+3fDRk181qlGtKX8U9?=
 =?us-ascii?Q?+7zFolKQ+Ep7SqVfIoU6ozxBogoRi8nxtOVWSQupyRZdCC9IeP0CzfiFELCr?=
 =?us-ascii?Q?sZ3x135GvdJG6frBHelHiF5jxPo6SUnN6oKI7A1/gp8GzV91gDNiCyUX99Ip?=
 =?us-ascii?Q?3uAod2sAE8vPfT1ileKss1Ne17E1Y1xBoFpu1yWWTBjhMP+F46V4DO7f6zi0?=
 =?us-ascii?Q?c1TKS0bNULb4Ltw8AjgbOwvye9MizAGwwT8G87PKplt06YlF4OwDYX/0Fa4/?=
 =?us-ascii?Q?jkpKW9wqpNTvrneQH159GDk8WHzErTnXLr6UPz01uOwOFRwz9kEFLPwsd4Nb?=
 =?us-ascii?Q?8X7KNZHRfSH1+LXpSeshKTxG19+fbTVKVOzI4HjcL7T3bpV7pHsuQ66dJIxK?=
 =?us-ascii?Q?G7xwEVtIERi5oKjo3Yc5Ui3+fnwCVGbcFkuivo9gkCaOCTcV3vRf3D2J2dEO?=
 =?us-ascii?Q?HMhmHlnj6NpZ+PLdaQ6ELmrYRNKQZNQk3tXuVvHEcJRZmIzkWT/bkzpLmzWQ?=
 =?us-ascii?Q?n7L9sVsvCR7EatI1BU/NX0KkxMwZjIToLwRKgvQApLEcstukuDJVZzIbiar9?=
 =?us-ascii?Q?ib83vnjQKdH0e+D4H7usPYlZPsEPPSZI/XrTiBVgTKY9LpHHd8FGK1djLnI3?=
 =?us-ascii?Q?AZPKnSJhXa6dpFTNlVbswqHvdrdTkzvPUfj4ikZOtRTihfCQ9GW4OlpAPH1y?=
 =?us-ascii?Q?UK6B1fT1IJ7mOnLAsXvVd4Ff8ZKgbTeOL52LvOpceSVzsvjPU4heBERYY3x6?=
 =?us-ascii?Q?Tyb3jrHW0ISf3xiBbZlOjq8jZ6Mua6CqKTGfufUYCQrBfohhryK6/XNT4Xfs?=
 =?us-ascii?Q?RGdvKMAVuh52Ux3bODCC2NG3ttvnd6TByd4ir0M9I0YyyE8IsnHQpSfpFGFG?=
 =?us-ascii?Q?9ESWeJNzPhnmymzA+vnKPIx/17TdJ0+Mcruo3cnMtoVbG+Y/aPljSsJ+cFgg?=
 =?us-ascii?Q?cAa0M+qo1RJjAsYOE5Xt2bVPRJGiogKgINfBpmNXuJO9gg/Hshsi0Zi3QtGB?=
 =?us-ascii?Q?3tbtK+g405/EF+cLf4L6riuBiUqZyozENk5Q8dKd2ydhZDiQ1yb/FVs33AeM?=
 =?us-ascii?Q?ntemPu7KCmC/45GWWbNmM1pdlyCOzrmtQ1IUKLUmUF4Hdk8LBSKZknwyHgjS?=
 =?us-ascii?Q?Je20k1qnlW6r1oW17frInpuU+6qBtmPkqeu8f064MqCo40yo3rvThf+8FuVH?=
 =?us-ascii?Q?NF7+bE0naaXXM9JszxheyyfniyRogqd1xCOIve05+A4Jzj+SYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2024 04:45:14.3820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc21e8e-1d1c-42c3-5ac5-08dd05f9762f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5917
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

