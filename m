Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6979C86BF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32A610E7D0;
	Thu, 14 Nov 2024 10:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pCUMduTL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E341310E7CD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIqgf2q++bDfEKkEkiNjUvuuCPOHmRKsSyF9OImJyrZX+kkozXsZwfuPVqV9N8R3hf4KUHKnsRkLQUG+ftLon7+KFaxUz/xnwNYXxfz1ggwEg9zhuBxz+fQfroByGYrpUOoZOzKGsz1RHE2/kXCS1tOqLxJm2DYSWezl7CTJSab6loXsUY1fDVncAzB3MBaTs3Usy5RqZeTmoTg57A7MZndBZoM7DgHl/VT5zYK1pcwTMxXHykdgCIQ2xqzJMfDCPiYtzkbmvOM9OCq0+l4hQqb/h/NtetET/xqubuJnIXVvwCMKrmM3GHPGfqRIl8i43s4JdnVq7SoO1k8OFyD/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqbtxBEpnmsCpJS4X5VKJq9FMfpmtcyBL6OHT75UPcs=;
 b=K+FfDybB3Z1vsAEx3Zz4hsHLYbgLDzWUZ/lW9MXr6KWHMsFjTTN2OIP2yov6mJ0gyTcRGjgNUy4vbda5Ka5AnHaJar9oxKlxaR4Mw1bodMogM6qeYGTYRZLBZ7lVEUEColMw/OzuNEp5KiWcC5CFqnPcE/26VOnsufZakr0Lz+LfLevl1nGiIyEURqGpgEramY2p0jc92FhP9wHr27QxyoLJToZ+CeppxXUS7EfWr8/a15a8rWLw8EJd7ZNvBZ6syH1rAjCs1Vwv6yHqioHHm9+nYEYa93I9y8+7EjHQK0YZhTPnBqZ1RzEB4vmOR7jhQWsCksKCcANl+JJWoFrL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqbtxBEpnmsCpJS4X5VKJq9FMfpmtcyBL6OHT75UPcs=;
 b=pCUMduTLyr/Xa1OhccH6LiBCs7+mAtgSV3SlEBNFabGxC+4tlcJSwfm1EKekRwzRrx9jiRolrMB1934iIWTrwBJsvMuHX8pk96FMkpBFwaoeO75rn1m+YsTTKGCEt/hinwG0xbhCYLA0WJpo34FbHj5VvSlJRvepPbfzN6Uofzg=
Received: from SA1PR03CA0001.namprd03.prod.outlook.com (2603:10b6:806:2d3::12)
 by SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 10:01:57 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:2d3:cafe::12) by SA1PR03CA0001.outlook.office365.com
 (2603:10b6:806:2d3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Thu, 14 Nov 2024 10:01:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 10:01:56 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 04:01:50 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>, <l.stach@pengutronix.de>, <matt.coster@imgtec.com>,
 <frank.binns@imgtec.com>, <yuq825@gmail.com>, <robdclark@gmail.com>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <boris.brezillon@collabora.com>,
 <steven.price@arm.com>, <mwen@igalia.com>, <mcanal@igalia.com>,
 <thomas.hellstrom@linux.intel.com>, <tvrtko.ursulin@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v6 3/7] drm/sched: add device name to the
 drm_sched_process_job event
