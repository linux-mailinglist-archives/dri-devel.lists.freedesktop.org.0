Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472DA6A32D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EF310E5C4;
	Thu, 20 Mar 2025 10:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GQEq2YiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C20310E5BD;
 Thu, 20 Mar 2025 10:00:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmGB5E1JxGtu1sJxEIaP0R5r67Zo6rmCS13EJt8h++d22t6PObQqHa6m7UCGWGX/+4aWYTb8XMiWnJE3TCj0mfMNYO67BzOnW0BwXMj6kOFYrgSzV/gc1r+tywxtwdwqgtzN7UTVN0OpMz+/9EC00y25t6zSOvLOLEuodpc6S8rqCPDAqSCtalBset9zCkSF/tZ8SQW90cU8jxMcJ00UYIbD4eQKspegKt9TSkz9N7n3w4Gv8zJnfojcf+upqMw5w+/PnBXcq/7HcPFMdK+3kAth8Aw14gpVwkg3ncqWWE7/Yyeiuj04d+ffyo63jWa4qfKPmEOZW/r9wO1RiCk5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVtA1YyRilqZIq0fGLqaKlpDFOxhGPPsyzlmco83oMI=;
 b=W7XTtNdNa3asr0+H6/qVbr/enyqufOuFLjKCyrUTh9fd1WVILgF3j76vuHB7j52ixUQuJGn6B3mIItnt8Fd66N0MqhWE8IPGymh+D+CeVYJ15Lh3YQg1zp6iSrKhddUKqt52cWFqSc1CdF2ImTfqRJTo1U+tL3qRnkK+Yzv8jydfyfferU9FXA1b3kG5nq3Q7p5GsI5gDxvcVlowWBbBaJ8G9utcox8u8NvwaTWJgdRVcFSoI4xs73dyWMgPfsWORdL0P9BO6fewRSK24XXP0kLspFzIXvpEn9xyUQ0tsE1M6z4KHJZvhZl0wtN3iuLwIUZKb2dbf+1uVw0lq9MvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVtA1YyRilqZIq0fGLqaKlpDFOxhGPPsyzlmco83oMI=;
 b=GQEq2YiQsodu0ZoiiN+z2X4NTSVl1TTTfCpUHjSStuGYH4HCm4R/iG3/lYtWd2YQ34a8NwSx/j5ocxHxGtAsEul8IxuH5BMcFmMVzNQyBnxVSonStpqC238MB3E5uYQzZHCYhFc9E8gpo5hkC3wqCLDTELl1mEmOq4QVqhziTtU=
Received: from BN9PR03CA0162.namprd03.prod.outlook.com (2603:10b6:408:f4::17)
 by SN7PR12MB8772.namprd12.prod.outlook.com (2603:10b6:806:341::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 10:00:43 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::da) by BN9PR03CA0162.outlook.office365.com
 (2603:10b6:408:f4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Thu,
 20 Mar 2025 10:00:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 10:00:43 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 05:00:41 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 10/10] drm/amdgpu: update trace format to match
 gpu_scheduler_trace
