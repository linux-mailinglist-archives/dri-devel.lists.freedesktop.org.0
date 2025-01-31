Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E530A23CAC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 12:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0194B10EA6F;
	Fri, 31 Jan 2025 11:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E0Wc7862";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BF210EA6F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 11:05:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLFiFwacajTPcsu/XfSKla/TTaTc6S1HxAJvZ1yqy8XLI7gnpoDBpVtk6CEbnpJSE/Dn1tEvRPDJP5AD7lHytlK7t1WyucmvzhLECG78Sg5Id0dZa7LSIsvN+BxnOoSZhfN8bufrivpgWNurF/6xOsL8YGhVgHTMxj0kXlYlzXl+dg23LG56NJzUbQ06JZMVC8QV2llNGSCneMfqXymYBoyfnTQA/+pv+Xg8Q3AquKeSo8WNUmyrtrbEBp08PHOhJbMe2SxwZEhDCj2VocWDmJS6N9QozMf/Cg8Mhf3kIaoCVXbUgU5ISLZT21q4bAFRKif/GCc8nV7hmXCCbZa/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbVB3K4iAlptVsFtd9e4Bea1YECynVrEXatr2kSge7s=;
 b=eh+/OdSMISxD5cGOU9gCiP5FLnayKL1Cnv78fbkx5TpbU8LYcy5r+zUhdl7HQwhq+uIcbr+mkj873Bm9DalU6I9unS7m6dpSyFf6NkD0TdisuImZPp3vst85zyKNeGacWTMWwRDywIMALRpGd8XnVG+uSjrNrV+GU6RiZkOw+4S69zkJ+fIPNs0KYCocyIT6o6I56XAu5JS86pxGMJ9KNTPHIPq1d63mKMAVUJrqtOBgWL+RVxxrLSyVGpVkj7j6zMDj8kOTxcT8+YDD33/FvgCMqmZFLVJ50dSqKbnLiXpvnVLU340ff648fkd2YS0TIIu3yX7tWr8smb0mthR8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbVB3K4iAlptVsFtd9e4Bea1YECynVrEXatr2kSge7s=;
 b=E0Wc7862NKWT9zYx7i6xZ1CsNIwG0i1hy0lSffn2Aa39OyHLg9s8s3SKFxbleD8jcoaFn/LYX99wO/CXv/IItQeAJQr1WAQ8V4x3oIRUanKjeUaX4YnUUCQR3ZZKwHpDMko51ngFwSEY3KgNpPTyvae5h9+pR5cAqlrW+Qxxdwg=
Received: from MW3PR06CA0004.namprd06.prod.outlook.com (2603:10b6:303:2a::9)
 by DS0PR12MB8197.namprd12.prod.outlook.com (2603:10b6:8:f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Fri, 31 Jan
 2025 11:05:19 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::3c) by MW3PR06CA0004.outlook.office365.com
 (2603:10b6:303:2a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Fri,
 31 Jan 2025 11:05:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 11:05:19 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 05:05:13 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <pstanner@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v7 4/7] drm/sched: cleanup gpu_scheduler trace events
