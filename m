Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC71472125
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 07:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F9910EB59;
	Mon, 13 Dec 2021 06:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AF310EB4B;
 Mon, 13 Dec 2021 06:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqoC2MEAs8NAus/RETtTQVdfO2L/CeA4MJKFwm6DW79GPYECqQ4VqDFV94ydA0CS0idVRjslAdlH7bFcVz7o60nVIkaRqh0DRFjxJPwjeb6h79UqkNye6VXvNz0DBv/tMCLje5P/qDnxEXfQP+k8wV8x4qeHAc8NN5NBCARNSlmTvr2493wyTGHGpMHiTag45JGg6ijyR7VZHV5cxCuYGa0VMYuTh0gpVuFxClFpoS/cffPMMIZz6gbBfYLr6Ooz7e8Cg2j8+CAL2EWTaLI9qwjEZLUXSDpU+czAnWqWuy2GaOT/P4IC97d5o4NtjJCoCvhJdFVmE4Mm3H4s3k/UCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtvEoVgPwbQN7X83Mue1P5Z3FtzkaZmPb3gwvz6ceyM=;
 b=P9oC5ipaG9QDQ+2QHtVKIPYmcVVlVdgaiqgakB5ijCeXbGz2EFcKZY1ZRErJEC5ocvjyQNPHCbicKSjit/GqsqfT6+h4nutTlqOdlrunUUvLKxr5MjNsUujG54PZtf11SdcHjR+aEVOKLKHaIOkl0nJZrEN0l4ioEK32o+xRfU/Gv8q9ltXQxvk8VILH8szd8aY9XpuxHm5lRHCmF5KGOFcx95XSHnKBa7bV7QhTh193f7/R66jaAXuREHbNOq+tode7+ab9CltgGTKbOGFqYlXSLJ+97uvr0938pi1Yndxjj9Le4ZyoG/6+kKnkmvMTvF9bXhYgHMrKw6ox2h60yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtvEoVgPwbQN7X83Mue1P5Z3FtzkaZmPb3gwvz6ceyM=;
 b=W1UO/L7I7K1TC9wVRt//ZZIS+mJ9dq0cGk1J3a1hS94q/ia0ceQ0fHZ0WIwv1w5bEbYuvQ1TJ9a9Bcr7YG/r4rFt80rutuEwriYJfLG/YMTi7bwEFvXcS9n1J7mMOhUAuz8SPd0OZk5N3e+KLgvamb8M0j7a7GVTdZz5RSWgxAc=
