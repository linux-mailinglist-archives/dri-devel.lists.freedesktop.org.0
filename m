Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93822A23CAA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 12:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B8110EA69;
	Fri, 31 Jan 2025 11:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iJnTPNJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECA610EA69
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 11:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEMEGh/d7nDok/4+2u8l12k0bolwbvSX6gKaybsKZwipPjzKz/UlIgs61cS91J+N4su3Y+5A2G05Yqz+E7ziCZJmiB9+Z8h3bL25Q/ofsPDVL6RrD0PCjdUMCtpdRFUPxbJISFoXGs0hNEI7UBi8uzPsETMCM3SmZfFYwHzgt0o4YaBQdbI/UXGYFdTZf3qqUkdyrdoDcfs9na6DqviBD6TRqRAxbLS46M7pMgz/wY5eeYN1JXoDulgIcYGDkrnXLsQNfbCQCtFmKCrFrMxq7BiEhn1S7CJXxb3TF/kPCQMjIh1C+saB98nH0hjG+mCql0JeyawQgzWzf6fw+p8IwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwvyX2C6ss87REpadHgdl/uYANK5iqlmjjZHTvstluo=;
 b=bRbeMyMNdkMrOkSxzaRZBQl04ye98zhGZkai5xWtUMLFnLg2UuD1GSWasSzPYaKvDJiujEflBpzNb0LF8tvoYkhVo0kw4f6Wjul+NjJwy9+V8QkWE2WE9WESOa2wZaT8HtVxlEm1ChUmApvCK0VeLKrK54+nbORmHd4fEDaCqlD7Vg/uevcs3ycigYTpDAIiAbCGDqnwKXAe7Yz6/kcdJ3YtcyyP3/RbkwBQdzEZaNlengZAWEapTIJpdJ19NgFDWit/ckE2QkEH6MdRIacS6s8vhFxsAPQXjIZIdaN3JN/9Zs06w+qE3hh8zsOEkaGlJlDYjokI+Q4rbMlq57VQ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwvyX2C6ss87REpadHgdl/uYANK5iqlmjjZHTvstluo=;
 b=iJnTPNJ3yqxAW8k23EaNXcKOcYYAfYeleiLoCjb+DyJVX+6TSdUGO0K+UWnwiW9wrSi9B2OY7utlMUfOCg/9Ddw+h/6df96zxXhb5sjJGfzNeTr5I+0sS/Qc/k00n7r3xufr93FnFqAof269oPWs6Uls+FgLaKVhc6qoAXOTH1c=
Received: from BY3PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:39a::26)
 by PH7PR12MB5656.namprd12.prod.outlook.com (2603:10b6:510:13b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 31 Jan
 2025 11:05:11 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::76) by BY3PR03CA0021.outlook.office365.com
 (2603:10b6:a03:39a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Fri,
 31 Jan 2025 11:05:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 11:05:11 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 05:05:06 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <pstanner@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 3/7] drm/sched: add device name to the
 drm_sched_process_job event
