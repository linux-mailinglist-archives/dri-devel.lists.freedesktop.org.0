Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F090AC3FD2
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24C610E35E;
	Mon, 26 May 2025 12:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iQYkZ8UB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9496010E35E;
 Mon, 26 May 2025 12:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FE/hTSXJn1MAobSiGbWwvt1ffAPnBLAj1qOrkd1PLaGWJ8Zp+6PHhPWwDTfo9B1xZ2fbftxVvATZsqx4E8DuAne2+TSccdjwztPBInhIeFOpDE7WfNaRaQVH/3+mc3dVN8iPtfLRGBsMLCftHApdlSDmQDSCheJ8GOGn0h3g6iJvbSzuuKWEpwYEKJAIC9R+ssUQwj3Hbql60tdGCkY0xNKgIF31TJVF8Yuef9sQ2GTOF+ZaptpyF5NR4IO0d/HFMVmPJUIP7nwz0aFMBN+YuptDXEQofO74wugsEeiVhHWpxny21bG9rElgH6wDtv3tz3w4OrL50l6x9tVxKmcljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPnXzD0KJxJJQYtwJjPmIBHC6oxkoYOlNi+gipIakdk=;
 b=gTzgmb/y5jRM6GwU2FFLvsA/0IKmoPiiELkU2JFS0YIe0ebkGISyl9DBOE9ZhxY9PZm8Q9xFTDH9C/LSjbUnrxUTAAjLzkLrBl2jjrGhGtiRvZmOgjlNKrwxGT6rIk/H5P7RaHgs4L+Dpl2szte/bcAxMTD3jdtbfVl0V8WRTG+aBdKDDgWEIAs2lrwOqql/dO2DVAk7gA/lz3qh6eWkkb6qc+4ZDhIjCISHGlSxHHx90UMukObq2QdB/GlMKfm5yoVGDOyyQ//3/zr4pIvseZY6qMVGLf4jrLyw27mnQn/VZ4e0RDOCHOiMS8iFowomsyDY3FdvHjDGJBKWLYcMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPnXzD0KJxJJQYtwJjPmIBHC6oxkoYOlNi+gipIakdk=;
 b=iQYkZ8UBInxvpSgB2/VCJNmXSrQV9/FOUP5P9vdPQU/MXdtMAm1A6jlHoT4ZYf1a4Aetfa/FlNkmFAExpOH/1Leuh7kii+rrpXCdcK7ZjbmHrzwzI7aVdJK9Aly71ulp/qI5cVODb8G8X55EaCrmBp+tYnZZFJXKJm1Gh3xktIg=
