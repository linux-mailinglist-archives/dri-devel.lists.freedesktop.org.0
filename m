Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17D9ABF9EE
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B73A10EA8C;
	Wed, 21 May 2025 15:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kPG3J/k8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8499010E9AC;
 Wed, 21 May 2025 15:47:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndqhxHWkSPhF0VANcjIlqyk8slyeCjsQmfTjaggS+S4KWvpdQQ4siyWLvrkaw7czkI80Pdtdg2XKlsmxCoquB0uTlTBNuf6XqS85z9kPOsJ9KxthdX0lDud7W3ARPhjlAej3QZ9Rfr5Nt5K+uxr7FlZnbThYZeC3rvQLhJAiKuzbA4bII52NBTE4tBDnLv0vzf9R+Ta801e3WhfdQx/xnBm2mx0LgMYMxX2JukP5EACDUe6WjVTm8Z/bmC8Cbejo/0VCqEhElpPQnngonqoaU3JCAfaPaD/F2eQXKljn2ThLfcbxlTDmIh901C6CQ2ePtL9zr/4/8n10iNSEn+Hw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOnLoFOpLRz6Gj2tBAha/TmS17lgyunKFrLXL2KStYY=;
 b=fS3j1WtFl4Yy8V9Ymg6//NjlBmkzc5g2KXYDh1q/JZDb5KBWig5YIOl4o2Gh++PGXWlTxg3O0oE/zTZF8oFwarMiVXp6qix9D1l5vypM8B1r+IcEqVlxmeJ1WaM+whrx5bmpqgpKexeP0w+3sY8mA/ib32scGCN4ZhIbTEQwX8YPDXNuJHTZzFvSoAct0CS6KJxN8RGwQ6urZ6sq5cljSpytI4e24IjwbuPxo4I8cEGFr7O40OmPyUNlh/EQ4JwNBde9DBqN8FSlK4r+ZZW66IpnD4n0YVGoGurJITeKjfejbS1ocYfuYwTL2PLHW7OP1Pcw0qtbTUiMfM1kBH8YCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOnLoFOpLRz6Gj2tBAha/TmS17lgyunKFrLXL2KStYY=;
 b=kPG3J/k8++Qgtu0ZL/smrfaVDg2y2NG/RUkv2NGhNyM+kKtzhuF5T8aQAtdcqAmVXm1uQtozhlNmT3yoUCwTH8yxkHt736WPkJAPv6kSxhy8T5ZrU63yFzGcin3bHkAHmoGNzhLOS4Ko9Secf7w8gr9rjpiIaVwz7Ot1v326Qac=
Received: from DM6PR08CA0044.namprd08.prod.outlook.com (2603:10b6:5:1e0::18)
 by SJ2PR12MB8649.namprd12.prod.outlook.com (2603:10b6:a03:53c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 15:47:42 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::3e) by DM6PR08CA0044.outlook.office365.com
 (2603:10b6:5:1e0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Wed,
 21 May 2025 15:47:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:47:41 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:47:37 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <phasta@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tursulin@igalia.com>, Arvind Yadav <arvind.yadav@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 08/10] drm: Get rid of drm_sched_job.id
