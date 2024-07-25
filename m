Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E24993C751
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 18:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FEF10E891;
	Thu, 25 Jul 2024 16:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WbJrm2Jp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E12B10E891;
 Thu, 25 Jul 2024 16:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfF/8+OL4sh6KuSjQ0mbnLI4sldq+bVnEyxuUSyZZ6tW+I+J30lWH/iWyBJmFE5k5Q6lA+zCpa9xV5Or1griHT+6OuI3o9g9TXbWdt1oPOTCsohwqD4Ab/xpv1edCRoV0Q96AvNQ7Voi1++aSXxsg2JZbmPSjWIbILlQOjMcZJrlm0MRCFZL1YbZYPs3EaBaCRH2LUiNBNMr086MEUWas9bxC5IINGi/JD/J1SpUjhNYZDnj0+QAP0w4o+FFA99lhTsmaEBZTxfnjZ6eVAKZNWpphWF788nw0lEESxPD9silsWzQOPV3SNvRWqE0TOQuM0ACli+QI4Wl7Oef7UgxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRyqxf08luBF5xF86IREQYHZByB58CRnAODGdf3Rtds=;
 b=H+9F+n2PS6/LVKZ5tiorTntfKOYllRwCw6aXQ1LKuV2nJkeMpBXtL12Ql9IUqF8ysNW3mviP6lM91qP4KzgTk53fmxjEi6SfHrpo2vE7vaqMCJt3JWNYWkvOR9UPgmPpgD0asjQ+B1ODOKHR8zlanEkbjlyOfktVOsIa72cQcWfSwv8eE6JaqI5+MvH0ZpHlX8vf7zN2PdOr3Cbxa8F1jziKS8/iVd2s64AC2moDJPSjyfMbmVFI0gkpKelsKUU7SCsO7vJUN5GwTNpPNZOx0uW0exoCKKzPJhJ8pPjaOruL159QB7Nh/97OQTYRzeEov3iWLIfpI8CVXnd4zRUR3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRyqxf08luBF5xF86IREQYHZByB58CRnAODGdf3Rtds=;
 b=WbJrm2JpoBKh7xlGbGdouFGtzv7x0pGWU9WmohvOwzBIhz+T+01ANsjesWBQWKuaV+WbVHz7cUx8Djm9YsqSRglOF1/n+xWb8Pi9Di6R2uvz8RqNx5b0gDUzibLHEaX0oI72M5N45+MhzhOJ5xJvaxgJ4TIkqWMAgYd7mwwiWTA=
