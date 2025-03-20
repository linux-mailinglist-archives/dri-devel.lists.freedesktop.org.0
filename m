Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC9BA6A32A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27DF10E5BE;
	Thu, 20 Mar 2025 10:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e5kcv/VB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5073210E5BE;
 Thu, 20 Mar 2025 10:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIZNOpmH1c+COT+HYxPBTY2Vv4mRFr3uBPG3x2mwy/pc28+pt1FDZmRLrQafcBdY7FpNMmIQnhx9M3wTccrRgjqlNlAIeQ1nYPuQ2mqbBJOE1XBINxDFm/ziZkTfWTIR0gPW+f9oB0Au6sxwAvuFnuDGi4NtGhF5L2Vu/E1uL8owC34RtbosFXUp6ecw5Zo+qjkhXjgEefHiaqd7avkvYN9y4hxrrOFZORCIhMoMZBievnEE1XxFBsc7Qu1mXSSXq6cugrqblMyiu4rluxF05AQ82JaqCFUxboFJpyjMaHAaPFLw6dhrqQ28XthnNUSuVYI1/jnEf1B+uApf1BngeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeFYVVYsFJSOdrS9GCSE5a0Pdn+6d5/EbspL0b84yMk=;
 b=hvatZ8XC9kmBpC7x1KRhUDtiR0MGE8UA5tv2YxpXdHgJBmpKVPYhSfm+URFT08ZkMCDLBP3rF0mqYRhbJ2a/MFcabeKoiSRE1ZAc4SEAk62/zTjPKzgLzLh5EMT/O2qiA0Y64XTG/YdvWAoH1+eqKCkMjWJNKv2myqVXb4zPjSdDirJ+cV+N4RzcrN5hhPQyQf6zHfodc+kNpnDi1mgCsyf38xP+B7Zzhm6WhpNiF2tl+/nODsETcC5aD0cCxqKNpB3OiteAXq5FGNAC3y/glP+AmRO2IxQAkCymxcC9NqPZCPxXhwKOzbX9YyXHgX4M77C+mG+neSEriYoidbKXNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeFYVVYsFJSOdrS9GCSE5a0Pdn+6d5/EbspL0b84yMk=;
 b=e5kcv/VB1XvCQkbwWN6n6KLrO17Z5YuynPooVQT9i6gKuV7uROXxlsnfAMoA7kbgqsEdNHnk0OqkuqSJ8tXhnpSvTS2BRQ+WIRT7aSl9n5it0/D+3k0ECsse7qZ7rb1o9hgn0eqvb5HJlA2NREBQZgikIdAOyUWynWeU2hkruOg=
Received: from BN9PR03CA0165.namprd03.prod.outlook.com (2603:10b6:408:f4::20)
 by MW3PR12MB4489.namprd12.prod.outlook.com (2603:10b6:303:5e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 10:00:33 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::81) by BN9PR03CA0165.outlook.office365.com
 (2603:10b6:408:f4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Thu,
 20 Mar 2025 10:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 10:00:32 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 05:00:30 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <phasta@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tursulin@igalia.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 09/10] drm: get rid of drm_sched_job::id
