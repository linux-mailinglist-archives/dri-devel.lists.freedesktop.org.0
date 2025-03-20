Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04964A6A31E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 10:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A0810E5C2;
	Thu, 20 Mar 2025 09:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mmP7esHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C028B10E5C3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 09:59:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRHvTU4DIlzRTkDOkjaZKkvNPRkAi9wZNyl+BGfJvEmg0I3l/p6J+yh5chXg/lteD1eavwR07ya4NtAVj5NBVd5YqUAgw5kLfha4QyDLYbSPzC8cHytp48vvLIK87TI4K2919aU6DlC1Q7Qv+SYbgWGYieo7++5ju7h5reVV/n53Ri1JsA1TVoX9uWHw247i0e5QyZJUNE54zFcemKT+fnRsTwArrXxbokXHx41xgOmsl88F7pcVpL1qz9mCddymAPsRc6f502E8Gw+3pfyol2sGY+q1I86DK1es3FmmEwvC3OLOQgFRcAE3mNP92zt8v6s4lCxlxqyx3bwK5aTWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRHfJWdBNDdbJgIotWKTW+P1jKDophQih4cbrUQesh4=;
 b=HJqrEr0X9lz2u5kIOiFkIG6JfyZkPcueGD5BiEavJ/sX3liE1YJaA3G49WAwJWFrhZXx0d9rwZp3JqeYkwpPp1ixUXMsembsylNNjSq8urdQV9uCbuxtwMqo8gVKuRiwHZ9d34ffWwOfSSGlopzhvGFsdrtB7aKfVCwX1y78YY35e0rX3DCiZU6Pc9I+XS3V2D4IKYRmhMjN/DhFlPsGcsBHeGzimaoH0E0ZJeVLTF6ijpKkGHBGkJ76hgVPuIcIQJJe6mUMNWDp0zFR1aF26vgmGVUDSsKKKqvdGJxbw4pWQwVWDA9QF84zQOsaT7t0rPtbF9+ig9fuUXkq5FACtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRHfJWdBNDdbJgIotWKTW+P1jKDophQih4cbrUQesh4=;
 b=mmP7esHrUtoah5WtfT4waGyoosS51VDxdk4/CiDLPi79p/YfQJYfQW2CVYLC2oh9N8CXsRXeGWl4eJOJf870eaxYwHNJIaA/SDiskPHpiOMH9xdnd/f7PN5YN6ADHevKYMnEQVc3tIEk8B5Rl0KKYy1ArO6wYnh5ag05eRoQ1r0=
