Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D73FC5AE
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 12:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7D689AA7;
	Tue, 31 Aug 2021 10:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF528959D;
 Tue, 31 Aug 2021 10:35:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjgS33G/ivS6F2ZiXS9akAU0RD1wo9z2PybQ9BvvP8Vlv5TYeJA7y2Y13geFcLeJKqefZadG/qEFZngJ7auO9s6UzJFDpLVyJ/6uOFCeqZWj1Eq+/W04aYfFv87iMmGEhV7YSXpTLKVT5IPHLWJrNNrJ+ZZxSkxUx5YeD/RXBhYlX4acLmd68+6cegRMf7RGM7TwXmEcXIgWJi74emMD+nl4/4Zcbl8Cp2X1vMQe6J2RQ2mxENMAiq41mAk8F3h2bZ/5WAFWO0jYXdt3fwirG7KqJGH5l/4aQGX0tNbuH3pCirVKYWDSQb59YNODM/wI4mVOWOY4iC/uwW/YM4nHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0nnQlA/+ptCDfrM4bLC6AXTZ2zZdzCPLYr3Gs3LTeQ=;
 b=NRCPA50xO/1MMBiiBoo5Z+qyN0D/8O46LaDNffDyQjjNB2s7n7jcyUU4piNjulMXgFmevf3w2EAgqkPjA789oHbnqSu1mw+gaY0aMGOzFwgS9jS7QIpHAMY+NGXbIW/0imoOyp29eQtxiTwHP8lZPlc9AMxhgblLwicfUThsq46nRt13jSf4ezkrX2pZdrJE3xnPOJuGyNyCH4tZuWhW73eYQkRIIzkSy40BKSnK1ujPt4cZMFm9BAEC6ewBIfLeoTHbUauz5k6jsKeALPXaO4HUI7eVIWPwHn9xkeDRlBrprfnVWx8Ef+qhhF+7Gs98CaJYinYsFWK7mBDNjPTq4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0nnQlA/+ptCDfrM4bLC6AXTZ2zZdzCPLYr3Gs3LTeQ=;
 b=wZE71mvA/b2E7+rjZ7x6+OTkefITSl27srSA64lZFSqiLLq7d2ryHPxSZWc0+IY/rcU9LbcFFltDNnEGFHikfsR03Vq/51HV4+EmKbUrQQYYs7IoXub5IHfceAndHznGtPU2XabY/A3sywQyLKm8I0253VLwz/gyN1qlRVOjKMU=
Received: from MW4PR03CA0320.namprd03.prod.outlook.com (2603:10b6:303:dd::25)
 by DM8PR12MB5479.namprd12.prod.outlook.com (2603:10b6:8:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 10:35:45 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::a9) by MW4PR03CA0320.outlook.office365.com
 (2603:10b6:303:dd::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 31 Aug 2021 10:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 10:35:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 05:35:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 05:35:43 -0500
Received: from monk-build.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Tue, 31 Aug 2021 05:35:42 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Monk Liu <Monk.Liu@amd.com>
Subject: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)
Date: Tue, 31 Aug 2021 18:35:38 +0800
Message-ID: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 358d1620-766e-460f-85cd-08d96c6b16c2
X-MS-TrafficTypeDiagnostic: DM8PR12MB5479:
X-Microsoft-Antispam-PRVS: <DM8PR12MB5479BC0B72E7A06647106BA284CC9@DM8PR12MB5479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mAFKZ5bDNJ3AEt+ZZ1WFiWfnkx90Oxsz1vpmML24lKxUyiNINFU/270qDUb8CLi8nFdjBYO9emwiIgswJx5T2ojU94J9C31SZm9rdpAt/7dCPU3LNvWPSqoYDAWhHxQWtT57xKuFdV3m0icBIVG993m80sQ6zIbZ589dgEfj9fV+P1BT8jK9JrzvYMhVK275UysTibWamX8ffCqCPnbA0MpGOrXyN3sg5FLjgb8CZpj2zXRIKQUR55tv2p3+s1YoZEfSXovTOxfTWIxF/0ClELYHGfg+qZii6x4a6+HfgHr59d/Guu6UpKOgLZQLXvy5jnKyqboptb9N2bM7s7TaxpJGLkPNwuCRjTDVlehdCsvgGYBB6gtbkUXU5IZtheLFvcTV4K61Wx0PPO/udjsVv75my1oBhGxz3SysoRYbdkGkw2k1jsXs/j+4u6vItfQlNEiFZqh5HJfXNlGnb/QiJ8fRQOP9LSu0WcUTWREP0MYqPlcjPOFiIYfPukUeu8iG9HKbaVNlmQdD4QqkuEmsvssvTebCM+rssmUiSSqPTnWcvheWUkEmfSdy6pP1yYnGsQ8b7NWB/ckoJjUPHWb7Xxh1icaoJvmmDl9FM/Np+3A2N/YOHI6Sk35Y/hiFvfmqduxZVGfocdGr5jLt0X6pz+Kel6R/rOsngo3enmyb0fIX/66CndJKw81Q+Dl1DIOaDr+WOX127ub/SBV6gaOdluNZWHGtUnmmG4pCx/aHd1M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(4326008)(450100002)(86362001)(82740400003)(316002)(8676002)(2616005)(54906003)(186003)(478600001)(36860700001)(47076005)(70586007)(82310400003)(6666004)(5660300002)(26005)(7696005)(70206006)(36756003)(83380400001)(336012)(426003)(6916009)(356005)(81166007)(8936002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 10:35:44.7164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 358d1620-766e-460f-85cd-08d96c6b16c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5479
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

TODO:
1)introduce pause/resume scheduler in job_timeout to serial the handling
of scheduler and job_timeout.
2)drop the bad job's del and insert in scheduler due to above serialization
(no race issue anymore with the serialization)

tested-by: jingwen <jingwen.chen@@amd.com>
Signed-off-by: Monk Liu <Monk.Liu@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a2a9536..ecf8140 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job, *next;
 
-	/*
-	 * Don't destroy jobs while the timeout worker is running  OR thread
-	 * is being parked and hence assumed to not touch pending_list
-	 */
-	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
-	    !cancel_delayed_work(&sched->work_tdr)) ||
-	    kthread_should_park())
+	if (kthread_should_park())
 		return NULL;
 
 	spin_lock(&sched->job_list_lock);
@@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
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
@@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
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

