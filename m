Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3983893BB28
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 05:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E71010E154;
	Thu, 25 Jul 2024 03:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0vhwJedi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BB910E154;
 Thu, 25 Jul 2024 03:21:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqSqvGlDJf4NOCA7stms0m6IfbOkWZrJcvmrdN/xFHE4lA0fZgcfO36QlSg0UNVbDtEJB5yVDTzyiMzLdAuWbjO3ddAlLbs8AmXkejHjyMDoOFHjREKUP5hycjOt2BnqI29LPKTGr2O+MmzNEWAPM7yE2ruumRjjirELi8ZVtHO1jub1aUcBeQEElYteHEr+F08ybiIrX7Bwke9TCqKdqEj+La7V/mO+j22VQ8fno5fIjymc+HYl8iEu8h6ZpMnSjAh0RvBCK870nJlEXUcwncyTRiDCDmQrCgmXDHW/Rh9xQgpdGEDnMITNrk9kigk88FHMuBphtJC+B7PL04t+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsFcw1cVxg02tLHM5f6SvNkSQdu02q3/povQypi0B0k=;
 b=ZrnuXnoL1lnooyRVwkx9eS8/31Kkk4r3vLOEfz1RXjrcWdmoOEEQKcaEDhD5yP4tYNGMk3auCbzsqEodHPqCS9lpQHyh5Q5QNBmf7KaGLt7Gis/zF1qrNsFxPekLXo38sVUGhZRKww6bHxv/kmMBz9AwNXEZZWJulDRsA/CKPNwwIg0Amk3eHn6JkqrIGjd1yIZw8iXVQ0Rc1J/JgP4qea43ffPuPnhSisNFyuXR72NW1pwh8GI26xr4lsKpO6kXPHKkdm2F7hEPc6j3fpehjZixxsihML/94iWcQChMP5vZ/as8mhMRp9MNyvl0o5+MudsmF9foFWTzbAcejR8dqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsFcw1cVxg02tLHM5f6SvNkSQdu02q3/povQypi0B0k=;
 b=0vhwJediwsXRRmvNfXJ14h2U4ZX8NQ7ubLinZfRhBxkATERCrygJWn6hsaq5dYvpoF7ouqi3+M3kav+XGfLBADcyJlgBsSPDfsQIXslZwqVT6q6RI83wadqMkTBMP65zz032HOSF5eBmn7OT9jx4sizxg2bJJMvTweBbLzWt9vQ=
