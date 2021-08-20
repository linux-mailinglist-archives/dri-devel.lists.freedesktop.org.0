Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9773F281C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 10:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC7A6EA36;
	Fri, 20 Aug 2021 08:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472B16EA36;
 Fri, 20 Aug 2021 08:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arsqPO78tp7YdpJtngJKbVWVIyBrHIOGgl8FnAx5akBABx8MZTBnX6ju/zG2eiZVidIXGzxzFt/nopzV+UCOMaEcfyYvHms7/wh4MVR8iVewmDTfkNSU5uHq9qE82dEfeRLxpMvT2Cq6+vudSlI2zJij7g1JGQzGlLZwxZYLMoTDUFxF9cbhhsuHo5cCdXygigQar6RoviW7YhO1VBE2RXaS5ForUHoMboizugktg73bFgIzj6esYjdfV1ayP4seWDL0M4oWFbXp3y6SeCVV38CagRQCqVZ158X15pwMZCwMSLOT1eUqY6RkZXe7JR4i4jKDnR25vYthW6PaWYZkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w5wzHaJpQxxZkuFqUsOVcv7Xg932Rg07AvACravCZU=;
 b=V77kY8ajXH031XbTZUYyAheFUqc6nXjdA8jj6gdQzzza4mi7kUE9qlO5mEbSBXNnQYFxW+ECqMmUNwavQmBHEuK+l3VTPcZ/7QKDYBWNvkElA+7cbzzWRCnwHdh2MIgpaVIwWE50oivq2tLT3c/eE9ZnIppz+UliUv4lZP/MqdtB2ZuRy4O8LsJraxoedIaJfJ/hGtQ2vtd9kKoFlmN06kBVqtXnNMx04Dovd/t3qg9G+4ryDw6xGZs6i2ZhInZX/tV1JRfLI5ROWPKfc6NeNrPVPbHr22uUp5i09+GWNpnFDUg4WKla+iqJrc1nkS+vqLsL+pZU6VopHRjeioN0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w5wzHaJpQxxZkuFqUsOVcv7Xg932Rg07AvACravCZU=;
 b=Ue/mlncnnj+fBsm/MsWsMo+zjslPMMeCusjVaEItGpBAP+YfjNyuNwr4AMIGAGq2Bq1lRWKmPrqpW2PXXdyOKr09jBNcnPcMYDU7yS+xWePKLa4EeKO9XrfJikgyHN7bLLaepgD4wCjp1zTiqkQ4pUNLW4wrVEbf1uUsd7mm1tE=
