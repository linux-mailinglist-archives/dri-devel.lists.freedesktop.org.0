Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A436565DA7C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C02B10E59D;
	Wed,  4 Jan 2023 16:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955110E58D;
 Wed,  4 Jan 2023 16:44:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVG2e+DwdEN5jhUiIsxo4rRSpOf6oGW6vB9vfrPghz2BWyQ880r35WPtsgW8vBk7s6PLWceRWSvc9KDsbDJyCXoI9bEnbw9jea6iulqeedOIzW9Plt7ijNZAVYTPBiL9+rSp/6FATn7AkjQBdfXim5+cbqtwB712tqafP+dnCXy3S3y+RdCI7oqX7Y7IIB7P/RoVELPx6lebJtN4zX+/f0UEusxS1PTN2ZQ70la6YwDJZrTcs1Jm00qwVG1ZBuZ8Tts3MonSrWvRVY3Ooq1absjyMtn50kCsZZOPUnw4Xqn1yTyTU5ha5ZtMCHVlTrQR466j6SRLyc158/J6+ATnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KziW04yoVrSRS5oKftctrQIygUW7V8IlNqPG4dDhh2k=;
 b=RZNuLwOgIU8GoxFYCMLBl1V+6odoPn+C6xMAr6HN3YTbSsWhGXvUTiagcAViwJbb9RcCtrY0O6ZTc+fvZWSunuzJJkGRFdKibCupUNxxbmh29EZ3AfrvK6DZJnHC5blxYyCinkVyKxUDKz3cGCYXl5yA2Grdgsvkw3hY936AzvavrPfBuWvbNhKXECzL4GNHq3mvHFy0/HzYKVStXvYV5qW13L/tDXIPV742wlyBDp8ODh7MZl94ako/TTQsUJbBvDYDIq3kFJmAym09IeeQArxi2eptcmPnY+2sNdjkuInv8UrObM0XrhdIolQoCyMe4UjNg9cBSU8i8CiEil7Bzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KziW04yoVrSRS5oKftctrQIygUW7V8IlNqPG4dDhh2k=;
 b=vvgcsZy9ggTnsDxpvs0z01HidO9iYS3KtW+3ExHnGirStWjO/tQcG8NC1eAUFhMSsWaMsKZDEZyrHBkvBEZIVq/YFf1vfqnzZSXtThNODldxJJtqV2OGp0vYyxqua81Y8xziJtWwjCd8wlNOS/Pd1aIW7/QICZVSowm/BXyVguc=
Received: from BN8PR15CA0004.namprd15.prod.outlook.com (2603:10b6:408:c0::17)
 by MN0PR12MB6176.namprd12.prod.outlook.com (2603:10b6:208:3c3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:27 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:408:c0:cafe::4) by BN8PR15CA0004.outlook.office365.com
 (2603:10b6:408:c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.20 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:27 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:49 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 32/45] drm/amd: Use `amdgpu_ucode_*` helpers for GMC6
Date: Wed, 4 Jan 2023 10:40:21 -0600
Message-ID: <20230104164042.30271-33-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104164042.30271-1-mario.limonciello@amd.com>
References: <20230104164042.30271-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|MN0PR12MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d8d443-f510-4c33-e34d-08daee72f1e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0p7aD3JJyuKOnK8tk1hpuE9tCDWhn6OrQe6sWj0+FT5d0SN0PPCPBh2cqwkUYC8UvtdXjMpO1U6M1DgHh1OzroabYfyOo9zhu29CcdA7WKG7VvtPjKJnQpkOM10Exk9Sk/ENsQRWphbKfAsV+C8AQ/wEuGS9BCFokprcyFAAlXwr3khtW3l7Wzmir0NYHIRSqWDH7dosyi322Wgl03RW+CY9PfBqazdv9l1GEbycFqClGoSlP9VY1FGT+6Tc2rBX9ijTg06l0HkHs5pfcF5qfXLQu8HFbayYG4r2MGhDQxYPdOkGzlon/Cea6bh/YwyA1TxOnq+rr0jAkit7PNJx2UfR9kvTWSTevWgTy+8Vf1Et4r41N17r6dnFxjHnMsyb8NdKYgmlBhNIEYNY9OfkPkuuXwITbP8kDy1Wevt6f38YXhrY7FBNDaMEkGIrExMWh5kHmZNK++gNw8ax3cQZBQrWcZTBOW7dls9TFDo1cr2RW+T30n4lzqtukAOXowpY6UAeX7vk23GSm1rekRW7Y0zbxPPNT59bdfFLsr/iiqATzX/Qwe6RzmvLIwlvzv5QxanG8XMi+ng51gpCEQHAzPu6UYwJ1XP9skJ4waN8REd9KlsDrhPqZLgo0qOvXYDzz3a8yzWZTZwl0eKw3nsQER/xDniM8U/TTQ+98r2EPpgB0pNePhxZVBwNzozIie0gKIdaj5PcxzkbgBAm1jUOp37iCPRQP1MsJM/cgcWwMljOUG8bekNbDxVyJ9TEZrPD+RjNPUppdC/QTiyJPtjVDQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(426003)(47076005)(1076003)(16526019)(26005)(6666004)(336012)(82310400005)(7696005)(40480700001)(86362001)(40460700003)(36860700001)(36756003)(81166007)(82740400003)(356005)(2616005)(186003)(316002)(4326008)(478600001)(41300700001)(8676002)(2906002)(5660300002)(8936002)(44832011)(70586007)(54906003)(70206006)(110136005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:27.7204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d8d443-f510-4c33-e34d-08daee72f1e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6176
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index ec291d28edff..cc8f79a9d52a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -131,19 +131,12 @@ static int gmc_v6_0_init_microcode(struct amdgpu_device *adev)
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/si58_mc.bin");
 	else
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mc.bin", chip_name);
-	err = request_firmware(&adev->gmc.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
-	err = amdgpu_ucode_validate(adev->gmc.fw);
-
-out:
+	err = amdgpu_ucode_request(adev, &adev->gmc.fw, fw_name);
 	if (err) {
 		dev_err(adev->dev,
 		       "si_mc: Failed to load firmware \"%s\"\n",
 		       fw_name);
-		release_firmware(adev->gmc.fw);
-		adev->gmc.fw = NULL;
+		amdgpu_ucode_release(adev->gmc.fw);
 	}
 	return err;
 }
@@ -894,8 +887,7 @@ static int gmc_v6_0_sw_fini(void *handle)
 	amdgpu_vm_manager_fini(adev);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	release_firmware(adev->gmc.fw);
-	adev->gmc.fw = NULL;
+	amdgpu_ucode_release(adev->gmc.fw);
 
 	return 0;
 }
-- 
2.34.1

