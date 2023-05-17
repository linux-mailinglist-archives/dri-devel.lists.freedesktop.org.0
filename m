Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D93E70767E
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 01:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCFF10E2FD;
	Wed, 17 May 2023 23:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BDC10E2FD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 23:36:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKea02I5fPW7o6zF6Ul44UOQ0a249DjvAVUKNdtAU5tuLQZsMQfAn08fm9hUMuH4AV83TlZFQ4Lca4Jp+PbnDMAiIgzQfLb8jCQCkpFSqWs32MeFG6IW+6h47CGIp4QxUV4gBsT+auPp3CvdmGpFR+SPctuciDhA7iZR+/fmn5jQsz8PhNtK9BCgQeQtnT1FlvSP4JxgbphlPpFjkfEH7+coxKMZDM0qMHa2ogBNKBl3iE2+u4QKQRn6sXyh/N3X+xT1qZn859wT/GwRz0buqYAjHoiUii6i2qSMba4nRhXXR+LI2Q2i1ApS/OxZTwHc856+1og20M4sT/nO6FVCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wVF2RuHqdN8mKQ9Ls5+dMNlA/zaYBHuaSrOpwnpxqI=;
 b=hzVEf5CHCW3LH6MgxqKe4Brfmdo3WthlAQuQ5FXz9NOTmQfv/P9laV2WvRG1JFoIQXwFtu/WtVDado1O16yKaoryh4LUCiB5hWTNnYzAmkmH01k/HwAa4wZ31yob9P6SHgO5dyYKkNH/kzquUFHIlLOPNbsrLT/Vxkj6vIue3l5xdrbUh84La161cwBgE99Rp14wkEeVYNpu4Bof5rXKoiEPY+hinnUWBzNPMbEQyrZZ2lJc4crNMOeOrU+srR02g4ToKsc0pmZX3OhPdGOo/PCLKkWXNbTLB8a4c3bVyK4wX7qbvUXxNzYoXhgvwLCPlePe8Is+km2ivJXsZ055+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wVF2RuHqdN8mKQ9Ls5+dMNlA/zaYBHuaSrOpwnpxqI=;
 b=2QgbC/ST2JS/qlKPMR4x3K1VmpDn92gGDwuQUKEy7v2NFuRBHtN+e5J55R2ETsLvoA/laaQd/chhy2kYIT5DiW+T6M54QA3HhVI4Q3iTWi/55sDRYeWP7J5pk76/ftiqKkAB8zTAKfqiYzfu4H7DgJISaGXeJRKOnkmmxO/HG2Q=
Received: from DM6PR01CA0013.prod.exchangelabs.com (2603:10b6:5:296::18) by
 SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17; Wed, 17 May 2023 23:36:20 +0000
Received: from DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::3c) by DM6PR01CA0013.outlook.office365.com
 (2603:10b6:5:296::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17 via Frontend
 Transport; Wed, 17 May 2023 23:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT103.mail.protection.outlook.com (10.13.172.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Wed, 17 May 2023 23:36:19 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 17 May
 2023 18:36:19 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/sched: Rename to drm_sched_wakeup_if_can_queue()
Date: Wed, 17 May 2023 19:35:50 -0400
Message-ID: <20230517233550.377847-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517233550.377847-1-luben.tuikov@amd.com>
References: <20230517233550.377847-1-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.1
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT103:EE_|SA1PR12MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c957d0-1cf0-40e5-254c-08db572f846a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t7ABmsgWmdd3HvJcMvA0TLzxTVucXt8YYwoOvyXUUXTGCjTo6J2EQhHalvtMWZFXDrYMyjVBKYiXY8wXTXUIcR9A1QWy5TnA0GbymyWL6AoIWfp2KraEHmH0oF9XW+31CBPr09yb2vHk+Tf+EtVwU99r+oVRPCGUEPAFM2O8OXft1xplhKrXuxRczU9yt0wcrPyYnPnvwT1GoBEsOxmQNace9OFWpJJkkTtINdoz/rVgARDxJXd7M+Gc8Ba+UVx/+zNHc7w+v4ddrlTMs6mEm619bOh5z3AGpWVWJP2ICXeDyUh0fNoTK0/lJUktalH/wVnCDHDN64IV2JVa256aJNumgzeKfoJG6DgySA69G5IizdUNjq7sItCc0GP2sHDWgR2twsrw3NfTngUO3ZEyIKfNB3USlgB3Jc7Mg8er9dA3hIHlfG5EhLtGwQ5Y3WDipUIIEFFYAsJDBJnzi3rDwQrH0YVk2Q2qSjueWLf/Inu58gCU1GQsazRuNKHoFUXl7+nnx7/3+j+wfIn7BMIZh0fFLYKt0Ov/xR9metLluGnorleBmGtyNAhP3zwaUFYsg69kyAbk1sDqMK5365ldHmvK4cxFlegHdkBqjAjcsXQEbalDcUNj0q8cOYG7RbxPWkib7b1VZYoEj9wL2XyZFNWovs+CoLsNsVqmEOsMJJpz/tDE66zOMmM8NestSIe1BybyjNhSIAnE4MVgOv5na9B4i4q6IkneLmfFK/V8acG/VN94OxnvPR9kLll2UqiWzmRSR68BzS1Bo1nduCP/gQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(8936002)(8676002)(66574015)(5660300002)(44832011)(47076005)(83380400001)(36860700001)(16526019)(26005)(356005)(1076003)(81166007)(186003)(2616005)(426003)(86362001)(82740400003)(40460700003)(41300700001)(40480700001)(6666004)(82310400005)(70586007)(70206006)(336012)(6916009)(36756003)(478600001)(4326008)(316002)(2906002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 23:36:19.8904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c957d0-1cf0-40e5-254c-08db572f846a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8841
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

Rename drm_sched_wakeup() to drm_sched_wakeup_if_canqueue() since the former
is misleading, as it wakes up the GPU scheduler _only if_ more jobs can be
queued to the underlying hardware.

This distinction is important to make, since the wake conditional in the GPU
scheduler thread wakes up when other conditions are also true, e.g. when there
are jobs to be cleaned. For instance, a user might want to wake up the
scheduler only because there are more jobs to clean, but whether we can queue
more jobs is irrelevant.

v2: Separate "canqueue" to "can_queue". (Alex D.)

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 6 +++---
 include/drm/gpu_scheduler.h              | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index cfb433e9200586..68e807ae136ad8 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -342,7 +342,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
+	drm_sched_wakeup_if_can_queue(entity->rq->sched);
 }
 
 /**
@@ -565,7 +565,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup(entity->rq->sched);
+		drm_sched_wakeup_if_can_queue(entity->rq->sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8739322c30321b..b352227a605538 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -860,12 +860,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_wakeup - Wake up the scheduler when it is ready
- *
+ * drm_sched_wakeup_if_can_queue - Wake up the scheduler
  * @sched: scheduler instance
  *
+ * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
 		wake_up_interruptible(&sched->wake_up_worker);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 31d1f5166c79fe..e95b4837e5a373 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -549,7 +549,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
                                    unsigned int num_sched_list);
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
-- 
2.40.1

