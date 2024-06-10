Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB39022AD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 15:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C2210E2B5;
	Mon, 10 Jun 2024 13:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fov2Fcbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1073810E2B5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 13:28:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAXR7updeyWAfIKnRMnouJFUMrfR3BEe5ca7171fz0Lpise1wmkGJy14sZCvPcGHpJSCkc2XzjW5POj31WXVlOWu8H3ypgt/9FxTloInzzEfmwWY2aS0NFOzR2kHKWAqtKzZ7hmr1d7VkerMcVVXnzQBKEBdHJZDpG7Ztrm92FhnRj81QOOgNXfjOdPxvBGjsbUn3/9tjfrlvZgKniSg8RGVf8NnH4rg5ARAPmhK55ttCBrg3+aKEfH6xhS8BaXANky1/8LVBerVsJMd9bL5mCI8uc1olHJI9Ep7HWF87kFfXc6mqQjguiUOYvaZenKq1sgBQ24RGR166pA+NXqnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIwalo9eHUX21/6M52L7YW+QWkI0fdnlmmp23GLIafY=;
 b=VsJ1ZONOtS6U8IgyaQwJhQarmQuVhjydlKWkhG3oDmjlgw7aUSXHG8PkQuvE174DY6ErQqpbN9B2Iq/tcakbjzWSABQqDvcQG6OgS67N2lM6zletbTF/b3UwMpvbayfaly3fqvznMuf3W6ySJZL6+TSijsvG6iOJb8ZLoqqITfmvRUm6JK2Jso/RnTPohWU9oclZcI1S94uDrdlWCrD3fstCscSREgy5hWuxHLiQPIRnhBUw4AIbSmK9AXe0IXhObpLovLJq7uyB+ijm7nJCClyt+Rsm8paZkubU5xPK7TcdhVXC8wAq0geozUXSMhzuJuxCv13MwrotHTclxHHmzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIwalo9eHUX21/6M52L7YW+QWkI0fdnlmmp23GLIafY=;
 b=fov2Fcbffb4lyJTWphJr2biNAe33fzS00YUo4u42uABgeDvF+YFYtCea6baqzCas0qre7B9KC1XXIevdOA8mcD4sSC4QPmo/Syjv6OuFrZFby/tXZbBbfiKYfWyPXtOm5xvf/DIfqeDo9EVA0HhbamTyuUg8lVOxuA3T4Jx4fS8=
Received: from BN7PR02CA0035.namprd02.prod.outlook.com (2603:10b6:408:20::48)
 by IA1PR12MB7760.namprd12.prod.outlook.com (2603:10b6:208:418::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 13:28:05 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:20:cafe::a2) by BN7PR02CA0035.outlook.office365.com
 (2603:10b6:408:20::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.25 via Frontend
 Transport; Mon, 10 Jun 2024 13:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 10 Jun 2024 13:28:05 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Jun
 2024 08:27:58 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 2/3] drm/sched: cleanup gpu_scheduler trace events
