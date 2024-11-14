Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1D09C86C9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6BB10E7D5;
	Thu, 14 Nov 2024 10:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XS/wBEr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6918910E7D5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:02:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwfsT1vzRIVJetujCmcP7Jk1aLzbY8hdRjRoMEO8RCDRkVpe2OPA4Puq5CaDcne41+SvDLXoEW6ryhmaj4UWpo4PS238Lm9Tpl+agM+1dAMuZ2tGQYkVZWCaKq86bMuauAWPGEgYCq6UKnkD3t7PMtEhIza05KQ6RQI1UVLVHLzSktdhPRxMj/IAq5xkfq7mPMA5IEeS3ifqoVpp4RTVgWzuIpKQiW34gwsJDxM05F6ILU79maLZw0kxO+151WhLR9wyevkUBNYKYiB1derxVGlBsQtDrhuMxNUGoT0NO8Ncl27y4QGXVoO0fwcHMOKd/TnvvA2NRChFBHOLm0aziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHqlky2jJQBywqgURDkMuYDgeTAwtLcJqs5bODDYwhg=;
 b=fnoBsz2WEZVzuTXUcSY36u1zpnvw0ew69IZUC5NtPYgkwHiv5mNk+rr7A/ruBSL+i7lV3zrTzME65SewnFBFvDjbIoeyYcz4tUWveqnwZQuXeZ/DR3Ak9r5nyMFPfC9jtt1cY50npIW+SPbmd/FgAS4tSzYewpAVJmwSxQPpMDTLEYNBhS9tKUI/vV+DCrpPbkuLxhUj9VE8rmTSRYE1v7QA7MM0Z4LpFD8dDheEEa2LqWIpWrn4k9ovxBU3qPnpsWn4Q40snXwYRAfNCLpb7sLPUw5oVoK54RIK4Erk2m9OJs/GO1XHAyJLL4D/Zktay9ofHdEO6ZDhsjFkQk1uwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHqlky2jJQBywqgURDkMuYDgeTAwtLcJqs5bODDYwhg=;
 b=XS/wBEr+m5TCAIOJmM61ov/EOqwkRD1NzfdWScIBzhJnwbpwvbxgCo6xsd8Oik9D7rse3fs+nRBzk8jciycOCOw8j/vgmKFXWzMfpIuCzaZ00ZbIxs4b9jmye9R8SgSmYXcWa/ut4vhMXSokJY22qi1/EMbFr4ex9LHPTqPT/Ig=
