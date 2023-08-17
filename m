Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D9077EFFF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 07:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1010E3E5;
	Thu, 17 Aug 2023 05:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A92F10E3E5;
 Thu, 17 Aug 2023 05:05:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVrT4RehNqWGDDduVtGIcm3yebiwRcVeed1R9qv/nYcKHxB47NUfrY9uHngvkIE3shxotwmCPN84MUo7+A1aAOlzbihc5+52TnjzI8e1pk1u4kAC9GtxRuH34+xDsKK6polvUw+/l7M+eWW9Pwf74x5LamzC8g0TdQHuKf4AGdd5+yly0mDB6GMg9eujU0zRd+IlO603JWw/lH0S2YhwaZQRXx4xc9Zxwr+j6dF6CnEEwi/cIsIJmCaHF6PGo5++Lszn+pAtMJtkgJvFnPxMBpb62IUCf+lthvhFM2jnB3oycwFc00xgDYQoq4VLVkKPFkhaya4Rr/i9NadSDYHweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38q0qXKgmYQot+LOTDLNxKr7r8yA606un8lZlYmu82k=;
 b=HXYDSzFgdvn9oPuHQxK4tUoiPfwmK02w/YwChXO/HhrMZ/gOeqiI5HSG5Z+TOnCXxf0p5zIodsIUDfR6Xot5soPaw2Pzrwsk01koe1RE98tft5E5ClZsevqjUdEBb2ERYbKiHdtDi1eWvmJ0G2VKTZAweNqs5x4FuyXuPXrc5rIq6afho/C4Pq9Rot+qDQE0B4Rf2pdFb3+/Ys8BYQTYe+bgYYLk/wHywuSbraZMk4NbH/FMxB8BA8brsK7geudtpyPROhEMDecdfF0o8iGpeP0H2tOshyZvqLeMVouz9kmAzCQxoIEnO+EwxIxWBtXkoIK6qVgHQ6SNAZmZFOFasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38q0qXKgmYQot+LOTDLNxKr7r8yA606un8lZlYmu82k=;
 b=Q+bfGzylRZIHp/m5HUy+OJKYdvmEeReJlZLnAhSUIDn27M4M7bn6JoTYY74+SgOyIL3m8LAuQNSTKeKGxMGTuWaeOGhV26HJpFi3Vq06E/ZLRr/4XTCj6bCkBwJwfixyq9RvJd115wlnBC1p3mIO+SAjzp++nl6Pbm5XsFho608=
Received: from SA0PR11CA0193.namprd11.prod.outlook.com (2603:10b6:806:1bc::18)
 by MW6PR12MB8664.namprd12.prod.outlook.com (2603:10b6:303:23c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 17 Aug
 2023 05:05:01 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:1bc:cafe::b3) by SA0PR11CA0193.outlook.office365.com
 (2603:10b6:806:1bc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 05:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 05:05:00 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 17 Aug
 2023 00:04:58 -0500
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/scheduler: Partially revert "drm/scheduler: track GPU
 active time per entity"
Date: Thu, 17 Aug 2023 13:04:35 +0800
Message-ID: <20230817050435.3109-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|MW6PR12MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 539e8594-9103-408e-c8bd-08db9edf82ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ah7x3AstYPm3PWyx1wxFoJOlZEjBRKDp0E3oWmtM3DemantLvdMWizbOEYb7BU8qp407KKd/Ly0kYfPuPUAtPuOqDS5USllD5EmJ0yrC3TUrUfnL//MdT+vXIRGwKIN3uTUICvF3dogF2mOSCuQJhCGit0E/hDPzmxOxhD04EqzygG181lddQ90mqaoOyi2KZq4rwJutW6l7yABdzkBZ/sWiwi5ZCMoO4kJbNJLyIpU26DpEp3oSxS3SaO4U6O8TIlqmh3fNd2Pw0r8C1/Wzf4ehvzXQ6n/V48h4+iGi+dcxnLm3trySGISHCd8XCJ3HbLYcmUOAzZ8XZWw21ke9ulsRXlIHzhTeGIg6f4byklJOC5cUeAe3KQ5AmxLet8kz2PcqfSvHVM6VuPJe0hEVtT2ldX/qNzZasEXDdDGgdFxR2Rgu9elv7+rKbWpm7aEdDpdl2yPmbwgNCo4t2GwpnqH9Avt5vRaJuazCvoE9eCIZ8iHTGpqCQ7S7OL4zuuaXnItvSODNmIX3NsmH6qA9S3q7gDg4WdeXylxO3WZSN9/5K81nd77lPvMfQdSJ4skFq+t7urNd4Y+7laQcGImR55jh+TK9d4oJVwdfkqV0o/RVCKw8nFFUScqW9eULTLngJvldFK8ZdLvOlhLiJb/xIOXZrHGr2LxgdJ25cdRITTBgtXigE1ZufSRvCyMmqkZouTCii7TTYYvBCbOPYW8eUJhnE6ZYO7scserL0QRXJKitjEqaI0lK0s1IrTWE/iPFTStABlPD1sCgPmbBpy2hQQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(1800799009)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(316002)(54906003)(82740400003)(356005)(6916009)(81166007)(70206006)(70586007)(5660300002)(41300700001)(36860700001)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(16526019)(40480700001)(336012)(478600001)(426003)(86362001)(7696005)(36756003)(6666004)(1076003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 05:05:00.9623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 539e8594-9103-408e-c8bd-08db9edf82ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8664
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
Cc: xinhui pan <xinhui.pan@amd.com>, dri-devel@lists.freedesktop.org,
 luben.tuikov@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch partially revert commit df622729ddbf ("drm/scheduler: track
GPU active time per entity") which touchs entity without any reference.

I notice there is one memory overwritten from gpu scheduler side.
The case is like below.
A(drm_sched_main)			B(vm fini)
drm_sched_job_begin			drm_sched_entity_kill
	//job in pending_list			wait_for_completion
complete_all				...
...					kfree entity
drm_sched_get_cleanup_job
	//fetch job from pending_list
	access job->entity //memory overwitten

As long as we can NOT guarantee entity is alive in this case, lets
revert it for now.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 602361c690c9..1b3f1a6a8514 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -907,12 +907,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 
 	spin_unlock(&sched->job_list_lock);
 
-	if (job) {
-		job->entity->elapsed_ns += ktime_to_ns(
-			ktime_sub(job->s_fence->finished.timestamp,
-				  job->s_fence->scheduled.timestamp));
-	}
-
 	return job;
 }
 
-- 
2.34.1