Date: Wed, 21 May 2025 17:45:10 +0200
Message-ID: <20250521154531.10541-9-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|SJ2PR12MB8649:EE_
X-MS-Office365-Filtering-Correlation-Id: 7268f07b-1852-491d-52d1-08dd987ed22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0gvKzRzRUhFVFFPaytJeTJsL2U2alIvUkM2UnJaZTAvdnhmanpLZDdvcWR4?=
 =?utf-8?B?c0V5VHNyTGh1VEVWR0lidGt0b0JwZElGcGM5TkdvcEZMOWN1UWtIL1I1c1dT?=
 =?utf-8?B?UGIvM1RPeWxxU3pENzduMktCaUJhSnpqeGlrcjFVRFV3SFk3NC91N09JR3Bq?=
 =?utf-8?B?UHRFbGhsNFZPdTBQWkpCT080VE9yOVFPRmI4RG54Wk0zWW1mNTFtK3BZRWtZ?=
 =?utf-8?B?ajFTRVc5a3RIcjBpVGF4Z09nTUlxb2syc29qWEtzcjRlZk90ei9oa0tBdkFh?=
 =?utf-8?B?UC9USko0TDdqUWhNUzNIMWNaa2ZpdmMza0w0cVF2SmZSQms5ZVREc3NCbVBh?=
 =?utf-8?B?NzBQcnVWNkNWWGRBWThqS3ZLTGRuZWc0YTVaWTcra2xwT2hWSFFnMisrbitV?=
 =?utf-8?B?UFJld0Y3MUNrMWljQ1lEVE5JdmFoekgyMzBhSFlqblFldzhTelc4d1VsdkRF?=
 =?utf-8?B?Mkw4QVM2L0kyb0ZJa3c1amdPUlNmNmZFMjl1aUlqZUdkaG9xM1dWZUpsakdB?=
 =?utf-8?B?Rk9EMFhLZXNEWlk1d3NKVGNlWFpUQytOaFY0a0RtVU43YzFhQWZaTEcwbXIy?=
 =?utf-8?B?d0xsTzdjWDdJR0dzcFpianpoVnpaRHRvRGE4ZXVUQUJoR0t4TnFLUjgrY1Rh?=
 =?utf-8?B?MDRxWDBtSWVBTFQ4cHNpWmVOWmdhbmFTRDBWUzVJMHBrMjBOemxxOUFYMTNM?=
 =?utf-8?B?Q1FQZ3QxQjc0U3dFSVd3Vld1ZVIvOXg0SmdQTVkvTm11Wm5acWxBZjNGQjRH?=
 =?utf-8?B?NUJHNm5xeUdHNHI2TkVRaFJqOWZUMndxdkl4SmZVM0RkYVdjei9pK2tnd3FH?=
 =?utf-8?B?bmJhQ1dxOFJrUTVoZE8zeTV1d0xoUzYrU24xdmNsUTVicStRRUhTVTR4UTRp?=
 =?utf-8?B?eVQrOHNxRGVtRlZEQmZVTGgzYXRzTTM1MFZNajVaSHRVRTFZY1ppWHZnZmRF?=
 =?utf-8?B?UDliRm5yWWRMczlvbFJ6TitrNDJ5Zng4dFVtRUJHRWVwL0M1Wk1FYlZxU0dm?=
 =?utf-8?B?S01KNHF1YXhFdi90VU51ZTRyRVVLVkQycW1BbFNRYVRXUXJPU2lWMHU0dSto?=
 =?utf-8?B?NHg5SklSTnc4Wm0wQzJrRnc3Q3ozeUFtUDdqMUxCSVEySCtSMTZkTUFFZEVL?=
 =?utf-8?B?NThIbmkvcUVnVG5NOUoybEhGQm9vKy91eDc2d2gvaEM1N1BPZjNycmZiNHFQ?=
 =?utf-8?B?Zm1TbDlVb1J2aUJZY1h1N1J1ZXE2UnFqQlo5L3RkK2t1SkVuTXpKMU9mWUpk?=
 =?utf-8?B?d1AxS0pDTi94aHp6UEZCZDlOL1lnZ1FEeWZRYXY4QmI4M1c3REJ5REovbi9M?=
 =?utf-8?B?VFVuOExvdGdEenNXbmlUVFU4eDFHaW1Od2ZYZWtPMCthdlhSVjdhVDIxRHNq?=
 =?utf-8?B?OG43eGQybFhyeXFOcWNXS0hXYWtIc3dIWFpFNWpjSkRYNEJOVmpxejlnUU5N?=
 =?utf-8?B?KzVIR0JBRkZXN3Fla2J3SVVZaGdqd0x2bFJCdFQvMU8yTURVOHJjWlQ3ZWpX?=
 =?utf-8?B?Q2ZiYUxVVUd5Tmw5WHRlazhvZmZjbW1NcUZEdkc0TVBjb2h3cUUxYWJDRDhq?=
 =?utf-8?B?eXBnWXNtOUg4SjlTc3dZdHpYeXJHMGFVS2lIcWlhMWwwVm9Hd0RrSFFQN0Yy?=
 =?utf-8?B?Rk9xcUJMbUFXdDhmbk0xaEtsYmtlZi8xVS9mekh0MFZPNHdaNndkUm5KWEQ1?=
 =?utf-8?B?bmtBQVk0dUFoQXhNWXVBZlFuSldLdkZ5cFY0bHlPaVBZQTFQL0dWNE45T3Zm?=
 =?utf-8?B?RUhsUnhOaXhuWEVxS1E0UnNaRXd3MmV1RCt5SFBBSnNOWThuUU01bHpxYVdT?=
 =?utf-8?B?TGJBRi9rYUJpSnkxS3hsN1NrdzZ2MU9PTXlhbU10ak9xSmxKNEVpSysxVDYx?=
 =?utf-8?B?Y2p3eDIxZ2Fzdm9seW9haGswVHg3WEFOUlpKZFhjaURRYnFBRnQvUXBCRjRW?=
 =?utf-8?B?Vi9BT0JqbXViV3ZzT3RWdDlsUHNESjRhQytUR1hpM3NkOVI3K2xSZE5iNW45?=
 =?utf-8?B?RVNyNHlucnFaZFhUSUQwTlNtbUs1aWRham44OEJQdm8vV1lNb2phdHZpdkJR?=
 =?utf-8?B?T29PZytSeTdqa0dTMkNyQkpveEhKYVRHQURNQT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:47:41.5090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7268f07b-1852-491d-52d1-08dd987ed22c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8649
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

