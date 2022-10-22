Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CA608315
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 03:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0F310E69D;
	Sat, 22 Oct 2022 01:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2A610E69D
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 01:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdIdIoWczXQJW9nl2ioTHbqnoq6+HcnhGCLKE2C7mf8f1+t+CfejaD4h2X4NpSFjAUOxH8w71Wutl0CMj2IW/kdvjxM0SGn/9fdWe2Yj0MondKpW3GyT3ICFo7tzxnyvJFYoAJ/bncJvu+MB9Eq6s1m4LoRzSGZckMbwsUJ2dPvOnfPHMOQcAw81GOyJMzd4kqr+oJe6xsmEfvgiY/oFN4wUdkCRWQapdkzRJj4gXm6Uw6Ohzfpmt/QzUMv1B/NyFDKbk4J5p4xk56bArVo8XI4o4ZcfrT3cty8CM+4Sf/k50XWwRdLBjrRRAuLNtH/BY9h8yq/00+tOc4uvv/2/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqAw9Ivn19IMiFnLAbh5OngCr6GJIwexI3KdxKfSyRk=;
 b=dtKCNKS8ueJlzKO2nLLYdU9ZS9T448prQUksNNYnii7jl8dOvZGGKl3CyuNgT1bWk08Df2p7JL5IS8TL9kdytpAuPPAK1kqHUIP4RtY9R+sv6DYQUVlpBVD6Cj//Na9AgoicyzAQSZWnbZp0v3CP4Ej5AnFguDkc9jtofZS0OcCUGmQ/X18I9W2UMl0zaaUSbWQadOYnVmZVwCrcyF1qbXAFKvdxf9Czc759aJcFmShC9ylsvwUj/2YBqjEokNv77f1wW21FK8Hou/DcJzX43Wajgdgt3AiIS1hMN6ztts1J2EEib58zESKFVqhjXbkJlydpGBbjGLc352aPUVvdFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqAw9Ivn19IMiFnLAbh5OngCr6GJIwexI3KdxKfSyRk=;
 b=03qf0fdHFRvFHc1/QaouRl/X4c+mmw9EEV+tzqCAmbCchwUFkoivQUUg/DeUrFNljzNl6/Mg5kmO/KxNrqXPW1/h/u7Q2dIZnOsO0tU4ZQWcLLwFtMgQZu1SfJz4xI0Nn4dlm6sQ0ZMUr6nf6qygSwfD4IbFUJ4MvY0P2tI5xjs=
