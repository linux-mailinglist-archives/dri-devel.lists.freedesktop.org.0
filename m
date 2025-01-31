Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2399A23CB4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 12:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D537D10EA78;
	Fri, 31 Jan 2025 11:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HZf9+cg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6326010EA78
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 11:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDPzhwQky0U62Rl+1Z/wv4LROxQUeBkqutiPKxLy26ZLBI6wMYYssg3xUWTT7NzB1js9OCJUAE6EocNjomskCPWEbPPbq3in+beKvcpFWAnJkbYOAgBOgDxk26RyeSovEl1Oqac4fFfOl9MtDqgWHulGICDHF0b21Rh+40gW1tLhQt71nEn3L/G3j7cSxXUtYcp/fI6pSvBAoqgck118yS2yzAy4YOlPUDVBhMBAisyYXucIFGjiDSEgSYsr+1Sc+cA47Hx1VHQ96v6qBQyzu4rjhx2vVF3l58AQ1Mr9Gs0xPI5a2LrOqtyxtqjuQ8OQoRZTHmeuENjTI8qIYerh8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6MDbT8v+gxmhoDMeriaMSYFjzzdTqJvYlcSWdv+Uy8=;
 b=smeGTNTZHWlr7u7y2hAUDbpojHTdL4RKq7wss20TsifrGHrbZMvoRvjMJw05e79y1IhPd6D8cNbUSZmsE7YBZceeYZEa1/itFERYBrDxWfv/2QZKU4bdewGhRKly0bWwtNfj1LkhFUgNfXMNgFVifZ4spGXJLSX54ICy2O9VT+cdfhiohRYZEoKs2GAE7tNEVHmgAfheN0IIHIj+7f06TxIZCOWAcnYVflrLQLhAbt46XYsUTyB2CLtrVLn8QHSzoIm6vtU/aEQqybqnsj7+GI7S58ehhnm2yFkWCiWWngNVI3UvhZ3GSwIo+sEqeap92oaTBTZ7uhwuBJXkz3/ajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6MDbT8v+gxmhoDMeriaMSYFjzzdTqJvYlcSWdv+Uy8=;
 b=HZf9+cg64wGLpQXzYUNmREaZDjRDUjYrAK7g6pKf5P1GRZgwmAr3Kh5kMigN9LYuSg/tEM9qHQ09kS9cC3fqKDqLvQt2wQ7IXBwSGFKvXx0jc5fjbgkz+tkq5CREyzh8qkTHh3Kog8vW7fomYOIpv9i+rf6+S0H+ubCtVqzzxgY=
Received: from MW3PR05CA0013.namprd05.prod.outlook.com (2603:10b6:303:2b::18)
 by PH7PR12MB9127.namprd12.prod.outlook.com (2603:10b6:510:2f6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 11:06:00 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::83) by MW3PR05CA0013.outlook.office365.com
 (2603:10b6:303:2b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Fri,
 31 Jan 2025 11:06:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 11:05:59 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 05:05:54 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Jonathan
 Corbet" <corbet@lwn.net>, Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <pstanner@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Lucas
 Stach" <l.stach@pengutronix.de>, =?UTF-8?q?Ma=C3=ADra=20Canal?=
 <mcanal@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v7 7/7] drm/doc: document some tracepoints as uAPI
