Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE1AC3FD4
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5654C10E369;
	Mon, 26 May 2025 12:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LBYjKjgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348D710E369
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 12:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Clb7ykSBid4sQQsY2ifx7GstAIzsuMnC4MjEx1xvylR4KLKJ6AvOlmarIaSKS28UKTj7q6oiaWPyWoxwup64zX/uTd3G1GukcheW0MH4+YupEyecIOdulsCTjdLYMdpe32t/joIEn5DT/e7l5Tc06ZixyHKsPpeIwg/njwEDRG2JfenBKy+vaax+j6HvxRJ26YKU+yQw0PiKl26gWdpdms6xzog6LL5uqM3i67FPxOHZWqw3IqqOO43ZFwRyXdBR56pFhdmSGPt/In0GPU+N2et2n5YP2aVaLGi1pexcFYN8xbQwtbC4dwK4JAu5KiYD3WLuObP99b0NqTLeQE7Zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zw2huqsza4q5J5wpoyqjqOyZRA3CmN84hy7iWKy+kRo=;
 b=ilxMDph2jqKAQQbA+ps9GNqjNcTDXXxu2SSljW9/r8kBPEYG15xdEJYedjqO4YJ49oaq0CQ8oQNiFq3qkpz4s1ACWqmUIHc8HGzzyaRhiHFisytO3wjC81pOoSu4+ujJwTJy4MOqCQQKKPO9k5vVde2zGHHgRS7mn0t4zVWKHc/8z9gZqTccNA0wO1arTHXFckjf1sCSfNLOS1umgJJRZ7wpDIm3NHxf3+totAqCEosgTd8tTUHeRQW7ulqSBHIJWLPP4wO05qDIOOaZygdkv1hcym9uZvdw1KhkAuuX7npsaSefHe56ZLftujydxz1dTH4pu54NwzBdIX8HgCDUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw2huqsza4q5J5wpoyqjqOyZRA3CmN84hy7iWKy+kRo=;
 b=LBYjKjgoDeXApNYl6PDVywXke+ZXvDt/f2zXkoDh1c4OofooOHyVj9Ecqfhj6nFz8ZrM0myHjik2Xeo4Lp1Rfi+ECJmv8JHiJiTuNK4zAu72Og2cU4TaEj6ms9xJ6CGdJVEKaKKmtHelG5AQS617o3tGX+8eiNf4Ogxb99CBNrA=
