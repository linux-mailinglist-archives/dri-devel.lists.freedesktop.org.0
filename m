Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3947C1F344
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 10:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313D10E904;
	Thu, 30 Oct 2025 09:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z59mExFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB4710E904
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:11:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inR3GhuJjo//q7e2OOWyZ8XIx3MleIhbEPCHF8Jbwq3ZIr4uUeBXXjNaiGVddvnSEp/HaGYvmsOO1GeZtZaam+X/Ic5hkB7Cv2zRsWXJEHm4yGQlOmoGgAnXBm9HcDqATSO88TtLupXdqFWK9PpO62jTJrpuAETW0uZ55JgZOZk6Ie/REcHQEMWvZNnDMXV8r9XHXH+ltFs+W12SAo2zWwMD1XEJC5SUe6K5FaAbBANFCsazTpE1GIkoKewUOk4C/aJDBsrcaedb/dfMBkPKiRdWx1ZhMUJdqxwGL68DS78NKztV4kkcqLSzzac+2JHkNnBZ6FXj5MrbOgw9liCMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTtzB6qFYPssviQz5CwXw2yzojtZkgbNlIInA9oZcB8=;
 b=Z46iXVeuW5yK8EsdsQi4dOxG3f8qhAVyDtyWUaEKgLbTcpYNMSD8FpLT4WF05xHlMrY6IVc+ds6n8J6U4OydF/xcZDBwwtYMBnZ52gQEGOGZXuKlHcfz3wCkqFX6+ptsnpl27oLNtDyCjc+vhoW/ytmi0wM47dnGsvw9oW8cPGK6oTWlXrfiRV+Km0KEUwFT6/8STMV5GIeGAwsW3Yu7Miv2DjxllUlX5151m0b6G7WLq8W5QdY2kYQaVLOfmOqP1/hOGPOu6ZUXltN3mVuYM+yReD3kOFdVbvV/XWGzXlqGD9MWQYa8OAV/1lB0XnokY1Q/PadVBENYfQdnb+7Wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTtzB6qFYPssviQz5CwXw2yzojtZkgbNlIInA9oZcB8=;
 b=z59mExFYxNyE6jD3owPqkouv/f9xtxwoESb2wEB6p9rClv1nlFPMIv1p3X2B7n68xE9jpGxX3zR8KgLcY3Lv5JqAHHskCl/epM1ttX9n0IJyY7Db4snLhlp7JyO3RXtsu1hvdIGGvQ1GyBplZ3U43lpojKR32nGknOX6IGaqfBw=
