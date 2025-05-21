Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4EAABF9EA
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FA110E921;
	Wed, 21 May 2025 15:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ls4Z4Bex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E729A10E9AC
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 15:47:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0l+n5kRgOcOOr3/Lv7QIHtbi6pyniDTrS4h0SnIAb2u3/D0w7lbGyp5WX5qrZdWHRm5LuqK1w/C5axgBXM5Oc9lJH3vuUqNzprV7/YDL/ijhhj39MgyIcX52FWTxdI1KYCXGc1NLLPz6olIfuFXvm3AFoAuXMlkLypKTK3X1ruG6/KAc7+60MG5ezOQSnXpfxrtwgnl08tSoXCNRYUxGMQrmx9kMtZ/RMQrIjGKH2p556ujI54HfvvQ8HizmFXhAcMjk6+6KPvMyThL6rhMG1u8iY1MduhgLV0DmGRfiQy1bRljUbClsvLNAiutvTlspNvwOW3NA24HPnWzAo8seQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uhU5XaefJHn0gza9zHXOLLuQv4JeQSuuMqMgnbKoCw=;
 b=vCLPAlh7pb4FFbN+qFTIwVP01IGWTbuCSYl2HGRXQos3eEYSFFpO/II4/TVs1/93zOgckub31SMhXodqut5NZ9Nxq2U05YVH6TiJU0gshJx6Ae43MD62wXQF3474tSdzR00Dyeu/MFtqmbfQwmSunaulliKx+d+SBhazNEKcnVtSzq6qf3ARNjXhx1P4mFsuRhgitmw9XEC/UOfk9tGOvtHMO+UnBZhRRu7nRybBjq8zsIHfHBdou1sS/sFhS1g7fP/nZxGd7MfH0AnZZWSkbZZ+5NK5GikeG0w8yB0AsThKm8+ICqbB0atBwCOXMSByDKhPBJCOB7hzcX3uac1PxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uhU5XaefJHn0gza9zHXOLLuQv4JeQSuuMqMgnbKoCw=;
 b=Ls4Z4BexNIQNIuhTDOdPrKErIqaDwN9/XLzdOiOiOHZCbuLosJCME1xLxOuxRtgtlpQUgW2BrkMGV/o6eQf37QI0QhOEvX7Rpwg7Z/h1Hl5g9XJkaZGrZXmfLixY9USAWefA0ff3PZTyC95Efhn926zsHPrW98czyqp3haO/E4k=
Received: from DS7PR05CA0073.namprd05.prod.outlook.com (2603:10b6:8:57::27) by
 IA1PR12MB9032.namprd12.prod.outlook.com (2603:10b6:208:3f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 15:47:32 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::71) by DS7PR05CA0073.outlook.office365.com
 (2603:10b6:8:57::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 15:47:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:47:31 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:47:28 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 07/10] drm/sched: Cleanup event names
Date: Wed, 21 May 2025 17:45:09 +0200
Message-ID: <20250521154531.10541-8-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|IA1PR12MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d98a0aa-0f5d-4e19-9d98-08dd987ecc45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+y2E3FmGyX+ZkMLkm8lW3+WuSpK1wuMfGGOyeMvKaqPpljWwdiJkGaJeSOpB?=
 =?us-ascii?Q?nzuMuAekLH1csobdhi6Qg4o0dw6qikWDdl05TKwn3tuIeYUITREVVg40IO+9?=
 =?us-ascii?Q?iPS0tTnD73rTp+vBLvFYv3nTztpkLF3BQYTnmNM2Izb7Rx4dqQwirpgj3mUM?=
 =?us-ascii?Q?NCjtoLywll/9AXb3ckkGZioRXmvHougCjLsOebzVUocuWfW+Wy1Fv1APlpgY?=
 =?us-ascii?Q?DNQSjDcuJbkocSOX83baJaVYl9GAvqfDrsb03ezHhJsMfAL2jkmTnSIlV75X?=
 =?us-ascii?Q?seXNtpanp+6bpMP4BfdHcQmpIDhujit+kSK8+oJqVXRwYh6AsLRCIbx3X7bo?=
 =?us-ascii?Q?sHXWaaOz/ecyqbfHYhFvb1xg1QACkxf0Yve1RMa7/9EnGjdxU3w2F9IS0eVo?=
 =?us-ascii?Q?t/BTAhVB4cI4/GTnKK43z+nQtyDXnDwbQz4ulhGRXAOSoryQBGIf+zCxceaD?=
 =?us-ascii?Q?fMT3sA/Xr5EoD/pxeBeIzI4FSAgcLy2FuK64Kc2ktXf/rWAs0U4+kVfmCctm?=
 =?us-ascii?Q?xHQNDdgel87+otuNKQKEIXchOzWjCY4DMfTIT04uU1XBJgSim92pwRplmto5?=
 =?us-ascii?Q?hFAF4Xw8T25cxNCnycfLA8wXtOp8gOPwzLGCosrudCC38mVKXy6MfNdvW6Nw?=
 =?us-ascii?Q?wXicJhvwbjx1BR1MozKfGbJ3OVh3GCEZPqz3NMA7plihBkFiA1J5bbS2hjwa?=
 =?us-ascii?Q?3QEx9XznzpJToKoWpzE77SUzvtrS5j5UlRdVxdvXBR8kOY7iDjde71mVuhV8?=
 =?us-ascii?Q?EFNQRYUSrxq/CKTq1/vYhMXFp+tjIRWKK48XXJUPajBfPEbbTBBCaprf07Zo?=
 =?us-ascii?Q?Nnuoj3KEMToKzjly9XSbcUCJGm7wHqCMConRg838FV8B4OrTxzJMLoQbcREp?=
 =?us-ascii?Q?n1glm9p2v3nITtpoyE9O8/pTlBFRgorJKs8rp3aIAnwxMLAhbQVoZUsUa4QH?=
 =?us-ascii?Q?CVIcHZjvqZ53rrvmZR1lBa0ZZiFqoRGma4SiA7Z4+c42Oan5NYNvcI1SW7ns?=
 =?us-ascii?Q?oiufvLiFplX85FeCSEB7Qx/gACt/7bxUzx5gUS8wq27TM6SPwfiYlspqF26D?=
 =?us-ascii?Q?iXzziVj27K463MrmBgmYdELpBnFHX7MEmc68GQVpqHzT/u5kv5oV81HDhqLd?=
 =?us-ascii?Q?4ctT4NGtScxjtgQrUeb/j7/DbAtaydWb8mhBty7/jdtVHHSvgTDeHNaQguHO?=
 =?us-ascii?Q?MTRL8Yg+7jG3KJPdYOti5o3fUElGoAwrTZ8H5Tz10cooLbxHZjUtOhoFnvgc?=
 =?us-ascii?Q?syxtdyCwapSBfKnIXWELO9tFQBjhgy2fFLJdLNwmnE0KUGr/QNYvTpv22K8u?=
 =?us-ascii?Q?3kXLBFP9YBsUvZ6z6JrHagCUSrCbyT7Rid2pz/i8/J0Crr5/KRhrY/2TI2e9?=
 =?us-ascii?Q?/zxkBuIoZMikVSKG2EpdVeROom1w6jRxEWt7YoH/bZ+8G5FB2z8e8QDgLlR8?=
 =?us-ascii?Q?f/JeVf4Zpo9Pi1rHCGnS1FIRN/AchUAvMAWvU2JX/MHNBv6gnXDyDcBjFgQE?=
 =?us-ascii?Q?n3jnFj2McNHY+Q+ORRnl61XMeX82rUWsxvjZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:47:31.6092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d98a0aa-0f5d-4e19-9d98-08dd987ecc45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9032
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

