Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A286B036FF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 08:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EDC10E28F;
	Mon, 14 Jul 2025 06:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A30HTv0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FA510E28F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 06:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTRUpUeM8wMwEYxbEZFKEYKFSOGdcjqPejB9SEz9zYOaiGI2yLpTvkNTmmnTrtXKRVoTT1VfdtQBSmw30y4Lhg44bJz4/QgqVA2N2NXU0Z+WYFzGA1n/Fnx3tuuMZCiKX8ENHKNkKl4MIKS3h6Jk/YvEpEY3cPaaDv8VOVajIehWoqZbzl5/OT0XBUpNSSVbUZKahTYAzXljWA6hkw3IaTF2hmai3ZmEVD2XhAz6NQ25xsJ4reJJxFTyGqmjd20cLICaJnGBHLGr7JDTAHKVXAis5n8ol+jzeTnzJnJrhx20l3q2ier/sZlbJaQrtfHovDPG9tdkJWrGQx5ZQjn3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwkhD1FVZY2Y/5BbZOhkDMo/V+Bqki3Ql+mcdCiwa3M=;
 b=Fop3LDqvx8+2oLRtRSZVg1km399b5q8LShLUbtZEaJOIpfSFw7VsXvqi2DiT4TBE6U4iX+X4dZXcCrhtlyXNkVKemV2D5iR7r3y3YNrbvWHVVGvkvIlob29jCkJdHetNsChBEtx19lCh4qI8jSXNgwBntoWrqmr9/MlINVxIqW6C5Sc3P2lhYhR0dBuHH1pRCUuDwP4jhA9PnxGUgEVHGxBgZNpSkoxcAXwY9ifuluWa/ckQP3Fs7DXGK/r2LIY4sd/fmi5GSNdud76dcComST35dvdWrZyKVZBXZHUXq9dJoTqtFJU2n9En4e2DWYQxhrqZQ5bmsOD0jQ8deHE2SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwkhD1FVZY2Y/5BbZOhkDMo/V+Bqki3Ql+mcdCiwa3M=;
 b=A30HTv0V/MzDI1iesN5/GTvu24XtQjX/1QaBE/AkzzAoh/QWVTPuFEGeiOSfU3clUzuLvAueDJDWfV6X1Qhk2Qe9NDPA7+ThwMHxz+OzVHSPeSlMR474f/V6dK77ijNIEmfFU5Pzm7oAg1UwWvs4DwZ9cJDwcT2ghwYg00nZc0U=
