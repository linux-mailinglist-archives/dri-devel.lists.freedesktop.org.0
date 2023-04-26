Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A178E6EF858
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 18:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350C610E0EE;
	Wed, 26 Apr 2023 16:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D0C10E09A;
 Wed, 26 Apr 2023 16:23:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeNW03HUIXKo4LfhUYVeSD0QvFMC156xa1syyDYEq3rJXPV0y81yxcYgf9yHKGEmfokDoItQBRhpfoO3j8klJ1/fQ0uh9dj4jzMkE9ZY3j2BO6H5qmb4iEFLTeztnBr5UniXWy1RG11scb/ux3mVWxDok/FUy0CoqRZRJHLqHn6Os60iKgoZrUjYI0x+qA9lIOLDVwfX2uzSx0kM6x9xELG8xYpyV3qiJ0ICoHQdI62WsceTtflWDXOw1gfKCXaJA/icltdeTFyn8eSoAxPFcidEzH4ucGbKIg4/rXSFP3AKX4TYs9aQj4TJ9acAuw0PayJQFIyZR0ypE64gUd0YVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6M+vBt7oqLNo9vi4JQ5LaJu0q6rub5dKQ1xr/j4U+s=;
 b=MzhfkNrW6NlvDwDf59IF9cCx2lyB+H1UnuIRs3x2Apo+2h9W67wf6JaGsrX+Lb/RNB6mKH7eRUS5Ko+nW0GilmlO1AD4Dl/mLBkJ10XkKK+aqkqVWH7sNg7naf6TTlkBxTzPSbgPZiNxeebx9gORRTk4+iRL63DOcDf3usxhGrPcQ3gtGLONigFNS5tmKesJY86i+kbxvLbE944G63Z/Pnqs1fSHxmhqhLpSoFEhM0qvJhukC7B5XkQa9cWmtWS342s/7S/ZNzW4ENZbnkFyem8QguOTQ5nQkpEG3OtktaJ1454ho6IhdM4t20AaQU/rD8B0JahsSTBbvNR/RHXR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6M+vBt7oqLNo9vi4JQ5LaJu0q6rub5dKQ1xr/j4U+s=;
 b=JyRVxkCoAqh55IudVC6qUHh5O9BKPlNdeorzQw64aN5j2hMsU0b91Gwe+T+azrwPWcnkT1WfnUp+SUnHxYoACsEuH3qLiTpKqQib7tdrw7SfbNEiZ0WKU28XB2GYnF6wnchNWzNK6rRlVGSWbh4qDa4XYihvM4CS0vYICDBcJV0=
Received: from DM6PR17CA0029.namprd17.prod.outlook.com (2603:10b6:5:1b3::42)
 by DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 16:23:01 +0000
Received: from DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::c8) by DM6PR17CA0029.outlook.office365.com
 (2603:10b6:5:1b3::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21 via Frontend
 Transport; Wed, 26 Apr 2023 16:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT107.mail.protection.outlook.com (10.13.172.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.22 via Frontend Transport; Wed, 26 Apr 2023 16:23:01 +0000
Received: from mukjoshi-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 26 Apr
 2023 11:23:00 -0500
From: Mukul Joshi <mukul.joshi@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv2 2/3] drm/amdgpu: Set GTT size equal to TTM mem limit
Date: Wed, 26 Apr 2023 12:22:48 -0400
Message-ID: <20230426162248.573495-1-mukul.joshi@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT107:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d8bc6e-7f33-4f9b-e880-08db46728158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gfMJTM5pZBCft0Yz30W59ygW0kbV5EYhqApJ4SjYEDxUwCPMXVUiVf9vzbqY020B8r3WQBi/lsA2pS+zMnU2HpK9bMTPzzSILkAuGEDGJyov+xD/I8xUrUlfzCu0EW7WX/m4qt8OP+A9KEdFN/i02XOpck1qiZkoXxUeX6Y9bkA8n1xMdqP8KATnYUABcbanV5mevyJZQayMLECrx0/LcJtPruS4emP+pX8e4zIUdmbz3o9Ga8TKDn2ZMovKHrrsOrOStt/qFj2mCB9xGnnMsHI0gefb0hMCgfz/dT2pCAAm6yVx3ZW+TxEPAl3xet8HOOHZXMrPSDkV5WZf03SvbJmv1JpeYgS58Tsv2vZ5X92xbj/bCDGiv5sAdg3hZvIBlMoO9rBP/eUM/zXjpI6pF/zuvsZA4WDvtIlPPh7/4C93h7chSwK4Z93RB/Iz1NypBftLgY71x4gBT9zZJIdDXtUVO4AKOo0uyTa4CSZbJmww/tO5vz2xyVv0Wd91LChc6WyMxPHrlH8bfTmNKfORpNvrP23YVxyYiN7ltrAI6bzONmobbA7tPNZvcEDIV0uPuPKSlOPcGqssUaHBp1ksOUwTxpPfw/sVRi8gbXfr0GQP3IsZX38OtHKN4IvzW65G1ZyBc2zMnPHIAopDCpkRF2uqEEdL5ZKE1yKuI+Cv8mv37ggsp4RfGCZB24S/wLKAx2TWKmb2qyyFzXfvqLh14BUPu/IpoXe1PCuavnBqCX8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(82740400003)(44832011)(316002)(4326008)(40460700003)(41300700001)(81166007)(5660300002)(356005)(8676002)(8936002)(82310400005)(36756003)(86362001)(2906002)(7696005)(40480700001)(6666004)(26005)(1076003)(2616005)(478600001)(36860700001)(83380400001)(66574015)(336012)(426003)(186003)(16526019)(47076005)(450100002)(110136005)(70206006)(54906003)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 16:23:01.2579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d8bc6e-7f33-4f9b-e880-08db46728158
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449
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
Reviewed-by: Christian König <christian.koenig@amd.com>
---
v1->v2:
- Remove AMDGPU_DEFAULT_GTT_SIZE_MB as well as it is
  unused.

 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 25 ++++++-------------------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d107d95e2e6f..5ded5a90dc68 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -245,7 +245,6 @@ extern int amdgpu_sg_display;
 
 #define AMDGPU_VM_MAX_NUM_CTX			4096
 #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
-#define AMDGPU_DEFAULT_GTT_SIZE_MB		3072ULL /* 3GB by default */
 #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS	        3000
 #define AMDGPU_MAX_USEC_TIMEOUT			100000	/* 100 ms */
 #define AMDGPU_FENCE_JIFFIES_TIMEOUT		(HZ / 2)
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

