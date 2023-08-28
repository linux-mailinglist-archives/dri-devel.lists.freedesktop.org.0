Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132EF78B032
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 14:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548F010E2C0;
	Mon, 28 Aug 2023 12:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB7E10E2BE;
 Mon, 28 Aug 2023 12:29:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFbhP5OPxoX91uZHM836XfO/jUenfmw3UmhBgZKK8vLyPEaknUZpZYNGzlel86b75WaaAOMFHyZaBVzqgcy3pwaTHtyL8v1ubPNogCOJlUncAx20lZhaZk3FFp2zHiD0zQ7+05EPqhs5NFIN/OWp/eWUuNREaG9bkVyG6SjrP7HvfPQP+wZonhWjqUMFyp5mRxup6kNXQh3ALR2IL7E4f5yMpNoZY7TVzYjHEGOdYgoiqJXB3HQ2COYRxZ0LG+YOo3xl9QKVVY20gijPb5gGgfvQDMKK/1ENF1NxAuNhdZm+t4s81c4pGQcIRDOXhhK1cJp5l2fUJY7Fys8NQwkw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkSKUNjqDW26Hepk4YY6zSRJgnZ3HgeTLYchrziiLeM=;
 b=DNvtVE7lUDp0bZSfguHcnrlP/Y7Ry4CRZ1TENuVM2l4m+uUcAmwv5P/9yi27ucrK4GNDRBEx5no8MBslIEYAVAG6R2uSAIINSjLOQBHC7AS5JP6/e5P0Q1Mn7hLJjmsp9tolPmRv9LQ2uhFdBs91zmzzoNwysjZcRbLl1PinhWV2uJrNkLvATvNyfzQ9rEEYzfi2QnuC/tA7QMzwexIC1ZM88lFuoJLryThcdriwM0pYk9ZaqdThFXgNSm++7aWP9nsnWkxyI+MGwbYkHKdYTd8jROg0+SarlYaimjhSYHLEZEZXcE+PdfbaN6GMeIb5L+RpqPZ8G0s3HYNZ2oly8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkSKUNjqDW26Hepk4YY6zSRJgnZ3HgeTLYchrziiLeM=;
 b=14IGJgjNvLst+tlq94Ly8H8ncVUGzlBAQ4yGGNlHwMGXsCp+OTWENhwZkmh00avMoJQlfQt8d3JEOYOctTgXSa8+MvHfKCH6Mfl3OL4aHRY/016mlkgbrxzWxrHhi4U+0EPzxlTWexbftSqcZVilFLfUWkjXNQ1ZedUxo1rmXlI=
Received: from DM6PR21CA0024.namprd21.prod.outlook.com (2603:10b6:5:174::34)
 by PH8PR12MB6985.namprd12.prod.outlook.com (2603:10b6:510:1bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 12:29:26 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::b) by DM6PR21CA0024.outlook.office365.com
 (2603:10b6:5:174::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.6 via Frontend
 Transport; Mon, 28 Aug 2023 12:29:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 12:29:26 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 07:29:21 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 6/7] drm/amdgpu: switch workload context to/from compute
Date: Mon, 28 Aug 2023 17:56:13 +0530
Message-ID: <20230828122614.3815122-7-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
References: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|PH8PR12MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: e04eb7d5-42f5-4b6c-4163-08dba7c26af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7aBjm6yQ3NEGhmxYul45gvHz3qWviTYgPIZjszXu0RVHD/fubHwMkILafzrZu1BDmptF1VSvLkivVfDhUXer8uEL0KpCaCDTOg4dPksJrP6H9JV6srRpGrw+sEoZnTimNIrQ84Nd7Rjb210Ty6vUrHTn2XOAAFREr8yowSHp8Tyw9TWRkccVHNdVGihfslYgBvmAKr0nL23a1ZGyN2FcR16iBKlVjhhAak7QWsJFVSjcHSAW5cFz5V2DXZPHT4uA7ks2lJNfKqd44SFDVsOwddKI+M6Ngd1xPvTgkN738EWf4bhAK6JGmtu+UmMZBqJg5FBgClha7wKGbEScNdl0KTyLTQ02tZ2h589WBY6MUlOjN3b9le3+vn6LeQysm+3yH/LtWIOzYNgpss70Mn4uJd7zCEX0f51LMu2ysPBpmNJk55uCMLdHDBWzA/9EwYYdZRoE2vAAZse8verPAFDkzzrF2UtXyZucUvW+9N+MAUcHzOaAjg5H2U7lu6YABGcHBy3KswJlE3rJ/8RdpG6uiGOz8ERkerxtHHnAOLPEByI0QEqHDs6nyyDy8ZwZC1UJ8EMd3JQex3bharUUYcECZmHvLCOGetdc7ReZitX684y/9pqmrHn7246xHVR4Mh6Q2QtSbVIJALhAeRFRGAPIjsjt22k5MIC4ymq7W8PRhdUTG7uxObilKHj/F0bTuyK+GhBEy6RcgV1GxbeaT5YiKlh+M6J+SNhIJALbU2zpqpJ00sRBDuNfL9axnm8DlSw0Jf3W2O5W6Wl6rH+peiqmYg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(36840700001)(46966006)(8676002)(8936002)(4326008)(2906002)(36756003)(110136005)(54906003)(316002)(70206006)(70586007)(5660300002)(336012)(40460700003)(41300700001)(36860700001)(7696005)(2616005)(1076003)(26005)(16526019)(426003)(40480700001)(82740400003)(81166007)(356005)(478600001)(83380400001)(86362001)(6666004)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 12:29:26.1587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e04eb7d5-42f5-4b6c-4163-08dba7c26af0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6985
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch switches the GPU workload mode to/from
compute mode, while submitting compute workload.

v3:
- Addressed the review comment about changing the
  function name from *_set() to *_get().

Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 0385f7f69278..fa939ac17120 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -713,9 +713,11 @@ void amdgpu_amdkfd_set_compute_idle(struct amdgpu_device *adev, bool idle)
 		pr_debug("GFXOFF is %s\n", idle ? "enabled" : "disabled");
 		amdgpu_gfx_off_ctrl(adev, idle);
 	}
-	amdgpu_dpm_switch_power_profile(adev,
-					PP_SMC_POWER_PROFILE_COMPUTE,
-					!idle);
+
+	if (idle)
+		amdgpu_workload_profile_put(adev, AMDGPU_RING_TYPE_COMPUTE);
+	else
+		amdgpu_workload_profile_get(adev, AMDGPU_RING_TYPE_COMPUTE);
 }
 
 bool amdgpu_amdkfd_is_kfd_vmid(struct amdgpu_device *adev, u32 vmid)
-- 
2.34.1

