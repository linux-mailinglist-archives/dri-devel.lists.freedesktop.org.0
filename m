Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA0565F1B0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAB510E769;
	Thu,  5 Jan 2023 17:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ED110E766;
 Thu,  5 Jan 2023 17:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNyIkU2j/WvnS5zcQlPAdWWFibF5yGGcouqultfAoYelAJ80d8PU0TOKeGi6kgZLDm0rB5f7nqRGcdfS2L88E86Kt3T4/C8EeUGQdSsxCc2wOeJOu7HIGv1lqKVZMzu+LJZd0mcvPfvpi1cv1L/YAjQ+F08D1MabMZxBpG6mpmgHecy5qqrF0pyBWStybFdyLwic8D8ZK61WYtcKZ+khAZ+la9EKOtKYbw2sLVQ2C8S7HUQir91qwcRnnvefQODEbIZiIZH3uuaBTx5x9lf+VRtrhyw8/biFzPjw4V0+YFUxVtch5txgnlwX7CrcXBgxIMG5IZv3c+hvTd2jSAhFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LxjqprPsdNO7TXS/dXkGsaSJsZ7Qug/Lv33+aLspIk=;
 b=ierZo2xT8MhDwfLxd7aJF/pVAJGinKt3PBMMhGqUQmtCZo1nNmbd7S6FrpxuZWfbpVpM4j0JYOBNdal+Z0CD/1mz+t9Xib2oPQTTOyuri+fHv1DBa16PRZr38rGTf1//MXlVyWILCOSJLzFIyE8oYOhpn4bbdfgLAIvcUx1ABsQGxj3up9paGGcTDS1afJ5jKQD1fGAZHfRjHOhziNc64eq27vMBf36V1gN5iOsE8dBUpBg29yqSXVkz/G6NhiYJbSRkfZ+W8s4F032RUFHmRVXu/USg31Ljzu3KVlmKBY5UyUVwDiVkYeZPEMXEm0CkzBJJHv5jM/p6mZak72Go8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LxjqprPsdNO7TXS/dXkGsaSJsZ7Qug/Lv33+aLspIk=;
 b=eqKjO7xuXIcZSa7SP1HQVv3ox5hJuxi53oG5gJ2psnGKzx8MJRcIoyBKoHFQkNI5uSYQNVYxg/b+IAhDUynDt72uVk7H6+icJjSUw5mJewngGq7QI+EwTCox9t7VJHHlYoZ+PhGpKs3dxgGt4RVZgRI3qrFSE8DsYQmpp2GnRsk=
Received: from BN0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:408:e4::21)
 by SN7PR12MB8001.namprd12.prod.outlook.com (2603:10b6:806:340::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:00 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::52) by BN0PR02CA0016.outlook.office365.com
 (2603:10b6:408:e4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 17:02:00 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:01:58 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 03/45] drm/amd: Convert SMUv11 microcode to use
 `amdgpu_ucode_ip_version_decode`
Date: Thu, 5 Jan 2023 11:00:49 -0600
Message-ID: <20230105170138.717-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105170138.717-1-mario.limonciello@amd.com>
References: <20230105170138.717-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|SN7PR12MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc78a42-9d45-4c36-bc7c-08daef3e8faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fAA/98XarapfeKon5ivPt7BXjtrSoDviQJHhPLTsQJ6se5dZI2ru6EKQE8SPntbUgy8qubVwuLqAoUGRM8j5NUQsAmVretUhmK79YTaLlZvo5Ezd8pSqJjBOxG2q+2/4CDdgP5ivWTcr63+1p0QN7CwqHg03kvJNOipgJgAg8/SA5we+HnABM+HsOYenu+y3mVmYjDQdejNWBcMKpDOBO3aqeGsgXMjU5uUojA31Eyv797t0EIAedlFgHsxnfdVYCWtjlDNdztGQIRR6vNjA18krQvIIGtgebir4iI7pAd78aXWv9Bzb481iE7hcKFuWaZDjKUyIXEuTgfzTdIeRqYs+m6R7fBZrQ/XMMvRLbvePwReiZnCHvxEhcNINJr9qXG9IayFsskJQPzyvG4fTg3SAE/CfSXb3NhydYC4F7lnxnRVTc/yxDwNWiZ6SQevf/vwQmcHRz7Myq4yk+9XUXDNWjxnU+vlQKlWh40vWVwXP679gWUZ7/+ey48O9qtDMul4wS/4hZwY5CncaS7k6/Gy3BqcRJvwrV8SFNfMCZo9wBidnHtp/nXlC/nFX3jj2EvbmZu+qt1R4rL6O3AzP334F9bLNpypzMmRD2pVnXY22bgHBQLCmBVDNkiITu22BfjvAbNW8zu1Scr8iOBSyW+zPcsmd1jWo12vFs9/zU72zcT4eUh0Uv5i75IJ1CdkYTDwFKoXjdNAEwjZeajd8VYVMgrQBaZY124SQA2cHk2ekCbkDRfCB3YoHYtybYvvZxLl4O+Laf8pUyr33zNpK3g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(66574015)(426003)(47076005)(82310400005)(336012)(16526019)(186003)(2616005)(1076003)(26005)(6666004)(7696005)(40480700001)(83380400001)(86362001)(40460700003)(36756003)(36860700001)(356005)(82740400003)(81166007)(41300700001)(2906002)(4326008)(8676002)(70586007)(5660300002)(44832011)(8936002)(110136005)(478600001)(70206006)(316002)(54906003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:00.3219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc78a42-9d45-4c36-bc7c-08daef3e8faa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8001
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Lijo
 Lazar <lijo.lazar@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, Evan Quan <evan.quan@amd.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the special casing from SMU v11 code. No intended functional
changes.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
---
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    | 35 ++-----------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index ad66d57aa102..d4756bd30830 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -93,7 +93,7 @@ static void smu_v11_0_poll_baco_exit(struct smu_context *smu)
 int smu_v11_0_init_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-	const char *chip_name;
+	char ucode_prefix[30];
 	char fw_name[SMU_FW_NAME_LEN];
 	int err = 0;
 	const struct smc_firmware_header_v1_0 *hdr;
@@ -105,38 +105,9 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
 	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7))))
 		return 0;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
-	case IP_VERSION(11, 0, 0):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(11, 0, 5):
-		chip_name = "navi14";
-		break;
-	case IP_VERSION(11, 0, 9):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(11, 0, 7):
-		chip_name = "sienna_cichlid";
-		break;
-	case IP_VERSION(11, 0, 11):
-		chip_name = "navy_flounder";
-		break;
-	case IP_VERSION(11, 0, 12):
-		chip_name = "dimgrey_cavefish";
-		break;
-	case IP_VERSION(11, 0, 13):
-		chip_name = "beige_goby";
-		break;
-	case IP_VERSION(11, 0, 2):
-		chip_name = "arcturus";
-		break;
-	default:
-		dev_err(adev->dev, "Unsupported IP version 0x%x\n",
-			adev->ip_versions[MP1_HWIP][0]);
-		return -EINVAL;
-	}
+	amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_smc.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
 	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
 	if (err)
-- 
2.34.1

