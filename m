Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8C79E7B42
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 23:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1A010EA9E;
	Fri,  6 Dec 2024 22:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q7JBTi5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904E810EAA6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 22:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eH7ja3G4eVoMhbCiwMeAJgIUe0tG8usdy7aYpL530X0PqCFYkQ8km8ubGR6o6P/0q2oWZt+e6SBQEbby/4GZBntFT3Rr226HSo7sc+mMrOcv9hhs2UygxZR7vDKDm+GuEdqDYxXpwTEgkN3VrsD999WpEOeISp216EqC2MPOaFApjc1FRz9Y8yDR+nX6O1IGSNkpSiJ5hxnuKSWQcIdRFPmJ1n2bo//zpDMqJtPFshwrC1Pi1E0yKxMwR2lKcu5A523idIl7yEjcTfAQfGhsy/RS6m3O6bFNUjZMECRWbpbGEk9EcNUs6jJgx9cK5uRjkKqA6EIBDff4BEoBoo5gtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hECWa8P/UQHkg7p35rc/OSATe/cilMJrqQ2ubpsW0VQ=;
 b=MrMwzdrkJAUWaDiex3V0LiDIWTFrMuP/ArH1/rqkJHuTcnITu4CQ3fje8fTFlg3nDKAZ5fttmUPeKfx/kptmijY7QROtSmeVrQ7hSiRvCTwmXsyFVTLj8GX9Yzj3yAO/8aGHkDxmuKqbK2rxkAqNZRy8584sX5zU3ryjtI3RtZOz/f17on8SKgJt641DenlZ098aGSO46CnEVxyFKHxWCobPe5cBpabPNqVAKdqUZfYfBJU1X6JK6aGtKoXG1TRFXgBvrwq4Wfsqp5gnHOvr4+/36amiS23zqUP0ZYFaxZEpD7gi4fKRfMtuwkbl4bYi5eihKoT0BkcZabgRqB9/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hECWa8P/UQHkg7p35rc/OSATe/cilMJrqQ2ubpsW0VQ=;
 b=Q7JBTi5GB6bHkbGHAHdyMmrEO+KVCB1CHbTyfiLzwRk+vyaaBx8jZrIItfNHal1MxAtJqzvBXPLbty5EtS+5oTdW0B87ORCZfaybHYPO1lcVi733D21tKUfF9gcBZoBa3KdS0EkODZhpBanbTXFjrkgKEZXvXVqHIJSxjMEvSPU=
Received: from SJ0PR03CA0037.namprd03.prod.outlook.com (2603:10b6:a03:33e::12)
 by IA1PR12MB8336.namprd12.prod.outlook.com (2603:10b6:208:3fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.23; Fri, 6 Dec
 2024 22:00:20 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::21) by SJ0PR03CA0037.outlook.office365.com
 (2603:10b6:a03:33e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Fri,
 6 Dec 2024 22:00:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 22:00:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 16:00:15 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Dec 2024 16:00:14 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2 2/8] accel/amdxdna: Replace mmput with mmput_async to avoid
 dead lock
