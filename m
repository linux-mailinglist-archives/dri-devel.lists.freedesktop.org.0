Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70308AB7B67
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 04:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308CB10E096;
	Thu, 15 May 2025 02:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="blZHCTv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F6B10E096;
 Thu, 15 May 2025 02:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7I+Hh8pQ21JY5cT7ZTAvTW75EfcXVrhJbroBxhLLGfn0tDeHubD2qbPY3TC/Ck+ggrSmbxNmC1JTYOH3+vx6dxW3UOTtYhQuebDwK7vLCEdJK1JZkcdUer5Xkj3MG+0XAzHxQW9sf3YNyQTTgQ5ohylaGfoijVjxqkATHhhJYSkVlp3oQuxMxyB/bLJJvkWeiJ9x/xBWe2Q6LhIcJRMqRmlACeBKGhODAEv3TA6t0XxsITnVaUMNhSwDsdZ8kZXQwvboyUSQLVMlq3qxslB2mjrPOe4UHkrDt5cucEtZAcUdTh0/oJwaGsAvLKqPi/ZlQehMrjtjFwx6ZRp2SNZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwhPKggD2Jqnhrs9wKNp6xBJXGpuAEVgpTYNI2W1fzg=;
 b=nL/tc+D+v+A3pdmtceN2F2a+g9Sb1r3VCyrQxCVIQOIPCdSbXn5UvDv59to4iMIvUwPrzDHt1rrn1vxUFvFD6c6mEdnfnz0doI6DREV12l2AHOKXSNvUrWCiCBO8y8FX0o1JHIxd1xeDEAHKZAmv3ZG4nqoV6r/hULspFbOIge3xhNagALd+ttb59TmyccfJApvvkMVNZeorjqVzN04UDVBFsjVbp3mHQYpO6nClzDm2n4e16brA2NqgCskuiHtLN8zr0KB9zRxZOi+WAcZwVQfnDbpguH3RGE9QbfIfajGXP9ZwaC5lcbT76gvsdgYzjHjswCcCuGy6I0kCpSWMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwhPKggD2Jqnhrs9wKNp6xBJXGpuAEVgpTYNI2W1fzg=;
 b=blZHCTv09kpOeoIorSALlAVnZmuJ5YNsOyAW085GHfbyjA4t8m2pzuVxSWX1n0avino4QolWcnKJTlwjdUwlCZS7A4iLNY5Wn9ejwD8jg5TPz/WZXiGh2bYw31Eb0DnZPgTrCChPZedufwM71nRzl1QFH7GsFnWGqufZMsur5ak=
