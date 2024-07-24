Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5493B6F8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 20:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F54510E793;
	Wed, 24 Jul 2024 18:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ueOG8vI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F6D10E793;
 Wed, 24 Jul 2024 18:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9poGIgsoEefM1t+zEe26vrypusSsna4B6E8tLTcjh2Z5Q5mC0nG4lrLyPOGEYMbi2e9IoKASNqR4403Q+0mbQkrwIjTr1WG9ZkxYvdOcO8pIHrayphdwgAW5wekcHGCVV3/eI2wdJ7a+uVi/JglADaqmuvBjgXo2b0YpIaiYtMjbKGEPdrG6+16aeeaqWMUnc966xYp3YbqAwBoa6V6D5uyrtHQcyKH8nIQcPCNQPqqI57O86EsSXkVvO3Ytw2yHsW1lXJg2a8jPrPOUULCnj/DpHQy0MuoyC6pnbe4xoV5qh644zBUunNXaHhViBwf0/1n7EdLvOv16fVn8n5Nrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rk5qWaJZNWN8xtAjTzFfxLHue4Rw4Kv7fJly6VKyozM=;
 b=LTjrkP3lzbGmFuR9BnQldGcrXK5Q2SoUF/1QGhlRW1YhJtqb/JcQYPZ7OWNpMiUQ/6ogF59BF8GT89807INwlaZMTcho7MMN3kj0lzvLZ4ngl6WvmcX88g5mr7GWcmpSkoxt+EsMeD4Jk1Np2jWGFPGOoDy/lnjNMNSGULbapvDoqXQSQz2Xi6XEDDtRuseGeIHid7nyukptSi+4jV6p5TYdj7ohzAC7m2Vc6z8iil4UuaXyGPg6VPqcl0dWBpv+HAnZAGmnqHM//ljFfjV/jGZXjau+wvZ7056bsg8qY48BiJLeHk0awyTGtwVKhKYdw74zXNB2QGstk70zO30YMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rk5qWaJZNWN8xtAjTzFfxLHue4Rw4Kv7fJly6VKyozM=;
 b=ueOG8vI+axoT591jBab2mpCXtK5+SRr6mHGvp14iDMw4TF7S+xdvKyQFZdc+s6inUi7KpEQ/MJjmCLIIWGB2GFd/so0N9shQHS+Q49uHTanCieV6pGM268HyD/ZjGcyEicPaoS+FpitdJScYm6yrrDVtQ7ml/8DkjX/bcZdTkoU=
