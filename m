Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6088D4F29
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 17:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D16A12B1B3;
	Thu, 30 May 2024 15:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RXzlPC71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EABF12B28A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 15:34:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVNLfRwmGfEtCp81crzEdm4c9JOj1l0IrDk9kkoSEFbWZ68d10uV4Q8YwQXshAatqObM2Z7q5rMuz547wP3PMUYFKdN3qI0Agj8m7GS+yx/hS1h9j0JxD+EDwrXxq8YJTBLiN7c3iREhxuZGKyKNbKcrjuUUlpm0o/1C7lSb5iR8VVnYKl9Xny38cT+VVgP2EZbduyrzoC+iEhjrH5xiCw5R8ZY9rLZh6pB7fInSHtMEvA+QFRjjYcsw5+SgQ0rWLd/o4WCjInsU+zmd3IYHnbF1EBw7w8g0UKGlVk1x1tYGHWtIctWh3n6B5HckvhubKiD36jodgQ8Y6hzqybiXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl82nhpI1R6cIhEKrULhx5Uk/nHEkaM0Gcc2A0reDIE=;
 b=J85adKct+UgE1kmvppKegv+AoYMsjyPg+f5dINSnSU1vptobwDRzMZ0neWwu3swaDhRabYbZM3rvy5VGRO04CZuO4vH4SxaSAbG5LkUaY5a/uGHy7B+bHmt8OMigvq6vU2A8C4kawwCIX39bEOXfqzxUpKIDloZQchYWUklBnQ+VElesj2jcePYwKA4wgWaugr1ErKCLyctomSJuBQwIaymGDfXoIKIii5zYpxEuLMB9RErh1o6Imo5QLWJXrMjoSWywzYa7BrCN+QI+hcf1NxGdqrZjavZIi/va1ARx5ScA6gcfRs/PU8fzXYKgltHUxA1JAmLuvkfX1PpRD7xtDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sl82nhpI1R6cIhEKrULhx5Uk/nHEkaM0Gcc2A0reDIE=;
 b=RXzlPC71mHtsGw92Lrv9zWwdUWd0hAdHKraw1K2vB4FOvvIyOkqMjZ6PxdBaI2QUxVYmHYAJW+X549tsw2/Fbhz05F0TS15e5tzPSAmQ0jXlWb/KzcZKX/9WuSyRro6e1n5n0+bQEk9Ar8ojvv8/7qH/sYwnxwp7SAmSu5yoiSs=
Received: from BL6PEPF00013DF9.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:c) by DS7PR12MB6310.namprd12.prod.outlook.com
 (2603:10b6:8:95::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Thu, 30 May
 2024 15:34:56 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2a01:111:f403:f902::1) by BL6PEPF00013DF9.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22 via Frontend
 Transport; Thu, 30 May 2024 15:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 30 May 2024 15:34:55 +0000
Received: from work-495456.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 10:34:54 -0500
From: James Zhu <James.Zhu@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <christian.koenig@amd.com>,
 <daniel.vetter@ffwll.ch>, <epilmore@gigaio.com>, <jamesz@amd.com>
