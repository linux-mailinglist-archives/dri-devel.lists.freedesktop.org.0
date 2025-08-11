Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD38B20033
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2FB10E388;
	Mon, 11 Aug 2025 07:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ptgxPs9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2077.outbound.protection.outlook.com [40.107.96.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4DC10E38A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 07:21:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2R2spX86mCjQEuWkDaSvW8qlzP/7FEL6mLpH2gMY4Wl1d42KYpv3STNoYp6lgsdLSiN/0S5FBiSY2Ud+1T6DlHTfa5YMf7zpQJ80YdXaNjijipdEhvwD0sH6OMTc6tX237LfJwV79ac3duu4HiFcZDz4APJk1GpWOqU8kYC+Ps6NlGPKt/lUhRoTuPl1Jr0UkxguQbtyObec7ehujb2ifLqjU1Qx6wL2GE2+hxzIjxj7Y45K4abj2bI+xmPlK0cLj6IECsolACHFo0rLjLP8rf2x6+O3F37Mjv77V4lMAXe7dKoY89yH+Bh96J8jcu0UxLdTc9wfczCioz2zEyaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6DsNx8iZXgFvPi2tTx6Gbs+3nz4htGQaPQM2NIWQ6A=;
 b=zILf4+ExyW6AWfrTFH1ApbyDpSSEHlvRxtHtxW7Z0YEo2tTRj4zeqc6Lk1hg4/JqgRMSkUfW1yUBKm2wQLTsbcXTJFRz8wp9/TDqxSi5rj4nJhi26Y/qTXinam4oLWcFDJTa9s9GycKtPGGOwk+y0EiUC+aEVzKRs0vYF2dU9Wbb3gDx0Tm2m0uJ8kUiHfyTqrO4c42KQe1zfWWsHlNh7CMb36V4XYkmlrmy+PDu7l221yB0wYb9bajlNf+Q/ypPJy0Tpd9nl4flRplPq3pb/eccdca+OtvPnw5grEtw3QvdP3/ANMqtd3AxmrqH52EADWlWFYtz7X7hWEFRf8/HZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6DsNx8iZXgFvPi2tTx6Gbs+3nz4htGQaPQM2NIWQ6A=;
 b=ptgxPs9YqP9sgfJAvNbZXzUBmqCN13HMBT59FxjRmo9O3ItGkKclpGiPCvZvhlFnwu7d4Nk/oLxRlU3Hgku9Q/k49gIK/rcCuoypwvR7JKHf+1ywsKr34HwsEDiXGsdAPObi096ax9GjKGwjtVArepMZkjhfn9bwW5zHRVy3drk=
Received: from BN7PR02CA0034.namprd02.prod.outlook.com (2603:10b6:408:20::47)
 by SA5PPFB9BA66B77.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8df) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Mon, 11 Aug
 2025 07:21:05 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:20:cafe::52) by BN7PR02CA0034.outlook.office365.com
 (2603:10b6:408:20::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Mon,
 11 Aug 2025 07:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 07:21:05 +0000
Received: from amd-SYS-esther.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Aug
 2025 02:21:01 -0500
From: Liu01 Tong <Tong.Liu01@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <phasta@kernel.org>, <dakr@kernel.org>, <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <gang.ba@amd.com>, <matthew.schwartz@linux.dev>, <lin.cao@amd.com>, "Liu01
 Tong" <Tong.Liu01@amd.com>, "Lin . Cao" <lincao12@amd.com>
Subject: [PATCH] drm/amdgpu: fix task hang from failed job submission during
 process kill
Date: Mon, 11 Aug 2025 15:20:50 +0800
Message-ID: <20250811072050.3838241-1-Tong.Liu01@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|SA5PPFB9BA66B77:EE_
X-MS-Office365-Filtering-Correlation-Id: 438c0c75-7a45-45de-5f2a-08ddd8a7a253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2o8bE5BK82NeUvf66S0nMA/j5pO9JzxnyhNCAS0pTkKcOGRJmh4Dvd7Vtatg?=
 =?us-ascii?Q?yRZag52wYqdzWnMtDazDSJHDyXnZSkxCZoNzWNf+E5tpX/+4HESNqSIAdMvV?=
 =?us-ascii?Q?i5ftBQIN4krrNQd4BeYnbDBoKgoaLUvhBQM1d7ht4maYjIEZ53FDf62jy57k?=
 =?us-ascii?Q?nlyxorbGg5ju/m0/Pdqee0UQgb+X6iQrxA2imcvVUd/+vBw8KwP0ZY5O8GkB?=
 =?us-ascii?Q?YtEbhc1yQas1imbW5I/k5uuOGRcYJmXZC9VgVXkHAvZmLb0BBhGgnALvv8ou?=
 =?us-ascii?Q?xy5K2HSL6ArJOh1+WTqA7zFBPfHiIVOV6lr5/tcCB7aKwZYf1l3SqI434TPt?=
 =?us-ascii?Q?Ln3bMf9k/NEs18ZTRsMiUiiiwpqjK80nNeVvKUkyIHTPLfeESArJ/4+idz/9?=
 =?us-ascii?Q?MUTfGTrhrwCHJfS5hMXHakr3TWG8M79iGGSa7YVacwpnf5t5HlCK1mORNhF9?=
 =?us-ascii?Q?dPo+vTCRA/MX/z7x9bWXICnwCt+lexyZqS94ac2noeI/llrJphDi2mUdHRdj?=
 =?us-ascii?Q?ZvofNo3sAosvWmvJArRwz2oMcIKkCAwORsw3zQE0GgSoyuesLQvozzuPVkIe?=
 =?us-ascii?Q?Y7QQQvD58pG4V/2V5GfsG4hlDlP1V5+N/gYXkTodLKRuhQiiKhNNohS0zFWN?=
 =?us-ascii?Q?5EvfWhnQh7m8UZdVDVMgCsCzhosXjVIWvMc9PAilgT5SpHkhp2LzxC6Lxsvc?=
 =?us-ascii?Q?7enHF1PLb+Dcj+gGQTgDkKYdSUeuuvsb0q079YyBJN7a3nZqS3iM8b11KotR?=
 =?us-ascii?Q?rrGeCfqDpTb8NtKEkatUNTecZTIkvXvdkKr1aV/s32JtpqgtJUDIHNcVjB7i?=
 =?us-ascii?Q?gvIVzImrZrvuS0wXBPX8IHnCYjz2hUlHFlnPhOXCsisCTt7z1WjxVsEtNZVt?=
 =?us-ascii?Q?Uwy33+aYtDPGbfsFsZvxAnXbxMBvyKqw+Ujzpq/EUqXBioD9hfhnkaF15bWq?=
 =?us-ascii?Q?C60khb92k26BMVaEIprkGCPuWzjaFa1LYyptivU13ynuRM+EVV2ySkmjm1K3?=
 =?us-ascii?Q?PpP4MWucrsyGLAPNZ8ZYCJEHUkLVCwhIur7zpDikmPDhsSWhcubFronvkai+?=
 =?us-ascii?Q?zJP40yYKWX4uAnKHEDzQaoKmackS4laXX59S5TUTtlnSukkkwAda445QXlyS?=
 =?us-ascii?Q?slf3IQUoJSLkfDgnkpUcl7e7vO/+LlBQwgROyg84Oh8rCeMEkuPsqTDZ5M0q?=
 =?us-ascii?Q?MxS6+Z9aeWvQ61ln8b8g+V51o8Y9Qf9KaXXQ0rJLINVSPAPdD3OWYfnOIaEs?=
 =?us-ascii?Q?SEwYuWv41keyFzjcuSIb+yGnXyo3CAAye8/kMQJ7BByUcPJWsCh8RzqyRA6C?=
 =?us-ascii?Q?n3MXOeQ02tBKrZxGec0DVUrPDWaHyIwxnkCd6qhnmcMauPnHW5sxXrCUDxIx?=
 =?us-ascii?Q?WComlW3qsow+ix6eZiMnYFY2Cr7YGg8sEv7X/gKiOK7/HfVbKFFrcr3zcE97?=
 =?us-ascii?Q?NkyMDRrGEWZ2Klm0YzBZwdCThuNg7GqHxRzGlY8eFUcnm99YZ+0VR55cxTgw?=
 =?us-ascii?Q?5tohbWO8XCtcXQjQAP4QVLBucKUZSAWPMg1B?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 07:21:05.0561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 438c0c75-7a45-45de-5f2a-08ddd8a7a253
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB9BA66B77
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

During process kill, drm_sched_entity_flush() will kill the vm
entities. The following job submissions of this process will fail, and
the resources of these jobs have not been released, nor have the fences
been signalled, causing tasks to hang.

Fix by not doing job init when the entity is stopped. And when the job
is already submitted, free the job resource if the entity is stopped.

Signed-off-by: Liu01 Tong <Tong.Liu01@amd.com>
Signed-off-by: Lin.Cao <lincao12@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++------
 drivers/gpu/drm/scheduler/sched_main.c   |  5 +++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index ac678de7fe5e..1e744b2eb2db 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -570,6 +570,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	bool first;
 	ktime_t submit_ts;
 
+	if (entity->stopped) {
+		DRM_ERROR("Trying to push job to a killed entity\n");
+		INIT_WORK(&sched_job->work, drm_sched_entity_kill_jobs_work);
+		schedule_work(&sched_job->work);
+		return;
+	}
+
 	trace_drm_sched_job(sched_job, entity);
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
@@ -589,12 +596,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 		/* Add the entity to the run queue */
 		spin_lock(&entity->lock);
-		if (entity->stopped) {
-			spin_unlock(&entity->lock);
-
-			DRM_ERROR("Trying to push to a killed entity\n");
-			return;
-		}
 
 		rq = entity->rq;
 		sched = rq->sched;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index bfea608a7106..c15b17d9ffe3 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -795,6 +795,11 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		return -ENOENT;
 	}
 
+	if (unlikely(entity->stopped)) {
+		pr_err("*ERROR* %s: entity is stopped!\n", __func__);
+		return -EINVAL;
+	}
+
 	if (unlikely(!credits)) {
 		pr_err("*ERROR* %s: credits cannot be 0!\n", __func__);
 		return -EINVAL;
-- 
2.34.1