All events now start with the same prefix (drm_sched_job_).

drm_sched_job_wait_dep was misleading because it wasn't waiting
at all. It's now replaced by trace_drm_sched_job_unschedulable,
which is only traced if the job cannot be scheduled.
For moot dependencies, nothing is traced.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 8 ++++----
 drivers/gpu/drm/scheduler/sched_entity.c        | 8 ++++----
 drivers/gpu/drm/scheduler/sched_main.c          | 4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 38cdd659a286..4ce53e493fef 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -63,17 +63,17 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 		      __entry->job_count, __entry->hw_job_count, __entry->client_id)
 );
 
-DEFINE_EVENT(drm_sched_job, drm_sched_job,
+DEFINE_EVENT(drm_sched_job, drm_sched_job_queue,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity)
 );
 
-DEFINE_EVENT(drm_sched_job, drm_run_job,
+DEFINE_EVENT(drm_sched_job, drm_sched_job_run,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity)
 );
 
-TRACE_EVENT(drm_sched_process_job,
+TRACE_EVENT(drm_sched_job_done,
 	    TP_PROTO(struct drm_sched_fence *fence),
 	    TP_ARGS(fence),
 	    TP_STRUCT__entry(
@@ -112,7 +112,7 @@ TRACE_EVENT(drm_sched_job_add_dep,
 		  __entry->ctx, __entry->seqno)
 );
 
-TRACE_EVENT(drm_sched_job_wait_dep,
+TRACE_EVENT(drm_sched_job_unschedulable,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index be579e132711..59162cb81c4e 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -477,10 +477,10 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
 	while ((entity->dependency =
 			drm_sched_job_dependency(sched_job, entity))) {
-		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
-
-		if (drm_sched_entity_add_dependency_cb(entity))
+		if (drm_sched_entity_add_dependency_cb(entity)) {
+			trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
 			return NULL;
+		}
 	}
 
 	/* skip jobs from entity that marked guilty */
@@ -586,7 +586,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	bool first;
 	ktime_t submit_ts;
 
-	trace_drm_sched_job(sched_job, entity);
+	trace_drm_sched_job_queue(sched_job, entity);
 
 	if (trace_drm_sched_job_add_dep_enabled()) {
 		struct dma_fence *entry;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9cd3b591f3c2..abe8eae752e5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -401,7 +401,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	atomic_sub(s_job->credits, &sched->credit_count);
 	atomic_dec(sched->score);
 
-	trace_drm_sched_process_job(s_fence);
+	trace_drm_sched_job_done(s_fence);
 
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
@@ -1232,7 +1232,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	atomic_add(sched_job->credits, &sched->credit_count);
 	drm_sched_job_begin(sched_job);
 
-	trace_drm_run_job(sched_job, entity);
+	trace_drm_sched_job_run(sched_job, entity);
 	/*
 	 * The run_job() callback must by definition return a fence whose
 	 * refcount has been incremented for the scheduler already.
-- 
2.43.0

