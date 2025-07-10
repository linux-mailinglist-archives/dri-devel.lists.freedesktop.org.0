Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CB6AFF9E9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 08:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F0410E880;
	Thu, 10 Jul 2025 06:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pgJO7nSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE4010E879;
 Thu, 10 Jul 2025 06:36:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqQIbv46SYQoxJGR/q9K7U7iYRr/kQsbHshcsoUsYFTn5mxVu/J41n3YOwrKBOVN9KQ1YZBQMSJj7JxGAfEBrLhg0LGx7LvxQ9lERpNy3Jx6H/xN2JFKDOckpN7kp6nJBzSnpPU5Ek9KpvYyyicI6ERRwieTc15S7OAxOQ8nG7jkAlzCNHL5VzFUc86+htf78ZDptBzWoOeaQeLYRnZhQ+nR2xWSOqIET65B7r0Tdeqeho9penMB9bvJo0MFaeWV3hJzw62BzRB9vLcGi6jVfY8OBkVj2ggH5S+I/qRXwSUWRyGyBznOpA/I1AxSKg4k54ZWsML4cI3aLi5/e20yxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcaqUYjClAV2D4ofwcWX5G4o205sPac9HYYi01X6w2M=;
 b=mNBoE9aTPRwbSfk0BRQlmZpsHCkxBtbefp7Lwxks64ZdlSV1XANzf6Vdn9E6SjK6jPcm/yvSE4nC9toFkZ81TXepv83X6qqH3Oy2yqQOYyv9W8pgAnMx9u+kvdag/zJcoFi6ufRw0mVupNvujL0qyzx2sPrZvxiEJvMdm9ZbgtyRS2Y19gLX7zcUhfBi13EM1qIcylonKNh0ARCE+w9sf2GcHV7IrqLzJH4r8IJd0dTFihpeRJ0NMwtv4BaSv1786TsWzxpDspyaOSo3vHWxsarltcwBz7fGufD0oMoq9jYnGjJfmZfyEMARHsPVbbBkM3amPeDM/UvUJvo1V8Q4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcaqUYjClAV2D4ofwcWX5G4o205sPac9HYYi01X6w2M=;
 b=pgJO7nSdQkC2lPVFRaxoFC75HaYe7CTLD7xYFRXTQz6zTxeVQenHd0Ac8jpf69IkGZyJv/Ubp8LufSG5n+QKpkjIIZGECx8teq4/MoC+y7CcHdeKvU4KB/UyPmruEgM5nMpCdQC1TAf73kOb0NwgqaDIjj89Q5s+G5tcoi+YfGo=
