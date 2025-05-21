Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF0DABF9F0
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942BC10EA97;
	Wed, 21 May 2025 15:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0vemNurX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8A710E9F6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 15:47:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrOxjw0Hg4gPt5nab6D73dB9MLsysGIGQxG9ebylqzsbiK9n6V1osdY8ieVvQyggsYPdV0K1hVB8ySfTuqxJJ+XWNhZYPk/EeEeOEt2jUzdYK662Lh0J3xC3DKPkXpkCzxkBm0JIgWrQkp11qEx6pt8YutqEzn/iAgmLZT8emnU3KhImNRIVzM5RnWq90QfcGojRx0hbdh2OWNfokKt2fvYQfjDG0ZOU6+BJT+lyNvk3FuNIew+Dn8QwTUnvAjibZqjnrlgJ7xH6UMQpTj5d2uOM2zOMI5eWTs/W+mp9qcV+fnxEz8IoU1/Fc2XBPc3TBlvt6C8B/mUMZ/3nHWrRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zw2huqsza4q5J5wpoyqjqOyZRA3CmN84hy7iWKy+kRo=;
 b=nqbKFO059KkRT14+F8izeNXRFsyaXq6vEOe1pvVvc1faA/rm/At94CRAvoaCPqEH7ICPgUog6V3NG2GOjK+odBJFoSQH7CF6FKyNfUeQ6qciTsSgsG+d6CgtKxK4ymd3FBJuuQHl3R2JM5AAZfzJ1655DCA+GUMSDte00xM9x8dWvl21npmvL/zTdf/zrLXO2az0di7qYrRyJqxwnlDhuQ8jRuW4rLz7/cLyeohuzqw8ZoVqNAZw+bmtpG7wGhFWtUTs6IlfwzT1tzDRoAqNHO3WCs4fSVhS0IkZYSdZByVuX6qj7LN8DtJ0YPPx4bJeJ1KjShXMuoR7j9iNXJvCTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw2huqsza4q5J5wpoyqjqOyZRA3CmN84hy7iWKy+kRo=;
 b=0vemNurXepMuTJfrnSSQg4YZiYryBPqDASCZu/Kz3PquREWSgI3ZN7auo3d0/t+7vS3IaKQEnkh8xyhlBj/iD/9YW6shLlr00dBIzUwUnWRI7elDKOCarZQGECKI7gJQt8+q2l8+s7OS2WAj26p12rj0RIXk34Rt3uvQ6+RbSKA=