Date: Thu, 20 Mar 2025 10:58:05 +0100
Message-ID: <20250320095818.40622-10-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|MW3PR12MB4489:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f9da56-9100-410c-64bb-08dd67960db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|36860700013|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BBm6saOldbSBNCuCvnQZ17fOCbP7OCoZ4YZLkecM2FZ6sg0ka+S9IZsXrMdY?=
 =?us-ascii?Q?Jvgvnd3wsZ/r/x5N0bIa6qVXUnkd7szLS66oiYt3WS0bL0KcXfw9rQh8q1Qt?=
 =?us-ascii?Q?2dc8x+mlH4lM/JSFg+OeZ5QrKDNUH5FOtLlu7xUKlhW0lpxCDNHnGUu10+BW?=
 =?us-ascii?Q?ylltx2lL/rEiqj0AMh2oSXOy7em7++ogfWjZDap/ScdEsPVUYMfUSW09Y6zm?=
 =?us-ascii?Q?nmKlfDZoIPwIB62CzsBnbNPAVHOyae8BKw93EdoCgQOCf6XXROWwFsKFea5/?=
 =?us-ascii?Q?nbGeDRtZDyUC1FxdksoHfCsd+k+UyUZ1w+Dl0mq6jrv6RfS3VcfaOV+N3Pyb?=
 =?us-ascii?Q?GBsLMHsIygaNg3ZGklD3ynvUat/RK7qNQFyZSD+eGBQ9LFl2fiEGYBDI5V0S?=
 =?us-ascii?Q?deLzhGZi+F78LjrSbnYoD6WYGCHcYjV05Tfe7FlyKA5BcD9OZg9DjJrxnHYQ?=
 =?us-ascii?Q?MMX9/xypJ3NAsaRcPuUDdbJdCMYLUGmpLIvs2S2a4WF/+os9UW2DDyMMmHHu?=
 =?us-ascii?Q?StT/+hy+2OITdpCg5Vf4gYk5tROc/Ks2pXTwpexKukJSmS/1qhQ5X5FuOtPo?=
 =?us-ascii?Q?ahp51cYo+w1e6Z/Zw2zAH3f3V1iF5HPuTU1WIVbMX0ogweWFMEBG2RohoYCp?=
 =?us-ascii?Q?X+yXPx3J0fe8T4U+SSK+PK355u/SxHT46oslfNep70G8r8IIdsb2LdlrzEDh?=
 =?us-ascii?Q?7hAPbpCwuE7RBSFoo2EAh3jbuPd31L1oMlpnhUbyX22dABMRtD8ioisgGlX+?=
 =?us-ascii?Q?g4jJybA58vrRw451UPzf2r11XhYf3LJKeP0YGflYX6UZnBh931BsNxARA5G8?=
 =?us-ascii?Q?DIuYTW7CUkK5dMN5fbwPEvHq+CE71rlzAwF7jP53Y5JbFv/OoRQi9ch7CGL2?=
 =?us-ascii?Q?XkTHRpKI02bsZrruKCeNCcVBkvnxbqh3xiW4za2VANr7XgO8jb2+L64PONeT?=
 =?us-ascii?Q?iChn6QtL/e8xbEDnnbfzBA9CLnkbI21dNSgtG3OD+W9pVVOWfsl+Zy6bWtU4?=
 =?us-ascii?Q?LeDbZZmTcKBqw9EFjGvjBFvpN3w16TCZYtCfdv6wmD4PuRz2J4BsQZnGgtLF?=
 =?us-ascii?Q?2jZ/tW89caI+lT3o3JeDQYc1PDLYkcnCdtuvX//d7Wvm9yDZFMeZFuytiZTA?=
 =?us-ascii?Q?HAMoEHwWd6gHL9PT7NZWmnDN36rck9pz8cAoMxM5rpZ6R+sjR/bqiwP/5I+w?=
 =?us-ascii?Q?XP3VFIvhJVBQIExyxRzp92QqEm2pLOPLHYaJM0xE2OTJzNtvhkxASC2UttQE?=
 =?us-ascii?Q?qBT4uFjGnEcQ3jHM3AaG6cdlyE4hdrknxZfOY7em+utwApWf+kBnEpOHgPvL?=
 =?us-ascii?Q?0JMUkaNrxsSQ0zgCTqiLrpfLI/dzi8jzY0EJzeca9DwEOsJzIzfnmVVnr2pj?=
 =?us-ascii?Q?aOMtvlHEqxED0q3JdnstgXPggsy/pTx7KwxKgu9o+aYBDG7r245brWJwh9iO?=
 =?us-ascii?Q?kIgdzoK8tvXIjrDpH1P/j51xTDsGeJdi+du1UmV58SMpRICiMO4WrCTfLjpm?=
 =?us-ascii?Q?JY47KQX1RU8Cc4O09+HN3e6u2qSVP2bULELZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(36860700013)(1800799024)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:00:32.8494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f9da56-9100-410c-64bb-08dd67960db1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4489
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

Its only purpose was for trace events, but jobs can already be
uniquely identified using their fence.

The downside of using the fence is that it's only available
after 'drm_sched_job_arm' was called which is true for all trace
events that used job.id so they can safely switch to using it.

