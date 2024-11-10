Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265B29C3350
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 16:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0559310E2D3;
	Sun, 10 Nov 2024 15:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YzNKiAGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A8B10E035;
 Sun, 10 Nov 2024 15:42:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYRSaNohzRP1WT7EdhHgaTBDNMz/RkeeHjnA/uFufEP0/7TS+IPWqsAoOqMLXIvoDO1ruBfc9zJUAOP0RiLYUyjEDUG9e6yh7LAgIf5UMo3rfeITmEm1GQ8c9FaOpsLJBe3nK0z2oSl5Meb0NWrSbmPum7qQ3y+1kb0+ZDAIwGRHIBdLewYj5FEAWuOQEHHD9mHn7jw7lVnmOGqqCYCX7R7AAS/N7PL3POpitq/WfjxL3aQeP+epYq7/CJ++AadhwiKWDnscVIYkAXVJ8DmgEJm3UmPKMbd0Y278L4jMqKMphRKXhGb+u0gdRYsYSxVIneUG9qtt380o/g06ORY4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWtVQR2CQxI+5TDmYGp+d550I0tB0nOMSy+Q9yX0Jkg=;
 b=yvQxhllODdjvlIVhqkG+DVgFgDfjOkFTI4JMnK+fgnH0c81eCggLdhIAXMTmZdP2xrkhj0OSSb0k16kKZ+uesvHhwu0qwA4tODVdVDojBSj8c0YU0ywboB89i4bFzmWf3dh5c7+4mrWE+w/tsH6OdMW98ZnAR8GGuvhZ2tFBqEraJTfyl4m5WVFtBVSCmDxNadpp+7TVawrvwHBRGTYFfj6CuWtRXJ+OGmJX0u9LhNm+ltSZKyStqHUhvReS8eZp0tvIWfcwR4DjYQ/5j7h8tv4iy0x+4+e4qv/8nFjOmXd3NCX37SgDqQ79j1BGKa2K+ZCT8XKkB8cCMjX3ieyq1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWtVQR2CQxI+5TDmYGp+d550I0tB0nOMSy+Q9yX0Jkg=;
 b=YzNKiAGpjj+5QtUyicrCePfQoaK6IpEfl2302He2plXLf8LznZotyeGDMvm0hDKYHqKFbxTDbLe0y5xzFNdwIQ+JabBC1mh+plZij1pWfVFQdczkwP/j7yw7n/lGUzeV5beRCrZwaHT4aAJZBJNEfBv1gVhBCHXz6WANY4RmEFM=
Received: from CH2PR14CA0002.namprd14.prod.outlook.com (2603:10b6:610:60::12)
 by MW5PR12MB5621.namprd12.prod.outlook.com (2603:10b6:303:193::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Sun, 10 Nov
 2024 15:42:26 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::39) by CH2PR14CA0002.outlook.office365.com
 (2603:10b6:610:60::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Sun, 10 Nov 2024 15:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Sun, 10 Nov 2024 15:42:26 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 10 Nov
 2024 09:42:25 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v7 2/4] drm: make drm-active- stats optional