Received: from DM6PR01CA0026.prod.exchangelabs.com (2603:10b6:5:296::31) by
 BYAPR12MB3142.namprd12.prod.outlook.com (2603:10b6:a03:de::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.16; Mon, 13 Dec 2021 06:35:05 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::60) by DM6PR01CA0026.outlook.office365.com
 (2603:10b6:5:296::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Mon, 13 Dec 2021 06:35:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Mon, 13 Dec 2021 06:35:04 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 00:35:01 -0600
From: Huang Rui <ray.huang@amd.com>
To: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>
Subject: [PATCH 3/3] drm: fix the warnning of string style for scheduler trace.
Date: Mon, 13 Dec 2021 14:34:22 +0800
Message-ID: <20211213063422.2232155-3-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213063422.2232155-1-ray.huang@amd.com>
References: <20211213063422.2232155-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23661121-62b1-495e-eef1-08d9be02b2ba
X-MS-TrafficTypeDiagnostic: BYAPR12MB3142:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB314288A427F0CDCBAEDED614EC749@BYAPR12MB3142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WdgqhyvUmWvnUxzNSHNIPHn1yZKE8RCbbvGZ3fSl+UpfNqxj5VgkCPv/M+Q15kReB/rrFWGncCwrZ/EMpiCl6o4WS09LkKpB6ST0NaFwQoernzZxuoz2noL6+JaEeTVhRPksr/7xhGc/qZySZWGfxuXNDR5SbJvt+e76PIqOPdjAhVpO6J5an842bI+96oiQkklL0hksoJpNVcm5i6E4LBYi5xxxhNzgMba7rP50RfmsjzoAZ1UtqBzEm7JlNVb/rynQn1GDCKSqHb3e/FpEb2E1hHo5TMeZUzcv5l1cZtcfJBsdzxIul+29jLmwst44jg7/QaecbJ49qavHiHFf+hyckyI/mmqCB/J2kcvoMMRilUhrO8xhJANHQZODaBgmFWZqEiMLS3yYCnZ7aBwGWLDmesOdoUdWJIQ8vDaKuFJEjeNET1tjHomnL27BgX2eQWJiyGYXvRmICO5E8TY896tV2UEJU/i2Z8suGosuPvZP+v9qykuUaw1hPVFiUpdvvsQPosITn7PWkdFPCMBxoV9LQIo8EauF9WpX/QidSS3qSj+UpusK5UxMF+X+/AfWfG6qhJiK2MPkze23YBPwjDGNjuJqgnyJprrspQNYqUu/QwUJzQK0UeYv4bni9SW65mYsomWebzfmYEO7QRZFDuVa4GnS4yyGeYw2ZEJ7cqvLWSEhZWmCxQZKfdVV0dxoDuZYXgdG0PkEIf/Cyk8HzXIWJYCnlI059XQPg5A9HzfkeRgL7JVd4pA5mnJSJfZEFb8lQWB8G5rhs+45FWqKKjgRuymXJpOWDS1Xg0iS94g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(26005)(70586007)(5660300002)(7696005)(8936002)(2906002)(86362001)(1076003)(336012)(8676002)(82310400004)(40460700001)(426003)(36860700001)(6666004)(4326008)(16526019)(70206006)(110136005)(83380400001)(186003)(508600001)(316002)(54906003)(36756003)(356005)(81166007)(47076005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 06:35:04.5880 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23661121-62b1-495e-eef1-08d9be02b2ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3142
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use __string(), __assign_str() and __get_str() helpers in the TRACE_EVENT()
instead of string definitions in gpu scheduler trace.

[  158.890890] ------------[ cut here ]------------
[  158.890899] fmt: 'entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d
               ' current_buffer: '            Xorg-1588    [001] .....   149.391136: drm_sched_job: entity=0000000076f0d517, id=1, fence=000000008dd56028, ring='
[  158.890910] WARNING: CPU: 6 PID: 1617 at kernel/trace/trace.c:3830 trace_check_vprintf+0x481/0x4a0

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 877ce9b127f1..4e397790c195 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -38,6 +38,7 @@ TRACE_EVENT(drm_sched_job,
 	    TP_STRUCT__entry(
 			     __field(struct drm_sched_entity *, entity)
 			     __field(struct dma_fence *, fence)
+			     __string(name, sched_job->sched->name)
 			     __field(const char *, name)
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
@@ -48,14 +49,14 @@ TRACE_EVENT(drm_sched_job,
 			   __entry->entity = entity;
 			   __entry->id = sched_job->id;
 			   __entry->fence = &sched_job->s_fence->finished;
-			   __entry->name = sched_job->sched->name;
+			   __assign_str(name, sched_job->sched->name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->hw_rq_count);
 			   ),
 	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
 		      __entry->entity, __entry->id,
-		      __entry->fence, __entry->name,
+		      __entry->fence, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -65,7 +66,7 @@ TRACE_EVENT(drm_run_job,
 	    TP_STRUCT__entry(
 			     __field(struct drm_sched_entity *, entity)
 			     __field(struct dma_fence *, fence)
-			     __field(const char *, name)
+			     __string(name, sched_job->sched->name)
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
@@ -75,14 +76,14 @@ TRACE_EVENT(drm_run_job,
 			   __entry->entity = entity;
 			   __entry->id = sched_job->id;
 			   __entry->fence = &sched_job->s_fence->finished;
-			   __entry->name = sched_job->sched->name;
+			   __assign_str(name, sched_job->sched->name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->hw_rq_count);
 			   ),
 	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
 		      __entry->entity, __entry->id,
-		      __entry->fence, __entry->name,
+		      __entry->fence, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -103,7 +104,7 @@ TRACE_EVENT(drm_sched_job_wait_dep,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
-			     __field(const char *,name)
+			     __string(name, sched_job->sched->name)
 			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
@@ -111,14 +112,14 @@ TRACE_EVENT(drm_sched_job_wait_dep,
 			     ),
 
 	    TP_fast_assign(
-			   __entry->name = sched_job->sched->name;
+			   __assign_str(name, sched_job->sched->name);
 			   __entry->id = sched_job->id;
 			   __entry->fence = fence;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
 	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
-		      __entry->name, __entry->id,
+		      __get_str(name), __entry->id,
 		      __entry->fence, __entry->ctx,
 		      __entry->seqno)
 );
-- 
2.25.1