Received: from CH0PR03CA0113.namprd03.prod.outlook.com (2603:10b6:610:cd::28)
 by SJ2PR12MB7894.namprd12.prod.outlook.com (2603:10b6:a03:4c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 25 Jul
 2024 03:21:24 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::44) by CH0PR03CA0113.outlook.office365.com
 (2603:10b6:610:cd::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Thu, 25 Jul 2024 03:21:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 03:21:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Jul
 2024 22:21:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Jul
 2024 22:21:21 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 24 Jul 2024 22:21:16 -0500
From: <vitaly.prosyak@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <jesse.zhang@amd.com>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH 1/2] drm/sched: Add error code parameter to drm_sched_start
Date: Wed, 24 Jul 2024 23:21:06 -0400
Message-ID: <20240725032106.513746-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|SJ2PR12MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: e3bc5b9b-6932-438f-3a98-08dcac58dcea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ny142+zwbVH+f9SXBUkNVCgK0h+tPqB3kmTiU39c9lm+Mqm/YH3yQI009gF4?=
 =?us-ascii?Q?uXGxJTb3rXmrm80mOoISWJZiAXijm4U4QABD0gDWwtQh8tRFLnY19apXtW0F?=
 =?us-ascii?Q?2e43dTdzK4hsCNaOwShzQ4vvmmOFj12yBvVv0U5DhP8AUHXZ1S4Kt05M0VB0?=
 =?us-ascii?Q?2ZSe4juVo5ZxjJvph50JOhu7uErTRcqnbbE/giyGBQJvZP5LIZvvT6DXI7N7?=
 =?us-ascii?Q?qoLsFhhAtxuSpw0kLQ3Es7Uj43Xm0WRXkEv4bRupX6rtrgYzAQBLu4D7rSwQ?=
 =?us-ascii?Q?uMEoaaMhYkur0uUESP85nBoCnxvaxISwATBFg+ugZ97/+7Nw2/SglERePojZ?=
 =?us-ascii?Q?QP6VJ9dhCFonqaghIPlaLRepr8hQqC6MyeGfIPyv9WyXvijheettm9HqrQbp?=
 =?us-ascii?Q?7CFH2AUOM5Dpyb0dKtK2skV4AxQWjKC0Y+DkLNl95jORTwUnX1VPYWAeFLIo?=
 =?us-ascii?Q?sxxeKmmGFUuURSsQuGQh+hSX8T4QBfpsVA65VMRn8vzRt29AwrC+KR+tniDf?=
 =?us-ascii?Q?i6uQYBVjx6+ljrN3CkmgiTk8gAl4F0Jyzrxx94WcpUx3i67+AfMZm8gQ+WHe?=
 =?us-ascii?Q?g7xaj7YonQmHE04H4wpdburB11c3hsTXLkh4o+X8G89OwzoqSw/1WtsgZdUa?=
 =?us-ascii?Q?UeGmyUQb6Z1dt27orRo4O8pIxACmgOEezuuGiijyyKDRaSuQyQc0O8iltpYP?=
 =?us-ascii?Q?FqDAOb+FXKUO9/QlGD3A6fyMGGHpZhJIIGF9i1YzUXuNw/J8xqU1TDsXE72S?=
 =?us-ascii?Q?GDpW/zdnzV4Aa5rgiGRxIutLyUfk4T90JBUoqbjR3zB9XrayElewuSfJR96p?=
 =?us-ascii?Q?nktUEXpgcEMSv2j246ETFiEgmWaj18nFIQakaSb4mUIeGRasziKEaDWlbn/u?=
 =?us-ascii?Q?44ynoxlYN0/Ea+w8Tf43UwAMfB2t+FDTvref+tbiSRxvgkBp4ednbadyGpwe?=
 =?us-ascii?Q?6VNbm7oKGQ9IgEZNE7igzyMfKS6wOro2zs57KqHDmm4Y4fHnXdDqkK0jeL7q?=
 =?us-ascii?Q?P9vuvUOPhKHFVaTUbHnqohhHfqomGlD8Ny/XVYHCTZ0CCeFKE/HR9vJDWyyM?=
 =?us-ascii?Q?+7FTS6hx+ZszeKZWXGT5fDlqM9mCBQuAaVzFvgsMYYWz8l9X4pEY6WLCEmtV?=
 =?us-ascii?Q?Hwso1rOVtJeYnGnbH5du/d/rkcZ+k7QxtfjX++Je9qdj+FRQiXRS1+CvK5eo?=
 =?us-ascii?Q?fMrT+BE1PisbCjhBq3lUzKeFvdumP8aMZQ/I5gRe65TAUjck0SvH1s2Vy+NW?=
 =?us-ascii?Q?EVusn5Zq6hx6se/lrTRrzxg/N7u/dxGv2/WohMv/phlFU0S0a0vrYfL2hA1h?=
 =?us-ascii?Q?E1tsiHpsuSbUKgoyBj3/ETi05mNgqOSEiR8dhC3jzPnZOU1m/oY0zPDnavg/?=
 =?us-ascii?Q?i95i++DHSvMsexmGQaEnLXdtgY+zqthliRHpVV6tsRb1ub34t5RZP23YqGWE?=
 =?us-ascii?Q?LF3BQWSjJr2kq2Uefi+93n273UQnFLTM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 03:21:24.1955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bc5b9b-6932-438f-3a98-08dcac58dcea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7894
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