Date: Sun, 10 Nov 2024 10:41:50 -0500
Message-ID: <20241110154152.592-3-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241110154152.592-1-Yunxiang.Li@amd.com>
References: <20241110154152.592-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|MW5PR12MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 92315389-71f3-4302-407d-08dd019e46d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jJnQ6CLvyTrhhehwW54xkA/pdctIV79C3VEApPDVBUdbTy/O7kcWTZV+0TaD?=
 =?us-ascii?Q?34gMjMi3ulVWtiOIf8Hq9+KWglAT5jw3lkxOK5/3aZyL2FoYxg9vkLBsny13?=
 =?us-ascii?Q?rQB3CvsXz20qyMFBfzjJjL5lvGqpzMitN1j/wdLghdQEzLlE3IDrZgSDK+cr?=
 =?us-ascii?Q?wEhimAFBePPT05RIG16CtxI17WmEmfLtEdrdjx19q0+SE+r+eHhoFguYZorh?=
 =?us-ascii?Q?fw1f+8I6z6FGoS1/zI1+Ug5KPllBf5EYyvQLsrl0m/ITa6/gnbxVxTB0yM8X?=
 =?us-ascii?Q?jKf9elxXpaRey/hEmrpltrOC6++o24bFg35KQkh++uyqmS51ggfaDsaE0vEl?=
 =?us-ascii?Q?pr3lRtcCcytwLez3ykDKvIiozo9Cwj4me+RUAJ8mV511SjCTtVCvCCgoUHZT?=
 =?us-ascii?Q?ERB2mHxSf+Pni9g4qJTnkQmAvKCTUsqe1WkkDXQh8r9s07QpK3HFypnUvghO?=
 =?us-ascii?Q?Bc946KEghqHkNwYabsPw+5LdKL9l4glQD7/ct+t5iQUi+xLOFzwAPbPM+dMQ?=
 =?us-ascii?Q?CpviLOcPQpzX49KqcOXcyxZ7GOJ7dakVk+msAOVDhBieNhC09oH0aJCi+VpL?=
 =?us-ascii?Q?gOxqOG7+X2PUD0JYViJsII6dR9PvGoTo/tVpHMnSRW+xI1mVkdF7hZ0tTczs?=
 =?us-ascii?Q?06k17wOGb/uURvwB3qSjl/nBiTLN+hEGIgkUPwbDIJ0XRGPkJokfjcjZ2dq3?=
 =?us-ascii?Q?ST2Cg2FRl2/qmTDXONuUuIMOvzjPP55hF5I1CvTIXd7hLa1+NKaCMH4YAQZV?=
 =?us-ascii?Q?pO3Q8y9eqAjD5fPJp4oTs1vbFw4stuhB6muXK5zD5gF2djN9heJA+LycwDJA?=
 =?us-ascii?Q?OOYsw11kzo6Xqb6GRZJ6jFCNCJ1WdaGUNYn29+Qu869jR1clNcsAb08emt2f?=
 =?us-ascii?Q?cTvzp2njh8Piix/paFsmeodfDvkqgp9LkQrN0ij6IDkLqHeHNw/h20ZODxQq?=
 =?us-ascii?Q?QfvwvmS3zoDcrvomwlpfUWsZKkkT3rjD4J8YJXC7HikXcihzXscr6lMUOzos?=
 =?us-ascii?Q?9whv7fv1/0z4N0Zpja9J6wLyvabV1PPfFLx6z1qpDRnfroyTenLgc4qoF/pp?=
 =?us-ascii?Q?N7YE1retNGX/o4Ri1XhfJDIjHks/dgpMordaJMAJ+qlKj6upC/ISXR7THxJO?=
 =?us-ascii?Q?fSI9wYkiOCwFxEU/P2QiK1gUnNTqDlV7OJ3ctmp5ejXfsZx01hnXkEn8DDQZ?=
 =?us-ascii?Q?NC/RYSSDfmfGkQugfDHQ2W5UNUdwTvV0mDwX+GwMiLaJm54uSVunqqhVmMW5?=
 =?us-ascii?Q?hhWF60ZEJAPQ/KoQfuGJYZaEqWjmCbEbUbHaQnvo67k1uQ6xPj71OGWmPGft?=
 =?us-ascii?Q?M+mxWaT19BPQ4eZ34bWqJwrTWtRctFQ/tzFTBqO3/1SfdtlLsKiVKjoaR0vJ?=
 =?us-ascii?Q?kPa5ZcB3djaWqmstM8rDVpXuG9eGxCqZVxj84xZakU8nRdF6LQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2024 15:42:26.0210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92315389-71f3-4302-407d-08dd019e46d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5621
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

Make drm-active- optional just like drm-resident- and drm-purgeable-.

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

