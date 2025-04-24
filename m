Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43187A9A674
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870B210E77A;
	Thu, 24 Apr 2025 08:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2fSBAKod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BB710E77A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:41:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lstm5D8C0cVWjeFREzVmOvPLUFdrKyAWcHVLPbZHA3pjEJWV4YqbyBTXOBvW3wuVUW8gvAWIUzAaQkNlXQnmXL6K17xC5fJmIoKfnNFMS1pWRPC4SVBxxQ0V/DNVj5uNWgNpT5TNgAP293Ltx/P4sqwxjPkAL1iWVWUgRn26cSVX3P2Pow7uTymBzgTR9H35f/thyrWghMmuY4aEZiHu/tsTHxDRXPXcqxeotT1NnGatstXGc7r1E+MRAIxoGgzvM/Em+ygBGNnKor5k5HDx89+3lNpd83HGoFB1Y7Xw4V2kewifAlft3xqcLQCtpETP1dqweX+0zu7fbRZoodX2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHYMYNGFF9uKuQ3khXkbLAwz3Hd5pM8+94Ze52BPEZA=;
 b=oaEc7UObmzKg9Po3lJkM0Pf9lv690SRdZAavmplvb/YXlN1/fH174NZqtZyv/7ZcKb3U54Zrahj34Rw9ApFcRdZLGWm3wo+U1zIA/j9TuC6VhmFq63O5emYGD2XIazRZBj1QI77zvH1Dc4V+H8LNIvRi86VTRiSH761dBbZNCjnUp7FpswLYNbPLku5lzDIjAfwfUXPk8jw7eIC6FGxNfc81rfA+Rj2Ozn5uOdpURgQMJ1ZOlWle3IB3WJnC4/FRi1zLbaNJv4mqnBPPzgK5+jWqTX7ojaDRVoyQMHHzYvu52etebwUvc+UOqO+ZJeLwFlzzSWyU5eu2RMsTJ5+bag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHYMYNGFF9uKuQ3khXkbLAwz3Hd5pM8+94Ze52BPEZA=;
 b=2fSBAKodVOIo4P2Hid+9wjuIeEsGyGzeEGHpLpM0r+HmDYKb6u7WGHkVV4DVpUaUqiy+nnrtYoOO73mEi89eiFjef7H14RuwRevTlcb5K0tqo6ODocj6XUiwyBIJU7SpxOxIS7g9De4/zfNNnM0FhdrSm615G+la4v2QR27SwGQ=