Date: Mon, 10 Jun 2024 15:26:55 +0200
Message-ID: <20240610132707.61404-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240610132707.61404-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240610132707.61404-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|IA1PR12MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: d59f3a30-5897-4abd-802b-08dc895128fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|1800799015|82310400017|7416005|376005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rmInUDaI0Chk6lDhk31XbLGmXMDso4GmCJ4hzbry419CnRyjhzC1K0sQp1mE?=
 =?us-ascii?Q?IsqT7Tw1Hw7bM78VAjoy80TU89VicgWolKtw+CvEqzsbPb2Yt4B2waFm6QdA?=
 =?us-ascii?Q?c65HzPsDc3U2ZY8uVE89Ss+u1eMndGybUJC3LZgVkd0yG3xxFHEUmHIAj+2s?=
 =?us-ascii?Q?cPBwJ/Uq6ba7IDcj1FuyqXH3SmlU66oUGDVFNO1pS3KGhi12Kms0Nad9iPUC?=
 =?us-ascii?Q?42R0lGuA2JLS/mQ0oVconzGOyJwkpySuyPrqAntOHz70vx/v7R4hDVk8x/mI?=
 =?us-ascii?Q?DnP53Onw8F5038t+gX3DBj8rsZ0Wiz03SjiOzHXvn+/gk5JzUyLNYjBiUDkM?=
 =?us-ascii?Q?rRpLfxKaYUQi+xJrizIDjrSxZs/1w25Cwd3JtOPhFF769WzFhbGxWSLFn2Ho?=
 =?us-ascii?Q?d9E1Nc8QeBhFPCjM+gXR96hrUHTLoCpdA3nf9XYoS/2sBAv6aEsl3+f9/82d?=
 =?us-ascii?Q?u4anDjzcWHpULgsgzKWTT8REJmFHSPZOs7S6K8g6/CK5HvkkxSV6mvPc1NP8?=
 =?us-ascii?Q?eRV/c9teh1d5+c1XK2K0cOEoLU+sENThgEk6U73vLjubzo4YdcCF7HmM/PGJ?=
 =?us-ascii?Q?xADdIieOyVW0goEloz8VPrTLlzKkEYJbT/IB30fQsswWkuMS0aoVReUDrYmY?=
 =?us-ascii?Q?sHVxGh8nSrdHdIgHGu4AAagvSI/P47SKLwMzOzuo3woSxAOQer4qQB/aUM2B?=
 =?us-ascii?Q?sn3uHP2wuefAuqm+vi4GoIMrfkNMdMO0XezSGOuvhQh9s1+JXflZUqeGcMCD?=
 =?us-ascii?Q?jBmHLTEnMjR6Z3l9VCQjYaI0wGi74epU1TfJI7p3hMSLMVWNYEL1Wo8f27Hg?=
 =?us-ascii?Q?NpdO2bExt/mJO0armTVDFJkKP67mpYGglrH/77XoDKjPD9N1+2jUwKF2Wc6M?=
 =?us-ascii?Q?N+29+yT8fzTdpRzTsIAHob6ett0KD45c3EoNiri6YmnH7iY58+U5w7NQqkPt?=
 =?us-ascii?Q?kZo+pp2PrPmBBwmvg3tzjT/vLs4PMylM3QmXnumYSc+x8q/EmccTqEBAFMEm?=
 =?us-ascii?Q?ss12zCoqY8LhPTsAMBYwa0N5+1naf+VsOuSazJMTSL882LdHgBVK7UByxrpp?=
 =?us-ascii?Q?MxZEdou3S3jWUydNvCC6TNrnON+aPPr8rg71cu1m14/I+o6fISClrAbYbwyF?=
 =?us-ascii?Q?gt+gq68Vo11HnAnmoJyAmjy65kflXgYwBznGkM7qedkLfANIVPzFl91PPfvE?=
 =?us-ascii?Q?QIFTJJA6TkZXSRMRkqXdY3QhbYdonzat3q0VeTqjO89jtoivZ99hqjlsLV9h?=
 =?us-ascii?Q?WXziHsMiX9iaDQBdI/KyRKdyDXpWrx1oVECvH0K5RqZG4dtBayxFW0fEffZm?=
 =?us-ascii?Q?BK5H12xIQovgM24P8kijje5WM9+/jwjCVne9JD3SSZBFCCcUjg1ZaEm6J5Vp?=
 =?us-ascii?Q?TYlE/kyLP0yAD0UOljxrSFJJdFvuzUVeWCqm9jCjrAjI49M7zo0/SShQ7oRE?=
 =?us-ascii?Q?bWbO8DLBztE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(82310400017)(7416005)(376005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 13:28:05.2110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d59f3a30-5897-4abd-802b-08dc895128fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7760
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

Print identifiers instead of pointers:
* "fence=%p" is replaced by "fence=(context:%llu, seqno:%lld)" to have a
coherent way to print the fence. A possible follow up change would be
to use the same format in traces/../dma-fence.h.
* "entity=%p" is removed because the fence's context is already an
identifier of the job owner.

For drm_sched_job_wait_dep, we also print the hardware exec context of
the fence that's initiating the wait (the scheduled fence ctx is not
relevant here, since it's not traced in other events).

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 40 +++++++++++--------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 1f9c5a884487..6541e161962f 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -37,27 +37,30 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_ARGS(sched_job, entity),
 	    TP_STRUCT__entry(
 			     __field(struct drm_sched_entity *, entity)
-			     __field(struct dma_fence *, fence)
 			     __string(name, sched_job->sched->name)
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
 			     __string(dev, dev_name(sched_job->sched->dev))
+			     __field(uint64_t, fence_context)
+			     __field(uint64_t, fence_seqno)
 			     ),
 
 	    TP_fast_assign(
 			   __entry->entity = entity;
 			   __entry->id = sched_job->id;
-			   __entry->fence = &sched_job->s_fence->finished;
 			   __assign_str(name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->credit_count);
 			   __assign_str(dev);
+			   __entry->fence_context = sched_job->s_fence->finished.context;
+			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
+
 			   ),
-	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __entry->entity, __entry->id,
-		      __entry->fence, __get_str(name),
+	    TP_printk("id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
+		      __entry->id,
+		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -69,9 +72,9 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
 DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
-	    TP_printk("dev=%s, entity=%p id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __get_str(dev), __entry->entity, __entry->id,
-		      __entry->fence, __get_str(name),
+	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
+		      __get_str(dev), __entry->id,
+		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -79,13 +82,16 @@ TRACE_EVENT(drm_sched_process_job,
 	    TP_PROTO(struct drm_sched_fence *fence),
 	    TP_ARGS(fence),
 	    TP_STRUCT__entry(
-		    __field(struct dma_fence *, fence)
+		    __field(uint64_t, fence_context)
+		    __field(uint64_t, fence_seqno)
 		    ),
 
 	    TP_fast_assign(
-		    __entry->fence = &fence->finished;
+		    __entry->fence_context = fence->finished.context;
+		    __entry->fence_seqno = fence->finished.seqno;
 		    ),
-	    TP_printk("fence=%p signaled", __entry->fence)
+	    TP_printk("fence=(context:%llu, seqno:%lld) signaled",
+		      __entry->fence_context, __entry->fence_seqno)
 );
 
 TRACE_EVENT(drm_sched_job_wait_dep,
@@ -93,23 +99,25 @@ TRACE_EVENT(drm_sched_job_wait_dep,
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
 			     __string(name, sched_job->sched->name)
+			     __field(uint64_t, fence_context)
 			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
-			     __field(unsigned, seqno)
+			     __field(uint64_t, seqno)
 			     ),
 
 	    TP_fast_assign(
 			   __assign_str(name);
+			   /* Store the hw exec fence context. */
+			   __entry->fence_context = sched_job->entity->fence_context + 1;
 			   __entry->id = sched_job->id;
 			   __entry->fence = fence;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
-	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
-		      __get_str(name), __entry->id,
-		      __entry->fence, __entry->ctx,
-		      __entry->seqno)
+	    TP_printk("job ring=%s, fence_context=%llu, id=%llu, depends fence=(context:%llu, seqno:%lld)",
+		      __get_str(name), __entry->fence_context, __entry->id,
+		      __entry->ctx, __entry->seqno)
 );
 
 #endif
-- 
2.40.1