Subject: [PATCH] drm: register more drm device nodes
Date: Thu, 30 May 2024 11:34:39 -0400
Message-ID: <20240530153439.4331-1-James.Zhu@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DS7PR12MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 7670247a-ac85-4c55-678c-08dc80be0e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9A8Oc6xI8stlWbr37dpL1TVAsnU/f+samncxgNmzvbRJu9Xzvg5vOLflw15B?=
 =?us-ascii?Q?2P/V76/Oq13FrFX3BXrW4Zi0eEFAltjLFzERGlZx4pU6tlAUcvsE/ZLLX9y5?=
 =?us-ascii?Q?Y5waHe3atobWi7gDz1EmAVXjicc86hD2vp4Yhm5i12zMCey6JTdnPhrty0iy?=
 =?us-ascii?Q?WkqyCoebhT8X9f/sTiBrDozlrBpgWB1KrJnPgzDRPhqpQcQceuk+35PpIvpA?=
 =?us-ascii?Q?4Zl+Vm6QG35RbdckD1o4sbDCVDU5O4Hx65A4agDam8GStAIan7LFbgDLMeAX?=
 =?us-ascii?Q?C6shzkZi/sudJ9QnKjxuQtDMven4Whmx/vozkNWQH3t3hTAacKb03fYFhMFH?=
 =?us-ascii?Q?i1j/W88eHMug+1MRKmAuykX7A+8xCAQG2fe3lafqoBwuPyOJGJl1YpnqHnof?=
 =?us-ascii?Q?DgsvmjVDzwkGoJK22/2hnVh7HySdPw+ujse0tIuOa2uqCHFQ2lf1gGTT2Olu?=
 =?us-ascii?Q?vWb5cF6LHQKnGmYN1yet5NjuXHXeD/TtyVou6Y9fSObeWDmbNLNUtMkxZBq+?=
 =?us-ascii?Q?GonBkWQ6OtEcAmwM4ZVPraKlhNn57y7LQsmoCnrzDwWz9QRuiQOyynX6mpJx?=
 =?us-ascii?Q?C7apmtJWpkm0NwQ9T5CO1G/TBec5EUexGuoY/aRPzuHRu8ccjF0L5+j16Tn7?=
 =?us-ascii?Q?UqUYHkqZ8zumUHnv5RAyTQHsI5zpJ9hmJQq5jq8zK2kS0ISwIyMK946QbWPD?=
 =?us-ascii?Q?PF+hWNkelL7wlONiQPTDG8jSVeA44LxzCnVtxwgGgXuk//XiZFgv8fWMsMHB?=
 =?us-ascii?Q?VN3nYzgBOAkq1/bHYSH3nIdadTRqqTNZIuIGlwX6IQE6v3Ggpe0WfnRwu0PY?=
 =?us-ascii?Q?dJzk9l8DmafkIVMyEjbu5L+eJhVG76nrZwIfjmSE4yVPEBQ/65sefGw4Z3zt?=
 =?us-ascii?Q?R31+89Dyp/WTPg4ork40/O7AUiwinW1sSTT/KpIVSzkQ6FIfeCgXOqMCZ7t6?=
 =?us-ascii?Q?plngE3SCCVJFKL1vI2RJT+YSlXwd9ma1jQzkqx7md7eADNynrOahswN+GuUz?=
 =?us-ascii?Q?/MBLHEDOCLl3JdBcoAseDt1n80worA4uqNbAd+yZ8xSJ3pKdEkV+2sP3v8yI?=
 =?us-ascii?Q?x8609BLaBvZcMAuVU7I7KLBgQFnqrf+FwWWJXoGOoIR6IlxaaNTobMtiYjHS?=
 =?us-ascii?Q?WiTqzhnrCKtqSTuwZ82eUshRM15nc/rpRZkhehusdApiFlRa4BasTt2MY82j?=
 =?us-ascii?Q?Jg8FEvaGFu8YcxW99Zj/DzBDWFyg14qOrs4TRjuWFSNnBC5R7p22UKUW6sXM?=
 =?us-ascii?Q?Jva1NXVCsfyZt+w2WkRHu/OcCPRFUZC5aRIdRl4tRmgBqLI31VjyTqf4GqVi?=
 =?us-ascii?Q?ro+B3GKvwrwodvhT0ychVDruzBfu/1ZgS5ly5D9AbqkN8XguNsJ2YiRddKfD?=
 =?us-ascii?Q?obrl31eSYtMHwyafdY2s5+xfMKHO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 15:34:55.6506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7670247a-ac85-4c55-678c-08dc80be0e9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6310
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

Since the default number 256 can't handle large modern systems
with large numbers of GPUs, specify a more reasonable default.

Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 243cacb3575c..719ea57a70ab 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1086,7 +1086,7 @@ static int __init drm_core_init(void)
 
 	drm_debugfs_root = debugfs_create_dir("dri", NULL);
 
-	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
+	ret = __register_chrdev(DRM_MAJOR, 0, 1024, "drm", &drm_stub_fops);
 	if (ret < 0)
 		goto error;
 
-- 
2.34.1

