Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FCF908606
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B4F10EC98;
	Fri, 14 Jun 2024 08:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oi50Ar9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EE410E18A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:18:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYu6pPGclnLMFTFFnxhc7w2kjL+XF+s6Shu3wmWlFhpZb21lfoPPD8YxA6t7L7v0QVaQQhzEoV0UUwszTQU5VaDsu/KtujbLtRs/o2NPGhCkbeLYS55B5mTzXiMzuNbMLyA6JZOoZnw+Jdw/G8RmbvRoJIqbQkddMERXcehGeh3zz/XaRKm9AKKT9AvHSPSMJx/fGuypJegx0uqjFNvi11SHss+dnMFNbKoUqpUjTvHnGk9jnyr2i8ZZzX62XuH4iLJ33MddwcWC81SHpfANQ4F+acJfBQnV4RqsQLBSJpJx1ieaSBP+QrGqImVSPiZ+10ODXYITfI6oOrhO7zXcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhpfcrPtJUGHsIQ6J/VfJOHVZUZSokPu5gYEkYQJdkM=;
 b=Ysdq+QRSJGOh2i0mtgpujvrV51xeUepU3hTrzDoj/OAo/MeFSCTyiFw8Xcsjlz2TcEfpmtnruO2B70Ipx3QbAehrY8F4ZG+dL+oXNxfPMVCSm8JfaOn3Iyaa8en+0GNHhGhZXrQ2kfjNfnqD45AEFF+MHUL3OIQTLl5voGSBvO/t43s8F0YOuR0LXjLyvt9aJB2gFz/u+OBGbiDyDC55mz7cogjTWOV5/sN0x95D0rxhutiqvFOa7mpjtf8i4O2x4gzZZs7YVV2U8zrgOKt8yJhgoYXHNtQsr53QBaPxn4++QnwRSwCk+H1O3CZsPcYP4uhJ4cpCfotP95v+6UiSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhpfcrPtJUGHsIQ6J/VfJOHVZUZSokPu5gYEkYQJdkM=;
 b=oi50Ar9JF9SLKTlfN0Gpzw4jX9OqnpQw3RM8fuq+hsILz5ZCrorBuJfZd/DKD064W9rfWHyuRcELp0kcYhR20cOt/SNI3bSQuruzehQbuGTuLICtBKrDz65kRGWDwEpCdFV2+igESMuKGCOMpLnM+5ycZSkKotgv0PMtf89kDFo=
Received: from SN7P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::24)
 by IA0PR12MB7555.namprd12.prod.outlook.com (2603:10b6:208:43d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 14 Jun
 2024 08:18:26 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::ef) by SN7P222CA0026.outlook.office365.com
 (2603:10b6:806:124::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26 via Frontend
 Transport; Fri, 14 Jun 2024 08:18:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 14 Jun 2024 08:18:26 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Jun
 2024 03:18:22 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v5 4/4] drm/doc: document some tracepoints as uAPI
