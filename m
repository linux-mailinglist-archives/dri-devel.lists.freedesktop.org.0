Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B08C3FD06C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 02:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF40D6E042;
	Wed,  1 Sep 2021 00:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AED3898A7;
 Wed,  1 Sep 2021 00:46:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eG8RnNo5z/XTdaKOavgnCeH9PwrDbCUsWfxLlL9fGlcp9RqDEaR83ci443dTKG5yRV/5ITI+tmZaCJ/J+qZFb1VaIYr9dgG5S3zOyx5au2D+xzQthp4gPLbg/oFRmMHHE10QgyCBaAIYQ6S9YAInldTMeAt1raQenWf9E1FNSRmn7cfLShDuQ2qa+CrgODZiVbZyTb7NaE6HPHu4gpx8/Jn26rV8DojVc/Z6M0GCxO+LCDfYbMaSFqaI/laj+YyBhM1PnI/w3qsa7ketQqsqynYMdan+qPAoMj5qYFo/NU6XLvgSdM4zVMLaFTNDTBUA0R350IOACo6P5dxWmnLsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntmg9JFadsEkkzdZuIdnd5quzh65EWasqA9+fVv/UaM=;
 b=NHGz8rNLm7XdrZ6RKouul/2W8GhPhSiteYbswnjEQF1jO7TFJSFz/Utvau9bIB2YIcBrfntaykm10EEosKG+oxggHCLsHKNjymIuuzEUhj7YWEAgxE1Y8p8xeTlM+VScvJI01poD3KT4ydZ3u3rELU+KPV5OwsfspTuyT6giGiMWVIInOKbo+QXA1+Wmpldczn1LwGjiOQN9c6afCALcsGAWC/Br0JlF947ySn58NSvftnH72BqFWcXEZyEqkpSz2CVTmfu02g6LLbd/zLnKxodk2tGBiq67oCVRGoCD9gCjJZBH5jx3b5JSXFMxw86zKEIQAS2RRTh4sVmYkN8UDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntmg9JFadsEkkzdZuIdnd5quzh65EWasqA9+fVv/UaM=;
 b=STm5TwmxxkCl109W6zBbBpTbyABIT/Ewb6LAP+UckAy/VgtbnaJHLyvyZgd9aerQq9oY+qoHnHFswDoZIMzS2kXzyETIVaWQNzSRyGb56Rh2mQUtFGthWXC4vOgzy3tM59X/iXLwxB2QKi9mk1xw6BZiQfBVYYRaNJHRTM0Z5p4=
