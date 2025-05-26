Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6406AC3FC9
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF4A10E324;
	Mon, 26 May 2025 12:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LSOlF70S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CD710E324
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 12:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGWmXQPZKGcwGwM5b7YCqaItW0PybG/EA3nZtPA2tnS6lFpXG4G2Z536h3eEFF/gKU5DWI1IuYGpI1DCw25so69E4HBvm/Vt5MD/ZlrnF1F0yFX2BHgxJ5lmKsoYEw5a40DDvIX2WoTEbPtAm3m+n3HoxAQ5QMRJUD9iVo8vzuZPUBJU9U09Sn8K3Oqthy+KU4vUk5bsmMEmuETCEX4+VLu2nDb7zGkGqk1Ir4BTK1ffU02jb8k+a5Wgh+WFGpZFOcvoO6Cuavd/68huiW8QWz6j26XorqY7FilgzmYzcDJIINfXnXUkRAPUM6m96ol6Z1WsorcVuJIb+gT127AUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRHfJWdBNDdbJgIotWKTW+P1jKDophQih4cbrUQesh4=;
 b=gWkyaZ1oAI1rffjf7yQOU2YD7hMDNotUZYPhGioY/FDrSRLSPa1lEu6cCiL4LLVQPBO5xZ9rtoVlzD+VTKiXwy0aa/Al+9J7u1Xie3SGphjs2fosQLJn3zWhIwsT99DiXCLHpFipRHamT+gYt08/+5d9GNKxyHwI86DiZg2MTzeLWPhtpxmLkhPbcZgIDVvlv8XuTHinPR08iytGHpsfLBY4LfQsEc//j6nTjrmQpilRZSbjnfMM0rRomD650z2rS/XIZhsKwWl6ISTIAb4Yi5nb6+zJxs8krVJIPHypMJ8CtgKVEIi0eNz7zragZM4icpwOk7TpTl4BPr/8o3++wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRHfJWdBNDdbJgIotWKTW+P1jKDophQih4cbrUQesh4=;
 b=LSOlF70SQP4SDbn6xOGQfUd725HtxdAqBFw84vsMwIRIbccl+PjXXufwjmD/wig13xe+y0hDC/3xX/8BK6TROw7mlN+rYKRiIj4JpvkTnrNSs/Mt6gwcbCcd45bKSLw2lZaScdvlDs/CXU0NP8XwL5w2zJuI02okqLgEUxuQvcY=