Received: from BN0PR04CA0206.namprd04.prod.outlook.com (2603:10b6:408:e9::31)
 by BY5PR12MB4146.namprd12.prod.outlook.com (2603:10b6:a03:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Mon, 14 Jul
 2025 06:24:01 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::75) by BN0PR04CA0206.outlook.office365.com
 (2603:10b6:408:e9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 06:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 06:24:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 01:24:00 -0500
Received: from lcaoubuntu-server.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 14 Jul 2025 01:23:58 -0500
From: Lin.Cao <lincao12@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <zhenguo.yin@amd.com>, <Emily.Deng@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <phasta@kernel.org>, <dakr@kernel.org>, <matthew.brost@intel.com>, Lin.Cao
 <lincao12@amd.com>
Subject: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
Date: Mon, 14 Jul 2025 14:23:49 +0800
Message-ID: <20250714062349.588235-1-lincao12@amd.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lincao12@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|BY5PR12MB4146:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d05db62-7ed0-452e-7dd2-08ddc29f05b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i4fgnndYTn/F2Y7tkKgt/yY+97fdEggkgs2zW++7FQCxN6CUxye/B9TzAnSa?=
 =?us-ascii?Q?EkD8LjSI2uHgyafrC0JWaekm5L2gG+zXyTzdl1MAUm67maEYQhpz8ExJjB5p?=
 =?us-ascii?Q?bFS8O+Lz/WsBExPEA6lb3ugYaOtGo3sbJA3uR0Vniv4ng7Lpu9h20HV9E2cE?=
 =?us-ascii?Q?yv651jQxQplY+8sTfhF21D7w3H39B1HYLMCMdpMHJB3/CQRiZfXTVD2/LLvD?=
 =?us-ascii?Q?cZTfbklwdmv9QdzeVoQn+nfczL1FDUKOdfFobmA7tFdzVOI4uK2oYvaFzF7c?=
 =?us-ascii?Q?u9SkmWa6K6kbf39XV8dhpFIte9jD04o6m6jp8KPcIpBWlMcC9g45WNCvhbDB?=
 =?us-ascii?Q?tscCm0Dn7aHcmn13OAJp1H+33YrMcpskCRo0iMKgX6n4ToPJmcwKON2K5QKB?=
 =?us-ascii?Q?TsVPxXRjjGGWnDlLjTffRpl+wSwIR8Li/kodXbnoHv6PxBF5pN9HnjrEYgC0?=
 =?us-ascii?Q?A/QG+53095CGEZ8pXTp06Z3n42Yp++CFPgQDCvQ4V3xmnMIKYBQ6VfirIwAs?=
 =?us-ascii?Q?oxJh7B0V3jOruxXYewSmRLUZLGY2dN0E8b0ouI16Lg6vu8Fa6/UAPmlFGEJD?=
 =?us-ascii?Q?+bliSO99g4BLadI/M+ncOz+7w0BeaSaHDUDBqxUf0u8qnObyfQadXQrio3p9?=
 =?us-ascii?Q?hMEjKurMvTwTsyUTaJnhQ/fq8cyqZiK6whe/Ei60sFkyzmPFTtqgpCnK9j0I?=
 =?us-ascii?Q?1ZC7+oUHAJp47+h/PSUSoE3NifqNPwuwZM5jp5TXNJYxoystD6gqyvyANJfn?=
 =?us-ascii?Q?bQg9M4XDY6KssOXhpdCKP0MnDyJsTKDZe5wSuQCWeuiArxjDWeuIURKHXdtx?=
 =?us-ascii?Q?CkkHm0Yx2Xls/QgFhd5BCF2oUYol3v05fKiKLU/kSxbOlIpTc+vclM3PxAXX?=
 =?us-ascii?Q?fUKu1v1vllydSzG0xKkdDRUviVWtrwKcZq1ROoWzvVdAlcaqo8pX1dSPAgK1?=
 =?us-ascii?Q?tKlavIJU+DlaaC/wd3xPK8FEsvBNjpj8zrfhWlUqss/2r0XGidulFu6gUGAh?=
 =?us-ascii?Q?UniHlO9XKLiIEjRw2L51z3fcF3zyQH2GDArZZd7i0GfdLNxGM5fzuxiX4QM4?=
 =?us-ascii?Q?tc1qz2Tvs7a5szQESTbt8+3zPSMszpZOakHR9JhT2q+NyJ8pcV8mZMaSVpSX?=
 =?us-ascii?Q?6qheO0/KnUBwU+/F9BOzUOUjKd0QL2fIrtI8p3we40tih186/4tUQQ3Gk1Qj?=
 =?us-ascii?Q?ISdJFtEWGkb1Z36RvBsNi5RtSHc+SiRfapSzMQcQnhLTgo4MqgdCrllepmu+?=
 =?us-ascii?Q?Zq+QTe758Upc3x3P6Bu/1VAGNgTvNeutqExhX4T+p9UY/YtblYUwSyQMGqiG?=
 =?us-ascii?Q?x0PFGSK2u6Q8UisXxJxpkita8jBPPT8ll2LenSHZbbcIiR8pTU1q+pzF1eMT?=
 =?us-ascii?Q?+0aiRGmHVpruI6y3pikPv033dRJLxGMjwNNT0VXKd63wsgEWpXddiE/koUt/?=
 =?us-ascii?Q?WhZnDwrwVekE5jJCNEa7jml+TGPuEVRJTimsv4vc0t+TVsmH99Ih08rOWEOd?=
 =?us-ascii?Q?bX3deSzRtBUolckURMVUtL1Pe5M4yLfK+N2V?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 06:24:00.7417 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d05db62-7ed0-452e-7dd2-08ddc29f05b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
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

v2:
- Move drm_sched_wakeup() to after drm_sched_fence_scheduled()

Signed-off-by: Lin.Cao <lincao12@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index e671aa241720..66f2a43c58fd 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -177,6 +177,7 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
 	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
 
 	drm_sched_fence_scheduled(job->s_fence, NULL);
+	drm_sched_wakeup(job->sched);
 	drm_sched_fence_finished(job->s_fence, -ESRCH);
 	WARN_ON(job->s_fence->parent);
 	job->sched->ops->free_job(job);
-- 
2.46.1