Received: from SN7PR04CA0162.namprd04.prod.outlook.com (2603:10b6:806:125::17)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 02:07:20 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::e4) by SN7PR04CA0162.outlook.office365.com
 (2603:10b6:806:125::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Thu,
 15 May 2025 02:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 02:07:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 21:07:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 21:07:17 -0500
Received: from lcaoubuntu-server.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 14 May 2025 21:07:16 -0500
From: Lin.Cao <lincao12@amd.com>
To: <dri-devel@lists.freedesktop.org>, <aamd-gfx@lists.freedesktop.org>
CC: <haijun.chang@amd.com>, <zhenguo.yin@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Lin.Cao
 <lincao12@amd.com>
Subject: [PATCH] drm/scheduler: signal scheduled fence when kill job
Date: Thu, 15 May 2025 10:07:13 +0800
Message-ID: <20250515020713.1110476-1-lincao12@amd.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 1310e6e0-cd85-4e33-cabe-08dd935538fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I06OWkPB2YA/c1cnCuYf3Hg8NQXog+zxT9Rrqr30e+ujx9OnYoHpySLzO7ob?=
 =?us-ascii?Q?nKX5sBt/gVGlmAypcuOtL7c7bBS4YHIPWKVQ4shEb2x0DfqaVh2ij6bYjNoh?=
 =?us-ascii?Q?nVqOyIyD8hcqLr+46+ytG7lFwbvGaR9BXwJjGUFXLMULoJYGgm7IfL0QzNid?=
 =?us-ascii?Q?pgxNXKeCLPIW1i3P18wZgpvpLaDXPK249RDSxWvZgxixF5zamHGjG9YLZupT?=
 =?us-ascii?Q?ue5kocw3WPZUgiV4SjVU0GGOTDcvYga74frJSGcVxIg8hBURRUYD1+id4879?=
 =?us-ascii?Q?NlOrWeWPC9HRw4LhUiY66gMSP9c4ZQu2oXDfviGY60hTmX6lCSWJ98hvXWAR?=
 =?us-ascii?Q?MA+k0qwzAlYMZ2lpompjkqSra5cLR6m6NP3NGxtV7gxCUn0DG3YzBzP+wg4e?=
 =?us-ascii?Q?viZhcCZsvmCi5FiQqmANvYWjzym04Oyg0U++1fajNcT7M4t1t0IyCJx5QoAL?=
 =?us-ascii?Q?I5Le41ekssg9a7oPM4S36pT9qIzbKTiG/pcm1A2hESfyM5DFP3/mKjYHQknn?=
 =?us-ascii?Q?4UUUzi8sOL/H6+vukB5UhR7P/Q2yFZ9Du60JKnrdR8OjnS6pBNls1mCPqC0R?=
 =?us-ascii?Q?cJOxdFDIoW6ObsdB1b1sXRnmSLmwqL+TZaSHs4SvDJg6zhScsVhakTmZwlZd?=
 =?us-ascii?Q?Oij+5+v2bJe+VKPo5yaiTmuy49w/31zauZXGIacGi+nmsnnwVb4DR05bY8BQ?=
 =?us-ascii?Q?8Lnd3Q1MqqgvJBumhGZm8B5nYQWiyGUQ7hpFMIj23W/51umdfKcc8FtSL1i9?=
 =?us-ascii?Q?BekbE/Hj47B8TqxJH24BkFUXeGVbf/6tbpMsEpsSAdf50EULZRvgYeV7F0kS?=
 =?us-ascii?Q?OXKNhImtu25jldtlMqEisZDEvWrsyYdm8OVztOP1IDIj1n57RQ/Qj71fCLMQ?=
 =?us-ascii?Q?PlkUvepgjOuvKmnvAewkcGNgk4tlmrM5X103OZ/6KglJUo7aSm4jKF+TNAeB?=
 =?us-ascii?Q?lUks2q27XttHB7Sll9PWWoKyAk+La79YuRgjQshxn9sfRnP+yKqX1gAK3qBh?=
 =?us-ascii?Q?hnAICQvtLytUZFz9IwX/aeH6deGpielRH1YO84Gw912+QGL9dVscSBPl1iW8?=
 =?us-ascii?Q?f+WgB7KX19WKYI2Ajc5XBHfDCQlnDthvX2pdfq5P6bFVVE8tj1jr3rk3bXfH?=
 =?us-ascii?Q?oyIM6fs5qmIpnDpcOb8RgO0I0ocWpg97XySAkPsSDHxIhM6Jwc+uX5U5ijja?=
 =?us-ascii?Q?mvxQYEkm+WK08ZgfmpQw0rq2HOp3pP86Z+JOCqGmQYKl16yib3LE6ur/W/kF?=
 =?us-ascii?Q?j1ajVq8i91YUHvhPCDcz974KVRvgJYP+kNyJ+paO0y0QXeeCPxjTluBkmO/x?=
 =?us-ascii?Q?/10UBnX+lniTEQN+vlYXxnzF5t1GgjEvdicwofULRvyoRYCEOREKpAvJGUHk?=
 =?us-ascii?Q?/ELBgEGLSGIGllh4RnYUNP6moAPVHQ902k7EZgiFuHfB7WLpiWg4Qbxd/JdV?=
 =?us-ascii?Q?jxGlv2m4IFWVsByI5i7lX4VefHzv/UfB2h4Y9FbWT6ytmIQfb8t8FoJ657gA?=
 =?us-ascii?Q?ZCog98hAWCoznbrSOa39J67oXB0J52iLRjiq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 02:07:19.3194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1310e6e0-cd85-4e33-cabe-08dd935538fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

Previously we only signaled finished fence which may cause some
submission's dependency cannot be cleared the cause benchmark hang.
Signal both scheduled fence and finished fence could fix this issue.

Signed-off-by: Lin.Cao <lincao12@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index bd39db7bb240..e671aa241720 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -176,6 +176,7 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
 {
 	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
 
+	drm_sched_fence_scheduled(job->s_fence, NULL);
 	drm_sched_fence_finished(job->s_fence, -ESRCH);
 	WARN_ON(job->s_fence->parent);
 	job->sched->ops->free_job(job);
-- 
2.46.1

