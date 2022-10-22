Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE64660830F
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 03:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC52B10E12F;
	Sat, 22 Oct 2022 01:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B291710E12F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 01:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGLysB/O8Mp4YEffBvMIRSAqng+H2oa1ta2DIYRkKFZztvf2wgQ7NYBE1gjSN2Tr63FzLhs1gRdUfxySxea55fniAg/pEb1q4rSaSh3dKTuOnrcBM4fXoywi6BOqBJDOZsSaOjOdO/RQe9qQYleR09oYSrUH7kVbPLMqubIwm+NitLZJgy70oRB8JkpaF1YwtpmgSsNwxAg9RhZkKVwrH0cYmw3hMDYbczq9EEqUy4mrTOBX59oalxrpe8a0zJN4VnAiw4bzQyG4KeBr6DFCvZFlvTFpiBF5qjSlRTfL0dYKIWhJYriT86uPMxIUrmV0g+I1tyGYCMDVM7azCATEzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBM641GCeH+AZzA313WM2IsSiavolFYTz0aAiKQs3zE=;
 b=NfHCAAz8T81taAlMq2h7nxO7I7ygCrSIsnVDKEAFljr4hfklwcaGxWXR+wATIv3Nfz8X5DIBCXZKqr0allwZlePDt+FS4PtHkydqqI25jr7ry2Ny1YFHGr3UTiKDhmK+wzNypbfu3RppKIjulRLCUwFsHdQDiZML41YPpTQIt2U6a/1Bd8/YfL8P940+ID4eTFq53iP3OuTBXhDUnusoJSjvJFmCyU96fjTyyfn6UZKnfd7iEYY7RFQ+1P0rNd09BPXRw5S3Sf4ZDtXvDljQzzY3+UPL8vm39fZpJ1ajohGCvj67NpkbdwRKxIPw6Onwc7lZSYj8DMjae6gFl4PUIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBM641GCeH+AZzA313WM2IsSiavolFYTz0aAiKQs3zE=;
 b=ith4fmw7yld9Bomeu4jAKtGGs4liJAH6wZZGaFB1f5sdgPD9YUdmRDCduolvBNB2ECM3obHy9HB+Bn7TTnfrjY9dkISjd2/NdYTEJDqve+s4mHLQflygfUhQsdEngAs7b+1XPeaQrhWk4fhOIaeDD9n4nI/A91GEcMvdqLoDhxs=
Received: from BN9PR03CA0960.namprd03.prod.outlook.com (2603:10b6:408:108::35)
 by MN0PR12MB6080.namprd12.prod.outlook.com (2603:10b6:208:3c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Sat, 22 Oct
 2022 01:10:15 +0000
Received: from BL02EPF0000C406.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::f7) by BN9PR03CA0960.outlook.office365.com
 (2603:10b6:408:108::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Sat, 22 Oct 2022 01:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C406.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Sat, 22 Oct 2022 01:10:14 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 20:10:13 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH] drm/scheduler: Set the FIFO schedulig policy as the
 default
Date: Fri, 21 Oct 2022 21:09:45 -0400
Message-ID: <20221022010945.95560-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C406:EE_|MN0PR12MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b402e5-4836-48f5-473d-08dab3ca2d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mb+wWgqRqhl2d+Nzk2dXBurB7+h1AgsnMc/k9Yh29gboZXnKFs/aU2OrGdZDax9z7rP9bPJfjsiaHPN8x3JTSnU5t9QXM27JzL1mKtOqVe5OkFQMhiA0rB/IyYr2a4Go1WRJMtjMnF8tonHC5/C65eBmRSz63aG1b0Q1fGSHoBl5I0JnSWrUtyAXczx/jiKt2AMCvZupBWTKXUnbViHSzLsy/oehjy+cBMR3f7dy2jHnbSL7NUZxU6dd6/mHfZeRkeV+0YKWB27cZP0KREXPPeVtCHySJc3g+IqkkbSAMsp2t7pulwyAlMe1ZPLypKvPmvTQZBGLeq+rgPUACzMf7F52RGxAMCJ/plQP2XMXkozcjS9lyXpNhakm07wkOJH+R0MRN6XUBpyKgyvbbrpfz+GEbIFY92hYz89c+38NWDITNJyFWfVLCUjBmR009Qcmad/8QRdcwyaMTyDRjoEwdXpe2ZvgAnSktsN5ibLRYylhrX6yPOSxwAbtO8xXdBLYtw/DSe8S3BrEv35zpmRjbrNqqNvDuktq8np9bvYijNYi8mIbCjdlO4MNRpSU9kzh5CNuF0YYovwTeH8mcjdoVWEOe9QBJ6/Fe6WvqI7tmlrAZ4VXIMSGfXeFRb5fN6Ia7OwXpSMsGO/HgNBwmPPkNbh6vKobc9X1D8KjvpH9M937qHY1X1/CO2f1FnnX7VqwhaleZMU2W7QkBERi9nMExG/SajzroUBdU1qa7u9CELrc0P+tIvx6QP1HTtfcpBIFf1DEZPKuB8Uzp2LkBPBuTTVUxgxz2aaj5FMVlWJ9VDszFJ+jAe5RbiF0/cn3bjI8
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199015)(36840700001)(46966006)(40470700004)(8676002)(40480700001)(5660300002)(36756003)(44832011)(86362001)(41300700001)(82740400003)(4326008)(81166007)(26005)(2906002)(7696005)(356005)(6916009)(186003)(2616005)(6666004)(40460700003)(336012)(1076003)(82310400005)(16526019)(478600001)(54906003)(70206006)(36860700001)(70586007)(426003)(66574015)(47076005)(8936002)(83380400001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 01:10:14.9174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b402e5-4836-48f5-473d-08dab3ca2d36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C406.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6080
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

WLOG, asuming all jobs are "ready", then a R-R scheduling will execute them
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

The implemntation is already in the kernel, and this commit only changes
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

