Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CF4ABF9E3
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C1B10EFC3;
	Wed, 21 May 2025 15:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TDdXT1pd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CCB10E06B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 15:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2jBcnDMtKjPqzX3UiVjSX5mFawkTM718LN52NuKj+32XpdQjeBxp3F/jKIttWXduhoytvE5TkxO+v4UZGrC8+klhcxbPemVtnfLLa8SHlG6dt8jjwhfJnuedCHu4M7cuC4ZjDA6Dd2PvBSEZVemwT3wqVzvG/ipE94LuKSLt7sKm4hQPmFBvbulmEBtanhftfEUtLrHlK2kuSfVYOitCfYJqa5+8mllBNFIJCGgh2TK5wZarBXk32Q4NtHAQSEK8kZq3U6f53NmVxBO95szVrxLlgW3sVLGPGulz97jBqoz7Jx834bQhMb8Vh3HVj1f8EKqDzpLoU9V3+OpcjNlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7VuIb1G7UqMbLW/iM7ebBG0Y8fEKiuWshqnMvhc8GI=;
 b=OwuB0TOyM42prjY6f7mfbrkwd6ee9NiIRCHABzN49Lj3n4U7lB5rlkyxzn0bOQ+3/EMRagpYIhpOx7QGzp+YmoYcihElQzVymkII2Heg4QFzxd4niZMZrxwagyaQHKs2UKkHSO2u6HaS/KWAxLyFBLrCm74tplobFt1LDkaEJIM9rTgYg7vm7PAmCQe3gbfGMOVCbp0ZlJuB+sN/Qt8svOIJvlMjrl8SF8uWnRz8ru2rM5HIht5i4iAICBpML8uHUxiDCKVax5OJ1Tb82s6ZYAQaAXqcgTMdcZ/SIU3Ogc5UAEbLf+EAsF6ulmwYmHCSMzFwHfO83qBeFKZM/JKB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7VuIb1G7UqMbLW/iM7ebBG0Y8fEKiuWshqnMvhc8GI=;
 b=TDdXT1pdZrSRD4lPH/GzpEsQVDKA6CfhAeqNo+XvbyaX5eNAg32QCe2t+pECLbc2aUjcDc9Dke1Hzh8BoPo7VE10cEvvJBb17iAKsIgmwa2z3A6QraV/d1+zqO6e/DjQPDmfhgjr9xUXdI5hDTuSe4Muynf8QyBzMdLLKHfEalc=
Received: from DM6PR01CA0010.prod.exchangelabs.com (2603:10b6:5:296::15) by
 CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.33; Wed, 21 May 2025 15:47:02 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::f4) by DM6PR01CA0010.outlook.office365.com
 (2603:10b6:5:296::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 15:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:47:01 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:46:58 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v10 04/10] drm/sched: Cleanup gpu_scheduler trace events
