Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA58FE729
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C1E10E94A;
	Thu,  6 Jun 2024 13:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e723LxGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A25110E94A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:08:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbwJNVvEfQIusHjtTG7GtHmDmvAwDUPJ/ZwocOTyzLCZ6vumu7shh3Pr26wRT+3FFswwHxvEHJpRSCQ1dMCi/YRemFQLI6qb8N8GhNL8GlbRPJgaRrlP/KdCLYQuYPiPJPaLD2vJK919c650ON4wso+RVfMIOBYokG3HiFut5St34W2KeZeIBClNreftNz1p+y5bYv2l3uiRDQStVBAjh3+EiblaaPvrPa1TDrqnYitVNY4Sdt7/WPJes2E51IgOJE2wpmddNTW5gzLz3EjOsk4INUGHcvF5AKNUMU2f6n6HcHx0pSpKV9gT1ZGUKwW5DwpDpJO6o3csgfHGXGDmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nM8lcc0CQiiCTPkzGUA4cZTDbu38/mkFeukQPRMIFTM=;
 b=HvyZkUF/iYDHdD45qpfvVJ+rtbo96gm4rW3kYEhL6KVIm52CgF77Qte47JVvnT/2qAGG+0dMAZmA/VX22tYPBWGEC9L7tU3HV5y7zYnbcEOahrApco6wGIZIAuB51Y/ng3KdDTmgQ7AU3g/DouFmqmKrr9iji1ujeIbNZ8DuFcURyiiX2B7SeH5BrJqtYWwzKP+NXM6krb35E9eeh4TDohwgVOZ7/eHODkep06UnxsKj+0zbmH3jdEWA9DdvSaKwGMOj9icCKYNM+6BJ9YCFImAkOHD0r8HHyGLyNVd9NckEymeUkyecu+GRz2TNgVL8yQLUEcjX2ATphYI4nupvvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nM8lcc0CQiiCTPkzGUA4cZTDbu38/mkFeukQPRMIFTM=;
 b=e723LxGUSnBJUZKD+SAFKgYItfVi7Yc+g21lCfTKEybdbCkxZXqhjkBOBw3++NwGdIzjz9qXilOnokqCxF/NJIG92eFrW9Gku/P2EcxrzqI2tKi/PY6oROvsnRISNuBLGKgIPSZM8eD3XvZHP8nQUeQSTyrQm4fVzT+8LNo0hRw=
Received: from SJ0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:a03:2ef::10)
 by DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 13:08:09 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::f5) by SJ0PR03CA0185.outlook.office365.com
 (2603:10b6:a03:2ef::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.20 via Frontend
 Transport; Thu, 6 Jun 2024 13:08:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 13:08:08 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 08:07:58 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 3/4] drm/sched: cleanup gpu_scheduler trace events
