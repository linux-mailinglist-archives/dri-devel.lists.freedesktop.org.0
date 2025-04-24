Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C59A9A684
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4799410E784;
	Thu, 24 Apr 2025 08:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0zzZ/AVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EF910E783;
 Thu, 24 Apr 2025 08:43:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYlACudTrYmNj9Vbn3f2VDSqoIRLXYPFV0Lj/D1y8GbTdE9kFJflw3guar72UVAmlBqtwT2cgW1TuzVFg9pR6QFoUB75vWdy4MOsX3jR7QGEcrUJrYP8cjvM/6HrDz0OnC5ew+qFqzJzKt3XbEUrLg1V2Pnby0xIgGJ2fc3eIYfgZg3FTC8dyr6s45Zv0Wo6xGRoHyiHCxXD5OoKDKlWkOpDI0rkafahmGlOeDEOvkfo+cD2bLfbJXoK+oclO0C7n4RBVXFD5bbrhYV5ODNeq5RL+J6o36148SdoEMfhTYEqwlEYCpqK314sqmaqCVdufWMWNOrLjeT3vG86eWy6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UdGvo8MwWYtY/Fc3bflFWQq0CBaLqbWFp2u/mR9Tug=;
 b=AbP3RBrbWB+FHDeKIMWy4lSeJQEL+/D5im74lHBaYE45PfmJ/Bnpj1uWOrQCdsTzDiS8AcxiPmqEkaHDWvvmBHBDFOk3PvzLjm2mo3vOba8p2cIS3aR5EaO7JLavfeEXBMdnUOApIVdBWUln52hitnMOPNU2hQwJQ9o++6LmIWoYQ6+ozI2QKdcBe/EHEogcJs93IGfv43HK50rUh6gjHl1x6osABzyTVzc0h2rQBqOlDASD/GwUeWT8lle7HK2HJjm/YujF8Cx4/XU3msNPj8au+DWcEKQxtzZ5rBXlKN1HyyKZYXs3DPV1p66pqzhomZf2KwY+HbRa2oEzqAKv3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UdGvo8MwWYtY/Fc3bflFWQq0CBaLqbWFp2u/mR9Tug=;
 b=0zzZ/AVjFrZHxgNGmavCV7klYyf8gy9J40Z9dsw5wUGvnX4YZWrnJv+8dHZNEykC6+GP0zdBRKQi2DhJA9BTo9H7Omen7YqRePneh84SdSmTigbBS9lrjxs2LDOo97NeNmC+q5zRBLcJ1MLeIKQHbx6Mc8OV3wDLX8TsGyHxZt0=
Received: from BN0PR08CA0029.namprd08.prod.outlook.com (2603:10b6:408:142::15)
 by BY5PR12MB4052.namprd12.prod.outlook.com (2603:10b6:a03:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 08:42:57 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:142:cafe::27) by BN0PR08CA0029.outlook.office365.com
 (2603:10b6:408:142::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Thu,
 24 Apr 2025 08:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Thu, 24 Apr 2025 08:42:56 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 03:42:53 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 10/10] drm/amdgpu: update trace format to match
 gpu_scheduler_trace
