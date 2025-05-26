Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F0AC3FCD
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E15E10E376;
	Mon, 26 May 2025 12:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="279k4V55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6998D10E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 12:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYLyz9AxR5v38OQY9DUmWFk15Y35RkaaYpeMEkWaTEtt/qR3g525rTiR0JmOWFG+zMZXlxlUmWzkxQhxYcr7vdy99ceO1Ju6NY1D7JO+jjSzWfwcw8N9xQ8f/ygxVJB1rAK3Yxx8SN8wYDIT9TzNVNpt87B2mZkc3HFJiMVxPzHp4ZFdGe1ZgJthm9MCG+Io7gW5k0r38ViDyhCJpYn0O0T4IMPVm/HMiiLZp1zpjH4oxCB2XAB9K7+pxT3wp2xCdN3dx0OdQpnblL3C8jvlSh+1CSUOMOGJ/NzR/ZDmKrTdJRHvBi3IwrdO/Sb4tGLS+a9OWaD4heOBdgalmG6c8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vGanW5G+cl4+BNxxLumLfFtblzwjadMzyNYW0AStKk=;
 b=RGIHXGHzAkYAgY+llDahW9aSiEKBTiWyHeuOMIZxj+G5ugVxIkhpQIIZbVltclTmwIPi3NGBebBnW7qXzlUxfuWoXkudLn+LNLu3lVpaMTHL3GsN1daDn2apNMulSTpzpXEpgmO8C/Qud2NL/Su3ZQG+CTz+5WbxvZafhaXs/1G1Lr17I1/nzoO0spjZWbJcXKbwNK0K1x/0I6WKhMEjutv/mcL5OxpFvI3u7CmmPmlpMNv5BhKsxOjrnXOCGdvW4vF8tZCGWd6BaV3l8ScM5ZWGB6+PUpq692Vlc4EBuR706pew8fN9qXi5+cR1CH64nSjpXow/9J+xEboURl0Kdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vGanW5G+cl4+BNxxLumLfFtblzwjadMzyNYW0AStKk=;
 b=279k4V55xdfdmrD2neBf6oqyTSYI/IRqPER9WBnNaJFg/Vj2l/dj5hgqgkzLNs4QqVEZmtpTZwbTVDjSpxEMwGsqSoojpXtCaBgW2DdMl8yZHRqIUagrUvXWTpYMH8BrqAsFlCc/g2nLl+o7PBDwhHnWPbfqp/6/wjpm9X1Ib9w=
Received: from BYAPR07CA0033.namprd07.prod.outlook.com (2603:10b6:a02:bc::46)
 by DS0PR12MB8270.namprd12.prod.outlook.com (2603:10b6:8:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 12:56:04 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::9d) by BYAPR07CA0033.outlook.office365.com
 (2603:10b6:a02:bc::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Mon,
 26 May 2025 12:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:56:04 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:55:59 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v11 05/10] drm/sched: Trace dependencies for GPU jobs
