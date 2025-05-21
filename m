Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B2AABF9E1
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEA810E914;
	Wed, 21 May 2025 15:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aKuyCe+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFB510EA8C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 15:46:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHqQ4Ofqt/t2CpKkAfuWUNGQVWE9dEa9yYHjWix2McBSnMJapwqmVyYpciLOqmHGGBEPuh7T6Cj6dpXPYz9l1Vt3hzQsRfUsajuk1P07EOo4+lbtL9Bc54KGukcB5IGX26EYFug5SAAxuZiBb5m20ZKDNoD6eAnJwfESt1C6D3z+mFLa3XOoTBZAtnMTRGVuatBhKwjKDteXbSXY/JWmbgsqGJYMzSVLceH0hT4XU53wkYO//btzgBNJRB5LjmG1KTlAZIcq0d3+m1BW5GSHYjMwtLYk8OADAm7wigFJ0OT/Ga/hRuijsFIoXiXqXqWCLkRSk95BDjgKFFx47TH+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRHfJWdBNDdbJgIotWKTW+P1jKDophQih4cbrUQesh4=;
 b=VXBiCJvGQbecH1FA/4pr5Dp2VebFr7ZxlYNp1dX+sb02G8O4I2AVEto4UmUoyFHpsqBi3Mo10pp6s+ufPObw7cHKHYUDr7KC940pdbCr/NWi2lOk7P2liJG6m1offlF8S80iSUPMFw3+5BQhsOQapNKikxF56cU9LWgmj28aLGO7Xbf8fu6SN3SnZPSExT/3YzhAwxmxpqaJTsryY/9BrWQdrck8wXbNeMt1XQoZx+9FobZ/oLLinUC7NpjFvJE4Wd7YQc2GzVkCiLdRhUOmPlaUHT+s86h5zgcZMqLMm2CoEOFDH/Fz8dXZEUiSWgkt20N2mw47UzMw42gVcQRAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRHfJWdBNDdbJgIotWKTW+P1jKDophQih4cbrUQesh4=;
 b=aKuyCe+q38LATTKP6aQAwdQLX0JNJ83IZWQCyf19SNt2iFCigT9v71ZsSk94gPrRABYrcz7KpzW9Sqoo95Rs/qDrXHISJp+M2S7FfDoKAg3ug1nsoo9PC8UKvTOmzsBxJLfxLis8hw5g275nAw7bca3YTlhtix+xrOv1e9c+Nu0=
