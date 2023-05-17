Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4103707173
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 21:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863FC10E09D;
	Wed, 17 May 2023 19:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834BE10E09D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 19:04:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbZNcSHRq02UdcT6Plom/QPvCLThX7G854Cp/NelT7kRzrtONjGyY0UbdLxH4OlvACQUvtHgP0z8pDwckFhMQla2XmzRE+IP9/LAjg0vsedW+quplo3R6RMGapfaNebsl8yZpPx4Th9QG52FdeaxAXEUQhN4wYvjfJ9wMJkS1KMEU2bZ+6rMmuDCZsNZrUC0i/2RxvEcAD7UcwAa573N3DKr9pBlGe1vkRMzMDBFixA3b9GJ5l3ReAQrX5CWWVOaN1sNsarSiFQOkXLZzF8zcIdCR1/7CYykrFFqotfzZBhwzd8f4Du9QHsseLT3/U6ehIJos7Eg0eXyuD96PBWoBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPJJUmR81EUrooW1t8kd5MXzZe5SzeoaVAxfhdWbxFg=;
 b=ggcuuFCs0iPB89RyZRNaDlKdV5Fm+5UOOn8LKcnhqALWd4kBl/2qJ/oWlKQ3YxyuxbLoWetCtJqt/PENRRasYeaz3Ej0xq7Ogolk8jpZ9gaobFMGFkwKDLnV7WRZcyWS3cQYfMo9RLm+xAhVwvDMNb8sTwEY76hgh8MoFzp5dwrRC/w4CM1/bNPKghM0j7Ol7JpWLiUTL0t8Dr7iERQns5swieAvr1MZduPuuDMOF13C71Qdijpwx8hjiNslGxeZVurSullDj4m8qNW3CDTABH6Q95gWZrfF3uto/g2HKWmJuvyoAg9CxA6kurb8J1THvAZxtUys2q/zkQRwO4tQuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPJJUmR81EUrooW1t8kd5MXzZe5SzeoaVAxfhdWbxFg=;
 b=n41i6YUTrr/DmuCmZNQUShMyrGsUkddG64vtmH1ALpV/mMElv5fSBry+Wy3cFlaVAL+SHZCevWYZF7KzRf7Rh8jKUA1fGxLCXAtUp3d6dmbmjdjNNM3hw94hVBXH7vUsz2C1ScwT2+zV6Q3cdigsRGkbpOkDV8/Mxr8TlvWpvUo=
Received: from MW4P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::22)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 19:04:40 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::12) by MW4P221CA0017.outlook.office365.com
 (2603:10b6:303:8b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.35 via Frontend
 Transport; Wed, 17 May 2023 19:04:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.18 via Frontend Transport; Wed, 17 May 2023 19:04:40 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 17 May
 2023 14:04:35 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/sched: Rename to drm_sched_wakeup_if_canqueue()
Date: Wed, 17 May 2023 15:03:55 -0400
Message-ID: <20230517190356.349044-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517190356.349044-1-luben.tuikov@amd.com>
References: <20230517190356.349044-1-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.1
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT025:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: e97bd3e9-faa8-401d-95c6-08db570990fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: peerFk4wiOQD/bUwkQjxpOKpTPk8b3WR7jOR3XN+aOdWYAtuSvoeK5vmxzLZaoH4KwYBYZ86Pi+8AwsSVaxEoGqjqQE/6e8x/BnwvzN8QKB5O2SzcYL8rPu6I22qBDYHmdym1oXxodiupDnQWRxrroO56NTYDMxEYuKBgkExGlLyiZkFKtzn1FJhBDVo/JORMd7nEG+640yZ29mQCIEzycxPz+1EyPT+PmgoJzpk18nkpkSHLvSiyMQU4AKdP3LuathggYrsa6NS4YgGHYOXF6WP0xu7KZUyENxMLwRDT5xGs+Mn2osdkCr8o7AQ5rEEKZ8a5gP2A6bXutk+ix5LeXQDZwzgzE/6IRAmYIb84yrAYfdkfS7jLJFXufVjLd1SFpfGEwRA1Fh8pRoCgxVlb4SHFxOsDNY1so1dt3IsJKBdUHjN1aweCDBjnelclQxp9wYVRQ4nCt+HvmP5eFuj3Sqalu4jQBNYmhQS7be712kw4QlwYibyVcFc1yXSaBUb8i57Ew5AMTAqTVS4I4zpJCpZJF2/knRacv1DwbPJeSwP10qmIJG9l02NK6O389PfuedV0YRGreJyJWVVC5rLl3D6pG4CO/xNrpb0URZIUaqPntXLgE9Sy81vOhsmTU1UCO9Pjkw99uHsPln/rSkGd+UAxtnMlJyiXzmgDa7Z77gB9fSgX6oM2AUwQOYLgvwXdYCDHK68lgCKSZWvapCJbQRACSaIXtpZrwEeeqYV179QTX5JFWusH5/TCVwL6PfFloEFB2K4dZV75P3rh2Zfaw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(26005)(40460700003)(1076003)(426003)(83380400001)(336012)(82310400005)(36756003)(47076005)(40480700001)(36860700001)(2616005)(86362001)(81166007)(82740400003)(356005)(186003)(16526019)(66574015)(54906003)(44832011)(478600001)(316002)(2906002)(41300700001)(70586007)(6916009)(5660300002)(4326008)(8936002)(70206006)(8676002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 19:04:40.0223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e97bd3e9-faa8-401d-95c6-08db570990fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073
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

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 6 +++---
 include/drm/gpu_scheduler.h              | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index cfb433e9200586..371b44fb4bacf4 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -342,7 +342,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
+	drm_sched_wakeup_if_canqueue(entity->rq->sched);
 }
 
 /**
@@ -565,7 +565,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup(entity->rq->sched);
+		drm_sched_wakeup_if_canqueue(entity->rq->sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8739322c30321b..f437dbe62112cc 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -860,12 +860,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_wakeup - Wake up the scheduler when it is ready
- *
+ * drm_sched_wakeup_if_canqueue - Wake up the scheduler
  * @sched: scheduler instance
  *
+ * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup_if_canqueue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
 		wake_up_interruptible(&sched->wake_up_worker);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 31d1f5166c79fe..a05dd01e264842 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -549,7 +549,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
                                    unsigned int num_sched_list);
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup_if_canqueue(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
-- 
2.40.1

