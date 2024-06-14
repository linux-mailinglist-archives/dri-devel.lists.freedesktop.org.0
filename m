Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4D908600
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD1510EC93;
	Fri, 14 Jun 2024 08:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MCnpiyUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97CB10E18A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:17:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnrhpsSxT7GhaDlie3Rruy2Rm6/YCDWRBBJCbozPsiRhvquXj91WzK+gR00dayd399k1HuGo4o5jggHePho12EZ2ewC3baQVWBPwXO/BaXANrXmyRno/vkm1RIObGsgB9LBNcAM8WrkWPDaHNZRITYr2FNiBrju6N09vyFsDwqWz3rJj7KT3rGp3D/xznx1kEvXKvX4pnWFRraauqYwltyKmBVXuSe9cdSZ4PdQx1xzJNvc9ELpIIWkMYaHYAZXqyoZRB7gSsoCKFPmdL0M0DuTcshA5+3CJmMmZ39sTiDtH5/rBVszNAMWZsyqTU/a40ZAFTRJLnFmsli/2kl4v2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5jjL2nkC/J+3hwvcjLHk4K7DLKJJXc/Lfbemc4YRqc=;
 b=X2fWrHLD8Nxc3xeuc7tdF7Z4slJ0L7H327V6Vn3aiH8tupLLFK04fhnebUEeF2Rlzcqne0YfzQeI984x9U0Lm442Qirk2caPf19K+1sRa6CtbDpH3vLJrthpjYugVel65AoWlCSvI0SjKpVLXyIEpF8i0uHQRmriOLC+wi2JWMSCTneqHwDKi5UFwKkMsCBrJWObczIEWTO3Bdtb3swwSgtENNnP1YmT7ZFUyhH2D8fP2BTKQeFWu3pd/CyV6gOH14zaxXg4ESONHHgkoXHpRn9+ri7H1KbgME18gA/BpE5wu0qiQYTVGMJWUFML+JmuYodF06vDWCUdz9yFgDQkmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5jjL2nkC/J+3hwvcjLHk4K7DLKJJXc/Lfbemc4YRqc=;
 b=MCnpiyUYZhn2EKkXKSo+wksbEH3MnU5lM+fLjRmDqGN2bcDWe3rfEga7iWxVq7w25LMzs3uS9hxv3rPbP2+kLWARHfHSlrGl00KlBirtEIIxEZPdUK78175EeyXFsabDRZZf/OGvak3G4Eopktl91mqy7/JF+a2/zJc4Y8zYU3E=
Received: from PH8PR22CA0006.namprd22.prod.outlook.com (2603:10b6:510:2d1::10)
 by SN7PR12MB6689.namprd12.prod.outlook.com (2603:10b6:806:273::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 08:17:39 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::79) by PH8PR22CA0006.outlook.office365.com
 (2603:10b6:510:2d1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Fri, 14 Jun 2024 08:17:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 14 Jun 2024 08:17:38 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Jun
 2024 03:17:35 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v5 1/4] drm/sched: add device name to the
 drm_sched_process_job event