Received: from BYAPR05CA0066.namprd05.prod.outlook.com (2603:10b6:a03:74::43)
 by DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 15:46:35 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::38) by BYAPR05CA0066.outlook.office365.com
 (2603:10b6:a03:74::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 15:46:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:46:34 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:46:31 -0500
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
Subject: [PATCH v10 03/10] drm/sched: Add device name to the
 drm_sched_process_job event
Date: Wed, 21 May 2025 17:45:05 +0200
Message-ID: <20250521154531.10541-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DM6PR12MB4338:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d6668f-b419-4e02-ecfb-08dd987eaa5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlE1SG51cTlTSmJ0VGJhT2Z1Nko1djhabStuUkhFZzdjN2dPRTAvbEl3K1gx?=
 =?utf-8?B?czdPV04zdHNUY0VWT0pLSTI1eFh5VU9RRFIxM0p1QVg2ZitWejdGMjVSd2xz?=
 =?utf-8?B?TFpBd1cvbWJxTVRZN251UDRmaFBlSk1ac1FTRGFkdStOTERLZ20xSytCNEd1?=
 =?utf-8?B?eTZJV0RZK0pQbDdqYThUOGhzS2VNbDhzNkJrbWhJNTdZNmplMExBVWNJTFVG?=
 =?utf-8?B?ajRSczdPQ1NxYm43b1dHWXBTV0NKQWxkd3N5MXN3cm9xbEFjU3NMaTcrOEQw?=
 =?utf-8?B?TUs3dXk4TkNwWGV5VHNrUEpCckJScXV4RjJMbGFnMVdIZmNvdHhmTkZRQ25M?=
 =?utf-8?B?ZkZnS2daV1dJWk9kVFYxOENwOHBVSEpwdmx4SlJkZSt0NkpqRnRhdzQyUFFX?=
 =?utf-8?B?QkcrdnptNnRlVTAvUE1scDUzUXpKYUtBd1lOQlFMaVg2Y3lUeE90WW85V2hk?=
 =?utf-8?B?S0ZpeHlpRE1xS3p1WmNqVXF1S0g3bktLTlBsL29XYmk5TU9NTG43bXBvWnZ2?=
 =?utf-8?B?bitVVnd3OGxHT0NXa0dnbWpzY21hdUIvZEJ6RjdYL203UDlXUHpWNzZCRCtY?=
 =?utf-8?B?ZUl4b0JsNWxRTVFNclZRNGZPeXFMWDIvR3dWNHdtWDhhMUI0aStNTDJVVXhq?=
 =?utf-8?B?N3QwUnliRmxEelljcVdtSzhFS1lFRGQ5aEkvbzVWNmN3VDJ1TnN1ajErSExD?=
 =?utf-8?B?dHpXR3JRZ1hIc0ZpUElGbTNTbkhPNkxwUVJTSXBtMHpyQXErWGhHSEYxY3Rw?=
 =?utf-8?B?U3lNdStBWEJzcUJhY0N5bHhWdC81bkRBZVVLRXprSWpoMmp5V05OZmVBTzBD?=
 =?utf-8?B?ck54RXF6WEhmUFhQeGY5SkR0SXppRnlKY0EreWFGUjhEcFpHL3hDYkljK1oz?=
 =?utf-8?B?UG5qWEVVenYyeWY4QjRwYXEyclA5OEpjMEdNV2ZqeGtLMEliQ3A5RWlpL3ZX?=
 =?utf-8?B?ZVdpdExpdENiV1hXMW8yL2ZnQWZQa0JyL2VGaUlpZXgyS2V1WUNDTGNUWHQ3?=
 =?utf-8?B?YWtqY3dNTnhiaUhVNzUwR21iMElWdUxiY2Fobm40SGRlSnVPWUNoc3hmd05j?=
 =?utf-8?B?OWVTM0sxMkxBM204b05JK2Roc1NoMWQvWEZVYm9NRVdJSDBwMnNKd1ZoN1Zv?=
 =?utf-8?B?cHZrd1dkZmFRMVIzWXZiZGtqQ2tCUzNIL3ZIazB1cVkyM2FkbW95cHJGMndz?=
 =?utf-8?B?bVIwVXVibDFjc0JNYmJ4cmVxdGVNL2tXbHRiSzFUbFJ5bDJ2SHQwdURhTkZD?=
 =?utf-8?B?YmVMdXBnRUJiSnJtdjNXYkVkOVUrY1ZLRWlXRis5ZVhOc0hnMHRsRk5TcDdx?=
 =?utf-8?B?K2xHRlNKSEQzNGh2Zm5tRFNsUERYaDYzYkttNVo5dXZhcnR4MXhwTzBhK2RS?=
 =?utf-8?B?VTU1M1E4dkdVcnNDMUVuNmFPTnE0VDJmaEhGaWxpU2x1ZFpRMG11V2RrVXdM?=
 =?utf-8?B?UFpxS00yTGRCM0dFUU9PVkZmQ21tR2lBamJxcGE1cE93Ri9kQWxVNWNyRWhx?=
 =?utf-8?B?OWdXM0N2NXhWQXJPUnZFRklDazRZVjg4dlFkdzRvRzgxeFp4WlRlWUt5L25h?=
 =?utf-8?B?aVZFQksxYzdvbllBNWp0Wk90bktrMFZRM3JyaVBIcG5iWTk1N2F5ZGFWL0NO?=
 =?utf-8?B?U1lmd1hOM0VqaVJ0TkkzbjN2YkNkUjRVR0RrS2J5ZFh2ZTVpZmIvZGxNVkpR?=
 =?utf-8?B?WmxQaWxSckwwWVdWdHlPMGwzc25EcTZXMXBrZzQ1UDZselAyUVhGSmFJNDhy?=
 =?utf-8?B?TkpLRGxiMnd0aFYxZmQzbzJEZUR5enA5NFZkSGU2UFJjQjNObmJRQjYrOXor?=
 =?utf-8?B?SFdpY0pFY0tQamlrN3g0bWFEcVRnYzdQaEZtdUxYZWpPV28wWDZJL3p1em1a?=
 =?utf-8?B?YjJWVWoyM25YZjVHTFVPd1RwQmd3SitjMnhleGtDT3hBYVJTbzZOaVNWc1g2?=
 =?utf-8?B?N3FFYVhROE5vQ1orRHJTS2NvSTV4RGxZaFhWVkVwaXFDdFFhaHRTTXArQmxG?=
 =?utf-8?B?WkZzcWljdWJZK0xzQkwwZllvYmtsd0sxMGhpc3p3eGY3T1hWVmNXRWhNSEUx?=
 =?utf-8?Q?5lRNje?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:46:34.6660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d6668f-b419-4e02-ecfb-08dd987eaa5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4338
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

