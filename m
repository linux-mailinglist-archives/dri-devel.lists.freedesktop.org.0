Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B71C305B0
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 10:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FDC10E24A;
	Tue,  4 Nov 2025 09:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ghr5RwuD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010041.outbound.protection.outlook.com [52.101.61.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E596010E24A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 09:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZP58PQF2HegCKBWYYgs0cYWpXkGbLkvLbQYekhG7tlosWB5zC/h21+RDOLE9mh8/NF/pAi1+6zKs/23Yw1I8vxxB/zDuuME3RLqGDJI5OOPerrQl8TLRWzb801EbgqDIjb1geeRq17+9kAIgPcRArn8mHsAUOTwzfusELlmkqt+d97fC0g2JHSVmJhl5HbAhTTb4Nb9O2cUZQ+HhiulZgQ+QY/l45m0qq1p0KQy48PObnFYTIUGwf3Rar+wT7c30qVCIrx+eOnRzC7PH3RpILePDrwsTd7pX0eX8ADmbFSqKi6pm6hfbNMOH//YHEbYIwnrH/Ldf/arlKibOUcOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uts/TC69k7OdUnyCKvM3l0w9KWKS11vz8yXBSncKiCg=;
 b=MZwk0fMQCSYn/7rXTZZjDqzGmcletyZnTIRRrAdeE7wSMlzGzOM4BUUis+Y6teMcTwFxCwEC9k5yBf3KCKR79bS/pk28flz/4+AJFAFk4/Bm6zFOHa8jzx2qQ2pxJv9BZUAliqLMaLz3w0Fj2/1pcULmmr5VPLgvz8qOSTnh1JANnnqvWoUZLu3FvTzrl5+qF153WPCKvOgGJ3939ed6XsAtGcMbQtXt1urJmDBxNesmmoY40bFiRTECkFC9JNhiM9jkbcX3s6Jt9IQFkm/PtubarCbr4pPFgXBbRJdaI1lcbhNMbdjqPHc9Yz8F2go24AdL24rhfzK9xkm7SaheoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uts/TC69k7OdUnyCKvM3l0w9KWKS11vz8yXBSncKiCg=;
 b=ghr5RwuDtXcShMUaAOtjPZ3586ZNBz/LqhpqokDhdBCe5HwrUIisWfVFkJTuRKpANgrrFflJjGb7sO9sX8LO/CJRWUInGl1npnQk+e3VUEaLnPhqLfkbkV7TKsGFcaKIBGw8guK6/nx4Bwh+6WyeZvylzLPt3FTk2b7mdWTRqA4=
Received: from BY5PR13CA0035.namprd13.prod.outlook.com (2603:10b6:a03:180::48)
 by PH0PR12MB7815.namprd12.prod.outlook.com (2603:10b6:510:28a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 09:54:22 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:180:cafe::77) by BY5PR13CA0035.outlook.office365.com
 (2603:10b6:a03:180::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 09:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 09:54:21 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 01:54:18 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Mikhail
 Gavrilov" <mikhail.v.gavrilov@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v3] drm/sched: Fix deadlock in drm_sched_entity_kill_jobs_cb
Date: Tue, 4 Nov 2025 10:53:57 +0100
Message-ID: <20251104095358.15092-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|PH0PR12MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e95ec7-7302-48c7-4b09-08de1b88213d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|36860700013|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWpGSUlsd0xKdGtiOWJmWXZDSDRmQ2o3N1RNb0twY1locHdvRkRyMGY4YjAx?=
 =?utf-8?B?c2VXQlJ4ZmhtdjRySklSa1pjekJNVjdDSGpxY0VoYytkeUJ2aHpWT1BUQS9m?=
 =?utf-8?B?aGM2b0cwd2lsb1V5WTR0cWdhUGZWTVVyTkxtU2lLNUJJcVMrR20xQkQvN0ds?=
 =?utf-8?B?L2lCUlJZdUhHWjB4YTRDWFcyTWdtL05lbWpoRlowUS8xMXB3UG93aDR2Qk1O?=
 =?utf-8?B?K0w0SXljaFVEa0dHRFNVVzg0UVZlTVlveE5QNFhLekE0MG4rRUlKM2ZlY1Jr?=
 =?utf-8?B?MXRXbGxoVzdzcm5yd25rb2dWb0pBZHNzc1p5ZzVNVmpac205MHNEOFhJVlB4?=
 =?utf-8?B?a3hwNFQzcjRPaXZwdjhucWVnWXVCTWk1TGVOOUVKU0d3S01LVWlEblJJUWxw?=
 =?utf-8?B?Rm5raVgvRnJybW5rOExhU1hJVUZrazQxaytPMVYvOEFER0pZY29yOGlhSUk0?=
 =?utf-8?B?akMvRUZaKzN2M2M1U0Z6SEZIQU1JVUpJR29vaFEyS09EUWErU0RsZkNSN2Vz?=
 =?utf-8?B?N2poS2tRTG1aZU04R3pDb083NWppcXdNb2ljcG1NY1hKVE9CMUxHWDJydUVX?=
 =?utf-8?B?dy9tbHRSVG1IUktRRXZvaDdacE1OKzRnQ3BFVXJZRnptTUZvWE9iNVB6MnZK?=
 =?utf-8?B?VzNWTkVEeHR4dlBWUzRkVlFuS0p2UUZpdVNMcU1xUzVpZWZ3YVRJczNHVXdY?=
 =?utf-8?B?T3V1alBGZ2xveFNiSUhoc3pROWFaRHJtNXoxNVI3TkxVd1lOTzZMSVRJL3VX?=
 =?utf-8?B?TFY1S0Y3OEZVNjFMMDJ5UHdTbWRQR2ZDOEp5N2tmWDVRYjd1Tkxwd05FV0xM?=
 =?utf-8?B?VFF3NEQ1YjVvWUxnSTdxdCtENnM2M1JBTW5WS2UvWEFlWXdJUzZtdGM5VENV?=
 =?utf-8?B?VGhaNUFyQVR0K01IazBFQWdqMi9jMHdnbEFEcHJHUlVaRjlCUlRkSFZMUnhw?=
 =?utf-8?B?TEZKWTZ3U0trSmJYVFZkWHJDUmlsR1V0Qm0zanZlMWQ0cmdYdk05RUZ1WHlT?=
 =?utf-8?B?ZTEyT0RjQTJQWk1JTTJRbXJCcnRsOE84YUozOTUxU0FXQ3lJTCtIRlA3Z1Q4?=
 =?utf-8?B?aUFsYjlhVno3bVpzRVFKalJMVVhKOWNEYWt3amEvOVI2UkJyeEd2d0tBbmVK?=
 =?utf-8?B?eWxWeXJvMVpQS2RhSGZCWjlrbkNxWnRtZmRVQlFGVTlhWU5RVUg3ZFYra29t?=
 =?utf-8?B?VWUrN3B6MDBMWTJZdmJ3a1Y2bGp6YXNwaTM3MVBrbXUzc2JMbUczQzRDTHJz?=
 =?utf-8?B?cHlqWEtaUDVxOG0rZmtHY3hBUEdHdFd3QUpYSVcxSzJKK1ZJd216SklOY08v?=
 =?utf-8?B?THpOUWRoUDRUVVBDcFpoVW8rcFZsM0VJMmJZYkdLQ2UwTzFOMFdMaTJpZkY2?=
 =?utf-8?B?ZEo4ay9naGEyQldhWG9kQm9Vd3pBYU5zQjcyRTd3MUhadHhsZ1E0aSt2cGdn?=
 =?utf-8?B?WnMyOGlCeHBJcGk2bW1HMXg3bGhWLzhHdXhOT1R5TE1xRENlQXlJa0hObEJz?=
 =?utf-8?B?NVZyVE9VL3VLRkc5aUV6TGtCSkFLeDlSOHVoTHQrYkJPOWw3b2UxSmErK253?=
 =?utf-8?B?THVTMFZORG80TjBxdzZkRlhrMWZGN0syNGlwL3ZDOXBoZlA2U3cra1ZJWVU4?=
 =?utf-8?B?UzBTMW54a3lieGMyUGFscE9zemZtQVZaN2o3VUZFejh2K1FYZVhZbTFTZXQ5?=
 =?utf-8?B?NTFrZTVKSHdub3FESklaSFFRazVEeFBOMFdXcmV6MFplOFNjY2RrUVFHVHpt?=
 =?utf-8?B?V0xneFFkWlFqd24yM0xoMG9ZMlhKc3l0SU5zbXlwaUNmS1VWVTYvM1lteFJT?=
 =?utf-8?B?Z0dWZWNuTzhOL2xaQ0dPSUs1dmJ6TFJGdWpLNklrb2NNRWN3KzNRQUVoczFR?=
 =?utf-8?B?SWNPakRGZ3A3cHJlUlRUZ0JibVB1VXh4am1BTVVkNWg3bVV5NFJ3dTZhMkN2?=
 =?utf-8?B?SlpyNDAxRVIxWW5UMUI4ZU8xV2ZnL1FHUCsrL3RhcStvcWJlSUljbmRNV0U0?=
 =?utf-8?B?WmxqRC85UC9nRWRLZ1ZVaFZUU3NjT2dLSVFXdTB1aHJGWTZySURWcjM2UWhs?=
 =?utf-8?Q?cv+Jip?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 09:54:21.9010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e95ec7-7302-48c7-4b09-08de1b88213d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7815
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

v2: reworded commit message (Philipp)
v3: added Fixes tag (Philipp)

Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
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

