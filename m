Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAAEABF9E5
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9814F10E06B;
	Wed, 21 May 2025 15:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fKYr1dcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2088.outbound.protection.outlook.com [40.107.102.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E8B10E06B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 15:47:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1A2oH+irlOjaowcWUUDl0eimfzL3tTH18/S7iGVXIDpUx4w7tndDtcmC/7MzIVXE1v6eHa7/L4XfafJC3Z+Ol1VpfbUWSDKiDcLNyDOLJYqKGZ++axhV4y3ty4NcZyvt4zPUPMtWZAQZvr78OpUgX336M0zddvgMsdaxuI9zzQa6xd39+r5K8/QvzqVN1BbMpHClvl3MsJLZC/8BvjsyUQWG7V9S7a3QTa+LTw9f9dk0DYXFkmYimbGDRI6ZJ9VTWP+PFFPgCv1/S3O5alnDbHqxg2X5Vjn7JEC3uX4gdefY+z11FmgRtVi0yqDb+nc2LDz0+zr1gSZcncZIl1RHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFXFoCODN4SBN7bXLAC2jHegIZHMz/4Vz8lWODQmisY=;
 b=tqDpn0YoQF5vBiZj43+u9enZ+2a+LhXyaFTuztjjAL7/q1CScF3n+7B+pjTNXi8rPm2GNlycYGpAzLEz+rtUlI0FojL7C4u2JSe8vukwbXAtRjSzwvFbbfTs53wbQ0wuNBsMmJpigKOV+VXE/VbnB5jr90LyQiKilRtVK/1PN3v7+f+YVOZTMhzCSNdFROdyyEonxbsEz9neJ4/PcAUErYcu5qoyQQZqn70NBHrfe2KlK/2SujhgrvrFjVBmzcfE0WGpXe5ApYEXv8hi2hvhtVYx6Excq65tr6dCtGhVlCfeBVYC+ri8UGf2Hmh/5umVkrG/rZxmaPKyJINc4UmhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFXFoCODN4SBN7bXLAC2jHegIZHMz/4Vz8lWODQmisY=;
 b=fKYr1dcY+bzadYxUbUK3jHzobMIut7iDTkjnIKue0sC3TywyvqTPuqoj1WwepuefDMtXhAEOyDcDCsDCjVsB6CBBQ4JgDKjX+bP7lNvRBLwx7PbSvEPfbTCgEg78SxYkl2rAh5rcAovbUfL2CL9KrAZyjc52esnNBvrjFcSAZv0=
Received: from DS7PR03CA0248.namprd03.prod.outlook.com (2603:10b6:5:3b3::13)
 by LV8PR12MB9154.namprd12.prod.outlook.com (2603:10b6:408:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 21 May
 2025 15:47:25 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::7e) by DS7PR03CA0248.outlook.office365.com
 (2603:10b6:5:3b3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27 via Frontend Transport; Wed,
 21 May 2025 15:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:47:25 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:47:22 -0500
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
Subject: [PATCH v10 06/10] drm/sched: Add the drm_client_id to the
 drm_sched_run/exec_job events
Date: Wed, 21 May 2025 17:45:08 +0200
Message-ID: <20250521154531.10541-7-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|LV8PR12MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 43436c66-784e-434f-eabe-08dd987ec874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3oyV0RKU1Y1SFBPOEVkc3hqa1BzVXRLamNJZVBRZ2xBVFNWeWJPUnlNQnZW?=
 =?utf-8?B?emN4MU4waUVLUjJsb1pJbHpGdXF1dzFNb3ZmWS9HMmpwRWFad2pkdTdSditE?=
 =?utf-8?B?UzNZMTFvVzAvS0w0THBkTEZnNm53SVlMKzJpTXV3eWRrT01oSVJ1MUI5V1l2?=
 =?utf-8?B?ZnhldTFTWDFrZnUyZmtZT2xaSTFpRmR5TFNUd3FtTUpaTE1LQ3hXU1ZGQmtG?=
 =?utf-8?B?WWpIaTdiWmJWc3B6S1NISTBuMjNKL2ZkcDNKK2tVVTJreXFGMmMzR0Zsa2RR?=
 =?utf-8?B?SndaV283MGRseHYyVWY3RXJJaEIwSmhPakNDeUt5Yk9FMlJTakNMS2Jtellv?=
 =?utf-8?B?N0dObG9laGxFeSs4LzBidllveU85YVljQ2owY040LzgvblVyR3U0NWhZOE9U?=
 =?utf-8?B?Q3Z1ekFkQmNVcm9VcGRlSEtLNytLZWFsak1DS21PKzZIWjdWeVcyTWxnYTFR?=
 =?utf-8?B?MDlwenpBdzBDeldSQWN3UHQyVjUrdWR0b1pZRVpMYUplc1preDQ1U1BxclAv?=
 =?utf-8?B?ZnZGeTc1QXJ4OGViY0NVaU5DOGw3alY3OUFFZHNFK0pJakJLazdDN1p3QWJQ?=
 =?utf-8?B?K1U5RERGUWpUZ0h3NE0xVEcxNktxR3pqNExTdVpHMVlXa2lzR3M4Y3BQYTlU?=
 =?utf-8?B?dHFpWnEyb0s3U3Nlbk5JZ21pbnN2N2JxMEVYeG5tMzFUOFBFbmNDblJnUXNl?=
 =?utf-8?B?Sm9wVkZ4Y01NemI2Zy9yTmtYa1ZFSWcxRWhtdXdyOElJeUtORVZHT0hkeTZF?=
 =?utf-8?B?a2dvbll4emVVeWFieDh1SUxUOTBmNStsN0dpSE5iSnptVlJiQTNueDg4eGdY?=
 =?utf-8?B?S0prL3pQSGRHZ2FBSm1CaGExZTltdEhjZ1EzOUpvZEFtellnZzF6MElYaEc2?=
 =?utf-8?B?cGJtbm9wUWlCSEMxbmEwMWdzN0NCL3NRN2pORk9hMVNQNGVIWllVTHNHZmsv?=
 =?utf-8?B?ZGdZeFFYYmhzdlZKc0d2RXc5SXdkRlBBemtrR01KbjRXdUJPWXQzNnI1QnNa?=
 =?utf-8?B?empRdHRnS0R5MXA3eCt4MXV2aWpveWRieFhXYmFiRWFZL1lYbnAzNlM2MXBS?=
 =?utf-8?B?cmVTSDBiSlFJdWNmanY3a0tlOE5QWkp2VkF4ektzOEQyWlFSVUVLYXNvenVo?=
 =?utf-8?B?eTZ3RXVIR2M4Skg2WmpqU0ZUOTZUN1Q4VjFDOUlzZlg5Nmw0L1hPS3RZU0Ra?=
 =?utf-8?B?UVRUS2lCWW5GM0VGQUMwQUJXa3VHRlVNbjFVSUpac1l6eGs2R3hIY2V2TUNu?=
 =?utf-8?B?a2FocnNpa1JHbmtsOHFRaUcwNkxQY0hyc0plVmlMbE9uTzNzV0QwTzFIMXEw?=
 =?utf-8?B?dlAwbkJtN3ZaUUxjTWF3UUUzVCtDNEdCVUpFZkR4Qm5CbVRIaGg3by80RVk5?=
 =?utf-8?B?UlRxNjR5TTVkQWgyWHNxM2c1VkV6L1htWHlmWkpSNnphdkNDKzN1aWtUOE9l?=
 =?utf-8?B?dDgxdkJoZXVQUDNpK0UzelhBMVNaRnpNMWZ1czR0TVpQdHVtOEhzWFFNNElk?=
 =?utf-8?B?Z3ZaUlcrQTVML3ZCQndvNzFuVG1pWjJ2dmE4U2hhQzJCb1BkZDhFUHlvdjhy?=
 =?utf-8?B?N0xwcENMb09OUUIzTjJsM1l1Q09NQklyMWt6azdDbisvWGlFczI4WTd3SE02?=
 =?utf-8?B?b1NBNVN3a3E3UnRyQkh5eko3ZCtoZ0tpY0JLUnE4VlBVb2hiN2J5WkRUQnBh?=
 =?utf-8?B?WkJwQUhoenhJOCtqZ2dISnVodk01d2NKUEJVSFREbm5LV0VxcXUrTmhROXFB?=
 =?utf-8?B?SFRIZkRmQnhJR3I0Ylp1bkQ5aHhIeEVXUk9XNnJvMG5UUUZLOFVQZDlEMXQ0?=
 =?utf-8?B?YStRaXlvTSs5d0tEeU5IeHNoZWhUakZOWldjUnd2eURTSlpBV2pIQW0rNkNT?=
 =?utf-8?B?SkJJS2R4OTFLNllzMjZGM0hwNXNvSUhaUHduTFpZK2FheHdGN0RTY1g0TVh3?=
 =?utf-8?B?T05nMXZjQzdLRU5KaVBzdmJPTHVLQ3pFZ1QwOTg5SVMvSjZvR3BxQlNUK3Ns?=
 =?utf-8?B?K1cybjM2dzdGZTZwTklGRGVHNXBjT0ZSa0hZQXh6bXZwdWtWUkVKZTdORkNR?=
 =?utf-8?Q?Ick01T?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:47:25.1981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43436c66-784e-434f-eabe-08dd987ec874
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9154
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

