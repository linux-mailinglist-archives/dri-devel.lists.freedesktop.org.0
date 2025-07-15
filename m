Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C715AB05838
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 12:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3562910E209;
	Tue, 15 Jul 2025 10:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gvMIlb3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C358410E209
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 10:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xO6ZSK/tYvIP4h3K/SfuUy9sRdKZ/3rleB1/L6BArUgr8PChzIJQgmBeBhRZe4x2uGgjzshAZ9e//S37PtcnPCO+ORg3cWv5nMaQJSYMBN8YbxS9q67/cg0oYZ4IAEMCexGSCDfvaIb5XfOMetnb1RlXv88Q2JkszGb0SXzu7tTR5a3vCA3jER/Vjb71PZ5E1/W6P4kt4GfesBXWdBeLFQUFUo2OQTJ8H1VvSBoUYme5FBwCvApDiGERlFAdSEw6sos+n8hIw01cAT05zlL0QDYWK2YU/F53ML58mJiobom/SxkWGXFu8R4XCQX6y2MEYldVAkkGtj4kRPZgfHRhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRQr+HjRdXg7+zsUjezYLMJSpFNi0Qpd3SuVksoBYO8=;
 b=CUxdgqOaWlLl7T2JKclmZuRtsgpFVWt5adWvApt0z0ZwT1yqmsBUQV0uV+gBbEpIEK+0LzaXbpMjxyOlaNc8d7pV6qMIyxov9NTCAvvmabpf2I8IUzNTy9yeKgds1Inop7a17dARbe3++3CwB/M/mRRcKKzmGKMTDVN9f2k1jRqp/UekDtNsQXwZrb6vKqQpyHlDmqYQcfSgtm9wPPktx9WI2D7EOz0aJXF2ka5bomjVv7R6Bu4yUBUzdxCJPbtbYZ/7kXaycGTUhGDpqsbhOg4X3t8bJ2wGRj8gC0nickQcfZXEtLLb34LlsNw3/EIdQRQSPwqmNl6bNXW3aUG02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRQr+HjRdXg7+zsUjezYLMJSpFNi0Qpd3SuVksoBYO8=;
 b=gvMIlb3t5cxsL1HuBo0+4gffjkYVI97dx7HVHT6TZmMvfPTDkn4ABC+7IjU9JXIv2Z2vftOBUz8NuPgNFwjl1X0QrLFQDINgLAPF5MH7EMw4N9IckETW0JPoZuzVZSM4hySXYGy5tNWvjzG0AkKkJEWeXs0o70/yEGGomoAbw40=
