Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CED2A9A67E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E69010E782;
	Thu, 24 Apr 2025 08:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gCjR7biu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E2510E77F;
 Thu, 24 Apr 2025 08:42:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0Qc+GplZCS4wXV3eupQUWzRFPUNAoojF2f2yh5CQau+rlXaIPyQpkm51NJXbJX5ofL/iD0FtD9a3x/QQdYzYmdphvMTDzjMLStcrYNueu8Tw9NTwQ5BPoxRuFLsdcKvnONswdvtNIhd8yTXGeCoGu1Ixxuz4v4b4MneQkbOt0DGbN3NMzyD0NUmxGMAr0D9U2frprZoa8SV78J0/zDMEBEJ6dyYVwKMGz3DOGM6wJzwRdcn6uayH3JVUiHSu6y9ksKYwwdHV+DjsF6HRu0uPlM3CH7f2cCE/SP8jq3jousy+jqwmwj+AjK2vyTR1k1IrwaG6VAY1Twp8Mwkpbzn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fPc2/ABzuvmpl1PrOYYeBLOHtIlaigv2e11q3tTcbg=;
 b=XfvA1XotylL9qlhX3/+yzeyI4C9nz8ZoLjhWhbtL9cw2RPhP+ded/lbHEjInthjWVwZh+ko35R9yJtoMqo+ApdgGCKKvmY+vJC/DtYoz237X6kj0lK9uv8tVyYg/StBYUacStHWY04qD4j287tCI1uBXWyF5Ba8K2J/jh3bNW1GUph1ZN7fYwsBr7bqi3ZBJ2fI4Y0HNsJE+/vvrLcJf2jA0EFCX+HljS7jbN8BuYsQi1+5X1dYKLAQt/o2DQEoXjsnpKbiiqIeOsLNdowTpNejmkCgAqy5k5GDp6uxUB+sUVMkhjmk43qYHqp3KQrChJFWg43gzeC99iq6DJB+FRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fPc2/ABzuvmpl1PrOYYeBLOHtIlaigv2e11q3tTcbg=;
 b=gCjR7biu3yJOdYy+8xdQjJ2FTHfpbNct1eaNYGq0L8xbXlSwrxSy78OKw2pk+Zi/fpWpYMmQ0A4rtU1Ldj+E54xFQouvQ7/FPI7FYmYjM/MN4IPxxc473IMZeL1TlJYmkvDr5BCvLNQKZlLTjqi2bVPP6PtDSu2eZcitDW+Sm+E=