Date: Fri, 14 Jun 2024 10:16:27 +0200
Message-ID: <20240614081657.408397-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abcba95-28ad-4451-6086-08dc8c4a748b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|82310400021|376009|7416009|1800799019|36860700008|921015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VBTuQZJBWPsUrDDlcAMkRphApVBvKglVJJ0yTLqJV/g9MAUsXCtNeGj8ctyr?=
 =?us-ascii?Q?4bght0TC7t3ZZBEmBmk09rLtHhA1owH5qcmE7H2rdA+ay+oDU9JSvcVNvWE1?=
 =?us-ascii?Q?Ha5GgzRF1SkqCZz1QUV3EpkonOGa6C/N0Sux3quo8jm4dW7DWC3B96I0OUKq?=
 =?us-ascii?Q?eYgIwjznkEfUtjCbHVTJRgc5BFG/GcJgMkNCR9OHVPpnfkyxTVZKmOd1p7Wr?=
 =?us-ascii?Q?8qZ21jfo/gzqix5KOMeREjm1eHbwKnNdUB/LGzfR4KaFQ9yAxzhh2325qQR5?=
 =?us-ascii?Q?kSsnWi//2ABBmIz6+eFRb+WTnWAejoHgzz8x0zqwSPDfkUy3aa6yR4YP3bD+?=
 =?us-ascii?Q?E6pzS3vovy6hiWoL3YSMe89KGxKbjJtR4+LuCwhKvDh+VgV//i+yBCKNkteH?=
 =?us-ascii?Q?+5WGLaoNF+5jGJEfUSfQwEIYnTJmcnmauaC/+iRBm5sL/r5qI91wV3GEvcb4?=
 =?us-ascii?Q?XBv3kDsTAbZxa7/En0tlvb1om89CdaWFWUuBSI0SoiP1DrBjG4tSMdM7hP4G?=
 =?us-ascii?Q?sepjNJD3g2PYaOThj4peitIM959rCoA1Ou0tPZN/v+xWneAeEMpGC0SoVo/S?=
 =?us-ascii?Q?4KEy++j51swcGWY/f7+fthtABPqMC8Ag0wRcBfY/egfIFpdF6TiLC2HgEbC1?=
 =?us-ascii?Q?z7KSF0dtYLhtyRG6xwwFkvq6O5Gy+mCy8vN8gsr1ra5ITPGJEo1lsVYoHaHg?=
 =?us-ascii?Q?h4AsNY+uIolgqidaxiPaqZd1s711tLCfKdvTL3b7mS29rKsTCl/Fzj8X+gcx?=
 =?us-ascii?Q?yxY+4EFqJ0igRl0FBqwI0fXOtGtpYNJCl9S/1qsH4P4cbj/UqqPaVybBU2oH?=
 =?us-ascii?Q?NPu5RZ9PAzEm+XF3/oMY3ai5AS5fzOTw2Na1uqANoCXQqcZFY7IRjcicqHNs?=
 =?us-ascii?Q?DeWf/OZemqk3fqadNckUpnKOPJvLZS1Py3aoIxpgUIn9rCZ1ABX/jRmnf3kJ?=
 =?us-ascii?Q?rCMm5vMrsawXIUuwnREVoEc4zdaQGUYELgccDFtOrSMlT5JKsFOgnbhqcs2G?=
 =?us-ascii?Q?BjGBDLOOrFFdEKi02qfw4GRBhUSt+7ioeAH13gux/d3tTwptqHxqGweapvAo?=
 =?us-ascii?Q?VWvI0oMTETHVnIGCbVHrzaGR9ca0MRLNmNk0joX309oefNc+tuObQq5Vqnir?=
 =?us-ascii?Q?qqV1rtdT0KaGx2kkupGL+GBmQTmJTw4s5YDVmjRpY84a/tvsnT3FHf5y+Q+m?=
 =?us-ascii?Q?jVBfHb2ltesXthmSKgkO/CAtZ8I7PdNl9ilcRC/swY4P07OWvtPJ4oyMp92+?=
 =?us-ascii?Q?MHvDb4aWd2eTgDhieJwn8a9BFAm0512JbOtdJfcNCSrGPZlXbhgckAlNAajE?=
 =?us-ascii?Q?nOyROOmT6Jh3jail3lsvgVqrOBE+VApEjDx4HDnEv5qZL+hxhDJqX+6CswMZ?=
 =?us-ascii?Q?3kgOzqJWAAeLRCrGDilICYUWbQ/0uAYyG+qrUiYMRWHO9DdzBUffd95EWT2n?=
 =?us-ascii?Q?dqMg1/0WQT8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230035)(82310400021)(376009)(7416009)(1800799019)(36860700008)(921015);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 08:17:38.8027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abcba95-28ad-4451-6086-08dc8c4a748b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689
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

Until the switch from kthread to workqueue, a userspace application could
determine the source device from the pid of the thread sending the event.

With workqueues this is not possible anymore, so the event needs to contain
the dev_name() to identify the device.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index c75302ca3427..1f9c5a884487 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
+			     __string(dev, dev_name(sched_job->sched->dev))
 			     ),
 
 	    TP_fast_assign(
@@ -52,6 +53,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->credit_count);
+			   __assign_str(dev);
 			   ),
 	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
 		      __entry->entity, __entry->id,
@@ -64,9 +66,13 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
 	    TP_ARGS(sched_job, entity)
 );
 
-DEFINE_EVENT(drm_sched_job, drm_run_job,
+DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
-	    TP_ARGS(sched_job, entity)
+	    TP_ARGS(sched_job, entity),
+	    TP_printk("dev=%s, entity=%p id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
+		      __get_str(dev), __entry->entity, __entry->id,
+		      __entry->fence, __get_str(name),
+		      __entry->job_count, __entry->hw_job_count)
 );
 
 TRACE_EVENT(drm_sched_process_job,
-- 
2.40.1