Suggested-by: Tvrtko Ursulin <tursulin@igalia.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h      | 18 ++++++------------
 .../gpu/drm/scheduler/gpu_scheduler_trace.h    | 18 ++++++------------
 drivers/gpu/drm/scheduler/sched_main.c         |  1 -
 include/drm/gpu_scheduler.h                    |  3 ---
 4 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 383fce40d4dd..a4f394d827bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -167,7 +167,6 @@ TRACE_EVENT(amdgpu_cs_ioctl,
 	    TP_PROTO(struct amdgpu_job *job),
 	    TP_ARGS(job),
 	    TP_STRUCT__entry(
-			     __field(uint64_t, sched_job_id)
 			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
 			     __field(unsigned int, context)
 			     __field(unsigned int, seqno)
@@ -177,15 +176,14 @@ TRACE_EVENT(amdgpu_cs_ioctl,
 			     ),
 
 	    TP_fast_assign(
-			   __entry->sched_job_id = job->base.id;
 			   __assign_str(timeline);
 			   __entry->context = job->base.s_fence->finished.context;
 			   __entry->seqno = job->base.s_fence->finished.seqno;
 			   __assign_str(ring);
 			   __entry->num_ibs = job->num_ibs;
 			   ),
-	    TP_printk("sched_job=%llu, timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
-		      __entry->sched_job_id, __get_str(timeline), __entry->context,
+	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
+		      __get_str(timeline), __entry->context,
 		      __entry->seqno, __get_str(ring), __entry->num_ibs)
 );
 
@@ -193,7 +191,6 @@ TRACE_EVENT(amdgpu_sched_run_job,
 	    TP_PROTO(struct amdgpu_job *job),
 	    TP_ARGS(job),
 	    TP_STRUCT__entry(
-			     __field(uint64_t, sched_job_id)
 			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
 			     __field(unsigned int, context)
 			     __field(unsigned int, seqno)
@@ -202,15 +199,14 @@ TRACE_EVENT(amdgpu_sched_run_job,
 			     ),
 
 	    TP_fast_assign(
-			   __entry->sched_job_id = job->base.id;
 			   __assign_str(timeline);
 			   __entry->context = job->base.s_fence->finished.context;
 			   __entry->seqno = job->base.s_fence->finished.seqno;
 			   __assign_str(ring);
 			   __entry->num_ibs = job->num_ibs;
 			   ),
-	    TP_printk("sched_job=%llu, timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
-		      __entry->sched_job_id, __get_str(timeline), __entry->context,
+	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
+		      __get_str(timeline), __entry->context,
 		      __entry->seqno, __get_str(ring), __entry->num_ibs)
 );
 
@@ -519,7 +515,6 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
 			     __string(ring, sched_job->base.sched->name)
-			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
 			     __field(unsigned, seqno)
@@ -527,13 +522,12 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 
 	    TP_fast_assign(
 			   __assign_str(ring);
-			   __entry->id = sched_job->base.id;
 			   __entry->fence = fence;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
-	    TP_printk("job ring=%s, id=%llu, need pipe sync to fence=%p, context=%llu, seq=%u",
-		      __get_str(ring), __entry->id,
+	    TP_printk("job ring=%s need pipe sync to fence=%p, context=%llu, seq=%u",
+		      __get_str(ring),
 		      __entry->fence, __entry->ctx,
 		      __entry->seqno)
 );
diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 3c7f6a39cf91..ad03240b2f03 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -58,7 +58,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
 	    TP_STRUCT__entry(
-			     __field(uint64_t, id)
 			     __string(name, sched_job->sched->name)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
@@ -69,7 +68,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     ),
 
 	    TP_fast_assign(
-			   __entry->id = sched_job->id;
 			   __assign_str(name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
@@ -79,8 +77,8 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
 			   __entry->client_id = sched_job->s_fence->drm_client_id;
 			   ),
-	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, client_id:%llu",
-		      __get_str(dev), __entry->id,
+	    TP_printk("dev=%s, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, client_id:%llu",
+		      __get_str(dev),
 		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count, __entry->client_id)
 );
@@ -117,7 +115,6 @@ TRACE_EVENT(drm_sched_job_add_dep,
 	TP_STRUCT__entry(
 		    __field(u64, fence_context)
 		    __field(u64, fence_seqno)
-		    __field(u64, id)
 		    __field(u64, ctx)
 		    __field(u64, seqno)
 		    ),
@@ -125,12 +122,11 @@ TRACE_EVENT(drm_sched_job_add_dep,
 	TP_fast_assign(
 		    __entry->fence_context = sched_job->s_fence->finished.context;
 		    __entry->fence_seqno = sched_job->s_fence->finished.seqno;
-		    __entry->id = sched_job->id;
 		    __entry->ctx = fence->context;
 		    __entry->seqno = fence->seqno;
 		    ),
-	TP_printk("fence=%llu:%llu, id=%llu depends on fence=%llu:%llu",
-		  __entry->fence_context, __entry->fence_seqno, __entry->id,
+	TP_printk("fence=%llu:%llu depends on fence=%llu:%llu",
+		  __entry->fence_context, __entry->fence_seqno,
 		  __entry->ctx, __entry->seqno)
 );
 
@@ -140,7 +136,6 @@ TRACE_EVENT(drm_sched_job_unschedulable,
 	    TP_STRUCT__entry(
 			     __field(u64, fence_context)
 			     __field(u64, fence_seqno)
-			     __field(uint64_t, id)
 			     __field(u64, ctx)
 			     __field(u64, seqno)
 			     ),
@@ -148,12 +143,11 @@ TRACE_EVENT(drm_sched_job_unschedulable,
 	    TP_fast_assign(
 			   __entry->fence_context = sched_job->s_fence->finished.context;
 			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
-			   __entry->id = sched_job->id;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
-	    TP_printk("fence=%llu:%llu, id=%llu depends on unsignalled fence=%llu:%llu",
-		      __entry->fence_context, __entry->fence_seqno, __entry->id,
+	    TP_printk("fence=%llu:%llu depends on unsignalled fence=%llu:%llu",
+		      __entry->fence_context, __entry->fence_seqno,
 		      __entry->ctx, __entry->seqno)
 );
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 85c2111e5500..85e0ba850746 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -848,7 +848,6 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 
 	job->sched = sched;
 	job->s_priority = entity->priority;
-	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 032214a49138..ddc24512c281 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -326,7 +326,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * @finish_cb: the callback for the finished fence.
  * @credits: the number of credits this job contributes to the scheduler
  * @work: Helper to reschedule job kill to different context.
- * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
  *         limit of the scheduler then the job is marked guilty and will not
  *         be scheduled further.
@@ -339,8 +338,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * to schedule the job.
  */
 struct drm_sched_job {
-	u64				id;
-
 	/**
 	 * @submit_ts:
 	 *
-- 
2.43.0

