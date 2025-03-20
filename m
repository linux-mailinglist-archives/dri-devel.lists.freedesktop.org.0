Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48246A6A324
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A40010E5C3;
	Thu, 20 Mar 2025 10:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o0ljwrR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B8A10E5BA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/q9K5ZGLNbYw1chcKI1HB3qpa9PjOgyvv5IlaOk9pt8aG+EEX7D9gXT8+li3nW8xmlIELPtMEO/sHDPcp8GKCB6xF0ukg3eszl95BN7J3XX+u4g/mAr08diEA/WyBq2jUsdOgWSSP4UDIsYG3fOtg39VAnZWEAc2Z9zNTAUJ5neN0pyHycXwej+bfVtIpp6K462hlx+e2CC7OgeC3k0Gt7e5rU17fVC94rt2qlYSwo31IY6VkNNbtCUMFZDAhXgL2Nf0e+FW9KIHpkxyUfgYClXjV+EUK2eQJ5TXx7/HwhuF+mG/V+y3PxdsKrO3Bo92iBhyTCZhGylEXgnu25g8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZfKl2JKNmWx3CUA2tc/yMJZg5SnvnNfO6wPu7sTawk=;
 b=BL43GLl2xZFifKCqm4Q0SdE7KWhFjTqEcA5Fz8Cwyzt5JVjW06ScO6Rn6UZ5P9eVBCKLtuHvNVTin3F28F1SQ/ADiC0hbcocoXrpzHr799TW95zmJ0p2d4cF3GwN/2Wl0Bp/T9qVuFAuOEAQsccygqEJNI4a9v4ZPbQPLhLV4d8LbRiCs9S8RQYGYOlclNIevnLDBniR4XKt2KOB44q5D/zU9lhwtiL39DUOUzN/XT2K90lAlC1qbWGDq+p2Zm9dsDgiM2X3NT0tIGbvgt2ThQ4zvacOEd7Yfbgco7K7bHtdyFjMZgdrRkf8juV2APmI7SuqYtYkMJVjGlYdOjKsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZfKl2JKNmWx3CUA2tc/yMJZg5SnvnNfO6wPu7sTawk=;
 b=o0ljwrR0HqYz5ch9g5da7Mi8t5omSoU25s0wBAoU31XYlkKGN/XHggcYJGEAhPJ0VopBYbConC/HfG/diYQcK2cmCSyFbMdVavfbVghgkIEowcTfzedTqytaIOgGHpBgl0WGC/wDa4LzcqAEpM9cyetUGe7bZQ3RIXn5nhf0AQk=