Received: from MW4PR03CA0007.namprd03.prod.outlook.com (2603:10b6:303:8f::12)
 by CY8PR12MB7339.namprd12.prod.outlook.com (2603:10b6:930:51::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 24 Jul
 2024 18:43:46 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:8f:cafe::dd) by MW4PR03CA0007.outlook.office365.com
 (2603:10b6:303:8f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Wed, 24 Jul 2024 18:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.11 via Frontend Transport; Wed, 24 Jul 2024 18:43:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Jul
 2024 13:43:44 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 24 Jul 2024 13:43:44 -0500
From: <vitaly.prosyak@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <jesse.zhang@amd.com>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH] drm/sched: Add error code parameter to drm_sched_start
Date: Wed, 24 Jul 2024 14:43:40 -0400
Message-ID: <20240724184340.183606-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|CY8PR12MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: d2433200-cbf9-4573-957d-08dcac108d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fqQawCugQNfcZKwiHXCSstQfjQ3hVbE79v8EqrsCvfUsXOVqJ4DO1skP21kr?=
 =?us-ascii?Q?wvQvK8+nqsnVQ2mNZr4jB6RqoTc+csRCGBGREu6r3bgGtw5cIYR+0tOOZTMu?=
 =?us-ascii?Q?Cgjzj/W/FMS9kglZk3hkkkyP5ZwJCsRT5ucfazg5MKyLZcKW8Zi3Jd0g8vzL?=
 =?us-ascii?Q?LD2Y6ZwvULcg4UFIVlGch6QpLjODPMgxUXKQvj+E9TAoH1uddYQSD5F36aSI?=
 =?us-ascii?Q?SBuFzY5I23cvsy3/dThpmGgQSPPq6q2pIdmRrN6xQp7vy/QdSMfyu143wj5k?=
 =?us-ascii?Q?MUoI6RjMZdnd1tYYf5zfkIaHCuJW5VGkIW/oX5/HGkRUGwRXKiuFGq1HKTZI?=
 =?us-ascii?Q?apsoxT4LOcVRFWZG0XfrYNmt4/Czfw92/gYUtVesX1vTXIIRjTKnKxu1ni8p?=
 =?us-ascii?Q?mvTW4nyRHyGqnrrqhkjTBv8eqqKLS+RAzTrcVRg0/PPIydaCEQhYEgYui6rZ?=
 =?us-ascii?Q?ZyTiII++gZ/RHllEIM9GGdWkYIxbnVClcgSk8pWe5d10yckdbay2n8AruJVS?=
 =?us-ascii?Q?43oM7i0xrNeAvUAb450dpe+dbH6M1oWHtv+ROkFX28RFDWOlxgE7tyyBOhum?=
 =?us-ascii?Q?hiD7H7eufbwDdOgSqRd/T6t73I37SfoHTZkc0HE5zzhBp6Fsowzo99vVeoo7?=
 =?us-ascii?Q?9iINY0JoEsLL39BM/ExbQHiplCiPAgZQmuF1+Mfy5x9ypkaxY/ZjeoRNkMto?=
 =?us-ascii?Q?AAaA/dV/LJ9lbzbLJbPB5Se0/ETQf7cYVR17yCDowgyzL8VPyH33ePlzd9fM?=
 =?us-ascii?Q?Z2sIq3olTWEy0zUHQ9NzxmIDLWU3l4pHqTpray9LPOhO4U11xYXL0Lk8jVg+?=
 =?us-ascii?Q?bDeIWh4dY9a1x04o5RcEO0PJZiIIvG3my3tnd3y40QxfBtMT9BoWp2up6a5r?=
 =?us-ascii?Q?RM5R8JH2MTLCYJIUtoHdC2ExT1LZA/ffDdj1Jogy0c2SxJWjjIaqBFbOCCbT?=
 =?us-ascii?Q?93BJBWdNBeqoXPAWhuvn5+Rc0gUXnrhMFdRDURTbSV3Uc/HOwtfIxJZ8nyzJ?=
 =?us-ascii?Q?XE2G/3CjYZgAtFoJ2IfnV+t57PDFSkJ39nifvXVPS0kWOoh/QFCp440iYo5s?=
 =?us-ascii?Q?uGBfcvzGLLs5ULQy1qaoam216fl2cwXcW+ZuOtccY7+wadP1BOIzfMGPEO6v?=
 =?us-ascii?Q?ThYytCMNMtDjSs8Xas1z0aGNv7RTuRm2TBwNLXktkbfSB0+iSX8QUFBVJJqH?=
 =?us-ascii?Q?TGhW3v1N23vTAZRxVoZw8P48pIKcXr3TL98l8eOk9PQ07t2SBEkwg96CyrVu?=
 =?us-ascii?Q?MEbHXfejsbHZ9/f0oiNUH9MBuIcUHfLMd+KLW7+EGk1cR5OCy969WsT9Lnaa?=
 =?us-ascii?Q?jb5LPOk9P9WZXTsDZH1GpKL+wOxsG5ZO1kE6xoJR5OCxcthnLdUHQf++IuKM?=
 =?us-ascii?Q?OBZ38m7rNA/ePfP7FFGvgv5OqCuIZXWUBK93P+MivNDywgYl7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 18:43:46.5332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2433200-cbf9-4573-957d-08dcac108d24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7339
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
methods, whether a queue reset or a full GPU reset was used. To improve this, we first try a soft
recovery for timeout jobs and use the error code -ENODATA. If soft recovery fails, we proceed with
a queue reset, where the error code would still be -ENODATA for the job. Finally, for a full GPU
reset, we use error codes -ECANCELED or -ETIME. This patch adds an error code parameter to
drm_sched_start, allowing us to differentiate between queue reset and GPU reset failures.
This enables user mode and test applications to validate the expected correctness of the requested
operation. After a successful queue reset, the only way to continue normal operation is to call
drm_sched_job_done with the specific error code -ENODATA.

v1: Initial implementation by Jesse utilized amdgpu_device_lock_reset_domain and
    amdgpu_device_unlock_reset_domain to allow user mode to track the queue reset status
    and distinguish between queue reset and GPU reset.
v2: Christian suggested using the error codes -ENODATA for queue reset and -ECANCELED or
    -ETIME for GPU reset, returned to amdgpu_cs_wait_ioctl.
v3: To meet the requirements, we introduce a new function drm_sched_start_ex with an additional
    parameter to set dma_fence_set_error, allowing us to handle the specific error codes
    appropriately and dispose of bad jobs with the selected error code depending on whether
    it was a queue reset or GPU reset.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++---
 include/drm/gpu_scheduler.h            |  1 +
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..5a534772335a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -671,13 +671,14 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 EXPORT_SYMBOL(drm_sched_stop);
 
 /**
- * drm_sched_start - recover jobs after a reset
+ * drm_sched_start_ex - recover jobs after a reset
  *
  * @sched: scheduler instance
  * @full_recovery: proceed with complete sched restart
+ * @error : err code for set dma_fence_set_error
  *
  */
-void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
+void drm_sched_start_ex(struct drm_gpu_scheduler *sched, bool full_recovery, int error)
 {
 	struct drm_sched_job *s_job, *tmp;
 	int r;
@@ -704,7 +705,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
 		} else
-			drm_sched_job_done(s_job, -ECANCELED);
+			drm_sched_job_done(s_job, error);
 	}
 
 	if (full_recovery)
@@ -712,6 +713,18 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 
 	drm_sched_wqueue_start(sched);
 }
+EXPORT_SYMBOL(drm_sched_start_ex);
+/**
+ * drm_sched_start - recover jobs after a reset
+ *
+ * @sched: scheduler instance
+ * @full_recovery: proceed with complete sched restart
+ *
+ */
+void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
+{
+	drm_sched_start_ex(sched, full_recovery, -ECANCELED);
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