Received: from BYAPR01CA0039.prod.exchangelabs.com (2603:10b6:a03:94::16) by
 PH0PR12MB7862.namprd12.prod.outlook.com (2603:10b6:510:26d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20; Mon, 26 May 2025 12:56:21 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::2b) by BYAPR01CA0039.outlook.office365.com
 (2603:10b6:a03:94::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 12:56:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:56:21 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:56:17 -0500
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
Subject: [PATCH v11 09/10] drm/doc: Document some tracepoints as uAPI
Date: Mon, 26 May 2025 14:54:51 +0200
Message-ID: <20250526125505.2360-10-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|PH0PR12MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: d43c0d50-3325-4015-7361-08dd9c54b714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXdvSXdDSVpLUitud0EzZ0ZQMks0NUFqYmxqTlFsME42azJ5MUtlKzc4aFps?=
 =?utf-8?B?N200eVhQcHM2d1hvYWYwZHZyZjlZRmRreHNlMzEzTHZHTnRodlh3QjRIMXFn?=
 =?utf-8?B?RkVyc2IwcUNKYkd2T2wrQVlQWCthWkFsVkNyL01DdTVDNU1ZYll4cll2NWVu?=
 =?utf-8?B?N3lTRE1GK3hoVW91bG9BRVhtcFVwOXlsU3NNVmVHeHZ6V2s5aEl0MDgvSHN0?=
 =?utf-8?B?dlFQQmVsY2RLcWxCc3c2RWN5UnpNbVh2TytaalBGT2RMQ1V2Rjhpa0loYUMv?=
 =?utf-8?B?M1lYTTV1ckFmRjlqZGpiKzVNN2kwOGF0djlzOUFWZEl0VG9oeTJwazBicjZV?=
 =?utf-8?B?d29YazRMRlgxTHVZUHFkajNIUnFmU0J2MUY5YU54Y041bHdTcWY0aG5HaDVs?=
 =?utf-8?B?M2ZMdkhvNTRlODdMQkdJWHYvdHU4NHZmbVlQNnJrWHNMaTFvdVExYWJONlpF?=
 =?utf-8?B?K2QyVzhsWTFnSjhLZEVpbzl5UDdVUXZLSFhMZzFQM2g0WXhKR3dKbG1VNlVN?=
 =?utf-8?B?Z2g5aGloV3RoL3doN09IenBqb2FIaXVtc0ZQNnQxNmNuNU1xdjZGNjFwUE5h?=
 =?utf-8?B?c2NUZXNEN1VKV2N4eCtMRTJVT2VqOTJjSW9XektuZlRJT21XY1ZyRmdXQnI4?=
 =?utf-8?B?MUpWZEhCQ1ZhajlVa3VVTXJ0OGFDanZjamJKdFVwOUp4NGFWdzFhS3k0QjB2?=
 =?utf-8?B?YVJsWWlHT3BHYzhWeFA3eWp1Nnd6V2xXeGtuWnFHM2RsZkYxMENDeGhqa2c0?=
 =?utf-8?B?cjR3eWRIYVFIbXRXckZmaHEzWGsyd2phcWNqRExTWkRSU0xOVHNRMnVrZTQx?=
 =?utf-8?B?UHpCQnZOSVpPNHcvVE5zalJqWHJ0QzlLNENuY3BvZ1lMWndZSVBuT29Id3BC?=
 =?utf-8?B?Mktma3RmY1VFRW12SitidnZabDlTSlNtQjdMREpRdksrWFpxKzZ4MEkzN1BI?=
 =?utf-8?B?MjF0Y1M3Ui95a0orTStsS1kzUWlwMGRRblJTS3BYaU5zbUJDMHFzcXdzdUxC?=
 =?utf-8?B?aFdzbVEzeTc4WlFnYmR5bDY2bFhIamh6SmM2QTdWcVRSTktJZTNxaEVmTnZV?=
 =?utf-8?B?d1p1SkVUMzNnM3dvNjN6RFVvVVJQNVhqeXZob0ZhVVp5dDFGN0wwRnRiTVIw?=
 =?utf-8?B?MDBmVSs4RlJKZ0p1eEhXdnRFc2xZK1IrL3B6d2xkMmd3K0JwODYzUDNRZ0o0?=
 =?utf-8?B?NWp4OXN6MENDVDI2MkZmbDB6TWZvRnRQbUVMS2o2NFg1RlJBeVpSSXpyMTYw?=
 =?utf-8?B?dFZKNUNXdzFJUkpFUCszSC8zOThPZHBycFRsQ3hLekRyQldmelowemRCTmNn?=
 =?utf-8?B?aUtBRmxlWnVncGtZNVEvTTQvVUdyQzIvWklseS9uTUVGdkNZYUI4RXlReE5s?=
 =?utf-8?B?TmJ0enB5ckxpZGU1OEZZa3UxMzE1UHBCbXZWSjNRbDFndzFzNnpzWGR3TjFu?=
 =?utf-8?B?RHF2R3ZkVTdJTkswL3pCR21rcDJZd1d4VGllSEozbUg4MjV1TE54cWJPT1kw?=
 =?utf-8?B?N3Nqa3hXaFYwTGZiTWhyT21vU21FNlZPU1dFdng2Z1NvbFNqUmp6cDgranda?=
 =?utf-8?B?RHFOQW9xT2hOUnJQTjdMWWg2U00wNFBjOUxERkJnYlc2czB3dzkwZjVpRklj?=
 =?utf-8?B?ZlFwUkRIdWJubHZDZEVtYkowanF3MHlBMHFZejVYQkQ3cnpTWlFWVm9qanFN?=
 =?utf-8?B?WGFNVHBRcXZUQVphK0JrTmpOaktkdGJOUndOTzdJOVF5ajUzR29JbnF2RVR1?=
 =?utf-8?B?clYrK1R6KzR2dk9ZTFRaa0tlZzdFVWlibWV6NVRrVGNzQmQxeDRFLzAzTkpq?=
 =?utf-8?B?cG9Wc0RjTzF3QUhHQjkxU2l0TzB4a2VJOGx1TjZ0QWhFZDFsRllhTzVZWldE?=
 =?utf-8?B?Z2J0SWoyczlYcFBOYlBEN1R6dE9valZlYnRoSEZBUVZzR3Y5Uit2OXdSNkY5?=
 =?utf-8?B?NTI5NVMyaWp3dTdidDI5Y1ZBSmd4ZitFQU1SRmxIRWxhSjlycUIyeUpmK25p?=
 =?utf-8?B?aEpidlJDUG41QjBobDJBRGNSS1BuaFRZSmU4VWJjbFlFeWVRaG5LbnJsb3VR?=
 =?utf-8?B?SUhyYmZ0aTJnTGYvMmxxUmRHcUF4ME1NZUpXZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:56:21.7969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d43c0d50-3325-4015-7361-08dd9c54b714
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7862
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
index 781b20349389..261713dd7d5a 100644
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
+ * * ``dev``   - the dev_name() of the device running the job.
+ *
+ * * ``ring``  - the hardware ring running the job. Together with ``dev`` it
+ *   uniquely identifies where the job is going to be executed.
+ *
+ * * ``fence`` - the &struct dma_fence.context and the &struct dma_fence.seqno of
+ *   &struct drm_sched_fence.finished
+ *
+ * All the events depends on drm_sched_job_arm() having been called already for
+ * the job because they use &struct drm_sched_job.sched or
+ * &struct drm_sched_job.s_fence.
+ */
+
 DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
-- 
2.43.0