Date: Thu, 14 Nov 2024 11:01:06 +0100
Message-ID: <20241114100113.150647-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e134e8-1a70-4cbd-7c25-08dd04935f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|1800799024|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DenPFGQqvcRI1VRg7Fbu5BUq+R6NbT/jHyrnNj5E+YtpTvPkNgGMSNMWuQPA?=
 =?us-ascii?Q?R1j9JVeB/vbKPQvG5WDNlidfVio02m2b1enXl/Lx5P3ozUBnD7SRBFUWBi8v?=
 =?us-ascii?Q?3YcA0Cu3sMX/dBW2lLwJYt/R4UHx/N+gnSllK2gAxTspa1CGXdu5JbHH5cEi?=
 =?us-ascii?Q?MO5OC1d/LoxrrxkhFcy+Seh1+02A/a7r8M+QDUyM0MiE+xZsQdW8/2QyfzBh?=
 =?us-ascii?Q?rpFB55oJpe8mrjpxE4PifSiL9QmxHH6ydTFvaerMktKl3lBeOZc+xJtKUvIG?=
 =?us-ascii?Q?ah2GsvodusxRkTGi/RsKS0k161oUSWcopHyjRLKuaV9YVnkSRblHjYX3YcqK?=
 =?us-ascii?Q?EbSca35cgDy8DpNvJlWv4leG6XNaWJegOduv13h6f7M3IGItv+ux5mDLUvIo?=
 =?us-ascii?Q?+BLyoaJ6SOw+SaNOjAmpYDctlBJVGYwx+kk7iRH6I5Qa+26A0ZtaEf4rE640?=
 =?us-ascii?Q?VbTImwdXPIlStfpZg80N7e6xrlcDxnb1N2aeojmLfW0ipaOmRxKLR/VPFfVD?=
 =?us-ascii?Q?/llWX29cfhjBapXRVVuWuHAynxW7wEnJIdNLEJjoD0X6Q+PGWkQOUs60CKYD?=
 =?us-ascii?Q?8+3GLBv0JDgdVUEAil0azeOrfQEVUF5/NFSLvrcNPLJ4p9vAZXHR657fvK8M?=
 =?us-ascii?Q?P5WNHtrhxP3Kj4aRREFbKzbBPsj0yjMB/UXOibfq+uwyDGYQUxVTVYaxjKN0?=
 =?us-ascii?Q?Cc1s7ZX0Jfd7S+5lnYdr7UKKeDBeYyyUTPfu9LGcG+mg9PGO1VBtYV1SvunH?=
 =?us-ascii?Q?s9bUnh6rm/Dtkzc90/ysPYM4QSAVA8248yQog0cGEsNx6mh62FUj+mNhbm4C?=
 =?us-ascii?Q?xMlmDNo0pQJKcanrDNnZHaJ46GJCRXl9FkF8HwJuNVp+Es3+CORJmhJknVP0?=
 =?us-ascii?Q?dCyWPHVFp5rv9QN6LhB7T03nzyfQbKRykOm1KHYLU41YnIn1wv5/RG6o8Mdg?=
 =?us-ascii?Q?xzH3dOmVWttm0UPkAlzNZF5E+0huKAe7/460L+khkZjzEaBuU6sf7NuT6rlw?=
 =?us-ascii?Q?1XZwJZDKau46ATRR/xKGHQh4euv8e7oE/96TFJWZxCXQPEYo06GXTSj0sBjQ?=
 =?us-ascii?Q?cvmk9u1CLWskUUSbSOiC8xnsonc37KBud8FqlkBi+HWnWqCya0MXc+GfYmgL?=
 =?us-ascii?Q?prKPbWamAOXGxSxWBPNaa3DLfI0m99GoFVEQmeSpjd6q/u83L8U7VeTlPTBr?=
 =?us-ascii?Q?67mgmaoBtWPIsIq/Qy/uJr1sOWN97l9bkLAGM98Z58XQhUEATn4ieBvwsAAq?=
 =?us-ascii?Q?lrCypHkhoLRar//w1B7YYT5M+4Fd6/YjYlmR+lwby8PZNju0gbw9PZ/y9urG?=
 =?us-ascii?Q?fb7ueg0MshN0asLKowk5UU2XVhRxZ37211uWTGPYxsGHtukVIyQ+nOAh7Mwt?=
 =?us-ascii?Q?F+eLBHNV+6GfipprKLx1Tettojvx4XJgCmkD2VkF8PdlatVus4f2PTKT3ckM?=
 =?us-ascii?Q?4AvIXVnEJWk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:01:56.4656 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e134e8-1a70-4cbd-7c25-08dd04935f80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323
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
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index c75302ca3427..c4ec28540656 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
+			     __string(dev, dev_name(sched_job->sched->dev))
 			     ),
 
 	    TP_fast_assign(
@@ -52,9 +53,10 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->credit_count);
+			   __assign_str(dev);
 			   ),
-	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __entry->entity, __entry->id,
+	    TP_printk("dev=%s, entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
+		      __get_str(dev), __entry->entity, __entry->id,
 		      __entry->fence, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
-- 
2.43.0

