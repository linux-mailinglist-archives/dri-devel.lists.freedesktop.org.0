Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F59D707648
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 01:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADA610E2FE;
	Wed, 17 May 2023 23:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E4F10E2E6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 23:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcJKXQQISP1+5aL/Uox7ZFu/l/QpEGRtpiUS/C8tgMAsZL1AGPD+SXU4JKfqH+cKk7O5sXg1oElSKErK1UROqiGvJXbF313sNmNKY3gQOiomdkd393tnEaPxAxAS9kF0oyaySPDlvtaQ5USUSa5ezo8t5W2jl4BsvJDPEGyeso6rSqsilEEN4JBPcO1QfBwNCWRpJvJrbmBX/LlV/GKqt2ZXr2saoW34ZpBJg9ckfQr63d4wLt3c+n0iLqhL5BfA3bLE2vvDo4lSI+XRk3za7zYzypT94IfPUBvp7j15UEvxyBw0qkuzYb8Shpykmdpf4U8E7b51QvLWibNzNvpzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPJJUmR81EUrooW1t8kd5MXzZe5SzeoaVAxfhdWbxFg=;
 b=nngoZseR4NUozaOExabZUYRd4A3BodKzTMNDyUvleD7K4RUY5MhAOLM7cf53CD/uDLopXfjRF4M1b06L26NFkN3SmqYocbAHnFpa/tsId0OyPDoCTepY+UsFTtzZUtb1OUzXD8mabc0rGD7oTA7AGfKmhpWIt0LsUJiHfeJp753Dl8XmdvZmxWwb2wFBOi8LyA16rjU/zGMtwFU9D95x3yPirYhE9lNc1NU9qcnMvJ4kR2zvFY0BRWKldwyndC9GOWKfFvS669pWEdQW6u/vRsb3SHk4kaqcAyF31z2GELdGEKrVk1XyGTK23GfDwbiadjE44Jytq/Djx8iX9WOFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPJJUmR81EUrooW1t8kd5MXzZe5SzeoaVAxfhdWbxFg=;
 b=UbloITUP1lcYrX2TdRn8du+0fLaqycjo+/lYZ7bf9h7V8YvqXbcQ3AlGMW0zdqG0Sejkc14fWK2BcHXAPtmX7niI2EC8xjyNN1MvFwYSAnbk++7Dz/dOtZs7+N9C8Otj5zXW3mFZ6CJ4fSfrN9N/9uQZ+6EOhNRryoZy4mqpSbk=
Received: from MW4PR04CA0149.namprd04.prod.outlook.com (2603:10b6:303:84::34)
 by MW4PR12MB7482.namprd12.prod.outlook.com (2603:10b6:303:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 23:08:48 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::c6) by MW4PR04CA0149.outlook.office365.com
 (2603:10b6:303:84::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17 via Frontend
 Transport; Wed, 17 May 2023 23:08:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Wed, 17 May 2023 23:08:48 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 17 May
 2023 18:08:46 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/sched: Rename to drm_sched_wakeup_if_canqueue()
Date: Wed, 17 May 2023 19:08:20 -0400
Message-ID: <20230517230820.371572-3-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517230820.371572-1-luben.tuikov@amd.com>
References: <20230517230820.371572-1-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.1
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|MW4PR12MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 496fa16b-bd55-4ad8-038c-08db572bac07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gge2R3SCaISY7f2qsozDWkBHKOaY10tnoYZ+TpynKaY148dlHmmJWm/jmOketMxCHef3EyskfAiQYKBODQALHorglxiDW9IpsOzazD2r+JZrcezedvrh2jUI2XiHSHU53kRrTbaLZU+848okcYHxcs/hN0Lq6wTL8D+s5SaXEGDKKJXflfWfgwIXjHhgDtvLH2+ZATJDsrvyx5HbG31L17WKf3UqTwxLAl0JVoYlJ+AGA51OZa1T4OdAkSY9SP4B2j8NlKmBHVEdNztpRSoPLmrV/WEhKa/Era5N74HlRUqbFbyqXd4rFk2B/OgxQsWy9/j9biQthxL4y3W263OFu/znHbCgLrvcWgMG71J0LZNUl49/gtkS/Q0LrJsq9r+skxRYV/zAohHl+Z97sQp10YrMyL1gbZUiMC6W+7q7qaXUsWvigOd4/7JrtGslHUXv+0tP9sWYrk/UHtsATQAIdURfPKn7Oy9S2WOQyzerFHlnsJIsu+MsWZFy62VVMShq0ycrowyjbcyP0AH61qfouW6IJBQgjCmAvedv/euTfmHoFYOZiBgsXycRrsB9vaJ6XG3yGoiS8I/kyTG/uNavItzQzRf1KunZzOndy3jL5bOzYuIsZ4heze1IFRPRqR+WNfzXcVRrOJZ7xJt9OyBnVp75Xqx53GO+4wecWKP0wA0gHcjSV6NWWGwVcKnkeU7TVOSINo0fhOySDgMFcKE5nOs6n5DHb6N1KIY4+MmNDSJTVxalVfERPJrUGq1KZlkAdeM6tmeVoClWEaDcT0OzwA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(4326008)(70586007)(6916009)(478600001)(70206006)(86362001)(316002)(54906003)(36756003)(83380400001)(66574015)(47076005)(1076003)(26005)(16526019)(336012)(186003)(426003)(36860700001)(2616005)(5660300002)(8936002)(44832011)(41300700001)(8676002)(82740400003)(82310400005)(40480700001)(81166007)(2906002)(356005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 23:08:48.2845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 496fa16b-bd55-4ad8-038c-08db572bac07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7482
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

