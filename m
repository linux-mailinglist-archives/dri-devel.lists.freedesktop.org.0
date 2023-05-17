Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FF2707646
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 01:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB3B10E2D7;
	Wed, 17 May 2023 23:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3557E10E2D7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 23:08:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ry55/88ZuZAWV7d7wssnUPBasODQ4dNMl3yDyBEp4IgiEs1JIDQkahG1Fg6C44PGuB8wdMBpEf3C8KKWKoxeqGLXTWcACtPjYj8zQhX80AVZaXQY/3xzIol2vGDWsWJVSMTQW9qTLqnB50bpfbppguKcvbo74fEQma2BNMswDhWHvbXI+NDpkbCe43yd3LU0ji3ptsya6ridG48ixfdBKnxW9BGbO/Q+ijxVPexJ+6ylmn5Tzaz8P0HdsHgVlYVxGytN4zdAxK1W+w/+TI4E83JzvmGekKZffrMDsxDDwJEXhp9oDkwlsssRSWholYqQ9JCfjIKjaMOD/pJqtaesVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFNkwrMt7ra/7tYiO9KrCGVdNId0HHkIobJUXuJg/aU=;
 b=Qw76t236JakjkuelcW2Y7o7DJGAnDdE2mTUi3fQazl8TRKIju5klgAcKcn5b5tiFOXDIzsZQd1UogL2O4GhRmwqp7q/WdfmoKpBve1coJnqHed/bRLvzzaJK3BdzxnDoUVaU6dJsMIWpdnaToFq12LaB0+WIPwivUJn2iFjXRCY4CVKJ8h8XH2R948CeD0aEeIeR6vOu2tKD+W5Cyt3316m+hRCEv0Oj4cxrgsEsPU2OwAmy0no0kuLHck7FanVA2FrmA7z3WVXtC/LiebkR6hF6dQRmWOE15G64/Gd7d2guCStQeL1ed+2gv9gD+yZm8OMiYuZ++DCDYbHFEOpljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFNkwrMt7ra/7tYiO9KrCGVdNId0HHkIobJUXuJg/aU=;
 b=wO5Lbzj41NtxJHHnlPSp+t0Z0FmxOd72PwpCrAHIthf5/zIfHI/8mFG+pSk6BMw2kR/0EoW2bHZqauCTh8u/15GTW9Q9hoZ4fYyZ7Td8JuNgYuMHlAWQWFca2OWN4O1Fn/5Oxa8UZznIuAzkxTU1MyTdyEVgXlJRUNgyBZed4ow=
Received: from MW4PR04CA0140.namprd04.prod.outlook.com (2603:10b6:303:84::25)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 23:08:47 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::9e) by MW4PR04CA0140.outlook.office365.com
 (2603:10b6:303:84::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18 via Frontend
 Transport; Wed, 17 May 2023 23:08:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Wed, 17 May 2023 23:08:46 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 17 May
 2023 18:08:45 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/sched: Rename to drm_sched_can_queue()
Date: Wed, 17 May 2023 19:08:18 -0400
Message-ID: <20230517230820.371572-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.1
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec48208-a528-43f7-7da2-08db572baad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCmyunuU4sTMO80u7a8rW/tdKVv0wb//2faTQ/QOLkgXuPZbP6uRt4y2fN+UHRDqRudL6vxarjpv6BkBfpcdTrZ8F4yFdDzT4xf4ZdFEjbGUZ3WX1maHwbEQxlrtt9G5DQIAKj0zuH0WwY/GfOEeL4+NifZ8PWnDGisJ7wMVGnQttFUyZMaTQmb3st/dd4Tk1Q9cMxg5L7r00jiJ5unE+X6/ixkzbVpc5GUkgUoV9vQDqdpS45SwYu/NeaQ0rSIANZSao3v1k9ppABzPfzBM/SDKnxXNmNvxkjjQ4vkpUBwW2YxDirZ61j52S1Ao/bcyObtSZbNUgdVnwRzoQrTPNprEgMsXGpfGM1qw62S5vv4GDLpBHa+f4PNzxyam/InYw1tNnWvBcpz/+O8Cp9in6C102ZAY+ENGdRbAwyNn+ggy3NAa6w5J30mLJfjlhddbajehuGcsStcQpJfdkkvkRAXJb6V2DLDhY6RatVYmd20G2sEKjeWJYp1HnWkJZ54aSMWVXXj4Zjgt+UsLkUu4SICHZnOn0V6CaTpzLfVuJmXtBN/tXBmSjPZoC2YgwZY0UDIqcmAyt9MuKrxh/JTHeT2uTyX5BlW2V1SYu0uZ4u4EAtuKePkwFSJQhcfY1lfX4kadD9gJ6nrz8XO2dPDT8QzZZ+hRgTaofLXpIrM9e66bPfoNWw8sPkF9Ag7kLfo8GVZ8sFNBqM2Htkgh3IjXqmmLFrU37RtyxZprHPEkZt+MttLVTU8xwRFyqcgJxnz7Wkosr9rak4dJWBoenyMmzw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(54906003)(41300700001)(6666004)(82740400003)(70586007)(70206006)(4326008)(6916009)(316002)(44832011)(8936002)(5660300002)(8676002)(478600001)(86362001)(26005)(1076003)(40460700003)(2906002)(16526019)(186003)(82310400005)(81166007)(66574015)(47076005)(356005)(2616005)(40480700001)(36756003)(83380400001)(336012)(36860700001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 23:08:46.2692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec48208-a528-43f7-7da2-08db572baad3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
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

Rename drm_sched_ready() to drm_sched_can_queue(). "ready" can mean many
things and is thus meaningless in this context. Instead, rename to a name
which precisely conveys what is being checked.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Reviewed-by: Alex Deucher <Alexander.Deucher@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 172e63c87bfcf3..8739322c30321b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -848,13 +848,12 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 EXPORT_SYMBOL(drm_sched_job_cleanup);
 
 /**
- * drm_sched_ready - is the scheduler ready
- *
+ * drm_sched_can_queue -- Can we queue more to the hardware?
  * @sched: scheduler instance
  *
  * Return true if we can push more jobs to the hw, otherwise false.
  */
-static bool drm_sched_ready(struct drm_gpu_scheduler *sched)
+static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 {
 	return atomic_read(&sched->hw_rq_count) <
 		sched->hw_submission_limit;
@@ -868,7 +867,7 @@ static bool drm_sched_ready(struct drm_gpu_scheduler *sched)
  */
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 {
-	if (drm_sched_ready(sched))
+	if (drm_sched_can_queue(sched))
 		wake_up_interruptible(&sched->wake_up_worker);
 }
 
@@ -885,7 +884,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *entity;
 	int i;
 
-	if (!drm_sched_ready(sched))
+	if (!drm_sched_can_queue(sched))
 		return NULL;
 
 	/* Kernel run queue has higher priority than normal run queue*/

base-commit: f47d6140b7a4c858d82d263e7577ff6fb5279a9c
-- 
2.40.1

