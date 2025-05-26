Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5F7AC3FCB
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA9F10E36C;
	Mon, 26 May 2025 12:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jiJ25jFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C589F10E324
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 12:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL3fBwoykV8UKg2BpZ5BDeQAS17+yp2GgW8I3swpbLX5CnqZ9os+DpAKX1A9Nbi7mrhXv0agoWnqAaZDX6f35j3MbshMlwn/MisoPsjkOcASxizmhWFP54TbCf3FuqDyF9oVk++ChNtLv9CbLa25SZqDuUbokSNK+fGOBNS6xCP/3/dw3UPdeJXAENigOIbdW1dEn0m09EbhykNKYsNncggG/aOf7HzOPMtz/RyaJ4Dhfx6abOjEqnEeyUt87SIfIX091orFwn8w08IUwejX2LJffNIlXS9+l8BXNgq57kspPQ9UXxkfqGAifJiU4x+rxX+Fho9SfRRtIZ/9ylxOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7VuIb1G7UqMbLW/iM7ebBG0Y8fEKiuWshqnMvhc8GI=;
 b=DOc6RUrxEiBYNnkSCTwyKHXXDdEwJSAzYeRM/y/2YN6t4NnvGHvmJQcn5ewMIkClDgYbVBb46K0j6gqSafrjhaEvg0+XHLcTZbJaXvwkZOieIja6BIpgHjhVCUuDNfNXTPQCWFvUaZGE1nKx163x7M35/vueGDLdOG2GRWSdVxHD2sBjHyMKWIAEkOsKDUbpu/pvL/POlVGpDn1+eXY+kEZ2UnSMe6VOaNVYUhfGxhgMP0ZUa629dOFb5yWKStF/u9DlBwAFBWAOsoppa/V8SFi/fHqoooIxJKs/fuFliSUfsThR73lwzWLN+l+v3TvFtAxHDWROpFRqyli8RWIFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7VuIb1G7UqMbLW/iM7ebBG0Y8fEKiuWshqnMvhc8GI=;
 b=jiJ25jFB2RpICWa90ZKuLahgYkotXMrbd3CmgqCvct4VS/my/8m7CMdZaBR2mHc70VWHO5DT3sb8T1rdV56Un1Q7JHuk1uD7ziQ7vAsaOQuGfPPaggREGao9oS0CVclestkisXf0to9AHcn9r2s8o6dKfu5SmTgd+pPmvfU4BNI=
