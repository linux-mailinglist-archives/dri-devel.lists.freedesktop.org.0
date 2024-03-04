Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4507F870744
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D42A11232E;
	Mon,  4 Mar 2024 16:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SHIXpeO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EE711232A;
 Mon,  4 Mar 2024 16:33:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bw9wsgzQnxBDvaUK19JuH6L46MDLNfA5a72qLUXX1IxPyqZRUXiejR1T1mllOQsd+dvcjr1W3zBWO5KT1hEROzjKShfS/5UEiNxuxTh2geB1UYEztIyglLCREy9RqEC76nQKXds+MWqlJ+9BHKjzs1Da+hffl2ozKRgVu3oRtEGskzH7S5pPz3EJJSyB7GoOfm9S6uYX4hHv+y2y7zOkU6wolDRmacWyjsX6X4HPDWcrY/JgWRlBc++Y/j3RVSibqAMrOJwq8SiaDqNXIaM3uKRAIYjGUFctLfJJrnbG22D+mtbRw3F9zCMxSH5FAEpyJtSst4FzijxXydMqFsudGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruGxz6P/LMiA3Dnr7OrDZ4SHTLgiOeQ1s3arxAQQXuA=;
 b=cAh33YPvoZ8ITo40s4seM5EZjUI2R5mnWTSysBLq9jpf6zFruiOeCF5wCEPohfyDNWnG8Oqr6ylecRVNzTIQ9MfsaBdobubrWTp6Q5Qxa5h3Vo+C3Zu4CpxaX1VyQeEXQrotbsCTGb+gXbEWP5mtwvanbdHqqL3dAKi2mdWVc3DD5RQk4+W+uyd9DLhtF4NDpNaDnE/Z8WZAyTvQZr1gYcLHBFQz0mTAoU+y6lgwhx/9BTaOLkU1le7gHnkYI16q6JdC4MfmRUDaOo3zpRUr7Ivk8paB5S1PSY5o+41+R8l6I0BmKvDRJjHJxjZItMCjYFYYjWQO2i0ABnuVJ6nqhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruGxz6P/LMiA3Dnr7OrDZ4SHTLgiOeQ1s3arxAQQXuA=;
 b=SHIXpeO083m13laBvKRyzNBzUO+S/8NWsH1DnfiqX5gjEMOr5nOviq3LECkYo7HTtyzMlzMUAKlWk2wtqWZaLYLegrx2jiXtYl3PzQPrz5LbawJxjT8Odj+HbwPMiK4NFqgRIEgKcz1jXQlnP7rCyWw7jKxpErKPapBp5Or/OFA=
Received: from SA1PR02CA0004.namprd02.prod.outlook.com (2603:10b6:806:2cf::8)
 by SN7PR12MB8146.namprd12.prod.outlook.com (2603:10b6:806:323::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 16:33:13 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::cc) by SA1PR02CA0004.outlook.office365.com
 (2603:10b6:806:2cf::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Mon, 4 Mar 2024 16:33:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 16:33:13 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:33:10 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <felix.kuehling@amd.com>,
 <mario.limonciello@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v8 3/3] drm/buddy: Add user for defragmentation
Date: Mon, 4 Mar 2024 22:02:20 +0530
Message-ID: <20240304163220.3093-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304163220.3093-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240304163220.3093-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|SN7PR12MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: da3f8ec5-cf11-47a5-8409-08dc3c68c97f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /1BMLDC3jQROn+3SSR+QfMB5uftVUrhYc/44gaArLiJ5hMmpsQ5qtv5MvNiuzDKzz7p+7HH3ToKZQG0V4/+ZR56cj5Nlmo0cEZMOGKZ5qJjdeTIR3HgGFevTJ/gtqEfd70kYCM+X+jPO60qW2elAMW03iaZ5W5SwU3Uo85T8OF1AtK+VTCyg/e15zGxy7OWbbWIGz1tElzSmAqbj8bBLWT0zUxVkkLNyorO4n4Dw0vIIz0RRdIAItCYLqhiNjwPQsJaky2LL+uwd5ET+FpH1Oec8+cuOZlTBWhRnItPttGpJKr006clh/SPktzhFz9t5GhTK7RMHzRJ8d06OKFa2RsD2kl4COFaP0xgTlXW1L9tUlMDxoAymwWXPmdaN3uYo2N2NIO6bsIw23RFGOEgj2ZGq8uZ73BEoxSnGSJB9gt2cNLGFQpbZpuQs30iVt9Hjk2QEmGrrDH7D2QaAuEA4wEytNqj+l3QEW/Xr9KK8aZtXeW6N4ihN6mtJY3LLnnZMxmAa9ppwDugfLTND36ALhVRVTN+u51oA9EWodPY8VMzikV3aJWBhetsEl9Mv1xrRRE6ucpyYrLFkDFzyLnL/ULijHB1Q3nxPhkvRG1/MzwWiCJ/y+l2if5vtUuJuAmxBRhtXZTmDbqUa8cfiQD3MrMia1EMqBKrv8pQ//6j4xGgC/itrU2XoIC1nvaP9974ryzaJS5Hye0SkvUfO2Ya/OeZWlSHes3ijE1M1GHosv0npj5e7paeErtvF3JbHxhqr
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 16:33:13.3985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da3f8ec5-cf11-47a5-8409-08dc3c68c97f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8146
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

Add amdgpu driver as user for the drm buddy
defragmentation.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++++++++++++++--
 drivers/gpu/drm/drm_buddy.c                  |  1 +
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index e494f5bf136a..cff8a526c622 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -533,8 +533,21 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 					   min_block_size,
 					   &vres->blocks,
 					   vres->flags);
-		if (unlikely(r))
-			goto error_free_blocks;
+		if (unlikely(r)) {
+			if (r == -ENOSPC) {
+				drm_buddy_defrag(mm, min_block_size);
+				r = drm_buddy_alloc_blocks(mm, fpfn,
+							   lpfn,
+							   size,
+							   min_block_size,
+							   &vres->blocks,
+							   vres->flags);
+				if (unlikely(r))
+					goto error_free_blocks;
+			} else {
+				goto error_free_blocks;
+			}
+		}
 
 		if (size > remaining_size)
 			remaining_size = 0;
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 40131ed9b0cd..19440f8caec0 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -396,6 +396,7 @@ void drm_buddy_defrag(struct drm_buddy *mm,
 		}
 	}
 }
+EXPORT_SYMBOL(drm_buddy_defrag);
 
 /**
  * drm_buddy_free_block - free a block
-- 
2.25.1

