Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85F6AC3FCF
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3614410E348;
	Mon, 26 May 2025 12:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jIXcFWCb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A1D10E377
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 12:56:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz79GpyPAgNwWb6SFLs73L9RjE9JWtnkw6EKq3JYeEoPWBgKdu+4dYvFIOB52lXzM3BtMTmwNYazGY/4sP8FgSLIsnnkgzQWK/R/CUcukZUYK7tfVJnZsSbqTiMLMliyL1XGAoTWo3kpaqCsScEk7Be2H45y9e9oQKg6IOWZZs2sWhehrTXvYdl9oKueJyKGcNP2p61O6sv9Rwyyz+QmPvGbEOCQuUd2y/Vqvo9zMddYOE3mgSdPz7Pa/T6DBcXWXslbNLvCgenkTaXS/ljdXSf+kt3LtUIAAkWsLCujEB1LFSnGS7RSBmSbc6OE/bw2jgLbbyWLEFMlAvWjkqOV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFXFoCODN4SBN7bXLAC2jHegIZHMz/4Vz8lWODQmisY=;
 b=aCN8s0Xot23dq7l8SBQb5pdROGI5Lf6EzdKwYL1D2NO/NHDXz+o8wWLg+QuXUi9LG/lNPYP8le4a8L1IuRA0A2cK24tG/Nq8lqYIlqouCu9FqytZHS86aLgp3uOozTgCsB+O/3BurfHfMxqpz3+b+xZbD33hK2qfah2lEFn/rOJTUmM7cOM/1ZAUjVMJ1bOPdWXyMN7OTLYgM3pKdFpb3YpWyxOU7y88dJG/UeKvZK9+TbNKOOhZh3/8Fcp/rxBfW1t/PiIYMrL9NvPI3OZ2KTXBccdHMVANHGTgmR1sO9SQwmDEl6fKe/fMYCv7juvCUnWmhSGqn2+4kwkP380FUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFXFoCODN4SBN7bXLAC2jHegIZHMz/4Vz8lWODQmisY=;
 b=jIXcFWCbwHBaiZOL5Qx898txx1JRudXUAgJmCzUe+c9QzpbahlcOpvt5uNup+2pjTsrDbJi+wMxUPvFB3tzztZ4XlU9coAO92ucgM+VUtDF/IM2iz/2ttvgSAbcC0ChiySsROsIykrNVq1r9zuKwG0Rea6RU0lKWbr2QBrHVrHY=
Received: from BYAPR07CA0036.namprd07.prod.outlook.com (2603:10b6:a02:bc::49)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 12:56:06 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::52) by BYAPR07CA0036.outlook.office365.com
 (2603:10b6:a02:bc::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 26 May 2025 12:56:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:56:06 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:56:03 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 06/10] drm/sched: Add the drm_client_id to the
 drm_sched_run/exec_job events