Received: from BN9PR03CA0909.namprd03.prod.outlook.com (2603:10b6:408:107::14)
 by LV3PR12MB9401.namprd12.prod.outlook.com (2603:10b6:408:21c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 09:59:49 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:408:107:cafe::1f) by BN9PR03CA0909.outlook.office365.com
 (2603:10b6:408:107::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 09:59:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 09:59:49 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 04:59:47 -0500
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
Subject: [PATCH v8 03/10] drm/sched: add device name to the
 drm_sched_process_job event
Date: Thu, 20 Mar 2025 10:57:59 +0100
Message-ID: <20250320095818.40622-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|LV3PR12MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d115ef5-30d8-47e1-a852-08dd6795f3e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0F5UlhzVU1JS0dkTFltOWtnNE5wMVVuNHRYVFRXd2o3Z2FVTU1uWndlVTVj?=
 =?utf-8?B?M1FDMDZTaS9VdW1hKzkxSTJkcHpzaTBrK1VoVktoTVQyc2hqWkw2bFdUOFZ5?=
 =?utf-8?B?aFBHbkY0T1haSGVEcXJMWDFnUkdRaTVHZGgrNE5WR3N2MVFXUCtYYklZVDZs?=
 =?utf-8?B?Smx4VW5vL1hwRlFBK0hWVHU3S0g3bzN5WEdONzJiYjRWZkN6RmR4TFluL3Nv?=
 =?utf-8?B?RkZRM3VwQXJseHRsSkJHelVvaGprajN4WjFndGg5eHhic3NuczFxaFlvQmdy?=
 =?utf-8?B?dWZPaUIvM2s0NldSbnZHbU1BTHBJT2ZoM2UwRnBFVUExVDFHSGtUNnZZTmhN?=
 =?utf-8?B?VmVPdjFUaXQ1ZUJiLzJLS05YTmlTOVNXdmRRNzI0T0lDV08wb250eVNaY3lx?=
 =?utf-8?B?OTk5M0RCa2tSZlY2RisxRGcyK2NqaklmSVV0di9FNDBFNjJmSmcyUG9XV0R6?=
 =?utf-8?B?bmVIaEE2a3Z3a1VzejVubWdJU1lUYmtXZ0p1TUdWTHREUDRwSHdVRnFRbkFp?=
 =?utf-8?B?eXdWTjJVQzdrc1YzTHVHNlQ3ZWZUQ3pvMWxQT3hlcEJuRnZ1ZU9vajV0QzFl?=
 =?utf-8?B?VFh6ekI3TVp5VFV6K0FkN0FRZGVXZXVMaDgwTDZYVWd3Z1BIUTdVSnhweW9O?=
 =?utf-8?B?Rm1WWFZNN21vaThENEh0SkVPUW1xMnlzdUdiamtKdmZQQXZyOG9MUGdycTFK?=
 =?utf-8?B?Q3hXNjJSNTNYY0wxcFF0aGFGK0VQMmJHMVdjL1plcGVQOTdRWTd5WlM2RFQ5?=
 =?utf-8?B?b2tyaDREZk5UaVlRUVltVC9nVHBTQXJlTmdXOUZVa1k4TWJ5UStGdnVCNU53?=
 =?utf-8?B?bEZGMDlvbmpDaS9mek1lVnRibzNpckVYSXRnbFNYWW8xZXhKNzZUUUYxcGlM?=
 =?utf-8?B?ZW54UnhUenZCR1pCSWpsM3czQVZIUFVMekFVd0FOanAzSXl4UEpOeTU3NDVl?=
 =?utf-8?B?allDbHo2WXc2RXdJR1BCRVBvamRtT3FHMzdYajRyZnFpOVRIUDV3cERnZ1JT?=
 =?utf-8?B?V1NPM0x6SndWNkdIZ0RtNzJEYW5oV0FzNGFpSHcycDVRNWZLWjZVYmowV05J?=
 =?utf-8?B?VXVGeHc3Q1BYVFhIcm1XUHI4UFBnazdkdEw1dFhjQ2hOR09NOXBzSFlIVFdt?=
 =?utf-8?B?NTVSOHZmaTRyd1hDMXMydEJSQytaU3JPQW8rdkJTMXJBRE5ZNjQzdzEwQk1v?=
 =?utf-8?B?SnlCTThaNkRHK2xPdlNPMnk3UGpTK1ZNQ1V0bmpLUFovTG5TU2FBUlEzSE1t?=
 =?utf-8?B?UHh1TCt2U0p2SmtyMHRjdjcvUHFjRWR2NVMvamZ1YXZ5NW1NVXFIdExXa0Ny?=
 =?utf-8?B?RGJOM3NRMjhjTFhDeHdvcWNzYU5HWEdvMVBHVjFhQ1JEUzN2NlpFWFRIa2c4?=
 =?utf-8?B?ZHNiSW5XcVc4N0V6WU85OEduL1YwRjlMU0ZxSjlqSERROTR4OG1DL3BqTlVi?=
 =?utf-8?B?ZzU0SGhBdlRWcFNiUlpISzZGTXc1UGZ0UXlSMFZWcEVEQ1d2S3RGbHRRMW9q?=
 =?utf-8?B?OGJCMnZqTGNvL3MrdjJtclNmdk5jVm9DQ1k5WUpvREZRN2xJa09EcHJhd2hU?=
 =?utf-8?B?aW14ZXdSSTNUckx3c3k5WEk0Qk1jdTZ1SHNPWkdEODVPSDB3S0k1M1V6TWt3?=
 =?utf-8?B?R09NSjJoSGFTUGJJYTM2c1czQjQvcjlLYkZ3MTFCeDBMdjhPRFFqTnpxVHUr?=
 =?utf-8?B?b2o0RGNHQkFYZ3JoTi9BaS93bUErVzMxSk9PUzdhQVJxRk1uM1RsR0U2QlZS?=
 =?utf-8?B?YXVUSFZFZlphb2tNQXAvMHplUSsxTHdGNkIwREhHQ0dNelVPSEJXaEd6eFdT?=
 =?utf-8?B?SUdvS1ZoUHRJT1BZREtGenZpUTVDdC9sQ0ViSmxpeUZUYm1VMnRUaUUrNkFm?=
 =?utf-8?B?ZDVFUzV0V29rSGlJR3ZabFFyYXIvZkgrSm8wOXM3eFNtTDhZZkJrWVZTcUtP?=
 =?utf-8?B?RVdoVk1rT0QwZW9kOWFValYyNFJGeFZWekNhSVFvT2JxWWpodlZRb09tcENs?=
 =?utf-8?Q?vZIt9kouI7ItvyNtUHK4rd3teqneTg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 09:59:49.5868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d115ef5-30d8-47e1-a852-08dd6795f3e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9401
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

