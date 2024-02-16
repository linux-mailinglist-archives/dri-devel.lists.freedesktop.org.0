Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5089685805B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7303810E921;
	Fri, 16 Feb 2024 15:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Gb3SArz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2085.outbound.protection.outlook.com [40.107.102.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2921810E921;
 Fri, 16 Feb 2024 15:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRs8Ay8aC+C4MVbP91gu62CxtbEZiQpVgkprwOaIt4BtsDzvv7JgJQtCbyEYD3bIylrTTt2OujZQwn5cEqTOaZL/TVvi6JwzXScvkq7fvqBV7c/lI3KIxi8M79yTrG/A6CJ8XGk0KhoFSaywSAB54thcctx5x3yqxf0itICk6IPYZpapR9LWIBmk7sEWLd0Gfq+3tjrQjFWANBsdybwqJltVk/JebaXftQ0GZrs+7mIXgTsdnY3BvCj7Jy0/f4r413msQkPbWAHjDViqnhAXZF+xJ/tIMJTX/n9a5T3ad5zmKp1az55FR9bBcWYuFpukV+OOH0c/Z7A8328MkzUcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NizfhWzIYqyvLsqWaAZqleSlU2ZiOpRCsW7ECGyF5a4=;
 b=aU1+YYrh8vasJkJNk+2UHIDVzZNeBaTXtotRjrIx5WkzHtQ/EcoAhR4Ur3FKpw8YVwLnBdpmZuHyxXpoWEL8kJVCLT/H1HWjve+kkS3So3Jj6ETD3tuX/NwHBzzGJ6rWgsIlAKK6Vq5vk8gm5TUdESGfaHrr4AIX7Jnx0IOtgUjnca/F53NjjVF7tZHHaGFk7MTpAgkFJaQ1SBE/psMYqEDyprStcuB9nI/axixqmePWeLc+67evQT7QGP+BRgR27w9zavXuP2wL4NwVdIT/BOW9oa0g5x00sMeZtO4HrB+EWGGq1oaqzq2lmhCCRqFE47huR+xCZOfZcd6Gck1JrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NizfhWzIYqyvLsqWaAZqleSlU2ZiOpRCsW7ECGyF5a4=;
 b=4Gb3SArzdbPT/gR+Oo3Bw9g1pAXCF9/awA/cHAQZ9p+T5CKLJuqSSPrlqFOGH2uPTrimzSOtTjMG8AWxzqiXkBo78jQcPCaqnxK/IWd3aCj0SKcgmncYXFvesM4nqCAQ9drk4TcuAoARBRLCVQpBPmo3wFVG4VkVpyFqqCuBcrM=
Received: from BL1P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::33)
 by CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 15:13:36 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::e) by BL1P222CA0028.outlook.office365.com
 (2603:10b6:208:2c7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 15:13:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 15:13:36 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 09:13:33 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 8/8] drm/amdgpu: add devname to trace_amdgpu_sched_run_job