Date: Thu, 6 Jun 2024 15:06:24 +0200
Message-ID: <20240606130629.214827-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|DM6PR12MB4187:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf68ecd-ba78-4206-c6a6-08dc8629b607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|82310400017|36860700004|1800799015|7416005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NibOJyUduYnC237Fw/OWZHVCv5+QAhrKDM1apCGE0xBIRFaVLo/hx9phiHpV?=
 =?us-ascii?Q?I+qlJe/ywkPFw7SgqMtdVINzJYb0FwuJ1O/3bRrh9ttmUaLWrN8QzoC7nqo1?=
 =?us-ascii?Q?hxWnfg8kPUzVP5aL3rulfAR88Jx9OndgiWmzzdNwjnds2ZSfjGnJQPTtYZK+?=
 =?us-ascii?Q?Y4waSX1oXPmpobXkL/O/hZLcG3ValxHeYTQyQXNlI5xWWVj0LM8Uo/CR0bkR?=
 =?us-ascii?Q?NVNda483Z50xJCdkvYaTKrkXHwJNaLXc0/oRZUrJ117tbG1wt7SX/suTlI14?=
 =?us-ascii?Q?zVD6QEbQfx85uwzzOFLNMDRnfuVQVbudm5wkPfmYuUaXEXVbZetVnLGgtqjv?=
 =?us-ascii?Q?DZtkwgBX70z+gVr+e2tMJAwGVVi4jWHYCy0qrmbegRKBL88yGluHvXe7/A5O?=
 =?us-ascii?Q?mndaX8DVz3ORTwdbcmpxW34RXsqqKriuCJysbdl/mPzYo2ARnnX0Pf2W6/2h?=
 =?us-ascii?Q?iRo6BHPUHbW/NvefcI8cXpLos246LhHDUQAnY8CZ5gTWLU+wx4eHMXfxTuXW?=
 =?us-ascii?Q?uU51tM+leLj1mg4BgveLhLZPFBHJWEIrIm6LJ5zOxhCKT6ZlcX0id9w0QxL9?=
 =?us-ascii?Q?91TsW+/riUBeF2Y/zCVkYl2cWof0mI5ks9IZuCgjuGk5lWOZ6M8+4JiaNxeZ?=
 =?us-ascii?Q?LtRFcXGENH6kQMlQHlouVwunx22InD4T0M0tvHSMMvKu0NtjL1VMtxk0vmiD?=
 =?us-ascii?Q?m4gqUNjtVE+sxw276gn07KuVOjDXYB2dNsq1v1EZt0rE32hHz7hOM4P1fH2D?=
 =?us-ascii?Q?0Sqi9QbNWvVm1mJsJtLS5b/4KijazDlwwc5/NJpFuLuzpUQFAsehHBY8R/kA?=
 =?us-ascii?Q?hdHk9Fk5qL0RTKyv4ogbclhDZf76ZEWl4hhNraSUfikqewZjzFJm4gfaIf21?=
 =?us-ascii?Q?YoXP82UU0mClt9f/m2v4F1eKMGsdkMkN3NTqFMPhozlG7285WjjckfXvVCb4?=
 =?us-ascii?Q?KxSEvVs1nxfbaVACT0Qma3QMryxriYBZNNM8QrUtxT4MWNAavlhVL+rKH0Sc?=
 =?us-ascii?Q?XDqre3sMMQfrDbA7hI19Uq6Ih+i3R4LNXAjKiweWziHAuJyyQDWN4wmJUDH+?=
 =?us-ascii?Q?Nb7QRoTsWBxrLfVPTTkgeeGgJphJPkPTvV/ea8YaX/jDzP9b3e9xJsG0ZRI1?=
 =?us-ascii?Q?Brnow2Vf/s2eBCMl1UcqelMPi+hEwdj4toDvGNOazYM+LrVZSJb5jrGxBvVx?=
 =?us-ascii?Q?cV2n2LDgDvmwSjyI3j5X36wvezZWH/iJIBOuv7sMz7p2XY3S0aCirXgIjfSq?=
 =?us-ascii?Q?vZWaagN2PE4193aOnPH/L6lBoP1S14ZXNQFQI9M5gqinGLXiWnoGJA1RbxAh?=
 =?us-ascii?Q?DaZecLqQZ6k9xxrsNQzffKXSiA0HijRpOYXmTxCTBdx/U1nt/FBysAyZJsOT?=
 =?us-ascii?Q?2x+/adOJ7/AJh1nWayT/gwPFb1rNA3Y/v6NXyM5Ps0WY6ZvYRd3wOi38/DpB?=
 =?us-ascii?Q?AZVNlHXqhko=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400017)(36860700004)(1800799015)(7416005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 13:08:08.3636 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf68ecd-ba78-4206-c6a6-08dc8629b607
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187
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

Print identifiers instead of pointers:
* "fence=%p" is replaced by "fence=(context:%llu, seqno:%lld)" to have a
coherent way to print the fence. A possible follow up change would be
to use the same format in traces/../dma-fence.h.
* "entity=%p" is removed because the fence's context is already an
identifier of the job owner.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 0a19c121bda5..2d7f2252eb5d 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -58,9 +58,9 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 				   &sched_job->sched->credit_count);
 			   __entry->dev_index = sched_job->sched->dev->primary->index;
 			   ),
-	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __entry->entity, __entry->id,
-		      __entry->fence, __get_str(name),
+	    TP_printk("id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
+		      __entry->id,
+		      __entry->fence->context, __entry->fence->seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -72,9 +72,9 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
 DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
-	    TP_printk("dev_index=%d entity=%p id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __entry->dev_index, __entry->entity, __entry->id,
-		      __entry->fence, __get_str(name),
+	    TP_printk("dev_index=%d id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
+		      __entry->dev_index, __entry->id,
+		      __entry->fence->context, __entry->fence->seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -88,7 +88,8 @@ TRACE_EVENT(drm_sched_process_job,
 	    TP_fast_assign(
 		    __entry->fence = &fence->finished;
 		    ),
-	    TP_printk("fence=%p signaled", __entry->fence)
+	    TP_printk("fence=(context:%llu, seqno:%lld) signaled",
+		      __entry->fence->context, __entry->fence->seqno)
 );
 
 TRACE_EVENT(drm_sched_job_wait_dep,
@@ -96,23 +97,25 @@ TRACE_EVENT(drm_sched_job_wait_dep,
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
 			     __string(name, sched_job->sched->name)
+			     __field(uint64_t, fence_context)
 			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
-			     __field(unsigned, seqno)
+			     __field(uint64_t, seqno)
 			     ),
 
 	    TP_fast_assign(
 			   __assign_str(name);
+			   /* Store the hw exec fence context. */
+			   __entry->fence_context = sched_job->entity->fence_context + 1;
 			   __entry->id = sched_job->id;
 			   __entry->fence = fence;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
-	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
-		      __get_str(name), __entry->id,
-		      __entry->fence, __entry->ctx,
-		      __entry->seqno)
+	    TP_printk("job ring=%s, fence_context=%llu, id=%llu, depends fence=(context:%llu, seqno:%lld)",
+		      __get_str(name), __entry->fence_context, __entry->id,
+		      __entry->ctx, __entry->seqno)
 );
 
 #endif
-- 
2.40.1