Received: from DS7PR03CA0356.namprd03.prod.outlook.com (2603:10b6:8:55::22) by
 MN0PR12MB5860.namprd12.prod.outlook.com (2603:10b6:208:37b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.23; Thu, 24 Apr 2025 08:41:37 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:55:cafe::2d) by DS7PR03CA0356.outlook.office365.com
 (2603:10b6:8:55::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 08:41:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Thu, 24 Apr 2025 08:41:36 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 03:41:31 -0500
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
Subject: [PATCH v9 05/10] drm/sched: trace dependencies for gpu jobs
Date: Thu, 24 Apr 2025 10:38:17 +0200
Message-ID: <20250424083834.15518-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|MN0PR12MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: e884d1cd-56ca-44ce-9f6c-08dd830bd34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+8WkuDxFNQW4AwaSxS1d8uZ36HVcIil11OyjOFDNFY/O3PxzWkPe7qarZT+s?=
 =?us-ascii?Q?ae0ovoMXbA+9j3cURR18T2ssDk1BezJgkt9sP5n3QImp1fhe1Cn6+0Q+uV8v?=
 =?us-ascii?Q?e8uPBU5PQ8cbAnpYKPiWCuaKTcSGrSf2vmnpLtGw0yoSpn+NpS0p5cILpwIg?=
 =?us-ascii?Q?D8Xaj6yXvalWvMYWxpOSBm053QOmSyp1ni5+FhjLUiYXl4xjS/Oyv4OROPJB?=
 =?us-ascii?Q?haF/EOPQDksTI0QAoMwonw4hP/y/CyMbCeh7EwDDk4opDwOBXi0mIno7bmu1?=
 =?us-ascii?Q?dx88idMSgqqsrf+jMm2ylIyAZ5mkrRjJk90BKayd2tzT7NfXcguThPcq4a50?=
 =?us-ascii?Q?ECkQa6cOS3HBERsxg3u3Qkhhu30UVfKDQ3+pjy0YSxNJZ46GAioNwBTCxwQN?=
 =?us-ascii?Q?oeBbH5zWoQ88XO8dBNfD4hLgNKhFphwSjPOqjF2MASPvkJw/vp/ANgtjRVDR?=
 =?us-ascii?Q?GvPeXpDE9IB0pVg2VJThNdh+GwVYlIHE1GgcU56MH2Fb39wcVLf8oWVkPTJs?=
 =?us-ascii?Q?hgt5+whCbPdtsS6dg/fmlCShwB1QrK7tRo5QyNLeA6PLmuU1QV1FqcquGCfv?=
 =?us-ascii?Q?5HT1iI9rBIhvy0vw04D/1/u+27rLt5GS+0suYs037GebUk5foVJuHyPZvAPE?=
 =?us-ascii?Q?+1ymCC9bdkvCfdPT1gPRR5S+oEvERHWtecAWVnZG2sORj55GFDKEbnW72hMn?=
 =?us-ascii?Q?NhrZ8Lu5makDNbrt8/+iUnjGLxJ3e/kC9mExdpk5+EZa6KOioGHG9EtGIDBz?=
 =?us-ascii?Q?3gd2hRT0a1Ha6ae8Is/kALtSlwKdVqLGQ6CxMPKL6+VKptWBh3njjWoW0aM0?=
 =?us-ascii?Q?4nSZYWy2307+zW+OFLPP/H6ACcWKB8hwUeBqR6/RaraAp+OMqq9yTjif91O+?=
 =?us-ascii?Q?SA5rlH9SNtDteklwsnlGHAb4zWvbuv+m2K2rgWIbX4vHoRdw7PyAtJVBzHup?=
 =?us-ascii?Q?77s/AKy+9jq8XRSSzXM5mxM5cxBVtvdCvp547ALOqweC22+vU5Vx5bmMy8qU?=
 =?us-ascii?Q?RuHf754oAnhwUtLU65YKr6ahUcStVGzFK6EhlprJASrI6PGHPmjBQ2Aehaoe?=
 =?us-ascii?Q?5SHmg31b7oZrRohhx94CFFDqwKW7gDc5bremQrjRGWPoYfqmnUmgppcx2q0v?=
 =?us-ascii?Q?YrsEySvhP1cttRR2/XpoRJvweNro/rSGsGCoXxG0W2wze3htApmeDk8trvj2?=
 =?us-ascii?Q?uuASx0v6uDKQEvg6IABWFC9vG6hDckcIgQW3oaNbaLN5Fy9SL1YX5YAUzP88?=
 =?us-ascii?Q?ap1KZqhNPCiCnJ67O+9aezw6HulEckyPJpVH3vRshMwJ0yQdcg+6GsZT9G9G?=
 =?us-ascii?Q?6PTISdF9wpS7dt4dIgAi43SY2zgnpZS74jMKVbinU1M9UeEuqRT3Id/IVNGm?=
 =?us-ascii?Q?8k6BBuq9bwFsnMm8odSpQ5Jgj2c4zlaurTI+pWGkWDE/lj9DV82gB2OxSafU?=
 =?us-ascii?Q?/1OtEoAQx7aHX9FrhaeIW5NUv5l4H6/VMobP7fXISZkaCPL+pMiO/JTuRP45?=
 =?us-ascii?Q?d6PsFEvUeZs11XWHc1O1iXNW5fh8x59l8ZlLATN5PGOSixdH1eoMQGVr0A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:41:36.8796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e884d1cd-56ca-44ce-9f6c-08dd830bd34d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5860
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

We can't trace dependencies from drm_sched_job_add_dependency
because when it's called the job's fence is not available yet.

So instead each dependency is traced individually when
drm_sched_entity_push_job is used.

Tracing the dependencies allows tools to analyze the dependencies
between the jobs (previously it was only possible for fences
traced by drm_sched_job_wait_dep).

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 23 +++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_entity.c      |  8 +++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 6f5bd05131aa..5d9992ad47d3 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -87,6 +87,29 @@ TRACE_EVENT(drm_sched_process_job,
 		      __entry->fence_context, __entry->fence_seqno)
 );
 
+TRACE_EVENT(drm_sched_job_add_dep,
+	TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
+	TP_ARGS(sched_job, fence),
+	TP_STRUCT__entry(
+		    __field(u64, fence_context)
+		    __field(u64, fence_seqno)
+		    __field(u64, id)
+		    __field(u64, ctx)
+		    __field(u64, seqno)
+		    ),
+
+	TP_fast_assign(
+		    __entry->fence_context = sched_job->s_fence->finished.context;
+		    __entry->fence_seqno = sched_job->s_fence->finished.seqno;
+		    __entry->id = sched_job->id;
+		    __entry->ctx = fence->context;
+		    __entry->seqno = fence->seqno;
+		    ),
+	TP_printk("fence=%llu:%llu, id=%llu depends on fence=%llu:%llu",
+		  __entry->fence_context, __entry->fence_seqno, __entry->id,
+		  __entry->ctx, __entry->seqno)
+);
+
 TRACE_EVENT(drm_sched_job_wait_dep,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index bd39db7bb240..be579e132711 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -587,6 +587,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
+
+	if (trace_drm_sched_job_add_dep_enabled()) {
+		struct dma_fence *entry;
+		unsigned long index;
+
+		xa_for_each(&sched_job->dependencies, index, entry)
+			trace_drm_sched_job_add_dep(sched_job, entry);
+	}
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
-- 
2.43.0

