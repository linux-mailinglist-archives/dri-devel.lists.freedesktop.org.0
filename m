Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EBB9C86C1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF5810E7CF;
	Thu, 14 Nov 2024 10:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ysz3rM00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457C110E7CF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:02:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N55rMY3quoYmt5m76sP+8BTasXU639SujvkutUoF1KNX2YmBmPkTlWVnz0LrLaCgEaq6L9Z/n464mcEhd+ac1hnkH53z2ugKmGerJWrt3FGhDnM3Ee8r8mlEQGZWjbK5YlNjZi4597vKTAH4nZp/fayzxckMHlSZ8EZOGz3Gjnj4nJgacCGjcue12mEsBwe3I8aRD2GQJGsn+nbe1RZO4DZygJARkFQ7Zp3NiZU28HP8gEFHGP/sVfU7Fpd/OwMdg2LdKqLw8C+hW9lUEJPKx+Jrm7YDwW2kXMPYY8FmyD0JeXxxX50nImyW4oQ/ddoQ7/u4jDVK4NEJtfl29Gx+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm15NrbvwV/HfM1vkvYivOfevE7KGpn2AuMZ4DKTkLU=;
 b=HArcT4NK9zVxo3AgUPgq/kXLpfbyT6h/pbVDH5WdPk+oVn9i0f46HtNnIN969VFZ6cwqRDdO2h+Msin++pije8tjVMHoiN/QG/XNFPOrkCskHM9m867nMIMflXRe+wN5KpcbSs0S807ItBhFfY6G0evzfwGU3eeaCTAzMKz2e8dwbo0PaSC+0+67g1hmCwDQOVYGaDJT5QSxEWme4LrWL9OFDbVurALKPV+rsTBseq6mzcJeIxHp34AxCezpfD3D7bzUmdIV0sRoaYg3b+iPuNsEY4JUNeHz2Qz7P+97is1eMwit+y/Lyg/Na67aXw7//c39yE1uT2pPYa59VfAWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xm15NrbvwV/HfM1vkvYivOfevE7KGpn2AuMZ4DKTkLU=;
 b=Ysz3rM00OGBnp0j2GE8JuKWqA83tU7xpPHA7fq1BrwbvlNnxJPQBsg3iGB0aISQB3QbVb1LJGyYlpt37KGeoBIDWgQsavjsvDWZQO8ytV2tO+3zKvBR771t0wFI13OFVrG5p+tRMZjrafSzzJVneGNVj5DZvi2Tn7+Z7jyuMF8c=
Received: from SN6PR05CA0020.namprd05.prod.outlook.com (2603:10b6:805:de::33)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 10:02:04 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:805:de:cafe::f5) by SN6PR05CA0020.outlook.office365.com
 (2603:10b6:805:de::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Thu, 14 Nov 2024 10:02:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 10:02:04 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 04:01:56 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>, <l.stach@pengutronix.de>, <matt.coster@imgtec.com>,
 <frank.binns@imgtec.com>, <yuq825@gmail.com>, <robdclark@gmail.com>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <boris.brezillon@collabora.com>,
 <steven.price@arm.com>, <mwen@igalia.com>, <mcanal@igalia.com>,
 <thomas.hellstrom@linux.intel.com>, <tvrtko.ursulin@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v6 4/7] drm/sched: cleanup gpu_scheduler trace events
