Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A109FA6A329
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEF010E5BA;
	Thu, 20 Mar 2025 10:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FG3GpjrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A45610E5BA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9RymT6og7sJTmkFYnt+iJgpjhLRsUIscwUKsG/YfNMU1Ka9AAB3ZAi5hJp0g69UP7FMxyfg/IXk6hHdHQSSROOhyZyByZNbnk3AQgZS8aW1dZ6lZzN/d5Wee0mGayWIaRlApFwpgmPOShdFAErQ+l4emJWWtXJqoYiDWTlm39vK0PFMCVhPaiAEePiT0xJ075GxYiJKwsfZOlPiLVrGuVHNgIjjzhotf6ZP1JA/gTiOD5t7Fkd2OuOZG7JvR3pElnFGcnX9TwvIFWxpbUcjhBi7QW4G9FWtObtoEpAaG0aODnSKGt3X4Rstr6ygM1s1M/MsPkorhP214hPr3eg+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVMF1EMzMmNICY/mkImE9hLbB4xuVw+XXWrQQFOtzZ4=;
 b=FI6fd9h4DlvmNfpj6vZQw02sSh1Qu05ApEkB3NItUAcP1OoWrmkv4tYp3AtX58u5YxhBoB51lnV8ePaudRcbuCPrfilRPz1nRPHpwQ/vkQZldcAPNag1PjHHPomycG+4R1kkvSmDRLz8fIvJsMqDhuax0Ur40hTaX+2xpZiTo6O/i/bKi2ksG+1O5XyglfAQxrfg8z5WWi69R2fZDXqEuef91L0ivVf6uUpP8jq2iBX2SpCDzqVKeLMP2a4QJA9uS8jKRr4vE11+0xTut+r3xkR7VXPD3SK76QhNZ0zhkMNRXQM2U2IQ0Dobn2NxAWV1HcgrVmFSWg0pS1ctPArTiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVMF1EMzMmNICY/mkImE9hLbB4xuVw+XXWrQQFOtzZ4=;
 b=FG3GpjrPLHZd61Exw8TouLpBSTmWm6aONnPkmjngms+LazrGzIOwFtVOd3U9z9g6+Bc55j9y+qutqRnPXMVBQB8fLLntIhTJ2ca8vv5a7eWV6ICJqiAVqU1E9dWSkU6TFZtHmAjnCKh5SvSk2ZuTh2ylAwXCI1lzXOOccnv89/o=
Received: from BL0PR0102CA0038.prod.exchangelabs.com (2603:10b6:208:25::15) by
 MN2PR12MB4160.namprd12.prod.outlook.com (2603:10b6:208:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 10:00:21 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:25:cafe::7a) by BL0PR0102CA0038.outlook.office365.com
 (2603:10b6:208:25::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 10:00:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 10:00:21 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 05:00:17 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Jonathan
 Corbet" <corbet@lwn.net>, Matthew Brost <matthew.brost@intel.com>, "Danilo
 Krummrich" <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Lucas
 Stach" <l.stach@pengutronix.de>, =?UTF-8?q?Ma=C3=ADra=20Canal?=
 <mcanal@igalia.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v8 08/10] drm/doc: document some tracepoints as uAPI