Date: Fri, 14 Jun 2024 10:16:30 +0200
Message-ID: <20240614081657.408397-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|IA0PR12MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 932ff18d-cbec-45e7-a4bb-08dc8c4a90f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|82310400021|376009|7416009|1800799019|36860700008|921015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6S4RqUTMW441n+m3Aq/dePhuxgZFsu/xS5usLH0a+QaHR+/QIaPXAOrTV6Om?=
 =?us-ascii?Q?AU8EOFpEKymmgMfN8DZmre9AsQ3CkAtK/jqQe4cchwvIHrRQolWL2RceaTrB?=
 =?us-ascii?Q?TJJ6vhfhaandD+mY3UG13SsxBAnmU4xc6YT0iNtgxDqecg7vwAK8g+1RSeCA?=
 =?us-ascii?Q?jskthTBQFVpeEufrH4xE6vSSsDoMYJPmempau5xAIV37cO5GWEwSRlwmwITy?=
 =?us-ascii?Q?2DRmGo/x3d9oTrGXluUDE9AIW8ypVX6jBaU4ZGD4tIxWZhfrlQawduD7ponj?=
 =?us-ascii?Q?ZonEBJYm/nSkYuOXKAy6virCuwJPGfwY3da1050xCH/avm873ogG0y6nIkef?=
 =?us-ascii?Q?oCeT9Zi/sS7jsKUeCSMpwrB8J2wj6SQtmxSeCTnjaiOA8g0eFseA6rPyN11G?=
 =?us-ascii?Q?L66uUBWLdT/MCphIa7kLET8POJ6beaXY484on1mtX/sWt7UwlvrnMHuabIfc?=
 =?us-ascii?Q?/0yZ7KYDyD8IQJziPUbAiN1LpM5hh8LTinTCsTieljCz8n45LBaMYXATSQu4?=
 =?us-ascii?Q?6X8bTdF9kL3DY5dGqPYZ4g8A04nT+8SzGxN5A3COAatexZunw9ClYjLboHKH?=
 =?us-ascii?Q?EjzAPnCGwlVSQLrnvUoNPbp9y8FnZP3DpIVQlta/8LMPXP2O3t81Sz5aWull?=
 =?us-ascii?Q?mDF/J4fxAK9sTrok5xGHqgSC24Q50eVniseCxu2tsLe2sPHt0g94o5vuL504?=
 =?us-ascii?Q?8V1hegtjAIQJLEwnxXDY14sq0IV/9UpvBjseePdKuPfcmJ65CvWklDueqoFv?=
 =?us-ascii?Q?MX5XBL0rS9jmjABLMAix+jVJg2glfw5ANMRHv/8arN8YwiSbDfSgnI7l+hSh?=
 =?us-ascii?Q?WvuiuJxvAEpWfvuj6MRQquUOY56q5ZClGJgtI/CBB9PQjX2zViQxHdUF5Q/6?=
 =?us-ascii?Q?Lk0a9OUtxLyqSChzyP9ewIbjEEePQiiRaizW/Hs+l/RB3FMJn5YBClCcLcbp?=
 =?us-ascii?Q?ehZJBrkqbdraWDKy91wX9tmh7xtmSIQk5RCXqXwN6+jfjublSX6ISZn3v5x+?=
 =?us-ascii?Q?9zdkorMjZkcHOYLaecQ6PlR/LJ1sdHn60IoeNXRiWd4V6brTmxqd+tyGOUNm?=
 =?us-ascii?Q?u59oaVxii7KmovadyyUG7tkg2rocWFsTkyqazgFt50UBKpPnGNYR6P2xxH2s?=
 =?us-ascii?Q?0maxTK2XfCrFExSyc4ghss5TcLlCHFllVEMtcwTwU36ZARNpYJvCi3+PLXYe?=
 =?us-ascii?Q?W4LvZifrEFCySG4IaoTCQDWVBxrmF6sszWIq5gvZIxTY/nDgjZ7XXaKFqWQs?=
 =?us-ascii?Q?C9Rnp19B58ULFXeWld80XCLfqM8PXJRnYQuXZ1QDnJBhD2GY//tyhYk0Je9N?=
 =?us-ascii?Q?UOFNmKx4oxxLgVCRswgrtqb5dMpHseeJHaHimpy5D/bpHO9LD6VQ3ExifxAp?=
 =?us-ascii?Q?Ax/DFjV6V1cgupQOxWEc/T6gCpAoVFjzPpqDOh1oV5Yyvi+3hCmZjsvZm9KX?=
 =?us-ascii?Q?oIdZSj1nyTs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230035)(82310400021)(376009)(7416009)(1800799019)(36860700008)(921015);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 08:18:26.1210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 932ff18d-cbec-45e7-a4bb-08dc8c4a90f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7555
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

This commit adds a document section in drm-uapi.rst about tracepoints,
and mark the events gpu_scheduler_trace.h as stable uAPI.

The goal is to explicitly state that tools can rely on the fields,
formats and semantics of these events.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 Documentation/gpu/drm-uapi.rst                | 19 ++++++++++++++++
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 22 +++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 370d820be248..78496793a8f0 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -570,3 +570,22 @@ dma-buf interoperability
 
 Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
 information on how dma-buf is integrated and exposed within DRM.
+
+
+Trace events
+============
+
+See Documentation/trace/tracepoints.rst for the tracepoints documentation.
+In the drm subsystem, some events are considered stable uAPI to avoid
+breaking tools (eg: gpuvis, umr) relying on them. Stable means that fields
+cannot be removed, nor their formatting updated. Adding new fields is
+possible, under the normal uAPI requirements.
+
+Stable uAPI events
+------------------
+
+From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+   :doc: uAPI trace events
\ No newline at end of file
diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 0abcad26839c..63113803cdd5 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -33,6 +33,28 @@
 #define TRACE_SYSTEM gpu_scheduler
 #define TRACE_INCLUDE_FILE gpu_scheduler_trace
 
+
+/**
+ * DOC: uAPI trace events
+ *
+ * ``drm_sched_job``, ``drm_run_job``, ``drm_sched_process_job``,
+ * and ``drm_sched_job_wait_dep`` are considered stable uAPI.
+ *
+ * Common trace events attributes:
+ *
+ * * ``id``    - this is &drm_sched_job->id. It uniquely idenfies a job
+ *   inside a &struct drm_gpu_scheduler.
+ *
+ * * ``dev``   - the dev_name() of the device running the job.
+ *
+ * * ``ring``  - the hardware ring running the job. Together with ``dev`` it
+ *   uniquely identifies where the job is going to be executed.
+ *
+ * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno of
+ *   &drm_sched_fence.finished
+ *
+ */
+
 #ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
 #define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
 /* Similar to trace_print_array_seq but for fences. */
-- 
2.40.1