Its only purpose was for trace events, but jobs can already be
uniquely identified using their fence.

The downside of using the fence is that it's only available
after 'drm_sched_job_arm' was called which is true for all trace
events that used job.id so they can safely switch to using it.

Suggested-by: Tvrtko Ursulin <tursulin@igalia.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Arvind Yadav <arvind.yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h      | 18 ++++++------------
 .../gpu/drm/scheduler/gpu_scheduler_trace.h    | 18 ++++++------------
 drivers/gpu/drm/scheduler/sched_main.c         |  1 -
 include/drm/gpu_scheduler.h                    |  3 ---
 4 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 11dd2e0f7979..4fd810cb5387 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -167,7 +167,6 @@ TRACE_EVENT(amdgpu_cs_ioctl,
 	    TP_PROTO(struct amdgpu_job *job),
 	    TP_ARGS(job),
 	    TP_STRUCT__entry(
-			     __field(uint64_t, sched_job_id)
 			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
 			     __field(unsigned int, context)
 			     __field(unsigned int, seqno)
@@ -177,15 +176,14 @@ TRACE_EVENT(amdgpu_cs_ioctl,
 			     ),
 
 	    TP_fast_assign(
-			   __entry->sched_job_id = job->base.id;
 			   __assign_str(timeline);
 			   __entry->context = job->base.s_fence->finished.context;
 			   __entry->seqno = job->base.s_fence->finished.seqno;
 			   __assign_str(ring);
 			   __entry->num_ibs = job->num_ibs;
 			   ),
-	    TP_printk("sched_job=%llu, timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
-		      __entry->sched_job_id, __get_str(timeline), __entry->context,
+	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
+		      __get_str(timeline), __entry->context,
 		      __entry->seqno, __get_str(ring), __entry->num_ibs)
 );
 
@@ -193,7 +191,6 @@ TRACE_EVENT(amdgpu_sched_run_job,
 	    TP_PROTO(struct amdgpu_job *job),
 	    TP_ARGS(job),
 	    TP_STRUCT__entry(
-			     __field(uint64_t, sched_job_id)
 			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
 			     __field(unsigned int, context)
 			     __field(unsigned int, seqno)
@@ -202,15 +199,14 @@ TRACE_EVENT(amdgpu_sched_run_job,
 			     ),
 
 	    TP_fast_assign(
-			   __entry->sched_job_id = job->base.id;
 			   __assign_str(timeline);
 			   __entry->context = job->base.s_fence->finished.context;
 			   __entry->seqno = job->base.s_fence->finished.seqno;
 			   __assign_str(ring);
 			   __entry->num_ibs = job->num_ibs;
 			   ),
-	    TP_printk("sched_job=%llu, timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
-		      __entry->sched_job_id, __get_str(timeline), __entry->context,
+	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
+		      __get_str(timeline), __entry->context,
 		      __entry->seqno, __get_str(ring), __entry->num_ibs)
 );
 
@@ -551,7 +547,6 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
 			     __string(ring, sched_job->base.sched->name)
-			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
 			     __field(unsigned, seqno)
@@ -559,13 +554,12 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 
 	    TP_fast_assign(
 			   __assign_str(ring);
-			   __entry->id = sched_job->base.id;
 			   __entry->fence = fence;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
-	    TP_printk("job ring=%s, id=%llu, need pipe sync to fence=%p, context=%llu, seq=%u",
-		      __get_str(ring), __entry->id,
+	    TP_printk("job ring=%s need pipe sync to fence=%p, context=%llu, seq=%u",
+		      __get_str(ring),
 		      __entry->fence, __entry->ctx,
 		      __entry->seqno)
 );
diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 4ce53e493fef..781b20349389 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -36,7 +36,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
 	    TP_STRUCT__entry(
-			     __field(uint64_t, id)
 			     __string(name, sched_job->sched->name)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
@@ -47,7 +46,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     ),
 
 	    TP_fast_assign(
-			   __entry->id = sched_job->id;
 			   __assign_str(name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
@@ -57,8 +55,8 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
 			   __entry->client_id = sched_job->s_fence->drm_client_id;
 			   ),
-	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, client_id:%llu",
-		      __get_str(dev), __entry->id,
+	    TP_printk("dev=%s, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, client_id:%llu",
+		      __get_str(dev),
 		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count, __entry->client_id)
 );
@@ -95,7 +93,6 @@ TRACE_EVENT(drm_sched_job_add_dep,
 	TP_STRUCT__entry(
 		    __field(u64, fence_context)
 		    __field(u64, fence_seqno)
-		    __field(u64, id)
 		    __field(u64, ctx)
 		    __field(u64, seqno)
 		    ),
@@ -103,12 +100,11 @@ TRACE_EVENT(drm_sched_job_add_dep,
 	TP_fast_assign(
 		    __entry->fence_context = sched_job->s_fence->finished.context;
 		    __entry->fence_seqno = sched_job->s_fence->finished.seqno;
-		    __entry->id = sched_job->id;
 		    __entry->ctx = fence->context;
 		    __entry->seqno = fence->seqno;
 		    ),
-	TP_printk("fence=%llu:%llu, id=%llu depends on fence=%llu:%llu",
-		  __entry->fence_context, __entry->fence_seqno, __entry->id,
+	TP_printk("fence=%llu:%llu depends on fence=%llu:%llu",
+		  __entry->fence_context, __entry->fence_seqno,
 		  __entry->ctx, __entry->seqno)
 );
 
@@ -118,7 +114,6 @@ TRACE_EVENT(drm_sched_job_unschedulable,
 	    TP_STRUCT__entry(
 			     __field(u64, fence_context)
 			     __field(u64, fence_seqno)
-			     __field(uint64_t, id)
 			     __field(u64, ctx)
 			     __field(u64, seqno)
 			     ),
@@ -126,12 +121,11 @@ TRACE_EVENT(drm_sched_job_unschedulable,
 	    TP_fast_assign(
 			   __entry->fence_context = sched_job->s_fence->finished.context;
 			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
-			   __entry->id = sched_job->id;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
-	    TP_printk("fence=%llu:%llu, id=%llu depends on unsignalled fence=%llu:%llu",
-		      __entry->fence_context, __entry->fence_seqno, __entry->id,
+	    TP_printk("fence=%llu:%llu depends on unsignalled fence=%llu:%llu",
+		      __entry->fence_context, __entry->fence_seqno,
 		      __entry->ctx, __entry->seqno)
 );
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index abe8eae752e5..bc465ee9072f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -853,7 +853,6 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 
 	job->sched = sched;
 	job->s_priority = entity->priority;
-	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 6fe3b4c0cffb..48190fdf661a 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -326,7 +326,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * @finish_cb: the callback for the finished fence.
  * @credits: the number of credits this job contributes to the scheduler
  * @work: Helper to reschedule job kill to different context.
- * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
  *         limit of the scheduler then the job is marked guilty and will not
  *         be scheduled further.
@@ -339,8 +338,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * to schedule the job.
  */
 struct drm_sched_job {
-	u64				id;
-
 	/**
 	 * @submit_ts:
 	 *
-- 
2.43.0

