Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE097A9A66F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8810E775;
	Thu, 24 Apr 2025 08:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0BkF25Ka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B1910E775
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:41:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrRMmNUpq5plEnLL2O7801BlZSHE5IeFPUVKkUBoKa19tz5yYt1BcIrCI2MDWzUpLQ7/Llk2If1nSoJWHRdpK5Y4EKYBSK4ba0DKjlqIAkpr+YMKhmlwebx8V5M7MnSVG3lRE+YG9aMXpmnRMP0TrJvUTqpxB9e7wH/9LBYsmKNxtsMcDWjv4ifj0E7N8Vi+8ml8nnK3kRbXOehsPapeOlq35oq+KLJep7j+0VIMLqwkFm8L0CbO0zs7Jmp7ao15hH1EzWmVjzTeDg8n35NVMDwnFnhjEQOg0lS8q46x7AeO/ovOP10jceyHcXgQ1qnjrtW/hGgyNmtImS1N1SOuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRHfJWdBNDdbJgIotWKTW+P1jKDophQih4cbrUQesh4=;
 b=lSG9LglCKHkKzszPdvBXAY1MmEM229GHx9Da3TcYPO3vxkhRV3uPbSm6B0/nv9/6ejhNz/2fcZp0OPPsQCFiahyWYjaQG6jpvUfkoWwb90lXTz9r8bhnSITbCz1+2T1EXHVJMm4KfkS+BCBCf0RvF9wgBmUDyaJncYDh9yIR4guFV3zlGK/SFTllv5Mz9JzLAL44FR06ZyA7yuMgE0uR/gr28vbTGMe6+PK8YBOxfNh2PYph9N0zHWherwV0DLqX7CMyb3T72+fmhlLhs4IhQXqRlpiiRxca4GlbSo/N+wwTI3y/nSHNkjUybSn7vJSicH3wA3SBBHMxTqxpS+hnKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRHfJWdBNDdbJgIotWKTW+P1jKDophQih4cbrUQesh4=;
 b=0BkF25Ka7nknz+Mz2GjsMfBQS+8kEp9GqtsdAiDxD4BVS3rHKbkNCnFjV+Wd7hruAUTras4u5CqtobxK3gxuUb93OxTi/XGkPwA/fhhwC+bmspCRmKCZLW6npCX/bEtRGzRsBEhix39yVxMyhCh0uMd8Orsml5tQT98YC+3DiVM=
Received: from CH5PR05CA0016.namprd05.prod.outlook.com (2603:10b6:610:1f0::21)
 by MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 08:41:00 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:1f0:cafe::cb) by CH5PR05CA0016.outlook.office365.com
 (2603:10b6:610:1f0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Thu,
 24 Apr 2025 08:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Thu, 24 Apr 2025 08:41:00 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 03:40:56 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 03/10] drm/sched: add device name to the
 drm_sched_process_job event