Date: Fri, 6 Dec 2024 13:59:55 -0800
Message-ID: <20241206220001.164049-3-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241206220001.164049-1-lizhi.hou@amd.com>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|IA1PR12MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: ec470f2d-6f6e-4806-774c-08dd16415fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vUM0Et9lu91BallyC3pw5chXfm3NfjXv3acAzTPk1hy42MwEkKiBOXWla8+K?=
 =?us-ascii?Q?Vh1bMooaMoGa3yIjpjg2M3itgmPvbp5vxf12gHk72m0lnGZMNTuOD7m3AGFY?=
 =?us-ascii?Q?6jfLsYCALU9TavAxQdV3b8sOpNMLeZ1fZkESyzi9vrKo9gUsy1WWZIcJwyPU?=
 =?us-ascii?Q?iOpoSTJlBc/GhIEJZgvZID6KLWcZAAj59tOWMfpJyYqi2hLDz0sfZElEbx3J?=
 =?us-ascii?Q?uAYHxLkGmsIa2WunisfkBIVG6YQwTmeacIGhNCG9ITvtaLo1lHuDqvZ54tqV?=
 =?us-ascii?Q?N/EjlKSvSAfI8qSCLZMraPOMCjAyGvPLMNA38BmEE86jdoNLM+UuU9mvBqjo?=
 =?us-ascii?Q?rL4yDevffvU/bHAMbf3nRmZ/gaYFGP+A535I040WeEDehIpXaYBoReSegAV6?=
 =?us-ascii?Q?U0FhHUGUsXs25NDXGLpbFAUCSnUmig9OTYpZ2Ix0IjazTmftCDIreTxVElfy?=
 =?us-ascii?Q?zW5pOiRnkVyqaLkF8uqq3PPx4BeiMGEUKq7wJwg7fTYPPuWjL0+x9TbsQIym?=
 =?us-ascii?Q?sUwCHO24iHhKWLCzLPi1c1e8aC0u+9/fEmdCaTHTLWFSc96HWRkeNTsMlXyO?=
 =?us-ascii?Q?D+6LDV6dh9XgpCiN3U46CTNnANnEfFkORw/n+MC8+DtsbE9F7kQW0Q8bq443?=
 =?us-ascii?Q?ALQ53yJoeUfWmlbbnGjLY4uWmBwyZEE7QdDR/K0Ew3jQuDD/y6whLYosYWcN?=
 =?us-ascii?Q?wmSG19jAApLBD8cwQuzGJV/KnJl1ZVShocEgB4fzh/4EMqKOoFB8Vxvvn2NP?=
 =?us-ascii?Q?9uuG9kLEOc02ufK9qqPOOFPPva22t+DAtzqlka08HVYZjgU9688GI6Vb2Ysf?=
 =?us-ascii?Q?ezox0oYeGUcVTVQCrDHbp6FA4o/TqYmu8o8Vzafp4YiO+25W8yc0JzCgi+wD?=
 =?us-ascii?Q?5SZiJulaBLwBjzhI9KCX95GwVimqFV9SxNwkkE91O85lJurIpj0SIDT1VGmS?=
 =?us-ascii?Q?/cqXVdQmQYhFLqrWf9EpBF1cAawvzKJ6zZrDPilkPcylNq22HL/Op3ZK6mWz?=
 =?us-ascii?Q?yq+ing7m4xFT9Pn5OMK9r2NedTOzgrMata+zrdw93ZukwcbKv6ic7q6rWcIj?=
 =?us-ascii?Q?OytPsCMOZ5RG3J6AXt4rSUIwBIsAMF5ORNYQ2RERbtEus1jF5kNW04DIA7n/?=
 =?us-ascii?Q?nOm7p9tBZPtUQ3g1lrGmemhayyHr2jioeeeJpbGcSaInw1qEJLp7BHS9Thv/?=
 =?us-ascii?Q?N7V2IPLr71vfc6eaaFeRLRzScrxFnzxrQH1Ldp14eN4KTBAQSgg1PXFE+xNN?=
 =?us-ascii?Q?KiPKn49YJMuh8StalbqmFB4wrAMmpRw9Iuh4uODxLy5KvBsvQw1b7Xwg6S2A?=
 =?us-ascii?Q?5mZPJN/MB8wE9qBHG7w7pAd55MWb0S+7r3+sGWb7dLa+vBZgQVipH3VnYBeJ?=
 =?us-ascii?Q?QvbpW7InpuO4Y+Mun+WJ4n4abFTF0Pg3nOPMxXVDvkVWqTSEFbdqxom2yrua?=
 =?us-ascii?Q?sMcdmEfEG300pmbmWG9rFV2u9Q5WoTxa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 22:00:19.2475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec470f2d-6f6e-4806-774c-08dd16415fe5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8336
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

Hardware mailbox message receiving handler calls mmput to release the
process mm. If the process has already exited, the mmput here may call mmu
notifier handler, amdxdna_hmm_invalidate, which will cause a dead lock.
Using mmput_async instead prevents this dead lock.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 90e8d87666a9..b5282555bbf2 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -179,7 +179,7 @@ aie2_sched_notify(struct amdxdna_sched_job *job)
 	up(&job->hwctx->priv->job_sem);
 	job->job_done = true;
 	dma_fence_put(fence);
-	mmput(job->mm);
+	mmput_async(job->mm);
 	aie2_job_put(job);
 }
 
-- 
2.34.1