Received: from BN0PR04CA0181.namprd04.prod.outlook.com (2603:10b6:408:e9::6)
 by BN7PPFD6BF22047.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 08:42:19 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::f9) by BN0PR04CA0181.outlook.office365.com
 (2603:10b6:408:e9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 08:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Thu, 24 Apr 2025 08:42:19 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 03:42:14 -0500
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
Subject: [PATCH v9 08/10] drm: get rid of drm_sched_job::id
Date: Thu, 24 Apr 2025 10:38:20 +0200
Message-ID: <20250424083834.15518-9-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|BN7PPFD6BF22047:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e833e88-4cfa-47ce-9d6f-08dd830bec8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V21QM2d3bFBZclltTnNpYjAvUEE3UlRoTlpLcGVoM1Q4VXd2bmFCS294b0lm?=
 =?utf-8?B?b3cvMW1aR3lWWHBuQ3h5K05kcXVVdDVTZXB6UnBuNmdFNjZleFplZFo5bGt3?=
 =?utf-8?B?Y0tNRlVaOUlqSElvUnNlbDRsaXkyK3Jaak11QW5IVUwxYTE2eWQxY2JoME54?=
 =?utf-8?B?WEZTYzBpZ3dWL2I1T2Y0S3FRbS9HZ3cvN1U0bXI1YWNVYkF2YkJKWVdETDRD?=
 =?utf-8?B?WUlpWXVWSEZMcmFQangxS1BldUdwaDVrN1B3SE1uQnhyWDRHanJ4WWs3OExl?=
 =?utf-8?B?b0wvSTYzOG5obDV6NjZISGcvRzBFdzY2bmRTRzE5OHpSMERVUEdjY2V0WWxV?=
 =?utf-8?B?NDIyTVZ0eG1sLzIybDFtMFlqVnRvS2lCeUsrWEx5Zk5vV0pNL2s0Mi9tV2E5?=
 =?utf-8?B?MU9rYzVSY00rcEt2WUQ1N1FmT2QrQVQweWxPZnc5SW9mbDFoRGsyTm5rSzYy?=
 =?utf-8?B?K2JVQjFvWjBBdjVPWWdGTG9RTnJwMjU0UTFZSnlweWxPY3U1UFBDTUdhVFlj?=
 =?utf-8?B?a20vdlovenBhZExEMm9uNlRsVTlnWEtEcUpTeWV4Q2R6c3VQM1VuMm5PN1Fu?=
 =?utf-8?B?SkRIdTVibUVuVlRuSmIxbUtmVGFOVDNmMnVOWCtVZ0VmV2J5MlZvVmMzbGY2?=
 =?utf-8?B?eTh2cWszYm9qMEkrYTRwS1ZoZ3VXU3daczVZUG9xWHdjc1JKWFRYdUJRcGZM?=
 =?utf-8?B?aTVVZ0hjMmRrditRYlV4MmdDNHJlS2d5d2ZFazJ5TDl0STcrb1VYZXcwb29l?=
 =?utf-8?B?cGd0WlB5ZmhEV3dPVytLbUNvRTBkcE9PMHVZSXQwZW9rL09JRlpZQnp4NVkr?=
 =?utf-8?B?UzJMYmV4UkdwZWxuUjRQeFNpb1gwNXQ5Rm1RQ0NYYlBBMnZWZkRhcXBROVB5?=
 =?utf-8?B?c1ZPUFVLOUNQckFvd2FFQ3RxV05XNmF3SSt5UHZ2UHRhRkt4b3hPMU5RdUhv?=
 =?utf-8?B?TlZZMHc4d1NoeVErVDlmVmhLVXp2bVdTdXIvaFdaTGJyWnFJc2VQV1FGci92?=
 =?utf-8?B?eGlFRnQvYUdXVVp2S3dLa3RleVgvM2tkaHNNSEt5c3FoZTdVMXF0bU1UQzZ1?=
 =?utf-8?B?Z3FDTUVaMjJxNkNleFFwYUhLQXBXYTdhdnpDMzFGTTM4cGczSXdQbEtpeDJ1?=
 =?utf-8?B?cWhxNE8yT2dqclNUVnkyQkt4akRVMzdsLzRJd3Uzb1luemNKeTdQQ0dBVFJV?=
 =?utf-8?B?bS9Dd0tDM25VbkNCeVFPSllPZ2ZWaE5hNlpmQUlEanRxamorQ3IybEJOUG9w?=
 =?utf-8?B?TklqNldXWTB0WFZkVlRYaWVzSGlndCt0YitEcFVSclNYOGxaMjJxRG5pV25V?=
 =?utf-8?B?aFNkT1JlOEFtaTFZQy9yVnVwSmo0b1ZpMkRSeUY1T3puWThVc1ppUmhXWGw1?=
 =?utf-8?B?Mkl1d1VLTWM2cGVQSUdjLzRhOGF2bndzNUc3YmpZZzBJNVdaTTFLZ3RRa3hi?=
 =?utf-8?B?QkdaWEhHeEJqZlR5S1Z5Q1RqZGt6TG01cUpzSEhKRlZYd0MxL3V1RFF5cjJJ?=
 =?utf-8?B?L04wUlBQSVBpczhSNE5jWHRDcjhnK2ZqVFF6a2RTSWdVYXYzZnhqa3EvWjFq?=
 =?utf-8?B?T2hLV0ZtN1lHZ3NsdXI1SWlORmVsOUF4eW1GWkNHZWpnMkFLMzhCS04xR2xJ?=
 =?utf-8?B?Uno3alFKZjkwb1Y0dVVtNUhheG8vcFpzWFlZYS9HM0tTOTlkQWh1RnIvOEdY?=
 =?utf-8?B?aW9QSk9ZeTJraHZVNmVxeFBoSzRmMWlhSFhTMEZPUU5tMmJEbVVFQ3dwNjh6?=
 =?utf-8?B?cjZrM1pkWWQ3UE5kK3FIMmRvbU8vNHZ2YWduSUlBcFlpV093R3ZmaU5vRnRn?=
 =?utf-8?B?eE9pR1c1MEZRTVRyUHpxSW5hOWRNRk9pUVk1cjArZWhKM2JVMXJRUUY0OFZZ?=
 =?utf-8?B?Z3phVkF3cE1UR2xMMTV5dzl4SHJsZldhWmVpeEVLN0xXMElsOGNkdTZ2cW95?=
 =?utf-8?B?VEpFQnUyWWdkR1VlMzcvTUtlalV6Mi9IdmlnbDBQNml3SmpEa2FuaWFudnBG?=
 =?utf-8?B?TUJGZ09tdVR1dkIwRmhaazdUMTFRVkQrSlpXaWlGZC9HVHNTK1czQlpaZURa?=
 =?utf-8?B?Yjd1dVVRREg5VjVlcnlvRnJaZWVoZk85TWdUdz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:42:19.2696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e833e88-4cfa-47ce-9d6f-08dd830bec8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD6BF22047
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
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h      | 18 ++++++------------
 .../gpu/drm/scheduler/gpu_scheduler_trace.h    | 18 ++++++------------
 drivers/gpu/drm/scheduler/sched_main.c         |  1 -
 include/drm/gpu_scheduler.h                    |  3 ---
 4 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 11dd2e0f7979..4fd810cb5387 100644
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
 
@@ -551,7 +547,6 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
 			     __string(ring, sched_job->base.sched->name)
-			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
 			     __field(unsigned, seqno)
@@ -559,13 +554,12 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 
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
index 4ce53e493fef..781b20349389 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -36,7 +36,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
 	    TP_STRUCT__entry(
-			     __field(uint64_t, id)
 			     __string(name, sched_job->sched->name)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
@@ -47,7 +46,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     ),
 
 	    TP_fast_assign(
-			   __entry->id = sched_job->id;
 			   __assign_str(name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
@@ -57,8 +55,8 @@ DECLARE_EVENT_CLASS(drm_sched_job,
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
@@ -95,7 +93,6 @@ TRACE_EVENT(drm_sched_job_add_dep,
 	TP_STRUCT__entry(
 		    __field(u64, fence_context)
 		    __field(u64, fence_seqno)
-		    __field(u64, id)
 		    __field(u64, ctx)
 		    __field(u64, seqno)
 		    ),
@@ -103,12 +100,11 @@ TRACE_EVENT(drm_sched_job_add_dep,
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
 
@@ -118,7 +114,6 @@ TRACE_EVENT(drm_sched_job_unschedulable,
 	    TP_STRUCT__entry(
 			     __field(u64, fence_context)
 			     __field(u64, fence_seqno)
-			     __field(uint64_t, id)
 			     __field(u64, ctx)
 			     __field(u64, seqno)
 			     ),
@@ -126,12 +121,11 @@ TRACE_EVENT(drm_sched_job_unschedulable,
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
index 195b5f891068..dafda1803c7c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -852,7 +852,6 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 
 	job->sched = sched;
 	job->s_priority = entity->priority;
-	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 6fe3b4c0cffb..48190fdf661a 100644
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

