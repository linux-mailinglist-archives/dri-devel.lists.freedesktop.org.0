Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC98BB05E31
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600C210E5D9;
	Tue, 15 Jul 2025 13:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eEQ7UC1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330DD10E5D9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlk0k8WwX7UAUwsbrtXPZ2BNav/Jl98ZY4C4AJzJHMYkSmoikXsFvaTOJVimRZd1rNMnxmNjoWXTbAqO6J9wDRurHGimlsIkt/+AObKXH/YHamJY/A3Y/F1pQJ56dJiTVHQIPs92UG3K32KA66BbvuQvQD0b/QC8/FafDl1/jRIxRIujP/dbLGkqV+R+xSUHdbWdl8zAAwx4dkiymb/GBbKoN2cZOpZ/L0RA2Ew56pB1j8yoy5f93fRj6Aq3eHcx5ISZvyCvKFstGuw0gbOU1PZNi9yCe7Hzd836SoNCRpzJot9Z1e76Dchj42Ej7myCgfVPIVu4yXpEPWT6WTzc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63xSQ0VmokypVFtlNlGhp9XTp1TVS4avFgAcZM3tfUw=;
 b=iy8DeSnFSnGZWJVKah9E2mGyFdon7g56EWYXQ3NzmdEmC0CPw8yd8XnQkfOahivPEJCjq/EnhRHvlwd4QNNU0Mnk4CMBSdBL/86PMxGxOtv+xpStx8v4h0+ZaJv/se45wynbor5I+gepSKDjrdyGU9s7jqHdKvMnFghMHByFLrkyizrwQNTRKEUxkVVbtvWoyfmzNkG8TGqNu+R0qc/wCTvoIsNZ+c/yGFc4v9u6T/8Y1+l/C9k5zX2g9OKJI/9vs9AAwaaVBodUbYka8QIszLzICi6qVd807bU3/XZxqlvWdmwIkpHRLOIapCKwp/Hegcuoh9Z3VuIfDQIqPBeCww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63xSQ0VmokypVFtlNlGhp9XTp1TVS4avFgAcZM3tfUw=;
 b=eEQ7UC1KS5afSetTGbQpKDrIcPDvCNiIM+K3JL8hojOD62k91/OMR1/7SCrCVMPOMQdPVsAIZQPORHnG6CnS6KxnHMiQhQyWvYorUWWR9K6bymiiyLAEHioUjRhyOds/CvLYlLRAHbQmwejmv2jfUhof3FBuxXgZelo4MaFCros=