Date: Thu, 24 Apr 2025 10:38:22 +0200
Message-ID: <20250424083834.15518-11-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|BY5PR12MB4052:EE_
X-MS-Office365-Filtering-Correlation-Id: d736ca38-b6f4-4e72-a8bc-08dd830c029d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkFuT0VvRThnQnNDUXhLeE5sQ3lGbEo3RnFlLzFadWtzZDdybG1jY1YrRDJs?=
 =?utf-8?B?TEJRSDQxVVdyMWhEVVVuS0JaMzczTS8zSXB5NzQ4RUsxdk5SZTVmMlUyYk82?=
 =?utf-8?B?MGw2S0VhTDRreG1BYmU3b2F4WDVRTEs5M0lDcHIxNXYvVTlEQWxmY1N0NmRn?=
 =?utf-8?B?RTl4ci95SDlkTXhTenVPVjZ1NFBJSFlpcFE5L0twazAwVUJSRFFnTkJwS0xO?=
 =?utf-8?B?clZEOVRad1VuOE9CeUwwUkZWcmlCWWozeDZQeTAxUDJva2kyRks2NzREQy92?=
 =?utf-8?B?Q0U5ZEZ2eEZ1R2ZFK1dUZE5YMXFBR0xvRlJQaG5CTjd3SW9Eb053TUpCMG1L?=
 =?utf-8?B?TUl5dTl6TDdpNHZXSnE2MVBJazlTV3IvS20yVHB6c0F4bkZWQlA3UldqQTE5?=
 =?utf-8?B?Zlp3amo0citDM29qWUV0dnNDdUp3RXhxTWNBUEpCNEYxNHdaVEU0V0lQRy8w?=
 =?utf-8?B?M2Jjc21FNGF1eWNHVGhQRVdBMzJnVXBRd1ZzWVhwMTZYUHl5WXFCU3lqa1Ew?=
 =?utf-8?B?aXhRbUg2WVRsVDZpZnRJQlk4NXFBbFI5L3g5ckszRUdBSU5WOGh5S08vbjhO?=
 =?utf-8?B?NjlMZjZsRVQzT1Zxa3I5cHhESXBJR3YwaDNSZ0pMdXRVVmkwNjJ1RXNkL3c2?=
 =?utf-8?B?ak4vc0t1NlZlMVI3R3BtRE5rcERacldXazdzVFNlNG9iUGQreGZtUHUzYlQw?=
 =?utf-8?B?dTdvQjdLR3dwZmd0S3NyaU5GMnE3b2U3YTNCeTd1NzNjbGF6dFIwZC9iOTkw?=
 =?utf-8?B?eUMzc3BhWVgwT3hsaExtd25sbEUyRkdybVBHM3g1M0wycGlWMWErYUd6T20v?=
 =?utf-8?B?anA1UU1DVjFZbURYZFB3VlJTaENHdWtZWEFtS0tWL09Falp5N01nWitjZ1ZD?=
 =?utf-8?B?dzhCRVBiMzNKblVXbzVRa1lIRE81bFNTNy9lL3RtbHpFcDdvcUV2YVdTR3g0?=
 =?utf-8?B?Q3NLL0VWQnZXdFZ0bTlmMmRuMWJ5WXFLcElWTUw3Rmx0ZjRyN1RuSUptMEpv?=
 =?utf-8?B?a0dNc0tvejNKRENSaWRVTFVGc3ZiZVJiZHRGTHNKMEl4MVhvZGxMRTBpeWox?=
 =?utf-8?B?eVpvQzlpRkE0VnN1WkNzRTI4RWNTeW1DclpVemt4RDVSQnM5c3FRczJQTHZE?=
 =?utf-8?B?RFhSRm1BN3NZVjFzZUFuU1BsbExvRGdpVVBTNER6dEs1UjFIbGp4cFBLM01a?=
 =?utf-8?B?cWVFK1ZWYzA5c1pudlR6U3ZlTW91WjdtYjBwNlB4L2FMMUxsaTQyZU9hczRz?=
 =?utf-8?B?UERFamVDK1hpcy8wRExnSlRPTUhBZlUwVDZROGl6MGIzWGwvNmNqZ0p5eTFL?=
 =?utf-8?B?aXFGZEtFbGMzS0tpcU1TZ3VJS3lDdS9yZXdUNkFHZFhiaVE3ZUoraWlKbHE2?=
 =?utf-8?B?eVZ5eFQxd0dzQmI4bkkxYnZzY3lrUVJkS2I2eTVRVmhHdXlCU3JLZjcxNm5z?=
 =?utf-8?B?Z2RRcjZOeTExRDZDMCtBL3g5MEZmWjQyc1NpZDhoTnBidEp2eWNUWnpMY3hx?=
 =?utf-8?B?dzF5UmVSdjBDQy9MRUp4cktuTmlCd0FQRUpjSVh6MGRxTTN3MVg2bkt3cnU0?=
 =?utf-8?B?VWpNN1duaE1jRFR2TjV3YVQxT1Yvc1poeDBVM1dEUkNHT3lWSlJDeXJmZU1F?=
 =?utf-8?B?cjVDMFRMSE5sWHphN0lXVVJsaGdVVU5UcEw5NXdNeHk2NzJ6dmx1bWk4ZFN0?=
 =?utf-8?B?QzJMdysrbzVFZGZOUkYvN0RxTTdoQTlWNGIxOFBmTnZjNTRVOWpDbzlJamcz?=
 =?utf-8?B?cGRrQW1vZkdra3JCN0pQN2s2emNWWUw0YlJ0YlJFYTNqS3VrbkE5WEsvQ2dz?=
 =?utf-8?B?S1hHZ3MrUVpTaTNvU3ovUURQc3ZMakpJQlNJeHZ1cFdNVERzaG1Pd0RJRGZw?=
 =?utf-8?B?SEV4c1J6Wlg4S1NBZ1M1TkVjQzZjeGF4UWFlVlh1bERpbEZTeWN6VXpWL3g2?=
 =?utf-8?B?K1dudzZRZU5jYXpOSDdHWjBwWm8zWXlhTHQwOFg0ODl3alM4QU1hR1FvUUFx?=
 =?utf-8?B?N3FuelVla3A4RlplUnhzdFhWeDEwdW92eHM1NDFFcVpWd0FXOURzQ0pVSXMx?=
 =?utf-8?Q?CGDS5O?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:42:56.2795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d736ca38-b6f4-4e72-a8bc-08dd830c029d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4052
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