Date: Mon, 26 May 2025 14:54:47 +0200
Message-ID: <20250526125505.2360-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|DS0PR12MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: e7676363-2c0c-47b9-5b01-08dd9c54ac9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BUWvp7nA2NnNnNd2AP+lHd/6yaLa/zfZS89xQbN562MvFhC8HzGQbmdlfdd+?=
 =?us-ascii?Q?B5WTLScRUjtnwM/mDmpDTi9cOilvHyIxsO6VeR6WxogLz65Tjo4eqyZkD+w7?=
 =?us-ascii?Q?zvjlTKPoEIIdXKKRNGSSsPw43oUdOukfVHs7VhfvysZysbcY3Rvi08m+mJ0P?=
 =?us-ascii?Q?n8jwwB9sqQSdITxVgtjKPGkbNqu1mvA0yEKXMGadaZ1QLg8W2SH3MemTIOkr?=
 =?us-ascii?Q?3CewepcHVjFws3skE2LOhfRScYzkiwlkotKK3q08iNEitQ8Eq7PNSOVPnQ5d?=
 =?us-ascii?Q?QUq36VA6SbAQK13rCg+RLejydr62uYbAShBhSzaUvYm955yBijze6ErGkbwa?=
 =?us-ascii?Q?AOGKm04hFpAthjb1iWUPdEI+L17ttjvI3yTTGga60RilImBqVf6ASdqx2Ob/?=
 =?us-ascii?Q?F3OJGbIVMz6Xtqn7MT3+5cqympIXM5YjKQ5wuEiLyqXxX2QfT2mrCKBGN3JB?=
 =?us-ascii?Q?RLRCyJQGL+VJVGtbQfHZvZ3t/GXqCY/yfQTRHnXbBuPKQihftf2nzHS7DicR?=
 =?us-ascii?Q?6uSHohkHFNAn2zHjNEwuAx1HdeEkeyf6utsBbKXDqjaUfS9VHNgXBrqFlNLt?=
 =?us-ascii?Q?qNE45GN3Bn67JvEfo26h6kEwxa/wQJEtl80YHeAJ691RTNOQjT6Smblo3qY0?=
 =?us-ascii?Q?Zc4H9rt1T89+izbsHYOuNFQSbsWOgUmCz8JEaMX+nxUw2WtTIfuDlj05mLCo?=
 =?us-ascii?Q?l6P03xKQCklQtBycRBvZp5u4QEFOG6I18Imf5UKLrwuEmX+DlCAGrGrGj234?=
 =?us-ascii?Q?at+UUFA25bvYVlhHqv0G1/nlcJ86Bk9Xaal4smE5V2tR/GLrhoiLQVa8eL0c?=
 =?us-ascii?Q?wtkE4JCvR3e7BPVH67bprIyONEL34dAIGApMP+Id+qTzyQZUpiMk4AOboIlw?=
 =?us-ascii?Q?GaLpSmfrrYyv25DzVlA0+8Swo1ws8Ns/OPKRSkSVco58gF+qr6ho9ILhCP27?=
 =?us-ascii?Q?EwF66jNKwHGlIOzhcj59jofSMXXm4bam8LKpypGnp5xyzttwIRubae0O18nC?=
 =?us-ascii?Q?+KjeKk+WfGeGRaBTCM20EqH5SCKWsJt5pIBzCzBlnNCOKHofGueY+jl8S++l?=
 =?us-ascii?Q?iVNLbqjpnI50Hqj/n1z9XVkRF1DN305KR1GccQyIMct9cKXtBULsuiPAiXec?=
 =?us-ascii?Q?4NHh9/7/gsvkHQzuO1r40p/LCHSAepAXYQ7cUU30tPvdC3TuC2WVY/UO+o1p?=
 =?us-ascii?Q?udNrRwVRTY9VCyFMk//2i2vIBsBTDE0EHOAf2fUAmux4adEvgZvvX4M5AU8C?=
 =?us-ascii?Q?isglTasCYXoT/Rd5yj/Sc9/apK/Qx8y+aSeIrp7dCftl97O87h/WGiUj6lUo?=
 =?us-ascii?Q?vsiJe3mNHRP/sdcfsWyiyzk6U0eOQzNnOgT2KJfk8EGaMML8MQlxOPLEYl4v?=
 =?us-ascii?Q?YTN9JYm5afbkdGHHDv0wOFaPj68Wh6c0Ga5+s48NpN6rmRjMgF1sqXXlWRqe?=
 =?us-ascii?Q?L4Ky0drfbtZ20DxLMUZKUOmLZ9VkvciAf33IeYvGVD7//3f1sSyiojU+hTPX?=
 =?us-ascii?Q?9NxjMASdDvKTIUQ0xJvvOJkTJ8zXMOWnSlchFHfzAmTUVmkOlHAd5426sw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:56:04.2530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7676363-2c0c-47b9-5b01-08dd9c54ac9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8270
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

We can't trace dependencies from drm_sched_job_add_dependency
because when it's called the job's fence is not available yet.

So instead each dependency is traced individually when
drm_sched_entity_push_job is used.

Tracing the dependencies allows tools to analyze the dependencies
between the jobs (previously it was only possible for fences
traced by drm_sched_job_wait_dep).

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 23 +++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_entity.c      |  8 +++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 6f5bd05131aa..5d9992ad47d3 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -87,6 +87,29 @@ TRACE_EVENT(drm_sched_process_job,
 		      __entry->fence_context, __entry->fence_seqno)
 );
 
+TRACE_EVENT(drm_sched_job_add_dep,
+	TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
+	TP_ARGS(sched_job, fence),
+	TP_STRUCT__entry(
+		    __field(u64, fence_context)
+		    __field(u64, fence_seqno)
+		    __field(u64, id)
+		    __field(u64, ctx)
+		    __field(u64, seqno)
+		    ),
+
+	TP_fast_assign(
+		    __entry->fence_context = sched_job->s_fence->finished.context;
+		    __entry->fence_seqno = sched_job->s_fence->finished.seqno;
+		    __entry->id = sched_job->id;
+		    __entry->ctx = fence->context;
+		    __entry->seqno = fence->seqno;
+		    ),
+	TP_printk("fence=%llu:%llu, id=%llu depends on fence=%llu:%llu",
+		  __entry->fence_context, __entry->fence_seqno, __entry->id,
+		  __entry->ctx, __entry->seqno)
+);
+
 TRACE_EVENT(drm_sched_job_wait_dep,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index ff553d8dc5f4..8c1589f476ae 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -586,6 +586,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
+
+	if (trace_drm_sched_job_add_dep_enabled()) {
+		struct dma_fence *entry;
+		unsigned long index;
+
+		xa_for_each(&sched_job->dependencies, index, entry)
+			trace_drm_sched_job_add_dep(sched_job, entry);
+	}
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
-- 
2.43.0

