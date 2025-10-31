Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D415BC24046
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 10:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B601F10EAD6;
	Fri, 31 Oct 2025 09:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hj3nAC8k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010048.outbound.protection.outlook.com
 [52.101.193.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BDA10EAD6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 09:08:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5jZluuyJhog0VB7XMlw5ul/hodAx/bypq+bloiZ/r2d1+eS3gFQR30qepO/AQCjQnxm5DmxiznfDtUeE5yd087YPmZXqXKuTy7cR4n4onLn/5ASWJ27EOvhSAwUpgWBpOx+amszHKy3rmRZDfg7DLmifYhD8W7N+qrEB4OJA/1iVSx1T/yZdqzjnjUHIUlFjjn5YGQCLfb8zinHB6hWPamdmvyiAzE2X7MNqbCdyWKQu2gICfNoVV2KpTQVNLWctJ6Nrl347vGm1gzR5sM744/oVL7A6ebVeSN7U3eaqQY3MVJ7oV1gslhDLMpfvp4JkeHlMM0llrf215As98HIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdNvOiQ1LXcb13VOXga0h/FFdJUqY66hyml/hMGWAEI=;
 b=LT05SD1gf83ic3Yo51mHI7c/sXAV3i5t9Sl/StUMfWHhOOqDz0YNaR3KTTR/41Ffkq7IIkvIT2vNk5wdhRDPmG8JkcaSqK2WnjBB2xMadsseannBLZOYOKk+MoRUdEyoDcefqUR2pXGzf5QsMN4nH98hVvmTHxn4iqyZzwJzqWNojwQFYU08CDO98dK1KWT0znUSVj8CoBY418xF9k7waY7CUQZLAcTnOPm/B5LJFbIKiaOnWl418wp2g2DX9naPiDI05jFJ6m34mmswRu0mhHP4wjO5uo8CBB4pKEYMyeoeNwzszEr3GZGxoEXmBjJ70bQe9rd4TctmylApxFqLfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdNvOiQ1LXcb13VOXga0h/FFdJUqY66hyml/hMGWAEI=;
 b=hj3nAC8kRu53LFEFQ1eIf3hSZoZpg62uimlrBoxl1txqUhSpi7r25HvSjWk7G8Nlw2NV11ib2ty9C7BO57KlOq0VKPDVhwrD5chWpa28CGmMz56PshgEaJLt5BgBACU9qXmgTAODAvVdhcdrvk0K8OQQiCG0qm+ygFSG9kA9IrE=
Received: from BY5PR04CA0029.namprd04.prod.outlook.com (2603:10b6:a03:1d0::39)
 by IA1PR12MB6458.namprd12.prod.outlook.com (2603:10b6:208:3aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:07:55 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::14) by BY5PR04CA0029.outlook.office365.com
 (2603:10b6:a03:1d0::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Fri,
 31 Oct 2025 09:07:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 09:07:54 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Oct 2025 02:07:52 -0700
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Mikhail
 Gavrilov" <mikhail.v.gavrilov@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v2] drm/sched: Fix deadlock in drm_sched_entity_kill_jobs_cb
Date: Fri, 31 Oct 2025 10:07:03 +0100
Message-ID: <20251031090704.1111-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|IA1PR12MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 04bc99fa-1d1e-4ecc-f922-08de185cfa72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnBmTGNNUFpFMVNzTjVuZHcrUEZjWGtVRmlna2xoMVBIZ3QrNVdWL1BWS3hU?=
 =?utf-8?B?U04yZ3dNbXBobktUMmZNSk9TZXVsMEgyNTFlRUZ1UGFNMU9vc1hiMFlCaExX?=
 =?utf-8?B?ZVNraUhZaWhBTFc3b3VqczJxZFdtNW1rZHZXR3h1Y25QblRuUUVYK3NGN0t3?=
 =?utf-8?B?R0pkMHZBZXRZL0p6S014eWU1SFBxSW9kclVtVlJIZkFlWlNudFI2bE1xTHY4?=
 =?utf-8?B?K2NKWWRYMmRlbTlrKy9yaFNJdm5uZHl1RnpHZnloV09HZXkyZkttZzJtTkhH?=
 =?utf-8?B?THV0eEJxZ1NvRHQyd09JVGdSOTBweUlod2RsVHZjSlpWa2xubVlXZFY3OE1w?=
 =?utf-8?B?NDVXdlU3TFVXaGprMnNSems0Q1BLMDM5SEZ2WE1UazQ0Sm1nUlRpYnVBR0li?=
 =?utf-8?B?T050Z0tTMW9UQUdJSFV5TE1TWHpXOHJhc2tTUWtvTmhDTzNvRUY4d2VJT2dj?=
 =?utf-8?B?RW5jTHNvcHJsVzZ2RjZyYzk2djBJWGYwV0ZIR1ZXNjJsMk03V2RvNHFUS3JQ?=
 =?utf-8?B?cUpSRlFSNmlNaVcwZGQ1Rk9sRE9ib1FBZkZBMkJnRTA4QW5Db0RjSTl6cnQ2?=
 =?utf-8?B?VGQxaEZmWmxBM3p5SzB2NUw2R1RzelRSRFVhRWpzdzhPUjl0UnA5RDZmbmsv?=
 =?utf-8?B?bytoUTd0TWM5QkdWZFROSFlySmtraVpWeHpxUkpRWVZyZkJJUXJDakhxcHY3?=
 =?utf-8?B?bklGd0p1Nm8wQ2RpYnlSZFlMby9TUGZlZFNLb3VxV0h6U2Z1azE2NUh0VjZI?=
 =?utf-8?B?Q1VGem1aYWxNWEZ1UUNhMWhjN1dSL3VUWWttZGlSNTFWWjRyV0RkU1NPSjBD?=
 =?utf-8?B?MHlXWmtQYUZNQXRLT1JWd1ZhZG1JeUtmZDFNQVFuVGViRDZPTFpVNENGd2Jz?=
 =?utf-8?B?c203N0I5bDhST2hDWkMzbEJRSFB1Ti9lU2Z2V3E5N0FlZDk0WjJjRnBvbm9u?=
 =?utf-8?B?am8vMzZ2QjJiUHZjYnlYTmYyaGNDbkhLem5BNEhzVkJYSnpkKzlKLzFVbURq?=
 =?utf-8?B?QTRqOTZTSkIxM1p2aE9Way96eXAwZFovUFlNYllBSU5NdVVZdTRFcXFvRDZw?=
 =?utf-8?B?UGEreHNVK2QzSHlqVy9KR0c2SXdNankvYVdXOEFLbU1ja3pKZGU1aG5vN1Rp?=
 =?utf-8?B?eDNtYVJMQ0ZjMDNNWENScSszM1Jnc3ZTU0VqaG9VbUQ2ekdzYXFENVlQbmFD?=
 =?utf-8?B?aTdXcmg3WExrb0o3SHBJSW5vVnhUQW9IWkV6SUt0Si9FNjdCQzI2RWlIKzBl?=
 =?utf-8?B?a21BblpmOXEyMWlZdzJGeHd0clJXc01RUEJScGFxVmF1cEpOaHZGdWVacUtt?=
 =?utf-8?B?KzFDbEpNRXdrUHBDcVV6MkVDMkhLRWVGcWRwS1Uxeit0UVNFa1NETmJtR2tP?=
 =?utf-8?B?Zi94M05mQVlvZDNSRm1MY1N4WWo4ZTAybkhyU1FkNjdxUlNSL2xNTEdVd3hP?=
 =?utf-8?B?ak9rejl0SndkNlhJSVJFVkZJM0FHSnRoc09yU0oyNjZYQTJOWlVNVFVVNnV0?=
 =?utf-8?B?Z1d3QWp5QjRqQ0tNU1k4bm1HTElHeGFtMzZMNlVWM1N0L3pSd0tyZDd5Yk5Z?=
 =?utf-8?B?QWlDUWQ1c2lNUExRa3d3a2dsY1pYRFVRZHQ0cENNTlIvRTdLdWMrcEdJTmRK?=
 =?utf-8?B?bUc5Z3VENTc1dkg0cTMyNy9pQm5rYmswazljZkt3VHMzbDNEN0FseW1HNlhZ?=
 =?utf-8?B?b1RVRmFSaEQ2Z1Ivc1VPak5vUWtlV1dZUUZBVTVRbUJ4bjgzNTFicE9wR0V3?=
 =?utf-8?B?N2ZUeWFDSVZvTFNhL2RadWVLaTZMblFQd24xWEdUbWRzUk82a1ZGNGRHc0pR?=
 =?utf-8?B?NFNiaUJvL2Z0bFk4YnVWTUJyZDl2NG14L2ZPYXpDY1Nkd0FCVkZ5TGNsVE5I?=
 =?utf-8?B?b3ZPUWlPblU5UmY5K0t3Vytka09YeEp1WEhFUXhQZXFJOVpOVE5Zd2ZQQTBn?=
 =?utf-8?B?UWN5ZFg5M2FXL2RUUWRPeGRZTGMwTXRxZkdGYmZ4eFA0NW94SzBLZlFNNU9w?=
 =?utf-8?B?MlcvK3A0NnNFVEhIc3dGU2pKR0t4a0hyZTNMSFpOM0t4anJ4THJiOGtXREJY?=
 =?utf-8?Q?exbM1M?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:07:54.9755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bc99fa-1d1e-4ecc-f922-08de185cfa72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6458
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

The Mesa issue referenced below pointed out a possible deadlock:

[ 1231.611031]  Possible interrupt unsafe locking scenario:

[ 1231.611033]        CPU0                    CPU1
[ 1231.611034]        ----                    ----
[ 1231.611035]   lock(&xa->xa_lock#17);
[ 1231.611038]                                local_irq_disable();
[ 1231.611039]                                lock(&fence->lock);
[ 1231.611041]                                lock(&xa->xa_lock#17);
[ 1231.611044]   <Interrupt>
[ 1231.611045]     lock(&fence->lock);
[ 1231.611047]
                *** DEADLOCK ***

In this example, CPU0 would be any function accessing job->dependencies
through the xa_* functions that doesn't disable interrupts (eg:
drm_sched_job_add_dependency, drm_sched_entity_kill_jobs_cb).

CPU1 is executing drm_sched_entity_kill_jobs_cb as a fence signalling
callback so in an interrupt context. It will deadlock when trying to
grab the xa_lock which is already held by CPU0.

Replacing all xa_* usage by their xa_*_irq counterparts would fix
this issue, but Christian pointed out another issue: dma_fence_signal
takes fence.lock and so does dma_fence_add_callback.

  dma_fence_signal() // locks f1.lock
  -> drm_sched_entity_kill_jobs_cb()
  -> foreach dependencies
     -> dma_fence_add_callback() // locks f2.lock

This will deadlock if f1 and f2 share the same spinlock.

To fix both issues, the code iterating on dependencies and re-arming them
is moved out to drm_sched_entity_kill_jobs_work.

Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c8e949f4a568..fe174a4857be 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
 }
 EXPORT_SYMBOL(drm_sched_entity_error);
 
+static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
+					  struct dma_fence_cb *cb);
+
 static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
 {
 	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
-
-	drm_sched_fence_scheduled(job->s_fence, NULL);
-	drm_sched_fence_finished(job->s_fence, -ESRCH);
-	WARN_ON(job->s_fence->parent);
-	job->sched->ops->free_job(job);
-}
-
-/* Signal the scheduler finished fence when the entity in question is killed. */
-static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
-					  struct dma_fence_cb *cb)
-{
-	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
-						 finish_cb);
+	struct dma_fence *f;
 	unsigned long index;
 
-	dma_fence_put(f);
-
 	/* Wait for all dependencies to avoid data corruptions */
 	xa_for_each(&job->dependencies, index, f) {
 		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
@@ -220,6 +209,21 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 		dma_fence_put(f);
 	}
 
+	drm_sched_fence_scheduled(job->s_fence, NULL);
+	drm_sched_fence_finished(job->s_fence, -ESRCH);
+	WARN_ON(job->s_fence->parent);
+	job->sched->ops->free_job(job);
+}
+
+/* Signal the scheduler finished fence when the entity in question is killed. */
+static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
+					  struct dma_fence_cb *cb)
+{
+	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
+						 finish_cb);
+
+	dma_fence_put(f);
+
 	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
 	schedule_work(&job->work);
 }
-- 
2.43.0

