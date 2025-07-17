Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FF9B0881A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 10:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6463410E0CC;
	Thu, 17 Jul 2025 08:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="etEHjmRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AD010E0CC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 08:45:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijq9r5Xwkvxn/uJ/PwDJq9Gg2TgKj+H9zrF87f5fszN3hFoJiISORbTgfjZ+SCOnqqXOJ46syMbqKzn2KPgrFkjDAno451k6bGXzic7RfG4c1BTScmW6UiAWLYufNfX/pYXLWPhxPi0QeKBwMsb3bZwNY2T7hckbKUtZ0bTQY42d4zz0tEPnLKuCO0AhTxrYjAhbTOZSGZFaHrPSjLv90k8xG0U7mmT9/cH6iy7B9mTxzTTpWjesUB3Msvf06rduo32jvs4dSFLmySrdZJHPsBR+I5VrI40HhcDq6SLUQYQy/hTcwz1wu+YBg3V+Xht3IqI9Ji8/6VHIGgJACw/nnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tfie1Z3JSZbGuMD4fAFdIGmBcv6Jb/6URqCi2wYPU0w=;
 b=O/89j9B+fYSh3xNQkMis8Cz4nJlQHE4JHxTKRftkUIkcr5VDTMh6eKWbiLhhLC1Hh/RQyFvYGEPrE7QCZw+3qF9C2AOYOYiS6n+qN1XePAL8GQr4gr+1+3DFUipQ8+N/7JZbXG45xJnzQqsyF7llzjuFGyJ+fF115X1tQLTtbZc8TlTepaoF2RgkfbYkKtYfwMcI5N5KTYuKfdOdXtX30k9J/9A1q/dImf27WH8wWubDiS6FV2EFxTECFEl0mlJegbXlOGy/do8787KwnWk4fuC1gRClFyC08Llgq1KFXrD2ihz9wGwM3BnaAYd0tXZdbNponkgckXchn4trVZvCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tfie1Z3JSZbGuMD4fAFdIGmBcv6Jb/6URqCi2wYPU0w=;
 b=etEHjmRxBuPUqZ2Epl5HMRlHgOkjq01V2ohFsHVZMBSrHu0Xxjj3e8Usj3/8Un0wqWZUbKXEAd5gSz9hkJnStcOz0Ja46u7yBy+CuAo1fCyjU2twu2IpNUfAtYbh1PZheEGN5bpr3sIATwuG4jV/EVrj1u5778wgTc/YJtt3ILM=