Date: Fri, 31 Jan 2025 12:03:02 +0100
Message-ID: <20250131110328.706695-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|DS0PR12MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: aecc2e34-f71e-44ab-1b46-08dd41e72646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?79KnJqRGl/5ozeWagdjPzNsZISFXi2iPf9De0ikRwwlP4WS5yMHVW+8HPdYD?=
 =?us-ascii?Q?97lzDU7/LzNhknAsjHQlgBWxRJF1iiOA+NgTNGh6W8BglHhnnNjCZSGSEIfo?=
 =?us-ascii?Q?zfmPMuyngKM5wzWIDGwEzs2v4WiNoTqgcuLstgRq5bjl+vJiv/271Xzp6Hnr?=
 =?us-ascii?Q?CIEgKbkU4Lc+dlY5OVcIeXMoO4KrmqK3vnVcnwTEAHyuHDYUAliaynK94nrz?=
 =?us-ascii?Q?tOLtxvzVtTr+Vwhf6KwLbir/tBAIXts80o6cMtBWjI+3MojmUwSapLgdtLTN?=
 =?us-ascii?Q?2RNV2C8MrJUEGKbvFLSEonABd/vK2w+mEAVTW3bBKrOFcr82ghfSH/+MUH7w?=
 =?us-ascii?Q?i+yDxwa4pbl4GJ4c3PqFdTPKXKdKrGqw4l3VAcFKuM7iRmOqebC4z4E5cYwi?=
 =?us-ascii?Q?bOtGMPGVWuCW9kzbe+VCUZSUXh5WEGe5V3Lt9bij7w1InFP/SEii/CYwYi/j?=
 =?us-ascii?Q?cFyXreUBuAIiO4xsvjVOPjHbMk7SMbSOVl1rHvJ5YT6jp9W9T8HttSAl0K9k?=
 =?us-ascii?Q?lr/Y8758Fw1EE5gfG6B+koBYIN8rnXAHQar3rCcDoOp/4NZSbbVkynn+5RU8?=
 =?us-ascii?Q?BkwIvsHJxl99Gtz1k69xZIpKg/i3Em9X8H40oZZ5gE0A4iiKrcSNdsfVKAIE?=
 =?us-ascii?Q?1jHJff00CYP8oNor+qwfv1dq195OTdu46FnhDHartRMBQ+2iIsvTh2a9FzJM?=
 =?us-ascii?Q?tLlM5ojEwaiak073IBPxcE4YEx8JNhZV1AzIQuXPug2fB6x24MGw6ODxfglF?=
 =?us-ascii?Q?6CaPUmUzgxUShpE4J6LywmBFKQfSsI/S95TfqC2fUrETIpc/zxquIkb2INni?=
 =?us-ascii?Q?IBMVerfsn23XzvWeC3UNUrh0eZQQ7vElouF50hHv+Es4nGQ55KrbLOvLAWA7?=
 =?us-ascii?Q?1sVlnqGhPrInEW1Ve8r0azzy2KpEfHFwRR+p8/5LAALEKGxQ0dxD5HRRs+R5?=
 =?us-ascii?Q?ShBT+cMNb/kKLYR6vx0ehG5coL0A5WgDOCs+NKZKY1EpS/Dfy+1Nk/cUTpcb?=
 =?us-ascii?Q?jPtPSTdB6z300bwe7b+r3pn8+pAnWUdyvOEb+3YLJoNOBwfiFHzkiZ897F6j?=
 =?us-ascii?Q?OxDjGEWZV0PN/lIW+OLTILZ4VwTCvIlHUJQjAbnuaaEvCWp4RiOGEp2IshtX?=
 =?us-ascii?Q?Zpd0c2mIDquAWfI9mc3sOaw5WnwrNhPqP7MVJkOv7uNuJ+OxCDbWfJdyWv8s?=
 =?us-ascii?Q?3OCbJflYNapStkENns3R0OovT3inOD5UYab8FgrAXF2mIKy6Yqx93dHRvGt/?=
 =?us-ascii?Q?ebQNM0De1LMFOJusdN9U2LWGYg1fe3a38+Nhon3vQ4B60/H3caTGhZsNR7M7?=
 =?us-ascii?Q?OEVXRvuzKcC2HeZI+KQAvYDc2ns7zriPASLzGpAE7EI1QlNs77EKi+yS2YIl?=
 =?us-ascii?Q?nh63ErKZqryBe655NJUqhgchgTFFcexTR+A9YaAogpckz+wPtkmyx3F3ADKh?=
 =?us-ascii?Q?/A1MXKSsU5hLni25vNRGj8FUi4W2eymMm40PlS0zR6xz6BcKrpWhPSahmDzo?=
 =?us-ascii?Q?l0fetF8n5catpnsWwQeCgcKoSmWisQ1oaJ83?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 11:05:19.0295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aecc2e34-f71e-44ab-1b46-08dd41e72646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8197
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

A fence uniquely identify a job, so this commits updates the places
where a kernel pointer was used as an identifier by:

   "fence=%llu:%llu"

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 41 +++++++++++--------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index c4ec28540656..3cdd8d8f8021 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -36,28 +36,29 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
 	    TP_STRUCT__entry(
-			     __field(struct drm_sched_entity *, entity)
-			     __field(struct dma_fence *, fence)
-			     __string(name, sched_job->sched->name)
 			     __field(uint64_t, id)
+			     __string(name, sched_job->sched->name)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
 			     __string(dev, dev_name(sched_job->sched->dev))
+			     __field(uint64_t, fence_context)
+			     __field(uint64_t, fence_seqno)
 			     ),
 
 	    TP_fast_assign(
-			   __entry->entity = entity;
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
-	    TP_printk("dev=%s, entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __get_str(dev), __entry->entity, __entry->id,
-		      __entry->fence, __get_str(name),
+	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
+		      __get_str(dev), __entry->id,
+		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -75,37 +76,41 @@ TRACE_EVENT(drm_sched_process_job,
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
+	    TP_printk("fence=%llu:%llu signaled",
+		      __entry->fence_context, __entry->fence_seqno)
 );
 
 TRACE_EVENT(drm_sched_job_wait_dep,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
-			     __string(name, sched_job->sched->name)
+			     __field(uint64_t, fence_context)
+			     __field(uint64_t, fence_seqno)
 			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
-			     __field(unsigned, seqno)
+			     __field(uint64_t, seqno)
 			     ),
 
 	    TP_fast_assign(
-			   __assign_str(name);
+			   __entry->fence_context = sched_job->s_fence->finished.context;
+			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
 			   __entry->id = sched_job->id;
 			   __entry->fence = fence;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
-	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
-		      __get_str(name), __entry->id,
-		      __entry->fence, __entry->ctx,
-		      __entry->seqno)
+	    TP_printk("fence=%llu:%llu, id=%llu, dependencies:{fence=%llu:%llu}",
+		      __entry->fence_context, __entry->fence_seqno, __entry->id,
+		      __entry->ctx, __entry->seqno)
 );
 
 #endif
-- 
2.47.1