Date: Thu, 14 Nov 2024 11:01:07 +0100
Message-ID: <20241114100113.150647-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a46569-23ed-4748-a72b-08dd04936453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wZQJFw/IfTNm11Xby2SwyfRSANV6FJeucmuZpINTZGD8NE8L/GdA7TwzSjL3?=
 =?us-ascii?Q?DcNWTJ59DD6rJCWA6QN1om3abVikC1qSscnG2fkn8BCJhk8EZzV67eP8epVe?=
 =?us-ascii?Q?rf6aQ89cf8H1lcMR9Zv5Op9LvCoqk4FeXyeTlfOCq1c8FQSIK7M2QHvpRiyf?=
 =?us-ascii?Q?BJ8a35eH4TLb2wmZWF5toHtV2ImPyA/NuLXVll7g1vbzXU4cCZN1ITVbkyez?=
 =?us-ascii?Q?NEhYl5TkjZBax7GGYrYEDBmgPQEf7v2GJXatB7lPxZARanBLLaijZ01QY+Wz?=
 =?us-ascii?Q?c5UOMrAtTgipiyQDIpn42eC1tRnwIDNd0RQtsIwatNTI3gPmk7WsmdkxXLU2?=
 =?us-ascii?Q?82q2CP5fH5W3Fcv/YH7Go3JNI8Vh9DHMYI1AMmbOuzOXWAef1QjTIwcaH1Ge?=
 =?us-ascii?Q?B4lnejs6BqF9ytplk0LiTvDlP9ja21Dg431T6j7DTWEzQuzZym2NdE2PLmj7?=
 =?us-ascii?Q?/RjgGWf01S5/AR+nXD46OP26t0+aASILM8ZxK5Dr0DRD3TcqmaJLXweTIPmT?=
 =?us-ascii?Q?kLnJIsLYrxnei2bjNrsksQBl5ptdgCzwVZIDHo03a5sYyfEpvK9NAc6b1oKp?=
 =?us-ascii?Q?VM4zmqlP9ysuTS/cOMdiPBX9suwnBNmDn96BMAC262DEphdDJ5G7yvE0z5p/?=
 =?us-ascii?Q?y/AKgIdnDKKYuS00zC5f67Wh0wgRdGw+y8vUIq94WaQmLvaTjF4gUHzxXxtg?=
 =?us-ascii?Q?Z8dJMkTRdEr4HWOprvv0S7Iu1GT6+huGWHLRSJXXrDWvNxYByPrQLWi43XH9?=
 =?us-ascii?Q?N03rHn7xencuqntoxXKnBXmZ+nqnhjyx8uTrxpGs/XEc3aUWn6GnRPaBUZ4r?=
 =?us-ascii?Q?AAf2iPWi2cE5jewwfiZ8JLK3Tkn6XV+3G1rGkaFASFecWiTwzPpw25734vnt?=
 =?us-ascii?Q?jD3FJEQDzGp/116ZyfAKs/ezp5SHcUb5inPpMW19cejw2ayTcOq/ljl4RvZD?=
 =?us-ascii?Q?5phpASYrBPZivddvkLE3xXvuGRtUvmJ+My+UtGjAyGjwl0ySl2SP+DMtsTlu?=
 =?us-ascii?Q?xz4GWZLK55uOYvFDMnSOA9swJ/D2ZUxKJj7xu9Ixs7gBFgEgsJD/x1QIQfah?=
 =?us-ascii?Q?RueNnaMdxd3qjk4rNa3TWJYYBZUq6AsAq/sTM6H8u/Igqdq6xEImbFFrRX86?=
 =?us-ascii?Q?GEOxPFWE4K6D9k5eMiyNI23wlrra/49wUKzLj0SezOg4SuXrKoE/DRehPsKW?=
 =?us-ascii?Q?6snxA8d2SLchAp/BpFMKRVfjYxxy2SPPhnHsGcoFpWt5O65Nbj7SysOmk/BF?=
 =?us-ascii?Q?O2i3KxIn+ewDxNbmnjxB14zMEx1IBOOA9y7M2iSLnvb+pWkQKGCXgYofkuYt?=
 =?us-ascii?Q?oNDXsGPinPKKlo+5TxJHNd7+dlYQfo6jNcDfrPCjJRcTMgTOrvOu/uojHkvW?=
 =?us-ascii?Q?wXwVrhfc31wcfHP4zL1kTUAT/61V1RxtpWTKx9M+LbqoNQ3hybc3Uq4/NLFb?=
 =?us-ascii?Q?0dXC6f8lJbw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:02:04.5604 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a46569-23ed-4748-a72b-08dd04936453
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488
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

   "fence=(context:%llu, seqno:%lld)"

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 39 +++++++++++--------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index c4ec28540656..24358c4d5bbe 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -36,28 +36,29 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
 	    TP_STRUCT__entry(
-			     __field(struct drm_sched_entity *, entity)
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
+	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
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
+	    TP_printk("fence=(context:%llu, seqno:%lld) signaled",
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
+	    TP_printk("fence=(context:%llu, seqno:%lld), id=%llu, dependencies:{(context:%llu, seqno:%lld)}",
+		      __entry->fence_context, __entry->fence_seqno, __entry->id,
+		      __entry->ctx, __entry->seqno)
 );
 
 #endif
-- 
2.43.0