Date: Thu, 24 Apr 2025 10:38:15 +0200
Message-ID: <20250424083834.15518-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|MN6PR12MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc38776-3a1d-41b9-98a8-08dd830bbd79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THpKUlMwUTUzUjRqU05UMVA4UDFyKzdKbS9wQVJzbVBnU015ZCtlKzBkbHEx?=
 =?utf-8?B?MDRFR0JNVU5Selg2ako2cmNNbElaK0wvaFdoVkJQWUo0MEU3MGpqL1NQZXV1?=
 =?utf-8?B?RDZCRGUwbHMxdmUwRmpiclRPbGFQSzZueThpamxsWURia0JKMGJwQzFRZTBj?=
 =?utf-8?B?TSt1RnZDRVFNWk9OZmwzdzRwbW9OOWdVNGVNTWVyMGNxVis1cjhXUzUxN0pj?=
 =?utf-8?B?Nm9NR1hVQ3V5amxOU2I5R0ZCZ2pycjRCQ0R0TzdrTFVoWFZxMnR4bXE1WTk1?=
 =?utf-8?B?NTFkSm5DdUJnUlRxMEVpTVUyYmZpU1lxakk1UTU0ZW1qM2NxYkpZdzFCd3U0?=
 =?utf-8?B?RWllMHJTL2NZK1BEVjBnV2tkZmgyeDNseGNZTndKSUl4b3VuSWhoWHVsL0hV?=
 =?utf-8?B?eVAyM1FLUVlaUE9WNVJMMWV0NkQ0RmhHK05TTnVPVnNwMkVmZERUR3JEQWdv?=
 =?utf-8?B?RzZZWGI1a3NxTXlRTUZGaXljeFg3em5KcEpmejJzVTJnbHkvekVubGpPWHNz?=
 =?utf-8?B?em53NlFMbzF1SVlKTVJEcUtZbHVKTElSNGhwSjJ4ZEkrVHJIaHdxbWdVYkFx?=
 =?utf-8?B?UnY5bTFBUUVST3dLY1I0MkM0Y1prbHc1dWlhMTdTNVEzcjErelU3WkIxSHUz?=
 =?utf-8?B?a3BMNWx3VSsxem1OOHI0aWVxN25qcDBZOWE4UmFWeVNBUUFWaWxDWFh2dnlp?=
 =?utf-8?B?VkRFVlZXNEQ5dTFEdnZTUkFyT0RkYmRYNVNGTTVHNERQVDlROStHUFZLOUwr?=
 =?utf-8?B?Vy9od3BsUm5YcU80cmZXMm1sWjFzWmxKZzlabXdSa0VveUw0dStDNTNTYXR2?=
 =?utf-8?B?aUJURi9LRkROeUJYNmlxNGN3V29DYjlZdXI4SkcwNldPQU9zUkRXRmVzQmp6?=
 =?utf-8?B?ekpTVHdrM1dodEhiNWMwcTVlL1RVSFg1MW1CUzJvQkI3M3BpTVdQbkR3azNR?=
 =?utf-8?B?VUthcElLSDhjM09nVzJZRnAyY3pzcEpHTGNXdlF4MCt6U0k0OGpnNTRRTGM4?=
 =?utf-8?B?VjJXQ21vTTU2T3M2eGRkRzdBV2hudlFRR05oYkFadDVreDV1YmhyZGxqbStF?=
 =?utf-8?B?NEZlRi9tVjc2VEVHamNKUjRITmw3ZzhWV0lrWTJZNjlhUmFmQ0NJZDF6dE5p?=
 =?utf-8?B?Vmg0bGZNYlhLWXpqYXpUWDVBckR3cy9TQ3NOcnZyUGxvNkhqczVmYnFWeEtM?=
 =?utf-8?B?OG92THZqWE9JakhPb2tQS25FZjJ5cFZJaVlWelFMRVR1blZSb2JjQ2RtY0dk?=
 =?utf-8?B?cjQ1ZzRCalpnSForbXYyVmNQU3o4Z09kc1Rvb2QrMDBmM29wMWNCTmZScUJX?=
 =?utf-8?B?VVhabmtmQkJCekRCR1lWcFZza05Wdkh6YlJUcXM3UUU2N2g4ZS8yZVErUWlP?=
 =?utf-8?B?bjlKRy9ZRkUvY2xSNXlMb29FRWltUU13S0NWYytyTU5xb3o5dUo5eERibHB0?=
 =?utf-8?B?cjdwK1ZnWUx1STBTVCtkbVlLdWNUdVduUUZPM1h3aFU5eUZaVlZzM1VSNTIv?=
 =?utf-8?B?QjJHRHZ1VnlEMzhBSUJuN1RSdWg3dE15Q3FOdm13SXY1L1FobnlGM1dSMThC?=
 =?utf-8?B?YklEVmRNWVRFVnNiQW9ZMjgxTWVtVXNUSTFHQ0U3b2IxdzdsczlHNENWVklK?=
 =?utf-8?B?Z013eVNlV29IeG83b1FTaUdFQStYbHNmdG00UDdFSDdiN1pNTisybjFDbWhY?=
 =?utf-8?B?czdGa0FCS0ZQbXlIbmdrdlY1OGFvYlFBOE4wbGU5YnBhRE9ITzUraWNoMU1a?=
 =?utf-8?B?WmlIVk96V0hLREdPU1BQNUZmY1ErM2hDU3lBK1lBSDlJL2V3R04zVmhTZVha?=
 =?utf-8?B?Mk05NzhvRGtPM0VVdzNaU1JFbnVoTzJhempoYmVleEwrUGltOUJQYjMzbDJW?=
 =?utf-8?B?YUY0ZndCRjJ1SGxHZVZuRCtsVytUWVJFVzBNL3JGeXVsZVZmN2dxY2srRHhU?=
 =?utf-8?B?SzJ2c1lJMzdWbmNOR0F1dHdMK3UvcUZxK0Z6cVowOEpsUUVHNGErL05ZT3c0?=
 =?utf-8?B?NVNWZTlnd0pLT0NsVUJNYWJUVXAwZ1I0ZEQrNVZ1SGx6V2N1MWRnTGFkbEJ6?=
 =?utf-8?Q?14TsJ0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:41:00.2597 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc38776-3a1d-41b9-98a8-08dd830bbd79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8568
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

Since switching the scheduler from using kthreads to workqueues in
commit a6149f039369 ("drm/sched: Convert drm scheduler to use a work
queue rather than kthread") userspace applications cannot determine
the device from the PID of the threads sending the trace events
anymore.

Each queue had its own kthread which had a given PID for the whole
time. So, at least for amdgpu, it was possible to associate a PID
to the hardware queues of each GPU in the system. Then, when a
drm_run_job trace event was received by userspace, the source PID
allowed to associate it back to the correct GPU.

With workqueues this is not possible anymore, so the event needs to
contain the dev_name() to identify the device.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index f56e77e7f6d0..713df3516a17 100644
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

