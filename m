Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ED4A9A672
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DB610E76A;
	Thu, 24 Apr 2025 08:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vppk3inm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FF810E76A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJtOSIrNqrZO+MzGoWU3pMD/4SdrPjRSbQvVhnNkLPR190zCaXnZT+I1IgHC19ihtidvM8uVRl4T+HEhfoaNcF8IVWjmvmVFqQLvgcNvVcUlOgghK1hSJf2rWY7GY4vlOHX+wp0NnPUH+mxan00FwXHYFV+No4E3PMCZenNfCuUqGy7/tEkedASw3q+aQah/OzOhMQqHNYs8/p7ZxE5TcZPT7Gj6kwe6I2qKKyWkGHQznFznsW0FnuZGxd8qgMj/+Hz+sTs388Q771Sk5csrp4KIGV0DFRa0l/3cVX9+Eeu/CPlLXo2M679ch+rZuFz3okXxWez24s/JSsLKMnI0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7VuIb1G7UqMbLW/iM7ebBG0Y8fEKiuWshqnMvhc8GI=;
 b=M+uFoz0IS7vPbVdloUkmlHbmwpzzyXD3/iqw4o35e+2az0bPCqpfLWH7Z1FhjfNSwjwugS3kbrCh40CUT8FGnJne8f8W/siqEMpvNGWcTZlukai7MhMM7fa1OPfdhy9TmT62wqWuFELQH9D0pa2er9BB5DgQwM3JCix62ou8vAZ43n3HIiPKN9E/cqC00dU8hLYqimITxbBkr5P/WKmyEGMqPxI7qY25L+FO3u6mBROHgfDoeyZ2dVcSiJHLWOh5mFVgYMxXKp6RfRmjA4DxqE/qPYL7m3NqPxMJQTbhKetVsRS4sm45MjjKYXHEMidnWw5CSvwvRaLKOqb7hUiOVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7VuIb1G7UqMbLW/iM7ebBG0Y8fEKiuWshqnMvhc8GI=;
 b=vppk3inmFFvyd/n9yffromYYEx9a1HWAWOhnQZBiyDPTfAMMEw058dZ1QRYQyDyJwWXj9sQtSMArA6j07otpyQGL5mwtX50GORcHFuG96/cxoH6LDX1y8jKyXnVcpmONgqxSRnxmr0zLLEfXUFfRic4aY15gVGQIte261znh4u8=
