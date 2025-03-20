Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75441A6A31F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38BC10E5B2;
	Thu, 20 Mar 2025 10:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ssBcZJYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3660F10E5B2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 09:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWx7idvIJbAP1KwtcPqfPtur6UJ7l+kwIsjvbnr4ooL+qZ569V5rB7Gl8GIgrY2Zm1cb1/KjWUYA1nO4d+X3auMPEVgBFwWp5LtqbkUBc/EHIv3G0Spn9foGpH6NgwUW8wYKh1TXvw15du5M74wtpJKERmWEsoRLBmb8a+wBHUluM1fDmIsUok8I1VbiacOlrP2qstwxEjOawIw8Zw6ZSiw5vUNV0rZqQmq9/tQrqYtolsfD3L5jE2T92/O1aSFLZ5lm6NsiWzrhY1xc63GF/sE41WlSUq1wXQkcvuw3KYr/3KHjESVU46QccXIJ8e4DeaNTEtvNu2ugJ7e5/RCUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GwW1gwtd0Ac6g63ryFVSSqjjw4F7gJa8exKTUx3eyY=;
 b=i8N6LBDaMADMhs21KSdKI9QR1bm6M0KROhOqRfpuF5hEUo6fqjqX9jr5FWHaJuL1Co2qAs62S07kqAFaPuYRGsUdvZBSL48VAvxj93QnOJ3VN6mYFtppsxrJvAIcbnIhLZR5Oq6Ibtrs9Vjn8Uez5Pae4MjZrshLd4T+oUNMOVeOKt16yFi3GoudiEiv9BVDsr1wYRzsRomCevf5q/Gjkj/el3HYsT0OctwOjB+E3dunvZELdbjVw00R5yTSsVPdhp+OVg7nYEvQGv3YSiCMg/ScALRP6E6l5TL4c825jyIbtoqwPcl80ozlWtIsWTFPbkmdgJEQQ413fjzewZDGAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GwW1gwtd0Ac6g63ryFVSSqjjw4F7gJa8exKTUx3eyY=;
 b=ssBcZJYA7Vr+Jpq6lyhlD3sQzQJTFmIrhvf4EMZW/iiRehrvMD3lea4avngYpGYkhBFCvwdctfsZz/89xASwuAKimMuJ7c9lzaYX5LRzEI/h/8hx3KVV9LTjhyM0Hzx13rSh1jfi25KkveNyEFLD8IDXhkPRQkFrg/Iql2koDtI=
