Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F24AC3FD7
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C5310E378;
	Mon, 26 May 2025 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WQYo+poF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outbound.mail.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D039910E36E;
 Mon, 26 May 2025 12:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hijGf5IPpbuMfoNaPJyDUVmU1WDFQLL4/8RMV7nICxgfaWpF3WHeOAVRZEvLFiD2gySOd597EU2gbDAlH97bbjpF0m4ig+XH9CSLrGp63BQPBc38QVbxP+BTdvaDtXE+qKmzMd8S1tX/GG8nrmV82v7YQlNJEwysK2IO//RT3Kti0FA6WqYnJQdwhEylpqp98//Ao/rSKQK3/Ew7lkAix04avsnmFAK5CeXGlHZaJGaKUdGnj4cXOBtY0R2OoLziROzZ/18jSBospt9AEoB/jSW+0suMBAFL1vvov70dYUxFKGGF3dO12cWhaE4BIvOcShw7+WHcgFsUX1T+SW8v4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+D/MixmJoxbu9aKCUjkmWdqscb9PVWuTnt6HvTbnqQ=;
 b=PdzjTYBkBmuHuifiR1cRpsCYkGfV87wpgBqqtWuoNb6MoHsvcwOkuhSnDQm5+Y9HHhSx+hDIT96hfe3qbXw9CEOx7UcpClOGKGHf+OZycwFnpmBBXeGx55fXYXagoSk7texvgz4ZsKzfyIPEWyo1wobz1DCn9dBP3SHj5ORLg0jV5zn67RCiQV6v4Jnt0TrXh4Ksca2GkOlwjY/FvedcZZHWocRAqkbPDEE9mT0gU1ad7F8R7IiIqeQ+g5E1gCOb9XxID8CHEdYfVrmGMy53YxPkiXqz2nsFhrcEDQe9Gz35KQsK09dx547IQzcJ2kacMlpxDVNxIpCITu1zeZyZ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+D/MixmJoxbu9aKCUjkmWdqscb9PVWuTnt6HvTbnqQ=;
 b=WQYo+poFqMbdzaTHc7S+jsk7sXsGFqV9V0akdatmeC0yx7BtRTUhVQL0sIg1TVuSH2LqGtjCuXOWcWyjBRHWrqtAI5qvj5Jd9Sqij++d8redCzItRHaeu994gHqxV2+u2t3HFQEFRrNWD4oB33+6ll+lRDaEey7bCnaAXZIwUuk=