Received: from BN0PR10CA0015.namprd10.prod.outlook.com (2603:10b6:408:143::33)
 by MW4PR12MB7440.namprd12.prod.outlook.com (2603:10b6:303:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 08:45:21 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:408:143:cafe::fa) by BN0PR10CA0015.outlook.office365.com
 (2603:10b6:408:143::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 08:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 08:45:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 03:45:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 03:45:12 -0500
Received: from lcaoubuntu-server.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 17 Jul 2025 03:45:11 -0500
From: Lin.Cao <lincao12@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <zhenguo.yin@amd.com>, <Emily.Deng@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <phasta@kernel.org>, <dakr@kernel.org>, <matthew.brost@intel.com>
Subject: [PATCH v2] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
Date: Thu, 17 Jul 2025 16:44:53 +0800
Message-ID: <20250717084453.921097-1-lincao12@amd.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|MW4PR12MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: abb078b2-17c6-471e-068f-08ddc50e432a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmI4amVXRHkvSmgvQ0lmQW43VHF3KzdmbVZLbXFyZ3psNXhaZXdxbGVnNmtl?=
 =?utf-8?B?Zm0vdUcxZUJsT0pUa0JsTUJUa3JVQmZVMnQxZ2xjOGRJME4xWk1EY3p6V3Rk?=
 =?utf-8?B?bUFlbi8zQXptQkVML21LZlpYLzhUcy83dFpSRFVTNng3dHNkeGF3QmZTTDNX?=
 =?utf-8?B?UVVXakJBZzhKKzBCNTlpVTN3dG5Ja0l4N1U3eHQwTmJYenJEdk5pOWVieVBq?=
 =?utf-8?B?ZzJKSU1uOENtOTluc1l1RXcyTXhwRXRXQUQyWVBBMnlBd2FhZmduWjZZMVE2?=
 =?utf-8?B?c0JVRVNGNzY4Unh0Um54a3FVVjFucmpxZVNXQnJsaFZTQjdMUXAzRGdTVUxM?=
 =?utf-8?B?dW5KVTNLUTZFRmNnWklYL2JtanVuQVN4azlHSUFPVHI2K1BMZDF1eTU1TjVI?=
 =?utf-8?B?akdlL1ZoOEZ5VUZucUFEQ1pqUnVRamVYWVlNcUxtN2lTTFp4TXpRdEJldTVo?=
 =?utf-8?B?QTdwdEI0OGhuUW9jZmtYM1NjbUF5aC9DTzQ4eGo4c1pLcUZrTXRsdVJHUkQ1?=
 =?utf-8?B?QkIveWkxQ2dLMkNrZFZiU0c5eEd1aGMyZVk0VFJzYlF3eXp1QVd3TWxnd3I2?=
 =?utf-8?B?bXorVTZVZ0VCbmgrY2p0UVpCRTlQM0tacFpJaWJxZ0RtUGZXTlg2WTlsSnY4?=
 =?utf-8?B?S3NXYm1zOEZaWllxeXQ5bE1CNmNZbm5jUzVwbGEvdFBKVFcrb2haQWtyWUxX?=
 =?utf-8?B?dnBLaEc2U3p0K3FpM1c1NHFlQ2dtYVFYUDh1QjFHSFBIUFdiYWZlUjdrQmtS?=
 =?utf-8?B?NzdJaGFxRG8zbFdxbFZJcDJWMlhPZHlVQmhNTERkZjg0bXVxYjJ0MzJuVnNn?=
 =?utf-8?B?RWFwOXRqQkJkODJqU3RIcFBtOTdxVGhZY0o3dUtwdjFaazVFUWs2R1hoWlVJ?=
 =?utf-8?B?ZXBwQXFHYy8vZnBLV05tZWt2SmtzeVdMWVFIdURwT0o5ZVRVNGV0bmhVbVhv?=
 =?utf-8?B?cVlIeGNGZ3h1UFJqcVFWYks2R0FmRmowOUtVZXBYV1dXeGtSNDkrVVJRdjFT?=
 =?utf-8?B?L0FDaUdLOVpmVk5WSnVVL0JmMVNhSmRCc1AyQ3duL2VNQUVKZXBWWTN2RFpv?=
 =?utf-8?B?QVROdnFmVDdlTEZmZDc5bDBEMkRHb1hlNDVialhuTEZQR0ZnOEJMR3d3bUIy?=
 =?utf-8?B?Z0thOGc5cERWanhMTVIzWnRIUm1HbktsQ00vMU8wdUV3dEU4S0g4TGRsall6?=
 =?utf-8?B?bGVtTFZjdDhHR3ZzemdqZUhDWDI2d2h2VXd0NmxGVG1HSVBIRXpubzZUR2x3?=
 =?utf-8?B?SzFSemdZbWNyY2ZvOStwajYwODFYQko2aEswSzNVWDhoQjhYTEI4anp3NHE3?=
 =?utf-8?B?YWZMWUxGWE5LNExBYk9yZDV6aWtQaG04N2ZOUDQya05OQXJpOWVRQm5NQUtC?=
 =?utf-8?B?U1lJODlVQ0hsTlBhTldwaWxzankzdCtKNVFNRVo5OE80eTQwMkdxczFwN1hK?=
 =?utf-8?B?YlUwNDlTTWo5UEpvY0Y4M2ZaV1A2enZtY21OditmaVJCYnVYS2tZdzhpcHc0?=
 =?utf-8?B?cVBrZGtTRndIVFNWNk5MWnpQYjY1aEl3MXVEVUJoLzQ2SitRYktzaDBnU2Ny?=
 =?utf-8?B?dGJXb1g0RGNxRGxmRDh0R3YxNzROSXMrYmZwSFd5YmpSWDk0eVEzYlg0UDVB?=
 =?utf-8?B?SGxDRnZFdnNVM1lFVy9sTkswMThqYWFDNFcxb05jUFhhZmhkckdQWDUyY0sr?=
 =?utf-8?B?UVNZdXNSYklidUF1MkMxbGN5T1l3c2U1ZWthc2NnZWZkenNDR0RwOFIzN2VB?=
 =?utf-8?B?TTZwWmFuUy82Qmk2dWxUaVhPcmhQbU5lS3lCTE5yWXpSMDBvRXJBdi9hdFJt?=
 =?utf-8?B?TkNGMWVOejFHUFphOUQ2QXB1UVJUWWpLdWhRL3FKdDBUT1Zzd0duNHBNb0lI?=
 =?utf-8?B?MnFLZXFHYWVIbWtkUW1tSU5nVk5UV0h6ajVtRVVNQktmK1Q2QUozVVJkOGly?=
 =?utf-8?B?SDl1YmJ3d2k1bERTcHZyVGxZcXhUdHRIY01UNXJjdzdLUzVaNGdwT3YvZWdw?=
 =?utf-8?B?eDdSTlVKYUZqM2ttYzBOUWFmM2hweGE3RWtHQXU5K3FpLzd5M2JlMmgyUHd1?=
 =?utf-8?Q?4NcuQU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 08:45:20.3080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb078b2-17c6-471e-068f-08ddc50e432a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7440
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

Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup scheduler")
Cc: stable@vger.kernel.org # v4.6+

Signed-off-by: Lin.Cao <lincao12@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
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