Received: from SN7PR04CA0063.namprd04.prod.outlook.com (2603:10b6:806:121::8)
 by DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 10:02:19 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:121:cafe::f2) by SN7PR04CA0063.outlook.office365.com
 (2603:10b6:806:121::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Thu, 14 Nov 2024 10:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 10:02:18 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 04:02:13 -0600
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
Subject: [PATCH v6 7/7] drm/doc: document some tracepoints as uAPI
Date: Thu, 14 Nov 2024 11:01:10 +0100
Message-ID: <20241114100113.150647-8-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|DM4PR12MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fdad9f-cf7b-4f9d-cc8d-08dd04936cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGVGZlkxclZ2bGxVNnpLTTJsam0yQXczWU9VZ2JIeEhieDM4TGxYV3M3QTAx?=
 =?utf-8?B?clFSVU1Xc0JsNHBxdmRDdWN3WUJDMTVCNjZiVmFYaW5sMDh4TGNWTjd4YWFZ?=
 =?utf-8?B?ajU2R2hxTjloa0RTUjdHOHRjdU5nK2xrN3NXN2M3V0lkc3k3VVp4c2lkSnU3?=
 =?utf-8?B?YmZlQmhsQlhJZy9WZFVBR000c1lOQkZqQkV6eGRvMnQvaFdsSFpmUW5mTVkr?=
 =?utf-8?B?cXNSV3FhakhDeXc3dHB4bDM2ZTI1M1RSU0pLWkdrbE9WM1Mza0QyZXFVWWQy?=
 =?utf-8?B?aDlQdkdJK25oeTRSbmFUYjlwWnRHb2ZUOURFaGZiMTNCaW1uQ3dHbjdDbzRR?=
 =?utf-8?B?dTBzUDF2N0dDSElMU3Y2dDE5VVN2VjFVVkxFR2lnQ0txWmhaZ2dqTUwwUFNJ?=
 =?utf-8?B?YitrRWFONEM4dThNdlNVRDJlVXdCNlpvWk55WGdkRzBXQ1R0eXRSQXNuQVVZ?=
 =?utf-8?B?MzA4bHEvVE1iMjJBdkRnek9RN1lGSG04T25tYmNhTHhYZ3ZRcGhEdkZSTDNJ?=
 =?utf-8?B?c0luazRvOCtNbVRkZk9PWWNHeG82UXNWYmMzZElCdUxRWEpDdWxxVHNTZ0tX?=
 =?utf-8?B?cGs4My9ISWI2dWxMa0o1alpXWFA1TzZuaWIvaWEwWVJZMFBEM3VXTVkvSUxO?=
 =?utf-8?B?SFB6c3d6bmZOU0oveldFVFgweFRWc3NFUTgvcUNnR2xwV0dMc29ndkVZc0RZ?=
 =?utf-8?B?TmtUTG5BSU5rTkZzYjBjbUsxdjEwcExGbTE0aEwrbjdsUnhsQnk5R2ZxQzM1?=
 =?utf-8?B?ODRBNWxCNUg3N2lTM1hpZVFwVWNIa1hLbm5MaW56MG5jbkhuMm9PMFZUbFdn?=
 =?utf-8?B?cmtwK0dOVWQzemJxanIvSkZJc2dXOGlNUXphQlh2Z2hNa2JETVVsOUt3WUZI?=
 =?utf-8?B?WjVFMnZndi9ReHlkNGRNRHAya1MxeWJLVEg0dXB1Z0wzamtZZlFSdXhsU2pK?=
 =?utf-8?B?d2dLc2E5Z2M4K0hSbVpDT1YzWlFJMEpRTmp5WjdVaFJqS0d2aHp1MlZJd0ln?=
 =?utf-8?B?NUZ2bUF1a0tFbmhrQjZXUEptTnd2bFUxRkQ5bjF0Q1hDa1RDNTRhM1pZMlZw?=
 =?utf-8?B?VXFNNjc0cXE4aDk0TFJSVC9YN09NZzZoYkdEZThxdlFkY014dklYUFZsU3I0?=
 =?utf-8?B?cms5dUM0NUFlSDcwaWNKRUR6b2FrT2pYaXdrZXlJTCtzbUlDWkh4SjJmTDFm?=
 =?utf-8?B?QlhCVEI2dVNTQk1hTnRDN3hrS1M5WWZXT24xVmhnbWhzcnNTZTRCYm45Tll6?=
 =?utf-8?B?cyt6MHlrQkpvVTRsT0JWcSsyTXFSUTZIZVB4ajRCNkV3YnF2SVVWcmpBU1Vv?=
 =?utf-8?B?WXdCUHNqS0pRVWRLd2RFWGhiemFvb3FFNFRsWm1aL21CdC9wMEFMN3h4cWFa?=
 =?utf-8?B?UnJtRU4vdGorNjU1ZmhFc1VuNi9rN0dGUEhYaW9PWkVkRGQrZUwvY3JveUhP?=
 =?utf-8?B?MzUrdGZsTThucGE4aW9lb2tyU3kwZVBKL0ZLUjltYnRKVW0vL2laZ3Q5Q05F?=
 =?utf-8?B?YkIvNXJYNTdDTHlOS2MvbDVYTXBCZzRKeVpxUWdBOVI4M1pSRk9SbzlyZlJ0?=
 =?utf-8?B?amloeHdaRVVxbFNOOUsyRGE1VS9yOWpLMW53QThaSUVxaFlVMnVpWVNUT1Zk?=
 =?utf-8?B?VElPYkMxTnhCd3F0bkhsMVgwT0EyZktYZGV1cnRvYy9aK2tBS2dDemsrUDh6?=
 =?utf-8?B?ampoZEZaZ0hwK1UyUFc5a3Zvd1ZENGFqeXRHZkU2bEVCcnZwOXRBSm9xZUwy?=
 =?utf-8?B?dVRuOEpFaENNbnlTc0lGdVFtMTdXcmo0bCszTWRraUo5bnFkMkdqNVJwcnhs?=
 =?utf-8?B?bEdCQStsenFsZjJDMUw0ZlY1Y3RWZnNQVVlKcWFyYXM5WlVxYzJCRDR2UUhy?=
 =?utf-8?B?NUh3U0ZOVFprbnRPK1gydEsrZTZTa0srNllJSThGc2xDYjZZNjMvMERHdTY1?=
 =?utf-8?Q?lLDIvjiqvtU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:02:18.7565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fdad9f-cf7b-4f9d-cc8d-08dd04936cc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6280
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
index 8340c7c0c6b6..ec230e558961 100644
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
2.43.0