Received: from DS7PR03CA0351.namprd03.prod.outlook.com (2603:10b6:8:55::16) by
 CH3PR12MB8994.namprd12.prod.outlook.com (2603:10b6:610:171::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Thu, 24 Apr 2025 08:41:18 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:55:cafe::4e) by DS7PR03CA0351.outlook.office365.com
 (2603:10b6:8:55::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 08:41:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Thu, 24 Apr 2025 08:41:18 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 03:41:14 -0500
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
Subject: [PATCH v9 04/10] drm/sched: cleanup gpu_scheduler trace events
Date: Thu, 24 Apr 2025 10:38:16 +0200
Message-ID: <20250424083834.15518-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|CH3PR12MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc3b6b1-c24a-418c-adb5-08dd830bc878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3EFjZQHFiRBZIUaOBiK0M/9fPFvMYkRLL7geZVPHBNdAa9rewi87XXu1LQXX?=
 =?us-ascii?Q?BExTxb1BOHOd9Pj3dTd22Kk4e2JYShZN7KSgAIO9QX1aeSlow+S7rso4+yas?=
 =?us-ascii?Q?X7rT6f9HmuGP5o38ys3qG5bsOz+GN02Nj6pWWhdYDf5NoJb31wZda2XrzzUP?=
 =?us-ascii?Q?G3e4opgk+JMTXTfQblioSMuYL4clepk2g2MHm2zuHJmDcIHJvo81x3MZbzib?=
 =?us-ascii?Q?OXCUuGhE+IMriwRAaHVic0GxGALum0yBni8d1RK4w/vxOSb4JBjAgj0GmDL4?=
 =?us-ascii?Q?4pi2wxaUdU0HL/eGVHGDV9VrEC4Cuv+T9LL2jbzm1QqExYIuQzBiXXcutuTH?=
 =?us-ascii?Q?N2/5enAWPhMW6luoV1mdWhWIJHUhZJhlHUGZyUeYN55tjko/+Vx66XYBZQTL?=
 =?us-ascii?Q?abNMFemar43Vhe/qNZZf6Y1mFXiLpEo7uWJR2Kejg5wT7E6CxgH3GnuRfev/?=
 =?us-ascii?Q?M6XKkF8s2lZapeOIjBr2Pi/l+ZBgLbseVD4ERx1S2eGFWM0EJHNUa97SoXpi?=
 =?us-ascii?Q?8gNSp2WI+txhEKF+Y2gkImN8/VrYrt5O62439NxP3J2ne0R+yVH1V061R3+l?=
 =?us-ascii?Q?d+Svvx8NMzyFTv8VV1e/1Vr46h3NKLQu/bEo9+wF8T1F7IUmYzqdYEA1p9Ae?=
 =?us-ascii?Q?3Li8qpu9Chj2c2bLANf4BC0A607hA/LiDhKWcAp+TKuoGXstEQwfOoTS1NJ3?=
 =?us-ascii?Q?/G1RudUVHdyJkEmPyPTctTWCwhEYNUDrDm+5wlPZL+t7n/N1ICXNo5ivZPgQ?=
 =?us-ascii?Q?9/jmLZSlpXqAxviijL5x1Yge/cF/eHXaQ2SrRWP9IBBpgc37bDkenxOJnpWH?=
 =?us-ascii?Q?kX7lU/lG0gcJqle8Rzf6qEsbcKAmbqzqgAkquR5AAwFgXfLoN6mwfxsz3lvJ?=
 =?us-ascii?Q?Qb0EpIqSyF7lp6+BNB3bgtL/lvubxbCCSp5uikiWRSA9Cq8zRSnV6bDLbFHt?=
 =?us-ascii?Q?lUKjiAUqCcXNqkagr3x//upsUv1u8QC4ctfHZ+2h6s+3Nvk7At5be1Hp6vRk?=
 =?us-ascii?Q?0+O41qm4nmpjiVW46zggbrEvzbjMTXMIVTZaV0ZSI+r2kOu6jT+OV5YTGJSZ?=
 =?us-ascii?Q?Jr9yD4mI9IKUAOlU3lOs842fqn6/o7DP11PXxeqnEIJSiGy5op/JLZ3dAJY2?=
 =?us-ascii?Q?z78vR70TPOlEraHtQjm+xwTyj6/ExpRiqOPEYAQBm07EsauK0e66TcQhilPO?=
 =?us-ascii?Q?zoIt54hxw9QLnmSUZsq/KCAXzcD/y6JUzcLdhwA+3bxojjqeMe5XVvFmj2/a?=
 =?us-ascii?Q?icY8V/31BEeDYyATR4TrxE7B5NcVAe5YoOqUccbPsOBCi9+2l8W60X4TLRPN?=
 =?us-ascii?Q?XPNvWDqcwImoRjNx0FRxnUa2Nmu347aUirLq7z4HzuyOPKiU92MSGpNgFcAj?=
 =?us-ascii?Q?H9UZCk4j6OBkAaPhtpdkmy2kFyTDIH3MefadHWDK8MWCt9i7dx9TGvht8MjH?=
 =?us-ascii?Q?6xGKVMNGMFVcelmDv3JQs0lIrozZbD8x5r4DXcSKNgbGkrWV454ePkWp7fyW?=
 =?us-ascii?Q?wjwt+d287e6KunyCv2igiXtGwyg5xQoIZkH+LZy3Wevv9Epi4NB8thjC0Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:41:18.7052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc3b6b1-c24a-418c-adb5-08dd830bc878
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8994
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

