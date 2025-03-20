Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B0FA6A321
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2AA10E5B3;
	Thu, 20 Mar 2025 10:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uRv6GxUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2078.outbound.protection.outlook.com [40.107.102.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F5C10E5B3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7FVwqCLJTcjk708kXZgPC6JY2edC/VTSr3UQlvT9Fq0Gd9SCuiwpjtqNrZX1XU13YBOlfy+iqjRRlapilGSA7ogMh0pC4Yzxb7X1Ec5NexMx0LWy5p/isiAMMTdI/wIGiXBxPu3T0NrokKaC1Msv0rkm/WDJaNF1BPV8SUxiXXNufTfFZkPljb6IhRn79xnnoDEpAISzGTv3lRd43ogWpG1BWaIXkPY7AQvpKTrmlT9pYJ9nilfSrdZBjzL0OBE+yyRMaQc8z4J5NKto85jZdFPtdAm2PYooFp/ljxBVFfnj4msyr/S8jqtbYTWBMMTAJPU6MhFdPYZc4nyCgVhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF5jPVNwlpkUPuvo0DwSEdRh77LyBMyrSyuWj6942VQ=;
 b=pKxks3Uzh5ykksVz4rJTrPg9+/wyemFbe6zSnXVvqOrhIr9K7jVwwWDf/Ve8hZ4Due2wELB0jXFTCM6HmifxF5okL3/G7y5+ok+1oVlihRrOvd6OVFS6nZ5qpMyEjCTXaR8jqrmV6PlCJWOJfUc5bBeCHwirqEbi5eoNB1qOzwSlqmFu6Ih4FrE+6YiNPHTnKyegpvviiuGwoKTCXrRLmYU1yGefcisgFEkQU6ilm8MHqF4D3h99ychc+lBAU/xSxnmM3UCe4b72lFQREYSdb/MXsKOKfjxJatLN7ctdRw5LSO5Q+Hd6+QZrtB/DBu+jNJXmcv7pFqrrcy3gnhgfBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF5jPVNwlpkUPuvo0DwSEdRh77LyBMyrSyuWj6942VQ=;
 b=uRv6GxUCMCVhCg62B5TU9sOGt4NMPn/M5ox/HrdIvHesVzgYaBwdi29CVFi3jVmE47ftenU0sSL1BeLvkFKnd2G2B7+fIPM8JSPrWh37HnLGRZdB7vo/ksHvFh4QPhJLPRQE6Ok6ZShH6bbQAixHlBtx8qmno14iWK+j+RH74fM=
Received: from BN9PR03CA0924.namprd03.prod.outlook.com (2603:10b6:408:107::29)
 by CY8PR12MB7633.namprd12.prod.outlook.com (2603:10b6:930:9c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 10:00:03 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:408:107:cafe::ad) by BN9PR03CA0924.outlook.office365.com
 (2603:10b6:408:107::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.35 via Frontend Transport; Thu,
 20 Mar 2025 10:00:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 10:00:02 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 05:00:00 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v8 05/10] drm/sched: trace dependencies for gpu jobs
Date: Thu, 20 Mar 2025 10:58:01 +0100
Message-ID: <20250320095818.40622-6-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|CY8PR12MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a35200a-bfd0-4d3f-d7d3-08dd6795fbcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tjY4mYHFQVdp7h46hTNod3hvsIPZ7FL1zBPbDZJkABlbZH218cLfGftNgBqL?=
 =?us-ascii?Q?ELpX2R6SVaqQ7C7JQQHIGUdVxrxbvngyIuDUuDK70jBagawPgYFLE52Vua/l?=
 =?us-ascii?Q?zJPaDsWq2yAIEUG5kakgsNWgtdXsdf4a8gPWoWAeDmje/2wyJVh4zI0YILhC?=
 =?us-ascii?Q?+/1psjJMz6D9z8lB6lOIjjNNRQ5TbqA8ydbjws3NoVOr22rsI1OZicfAMS/5?=
 =?us-ascii?Q?B/mIhTXD4c5hPj8SM0J7IlVtxoUrIxqguR6bI7UprquBNayj2hVt5n//Jtjl?=
 =?us-ascii?Q?UsRo9W0CpTRESoXTEjFFqitR1lBlKu3V0Lzqn/pk1mYBPq1pqjRX8ZeUv8Yn?=
 =?us-ascii?Q?ilAUu/7bf+UM8PBDst9aRx24O+Py/avaLd0/kOsplKhf5ybw0q88NLscG8f9?=
 =?us-ascii?Q?oVSwSZsyYKodYivGqLjjcjQ37ZbNosaYM/LZ/LPNsD54I9mieTIn2C/wn4C5?=
 =?us-ascii?Q?4spDgCvuNEjirI2H9b2lazBunUgCQgpeVhWGTukfG1dd9ehC7nvrf3BvZ8lX?=
 =?us-ascii?Q?NqxvwcoHQVmklCtLhr0dBLVtUfVC6ynfh/NUNzbkH+GyJlXBN5ipkRE+RMn+?=
 =?us-ascii?Q?QfBhdX0CX8NsBSSLjolTEaXhAFf7JnK5mUFYTb/jYzr+q/5wqKgl6814eetH?=
 =?us-ascii?Q?l8UvNeQTCD9PY+ipXTSjeEtceFZBdgf+/9UcvMtwzajSDqVrAJtmL2gROSCl?=
 =?us-ascii?Q?i0rabkVKCUVpDTBGTpCSasykKo22BW3HcVeZ31+ksFuZuP1+GljUyY1CKZ9/?=
 =?us-ascii?Q?yxUYmc3skV8W9oQTD7Ahpu2jeHou+/g1GfMkhZCH/mrlsC72B3GJLqB259tu?=
 =?us-ascii?Q?ejn+2wmGlhDwheV9tt1H6VOi/6do2Ds+p+KpmG/+L6irPQlCO0nP7ek3rQnC?=
 =?us-ascii?Q?k1bXCmLpTfWAQrZ7z5ez9mIyJPIBmuuKcF/vOG663sj2GYgGjZBpiQaqaSY9?=
 =?us-ascii?Q?e3LT/vLXixMqCW1/lLdwmLE70Q9iRINP0RyiLSTEprS/YGfAaSyYGDL/XLXt?=
 =?us-ascii?Q?aB31HfJPW6znWaobLuOgpTTN2k/n20ZujCcVv99fdUBz51HwbFUkq2M5z8w0?=
 =?us-ascii?Q?8GmR9WP461RdS1bLt10YSpuSdYBrPc8FDrWXE1ca/DPzXJu1/2mLcTQWcNER?=
 =?us-ascii?Q?jbxIN7p2+/Flu5ja30QcEc/RFrtuS+OfQeIgqijhDCGV0wfvk3aqDm9Twewv?=
 =?us-ascii?Q?5dNk766rGsLW+igJOBpzK19gBSBmqGE5JOIKATL/3hbohhClINGrTMV31KMf?=
 =?us-ascii?Q?/xhekbJWTSx/2T72PiajZ2nmFqCAbdn8qsGM8JyH+1SS5bLlBzVFqoc4qp8c?=
 =?us-ascii?Q?twFep6mTT7A1g6VF7mAXeYeVN3pbq9JmXFnaNkqSC+3lDFfvY0BGMUSl3CQ3?=
 =?us-ascii?Q?2PNpVQ5ZH8nZkaWa2+WwQJiu6LPz/Ivq1QZJKlaDk2vPcFZjXQPdyd1Nlgbz?=
 =?us-ascii?Q?FiAn24YnEM/uAkUk5FOnqttNdLf8z7yVvNF4qO18acNFlXyU3rqBqG7cLYRO?=
 =?us-ascii?Q?it6NiRmcZOHFRHfOCqoTPAQu2lQbrznsg+2G?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:00:02.8369 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a35200a-bfd0-4d3f-d7d3-08dd6795fbcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7633
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
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 24 ++++++++++++++++++-
 drivers/gpu/drm/scheduler/sched_entity.c      |  8 +++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 21a85ee59066..5d9992ad47d3 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -54,7 +54,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __assign_str(dev);
 			   __entry->fence_context = sched_job->s_fence->finished.context;
 			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
-
 			   ),
 	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
 		      __get_str(dev), __entry->id,
@@ -88,6 +87,29 @@ TRACE_EVENT(drm_sched_process_job,
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
index a6d2a4722d82..047e42cfb129 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -580,6 +580,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
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