Received: from DS7PR03CA0344.namprd03.prod.outlook.com (2603:10b6:8:55::28) by
 BL1PR12MB5708.namprd12.prod.outlook.com (2603:10b6:208:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 10:57:00 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:8:55:cafe::d2) by DS7PR03CA0344.outlook.office365.com
 (2603:10b6:8:55::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 10:57:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 10:56:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 05:56:58 -0500
Received: from lcaoubuntu-server.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 15 Jul 2025 05:56:56 -0500
From: Lin.Cao <lincao12@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <zhenguo.yin@amd.com>, <Emily.Deng@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <phasta@kernel.org>, <dakr@kernel.org>, <matthew.brost@intel.com>, Lin.Cao
 <lincao12@amd.com>
Subject: [PATCH v3] drm/sched: Wake up scheduler when killing jobs to prevent
 hang
Date: Tue, 15 Jul 2025 18:56:54 +0800
Message-ID: <20250715105654.700210-1-lincao12@amd.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lincao12@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|BL1PR12MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: b62d7034-6c94-41f2-0fc5-08ddc38e52dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SugtXI8fID+S/F05Gt+5RGYw15cNZY5vu1UHwmnZ/m51Ow/gjserXTzeyUzZ?=
 =?us-ascii?Q?sxoxHG9Y9/xuW8vFeTXteRRdPGGMO4YRvgbsMEd1cToQf4i1YU4KMczAWx17?=
 =?us-ascii?Q?vgXQ7ZiWDghf9sTFfHlmN81xLcb24IpLjGNTKWllPQ6osvCPbPnw02YbCvrR?=
 =?us-ascii?Q?M74vJHxQpq/r0WOTjyAHTYNgRYH7pSI8iBWOQhNvUTYFxnyl4/YOuS3cSoeO?=
 =?us-ascii?Q?stVbO1obG5b6QQpE4KCUq+1Dg5OdPTmUYcFMJ4JjBr6GRLMxBqjgKW2ibEUa?=
 =?us-ascii?Q?JSH+NvBup4Dlh9y4MNFjGWauv5mS0n5KY5H58cLaOf8FKiuRzk7FGkgwFYic?=
 =?us-ascii?Q?ZY6gw/QB6cA2uHj91L3gAQZQX8QaQLfwa5Lc47bYWFYs2FJh7w+nRSjq/1Qd?=
 =?us-ascii?Q?rCSaWpynI3uHPW14RGQM4WVlWK3PUkM0iGkakaQ+WFDGylW0zA308tL5tw68?=
 =?us-ascii?Q?ZVMu3eIyC3cGiYrxxmULHqUXZuRExgvT7nHdtkCD46PfZf6Mz/DYIOeFKCnH?=
 =?us-ascii?Q?WpelPoWoKpm513FOH1gehC9KuV/cFhIgdzJlczRgjP9ddXDUQl8h8THpk0Xt?=
 =?us-ascii?Q?A5zLnkVZNiIrhyDKkNJQi1Ypl/XWn6YBIeNq1ezmdzGLnXPo5axKllh1aEYS?=
 =?us-ascii?Q?gzbzpPCCwTY8wcGwNPBiZOa5+1hHv2YGlgzDXAkJC65rn6mpsRIIUuymuXFs?=
 =?us-ascii?Q?H7Ev73JFQN5EQhrBSapLLbsMDsPvqBpy4o+VAaw0qm9bNAmPIUCDXaJR0aVb?=
 =?us-ascii?Q?mS2sBLvidHSmNQhjpwvs7bCOTgrf07MrIPYs7KLovM3MEtw/bnQ1I3IZmyVb?=
 =?us-ascii?Q?ji0ml6u9aLnesB7bJw6FXI1qxFtlK/zp3cFUHNDEx4azUEJOULSzxxRVO/rc?=
 =?us-ascii?Q?gMbpwkMLIcXLfaJc5xu8vddWlT2DmvU8mmei7dXOlPlgU3CLAtxHPqgBCyww?=
 =?us-ascii?Q?pdXnUwVOgdPvNUUf98nobwz+gEtv9lSHPKIdYC7oxoSLfpHCs3Byqgn3vJnb?=
 =?us-ascii?Q?IGQs7ONOvRMfPUPv5CGJFuTMQq8NQHwrdHvRpAGmIDGDZZQM5Icx6Z7BMNRp?=
 =?us-ascii?Q?0lx9xHnVGzmr7/coBKV8w7g9ZCOB3i4YjR6wuAlMkc6ykZF4KLMp/zGatUlT?=
 =?us-ascii?Q?aymzusSCp5WUC7sXnbM+lkE3tT2rcYObWKd3j2J7ToEdNUaQBkW/R20hA5Ui?=
 =?us-ascii?Q?SmcEc8MCOwMxhNI3Wp7hUWDCCa69+E4p/7p6j/KcXOhFms0N3XsP/g+v/A2x?=
 =?us-ascii?Q?qkND0J+2lvSYa62QXhMo/V+M2lkHLQSZbmLhAwMr3GEfUlTaqB+KrEBW34Qo?=
 =?us-ascii?Q?6RnOOOKWq/xvdD90jOH5vfOcBYKn/KyVcnXSvgiX+CURe/tN9is6ur3XCvbh?=
 =?us-ascii?Q?OQ0yCMPaaYwga9/HBUp0s2BtIJdUz6HmbUUMSIRnEQLnw0Qt7e8B9vHdw5hn?=
 =?us-ascii?Q?AHpEo+bVI5qRkZy7JeEYlysiM2fLd8+7C+MOIFQL5qxaB8cZ7eNgM0ZFKCDU?=
 =?us-ascii?Q?zdduwYHNsjqI3imU5cQeWJ5vm23jNPVS76kV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:56:59.8529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b62d7034-6c94-41f2-0fc5-08ddc38e52dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5708
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

When application A submits jobs (a1, a2, a3) and application B submits
job b1 with a dependency on a2's scheduler fence, the normal execution
flow is:
1. a1 gets popped from the entity by the scheduler
2. run_job(a1) executes
3. a1's scheduled fence gets signaled
4. drm_sched_run_job_work() calls drm_sched_run_job_queue() at the end
5. The scheduler wakes up and re-selects entities to pop jobs
6. Since b1's dependency is cleared, scheduler can select b1 and continue

However, if application A is killed before a1 gets popped by the scheduler,
then a1, a2, a3 are killed sequentially by drm_sched_entity_kill_jobs_cb().
During the kill process, their scheduled fences are still signaled, but
the kill process itself lacks the work_run_job that would normally be
scheduled by drm_sched_run_job_work(). This means b1's dependency gets
cleared, but there's no work_run_job to drive the scheduler to continue
running, causing the scheduler to enter sleep state and application B to hang.

Add drm_sched_wakeup() in entity_kill_job_work() to prevent scheduler
sleep and subsequent application hangs.

v2:
- Move drm_sched_wakeup() to after drm_sched_fence_scheduled()

v3:
- Clarify the normal flow vs kill process comparison

Signed-off-by: Lin.Cao <lincao12@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index e671aa241720..66f2a43c58fd 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -177,6 +177,7 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
 	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
 
 	drm_sched_fence_scheduled(job->s_fence, NULL);
+	drm_sched_wakeup(job->sched);
 	drm_sched_fence_finished(job->s_fence, -ESRCH);
 	WARN_ON(job->s_fence->parent);
 	job->sched->ops->free_job(job);
-- 
2.46.1

