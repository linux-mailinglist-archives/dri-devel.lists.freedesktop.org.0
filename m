Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A23FD06F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 02:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9846E0F7;
	Wed,  1 Sep 2021 00:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE5B6E0F7;
 Wed,  1 Sep 2021 00:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ml/nBUS3YjBP5sfJUUJdB4cZpUa/h6zz34ZCYI1KVPb1W9VTSF03CE67KzcL8dJxzpoBzdYfH/Agu5ynvwfPGH51vxVwUGzJqpm8D8tZlPT0buo1UrjzWH/yVcg2mGdyqM50SwEnBbjYoWNPaySlVAwjXW9s/3CmP/+uDuVWvU9T/l3nfB0HhYFf9bNv0OMCTDQoL5RT4O2pRLtc44zppIoulG0HoDudNB5qOv7FeowN4USOkF03ryRiWAxmYm1lNhdrvWdY6aC+y4CoK9hKefFb1xLzf5wj5NuVq8elZ9iM5nFpI4W5DC6cGtsMjlaP725qeQgUejamgU6yxAhiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vI0QMkDR/5LooxrvJ54ekyY9qsIiLG4HQyIqmyriF2Y=;
 b=i9UVKL7Hjo/Y5f+wKwigzWeH0+H6OuuhoydNTtRPsV38eHnBofmO//INh1Omy4DTKQRaktCr4afFGm+kv4yBdclrPfTN0vQUvG2sW7arYrQrP+rMoGQnwiet9Tk4lPr2tMdhVpKUZIUc5lg9NQSQo1bF5EJabUSt684XT3ijdOjB1eXF3d7Uxwh40qYpZYQcw6Z5UKMkUaOJrcAe2W/n7hpF6ORaC3uEjnnGIeqtQAAl9SFy8i+Zmvn0VnGToTkmR2eMLr9ga9p6AcVWxPbhXhRXdtj69cYYvZdReb4Vo0+CQ+4lWVPeerQ7/cHHAkzOxbmd652JaG9N3uPsdQBW8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vI0QMkDR/5LooxrvJ54ekyY9qsIiLG4HQyIqmyriF2Y=;
 b=ElyV6/VKb8jTgQKiwngAxC1PIUx+MFNQUmuwqTGqbSp6uZI+NoUauNC/Kg0Hb130cppBSYNbaLjXhzbBgUns3QfbXvZ6eNs7whrj523TCk1JZG8bKGhoAAqoNjod4kH+L061atpb7tcNQws0EolWiSnO4rRofZcagW7N7BAVjtI=
Received: from BN9PR03CA0544.namprd03.prod.outlook.com (2603:10b6:408:138::9)
 by CH2PR12MB4229.namprd12.prod.outlook.com (2603:10b6:610:a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 00:46:57 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::2a) by BN9PR03CA0544.outlook.office365.com
 (2603:10b6:408:138::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Wed, 1 Sep 2021 00:46:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 00:46:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 19:46:52 -0500
Received: from monk-build.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Tue, 31 Aug 2021 19:46:50 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Monk Liu <Monk.Liu@amd.com>, "jingwen
 chen" <jingwen.chen@amd.com>
Subject: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Date: Wed, 1 Sep 2021 08:46:47 +0800
Message-ID: <1630457207-13107-2-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630457207-13107-1-git-send-email-Monk.Liu@amd.com>
References: <1630457207-13107-1-git-send-email-Monk.Liu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80c38126-eb33-4a59-ee13-08d96ce1ffe6
X-MS-TrafficTypeDiagnostic: CH2PR12MB4229:
X-Microsoft-Antispam-PRVS: <CH2PR12MB42290E8DE2CDB81556258F5A84CD9@CH2PR12MB4229.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQbBkwDFoiuo4tXqP8QAoe1FhnNgZe2LbjDFdc7gXjkn1CSFHjaQ3SxcgirjnAkkg0M+ci4b1zokLvM/crXGT8g5D9OloZsXOFCSYIl+sdrXwMCV369SsuYXjpOY1lt37NrQ+uOW1CtXbsKgmsly006ovXNRJycLXlyZ2dD3ibrXGJldEVhS1teara/IOpiG9D0zyjHmfPbywRBoSmG4T2B2ITPvZYnWdT5WYhocj0AJqK8oOtZGeKQjyy1GeYOQiaGYYjTkySO0yl38+TWseRxe4jRdQDacE8zB3CLKn4dWyvUIIwaIxZtDbMpk4XHRdeznLqwvmnO0Myv9Iv5M9ada6RajJi1h0z6/UFog9VXBypPDfgf3padBBVoG2W8VSwJnUpfg5zmlxXpvs9MJECq3TL7XGWFTzwOBakfKboln8I4qgcuh6xnCW/9Au7jL3hUrnM7Xp6xjmiHnJ80OBvyXIMN98cigefDRrwuyrporj9Ps20EGuGpCOLTtrHKXyZ5AvKevgpL2zi/4v0xRubWnwmWcm4YFc8UIsrLz4l/0DYcYF69OpS3bB7yggHhiGRP8i/2xLOMEgFfXtqmz97ibWoOgLJ2akx6Gymo4a+8vTHzxbjCU5ute4o+rIi18jg2Sn/3XPbMUrY+J6MWlUOEKKw9XAXGGkwiR6XAjYWy34EKZkEEQ6j1/scpfemCpNUrqok8vIHk/KXJ9+FVjK7GcshghDufkPMYmNb+w+eA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(36840700001)(46966006)(26005)(478600001)(2906002)(47076005)(83380400001)(356005)(81166007)(82310400003)(36860700001)(6666004)(7696005)(186003)(36756003)(426003)(70206006)(70586007)(82740400003)(2616005)(4326008)(54906003)(450100002)(316002)(86362001)(336012)(6916009)(8676002)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 00:46:56.5951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c38126-eb33-4a59-ee13-08d96ce1ffe6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229
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

tested-by: jingwen chen <jingwen.chen@amd.com>
Signed-off-by: Monk Liu <Monk.Liu@amd.com>
Signed-off-by: jingwen chen <jingwen.chen@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3e0bbc7..87d72e9 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
 	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
+	if (!__kthread_should_park(sched->thread))
+		kthread_park(sched->thread);
+
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
 
+		/* vendor's timeout_job should call drm_sched_start() */
 		status = job->sched->ops->timedout_job(job);
 
 		/*
@@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 	kthread_park(sched->thread);
 
 	/*
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
-	/*
 	 * Iterate the job list from later to  earlier one and either deactive
 	 * their HW callbacks or remove them from pending list if they already
 	 * signaled.
-- 
2.7.4