Received: from BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::15)
 by BL4PR12MB9480.namprd12.prod.outlook.com (2603:10b6:208:58d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 06:36:39 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:59d:cafe::dd) by BY1P220CA0004.outlook.office365.com
 (2603:10b6:a03:59d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 06:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:36:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:36:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:36:37 -0500
Received: from lcaoubuntu-server.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 10 Jul 2025 01:36:35 -0500
From: Lin.Cao <lincao12@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <zhenguo.yin@amd.com>, <Emily.Deng@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Lin.Cao
 <lincao12@amd.com>
Subject: [PATCH] drm/scheduler: Fix sched hang when killing app with dependent
 jobs
Date: Thu, 10 Jul 2025 14:36:33 +0800
Message-ID: <20250710063633.498633-1-lincao12@amd.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|BL4PR12MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: f995933a-d270-4d74-328f-08ddbf7c1fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v029EOfkWwI12tn7+FnYpXoxO1YaM5Ue3OQvAeESJdbCGAvb3vObtwnIaae9?=
 =?us-ascii?Q?yZXJMVJCodSysB8+zAZ32xwMLXEbWKRNq8QfmaI63BS+0e1QFeS5mRI7GMLD?=
 =?us-ascii?Q?unB39f2TT5f3xeVg1F4G4MHl6hX5IL/3YjtVFomHnYpB6um6g2b7JQA7wrK6?=
 =?us-ascii?Q?wVZjnSNyIvoGfLuo9JVp2a2sxzdN2AKaDFEaXXZLjwE0qZEgTvqbW0CyH5Ut?=
 =?us-ascii?Q?sLigStNqi5M0o5RC1LdZ8yWrCue1VIy9PIgas3Fktz3SJ052oZF9U2svFF8r?=
 =?us-ascii?Q?tmgPGYUM8kx7HNqgWQM4N9KVhOT1g1EVdAL6B1AXZm3iixKVe+aTSZyZnwOt?=
 =?us-ascii?Q?Vo5XN/u0IxWU3Q1PM703mmVwLTtbqZHMbHA1/pjJ9PG6udKxNxWz1Mi/24Bk?=
 =?us-ascii?Q?HvV5PCmQMbObp+l6jB+iKytyshUVyf+/w9usNro40pI2cOv8VFczLWfg8Z10?=
 =?us-ascii?Q?qROOHjpQbyhfcFq+8a0FCwQtIlkWulQJizbLFwPssIcWY0tOG6vUrSDd5jUj?=
 =?us-ascii?Q?fmyJoVgobQD/y04vMLgwV5dMRf1NEIucsGPf+qfhPiEWIC8fGByhdxoNFqRZ?=
 =?us-ascii?Q?yvwOuIsZxKcpcbvP4oODfb4Uc2e3r0h4ljvG31pKid+F/Fm0CzTcGYYhgsJq?=
 =?us-ascii?Q?qADXvFEuaZuVuQTLdxbQ0oqkX01OBkhFztuFWkFKFuVCviwHbWlP0aO2EUQe?=
 =?us-ascii?Q?EtvBG4kfbTMEQBN4ce11qZ9wTbPEt0SuGl6v57z2WSKgOCR5x8oYalhRUF/W?=
 =?us-ascii?Q?+agtNnBDe/n89BbOwokgWBOJ+JY4rpREbxvUhhDr7+wrgCeMLgFsCHvB5KlG?=
 =?us-ascii?Q?41uq1XKll0zcLyaNQlLrGpN90HSZprP6qlPEOQC4r0gQ+K76uWSRhurgCTCp?=
 =?us-ascii?Q?7VnjHz2vsXkK6q0PQDzHz0mWS7+Klzus+MSF+aUd3hlLQ9n/TX9pPWEDL+0l?=
 =?us-ascii?Q?wTgivHF/eNUitqU4BS9oqY+GEIXLl1k2r2PmRkPYFwXjCZOidQAo/v1N7n3c?=
 =?us-ascii?Q?OahODsnQRKMLoMNK+eblRYEja9fadenWbwKZBwqfDLDayD/BkK8M/3BlPrAl?=
 =?us-ascii?Q?9MBegu8BabdT5r5maMyFi5RnbZrSv2lSaiDch07REq6HxJB1z4ZOUM4ppk2p?=
 =?us-ascii?Q?lL2itFDGst4gImKmSk/aM+skgKxymJeov6/zFgrniutaE3Ky4G/anL+Y5n+L?=
 =?us-ascii?Q?dQBhgNsDzRjyt0bxOe49tOSGQvVqwXQUMuDNs8k6HEvd0FJfhN5ZdjSJprlV?=
 =?us-ascii?Q?iyyf6W7Xx1ctIM+2xHK6ZMV9HCi3ONmZas/Nj4hiGaSPKIfLeETmEeGBBCPm?=
 =?us-ascii?Q?P6xz/yD8vokmNsaftpeDkr8nqwx452EqSQv2vdfSvDZrXNxk1UIV+XDVuzPe?=
 =?us-ascii?Q?ZKL2hFEk8Xpr4VQwe704o18iFX2U2FjmUGvzHyr06zxRzbCmtoRKPbnM/10n?=
 =?us-ascii?Q?OvJBFJsBp+hWK4VC0SnNTM7GcAIKGQDvh0MtrOsbI1Y2hRfuosKukmvfGyCa?=
 =?us-ascii?Q?QFaqpl0Dl3i0NJI9fnXOcOFdqaF8Za7vV5XC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:36:38.4790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f995933a-d270-4d74-328f-08ddbf7c1fc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9480
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

When Application A submits jobs (a1, a2, a3) and application B submits
job b1 with a dependency on a2's scheduler fence, killing application A
before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force
signal all jobs sequentially. However, due to missing work_run_job or
work_free_job in entity_kill_job_work(), the scheduler enters sleep
state, causing application B hang.

Add drm_sched_wakeup() when entity_kill_job_work() to preventing
scheduler sleep and subsequent application hangs.

Signed-off-by: Lin.Cao <lincao12@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index e671aa241720..a22b0f65558a 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -180,6 +180,7 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
 	drm_sched_fence_finished(job->s_fence, -ESRCH);
 	WARN_ON(job->s_fence->parent);
 	job->sched->ops->free_job(job);
+	drm_sched_wakeup(job->sched);
 }
 
 /* Signal the scheduler finished fence when the entity in question is killed. */
-- 
2.46.1

