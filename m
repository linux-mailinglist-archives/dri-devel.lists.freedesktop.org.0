Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317666EEC1D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 03:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D0010E858;
	Wed, 26 Apr 2023 01:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D25710E858;
 Wed, 26 Apr 2023 01:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDRl5e+G625h5xXAhNDrBIjjJ0QIA5D0nC3gVpa3+W+0rRVxUUshCR3knD/SmLM6+3ImBCKm+oYgRD8GLPh3pAbyzCPUmzWFMOpd10o1UT385njn+q3ANa8v2wW3h6NXqhROSCWfEj90G05CJwTRNW8wylhxiJihKrb5Q/dVfyj8VUjaVVptTfI8ryG4kLgehOLBdgUhfJrXsGDt5538pKGPGLJ75F3PaChMj1MkQjikFTHZT/agmaw3mkshLLtNOE+Dfqfgb7+zNrZIsBxjgIRT/oMJTcEzuziAWGwmLrYoj5hUtnYUpRj6YCruHdt0k7Ud2XcvNCzri1r7tQ1pOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ta7ExdC0ROnAVZPX1BfzU/wBg3W16+OHIEzL12nHjnk=;
 b=FlF6qs9KnxaKA2+kXtUW5Z184ns0t1/7BCs+OtldZ8rMEUXFZtPdWCOIgvNiDQW0jJdv5Ic9X89yfKLnBTqEqykP56daN4HJkfDo53s7/u0fqJZTlG1Tk5AwcnBNSC380OJLBSMdJtmrxEf6XavUYq2APp8j5dUD/u+kSt+0p2wpvwU2vYL6oqMSPBhvar3z6vkgaF3YswE9qcDg4ArFJ4lPnPHi72Y7MfWp/WAQFGXkpZO10672OXPFHMW0ybBFqd4zMP9Zrf37N5DgJL+3f0a+XXvVl/CeMQheuwBcJIEqP0gRbGpoaLwOU71aFfMgGh25zWq32vpxlwkN0G62cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ta7ExdC0ROnAVZPX1BfzU/wBg3W16+OHIEzL12nHjnk=;
 b=uHJcnQBt0fRlGfRS0ivn6IFiTA4tQF4M0DGV6SORz2vmdI/6K/Bg07QG0udysTVnxo8hq+LTQ0p6vM9iE6Xhvr6NLWsmavmImD3TqlJ1sCbGyt3jAWtd26ti8prxkCHevLs8EbLKIoqX/NAezoYoVD3szq+JgqVL0RsUbNKJBF0=
Received: from DM6PR07CA0107.namprd07.prod.outlook.com (2603:10b6:5:330::21)
 by SJ0PR12MB6782.namprd12.prod.outlook.com (2603:10b6:a03:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 01:53:24 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::f3) by DM6PR07CA0107.outlook.office365.com
 (2603:10b6:5:330::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.35 via Frontend
 Transport; Wed, 26 Apr 2023 01:53:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 01:53:24 +0000
Received: from mukjoshi-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 20:53:23 -0500
From: Mukul Joshi <mukul.joshi@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: Set GTT size equal to TTM mem limit
Date: Tue, 25 Apr 2023 21:52:50 -0400
Message-ID: <20230426015251.551223-2-mukul.joshi@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230426015251.551223-1-mukul.joshi@amd.com>
References: <20230426015251.551223-1-mukul.joshi@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT028:EE_|SJ0PR12MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: e59bc703-2f50-43d6-801b-08db45f90564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IxoKgANFpQXGIjT1NTqVdilpSTqk9taay6L4qfB76TWv2nKDA5MF0QyBPcs+imZvWe/k7AwqBt1jBxrflK/90tP0HquXAC1pqrBw/82gEugHBiy4ev1b20rTIKx+ltmf8LVtSDsJGmu0TnAdvNPbvVDX8mZWhP5UToSLvnAwbZLS8TLCCjhftfJ6WmlRqAsW99IHmLXT1qAhscUF0QbADmkuwtJetmrXvihzZzgLwqY8iMbzCWZIwVX5chhJQNuPKZ82BjMEsn9txgfy7/uXSRhLFQnJunxg80XhgldaFdxHITdsJ1B46AXjuktDlu2HcoN2fxQYEZR4/smGP2k7slPEmIPMmhJ6tCuoiID1c7ttJ0ezOFXvbapHy32NPN8VWfKADqVGJXaIyrrOud8NDOUcHWrtQhsBUEkHiAFyU+gx1AvudOhoN30dRNNZPqYPkb3/5R3QHNFVLyeqlzrnBEGLilZHsElkjXltvNgZXu1QcZN/J5l3WuDG9vDmJ77dg1SgaajmPXRlgcm7S3T81NgATuszQZoIAbB0XmasrASp/wcgQR1Fa1qkkSpd4j4ki8SRGI2wu9wL7bjFz81IxBqSAvtTO2YTbnXbSxDFiibQ+V4XeJblsPxWbCkJLvDVBSvo9NfVp6iysEtE/zONB/23ONnfFBNnP6nw/j5SYhUxicHfN4DlPdxQdwTILqUm1cilZugji26tWfhZn1yC0PPk//G4JlRQoz4/plWq96A=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(1076003)(26005)(40480700001)(426003)(336012)(2616005)(36756003)(83380400001)(36860700001)(47076005)(82740400003)(186003)(16526019)(40460700003)(356005)(81166007)(70206006)(86362001)(70586007)(478600001)(8676002)(8936002)(54906003)(450100002)(44832011)(110136005)(5660300002)(7696005)(2906002)(41300700001)(82310400005)(4326008)(6666004)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 01:53:24.1921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e59bc703-2f50-43d6-801b-08db45f90564
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6782
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Felix.Kuehling@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the helper function in TTM to get TTM mem limit and
set GTT size to be equal to TTL mem limit.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ce34b73d05bc..ac220c779fc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1807,26 +1807,13 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	DRM_INFO("amdgpu: %uM of VRAM memory ready\n",
 		 (unsigned) (adev->gmc.real_vram_size / (1024 * 1024)));
 
-	/* Compute GTT size, either based on 1/2 the size of RAM size
-	 * or whatever the user passed on module init */
-	if (amdgpu_gtt_size == -1) {
-		struct sysinfo si;
-
-		si_meminfo(&si);
-		/* Certain GL unit tests for large textures can cause problems
-		 * with the OOM killer since there is no way to link this memory
-		 * to a process.  This was originally mitigated (but not necessarily
-		 * eliminated) by limiting the GTT size.  The problem is this limit
-		 * is often too low for many modern games so just make the limit 1/2
-		 * of system memory which aligns with TTM. The OOM accounting needs
-		 * to be addressed, but we shouldn't prevent common 3D applications
-		 * from being usable just to potentially mitigate that corner case.
-		 */
-		gtt_size = max((AMDGPU_DEFAULT_GTT_SIZE_MB << 20),
-			       (u64)si.totalram * si.mem_unit / 2);
-	} else {
+	/* Compute GTT size, either based on TTM limit
+	 * or whatever the user passed on module init.
+	 */
+	if (amdgpu_gtt_size == -1)
+		gtt_size = ttm_tt_pages_limit() << PAGE_SHIFT;
+	else
 		gtt_size = (uint64_t)amdgpu_gtt_size << 20;
-	}
 
 	/* Initialize GTT memory pool */
 	r = amdgpu_gtt_mgr_init(adev, gtt_size);
-- 
2.35.1

