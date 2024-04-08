Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B689CB06
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203D3112920;
	Mon,  8 Apr 2024 17:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A4evjKDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88568112922;
 Mon,  8 Apr 2024 17:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9JJ0HJwiQdCPPp/AEIAfGs5J3RlTWJpqB2KysRs9D6vlW11KdPWI6gibOhIVmywLdtfdYzrbkBgf/np1ZPz6JbFcO88vRZdQQkqF3y4IM2NM2QY3IHzxo1ZmnPiKFjyCkpJOZocnaykUZDZFEd8oQwptdXF61ax6fLejFmk6ZrwlTNK/1r0BR7gnC5LEGJW4Ddsrl0n2fRX+9R6EpQTt3iMbgTl0PW0CmGE4wIShco4UNzyxyquCAlYzRKcJRHi3e6bNzvNelW+ocJn7twHLdrlINlVgmjoLMBSdxxn1Vpi2Y3swVe8jrQ3qotNztiS43ZNkVuCmq/DjE+U5sRHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rj+rbfm8CdKBqDjcRocV4M68vtQSM1usYukysJjwTqc=;
 b=l5pMR1hx+1tHIUkHrQIEurbs385okisn3aNX/7lf9aDIrNRpnznPsiMg4C/Xjo+ArHXM831NY34mA9lp8pD5bwfAoTPTRPlrVe2bA+8FcWoQolmiwqmLaC/JhL6FrKqvWEPxJnGMVql812VtIQZqD1t/GP0glcSGtAMD0yvw3BQaaU70Bu7UFcF8RK/XtRDUtVyYpTeFcYkGGJcwiCJxsHYqCK563aM8alHmn0d/yqynF4NhG9ZJJVWf2jcHyPXZhUoZIJxs9DqrIifmlCsxq36EN8EsRmAwkxHaY1BxWiJ1k7rNFMQq8IbE7rrhozUsYRm5R+ASK3JVPm6VfaOEEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj+rbfm8CdKBqDjcRocV4M68vtQSM1usYukysJjwTqc=;
 b=A4evjKDLnooni+kfMQ2jTmkXPjfuPzWfsep/BNnf9il+VLmSqDKungFShNlhvAneboiPaLG+6HsTab29yONkEWeU9ryf5RcNmKpx/A/PFP9KcGk/EO4/ODKrNdKdJfsfM2ud2Atnsp9ICFumLHon1UO5v2Lj8JZ4T36vlyYYOOc=
Received: from MW4PR03CA0116.namprd03.prod.outlook.com (2603:10b6:303:b7::31)
 by MW4PR12MB7014.namprd12.prod.outlook.com (2603:10b6:303:218::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 17:49:47 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:303:b7:cafe::16) by MW4PR03CA0116.outlook.office365.com
 (2603:10b6:303:b7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.35 via Frontend
 Transport; Mon, 8 Apr 2024 17:49:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 17:49:46 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 12:49:44 -0500
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <felix.kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Subject: [PATCH] drm/ttm: Make ttm shrinkers NUMA aware
Date: Mon, 8 Apr 2024 13:49:32 -0400
Message-ID: <20240408174932.1546519-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|MW4PR12MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1648fa-91e5-4967-9604-08dc57f447f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1YYG8ZN3d2zdhCV8yWwJLENkY5k63rA2zYw7TGrg75CgZOXvlwLFhomkIG8Az/0cZd/g5FRldJeMxts0o9EIniuUQT94OH2oKAcHNrtcIYO3vWPV6sh/FFGMRxjWhGuW8RhcjbWSSx0XBnLJKIIYRZsUXaKqhlydReVc63pAFyVdbLrRK7GX/4hLk8BBgh1zv53U4J3vR1ENwW9iqNi6OmHTe4j8XsJROj7LsfVk+WMfeMRVSqYmDyQx/spp+j4Wc7vV8NfTxgY1a2U3F3D+hkoWCgzm7TgXQsKmzmuxo5mjCvvCVV8XOYu1g8WuqYx9t4MPT22XC4L6lpxJsg/HDIUDuoWjkVtVe2frwvifpb8j68J0HTtRkVxmaQMEnCVzdWWFPqLErzHrnRvuwdiTLQdYwaHqVOcgnUoJysV6TJWLsMwpNiDnMW85/1RFtzCLM+DxjaR1rMx9DfjEz2oFn5zhzUd1NRDNyu1bu988sVMRZrZvvFi6xgeeLKmhNFJVAEHStzwJQYYg2XffxRh53W8gftxxqwht36TtztpvsWRBM9wnEG/V0frhZbHHc+hNcuS3Rb4P34GbFlLHj4LjjNB+gNxALBAOJv/LvbC7mvyp8JF+LKCps8duJj0LbfQqYLdWLtq7jFHYYh9XQa5mVkYGGc5BGeA+lVoRK9B/LgcPGeUT3pkq3kLxNWWxradLjtJJGEzrkEQQwh0HhVsHRe0ElbNJIbl03IrSuYLH1EfasV2s6E84evHJBnkMyen
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 17:49:46.7581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1648fa-91e5-4967-9604-08dc57f447f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7014
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

Otherwise the nid is always passed as 0 during memory reclaim so
make TTM shrinkers NUMA aware.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index dbc96984d331..514261f44b78 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -794,7 +794,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 			    &ttm_pool_debugfs_shrink_fops);
 #endif
 
-	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
+	mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
 	if (!mm_shrinker)
 		return -ENOMEM;
 
-- 
2.34.1