Date: Fri, 31 Jan 2025 12:03:01 +0100
Message-ID: <20250131110328.706695-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|PH7PR12MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c86406d-b1ce-411a-e603-08dd41e72185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0gq30+WTofcUH0yVFh5OBNOvB9J013T3Esn9FFusAVQlf8t29bRuRtEBcwIX?=
 =?us-ascii?Q?BODg1h66A/BbphHDJ+tM9f4PbfJZkhPXNsnVjkTsveYmpM1L3rw/ESXv9MGv?=
 =?us-ascii?Q?ZBx3z6HcjCJHBKjw1SF58TxdgO8qqg4rvgnfdwsEegp/ZGXVhBSsR/xDOifc?=
 =?us-ascii?Q?6wgHs30aDeAmZk5YQ+orbBtxWjy5krz3EpwZULgAF6S03AJvEQwYQo3x6El/?=
 =?us-ascii?Q?Qc4oYe/GEJ0m92QZIhluuJXPYcsPNAM4OEmnZqBhdVry7JsLYrTSD+1/c+pe?=
 =?us-ascii?Q?LbJpkkdsB5tkunSodLKFIsejCPgNulXVqpcd9BgLc0F0uHXt6ye7aErWNIXG?=
 =?us-ascii?Q?AFizZSv1AFNcuLeOkSPm0TnLTX+aAxWbdEVuU226QkVZCUyNe9PVCYpiOssW?=
 =?us-ascii?Q?oREReX8bDzJJZ1u1qMSulP/hZxLYXNhu0bbYIAQ8ND4AQWvjsipR7t4O8gNJ?=
 =?us-ascii?Q?UjLmggmjSLSUrW6Hv1zsCB61BSyEzdT3LRQnC3V0SenFXqZi3cQ4cFk0QxzD?=
 =?us-ascii?Q?hDyl03EmfFb8MphUtKO0dNWi/caYkJi4hR9KvvZAwzJOvrMS8XR0UKrGdB59?=
 =?us-ascii?Q?JOATzfEHqIIqv1COBDenRU8aemCxthDQM2eKDyHQ9VyeN0FYN88jkHfHYCEl?=
 =?us-ascii?Q?Y5YtJULoYzBrGGMidEonpFfE29r58eZiKMjGJouSwVQDKDt8/PzKpgtByDr5?=
 =?us-ascii?Q?TONQd3qAjmTrIC11MrGwo/ZQx6Zj3OQAPblqMA9MboIJKbjJvWd8qHeUy7QA?=
 =?us-ascii?Q?sWNxFKtvYwcKKhD6/KTYMzhSFY725IU14IlnOperWlPzfoYOjsTgvQblE16C?=
 =?us-ascii?Q?fJ5HNIuo5GQfifxaJQmtguwhdOY3EEO10W+PJizKx2nZ2kZNltc2c0ZFrAqG?=
 =?us-ascii?Q?MEqiBc51Ob8eWQVOekk93ZQnKyZQwtHSqttoltsuCUKIMKC7BkXbnpTYUgfE?=
 =?us-ascii?Q?Nl52AnwC8Epmme4tawVUBWas5jFMqLyqLUCdTSi8ro49FZ2wR836tUZ2+qkY?=
 =?us-ascii?Q?kcwnwwikgkmnRTgzd90A6LhFsnqQlRVqiHX63L6sQTubWsDlA8RsQYtg77AB?=
 =?us-ascii?Q?0mk4KnJgXl4LL32HBZrig/bu0uCYUKF0nDloepXukNGhaqCisKx4L8tFj5VR?=
 =?us-ascii?Q?TbExbtoLPWmB4hjLRXRTmcErzgqRUGpIO5MVQDLNcE0U22xLAmxQ/jGC6NIn?=
 =?us-ascii?Q?UnTHRNleHsvcQuyJIsJZXM10huZnLT5qtRxWOwsp3nyE6lRYDpYnGi8sAraQ?=
 =?us-ascii?Q?pCTNVkVg5ogHWGIqFKx3d6oexxBL1/VlD25mkeDhUv5O0465unOR5IKh7svv?=
 =?us-ascii?Q?XJtpuGNzUcql+pd32Yd7hoe3TdtbyLfiM6NQcmmaHnPrq+vIlKnVALnyxdC8?=
 =?us-ascii?Q?9eOpyUxUoWIcpQal3MZgoPVSJenOZZwSAorCv4Pvzc6c6o872+ISZk1ZFkrv?=
 =?us-ascii?Q?OLe0cY/ROUR3Lv2zGb2lwF8vz/q+q/FO8Rgvjjeb9fhLgDbAd0H5Bq67sjRT?=
 =?us-ascii?Q?HMeq/jk+GTGDRSg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 11:05:11.0433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c86406d-b1ce-411a-e603-08dd41e72185
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5656
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

Since switching the scheduler from using kthreads to workqueues in
commit a6149f039369 ("drm/sched: Convert drm scheduler to use a work
queue rather than kthread") userspace applications cannot determine
the device from the PID of the threads sending the trace events
anymore.

Each queue had its own kthread which had a given PID for the whole
time. So, at least for amdgpu, it was possible to associate a PID
to the hardware queues of each GPU in the system. Then, when a
drm_run_job trace event was received by userspace, the source PID
allowed to associate it back to the correct GPU.

With workqueues this is not possible anymore, so the event needs to
contain the dev_name() to identify the device.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index c75302ca3427..c4ec28540656 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
+			     __string(dev, dev_name(sched_job->sched->dev))
 			     ),
 
 	    TP_fast_assign(
@@ -52,9 +53,10 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->credit_count);
+			   __assign_str(dev);
 			   ),
-	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __entry->entity, __entry->id,
+	    TP_printk("dev=%s, entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
+		      __get_str(dev), __entry->entity, __entry->id,
 		      __entry->fence, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
-- 
2.47.1