Received: from BL1PR13CA0107.namprd13.prod.outlook.com (2603:10b6:208:2b9::22)
 by LV2PR12MB5773.namprd12.prod.outlook.com (2603:10b6:408:17b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 09:11:47 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::ad) by BL1PR13CA0107.outlook.office365.com
 (2603:10b6:208:2b9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 09:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 09:11:46 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 30 Oct 2025 02:11:44 -0700
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] drm/sched: limit sched score update to jobs change
Date: Thu, 30 Oct 2025 10:11:13 +0100
Message-ID: <20251030091118.4864-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030091118.4864-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251030091118.4864-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|LV2PR12MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9ee6b6-d134-49d6-b31f-08de17945a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gIWPSBVzOHas31M6OeWoRuhWi6by0cUMflxkx5c/r9wpc84vWX+sRb235UhP?=
 =?us-ascii?Q?iFLHT1VIrJevxaiDHs6b1Zy8RVh/ERUKk1TtyYWWhPCo0qY0BjRXBre05N6V?=
 =?us-ascii?Q?tv0w1o3X7e8K/bH5SyY+JZ89mHVH9DaUL1egXRySd00yH8e+f82mbSP+vV0I?=
 =?us-ascii?Q?nj1Kmc4RVJ6J0asxNb9co91ZZqvx/Fg7EVuslTpNZrIP+YjpHw1K/ZE12Fbo?=
 =?us-ascii?Q?b5+WVia4V2FgyTNzaJYflw1ZvpktT0ArsyybRnZlQt+yNn5Pi2vWKoTMjfGp?=
 =?us-ascii?Q?JDoTIJYVbluOQYRVNw5gPv/zvjyvVoojzrMKwh105Dg1dS+j2JyBOuY0zqbn?=
 =?us-ascii?Q?Mb9pIZA3ZF9rLU/0pc9nef3wfWX5cpDUS0MdeiP5cAhZjEHMzE+DCMPuG6H+?=
 =?us-ascii?Q?M4cMmQ3MYJCzRdtJporPT0Apj/bI8djG0k4y2viVXpD+ut8sOEznHDGycKYT?=
 =?us-ascii?Q?8z/fLmu9imFIMFXr3wGy8R9OGyEye/KeEI7JrE4+O4hJIbzvN15L4sYjWgi9?=
 =?us-ascii?Q?GOgf3krbzOSml9PhR9stQlJdaiUTBAWwmU08kB/WFngDRWfi8zoE4CNHjMb6?=
 =?us-ascii?Q?u5DWZynTssENcco9/AqdF5OnbGwKNMWX231vJtUd4bFJyqBarpglDLugmUfY?=
 =?us-ascii?Q?mFQK1XEuA05WSMKzGYkfPGXtx/8XVRw8jvcOtKNcxpw72AvhN+LtZpbrzluA?=
 =?us-ascii?Q?dAUte/cEJkJwwGiDRzd9QA5fRyxwwEHHNzn1iv3YVTpxhjGea51HbcWmp3Ld?=
 =?us-ascii?Q?DMnkZ/7qas9bOPGlLB8RtW7m/F/gsiUpc4qEAkQMY85ikEyeJNmihW9BYCob?=
 =?us-ascii?Q?Vzip0rHMDwq4qu+E1YJE5BBs40+ucjKXYQ3HYg+YFtTb6YvNsV82epj7+4BF?=
 =?us-ascii?Q?Nl5uqI/QakPSwoqVlVHEfajO7cd67Fzzu9qS/WNFB1XlQMouKyTycsmUnmKo?=
 =?us-ascii?Q?fj2rsOoUifbx6EVJTKdm0I+in2Jtczie/dAnu9et4aNjsD0pdsLphZTiXXJD?=
 =?us-ascii?Q?4zhR8aSS8OMsTi9m9ffVaQmBioJlaeLMMXPHX6oy8bfCJMKtFgWJdw1X+gxE?=
 =?us-ascii?Q?pZA2pBcDH4VJW0NxkBbmXO/S/Suu6xp0jp8KXSp5qs4ritWVsodI2SVMEDUn?=
 =?us-ascii?Q?tbJBmAPYZRmpepFuW/USJYm2KuqO/pgGENqy7iYKh/DZ8uHW6j9xnJ00QvyQ?=
 =?us-ascii?Q?coA6j6vzEv8UlmtTmaf+M1nin1Kyh6mv7q5WEtyifcIUHcSGTeewfcYKlb2m?=
 =?us-ascii?Q?HvPoOyVUx3r0snv8sdIdxleoGnZWm2nI6vVYj/NHGOje3scFEe4lqEVz8h1S?=
 =?us-ascii?Q?IQDPAt8YUNg5R7aNWTQ5BQQqUQao5EevTCWRx0FNnnkt9qfMb3iSngrdGe1/?=
 =?us-ascii?Q?1ogJ0F/Srp6hF5H1AhKHvzUTBQ4oEkWnEK/jyvc4Kk2Y2ywafLw9cI0Wol6k?=
 =?us-ascii?Q?phvuj9PqAp0T3xmulOOrQcCMByIyQNhJDmQtyJ8MDTa+bf2HLZlr0YHFa3fh?=
 =?us-ascii?Q?8CW0QYzGSCKy5LU91IpuEqyiySsJ3OwOqAVcnk19ISuT/MiwUEJh0FcaL6gC?=
 =?us-ascii?Q?/IsYAQ7PuYV5fGUFaPk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 09:11:46.9082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9ee6b6-d134-49d6-b31f-08de17945a39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5773
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

Currently, the scheduler score is incremented when a job is pushed to an
entity and when an entity is attached to the scheduler.

This leads to some bad scheduling decision where the score value is
largely made of idle entities.

For instance, a scenario with 2 schedulers and where 10 entities submit
a single job, then do nothing, each scheduler will probably end up with
a score of 5.
Now, 5 userspace apps exit, so their entities will be dropped. In
the worst case, these apps' entities where all attached to the same
scheduler and we end up with score=5 (the 5 remaining entities) and
score=0, despite the 2 schedulers being idle.
When new entities show up, they will all select the second scheduler
based on its low score value, instead of alternating between the 2.

Some amdgpu rings depended on this feature, but the previous commit
implemented the same thing in amdgpu directly so it can be safely
removed from drm/sched.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Acked-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c39f0245e3a9..8a3d99a86090 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 	if (!list_empty(&entity->list))
 		return;
 
-	atomic_inc(rq->sched->score);
 	list_add_tail(&entity->list, &rq->entities);
 }
 
@@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 
 	spin_lock(&rq->lock);
 
-	atomic_dec(rq->sched->score);
 	list_del_init(&entity->list);
 
 	if (rq->current_entity == entity)
-- 
2.43.0

