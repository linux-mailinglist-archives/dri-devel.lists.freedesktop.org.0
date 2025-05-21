Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E141ABF9F6
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF88F10E9F6;
	Wed, 21 May 2025 15:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iNAxYDQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518F010E9F6;
 Wed, 21 May 2025 15:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFu0BR29RSCNRFiSJnatLygHG3OkWbfRBRtcqbUpWUr2BhElBMM6OQk8fUGilozymIyUctm/d0K4qcptlSNb1OBSoKWDDat3+h0qD9ZqzNUmxzG7zhQPZHSkQdhRBXKtAMRlrusupoOuCxTeVXgXegj2EgAAJ9l0tTIYSp7xHSr+xA7LASeIQp6/fYKBp+CMlBNcgNy3J1MGIuIoGbvPVEmL4WEM5/PMb4fCifVb8fbxmjWRJvSJ3yS7TZmUbIivANlZY3vTie/Da9jNU3a0L1S/C76AC7nF3b+AEmun/zQwcuQu8DYE51esb6Zlt44tsY0bG4Wi33KmO+cAnLGYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+D/MixmJoxbu9aKCUjkmWdqscb9PVWuTnt6HvTbnqQ=;
 b=AGOlyxt52u5koJh82tIv5Yj7KkTYrMquJMPMcRnS03XqcQdw7OVpJG/DUiKunbdgWTiNL2en7GMvfSZ+zYfYdQUOPnIRfh/l3F1GvJxJC1MjPGqnP/yZXb5xeyT3Dcu+250+Q9MOgoXk5HZPcNUdYOCO+I3OwK7R2NrogaV193feABxbGb82b58daRUkj1ArCJsxKLYgWNfoQmIV3CIptH1xXfc6PSc4CUnN3Ob83Qj8viTf/I/qN4VgYqfUNhGzXZcGdJ8AB0nb/TwFCAcctIQ1beUA0d8/OJZrr6U4FgvVm6AEagdj9h1EbDNt+eMwREwVI2biQR5SkxGJD+Wv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+D/MixmJoxbu9aKCUjkmWdqscb9PVWuTnt6HvTbnqQ=;
 b=iNAxYDQroRgfoY6jHLkFq0sot9O0VvE+9VsWlqVadT3k3mEli2NmSFot3gJqfMXm9ECogXfBWkKSoaSUEiiKxcWx4ooZ7FXBTQ10qVT9BbGggUqQORApmNHOQ2d+MpSJIHovCDhx2Uonb/Ax6AhOQs0yO2e2yeHb6cdd91jNoY8=