Date: Wed, 21 May 2025 17:45:06 +0200
Message-ID: <20250521154531.10541-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e95d067-0d50-4601-1878-08dd987eba98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?liAp6Ioeu5wfRXJ9l2czGCdndOoH5PYDyFZaO5TTzz7mMvh+hWY12/r48Czp?=
 =?us-ascii?Q?Kcw8ZuZBZELU7UJ2/yd4sOBnAR8v9sSEFxtA4nVOXv9s8EsjAii8Wn29Drl2?=
 =?us-ascii?Q?GilGpZ8HYEk1M6HyeyVkD3vs2yHI0vOfOxQEbLy3gbWaDuUChpngk07Vtu17?=
 =?us-ascii?Q?y/Clii8I7oC6tVmxMAHc622OOa9RSo+wa5XXXZoxGol8JRdG/m+WTx+g/lW4?=
 =?us-ascii?Q?sfbjFrNM/Ae7J5UCUxKo5hDU/3qq/6STQeIf8JKUYzjzluR4MnpQHxtlt/9q?=
 =?us-ascii?Q?z48WDZXitlmTrPxtaDWbdquOjOFKHQqAv8Qp5SXe7VwbyrgUHzdVT1vfOoUg?=
 =?us-ascii?Q?xph/oPYIb2/RxTfrQdAdAv2t31P5SXczTbGNfoaaaujvwMEWONb8hB0Vi1O5?=
 =?us-ascii?Q?rp/gcHGW854CPwrxh7O/v9RtyyOBIJobWOXeD4I/Csiv65MoGUAxg3rlrGqx?=
 =?us-ascii?Q?rTUijxWgrKE3+5DnF0BQI83cU4SM2gu0V6whN3cdOFrO0k/E8BN0an7qVWOz?=
 =?us-ascii?Q?B6SwQZN1HmPA/wHOJVYAt8LEWTV5WDAnzhfuQQNoBP0rc6a/nCobZAucsqDh?=
 =?us-ascii?Q?LP7zjHjlZ64PZCtcnUiAmisu4WH8uvY70R7KIjlEzK5mOIv30g/m6vCo1Ddx?=
 =?us-ascii?Q?iP/Y3+rRSMvRkPuw64wDKo4dVTEYJdWYKyI5dQNolOCMiEQYdIgN7jrxhpjT?=
 =?us-ascii?Q?yjJA4Gph2Ey8wvy3BpFLcRGQoex1vffw00Kgeib5ibHo/z4z2R6u9bg6PRpA?=
 =?us-ascii?Q?zUjCqjiK2DWvC2cArjUhCjPqw8nYu48L0Xrx6VGJ5AoPHqPAPE6VrF7481Hc?=
 =?us-ascii?Q?PQlggTLYB4fbVjY7+IwEQfjbt92exo+4Tt7/MAbYa058j3mR3UQzPhToVShY?=
 =?us-ascii?Q?leoQUTuHC7R8fr+8liB4+rl4VhNqpfRM7zwpGA3Fx96EDscwrIOqg1Udwfrp?=
 =?us-ascii?Q?h/fmlNsLR+0iDHaczA45bc8FjH0DLtfdV/nGPU2f+21HNjOKtjf68e5L5M5r?=
 =?us-ascii?Q?6fLjjD2q+k5ZErqkVl0r+NlKtp/fO3MKI+IF6PAAsUjy9OYwIApYJtzyPjC2?=
 =?us-ascii?Q?nZpXpAWEJKYYQ2ouywosV4UphxC1QEuRvisDs6qef3kcgiPSPcIDljgRBxE3?=
 =?us-ascii?Q?b51U9NKRtB60fyOwQjTKW1RdV9vQrnto5dQ8GddF9K5UXQ/QC0sKYUeIxaJA?=
 =?us-ascii?Q?1Kyc/23+hp2u4l8JYYkL45KG+G8UZKz9CS8K23OhHWHr6mntCClF5dJ1jRVI?=
 =?us-ascii?Q?XmtwGC2fruj5afpePoC5M8QHRbR2dQiqsdy+vW7g3QgAmo52f5WRehlFNGVi?=
 =?us-ascii?Q?PvBIBo6sgJLSLaJ9XxqXloXgoyel0Au6JxjEdQ3TKnKVh9PEU4nPwTqCbWkZ?=
 =?us-ascii?Q?n36SARw41o93VemOfx5WswVG5mGUCYUJ/YH1WHS7cVwy7b+QAcgKlDpOOlh1?=
 =?us-ascii?Q?E1vhy4c1MnCqveEL6/bgsoXOLDqkDp7LTlLGAsxfLDtsdr9+/XMDgnxv8mm5?=
 =?us-ascii?Q?dqB70Qw33TKFpOg6e6wylR4WdjybVU0WMyU8rXP7Sd1cYNX0Hycg9HGIMA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:47:01.9389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e95d067-0d50-4601-1878-08dd987eba98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962
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
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 44 ++++++++++---------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 713df3516a17..6f5bd05131aa 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -36,28 +36,28 @@ DECLARE_EVENT_CLASS(drm_sched_job,
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
+			     __field(u64, fence_context)
+			     __field(u64, fence_seqno)
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
 			   ),
-	    TP_printk("dev=%s, entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __get_str(dev), __entry->entity, __entry->id,
-		      __entry->fence, __get_str(name),
+	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
+		      __get_str(dev), __entry->id,
+		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -75,37 +75,39 @@ TRACE_EVENT(drm_sched_process_job,
 	    TP_PROTO(struct drm_sched_fence *fence),
 	    TP_ARGS(fence),
 	    TP_STRUCT__entry(
-		    __field(struct dma_fence *, fence)
+		    __field(u64, fence_context)
+		    __field(u64, fence_seqno)
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
+			     __field(u64, fence_context)
+			     __field(u64, fence_seqno)
 			     __field(uint64_t, id)
-			     __field(struct dma_fence *, fence)
-			     __field(uint64_t, ctx)
-			     __field(unsigned, seqno)
+			     __field(u64, ctx)
+			     __field(u64, seqno)
 			     ),
 
 	    TP_fast_assign(
-			   __assign_str(name);
+			   __entry->fence_context = sched_job->s_fence->finished.context;
+			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
 			   __entry->id = sched_job->id;
-			   __entry->fence = fence;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
-	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
-		      __get_str(name), __entry->id,
-		      __entry->fence, __entry->ctx,
-		      __entry->seqno)
+	    TP_printk("fence=%llu:%llu, id=%llu depends on unsignalled fence=%llu:%llu",
+		      __entry->fence_context, __entry->fence_seqno, __entry->id,
+		      __entry->ctx, __entry->seqno)
 );
 
 #endif /* _GPU_SCHED_TRACE_H_ */
-- 
2.43.0