Date: Fri, 31 Jan 2025 12:03:05 +0100
Message-ID: <20250131110328.706695-8-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|PH7PR12MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: 112b4828-5dfa-4ec4-7537-08dd41e73e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ukx4S2RTZ2kwUE55R2ZTZzZnMUMvcXFma1A5cEQ4S2phSURuSTgwTWlUbUht?=
 =?utf-8?B?NGNiWUJYdElLeXZsWkpDZExpc2U1MDY4ZDdwU0c1VVk0RGhZYkcxSTdWRUY1?=
 =?utf-8?B?SHhGN291QmMyYTBDeXZyYzdYNU5taWlsSU1lUEIrNzdNUWZ4ZDY1L1hkWGZ3?=
 =?utf-8?B?VEVBY0lHMDlVU2NJdVRMTk51eldsMlNSSWVoem0xSjV6dUVCZ1FsRFVJa3JE?=
 =?utf-8?B?Y0I2NExoOGw1YktPVmVaTTBrVGs0M1hjZ00xeVpOSTV2ZE5pVWRnekVWejc3?=
 =?utf-8?B?WG1pWktVajR0Ti9aWkI2NTFGSFRjUkdCVk5XZ0g4eG5ESCs4MXlBb2haVnpt?=
 =?utf-8?B?K0hKTGV2cVRodmNjQW9ROUFrMlR2a3ZXelBlQmdSL3hrUkpaM2pvUFV0VzFW?=
 =?utf-8?B?UEtzbnNPT2tiTHVjaXdwRmpNSnVQMjZ4VlZvUTlHQWZXQXhNTVVpODVNWS9R?=
 =?utf-8?B?ZFFnK2NPOGhLaGw2L3NLeGZObGVmNkJjdUFiN1hKWHY0Sy9mTmNxelV5Rldj?=
 =?utf-8?B?dFQybVF0UnBiU1Q2Z3JFR2FtSFVKTkYwazBCMmpBMm5BM0F4M3dZdk5qb0JK?=
 =?utf-8?B?eExxeFlmSU91Tm9EUExEU1VEVnJpaG82SHI1OXRVR1orNXhYWllVaXk1aHo5?=
 =?utf-8?B?OEJySVF2L2pzWDlFRTBzU2RIVEcwT1V0OWdEVFJmanJ1M1h0OTFKVE1SQ3Va?=
 =?utf-8?B?OFEwR00zdk5nWkdPaEQ5SWRIZk5WRkN0ME82NzJhZkZjajBjQTZSdVJxL2pF?=
 =?utf-8?B?ejl4eVJMZkVramVjeUxFZllYbHRGUTEyWmV5L1IyZ01wT2VaVVFvYzNzby9m?=
 =?utf-8?B?aVJMVXJGKzNBUVJPOENGc25aTjBjQ1ZzYXgzK2g5bUNzQjJYU2FnR3N1L2F0?=
 =?utf-8?B?dGxlSVFlRjFsVm9va0xIeWh6a1ZiRGVqR0g1ZHBQR1lPRTdrT3BEZDBCbGU0?=
 =?utf-8?B?RlNablpqaFBBSUF0NmxuTTdkeS9wRWNWY2U0Y3drVERrdUhaOFU0MXRueG1M?=
 =?utf-8?B?WXVlbTZza0p0TnZlN0ZwakI1cWhLVzZCcC9Cc2QvMFEwcGRuZlhPZ0VIa1Zq?=
 =?utf-8?B?TUEwRk9zcDdua3YyUUR0Vk1lMXRRdXhuV2VlWitHNXdVQXFMdHg1eGp5RUda?=
 =?utf-8?B?NEhLYkVseEpVd0dMYmxJdng5TWF5cjlyTUVFR1hRVW10emFjbjM3TlJnVWZq?=
 =?utf-8?B?bTU4YzlOaUtvYUFIVmt1Z3FEdW5uMVdwL2YrdUVGc0V6blJiT2lqYzBIWkZo?=
 =?utf-8?B?cjA0VEdkNmNaN0xnWlhzQXU1NkpWdFN5aTU3THl4SVBrYzhrRmZVYVc5cEUv?=
 =?utf-8?B?czU2SHNOd3IvRmRYM0ZvYVUrdUl5SWlEaEk2UHAzY0VTelkxQzJMZjdxT1FB?=
 =?utf-8?B?ZHFTb3V5aUxacEpLcG5LRGRQTE9KTy9YQlNucitROGZNb3hKNml3cW9rWFF4?=
 =?utf-8?B?OUtOb21tQkQrK1EyVmdJSlV5YTFYWkFjd29abmlTeHJTZ2FDMUpFS0FRVmpZ?=
 =?utf-8?B?ekhuY0w2UDJuSVRzWE9SVnhVZmV2eURuUUZnUkFPZGlZRmNtVytjWFlyZHFM?=
 =?utf-8?B?eXhINXQyd0E5WERnUzE2UENwUW9samhxUiswdDNQQ0lZTXhvZlFsZzRRM3Vl?=
 =?utf-8?B?YUNmOTgyTkdxZnRHR1BvMTRFR0xqU3FleUNtaERtcEg1UENmbDJ6V082MVBL?=
 =?utf-8?B?MnFxc2FXcklWOC8wdENLdlNJa2ZnZ2xDc2FWSkI0SklTNUVEcUN1Zlp5aUpR?=
 =?utf-8?B?STdnenNiZUkwaXJJNFZleUtXeDhMbVlwb09CQm1KQjNyMVBmVjB5VkdoOG1z?=
 =?utf-8?B?UkZqVlpCQ1JKeWxZYS9CWVB2NkhEQUhGS1BVZ05aZVFOU1dtNkFuOGRSWFNH?=
 =?utf-8?B?bnpQUGNRK1JRR2RNUHNIM2gvWDFxOWV4UjlKNFR4a1F5ZzJOOGVGR2o4aUYv?=
 =?utf-8?B?QklabFFRdkdJR3kxb1cxeXV6NldRTGR4Z0J3QTF4VTR4QU1xZkxrM0lFL0ty?=
 =?utf-8?B?eWNMWlNOTXEzR2wyN0s1RDBWMzJzMmNUTlJhdUFvTVBpL05WTklqbEJiUjRV?=
 =?utf-8?Q?yS/AVK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 11:05:59.7100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 112b4828-5dfa-4ec4-7537-08dd41e73e85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9127
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

Acked-by: Lucas Stach <l.stach@pengutronix.de>
Acked-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 Documentation/gpu/drm-uapi.rst                | 19 ++++++++++++++++
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 22 +++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index b75cc9a70d1f..9603ac0f4c09 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -583,3 +583,22 @@ dma-buf interoperability
 
 Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
 information on how dma-buf is integrated and exposed within DRM.
+
+
+Trace events
+============
+
+See Documentation/trace/tracepoints.rst for information about using
+Linux Kernel Tracepoints.
+In the DRM subsystem, some events are considered stable uAPI to avoid
+breaking tools (e.g.: GPUVis, umr) relying on them. Stable means that fields
+cannot be removed, nor their formatting updated. Adding new fields is
+possible, under the normal uAPI requirements.
+
+Stable uAPI events
+------------------
+
+From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
+
+.. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+   :doc: uAPI trace events
\ No newline at end of file
diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 5c740cb80037..85d547f3fadd 100644
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
2.47.1