Received: from BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::16)
 by DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 26 May
 2025 12:56:26 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::8f) by BY1P220CA0021.outlook.office365.com
 (2603:10b6:a03:5c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Mon,
 26 May 2025 12:56:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:56:26 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:56:24 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Arvind
 Yadav" <arvind.yadav@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 10/10] drm/amdgpu: update trace format to match
 gpu_scheduler_trace
Date: Mon, 26 May 2025 14:54:52 +0200
Message-ID: <20250526125505.2360-11-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DM4PR12MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f782d9-4a65-4a57-7b3f-08dd9c54b9ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXBKWlMvbTlNalhNR3hnczdtbDZuN3BPYzI0YTFPL3cyUjlZekNmVzU4MU1Y?=
 =?utf-8?B?Vk5GbytPVDdCQ3VnUmRhVllzaFNPV0pBQU5GZVcvUFI0SXBjT0Zqa3M1azY2?=
 =?utf-8?B?aXA3bEFzdkJtL0t0Y0g5THJTSC9aeUpudVpWTm5GU3VYQWdpeTliVzdOdWMy?=
 =?utf-8?B?Qi9rN2MrS3lESVRpbStqRUJlQWpSRkFRVE1UVFZ2cFVHM3p2aGxydFJKc25Z?=
 =?utf-8?B?MGpFdi9jTll3ZmxHT2dqcmdUSTdnMGE5RTY5aWVmdTEyZzVLL3h4ZmtmcHJo?=
 =?utf-8?B?L3RpZllaQmVkSGpPOWh5S0VuZlkzRFlNSXIxRmRhR0hJQWNCU2hLUkFnSi9C?=
 =?utf-8?B?YTMvVldkbEExVkpCR1JDVkg5VGtoa053a29zNGJIMTY2c3VIc2IrMDFweExN?=
 =?utf-8?B?TTBRb2d0QjFUb0JPNlNnMUhHWm5rbDR4UVA0VmVmV1JLSHNmbWFoOWZnQkRF?=
 =?utf-8?B?VDhzVWZjM01XYUViMnl4SkdmcXdWVll4S1JrQmZ0T0t3djZidzBZMU1ORzln?=
 =?utf-8?B?Ky9UMU9qRkF0WVA5c1lrb2hmR1Y0TkxBVzdMaXllU2FKMGlRRFpJUmNVWXRN?=
 =?utf-8?B?dW1TSkdsd2I5WXk2ZUtGMWxyNmd3QzcvMXhiaTdXaXFOOWg4VXowMUV5bHlC?=
 =?utf-8?B?TEduMm1hQ3B2RVlML3lEQ1daSVlJUzJHMVFKbHBVWk5MMkJZMTJlbEJQWG5C?=
 =?utf-8?B?bzJJSFBJMjBBOG1NWlovdzZmR1BSc2JWK2cwdHZHbC9VV3FmTU9Wb25NSjZq?=
 =?utf-8?B?Q3lPVHVwYzBsR0FGREs4S0RvR1NsT252MUxsQVU0TDUvdTB2N2pQL1JaS0J3?=
 =?utf-8?B?RVM0MWNUVEhVNDBmamQ1QlRBREJCM2RMTTM4RFhhUWlOT1VRL0tyODNhSEdq?=
 =?utf-8?B?TXZPY0lzb0I1L3M4MmhwRzdBUnphZGFKdXlHeHllSE5PZlJlbWdBQTZOaWV3?=
 =?utf-8?B?MFNWdWhYbkJCQ3NndklyOUgvOGpQQkRqcCtyekp2QVdpTFdwQjJNRUNyUGp2?=
 =?utf-8?B?TDRJSUJDN3VVRm5VQ2ZQb0FQTlFpVlYwMmo5Z25jU2liOFFMQ05qVDh6UW9w?=
 =?utf-8?B?SUtBMVpDeVk2VGNRNXRTUGpocTVJZFo2a0VERFhlT2Y0NlYvYmhzT2x0d2JI?=
 =?utf-8?B?QVJmK05sN283MFJEZ2t1U2RldWlUN2pBamtjTXRnVFZvZjdZZFBnN0pCNEUy?=
 =?utf-8?B?OGJkc1N1YmpmazNKc3BTUlR2RlJBSVgxb3JaL3hjTWFjZVo4SjZkOURZejRu?=
 =?utf-8?B?eU5jdk1EL1FucVdHZDF5SU5ZV1NyZDhpU2I2a24rVkJlMUtKb2toNm5HckxB?=
 =?utf-8?B?T1BOdWU5ekFqeFhEdloranRIUTNOTXMrV3BKcXk2V3ZTejl2S3BBNEpyTVV2?=
 =?utf-8?B?RmUvOVJkbmovdUxLTVVqSUgxNC9mQ09RV1lRbTZVVWc2MDF6OEYxUnl5aHlO?=
 =?utf-8?B?WUhESEg0b3Nidnc4eHRSVjJPMnBWd3RBbDI2V05HS3ZyNGhpalVmeWNBS0pV?=
 =?utf-8?B?TGlsV2k3L0lSRmhuTWZIcUZ1Uk1OQ1FlcXVBcWZzOFdGdkdOZmhJSVh5NUtT?=
 =?utf-8?B?RExySVJVMnEvbGRITEIrLzFLazltWVYyUGhXMDRnSlV0bEVSbHQ0VXRjRnNq?=
 =?utf-8?B?ZlNzN2ZUSXVWdmQybjZDbjVvb3gxRHhnbzZOWDV4cHU4Z1F1UlU4YnNBSFIy?=
 =?utf-8?B?OXVDanRrWUVxL2VTdWtyb3VXV0tuQWlTSU1LSEs4OG9haTEyRC9jeDlLK1JV?=
 =?utf-8?B?QzRtZlVYWjhkaUJIR2tIVmZsUXFxUnUrOS9TTTlJeFhPYytyMTA3cHByUEwr?=
 =?utf-8?B?Q3hGcnkreVpPZ0dnU2RnSHorS0RGQzhHYkw0Kzltc003QUozT21IRVR5cWVB?=
 =?utf-8?B?bWVzZ0ZXWDFzU04zOFlSQ0ZMVFArK050Q2RjS3I5aDhVemxsUEpJeHBhd3h2?=
 =?utf-8?B?NHNwL0JNRXoxNnV0d1E2ZjBzempEV3VNcDBWMWNoTCs0azdqdzZxWmcwcDZa?=
 =?utf-8?B?aHhhUEl6cmd5VVBTUUlxWXkzVU50c2h4Uk5qcWd2disvTVp5TWVzR3hwaWtL?=
 =?utf-8?Q?EG2sgd?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:56:26.3715 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f782d9-4a65-4a57-7b3f-08dd9c54b9ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6496
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

Log fences using the same format for coherency.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Arvind Yadav <arvind.yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 4fd810cb5387..d13e64a69e25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -168,8 +168,8 @@ TRACE_EVENT(amdgpu_cs_ioctl,
 	    TP_ARGS(job),
 	    TP_STRUCT__entry(
 			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
-			     __field(unsigned int, context)
-			     __field(unsigned int, seqno)
+			     __field(u64, context)
+			     __field(u64, seqno)
 			     __field(struct dma_fence *, fence)
 			     __string(ring, to_amdgpu_ring(job->base.sched)->name)
 			     __field(u32, num_ibs)
@@ -182,7 +182,7 @@ TRACE_EVENT(amdgpu_cs_ioctl,
 			   __assign_str(ring);
 			   __entry->num_ibs = job->num_ibs;
 			   ),
-	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
+	    TP_printk("timeline=%s, fence=%llu:%llu, ring_name=%s, num_ibs=%u",
 		      __get_str(timeline), __entry->context,
 		      __entry->seqno, __get_str(ring), __entry->num_ibs)
 );
@@ -192,8 +192,8 @@ TRACE_EVENT(amdgpu_sched_run_job,
 	    TP_ARGS(job),
 	    TP_STRUCT__entry(
 			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
-			     __field(unsigned int, context)
-			     __field(unsigned int, seqno)
+			     __field(u64, context)
+			     __field(u64, seqno)
 			     __string(ring, to_amdgpu_ring(job->base.sched)->name)
 			     __field(u32, num_ibs)
 			     ),
@@ -205,7 +205,7 @@ TRACE_EVENT(amdgpu_sched_run_job,
 			   __assign_str(ring);
 			   __entry->num_ibs = job->num_ibs;
 			   ),
-	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
+	    TP_printk("timeline=%s, fence=%llu:%llu, ring_name=%s, num_ibs=%u",
 		      __get_str(timeline), __entry->context,
 		      __entry->seqno, __get_str(ring), __entry->num_ibs)
 );
@@ -548,8 +548,8 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 	    TP_STRUCT__entry(
 			     __string(ring, sched_job->base.sched->name)
 			     __field(struct dma_fence *, fence)
-			     __field(uint64_t, ctx)
-			     __field(unsigned, seqno)
+			     __field(u64, ctx)
+			     __field(u64, seqno)
 			     ),
 
 	    TP_fast_assign(
@@ -558,10 +558,8 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
-	    TP_printk("job ring=%s need pipe sync to fence=%p, context=%llu, seq=%u",
-		      __get_str(ring),
-		      __entry->fence, __entry->ctx,
-		      __entry->seqno)
+	    TP_printk("job ring=%s need pipe sync to fence=%llu:%llu",
+		      __get_str(ring), __entry->ctx, __entry->seqno)
 );
 
 TRACE_EVENT(amdgpu_reset_reg_dumps,
-- 
2.43.0