Date: Thu, 20 Mar 2025 10:58:04 +0100
Message-ID: <20250320095818.40622-9-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|MN2PR12MB4160:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b82cf8-0e33-4896-0349-08dd679606bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmZNUkpzVEQ0bThnWlhjKzZLNGNITGY4N0gvclZNZjNJR2M5Y2tZL3AvcVdJ?=
 =?utf-8?B?V2xMRXVDVUdEd0JuNENxKytQcDFtWkNLWnlpbERZSnVSKy9aUFVkZGxXNGl4?=
 =?utf-8?B?M0U5WXVlVWFrKzVyb2xaTWxZdUk0a25uRmJVZHd1bzliQWdkbFd4MUVCdGVV?=
 =?utf-8?B?T3BoTXpyVm0wd3Q0NEQyeDA0YzY5elVaVnBmUnE3S0paaEluTnRPaVFsRGUx?=
 =?utf-8?B?Q25NaEZPRmRCWFVkZ1BxVUMzcFRJdENGNkoyN0VmZU9oQ05NRXoxM0RubUpk?=
 =?utf-8?B?WDU1TkgvQzQzY3c0dkg0Z2N4KzdsbWsvSHllbkxUV0RCZEcvMTN6WHN2V0kz?=
 =?utf-8?B?VkluSUJubU8yWjNwamNTTmxDbnVGb3oxVkJiUEhVVEMxbDZsbGhKM1hxUWhP?=
 =?utf-8?B?QlNwWEtObHdaK25aQk9OSUtkUWM2bmdRVmZJSStYQUtwSUNpc1phRG9KSk9S?=
 =?utf-8?B?RHJLakVybkZDczRndXNJVldsNzB6SURIWkU3SldtQ00zVU80Uzl1QTZCc1pE?=
 =?utf-8?B?VlZNbGxtUzNsTlc4ckRSa3U3cUZoUnhPZXdhL0M4b1FpWDNRZkxYdCtFR3or?=
 =?utf-8?B?YW1RcUJuendBeHRuN1ZUaGpOdFU1aUdSc2p5ZUpKTkFzL0x5SW05L1FNcHl0?=
 =?utf-8?B?SVorSUpBY3JOdUxpU2hCbmZ3bjZOWGxmSkowMkFUd3lkSHJqWEhYWDRxaUY3?=
 =?utf-8?B?WGVYMEJFaWR5Q1pPaFFOamtDdmc0YmRZUmgwV29OT1hVMmx3OWIxSk9EQm1Z?=
 =?utf-8?B?TmhYRE9wU002TXFxdlFUMUdZeVRSNWhybldXZlByekpyaS9iUENDbkp5dE1K?=
 =?utf-8?B?aHJWRzJZWTBtVCtyOE9DbmdJV1Q5aUJxbTdLODJSUXNIekRIdjJxMGNJV1Zu?=
 =?utf-8?B?S0EyczdIWDcxYVMyUTh2cm5VZDJGSXNLNFJKaEQvcnhRM202ZVdvUmUwWXFj?=
 =?utf-8?B?ZHBuU05NWFZVOTZrYld5TWJReVdTeGpybGVLaXMveTBCSlNPUUl0VjQrN09N?=
 =?utf-8?B?VG42UmZTVGZ4OTZuOEw5WUkyYzJ5TzQ2VXlQZEU3aWh3bVhiZlkvaUM3N2Zp?=
 =?utf-8?B?bkNGa0NKdjV5MGNFZmxLRHc2ZDlvbExKMkpCbUJ1T3RLb1VvNlZOUEhaN1N6?=
 =?utf-8?B?K1ExRGJNVU5CZEdmczFNQXdKSWxTUmtNaUhhQlo1ZkdRNzlIM0hRbjhodmRm?=
 =?utf-8?B?ZVZzZDg0dmlETVp0ZEpLV3VtdGF5aktKeW9wNkI0QkoxOHBDbFk5cTcyY05M?=
 =?utf-8?B?bU9YMXI4RnhpdWlhWGFyOTVna2xCT3Q5eVRub283NHQxQ0haRUhjTFhPS2FD?=
 =?utf-8?B?QW9NZTJiOHlBbDlNV1pwYm5kR2Y3enJLZUJtUmpnN0g4V2wwczRmQ3FGYzEr?=
 =?utf-8?B?OHNtOXZYZW1tbkE4RkVEdldtM3BKSllqKzRJUXR3OU8wc3pZRGIwZlNkcStD?=
 =?utf-8?B?R05KVUlwbWJiNXA1Rm1JMytRZlFRc0FPTDAvL0ZRV094VS9pdW80YWlEU0VW?=
 =?utf-8?B?ejE0aDFkU0FmMGk2UWVUTGRuUTZsMSttazJrT3p2QWJYaDVjaFBKY1MvRDNT?=
 =?utf-8?B?WjBKVEhMY01NR2txVnBraDE2NFFkaEE3VEsrNjV1NDBLbEhvdVQ0b2oxSUlM?=
 =?utf-8?B?YzNpTVo1eTlTKzJEY3NnclgxYVhpd0RnTTNGR0VJcDIwRnZrU0hhOFN5YmNU?=
 =?utf-8?B?eFZPZGJlYjlTNS8zclZON2UwR291bmN6UnU0bk5JUVN2L1Q4VHhlUS9rUzB0?=
 =?utf-8?B?R3BpeG9zOTRZdk1zdEFmM3FFaVZmNHVxSnZ3Z2xNS29nR1F4YW5vZE10ekRK?=
 =?utf-8?B?QlozbnM5UXR1SjN1NXBLZ1lhOTVhSFdmLzRucVEydXU5eE5FWVVha3U0alA3?=
 =?utf-8?B?MzRxUnNzR3EvTE5FNXViSG5XcWVFSzZjWEtBS2w1NW55VlQzNDVnMS9qM2I5?=
 =?utf-8?B?ek9GbTF0TDk1TVVjMzJJcU4rZS9vSmw0Mk9sdlV1ckdYN2pQdnIrd2VGZDVy?=
 =?utf-8?B?T21RaU1xUkFQdXBldzdyNlBjQ2JQNHJQZDNielZlZkNVWFRUT1UrOWhiLzlw?=
 =?utf-8?Q?JuGs3E?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:00:21.1815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b82cf8-0e33-4896-0349-08dd679606bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160
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
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 Documentation/gpu/drm-uapi.rst                | 19 ++++++++++++++++
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 22 +++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..4863a4deb0ee 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -693,3 +693,22 @@ dma-buf interoperability
 
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
index 4ce53e493fef..3c7f6a39cf91 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -32,6 +32,28 @@
 #define TRACE_SYSTEM gpu_scheduler
 #define TRACE_INCLUDE_FILE gpu_scheduler_trace
 
+/**
+ * DOC: uAPI trace events
+ *
+ * ``drm_sched_job_queue``, ``drm_sched_job_run``, ``drm_sched_job_add_dep``,
+ * ``drm_sched_job_done`` and ``drm_sched_job_unschedulable`` are considered
+ * stable uAPI.
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
 DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
-- 
2.43.0