Date: Mon, 26 May 2025 14:54:48 +0200
Message-ID: <20250526125505.2360-7-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c19b668-a0ae-450b-fd20-08dd9c54adce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFBtSGs3MjZBUHI2MzAyZGFsRm5DcU42THJzK0FYRERJV0lGaUl5YzJua3BN?=
 =?utf-8?B?Vk9qdzM4Yk1hSERQTlRhdzdrVlpSZlRyamtQY0hPcDA3MzRmUDNsWW1DZGQv?=
 =?utf-8?B?OWp2K2oxZ3NManExU1hyQmUyM21VSW9aWC8xTFhKaW8xQWhVWFpScWVQdWJI?=
 =?utf-8?B?ckxhak12bFBML0ZKemNlbXBiMVkzRjZrTkxzMUgrOXUwV3BCQk1SMlBDRDlO?=
 =?utf-8?B?Y0trMXlZVU5xdGtDeHFrTWVucmxhOUphUy9oU2VNYW1RYlpNNTRDR3RFRUQy?=
 =?utf-8?B?L0FVSDNJcVU5MDJhOG5pMEEva0ZqL29vUDdyR3Q5UEVIWWE1U3N3dzhHRHZ1?=
 =?utf-8?B?R29PSlNLWFRSVmRDK3hGQndPNFpiaWJIb1UrTjVDTi9TZnV2c3J4WmRaOTRt?=
 =?utf-8?B?eTRocU1kSnVNUlJnZGJEZUZMa3ZxM2pJb01FTGZrL3BHWEZ6Q3VESm9VN0k5?=
 =?utf-8?B?TkpvKzZ3RkxmdWhMTU85MnJkQlkwcTB3NndkSDlFc2dJVmNPZWhBYmY4T2kw?=
 =?utf-8?B?ektDVDBBL0llU1ptMGw0d1F5bzVya0hQODc2YjZubWdBcENkUVV5T3FadmFK?=
 =?utf-8?B?NlZVSmN3QnpLMjhRVGJGaFhSOEMzd1VleUVOTHc1bHFtdWl4bEE1eDZlcHdp?=
 =?utf-8?B?Z3FyTlM1MEdUay9ZVVdTaFpOdjVsNTcrWERscDEvTDdsMit4enFpa0hobzNt?=
 =?utf-8?B?WlBXaW9zc2MwOUN5d3RpVnpnZnU5bVV4MDd4cjkvejcrYzRlOVFTMndEVFhF?=
 =?utf-8?B?ejVnY1EyVVNLeTA3c1NtQk1SVTF3Y2lCbkJnZ29ucDRGUXRmaEJpdWd2UFdx?=
 =?utf-8?B?VCt0RHpMWnJmS21zQTBhUXhlSUF2RTBCRWFDK3lYK3FYbHVsUm1UZnNPWTlD?=
 =?utf-8?B?aE9wM1FpSVBIa1JzaHplS0JEckQ3cnhmekdrK3hEMldpMUEvR0YzekFRMVFl?=
 =?utf-8?B?WWl1VnNZTTVXZHNmUjR0cDdDM3ZXUWN2b0xKR2QrNm91L2VLQ1JzLzZuWjBy?=
 =?utf-8?B?em42Wk9IZ1plNk55emYyYlIvVFlUWkJMMmtRZmswR2x0STBCSmJFT2JhK0ty?=
 =?utf-8?B?ODZiejZmY0RRU3NUWXZLWnlUdHhXR2NLT0lEdnhwVVEzZlJUSzRnYWlFbllP?=
 =?utf-8?B?MFNmekQ5NDUrZnhJQUppdDRNbzduQy9TV09zSWd3QXpaeE5LODFqa3M4cjV1?=
 =?utf-8?B?d1g4bEo4dGgzcnlkNktORG1wSXFDUi8yeGdUeFREbmRQM3Q3RFJCNmdCRVFq?=
 =?utf-8?B?b3VINFdIdGFKd0xJV0NRNkNlQzUxQ3dweWVOckhrZGo1Z3lQYUs3TGFieXY1?=
 =?utf-8?B?eGdyNndBV1pXV2dUc290OFFtZDU1YmdYT1ZTZ1N4ZlZZaENmdTBGNnNITTVs?=
 =?utf-8?B?ZEZkQTdWaXc1bmJtS1lQN1dabUY0M1lhS0pnb1I2ZUtPQkpkLzJEcXBEbWxK?=
 =?utf-8?B?MjNzaERLanA4VmxLN2NEVXpvYjJzQTAyMVBNdVZwRzBoUFY1MGRwcTZkNkJH?=
 =?utf-8?B?K1pvcHNjQlk2OCt4L3ptSVJNUXRFdHovcGZxc0xmdGNkd1dCT2JNL1NmUE5t?=
 =?utf-8?B?UmRubkNJckdETkVGaExvcHF5a0didjhlakV4QnlYUzA4K2lUc3YvSzV3VldS?=
 =?utf-8?B?QzJLRCszTkJkOVZoTUNmb1ovZWVNeEljOHlXdUQ0MUxyL0FuZHFYT21qSXJW?=
 =?utf-8?B?Uk53eGZTNjRKbGdqZFd3QVQ2bUN6M212eXZDVTVVWmtlaEovSVNSZlVVeHVk?=
 =?utf-8?B?cVB0VFZKUEU5UUFVWmtWenpJSDZJeDNLcVQ3cUdseCtmemFYbitoU1FLQmhh?=
 =?utf-8?B?K3hZcnVPV2dxQ0hmMS9BZG9DY3RPVTNTVCtVZ2diSmxaSFBib3BqSUJIZkxD?=
 =?utf-8?B?WFFIakVOVVdza21oNmNiOU1FODBIZGxmZTZtSEpjcFpIajAyMy84YThsUlh6?=
 =?utf-8?B?ei80SnNjQkIxOHB3NzFteTExZU1NMUZLUHBoL09BNVoyL0JpSHZTY0M3ZnBt?=
 =?utf-8?B?ak4xQlRjQVNrUzVIVGlxZVMrZ1JKQ244Tm9WSW5naS9TUkNseitLOXl3THRD?=
 =?utf-8?Q?j1Agqh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:56:06.2424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c19b668-a0ae-450b-fd20-08dd9c54adce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587
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

For processes with multiple drm_file instances, the drm_client_id is
the only way to map jobs back to their unique owner.

It's even more useful if drm client_name is set, because now a tool
can map jobs to the client name instead of only having access to
the process name.

Reviewed-by: Christian König <christian.koenig@amd.com>
Acked-by: Philipp Stanner <phasta@kernel.org>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 5d9992ad47d3..38cdd659a286 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -43,6 +43,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     __string(dev, dev_name(sched_job->sched->dev))
 			     __field(u64, fence_context)
 			     __field(u64, fence_seqno)
+			     __field(u64, client_id)
 			     ),
 
 	    TP_fast_assign(
@@ -54,11 +55,12 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __assign_str(dev);
 			   __entry->fence_context = sched_job->s_fence->finished.context;
 			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
+			   __entry->client_id = sched_job->s_fence->drm_client_id;
 			   ),
-	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d",
+	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, client_id:%llu",
 		      __get_str(dev), __entry->id,
 		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
-		      __entry->job_count, __entry->hw_job_count)
+		      __entry->job_count, __entry->hw_job_count, __entry->client_id)
 );
 
 DEFINE_EVENT(drm_sched_job, drm_sched_job,
-- 
2.43.0