Date: Thu, 20 Mar 2025 10:58:06 +0100
Message-ID: <20250320095818.40622-11-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|SN7PR12MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 535ea1c8-74b3-455e-4f10-08dd679613d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lEzKbZc3uudeEsMY/GddeZ+TcDV9PHljSIHdRLgUABHBI06ziOr9SaxOR4ze?=
 =?us-ascii?Q?kJ7PNue3z+qeRmJ+9xb4vn9aL7Xgu/j1Ril/p6w+9Oz5llmRxOlcHxexvu5w?=
 =?us-ascii?Q?ewfmioOgxTJLV34btvl91hUM5qxnBZBEI1WLlaFg2c1EZ6MpuQYr12g4+kqf?=
 =?us-ascii?Q?B7AWUbOhOtV9y93fdIuw823TMn3b0X6WAGugoLikLr23qlcfxF68Jz7WBL/+?=
 =?us-ascii?Q?7P3SqUQ0cCq1UPIi5zB0JaNdsaKEniO2u+OtAZCZwz8Lro1f10jlmPRPykfB?=
 =?us-ascii?Q?FcDemXXi/WoTFtivOYN1XDi3smuBalF3s64jhXPkRkaafI97pu5Z1punUKyW?=
 =?us-ascii?Q?BeVgU2+4m3nQ07FEijJ7K0GlILx3enp+aN8uX/Adp4DTKIZ1vheWORJwT1D7?=
 =?us-ascii?Q?FIl/+OXpoNAmmq5QqWo8zaqjIiiQYMVLP8GHYYkKAmhpUJPSaQ2PqRzN2OEg?=
 =?us-ascii?Q?JaES5Uj3JOzb58NMmpGbIhOU84kYFGcq8adFhdj8/pcbjkBaGVfxvAKg1Vl+?=
 =?us-ascii?Q?r7J249Zl8+fxVYUOP8F3LmuixC6It3xE1MT6GWZ4684FCZfKyRVuKzgLmM2z?=
 =?us-ascii?Q?FZMUZYZ+cBJQM06lRAQc7H35HJYlnLc2wUuvh0eOIe9p0EqodcVnOwgjnBGP?=
 =?us-ascii?Q?k4jx4tN5isFtOPPBUlQrG9pyGSp8ty6ChEX6nTyIs5S5S7ajkHL4O1o2Jhin?=
 =?us-ascii?Q?Zx9CvV0wOTO64iRZo50ru58qUHGj/N+gRY4sqDmFV1tdUF2HXk0xkoHpYBJX?=
 =?us-ascii?Q?jr2vVz5i/q6lXHPj+hIFXMdjWeRqR62bDt+HM9aQxL18Jw3Ye51gwD+ngmE7?=
 =?us-ascii?Q?iD6k6ifrXZ3ULnm/I55aCTXHqVWgj8NQTGef6ZhVnRW0Jexwclg/VZ8kVJ5W?=
 =?us-ascii?Q?buou4eOpaZhBzGz+UcjmcI50qJYVcGjPsqBDK8ZLAZdPc3z8ZefasKJD2yw8?=
 =?us-ascii?Q?w8h4w1OgFz8gT6WAHAH1pGNFggXJXvddNPr8vIQz2TBoZZTqo9+sahyu/u3G?=
 =?us-ascii?Q?aXRJsF+z/z3zCjFRwSaNltMfQSl6p/9Uczf6ZKXUa/gB+6FEqzI+B1uOmRdD?=
 =?us-ascii?Q?jJVms9Nwj672EQBcOdyDnBJa8FudGS/Q9h6MFjZDHegM1CjUaMd7TZcYRQLN?=
 =?us-ascii?Q?5++VT/25gv9WvZUTDUUU/gHeWa3rHMO74+yfDD3WGMXdASOATKd1Gwin79hL?=
 =?us-ascii?Q?KCiZ3hw12BJx6lD9LRhu9k4FgVMfqCE2sIyzY8QcT1f4dpehNV6waA50gmHl?=
 =?us-ascii?Q?HpLNVdPr9F6gnf2AM9M/gD16PxThtDSuq7nQGuiSM0vO5lVDhHQpBDllDo/k?=
 =?us-ascii?Q?bxIbTpM537A7qhmNtkPGNj8ETrj7IE32jR4vP1auS5UITJzai2HTdNyrOQNM?=
 =?us-ascii?Q?XSpRYYFA/i/9jHO0BJtmaffNQ9tUpTOAsTXp4UQujN7/V5ALcDBi1LFxh4Jb?=
 =?us-ascii?Q?AziE/omSWRTew8thCe+KmMrvF1flZaKVHoQJAP87RrghHPGzaqsoqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:00:43.1642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 535ea1c8-74b3-455e-4f10-08dd679613d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8772
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
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index a4f394d827bc..d302c68c1258 100644
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
@@ -516,8 +516,8 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
 	    TP_STRUCT__entry(
 			     __string(ring, sched_job->base.sched->name)
 			     __field(struct dma_fence *, fence)
-			     __field(uint64_t, ctx)
-			     __field(unsigned, seqno)
+			     __field(u64, ctx)
+			     __field(u64, seqno)
 			     ),
 
 	    TP_fast_assign(
@@ -526,10 +526,8 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
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

