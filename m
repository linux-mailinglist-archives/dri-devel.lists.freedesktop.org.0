Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F80C92E66
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 19:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00DB10E8EC;
	Fri, 28 Nov 2025 18:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZukgEHGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013034.outbound.protection.outlook.com
 [40.107.201.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED95210E8EA;
 Fri, 28 Nov 2025 18:22:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNKstrD/RERT/ZEvbuJNpMyrqnSpTuyN9glLJbynGyNGc6fKU43gbAK1azX8XX48mtatOKXhOIC4C+TPEmBehQQbJaDK8cdSMdawQ7OtjPPzMSerUd7RoSuax48UvzVtlRva7DPEfFBQEiComPkWnPmNvSaLjPMalsJLVgEL3dmX2LgUt24jJAl73IZiYjIQt8L9KKGKjrYd+ciajSvNUP5HXFcv7Va5fLvrufIBXjQrFsFRTbxd09/q8RftEY+L8mcn7I6uBbtoyUVp/gwRmppiXFblROgOCkwiQhB5OP7ueXPf8DmQDTeLu5bUZiGJaLrcoIpcDVg+Hf+37vaNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJQTDGWaq4SPidgJAP5paYbVGbvU91pTcnacFbowpa0=;
 b=Ajq30LOZR4baf0YYLj+xKovZRj8bm9d0ltYKZ0SRLLqnomHU1EDnQSTm4AeFNFFPiHEYdcgRdA1KXTitzy+BXUDtc09rgpw39IvO/L9+rC0Lu4V3YcPaQqhAMX8D1xS9xhaiFWZH1S83Zm5W5um0krGD2GzUbiO+nzJGyIsAl4zSRyhJ879CYhbZMv1W415/FEoc01bRO0lhkS35CpmLynOaZrLNqjT73t0qiHIiFhkKHqdZv5pGhG/1KJwEDv7GfGngKFFmgG/sq9PKaqxmKu6ETScjjRiFOvD5gqNtl0+0gPsHunaF0FVx+oyhirQR1RjuUdVRrq0LpRhrPQrXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJQTDGWaq4SPidgJAP5paYbVGbvU91pTcnacFbowpa0=;
 b=ZukgEHGxK03xacsy3KeKJ7l1xgaDDMiIBo8yiFOvQHeT7Qwtv4lMUkgBe5q+G0q0ZoWmiUwewKblgRlyJ5raP3yXpXVRkpekOWuk4eocFot6K2N0jz8NbkDSPNyUB0gLQpXEXs3GhLqqSq7yckuPs4Kcits/Xw/6eJYKkEF7z28=
Received: from PH7P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::20)
 by IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 18:22:53 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::40) by PH7P222CA0017.outlook.office365.com
 (2603:10b6:510:33a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.16 via Frontend Transport; Fri,
 28 Nov 2025 18:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 28 Nov 2025 18:22:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 28 Nov
 2025 12:22:52 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 28 Nov
 2025 10:22:52 -0800
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 28 Nov 2025 10:22:51 -0800
From: <vitaly.prosyak@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Philipp Stanner
 <phasta@mailbox.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/sched: run free_job work on timeout workqueue
Date: Fri, 28 Nov 2025 13:22:22 -0500
Message-ID: <20251128182235.47912-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|IA1PR12MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d656f45-4268-4b32-65f0-08de2eab2508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0VVaElKWk9DRFJaTDI3MWRzYnhxYXpuaVlaZUFqS1QxMk1wL0Vpbm9MbVdZ?=
 =?utf-8?B?VzBEOE8wNDRtZzAvcm80MzYvclJpYjE3YXIwM3FXMFFkNzgycjZONEdNTFdJ?=
 =?utf-8?B?eFVkaEtPc1ZuMitGTGxBUVBQUEkyVTk1dVZLWGNlTzdud2lHbXo1L0VvSUNk?=
 =?utf-8?B?TEhsSDJVNUVmTThLZXhoUE9IdTl2S0xROGRsaFBNUlI3Znh2QmZaMW8yZFRX?=
 =?utf-8?B?L0R4dzJPN0ZIWUtISXZ0T1VENTdJd2tud3NKaWFDajlDVVJ0LzlXREc3ODBz?=
 =?utf-8?B?ZGVBY2Fsdms0ZUhGQ3IxZUdKSnRxdmplTnQyYnFFMmFyWjhHc09uVWg5SEtJ?=
 =?utf-8?B?L1pTdmFrZkhFejVSNDViSWhvb0xuTTl2cmtscElINGNISTU3LzhqY3JZdnFB?=
 =?utf-8?B?MTNUNENsYkh2Z0gzcHFnV2crUUN6UlM2Yy9JMmxFdkpMQUFMdytveHAzdFNi?=
 =?utf-8?B?Z1Y4ZG9vN01qZ0RRTHVQY3RXaC9sRDRaeWxZbjA0WHlUNlJrRXliYnQ2R0Mz?=
 =?utf-8?B?TE0rUVJ6WEJ6Y25PRjd0Uk1aTjZuOEF6bXd3THdvMUZlaDYzNHlYNzl0QWVW?=
 =?utf-8?B?MUNveEhRUlFXb05hTzBmOUdXOUlpN2FZSEpvbWxKZjhyRUpsS2o0ODVNRTdo?=
 =?utf-8?B?ZENIbmpuaGJnZCtaRlJsUW5HTjVrOWpQMUhrcDRXNEY3TVhxR0Vxa3BRNjBs?=
 =?utf-8?B?T2pkUXBaZFd1dUlXN0l1N2tMQ2VBSlpjQ2FXSXFpQndEaTRjVnhzSEE4U1Bo?=
 =?utf-8?B?THY3T1JjT3VENXd6TGsreFVzYURLVFJhdW16RWxHREZBTHZwRE9rNSs1Y3Ur?=
 =?utf-8?B?U2NzSGRlV1NkWGZBcnJxOVB1N2E5QWZQejd2TDFtR005dzhWcTRkeGRVNGFO?=
 =?utf-8?B?OU1TRGdzSWFrZE1vanNiTHlRT2NBeVJWZHZLMmk0Q0NIb1FoQTRhM3U2MURv?=
 =?utf-8?B?Qjg2UWNodzY0YTlOVE9IV3gyQXJJaFkvQzV4WjlkclVIQWhESFJNSE10S3ln?=
 =?utf-8?B?aTZYWDlPWWxBWHEzUXFBMEhtYk83enB2dzJHQTBCaUdSRk9nTThEYzJtN2U3?=
 =?utf-8?B?SUhDMm5HQkJJaWZkdjVaNW5kV2pyZW9QeDFud1Bab2V5S1dKS2lyY3kwNDVY?=
 =?utf-8?B?NDhoUnBpNUtvSDZjRS85NnhzWkF4Z2d5V05ESGp0YTd0UFdGWW5idUNXVlV2?=
 =?utf-8?B?UVgxVTNuM1ZpQlRNUHRINUVkQjZDL1lYakI0RkR6eWZDclRadmxEcHdFSHh6?=
 =?utf-8?B?SGd3VGpxOEZqclh4MWRld0VpeS9MOWRmSzliNENveWE3VjZMdTd2MzN2MDZ2?=
 =?utf-8?B?U1pvRlowbDZHNFdjeVVXYi96R2VLclBsWTFJNTV3MWZBbzEwN2pxZG0zd09K?=
 =?utf-8?B?dFNVUzF5QUE3Z2JBSTZZVDdYbGExa01GUTZHcU5lcGtOMFJXN0ZCR21WVnA0?=
 =?utf-8?B?R2p4MWZCWENHQWdDajB3Nk5ZNFA2NC9DNGx2Z3ppMnZKYTBQSnBsWlpvbWMy?=
 =?utf-8?B?TGkvcmZVRzF3Yks1bmJVZGxNS2doZjl0ZHlqdTA1TTd3Q2k5OEJ5T2lFelJF?=
 =?utf-8?B?Q3FOcC9Mby9DbFdmZitWT2dnWXVLRzJzT2RPQmNvelFFZ0RpVEUxQXlNOTRi?=
 =?utf-8?B?QXdnbllVbTVTTXlqQnphZVB6ekpEMkFwYnMzZUhOUFhOTXhjZk9GelQ0TXlK?=
 =?utf-8?B?bDlneFoxRnlXSW9HZTJjVXpJaGl3RUo4RXFRVDk3N2R2ekJiWWxJSmlZOWU5?=
 =?utf-8?B?QVV0ZUd0anl3R25hb2IzQUNPVkNVWnZkWU9CZ3lzK3psTndDMW9mS25kTFk2?=
 =?utf-8?B?WTM0dWxHS0hNb0htYUFDcEFKeXhDbmF2aEh6Y2FNSTNMVThCZXVjNDZzWjJL?=
 =?utf-8?B?RFFCNHA3a1FHWWE0WGtiTHYwNW9zZTBnVXN3cEluWWJNNTRCbDI3NnYxd2hs?=
 =?utf-8?B?OEZHb0JXV2JYMC84ME1rdVFTY1I5UGhSQnlzNTRPL25nYTJhdldsNW91dDNZ?=
 =?utf-8?B?VTBJRWV5L2gycThBYnJoQTBvQWYvUEFuRDNWNTh2VE1xQkkwSVVCUWZLOXl0?=
 =?utf-8?B?R1BFUVVjZityMnVzNmZwZjlSSVcxdGVMdUhJOVFDOVlleU5jRFUrT2NOamVN?=
 =?utf-8?Q?xlwE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 18:22:52.8060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d656f45-4268-4b32-65f0-08de2eab2508
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061
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

Currently drm_sched runs run_job and free_job on the per-scheduler
ordered submit workqueue, while timeouts (drm_sched_job_timedout())
run on sched->timeout_wq (e.g. amdgpu reset_domain->wq).

For drivers like amdgpu the reset path entered from timeout_wq may
still access the guilty job while free_job, running on submit_wq,
frees it. This allows a use-after-free when recovery continues to
touch job fields after drm_sched_free_job_work() has called
ops->free_job().

Queue work_free_job on sched->timeout_wq instead of submit_wq, both
from __drm_sched_run_free_queue() and drm_sched_wqueue_start(), so
timeout/reset and free_job are always serialized on the same
workqueue.

Behavior changes:

- work_run_job stays on sched->submit_wq (ordered).
- work_free_job moves to sched->timeout_wq (timeout/reset queue).
- Submission and freeing may now run in parallel on different
  workqueues, but all shared state is already protected by
  job_list_lock and atomics.

Pros:
- Eliminates reset vs free_job race (no freeing while reset still
  uses the job).
- Matches the logical model: timeout selects guilty job and recovery,
  including freeing, is handled on one queue.

Cons / considerations:
- For users that don’t provide timeout_wq, free_job moves from the
  per-sched ordered queue to system_wq, which slightly changes
  scheduling behaviour but keeps correctness.

Cc: Philipp Stanner <phasta@mailbox.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Suggested-by: Mathew from Intel during XDC
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 81ad40d9582b..1243200d475e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -355,7 +355,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
-		queue_work(sched->submit_wq, &sched->work_free_job);
+		queue_work(sched->timeout_wq, &sched->work_free_job);
 }
 
 /**
@@ -1493,6 +1493,6 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
 {
 	WRITE_ONCE(sched->pause_submit, false);
 	queue_work(sched->submit_wq, &sched->work_run_job);
-	queue_work(sched->submit_wq, &sched->work_free_job);
+	queue_work(sched->timeout_wq, &sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_start);
-- 
2.51.2