Received: from BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47) by
 SN7PR12MB7911.namprd12.prod.outlook.com (2603:10b6:806:32a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 12:55:57 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::d0) by BYAPR01CA0070.outlook.office365.com
 (2603:10b6:a03:94::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 12:55:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:55:57 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:55:54 -0500
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
Subject: [PATCH v11 04/10] drm/sched: Cleanup gpu_scheduler trace events
Date: Mon, 26 May 2025 14:54:46 +0200
Message-ID: <20250526125505.2360-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|SN7PR12MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6622d2-4cec-4fd0-b137-08dd9c54a88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+u07TpkMPycBC8MOE4K+rQWaKiIXesoyWtXF8SJKqt3nlZHSy1oEOwvpiMZg?=
 =?us-ascii?Q?XqaSuC628d96HMiPIONjxwlK8aozj8ebCva8qKAokkPR3qOQUc/lVs+kW3Xv?=
 =?us-ascii?Q?YOi47/YSZEXcgRTerKMwAlVsF0MbydhutACSAaF1kW1y0swWYGTmA5hY6QAc?=
 =?us-ascii?Q?NiBSBRsswbTOcv5ZK2atkBPD7ancWPTd+9nx/UJgsvtih7bJi59t6Kv0314m?=
 =?us-ascii?Q?vQwtLruPPGVOiWdIGeoZsrd5x8hwrDepQJvPzxEJGDM8ZmYA4FwKjmX4ZPqT?=
 =?us-ascii?Q?upgWQf3oyWPQiaFtgxuWR9fb9uqUj7m9KcO9j9b/yfLqo9XUpZWnJkwt0twF?=
 =?us-ascii?Q?3v9icY2KcLgICKDYveOmQtbPceCHrz3x1JTipFE0fWzW/YEcUOrQcI3XZF6s?=
 =?us-ascii?Q?vVDlDYbGkrOucfieiZ6sAO8XbgJlbOYkFlRu+WvAXrv5iN5FVdaHmBmOWte5?=
 =?us-ascii?Q?g1NECOFG6sbrw8TxM/v+P/N13GkSfQF2lYXynDtea7AXXuyjP2QAM8UD21zR?=
 =?us-ascii?Q?k3AWJO+U9Sdqtx+PcLJi5fn4rzD4jqVHKuspX6sMplGTNCapv9ygz4gpy7Ns?=
 =?us-ascii?Q?TURSvrEtW/3/cS6Txet3LA/Wnz2TuNJZdMGqY8cAzCySqGFJ9UboA/EFQs4L?=
 =?us-ascii?Q?UGtAYbcQxAEZqD5QhT4Iljme5l0lhhSrMuIYy2rFCZ7UQSwu44eyZyJ0QsDo?=
 =?us-ascii?Q?TjE5lz9UhNrSI+wioR9UijAGlCu/ECpYeCdrn35ZV+PIWBX/xL8RWDdDTVxf?=
 =?us-ascii?Q?rf+T+tY3IXSlQMM+3zip7MRQ98KeGCVzJJIDvoh2qeX5GOCWmY8t3a98JTCu?=
 =?us-ascii?Q?BdfUDLsFPeu8C/9Db78huYPoVqIn1lLeG5MTYhPgZ6OBYWku/flx+fVRcnt5?=
 =?us-ascii?Q?YDPGWU9AagwneXSt1KucQzqRi2sU68WVWKEgr6DUejJNxq60FP/BcB5IGKlq?=
 =?us-ascii?Q?5C68OmxoOITzdL7/kTL8qoSotGp0gUHTwHkaRMaxqlFe8XwmBE5Zg6FNlU7A?=
 =?us-ascii?Q?XSVhHkrvujo5nN8Y7ye+jnF6p/I010r3NoNgaR27xq06TRkD/WZFYNdqgV6T?=
 =?us-ascii?Q?29sihI5qyS4GiXmmLN6C9kKL11qX6ecJYE3w7aW+jzLjuISlrkI36StYWMsR?=
 =?us-ascii?Q?q0PVeGgYahIpQIbCk5PvgRFTyrjzlKBQsCCClyoL1dFqrp+DLwMPqCKTXOSR?=
 =?us-ascii?Q?VuDTwh50rUMhPMISG0k1/2YCydZtgGWyL9UQB2bH91RcAihm9klCvzvjzOv1?=
 =?us-ascii?Q?Tasu1koeWA3zHM4DLMTSFvcN94yVt73Ga/zOFUsqgz48fMwQa5cPj63WnBRa?=
 =?us-ascii?Q?c69CsIemYuc0zyINDUDaF5azUSCmtotfFFllUO4xhZKD79LQ4q9OzLdQZeN5?=
 =?us-ascii?Q?x4pIKV5VED3i8FuE6aXaG/Uc0wNyGUccr4XDQcg8LGN0PLrOihiB/r2XNdbZ?=
 =?us-ascii?Q?hFuy+nS1OgZSgGivCKduHxi+ZTlKY1/779aCKbpTzraDqerZtuMWi0P8v+75?=
 =?us-ascii?Q?bKjJxBhPrsuQaOa8QLmvtmxYDeyvdCuj4d+tReKE8EyBeJsu7mad6PWqjg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:55:57.4060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6622d2-4cec-4fd0-b137-08dd9c54a88a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7911
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