Received: from DS7PR03CA0268.namprd03.prod.outlook.com (2603:10b6:5:3b3::33)
 by CYYPR12MB8921.namprd12.prod.outlook.com (2603:10b6:930:c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 15:47:49 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::18) by DS7PR03CA0268.outlook.office365.com
 (2603:10b6:5:3b3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 15:47:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:47:49 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:47:46 -0500
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
Subject: [PATCH v10 09/10] drm/doc: Document some tracepoints as uAPI
Date: Wed, 21 May 2025 17:45:11 +0200
Message-ID: <20250521154531.10541-10-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|CYYPR12MB8921:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d82ef2-6a9e-4d56-b781-08dd987ed724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFBqcXlKVXM5aFlyQUxkSHFNNUpyS3Znam15TCtXTFVlT1lGNkdWMVFodUdW?=
 =?utf-8?B?ZFZqdEt0QVVPK0FEUFprbnpFeUlOcEV3bSswRm52TzlsNXZkN3RuSVNIZXZ4?=
 =?utf-8?B?am8wR05SS3puVXpGeFNHamllTXp4UGlvdWdYeFVnWnI0aC94NkNaMXdLWUxS?=
 =?utf-8?B?UE1LZXhPWWlyZHNROEEvMUNYR255Rmg3c0h0VDVRWURhODFDRGRaUFQ4SDFr?=
 =?utf-8?B?YmczcEowQW8wS3BwNFpZdnRXVEhoZlNMczhrdWNJcVNFdlVkN2o1cTFLUk5E?=
 =?utf-8?B?MVRZd2pTUzFZd29Va0ZDWVQ4Q2Y5aGxDWWRKc3VxL3ZUUVVsSUxUc3FhM0ww?=
 =?utf-8?B?VjJHTUxjcXkxeXpCOW82aHlBcUlnK3ZGRHZFYXArV2p5ak5XdGpNTlB4WFRk?=
 =?utf-8?B?QjQ0T2J1OFY3OWZtR29HTC9WN2xSK2xiUlFONlFOUFh2YWs0M1dMV1pzYmln?=
 =?utf-8?B?c0h6RU9pbllteC9ObTVPb1pBZWtBc0NMa3lINlcybnBOMlZReHNMM3k3czZW?=
 =?utf-8?B?ZnhEVVVzUUFlM0lMY3NETlNmbjJWMDdTdXZZd20yWkdLUHFwS1ZBZ1JqcFJK?=
 =?utf-8?B?OUpUbkdiWHBPR1ExVUxjODVlZm96aUtQUEJvUWNncEpWU1NXYVV1Qk40WjhF?=
 =?utf-8?B?blFzcStUaWVvL2s2ZDdIenRNRnJ3VThvRlFmQXVxNzNSRy94MnF2dXpMVTJV?=
 =?utf-8?B?T2YxZ3lySWxtOGNqdFgxTjVtVzhoN2JVeHFod0dMYjdIOFBEQ3JsYTNHczZ1?=
 =?utf-8?B?VTlJT3dQbXdJZlgzWnZKQ3pVMllkUFllYUdJVWZzd3V1YjJpQVQrSy8ybjZt?=
 =?utf-8?B?Yjl1QXh1OUVWNXpFRVRLK1AxbUZuVTJqdHVjVUJmZFZHM3RQQUxNMTRXeG5X?=
 =?utf-8?B?YzZsOGpzbWF3eVVoaWhldDl4bEFudDF1T2FGSjlCYWtJZm03K0pkWUdIdjhE?=
 =?utf-8?B?UXBJeUZHVUF3WUdSeG4wN1Z0TjNDamVaZTJtQno2d1JtckJ3blJpL0VGS1hX?=
 =?utf-8?B?cDU5UlhibjdkL0JzSVV0aWozSWN6REtTOVNwZlJRVXFOR3dyTGF3UXUxU2Z5?=
 =?utf-8?B?SDhyOFlicC9qc0NabmkrZmRNMmJmeFV6K09UVVd1VW5mZVBhcy8wTHNiWG5J?=
 =?utf-8?B?VGhjSklMTXQzMTlIZTcwOWtIdHczVEpGc3lRQ0Q0cisyc045ajYyWGtUVDB6?=
 =?utf-8?B?ejVodkw3cUdqWC9OU0lDN1VwaTlPRm5wK2VybTcxelNVZ0c1Y0NGdnBMVm5V?=
 =?utf-8?B?cjFRK09mTVVKM09qOVU5YWJmUkV0ays1RnVNVy9Jc01hQlNZVVExSXdBVnZY?=
 =?utf-8?B?UDB4NTRZaUJ3UVB5emtmcm9XcVlUb3d3dVg1WDlSZ2oxUXBNbFFxTGN3cFdz?=
 =?utf-8?B?UlFsemlheDhYSnQrNjNHY0Q5d0p0VHZqN0ZraHFrVlNzNm9nRTA3NFdBWFlI?=
 =?utf-8?B?azVLU0p3RTVnZ2Y4eXJSZERxWFZVOUZiYUpVVm9nelhHcXM4b0piY3FpNDRn?=
 =?utf-8?B?TVpxZGRvT3lZcnhjMkJJSzRKNnRhZXNwWEFrTncvU2VyS2p6Y0d2ZGMwSklP?=
 =?utf-8?B?MWZnYldrWURUdGkzSzFNNkhSbXZsWE41bSs3Qk1wUEhSWkZkRitiSTNETGxr?=
 =?utf-8?B?WUFla3ZMbUlvc25nSzhtV0pub1JUUE92TjhzSlowRlJDNWxKN3hpWi9yazh4?=
 =?utf-8?B?emFTeWtUbFF6VXZTaklaSnBJYUNmMkhsNCs0RWJLdzJ6bXBFbWNaTFlFUlJG?=
 =?utf-8?B?TFF0K1R3M1pBS2JnK2laL2JQWmF3N2ZveG5jbkR6ajM1L3I3UTJWSGo4aEdl?=
 =?utf-8?B?dERTSFM4L3d6WmYxT01vNmJHU1crcGRHYkpjUVNFcjA1aG9tQUV5YTE2UkRm?=
 =?utf-8?B?cUdvS1BPOGFtMFNSaTlYRjh0dUlrSjI1RHdoanhpMjZBNkdMRUU5dUFFSy9W?=
 =?utf-8?B?MGpIQWo0TlhtbU9FN2JqSHU5WWRWRFE1aVdHVlIxKzdIZzRMUk00ME4vQ0pP?=
 =?utf-8?B?eER6bVJCREpmQ1c4ekxob3VvR3JtaFArblVZaXl2bzVMVk5DMkFvamF2TVFp?=
 =?utf-8?B?Nk1INFJxT3padWFXaFBHUlhkejNDUDZwRFAxdz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:47:49.8476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d82ef2-6a9e-4d56-b781-08dd987ed724
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8921
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