Date: Fri, 16 Feb 2024 16:09:57 +0100
Message-ID: <20240216151006.475077-9-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|CY5PR12MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: f02eb48e-4dfb-42d0-5cf5-08dc2f01d93c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9WH4+CinuhI97sf44nIt+e8KIJih/HvGLD2OiXj0+zNs5PWq3wb5a0s/qch5PzHx9hxBMEieKkv0SHu3zh9wqJko/uADO5TpcWsyrpTO4EE9XAn83QteKbppb9+BPR8S2dprp/D0wrKhIFQDHElGmPCA+hGtU5Qj58W5f6Ii9rSt2vfPmhodA0GqyCKWvc4trXRKxqe8SEcBXJ05x91Wf9b9tiVXXN0mPxMHgE19/VBkF8e1B5lryYhj1A+Hfjyx0dsq93GD/6S7jG7OQddbMaWwwLQhr9VHbsG7+Ka6novt/phk3Ru4Gqt3WckydJPfu1d6VTKQNT0w+Iqs518x5Y3N7q1qKuBgBMCsOct4eZRzm6k+/LnNrOtTvAcBbNr69aOj+dyw4aML+Gv0AnihWX+51O62LIX4Q/jQhWDsDgTVCW5TkUt1ZLSLA5veGr5pfZnmaOODrTBDId4qUtYxGW3RviGs2azgbGMt4EzI7rj3PD71MwFqdxrXptghKQKzK37LgK9EAhoDPYz0cnAKIC3xoVWaVb4JJPfCVjtAk5toufylFid3BkMH+FKtzI6pP+XtVpP4Z1wyKg7E6+iZol4z5L3+pM46dYZKOLZ/mdhPdggOlLgI0hjlDJNFa7LI+SMockuQKdwTj9YwYbLNf2DMbFrzsxVpJBX6bBJO6/s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(36860700004)(1800799012)(40470700004)(46966006)(70206006)(70586007)(5660300002)(8936002)(8676002)(2906002)(86362001)(81166007)(36756003)(356005)(82740400003)(921011)(1076003)(83380400001)(336012)(426003)(16526019)(26005)(2616005)(478600001)(7696005)(316002)(41300700001)(110136005)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:13:36.4914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f02eb48e-4dfb-42d0-5cf5-08dc2f01d93c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6369
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

With the move to work queues for the drm scheduler it becomes
impossible for a tool to match the events to the GPU.

Before this move, the event source was fixed (eg: gfx_0.0.0-598),
so even if the system had multiple GPUs with identical queue names
it was possible to map the events using the PID.

With work queues, the source is now something like: "kworker/u64:0-15248"
(and the PID isn't stable), so the "timeline=gfx_0.0.0" attribute
isn't enough in multi-GPU setups.

This commit adds a dev=devname attribute to resolve this issue.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 71a5cf37b472..657866a498f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -292,7 +292,7 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 	job = to_amdgpu_job(sched_job);
 	finished = &job->base.s_fence->finished;
 
-	trace_amdgpu_sched_run_job(job);
+	trace_amdgpu_sched_run_job(job, adev);
 
 	/* Skip job if VRAM is lost and never resubmit gangs */
 	if (job->generation != amdgpu_vm_generation(adev, job->vm) ||
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 3f18f570e5ac..1aea1b78747d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -202,8 +202,8 @@ TRACE_EVENT(amdgpu_cs_start,
 );
 
 TRACE_EVENT(amdgpu_sched_run_job,
-	    TP_PROTO(struct amdgpu_job *job),
-	    TP_ARGS(job),
+	    TP_PROTO(struct amdgpu_job *job, struct amdgpu_device *adev),
+	    TP_ARGS(job, adev),
 	    TP_STRUCT__entry(
 			     __field(uint64_t, sched_job_id)
 			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
@@ -211,6 +211,7 @@ TRACE_EVENT(amdgpu_sched_run_job,
 			     __field(unsigned int, seqno)
 			     __string(ring, to_amdgpu_ring(job->base.sched)->name)
 			     __field(u32, num_ibs)
+			     __string(dname, dev_name(adev->dev))
 			     ),
 
 	    TP_fast_assign(
@@ -220,10 +221,13 @@ TRACE_EVENT(amdgpu_sched_run_job,
 			   __entry->seqno = job->base.s_fence->finished.seqno;
 			   __assign_str(ring, to_amdgpu_ring(job->base.sched)->name);
 			   __entry->num_ibs = job->num_ibs;
+			   __assign_str(dname, dev_name(adev->dev));
 			   ),
-	    TP_printk("sched_job=%llu, timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
+	    TP_printk("sched_job=%llu, timeline=%s, context=%u, seqno=%u, "
+		      "ring_name=%s, num_ibs=%u, dev=%s",
 		      __entry->sched_job_id, __get_str(timeline), __entry->context,
-		      __entry->seqno, __get_str(ring), __entry->num_ibs)
+		      __entry->seqno, __get_str(ring), __entry->num_ibs, __get_str(dname))
+
 );
 
 
-- 
2.40.1