The current implementation of drm_sched_start uses a hardcoded -ECANCELED to dispose of a job when
the parent/hw fence is NULL. This results in drm_sched_job_done being called with -ECANCELED for
each job with a NULL parent in the pending list, making it difficult to distinguish between recovery
methods, whether a queue reset or a full GPU reset was used.

To improve this, we first try a soft recovery for timeout jobs and use the error code -ENODATA.
If soft recovery fails, we proceed with a queue reset, where the error code remains -ENODATA for
the job. Finally, for a full GPU reset, we use error codes -ECANCELED or -ETIME. This patch adds
an error code parameter to drm_sched_start, allowing us to differentiate between queue reset and
GPU reset failures. This enables user mode and test applications to validate the expected
correctness of the requested operation. After a successful queue reset, the only way to continue
normal operation is to call drm_sched_job_done with the specific error code -ENODATA.

v1: Initial implementation by Jesse utilized amdgpu_device_lock_reset_domain and
    amdgpu_device_unlock_reset_domain to allow user mode to track the queue reset status and distinguish
    between queue reset and GPU reset.
v2: Christian suggested using the error codes -ENODATA for queue reset and -ECANCELED or -ETIME for GPU
    reset, returned to amdgpu_cs_wait_ioctl.
v3: To meet the requirements, we introduce a new function drm_sched_start_ex with an additional parameter
    to set dma_fence_set_error, allowing us to handle the specific error codes appropriately and dispose
    of bad jobs with the selected error code depending on whether it was a queue reset or GPU reset.
v4: Alex suggested using a new name, drm_sched_start_with_recovery_error, which more accurately describes
    the function's purpose. Additionally, it was recommended to add documentation details about the new method.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 30 +++++++++++++++++++++++---
 include/drm/gpu_scheduler.h            |  1 +
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..c42449358b3f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -671,13 +671,24 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 EXPORT_SYMBOL(drm_sched_stop);
 
 /**
- * drm_sched_start - recover jobs after a reset
+ * drm_sched_start_with_recovery_error - recover jobs after a reset with
+ * custom error
  *
  * @sched: scheduler instance
  * @full_recovery: proceed with complete sched restart
+ * @error : err code for set dma_fence_set_error
+ *
+ * Starts the scheduler and allows setting a custom dma_fence_set_error,
+ * which can be used to identify the recovery mechanism actually used.
  *
+ * For example:
+ * - If a soft or queue reset was used, dma_fence_set_error is set to -ENODATA.
+ * - If an entire GPU reset was used, the error code is set to -ECANCELED.
+ *
+ * This approach enables user mode and test applications to know which
+ * recovery method was used for a given bad job.
  */
-void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
+void drm_sched_start_with_recovery_error(struct drm_gpu_scheduler *sched, bool full_recovery, int error)
 {
 	struct drm_sched_job *s_job, *tmp;
 	int r;
@@ -704,7 +715,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
 		} else
-			drm_sched_job_done(s_job, -ECANCELED);
+			drm_sched_job_done(s_job, error);
 	}
 
 	if (full_recovery)
@@ -712,6 +723,19 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 
 	drm_sched_wqueue_start(sched);
 }
+EXPORT_SYMBOL(drm_sched_start_with_recovery_error);
+
+/**
+ * drm_sched_start - recover jobs after a reset
+ *
+ * @sched: scheduler instance
+ * @full_recovery: proceed with complete sched restart
+ *
+ */
+void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
+{
+	drm_sched_start_with_recovery_error(sched, full_recovery, -ECANCELED);
+}
 EXPORT_SYMBOL(drm_sched_start);
 
 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..444fa6761590 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -580,6 +580,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
+void drm_sched_start_ex(struct drm_gpu_scheduler *sched, bool full_recovery, int error);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
 void drm_sched_reset_karma(struct drm_sched_job *bad);
-- 
2.25.1