Received: from CY8P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::28)
 by IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 15 Jul
 2025 13:50:40 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:46:cafe::ed) by CY8P220CA0011.outlook.office365.com
 (2603:10b6:930:46::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 13:50:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 13:50:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 08:50:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 08:50:37 -0500
Received: from lcaoubuntu-server.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 15 Jul 2025 08:50:36 -0500
From: Lin.Cao <lincao12@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <zhenguo.yin@amd.com>, <Emily.Deng@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <phasta@kernel.org>, <dakr@kernel.org>, <matthew.brost@intel.com>, Lin.Cao
 <lincao12@amd.com>
Subject: [PATCH] drm/sched: Remove optimization that causes hang when killing
 dependent jobs
Date: Tue, 15 Jul 2025 21:50:33 +0800
Message-ID: <20250715135033.706126-1-lincao12@amd.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|IA1PR12MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 870505a4-d70d-4245-33fd-08ddc3a69509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dop5mkdCrwN3HnOKuvs1EOKTmoVxAbcmeixTT7PitgUvug8rhmFaRE1hJ62r?=
 =?us-ascii?Q?ITIzs1vi0LTATHLTLvNXiiR6/zxVsrClGrEGhyIbsPmGzKqNU1GCJQnhTtAP?=
 =?us-ascii?Q?wPjUCFwYLq9QZ7oB52irBobEitjg8+zXHspvjQwGsyTZLoV3HwYeUW15DqBn?=
 =?us-ascii?Q?RmtOfKW4z2+NzJBJYDFon1LUMCPnIUjIpweQLM0I2FOx5pQjCF7BjFVGQW87?=
 =?us-ascii?Q?I46xR7bVe3HnVZL4RHzMqr2UQVDPmw2OVdAcRkZCmvh0fUw1FhmutNu8yYOw?=
 =?us-ascii?Q?mCxPHz4pRo2U2aiONKMBF1d+YQOOaozzVp/gwDZTe1jgvPHllYzwnggNO0vj?=
 =?us-ascii?Q?5BWwMe49xcC48xpbbnltZCTYUeGQQ1fWF0bf4SLichqUpVb4ObN59K30dum3?=
 =?us-ascii?Q?MXSdZfUPn45RlzCKF/VqSFJ4YsAMlqqxtjSxbuNvB3a4wk2InWxBbjywB4ec?=
 =?us-ascii?Q?b3Xdpm3XULT1kaRCPDFdcsn+sC37Hmynla+MFQcpABcHleWt2KciJxAdwMWn?=
 =?us-ascii?Q?LLOnTqDcwOMtJff11qXvA5bBBfSqvzOe4M+Mmh3eU7v5Be4NxnZiuW965Hr8?=
 =?us-ascii?Q?n6K3PBjG4jaVr0xyRJNhcfzVst84nNjAL/PVwJuewAvDRpTiZtlCwr5/20yd?=
 =?us-ascii?Q?WoX+l9p+omTMz1/8LTJOztOOir55KPBBZZNNhBL0ZxkOCNlE6ncqVzAGQK7l?=
 =?us-ascii?Q?rxkWqjyiEJWIIn9KpYEX8B4Oqpkku6U0bBnzwhqSRfbU1hDq+TCLkY1Ku4mV?=
 =?us-ascii?Q?GpBEGIsiFaHN0CTtOG/XY3LNTCkjxcM96yj3HNzzAAnEiwktCVT7q/bQRtpm?=
 =?us-ascii?Q?Wfoihp9QAZjdggN00NsltnBANgN5vr6DItnucV4cHcthWkF+mJrz+qe6Ragv?=
 =?us-ascii?Q?wfwQXxHEBB15l7EsSURn8vDpnPxLqNfDQHQrNCX3tmK3Rh0uw0OGFUQEU5lW?=
 =?us-ascii?Q?7MfKbNYJJdpngu/RIaJxbsYykpbtYwZLuOI7ZEQXT2cQsWiHkLtEoXVxkKzR?=
 =?us-ascii?Q?kTdh9GhtFt9CZUecAvK3nuUkHZFiPFcsDMfpgrBSGCZSLvfsn5OMD3jDhQal?=
 =?us-ascii?Q?Qy5t6fJLnB3zD4Wgrb7zmsGvaMJeWa8CxhsQKC7IrDEmdvs+c2RdGhZx06SJ?=
 =?us-ascii?Q?daVD+OpMmWicpKHJh9P9C3CHcKt8mWZH81NjzDCtkRH1PA87RP7X2dzGiNgS?=
 =?us-ascii?Q?i/sukTey5b18my6ewtu+o8f3MxiI5DdEdoFCO+cYydCfwH0tpsxMOzY3J+UL?=
 =?us-ascii?Q?cOqlb2uZvH5EF6JH304BO4PYLpsaGrR+VUXpf6JGHe1vZp0MRQcR4zfxRkc/?=
 =?us-ascii?Q?D8QmFgBURL2iFuDLrjK/hsABivsM66GVFs/9ZncV1SyKfUIigbJrPa6NWd5a?=
 =?us-ascii?Q?ZZg8DNjTjaOIIq+ptC3ZtdihFVkRPJoPn6zgH3ogUtXBeAqIPQn3OgsreVME?=
 =?us-ascii?Q?UZhl7bmuGyKNrxRzOVudXaxM5bEkE9be7OllJMvcakGFsFpdJTL0iMch9lSB?=
 =?us-ascii?Q?YuXhLcTLmjSp2MaDs94CyC5hWtaA0SFrTujf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 13:50:38.7991 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 870505a4-d70d-4245-33fd-08ddc3a69509
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6604
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

When application A submits jobs and application B submits a job with a
dependency on A's fence, the normal flow wakes up the scheduler after
processing each job. However, the optimization in
drm_sched_entity_add_dependency_cb() uses a callback that only clears
dependencies without waking up the scheduler.

When application A is killed before its jobs can run, the callback gets
triggered but only clears the dependency without waking up the scheduler,
causing the scheduler to enter sleep state and application B to hang.

Remove the optimization by deleting drm_sched_entity_clear_dep() and its
usage, ensuring the scheduler is always woken up when dependencies are
cleared.

Signed-off-by: Lin.Cao <lincao12@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index e671aa241720..ac678de7fe5e 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -355,17 +355,6 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity)
 }
 EXPORT_SYMBOL(drm_sched_entity_destroy);
 
-/* drm_sched_entity_clear_dep - callback to clear the entities dependency */
-static void drm_sched_entity_clear_dep(struct dma_fence *f,
-				       struct dma_fence_cb *cb)
-{
-	struct drm_sched_entity *entity =
-		container_of(cb, struct drm_sched_entity, cb);
-
-	entity->dependency = NULL;
-	dma_fence_put(f);
-}
-
 /*
  * drm_sched_entity_wakeup - callback to clear the entity's dependency and
  * wake up the scheduler
@@ -376,7 +365,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 	struct drm_sched_entity *entity =
 		container_of(cb, struct drm_sched_entity, cb);
 
-	drm_sched_entity_clear_dep(f, cb);
+	entity->dependency = NULL;
+	dma_fence_put(f);
 	drm_sched_wakeup(entity->rq->sched);
 }
 
@@ -429,13 +419,6 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 		fence = dma_fence_get(&s_fence->scheduled);
 		dma_fence_put(entity->dependency);
 		entity->dependency = fence;
-		if (!dma_fence_add_callback(fence, &entity->cb,
-					    drm_sched_entity_clear_dep))
-			return true;
-
-		/* Ignore it when it is already scheduled */
-		dma_fence_put(fence);
-		return false;
 	}
 
 	if (!dma_fence_add_callback(entity->dependency, &entity->cb,
-- 
2.46.1