Received: from DM6PR01CA0016.prod.exchangelabs.com (2603:10b6:5:296::21) by
 IA0PR12MB7626.namprd12.prod.outlook.com (2603:10b6:208:438::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 15:48:02 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::e3) by DM6PR01CA0016.outlook.office365.com
 (2603:10b6:5:296::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 15:48:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:48:02 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:48:00 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Arvind
 Yadav" <arvind.yadav@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 10/10] drm/amdgpu: update trace format to match
 gpu_scheduler_trace
Date: Wed, 21 May 2025 17:45:12 +0200
Message-ID: <20250521154531.10541-11-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|IA0PR12MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 2113e563-295a-4374-4a47-08dd987edebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXZSN3VSL0xZN1dnSDAxR0tsQVpXak11Q21ab1dlSE8xU2taSkVhdHJoNitu?=
 =?utf-8?B?M3lhei80S0cxUVo3Q0hRYjlCQnl6Unduc2ZOYTh0S2t6eG5QSHh6S2sxSnhp?=
 =?utf-8?B?M2lWb2R1N0N6QlFpTHZ4OGZweWk2cVZORXdBbFV0d2hMWTZyRXFBYmorOFRr?=
 =?utf-8?B?SlN3YTlTMVdnWmRJOHFPOGxJU3UzWU13RHA2OVAyVEVTWlFJYWl2V1ArUTlp?=
 =?utf-8?B?VWJ1MnR2bUdFdmYzYzFMY2FMYXBKN2JyaU84NUk3Y085RDJCRHMrQWsxME5r?=
 =?utf-8?B?SW11N3RrODJ4b0o5M0VjY0JxaGtWQjFkOU1VanNmczlPRUZPNk56MHprVWtZ?=
 =?utf-8?B?a3o2QzR1a0Ixb2ovMko0QkllU1dsMWt5K3BWOFQyWnZ2ajd4OWw1YVR4UUtI?=
 =?utf-8?B?Zmw2VkFTSWx0QmlLcDVlUVU1V3dZY2VrMVpKNFY2UzgzcERBRWxZeEZ6dStD?=
 =?utf-8?B?NmFyTGFkZC9NMHFqMWw1ak5GSTlBbTJBUE5EOVJ2NThBMnRaZHRxa0tjency?=
 =?utf-8?B?alBOVy85SGc4bks0alVIUjg4enhhT2s3MWdEY1hPSXE3bmoxaUVYMU8yVE1k?=
 =?utf-8?B?MGdVcytqNnVpZXNCVjhyRkhBZXNkMVprMXk4a3l5NW1VUzZ0ZEJtWXVIT0Vs?=
 =?utf-8?B?MzZvWDhkOGhocDU5elBkRmQ5ajF1a3VwUjk1U1NWU3kxYzBJbVR4QXZWa1Yv?=
 =?utf-8?B?UUVDQWZRbktmdHI3czFtWEVjQjhyZWRlekx3emM3TDk1Y0FTY1psY1NiT2VS?=
 =?utf-8?B?QUc1Q1cySElESjNMT3JZRnhBY21iRFhWd21raHoyZGJFYWpxWDhHUndPWGdQ?=
 =?utf-8?B?RHA2VVdQc0JWcWR1UXpHN05NSGdnS05wbDJBSFFBYzdGOFJTY3FPRVB3TjNx?=
 =?utf-8?B?OGdRcWVLUzZzbWE3azNoMDNUM3NCSFhYRFBKTjZSNk5oMGlaVDcwRVdFTEV5?=
 =?utf-8?B?bnpkLzY0aGR4Z3hTU2gxVkVNYXUxTVRaU09rdTVQWmJFd3pxZ1hOcm5zRmNy?=
 =?utf-8?B?eUJXTFhPZDNFLzkwQi90cld4QkNXZzBiVHlydUpRdS81RlBIS3pad2VFVFo3?=
 =?utf-8?B?QTB0QmxXelBLbVcvZXNkMCtnYkVCL1lPY2tKWlhMaXMveEFKY3FnaDBvcmJW?=
 =?utf-8?B?RDBubXI3dnh5RVlUMkxSbmZHOGFCOFlyR1JQY0k1elRjMG1HVEgyTWRZZ29r?=
 =?utf-8?B?OW9HekpzbzQzK0JrQVNmdWxxYzZmKy9DbC9ONzZ0MUQvNHFNeUdwbTkzVDVu?=
 =?utf-8?B?NjhZNnVFMjZBUWUrOXU1TnY2RXhsSUVqdlJUanBvTm1ldEZCRzNDazQyWVhp?=
 =?utf-8?B?SnFNMEFtOE1FZlJleEkxcHN0Q1Q2YkR1eTIzR2xHaEhRcmRUUHg4Vm5melNV?=
 =?utf-8?B?UE96bUpEZnhqa3VMMFB0aTlJSTZONStvd1ptdS83M1Jjc3FWcUJSeHZYY1dk?=
 =?utf-8?B?anRyaXpQNU00L3Z3K0VNK0pYZ3U4VG1sV2wralNSTEZDQXRMRmV4SU9lYnV2?=
 =?utf-8?B?aEp5TU0xN0ZORkI3MHovdnN5RkIxUEozR1BrR1NhbGJNdUl0dTZ2UXBueXRl?=
 =?utf-8?B?SVhKT21Idy9VSHZIZWNyU2IvV3pUTm14RU9XUTdsRERpdXZpRDNURENnaG1Z?=
 =?utf-8?B?MFFmMFNDM2NlaEs3N0NHdWYvU2lTVjJMR21GSjMrQUdVRVB6TUF1ZWlZQWF3?=
 =?utf-8?B?S1A1b2ttYk5KMDF1RlpnWDBhRXZ2eVhMS0xodFFtZU9DeTN3L2xyM1kzOFNl?=
 =?utf-8?B?KzVnOGEvTmNIdmZGT1FNRXRDdU5EdnpMZFp6L1RaNFNSZ0NRVmtrQ09USHhD?=
 =?utf-8?B?SmRNS1RFM3pQOXlXaThIMVNvaEpjMFhMZzlHUjFHc3FJTlI4dHY3cmF0RlhF?=
 =?utf-8?B?bnVRbnpjQjFsYlBYbWVkWFpsV1c5Q3FxUm50SXhxZ1ZkTVNoU28yaklkQUxr?=
 =?utf-8?B?RTlnUzVwTDR5SmwxTFFheExBTHZJNTBwNHg5dEZ1WEFQdWFUR2FCd2NaSFFQ?=
 =?utf-8?B?blBhQUlNb2NBVURKVmZkSnpQeHpKRU83OU9QaUxDVGNaSVlUcjhWK1ZpVjVP?=
 =?utf-8?Q?8h7fiP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:48:02.5852 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2113e563-295a-4374-4a47-08dd987edebc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7626
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