Received: from BL1P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::8)
 by CY8PR12MB7611.namprd12.prod.outlook.com (2603:10b6:930:9b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Sat, 22 Oct
 2022 01:21:24 +0000
Received: from BL02EPF0000C404.namprd05.prod.outlook.com
 (2603:10b6:208:2c7:cafe::f0) by BL1P222CA0003.outlook.office365.com
 (2603:10b6:208:2c7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Sat, 22 Oct 2022 01:21:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C404.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Sat, 22 Oct 2022 01:21:24 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 20:21:22 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v1] drm/scheduler: Set the FIFO scheduling policy as the
 default
Date: Fri, 21 Oct 2022 21:21:06 -0400
Message-ID: <20221022012106.96830-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C404:EE_|CY8PR12MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d03ccfe-3684-445d-b258-08dab3cbbc3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WKtFixntp2e2XAM0ZXvCOxiNxWfpYjbOxS5RJP8SsbC+BWRQcdaLfug1MYLOG39Ahk+2SWzls+TmxYrik95e9fpWx4Q06Lneqe3RFHKPVBekZHA/ivgxeEoKABUV3nw4mTZktUXa58ALFmlJoyzGN9EXdqFkp8YVj06Eh76/VuFQB1IcuEonUDIW2EYOnjRhSbfXv/kBo/g9E8of5ZEhKEUYTFDZ2yY9GItSzl+HkyJc4/lqJQLq0JUn3cUL6hEquxTV+1V1tNxQ1LJKXFnWeEjz1nnOGGw/duvYEI5CXN0/5E2e0GUUlksdxLF7S2ZcZ1tfKSncABvVq4Rr783uULRAbXmL73UrlijHDUEFdZzaqVlbZPN7mmc4Dyvcra2aGETc0J1oNvSVQlmygyEw1QYcYsKV85iLkI6q/lXeJ+tIxCZQ1/t3m1ha5rnbrNtZWIvgzga3l1oPZ9bmZI1mxbfqjc+3Zs5cJBRfo9gkT4St2xymx9fEFCYScgCwmXxRZ1SPnDER9A97O8Uz3XUsRgJB2bquYhtO+y14zK+bZlumM0OOTGWV7Pj9haeeCmMDA6upci5mvuSoogoJRvcnNTIUz1O5m4HsWrwvwJN+i/sn/AiaJk26KYf7tH7z0t6desCI/toWNU1D44Vsku5eRvjYtt/j8Sb2ZwCR+TTfAM75yRCIp33QhjpWLHoO76X81m/6l//FJsjT2NAUa+vgCz2qV1tMU7HccuGCqF5dhMEVJiHSDYTLJ/DuA/QrJ8ml/B9Cn2Eyv2lLq7NjXSa0wx1p0f1vXMB//WxOhSWsE1oetIU49tRIzIelqi/2wq/q
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(2616005)(26005)(54906003)(7696005)(478600001)(6916009)(70206006)(8676002)(70586007)(4326008)(44832011)(41300700001)(5660300002)(8936002)(6666004)(2906002)(356005)(81166007)(47076005)(82740400003)(36860700001)(82310400005)(16526019)(336012)(66574015)(426003)(83380400001)(316002)(40460700003)(186003)(1076003)(36756003)(40480700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 01:21:24.3901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d03ccfe-3684-445d-b258-08dab3cbbc3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C404.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7611
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The currently default Round-Robin GPU scheduling can result in starvation
of entities which have a large number of jobs, over entities which have
a very small number of jobs (single digit).

This can be illustrated in the following diagram, where jobs are
alphabetized to show their chronological order of arrival, where job A is
the oldest, B is the second oldest, and so on, to J, the most recent job to
arrive.

    ---> entities
j | H-F-----A--E--I--
o | --G-----B-----J--
b | --------C--------
s\/ --------D--------

WLOG, assuming all jobs are "ready", then a R-R scheduling will execute them
in the following order (a slice off of the top of the entities' list),

H, F, A, E, I, G, B, J, C, D.

However, to mitigate job starvation, we'd rather execute C and D before E,
and so on, given, of course, that they're all ready to be executed.

So, if all jobs are ready at this instant, the order of execution for this
and the next 9 instances of picking the next job to execute, should really
be,

A, B, C, D, E, F, G, H, I, J,

which is their chronological order. The only reason for this order to be
broken, is if an older job is not yet ready, but a younger job is ready, at
an instant of picking a new job to execute. For instance if job C wasn't
ready at time 2, but job D was ready, then we'd pick job D, like this:

0 +1 +2  ...
A, B, D, ...

And from then on, C would be preferred before all other jobs, if it is ready
at the time when a new job for execution is picked. So, if C became ready
two steps later, the execution order would look like this:

......0 +1 +2  ...
A, B, D, E, C, F, G, H, I, J

This is what the FIFO GPU scheduling algorithm achieves. It uses a
Red-Black tree to keep jobs sorted in chronological order, where picking
the oldest job is O(1) (we use the "cached" structure), and balancing the
tree is O(log n). IOW, it picks the *oldest ready* job to execute now.

The implementation is already in the kernel, and this commit only changes
the default GPU scheduling algorithm to use.

This was tested and achieves about 1% faster performance over the Round
Robin algorithm.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 2fab218d708279..d0ff9e11cb69fa 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -62,13 +62,13 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-int drm_sched_policy = DRM_SCHED_POLICY_RR;
+int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 
 /**
  * DOC: sched_policy (int)
  * Used to override default entities scheduling policy in a run queue.
  */
-MODULE_PARM_DESC(sched_policy, "Specify schedule policy for entities on a runqueue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin (default), " __stringify(DRM_SCHED_POLICY_FIFO) " = use FIFO.");
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
 module_param_named(sched_policy, drm_sched_policy, int, 0444);
 
 static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,

base-commit: 16d2a3f2ad1d2b95bf9122c910c63b0efe74179d
-- 
2.38.1