Received: from BN6PR11CA0016.namprd11.prod.outlook.com (2603:10b6:405:2::26)
 by CY4PR1201MB0166.namprd12.prod.outlook.com (2603:10b6:910:24::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 00:46:51 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::9b) by BN6PR11CA0016.outlook.office365.com
 (2603:10b6:405:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Wed, 1 Sep 2021 00:46:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 00:46:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 19:46:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 19:46:50 -0500
Received: from monk-build.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Tue, 31 Aug 2021 19:46:49 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Monk Liu <Monk.Liu@amd.com>
Subject: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
Date: Wed, 1 Sep 2021 08:46:46 +0800
Message-ID: <1630457207-13107-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 913dfe95-2cc6-4a29-971d-08d96ce1fc99
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0166:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB016646B8A2183E56F37E8D2384CD9@CY4PR1201MB0166.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oo47Tx0uUajQKnmR2g7NtRtit3EIvYjM3uXFX7YE+2k7YDiIxIGCGcbmOkBA4U2X4iOuB1AL/mXHTlwaWKWpLEpAxBAKy8zyw67m2++M6lmXo0x6id2eIYfieJq9+0wbwAR6dPTAAHdRvk0xcHgQHK2ac1yCkc2N3s6kTUTOsUAImQMjmLmTGOBHq16gs4MIKv1odYWEmHyugLSwhzwuHuUDfaMIXiyDzo8+/h5Ct3mDC/u26imcKpLKwumSYVAyxpwcNEaF4PnUc9qYapjjDyP7d9iND1EQKXmvofw77+aUPd9SMsaVpqY4izsoV4Ef/SwPrZwgnQajOem6llsbo6o/KXS7F1jmZtt1efwrhiEeiIWIE/MLLWYQ9mxZA1+TZt5DUObHuKjWFjxAbyTQKnSpQRPTpOrXfJklo3bCcOmvn7RbwIcAp56aDa5FQUUSSCV8QIvFPnB5IU7GTfw9mOby5+jYBSSdqgPv4TP1l9UtXM0ytIAgTmnxOHxC7lwbG1pI0TV6pAy8rHmdEXsdkX6by+RF4fWACtT3rY1oYtdi/H+N1QNB6r3KzW14GVKi6B5sS/r6876dccO/mryHKf6C29ExCUSsx4IiDhcZMtlQQExcgj161wBiEUAkAXgbYKyiHTqlqcuwAe27BmICZb10VOLLfCXJcluSc1PgdP4dJumQiFhoJc6Jht4bWeNmhu9IYuxjEfw1CqSGKL/+OeYLLdqE2fq3afcTYrVHG+g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(46966006)(36840700001)(86362001)(4326008)(83380400001)(36756003)(47076005)(82740400003)(2616005)(36860700001)(356005)(82310400003)(2906002)(81166007)(450100002)(54906003)(186003)(7696005)(5660300002)(70586007)(26005)(426003)(8676002)(6666004)(478600001)(316002)(8936002)(6916009)(336012)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 00:46:51.0571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 913dfe95-2cc6-4a29-971d-08d96ce1fc99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0166
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

issue:
in cleanup_job the cancle_delayed_work will cancel a TO timer
even the its corresponding job is still running.

fix:
do not cancel the timer in cleanup_job, instead do the cancelling
only when the heading job is signaled, and if there is a "next" job
we start_timeout again.

v2:
further cleanup the logic, and do the TDR timer cancelling if the signaled job
is the last one in its scheduler.

v3:
change the issue description
remove the cancel_delayed_work in the begining of the cleanup_job
recover the implement of drm_sched_job_begin.

v4:
remove the kthread_should_park() checking in cleanup_job routine,
we should cleanup the signaled job asap

TODO:
1)introduce pause/resume scheduler in job_timeout to serial the handling
of scheduler and job_timeout.
2)drop the bad job's del and insert in scheduler due to above serialization
(no race issue anymore with the serialization)

tested-by: jingwen <jingwen.chen@@amd.com>
Signed-off-by: Monk Liu <Monk.Liu@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a2a9536..3e0bbc7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job, *next;
 
-	/*
-	 * Don't destroy jobs while the timeout worker is running  OR thread
-	 * is being parked and hence assumed to not touch pending_list
-	 */
-	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
-	    !cancel_delayed_work(&sched->work_tdr)) ||
-	    kthread_should_park())
-		return NULL;
-
 	spin_lock(&sched->job_list_lock);
 
 	job = list_first_entry_or_null(&sched->pending_list,
@@ -693,17 +684,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
+
+		/* cancel this job's TO timer */
+		cancel_delayed_work(&sched->work_tdr);
 		/* make the scheduled timestamp more accurate */
 		next = list_first_entry_or_null(&sched->pending_list,
 						typeof(*next), list);
-		if (next)
+
+		if (next) {
 			next->s_fence->scheduled.timestamp =
 				job->s_fence->finished.timestamp;
-
+			/* start TO timer for next job */
+			drm_sched_start_timeout(sched);
+		}
 	} else {
 		job = NULL;
-		/* queue timeout for next job */
-		drm_sched_start_timeout(sched);
 	}
 
 	spin_unlock(&sched->job_list_lock);
@@ -791,11 +786,8 @@ static int drm_sched_main(void *param)
 					  (entity = drm_sched_select_entity(sched))) ||
 					 kthread_should_stop());
 
-		if (cleanup_job) {
+		if (cleanup_job)
 			sched->ops->free_job(cleanup_job);
-			/* queue timeout for next job */
-			drm_sched_start_timeout(sched);
-		}
 
 		if (!entity)
 			continue;
-- 
2.7.4

