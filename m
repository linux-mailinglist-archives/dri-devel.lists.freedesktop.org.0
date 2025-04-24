Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7D9A9A681
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7541510E780;
	Thu, 24 Apr 2025 08:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="31uQnfkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780F510E780
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:42:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQ3aEQe+yLlljKDmuKFLCNo3QZdIS+SS7TeUgkQSfIBWV6nup3JLy1+y0uNeJdpBX6ByfnYUG5aVJjKqVXGesekjbW64zDFiVlYni+EJf7TzmDwADmQa4bWDN7t0xGZMXckm6KVqp0ojqtun2V8ABLg/0HggwGwNtwtqnxAwBUoqu0Hp+845bmU132ipIuMGUPcQgLM83vat3NMNFMDiPuEhOO7NublWGam0r2JM5ejzrHSa4WspvYcUDpXnZv1nYOpEEAnBBFi7ynvwiPeiPd5hTqgO9GGFYVomg6vGTORchdowNKav9GY3arT7HVJrxGfmc+Is4zinjT3j0Am5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKFgSU+/n1w4KGuub1OiuFuizuepUpoFBaPgg06u1ro=;
 b=hxAurpG2C7HR1RhiFZwbV9RciTnWVFyK+iUEtbzGC+iJbAcKNLqa0eky2eranReZf/GE9/2aECToQZDpjwOA5Kl7lkgDWQS2ocE7vd/PK8GAvloaT//w3J+o4wafXo7rppBEZFXUh5kkfvajKMz3JPQNX/taT3UpnyXxc2C7vL6Dc93QxGD+7QDb4HyIgmSiVfRceb7F0gbGPzTWPVoyYNZG1bhE1zg60h/e419ELXXGtwVqiCmh+4G4U3xMA+LLJyMUYjB26IamNej3Yi/OcWojikgWIilynf61ALq6T2E9fglJoLP02VPb4iqbZL7GQYM8NRvd2ZjwAqIdGcnmsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKFgSU+/n1w4KGuub1OiuFuizuepUpoFBaPgg06u1ro=;
 b=31uQnfkznuaYIEy7Q9zwqXRWym8BZVnKOUbKuwEPn1hoaAPvzqd8Wa7Q4WXjU3StcUFJX8KcvcQDFzU576rYisGjrjXZLmk5JxSWV+7IOREgkCUyEGZKew0LTyUSgQGchYHSTIGtxQ0qXv+7EikBzeFp03rJSdctEqUi/foqbmM=