Received: from SJ0PR13CA0130.namprd13.prod.outlook.com (2603:10b6:a03:2c6::15)
 by CH1PPF7A6EE32B1.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::616) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 26 May
 2025 12:56:16 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::7e) by SJ0PR13CA0130.outlook.office365.com
 (2603:10b6:a03:2c6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Mon,
 26 May 2025 12:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:56:15 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:56:12 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Qiang Yu
 <yuq825@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tursulin@igalia.com>, Arvind Yadav <arvind.yadav@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lima@lists.freedesktop.org>
Subject: [PATCH v11 08/10] drm: Get rid of drm_sched_job.id
Date: Mon, 26 May 2025 14:54:50 +0200
Message-ID: <20250526125505.2360-9-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CH1PPF7A6EE32B1:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8e889e-93d8-4110-adfe-08dd9c54b38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|7416014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHo3YjNBeHpXNDgwdEpKaXltd2Y1a2lWaTVCcE1vYmk2WVVHbjNKL1QxcEVG?=
 =?utf-8?B?TmxqZDd1RVprV0lra3k5VGhXcy9qQ2pWZTdqeFQzT1hJR3c1YUx1N25wQVEz?=
 =?utf-8?B?dHFQanQzSkZtcWtlM2NzVktUMnd6Y3hONmFvdXhTOURFU0ZTeUoxcnBBek9H?=
 =?utf-8?B?ZCtQTGN3aDBjT3MvT3g4em92TGk0QllDQ1phSVQrWHIzQWpHbmRGb09POHcz?=
 =?utf-8?B?T1gzVVhaWi8xV01ZRFdnQlBMZWxEajMrd2lPQVAxYWlFUzJJZHhsS2NieU11?=
 =?utf-8?B?NEgwN2NsWmJqdzRSMzVKcXlWWUdnTzhBS3BVeXFWdElUMXJaTHhJdWN4QWZC?=
 =?utf-8?B?dFVRRUZlTVUvakpFRW5kWjd3ZXRlM0o4aHc5UzNOTkV3c1FlN3BTNm5TUkk0?=
 =?utf-8?B?MlVyaVZxZHg1TFBIdmtmVzQ2RCtvSWVyODNTWkZGaEdjbG1iNTdJVnRBZ20v?=
 =?utf-8?B?SzBoN0plSzB0OVcyemZ0RzBZQzRQbGRNSFZENFJTRGdHYnBMcHhZODVpTjB3?=
 =?utf-8?B?enNVeDFRQ1RUZHNWMVgxY3JrRlRvRWNYZ0lxcmFQbnBQenlWR0cxeDBheXFY?=
 =?utf-8?B?ZUs3QmpkTC9FWjZRY2N4RDJQazIxYTkxM3YrNWNnNFhuR0RIRzR1SDM5TUcv?=
 =?utf-8?B?ZTFKUU0vdnlJUzJNNi9ESHc1d1FvaCt5N2F0Skh3d3Zra29FMkwzZStjYVBQ?=
 =?utf-8?B?U0k2OC91bGtrVGFiL1NNYk91K1l2VXk4eVlYdEkxZFR2eVNGR2NLdE43eHlz?=
 =?utf-8?B?Q2NpampFYTFRL1BESDFhYWUzUi8vTlo0R1RCQTRndE9aVmZ2Zkc1WnV3RnpV?=
 =?utf-8?B?MmNZWUlmeGFiaThWMForN3pHT1FERXRodCtobW9iN2ZnZnFjcVJWZ1YyNEZB?=
 =?utf-8?B?c2RSRlZzVU9zU3pXODBUdUdQQlNuVzQzWGhic2QrOU5tWVZKS1lvcC9kd3lh?=
 =?utf-8?B?OFJHck1hSWFiemloZnQxSGVqdW1qbGdKcktDem80ZmpUOTFzUnJCRnc0a0tz?=
 =?utf-8?B?bU5oM241S3lDeng4OVAvRnZtNWZGTWpSZXh2WVBpNzlteWNJR01RU3F6SENT?=
 =?utf-8?B?VUxVZFBOWXg4SEdQWENTMVpyaHJRWm9nSGZCVlMwYWh0OElmTnVSb1lDbkZP?=
 =?utf-8?B?M2NvaTlCUHRoeTVyNjhOMmwzWVJTMmZVbkxKMHkwY0lkQ2U5L0tuSGNwL2Jh?=
 =?utf-8?B?NXNPVStXbERWOTFxYTdUTnRKOTk2RHFUdkQrWHcxeENwNjJKRG1wbitrOFVo?=
 =?utf-8?B?UkRUUERIMmRlSTlxL2ZlbytiRGhYV3hTWGxTSFFZL0ZRMU9GWXdJaStFYUFG?=
 =?utf-8?B?QWVBRGZMMzJ3cytiVlFJMi84eEdzMkxBeEdnTmN5R1lxQTNZaHRJNXN2THNM?=
 =?utf-8?B?Y2RRbnp4MXpxWHF2ZnRNMXFEbzdiQ3FjeVNOdEpSRnE5aGNjb2pHUjR4Z1kr?=
 =?utf-8?B?QzBhUUNpNVdPVmRVK1ZNNUcwZ2hDTjZSNnVPWUdhQkFWQkhlNU1na2tzQXg4?=
 =?utf-8?B?aDVxUmRFVFpqNWUwb0NielRLNWJXQ2ljbXMveUk5eUVZcTA3a2lIT1ZzNXAv?=
 =?utf-8?B?bFFvNDVxejh5L29xaThUbTVjMlBDZDhZTWovRzk3bnNPakk4cEpkaXI3QTlN?=
 =?utf-8?B?WGZxM24rTDhUNlMrRkNOejFqbU91QThsdWU3dXd6bzJRVnZpVVdhZnhhbU11?=
 =?utf-8?B?emV5NGkxS2RiL3pvdEY0aGQwaVlRYnJOZkVCWUFPQzdha05UanZ2RXdPODZ5?=
 =?utf-8?B?MERyYjlFOUw2U0pTWDMzNWNtQmxzYlB2RFRYTFp4Z0lvSFp2Wjl3U2YyOTF2?=
 =?utf-8?B?REoydG5CUnlDWjBUaUVVbXM5eUtzT3JLVmpETUI4eVVWbHpsNk83RmNjZXNh?=
 =?utf-8?B?RHJiN1lxdTJvekNkaUwyNDBuL2FBd0NOd1lTZ3dlcUZ4My9jdkF5aG1pWnk0?=
 =?utf-8?B?TDlrNFNXZ2R3czZGSWk0REtvNzdhYWhaK1NjUDlQbnRnckwyQlgxdTE4ajEz?=
 =?utf-8?B?ejRNME9ndTZ2WWdEQVNZSVptK2lBdllqNzFKREE0SmVpSmI1NlJlVFhVK1FX?=
 =?utf-8?B?Z0R2VmMza1dxY2ZIMFdIS2lWcmpyeDltTWp0QT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:56:15.8605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8e889e-93d8-4110-adfe-08dd9c54b38a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF7A6EE32B1
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
Reviewed-by: Arvind Yadav <arvind.yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h      | 18 ++++++------------
 drivers/gpu/drm/lima/lima_trace.h              |  6 ++----
 .../gpu/drm/scheduler/gpu_scheduler_trace.h    | 18 ++++++------------
 drivers/gpu/drm/scheduler/sched_main.c         |  1 -
 include/drm/gpu_scheduler.h                    |  3 ---
 5 files changed, 14 insertions(+), 32 deletions(-)

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
diff --git a/drivers/gpu/drm/lima/lima_trace.h b/drivers/gpu/drm/lima/lima_trace.h
index 3a349d10304e..98a7fb2fa00e 100644
--- a/drivers/gpu/drm/lima/lima_trace.h
+++ b/drivers/gpu/drm/lima/lima_trace.h
@@ -14,21 +14,19 @@ DECLARE_EVENT_CLASS(lima_task,
 	TP_PROTO(struct lima_sched_task *task),
 	TP_ARGS(task),
 	TP_STRUCT__entry(
-		__field(uint64_t, task_id)
 		__field(unsigned int, context)
 		__field(unsigned int, seqno)
 		__string(pipe, task->base.sched->name)
 		),
 
 	TP_fast_assign(
-		__entry->task_id = task->base.id;
 		__entry->context = task->base.s_fence->finished.context;
 		__entry->seqno = task->base.s_fence->finished.seqno;
 		__assign_str(pipe);
 		),
 
-	TP_printk("task=%llu, context=%u seqno=%u pipe=%s",
-		  __entry->task_id, __entry->context, __entry->seqno,
+	TP_printk("context=%u seqno=%u pipe=%s",
+		  __entry->context, __entry->seqno,
 		  __get_str(pipe))
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
index e3679f26f724..d20726d7adf0 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -855,7 +855,6 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 
 	job->sched = sched;
 	job->s_priority = entity->priority;
-	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1270cd82ff3e..e62a7214e052 100644
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