Received: from MWHPR1601CA0011.namprd16.prod.outlook.com
 (2603:10b6:300:da::21) by CO6PR12MB5491.namprd12.prod.outlook.com
 (2603:10b6:303:13b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 08:08:17 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:da:cafe::9) by MWHPR1601CA0011.outlook.office365.com
 (2603:10b6:300:da::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 08:08:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 08:08:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 20 Aug
 2021 03:08:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 20 Aug
 2021 01:08:14 -0700
Received: from wayne-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 20 Aug 2021 03:08:12 -0500
From: Jingwen Chen <Jingwen.Chen2@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <monk.liu@amd.com>, <christian.koenig@amd.com>,
 <Andrey.Grodzovsky@amd.com>, <daniel@ffwll.ch>, Jingwen Chen
 <Jingwen.Chen2@amd.com>
Subject: [PATCH v3] Revert "drm/scheduler: Avoid accessing freed bad job."
Date: Fri, 20 Aug 2021 16:07:44 +0800
Message-ID: <20210820080743.1562116-1-Jingwen.Chen2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f40ec22-756c-48fc-8499-08d963b1aa58
X-MS-TrafficTypeDiagnostic: CO6PR12MB5491:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5491AC6A7D90698E7507CC6FB7C19@CO6PR12MB5491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: le/o5mSqlwmyxOjwV7T+1fCmGAh4qowkn7FpnF6yamexROC+TX6czj62Sjq8/0SwJFAOFsgEneg5iZtaN22KI9HXLlrd8mnPO4ShGLeV++QwTcHpFd7vE5X1aW9wyXpYM+7a/TR0+QJ7US8UTf/BCXNfhKOfefnHZFV4vfwpl80+0ljB2F6IEOLVK9BdCcGLkQQN3ZXvjdVQSpJISmgedKqEpbWjn/3XeJ2PNrG+U54FEWF/sxsi1/PqyFKsVVo5qnryxa7Hg3s7NU3kJZTvm9bP/1/+LBG2IaNdEGx+mXtT2rLVF9WjVZHcJ7h1ygwHZNQSlWXaF19T6EbAhh+9hnquVP2Ly27zsdDczlfqM/TTF5/9DmpsY+hyJeLu93v9NRa8NmGzjKgbhU7O9X+eu06lTOyPbQp69OSttqC++ITR9vexgg7pqrKIxZw+WvJ77zT1AllDifo8jzdhH84B6WreKJ/Ju4c3Bv5Fmiccv+hXKLmuUgAEs8cyEoK42DaggsnNcQhMRgQNtRI4SeGEpACzTU5ah/stafxhokBqVNeelT2B8vRGA4U1aC8qvZdw8iIfOc0CA0cvmWqwnR1ba4a7mDJqD7fkCjeTQR8G46sS6RVPtVbvwVsGm6sEHJeHZjlsrXeyaGJPdr7KsYtdCx3RSyiieWWnhHJLqCaGV8L+qaL/rGU3tDmaaRWabFXcGpLXWBom+ldX/YueG5N0wMbjkfpna+sNIM2eT9fZ/KAbFOlxGpO+I/j0dKtr2UCE2xoES2xbVPgC0aJ3/tf/pw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(2616005)(82740400003)(2906002)(81166007)(356005)(36756003)(47076005)(86362001)(54906003)(26005)(83380400001)(8676002)(7696005)(110136005)(478600001)(70586007)(70206006)(6666004)(426003)(336012)(82310400003)(1076003)(34020700004)(186003)(316002)(8936002)(5660300002)(4326008)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 08:08:16.6265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f40ec22-756c-48fc-8499-08d963b1aa58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5491
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

[Why]
for bailing job, this commit will delete it from pending list thus the
bailing job will never have a chance to be resubmitted even in advance
tdr mode.

[How]
after embeded hw_fence into amdgpu_job is done, the race condition that
this commit tries to work around is completely solved.So revert this
commit.
This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
v2:
add dma_fence_get/put() around timedout_job to avoid  concurrent delete
during processing timedout_job
v3:
park sched->thread instead during timedout_job.

Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a2a953693b45..c187fd3a6bb6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -319,17 +319,12 @@ static void drm_sched_job_timedout(struct work_struct *work)
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
 	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
+	kthread_park(sched->thread);
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 
 	if (job) {
-		/*
-		 * Remove the bad job so it cannot be freed by concurrent
-		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
-		 * is parked at which point it's safe.
-		 */
-		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
 
 		status = job->sched->ops->timedout_job(job);
@@ -345,6 +340,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 	} else {
 		spin_unlock(&sched->job_list_lock);
 	}
+	kthread_unpark(sched->thread);
 
 	if (status != DRM_GPU_SCHED_STAT_ENODEV) {
 		spin_lock(&sched->job_list_lock);
@@ -392,20 +388,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 
 	kthread_park(sched->thread);
 
-	/*
-	 * Reinsert back the bad job here - now it's safe as
-	 * drm_sched_get_cleanup_job cannot race against us and release the
-	 * bad job at this point - we parked (waited for) any in progress
-	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
-	 * now until the scheduler thread is unparked.
-	 */
-	if (bad && bad->sched == sched)
-		/*
-		 * Add at the head of the queue to reflect it was the earliest
-		 * job extracted.
-		 */
-		list_add(&bad->list, &sched->pending_list);
-
 	/*
 	 * Iterate the job list from later to  earlier one and either deactive
 	 * their HW callbacks or remove them from pending list if they already
-- 
2.25.1