Received: from BN0PR04CA0191.namprd04.prod.outlook.com (2603:10b6:408:e9::16)
 by SJ1PR12MB6122.namprd12.prod.outlook.com (2603:10b6:a03:45b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 25 Jul
 2024 16:43:53 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::8d) by BN0PR04CA0191.outlook.office365.com
 (2603:10b6:408:e9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Thu, 25 Jul 2024 16:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 16:43:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 25 Jul
 2024 11:43:52 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 25 Jul 2024 11:43:47 -0500
From: <vitaly.prosyak@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <jesse.zhang@amd.com>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH] drm/sched: Add error code parameter to drm_sched_start
Date: Thu, 25 Jul 2024 12:43:43 -0400
Message-ID: <20240725164343.250074-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|SJ1PR12MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eea1d51-d45e-476d-ee4c-08dcacc8f7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s0pCskGYc+ZMv6XTAZ8CEmW/5+NgIfw3AS6BQnkQWn1762FE1vik6bTxd3hK?=
 =?us-ascii?Q?/61ZxYHVyKGvqLAnjr+hLMZlU5kbhj9nkv5+8yPy+n4+0/vSD5V5srPiXjbS?=
 =?us-ascii?Q?vMl71lJP/jYk/c8tz6sE9/KdMpavq3G9jEGSnny2eQCydmRWNID8PbN3/lEt?=
 =?us-ascii?Q?VvNbu5KryXVMpMaDR8jP7pTkUDuQ78G+xiPVbGG8Q1LExvB6ik7yNhr7Kp9p?=
 =?us-ascii?Q?UmrRmT7rkhFea7vE5wknwsIVKGyCMU4JOu5bmbrX8akg/yOD7xoGpEg1z09D?=
 =?us-ascii?Q?k4I3y64X0V+l3ji0wfoA9hb6pjZsw+ccNLKs+e2q4ZccGmKDOVI/o1EbLZCW?=
 =?us-ascii?Q?q6jCOoTQOcPwwuXlo0rkQY6AE1SG+QUkga0eDgUro51UoOEHngpga1mv54xX?=
 =?us-ascii?Q?PQVwCnaRt5Y6UJptrNfTKDA/ioI8fqTgBk8u/yec0C3JVtbe4EoFSWmxJg3c?=
 =?us-ascii?Q?OmYcma1TjixGqxuEBHU2lflJguTHST8V6uwPKkZODHfdwoOfKOBT7WBqcGyH?=
 =?us-ascii?Q?7VK/wkO1A1KQjOjt7V3qgcID1TU8J8qEe/RPz1ykEcHRE5p4cw9JYIGH9rJ+?=
 =?us-ascii?Q?mq/vhpsUFwortNyknrboV3SpJPs8CDq3YglyHeogiPg9LnTf+lLbdqBIcp9X?=
 =?us-ascii?Q?vtxkN+DZVzIARzFBqTYz9T1Kb8HqT7eQeAVFl4CrileBpbmM2XqEx5zCaK0K?=
 =?us-ascii?Q?Qi9fOdGfpa/0aW6KRxu7B8P3/0gbFCrXKE0iMa0CmtnknGpShiMAQJFpY3iY?=
 =?us-ascii?Q?drLO0qksimlYw4UTN1V4/4SID5nS7hoplb2FhAkZXodwksCoMZtnpSQmWFFM?=
 =?us-ascii?Q?oJodJA/ACbA6/7GRNacdDI8jH8vfzD260AkdmAYhJCuL71NKqjpwVGo0Asb7?=
 =?us-ascii?Q?q5j6aF3X9Zg8nqVoOnuLn5Tet/PgfHQr7jHczpqBEw+k8q0h2zFq/y9Crmkv?=
 =?us-ascii?Q?ikeQDllJo/dzS+KQxPOYBiIoKAtZhTipu0lWW3KvhcwHpPDKia2WgZ8tYRNp?=
 =?us-ascii?Q?6wz2aEnmXdNe5czCmlK8twmw/lJ9ZW/gCfzjI+lO0S/A+cydnpl8jg7kCl0j?=
 =?us-ascii?Q?etb2X1UeWHvGN8zbo4x7ILo8L0L9XbLSbFerNIvkNgmjyhnQD3tHR9IEXW0l?=
 =?us-ascii?Q?JEienNvC71Blt8zR4IREAT+1YpuCF71B6uJhobFTpY88KSfBI8cGkNw2phC6?=
 =?us-ascii?Q?KEjvqVUnUPZvETTXggeIWhQNbtVnDhTM7cDcO7j9VYrgkSj/BR/BpQl6GyoA?=
 =?us-ascii?Q?UsLzypnu42Ot+FDYSi3cibnM115hhVP52jst80r7BooQfAYkFk0bISaR7H4L?=
 =?us-ascii?Q?gCzdNHgz8mDci79oKw+65/4EdePE/XEUuecObbw04dnvt0+XNl89KzeEYpa6?=
 =?us-ascii?Q?KnDs8LwGj76iHfJXLrBjQ522KkZ+SdbKzW3uTa1m3ol5BCt4zJif2VOyuTbE?=
 =?us-ascii?Q?AwLsN+/lIdeNEaWoDFu5EHzf+9Z28DQ0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:43:53.2275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eea1d51-d45e-476d-ee4c-08dcacc8f7ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
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
v5: Fixed declaration of new function drm_sched_start_with_recovery_error.(Alex)

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
index 5acc64954a88..e80ea947a864 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -580,6 +580,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
+void drm_sched_start_with_recovery_error(struct drm_gpu_scheduler *sched, bool full_recovery, int error);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
 void drm_sched_reset_karma(struct drm_sched_job *bad);
-- 
2.25.1