Received: from BL6PEPF00016416.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:4) by CH2PR12MB4293.namprd12.prod.outlook.com
 (2603:10b6:610:7e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 08:42:41 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2a01:111:f403:c803::8) by BL6PEPF00016416.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Thu,
 24 Apr 2025 08:42:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Thu, 24 Apr 2025 08:42:41 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 03:42:34 -0500
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
Subject: [PATCH v9 09/10] drm/doc: document some tracepoints as uAPI
Date: Thu, 24 Apr 2025 10:38:21 +0200
Message-ID: <20250424083834.15518-10-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|CH2PR12MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: b533277e-6afb-4fc2-aaaa-08dd830bf98f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXREZEMzMmwzdFZ3TDE4TC9Sd0VaK0w2eHdDSUMweU5IMDJpNzhwblVkdFJB?=
 =?utf-8?B?ZG92ZFhUbTlSV3d1MkhkSE1ab3ByS0FMVE5rM2RHWUVIUjRtbEUrMnM1VzJv?=
 =?utf-8?B?bG13TjN6S05Nb1I5eS9ZbWRTTU1JU081TStSLzcvNWQ3Rzc5azBtUUZzK3lG?=
 =?utf-8?B?UWcvK3cyN21lQmttUTFwQjRyOWUzMjZCU2hTREhtMng4SDlHaDk0cll4bVpV?=
 =?utf-8?B?RnBJWCt5Z05DZjNuQ1VXWCt3bHhMaUljUVJGcHlMdlNwMnErdEFrWE1mWDd4?=
 =?utf-8?B?aVdlTkMxYkJJVUFLSENhOTE2aEgwV015TldOQWtTL3QzTWRxajN0K1B0UXNw?=
 =?utf-8?B?VEgveWhHc0xSeFdFU3o3ZlJwbzFsb3F0d2YwdTVyU1hHTlhraWo4ODl0MlNU?=
 =?utf-8?B?ZERzSlQwM3MzQzR0TkFwVDE5UnZOQXlDSUxTMDlMcDV1dGZzUEdxSkRNSTBx?=
 =?utf-8?B?Q3hGNXhFcXNGRWJiYys3NVh6ZkZSSGQ2OTB0cEpIT0hYSWc1azdLVGlSL3BV?=
 =?utf-8?B?ZEpwcHlTVHl2YzV3NThKcVFrbnBmaGljQkdzeEdWYWtjRWptODN5ck1zRW04?=
 =?utf-8?B?NWN3VHBxN0VvRW1HRkVyNEE1OFVhRkRabUI1dk5pZW5lVW9UdXdEWUI4SUgy?=
 =?utf-8?B?YjRLZVZteVk1blgzMkdQUUVSODN4U1p6bGdSTFhheTNqTzRlWCtZVXByOVFk?=
 =?utf-8?B?MERTTkg1aGFyVkkyWWNwU1BkZ2VaaFhuZDFwdi9WbmRSRVBpd1ZZU3c3akVh?=
 =?utf-8?B?TFAxc1ROY1dOTU90RVhXS1h3LzlJK0JzVTUxTVgxZ2ZBNHMrN2FQN2hkeDg5?=
 =?utf-8?B?S3ZYbVZHT29kK3FjZW5QaXRUU2dJTnh6cm1WQkcxeTVoN2VGNktTNm9LOW96?=
 =?utf-8?B?Z3dkMyttUEQ4TE54K1RYR1Y2VUVUM1Y1T0JSb2dpek5kZ3VTMzlxMG9CU0sz?=
 =?utf-8?B?VWhHRHhkZStwYno3SkRpeE0wcEc5TFUwdzJ6aFpJM1IzdS9WUVREOVl1Tzgy?=
 =?utf-8?B?d1dobGhidlFGZEhBbS9NTGRxZWIrcXpqWEVRUUJWdGRtVGRqMDNwdDZySjhQ?=
 =?utf-8?B?WERJdFFGRmRpMjA5akllRERtM2xyTnhLTXNndnh5Q2JNVEZSTnlKcmZkT3Bz?=
 =?utf-8?B?WTJzcFRIcnlVS3hrbHNiTTVDZmZ1SVNUTzMzem1ZYVlUY0xrK2dGSGFhZWZy?=
 =?utf-8?B?NnVtVXQybHJZTDJSY2I3RlRTdjJhOFhOSmNuZUtZZlFPSU40SEYrcUNuOGxj?=
 =?utf-8?B?QjJIVk1sYXFKOVV3UHd0QmxZbEh4TVgwNDB6eFV0MmdrWHVYb0NUY1RLWlE3?=
 =?utf-8?B?QWtGK201UWJtRm1YMEh0YzlONHlYQzBjRWp5dVErTmZoV0tkNm52LytWM2l4?=
 =?utf-8?B?WU9PamtCNUsxb0lzWE5uS3lYWDVMS3EzK2wrSkw0bUdtQnlPdk9CS2JhdFdk?=
 =?utf-8?B?bFl6aHU5eFg2NmNHUUZVeEFEUUdmenJEY0xHbTRkNmZYOTR3dmVtWThPVEJY?=
 =?utf-8?B?YXo4TkUvcGRpbUYzbEU1cGtNMmdxS3YrNFV5bHBjQ0JZT09zd1hpWU5nQitQ?=
 =?utf-8?B?VCtndldFY0QzQkZYeHFscllHNVpZMDY1YnNjTkIzSU5zVklHQ0pMUFFySkZE?=
 =?utf-8?B?b2g1OTB4VjRrbjhVKy9SVklUUVNlV2M4OCtoNjQ3K2preUw3cEdaZEFBcTZa?=
 =?utf-8?B?dXdadno3eHpHVzBwZllSaUFjdU0rMDJsN0hGMVppbE9iM2QwNVRwb3EvT3Fy?=
 =?utf-8?B?Zm9UdXR5eWJvWnpxNEMvb0U0V0paZWM3RGpaTjdnVzRBd21MU3h0TTlwTXhw?=
 =?utf-8?B?U25xaWJpRmlzODJCZWJxM1JQaUNJUUZraERYVGhZNDhrbEZHWUJlZlRpVDZt?=
 =?utf-8?B?TlI1ZUovL1FCb1hPQ21NMmVaTDhQZyt4cEVrbVU2L3phaVNVN3M3UnBBZW1X?=
 =?utf-8?B?SVcrRjkxb3gxN3FzK0pQeXVDMXlLNlRWak5XQjUwTmViKzVZNmp2Yi9pNkxt?=
 =?utf-8?B?MmtmT09QREZQb3FQU1dINmIrUGVyUTFVTzUvWkpydzU5QnpNOEppNWtHNjND?=
 =?utf-8?B?aXd0RlhhV1JPU1piL2J3MTN1Tnh5dGV1UDVUdz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:42:41.0868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b533277e-6afb-4fc2-aaaa-08dd830bf98f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4293
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
 Documentation/gpu/drm-uapi.rst                | 19 +++++++++++++++++++
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+)

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
index 781b20349389..7e840d08ef39 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -32,6 +32,25 @@
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