Received: from BN9PR03CA0174.namprd03.prod.outlook.com (2603:10b6:408:f4::29)
 by DS7PR12MB6021.namprd12.prod.outlook.com (2603:10b6:8:87::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Thu, 20 Mar 2025 10:00:09 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::e) by BN9PR03CA0174.outlook.office365.com
 (2603:10b6:408:f4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Thu,
 20 Mar 2025 10:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 10:00:09 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 05:00:06 -0500
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
Subject: [PATCH v8 06/10] drm/sched: add the drm_client_id to the
 drm_sched_run/exec_job events
Date: Thu, 20 Mar 2025 10:58:02 +0100
Message-ID: <20250320095818.40622-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|DS7PR12MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: 7885971b-7cbd-4f86-7075-08dd6795ff7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUNWRlZ2bU1lUmxDd1NwQ0wwVDZBbnV0ZWdqMVp5L3ZOM3NaVldqT2FMUkZE?=
 =?utf-8?B?UUc4dmpqZlFGcDhjWDI5YTFFK09nSlpyTWFEOGlHTDFyTHp5UXByblI5Y3lR?=
 =?utf-8?B?VTcrMjVVSy9Eb3Z3L3J6SkFkUWJMekVvYXNmYzd3YlJLdW5yYzd4dUlRb0NJ?=
 =?utf-8?B?N3pjeEZaMTRZY1Rkc0JUZTVYWHgwNldnYzVQM1k4ZWxWOGlZejNVOW5Bbmdk?=
 =?utf-8?B?Y3BsMTk0cEpFNFdqY0Jmall4QkJUMGNMZzZreU1xbEFCelIzMnplWnhRaXlO?=
 =?utf-8?B?RUhwV29ZenBBUE10Uld0d1BlY1I0cTN4QzZ0eHZPK3ZWUE12S0gxRUdBTCtT?=
 =?utf-8?B?SDhqQkVqWUttNERySFNXMFEyNlNjR3FZZFNwNmJ4NHRKdUJkYitza0ZkLzNn?=
 =?utf-8?B?QzhTYmtVYmE0UkJZa0VXVkxuVVFtWFVJcC9aem9Xc0V3bFE3ejZQNGJ4S0ZF?=
 =?utf-8?B?TkhUa3RyNkZrTUc4T3A3TmNkN3hGQm1OOERjb0h4SVFLYTllYzRaZi81QTl6?=
 =?utf-8?B?UVE0aFRxSThhaTJXZDR0aEY5cnYyOWxlNXUxWFI4eU5mYUk4STFwN0NRdHd5?=
 =?utf-8?B?aEdrVGYyQkVqa1NyTGxFdVpCRFY1ejhlYTR6VG56cVg5WmR3VDdpdldNZ2RU?=
 =?utf-8?B?em00a3Z2cTBQaS9FeTVPU3hEbjVkQy9XUGo4ZmtOV1ZRRnc0SjBjQ2pEZWd5?=
 =?utf-8?B?QXBBL00wdEtUeE9JS01OSmNGeEUzTmhiRWNZbFJSL2J2cUFZQTMyOHVFTTZR?=
 =?utf-8?B?MmlXQzZGdTdNT1JSVldGSlpiU3JCcUs3OUhHU3RZQWF1ZEtSNEgyN3Z0SDhD?=
 =?utf-8?B?ZkVLcXMrakZCSUorZ0pKaE1uTmVoQzJFZTlFeUlFUzJFZjNaaHpwdDhNZlFD?=
 =?utf-8?B?YnV0MFRjWWhtSjRqZHd2KzdvTGhYWUVxeFJCL3pwZVo4SmVycTE4NlMzMTZJ?=
 =?utf-8?B?MEI2WnA3NzNDQkhSRGRYYXFvQzR5dGdvSE9IeS8wQ05hclA3R0U4VTRVVEpt?=
 =?utf-8?B?UVZSdkZ2alJXd1NpTHVQd1kyclpJc0F6L1lmR0xmTk1yMGtUTnFnTEtyQkxE?=
 =?utf-8?B?V2JqR3BYYlB0WDBGWllLYmtHekRJT0ZNa0phZVZZdkNFcFVhTkpzUXdGZWpI?=
 =?utf-8?B?clE1SmJLRkU3ZTROQWFFU3EraEY1Y2RKOERrY1gyaGlpVEsyczFZTFZLTE9j?=
 =?utf-8?B?QnJSZENBdEZCL2c4ckl4eGpkQTNzOENQWVVFUTFYWmhObWNQV3VUYTAvMnpy?=
 =?utf-8?B?eHhaZXQrTXBQSGlrK1hYM3JMYzZOYVp2YlNjMnNDY0NGazFMKzlhbzNKRzNw?=
 =?utf-8?B?Nys5S1BsSEI0YmRGbGg3Q3JubmJ6WStHYnFLSHlVOG1zMTBpekZJVFNIM3Zn?=
 =?utf-8?B?UE5VMVI1dUpmWFZQUXZsTmNaOWNvRmpidC9BMTcxaDAzS0xpOXlXek1tUXgx?=
 =?utf-8?B?WkkvVlBPS1VEc0lSc2lZaGh5czB1YktqemJBc2NvSTZOdG1MUlJhVkR1NkFj?=
 =?utf-8?B?cU9jUmF1RlFqRVRwKzJPRjE0TFNqTUN5UjhnbDIzcHp6K09xdWFtTFJGUVlz?=
 =?utf-8?B?bWxJNUpoWVNtQmxHVktTRHpKZno1VEJOUU1ZK1E5bDUyZnJIdXI4QjNIWTBN?=
 =?utf-8?B?MlBVaEw5ZXorMzFma2JQNWwvUTMyQ3B1Vjc3U1ZPODZuNFZkdDhKUlhsd2ll?=
 =?utf-8?B?eHhUT2VIRXUzQmNiS3llTTNpc0lVVUJXK1FzcVQvQVFRSUpSUUpEcGRtN1pt?=
 =?utf-8?B?dkFla0EwajgyN2g0cEptUkZ3S254dzNNdjBEOCt0ZkJwdldvNS8xUUVRNTU2?=
 =?utf-8?B?ZlNhQXJoWXdpZ2ZBdUZGdDFwK2dHZjFvd1NYdHlZRFVBREhaVnVISE55VjR4?=
 =?utf-8?B?M25mamJ3cUsxNkMzVDQ1Q0d0aHQvTU43enYxRXBRZC9kQVFKZlN3WFlVdzRx?=
 =?utf-8?B?em52YnI1dFpWYXJ1SHluR0hBOFlJTDJmcHN5Q01SUkd4eGMxVEo2V203SGpN?=
 =?utf-8?Q?88jWCdyq80QM7V4CRumK1Ds3C3qTl4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:00:09.0233 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7885971b-7cbd-4f86-7075-08dd6795ff7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6021
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