Received: from BN9PR03CA0151.namprd03.prod.outlook.com (2603:10b6:408:f4::6)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Thu, 20 Mar 2025 09:59:56 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::c5) by BN9PR03CA0151.outlook.office365.com
 (2603:10b6:408:f4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 09:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 09:59:54 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 04:59:52 -0500
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
Subject: [PATCH v8 04/10] drm/sched: cleanup gpu_scheduler trace events
Date: Thu, 20 Mar 2025 10:58:00 +0100
Message-ID: <20250320095818.40622-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|DM4PR12MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a1335f-d8bc-4fe2-80fc-08dd6795f712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+fMQme0ZKlnxQcWe59koWMeuQSk+4nrEcZJi9GmKNoaOIZG1JEFqpUtEjz6g?=
 =?us-ascii?Q?C6fAyGHvCrm7aODtWFNkPTeBufrvm0AYkGyx2BNaC/VY1u3Fwe4Zjj+09Lzc?=
 =?us-ascii?Q?Zj/Tk61ZY/LucZAQIec63HJ/KncLi82UqDft0K8V4CsvULware4xxc+Hg1Mw?=
 =?us-ascii?Q?rFNjQ7dBEMpkGqFj8k+9uAqo/2CKsnQQ2g9C71rnec3ESijoABtx1k7lgEz/?=
 =?us-ascii?Q?W5PAYEMiMXtr4KM5yK6f3yNn2koNoPnJUC5CL18eR1kl+/xqg4qRx6n5SeMj?=
 =?us-ascii?Q?/P67oLLRI9ruz3TaeIwx5wAhRrOsvfmzi7syZ1EZ+DoRg6d5r/VK+MnXadit?=
 =?us-ascii?Q?GaMx4G92QGJbL7v8++ZM55qBBxC9azCRFxrGQT3bB36VzGcdnRl8d4wZFSvj?=
 =?us-ascii?Q?cGzIeyYCV1H+Z1lF/jcNdDtK2swQDzbMgL4qL7Qtr/9wbvhQcCH146VlIVpE?=
 =?us-ascii?Q?R08CRnCnWF865g7SPH4Rz6+xJlZDzPTs7dDRq/RZi9B+0US+Nvxk/BHjO0z3?=
 =?us-ascii?Q?afd+K5jIFFrgvvJxXfIlLdFXson3lC4uxRJYQOwr8Gy96G2sgxDVRHEDDKGl?=
 =?us-ascii?Q?zT19xd+JvberlxtbVliEYbIcBfRABXfyw+gWfFpuzyDptAdCKiVoOIIytnUp?=
 =?us-ascii?Q?5j+zG5X1SIptLCDqgrkPgG9gRk/NfWCXDG6Omz7p3qdvk2VuCndTk984Ju4V?=
 =?us-ascii?Q?n9Bvd52PKzi1Hn6c1xqLX3TlWxa9P7UC2BbzkWliDKv8FNHOx6QT0VK+PSfo?=
 =?us-ascii?Q?j4QAq5xdLGnFOlYh3V5G6IZzNwe7lejdrAHPo/AoMpy3iUYXCHedTOPVssT1?=
 =?us-ascii?Q?SiV/tG0y9WE3m5CvpEACowwb6/sdh55IarXimUsXOvYTdT38iLZ3nbmH0eXd?=
 =?us-ascii?Q?4c/+CXd4oDHB5UidmCBaCNPozvYpquoARCkblEXkk3MIoaapQ4Y163CtHMXm?=
 =?us-ascii?Q?G5hdkIrb0GHS2gK4kuiX8XBYKgmBryuIbVtEGpsCMEbeWXb+joZORwj7LZHp?=
 =?us-ascii?Q?BMzmQCNOl7vX25md89ydhTK4yZyddjp0bStTHMmIqFEjL3apBN3iBoPdFZcL?=
 =?us-ascii?Q?J6R97uZ2mj69HCO+T4B7Wm4Ok4liX5lUdYu7DYLzFu3xkuCAe2IAcbJi6MhU?=
 =?us-ascii?Q?Q8ipeneyQ/s+3u/FstOJ1vFP/2pfPuM/Hx/RILe6ZWm8k3vEMKonfiKiPHtg?=
 =?us-ascii?Q?+r5Qt0tHA1yR4bwT3kMKk0nQeao7Bd2eOofP9OwUvVH/R1CTqAJ8YnpkHwdt?=
 =?us-ascii?Q?4MrTvfZPyiwXVOKhbVIAKfdxJ0kd1lO7RLTeFc0VO4Zz2NDviC4s3DND82w6?=
 =?us-ascii?Q?pXTpKADYcb+NVBnmL4gdFmzVYvIO8sNjiwYxdK1dnoL1FrCq6E25aUu4r1os?=
 =?us-ascii?Q?705ZyhgS9F/irwDz7MmCu9PxS08drcBtPRnpDdl7olXuj2sV8b2y9I6hkk9g?=
 =?us-ascii?Q?Fr18+eUhyEAlSTtkL0FpRUPDXprLTdCX47k/AZz/VH5GlMJ7HYttLJskuz5i?=
 =?us-ascii?Q?O01okNrlVpw+3UCCciTc0MF+nXO/QnPPQuch?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 09:59:54.8982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a1335f-d8bc-4fe2-80fc-08dd6795f712
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745
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
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 45 ++++++++++---------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 713df3516a17..21a85ee59066 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -36,28 +36,29 @@ DECLARE_EVENT_CLASS(drm_sched_job,
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
+
 			   ),
-	    TP_printk("dev=%s, entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __get_str(dev), __entry->entity, __entry->id,
-		      __entry->fence, __get_str(name),
+	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
+		      __get_str(dev), __entry->id,
+		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -75,37 +76,39 @@ TRACE_EVENT(drm_sched_process_job,
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