Received: from BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35) by
 CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Mon, 26 May
 2025 12:55:52 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::f8) by BYAPR01CA0058.outlook.office365.com
 (2603:10b6:a03:94::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 12:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:55:52 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:55:49 -0500
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
Subject: [PATCH v11 03/10] drm/sched: Add device name to the
 drm_sched_process_job event
Date: Mon, 26 May 2025 14:54:45 +0200
Message-ID: <20250526125505.2360-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 76cc60e5-b84d-400d-7846-08dd9c54a58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2Q3WG9kaitjRFZQZVZrUmxPMVgyckFSSEFrejJ6S245U2ZjclpNTEF4WTdX?=
 =?utf-8?B?L0FpQThhSStDS1d1a3kvaE9rbitHNjdxSEJ1MVhrU3p6clE2dldVdTg0SGhh?=
 =?utf-8?B?bEh2bEZyaWFIYmc0REJLdnpRNVdOVE5GcHVNRzR4MHU0RGUxazlJdDBjTXJO?=
 =?utf-8?B?aHhaM2YxR0ZoUlRvdTZuYlNzTCttdmE3U3NvdWMvRmFxVWp3RUp2d2gvQ0ww?=
 =?utf-8?B?cXJJa2ZaQjZUeDB5cWRrVkhNb3Y1SUgwaVNiRGtndE56Tjc3bUt2c05kL1lZ?=
 =?utf-8?B?Tmp0bVFWenEvMU5SUDh2cTIyYzZzc2ZNc3B2dE1ZVXZmeEhtYW84ZXpHYUVX?=
 =?utf-8?B?UUtMU0pCZFRkcmdSZXI2Q1BtUUFMSlU5dUI3UUMvcllMM3pISVc1VnVUTGxs?=
 =?utf-8?B?WU43NTVlV1Y4dlZCWm42ZCsrdVBETkh2VEl3UDdpS1ZWSWVBcTFVU0hKL2Zr?=
 =?utf-8?B?ZGhaRkIwakdMcFRDZnlYYW95K2J4Vi9uc05ucjkwbEtMZFpnME5zangvSFgw?=
 =?utf-8?B?aXdoZ0JnNktLZndoODBXbEV1Vk1zVTN3YjJoYXl6VDRQS3BFYmVnNnkzWHdD?=
 =?utf-8?B?UUh0T3AycWhHWGhTcDZkRkxzbldqaC9VbXpFYXdLY29qb0J3b3ZOWDZrVlBy?=
 =?utf-8?B?QkhqY013TENBRzJrQ3ZadG1iUzNXZzZzNVZMc2U1bmwvQ05OY2Mrc2hSOUht?=
 =?utf-8?B?TWhpa3Y3eFpodVZoY2w0aU0rZEFCc2tRQklQcEo2MkwyekdIS1dQSW1DNzVJ?=
 =?utf-8?B?cG11bU5TaHo4Q2oybVYzRG13ZTFxVHRnVGNGTzJrMjNFTHl1Y1lSeEx3UWNl?=
 =?utf-8?B?YVdHbHRHV2pGcGpZcytxYWF2dmxjTzBub3BpcExtbDdvT2tZVVErc2RyYUg2?=
 =?utf-8?B?ejhBQWJFd2pZNUtEOTlzYVNJVnZDbm42RmxhS3M4a01iZ0o0REpLUkxsWEhk?=
 =?utf-8?B?Y0F3UGpVNFBld2J3dm5XZ0NEU3diOXBacTZOUTFCUEFlQXhQeXkwL0VGNkJR?=
 =?utf-8?B?dG9rd1owdTRmUm5VM1p3anRONTRSYXFVTUh6dTlCeHQyQlJ4UkhQUHgvZnpZ?=
 =?utf-8?B?UnJlRyswN3M2Mm1sd1c4T3NlQTAwaXpyaXRtVnlIN0EyNGtubmNzRmJyZk1s?=
 =?utf-8?B?ZDlMYkxiVTV3amFuYlE3TWhVSFV2NnBDQ3hyOTl4MmFOcFN4VjFaMlM1WUhX?=
 =?utf-8?B?Z2ZnK1NQdUxxU3l6MXJidmIxdWVNdFdhWnF2Szh2ZVFyNFhIUnpYMXovaG1z?=
 =?utf-8?B?bUswcnVmSTJKYkZpRVh0OThZdFBCcFpUbWY5NWJqUjdOUldMZUZBT3ozeHB2?=
 =?utf-8?B?a2JBMmRXSUFkLzUzdjd4Y2k0aWlMcjB0KzVsZUs4emZ1dFdDdEdaOStsUTBI?=
 =?utf-8?B?NDAveFByeVNYcVlOUkJDRnBKNHJtOUZRczVVUDUyZERtcldrOXlZbmJTZ3V5?=
 =?utf-8?B?VWlSbGRxcUdrQTlGTEpiR0pnL3VaZWJjZS9GMThGL1JnbGtJUTVwWjlGVnI3?=
 =?utf-8?B?dWRDYXlFMXZ4TTdydWdHMkUrRUtKNHh2cWc3ek04OHFkeHplcTJ1RlBSdUww?=
 =?utf-8?B?cm5aS3BjSVVMN0NMVkhNZ3gwN01BVnJ5WWxJREdlbjRVclh1SUE3cVNXSE42?=
 =?utf-8?B?RjQzQ3BITUZrcXFDYmhyMXVBMHB0S0o4cXBCNW5JMVcwQjNGSGFuU2dzUUhs?=
 =?utf-8?B?T05xY2dhTWRuVHBTMjd1cHB5Tzg0cVJNUldaMnlrL1czN2JUNzE2TFpJRGkv?=
 =?utf-8?B?aFVsdGJmRWdEV2pNeG1iZ2g0dmNTVEN5QjFLZnVPY0EzZUUrbUl1TUNmVzNV?=
 =?utf-8?B?Nzg1cEFxems5dnl1N3k1UThzNExESHQ2bHE5dHhGUG9WMTVLSVhwTUloTi9s?=
 =?utf-8?B?eHBMSmxKYXZXK2gycjNQd2tOaGJjWXlwSEhVVHlsWFFDMnFnVWFNWWNqRnpX?=
 =?utf-8?B?b3kwYTc3ZHZ5dVhGMEpQL3kveEtEZTRmYUpRazA2UlNsQjQwMkFtdXZyS2xy?=
 =?utf-8?B?T29Pck1rcTdsVURHdnpBV3M2OWwzdWMvTFJ4UHFxVUhMcEhYRW1CMm1YVG1O?=
 =?utf-8?Q?2+p05N?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:55:52.3905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cc60e5-b84d-400d-7846-08dd9c54a58d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
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

