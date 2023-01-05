Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B18565E401
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F7110E683;
	Thu,  5 Jan 2023 03:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F5410E67A;
 Thu,  5 Jan 2023 03:44:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q83y8Bdxpma860iH00pzngQXEsTyF3MMwuOybv4s5V3teQWIWEynUQ7s2ArRuKrVh6Inr3qn23JGOL5ksKRnN5recd5o65hytDNEjRLC2ukwYSYTny01zX21U42KcPG1lJXUmkHtkFNCGp/w2WkCmauJ22tnMcXwLiemB5LnI/Dvk8sf3O1osUlU19wdI9032Ql4RmZm+CdsMNk6AlG4PsyrJZEeDAmDpT+Jb0CthWPKJIRQ+DuJA97FlN+/FhsZeR9bwIu9Aom0WHfDAhvzjIM1VLAWMuIliDuTZPVIiTou1UMA5F5esqo/aB8QwvHMjCRTb0LgLD7k1OGxSOZ4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJDeCF431PP5SAwsLVRWlYzPsJx/b88GWKPL7VVLhPM=;
 b=BBaBPDi5S7QK/xuFuajDO5ljiSf7zRlbs4lEePe672MfRsXHy/YojDS6aRXnYYElUCmspETw8wCuEKlLAvQL3Bp+advaIWD7dZIsFIKBZvrh8AXo1rgVUcHlsUgNHg3kG1xIJugUJaCD/gJdhxhdmjbTchAun9C6dQfqLv9C6DjE+aIFHGP60Z55fDT5RteQi/ctXUyklOuumVNdq2TXnddA416lZlOtBC02PbTJABP7orUnYaBJqM+8BP6DNhPRfEbM7KxSprhUYtTtqB5e+eSPNw4WLKUIYDG0ICKvmMqMM04YHQ3WkYer9RpDtWp9tj+z2TjvtG3XkgfIrqQOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJDeCF431PP5SAwsLVRWlYzPsJx/b88GWKPL7VVLhPM=;
 b=R9OlfccMIVNWKiwSPxLtTlPNaRC/GhLK7H/Z4ShwkUM9n1sKBfzQIUEoDVstb2t3kVat7r5egODOm5D+Anj6xj0Q788EsHt3Ur+I2R3ij50uXueZcZ/US0xEzYiaRflKOm8gNmfQFlKCKd+GsAApliQehgF3bN2j12yLzfn8DDk=
Received: from BN9PR03CA0528.namprd03.prod.outlook.com (2603:10b6:408:131::23)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:58 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::c1) by BN9PR03CA0528.outlook.office365.com
 (2603:10b6:408:131::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 03:44:57 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:56 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 35/45] drm/amd: Use `amdgpu_ucode_*` helpers for SDMA2.4
Date: Wed, 4 Jan 2023 21:43:09 -0600
Message-ID: <20230105034327.1439-36-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: de8c4f7d-b465-46be-1776-08daeecf3750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8nMdxbtLysHwdiBJDYrrc0jgdz7uWenUtY8TrTVvTCbOf4Xr0tLbxwbj7nAjr9Zm25hyhAIrSMYxNbFQ41wXBi2hsv2jIAYitPoMhAuNWBja6gDVasuob1qQW6wt2WkkIMR7slK2MwlHjhmdKm585JzTQfnQd2dkbtHAJ0/khYHO6rMsJOrx8e7ay96txgsxcpHY+q1mKOdYJvmAUnsOYqz5yaiIKKd0YKgVadteOYmzi9Wm2pNqCcgOzIg3BOi9GeMUEYOOyr/Uuh6obFQiSFm/a1e3DAaNytK5dQkCsR83YRo9PRJe1Yw1Xdqc3kdQ5zz6fzg4sk0IgDHoffbwjb7L43P+Dgp2CokB73rZwqmMydC1fPwdFBI4juaANJBX3H/JW0pvq+dhDY8StNxwrcp/q9Qu5Bvs9J7Ka+L94G5AO8HL9NjOLqdov4BN6lKaqLFIcxicBO0uqICxdlWtI6kCvK0ID8Dyod5JGv2zxz/wwa6O5ngiERMP6q75h9IaVZYhGMR3Vl8aXbr9cPryC7EFixNz8qz4ThJk6MVkBoMs/il6WJF8g8utM+bq4r0I55PBcHXZMrEOWFJTJdIbDjC8SVI8jgy8qzEp4a5HRyEzsdd9q6v87Pi65W2TbxdbyX1wypNrjB7za2yc0FHvO6LriDg6IhbMrkAhqpvpLWBGLHu+BQWBG/A1qEmRkDRE0Xh6KVPzK28VFE0/aWrryJDX2HLSr6O8GkjqFmZiWwvj3xAqqrQwhbYPDqQ0dvT
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(8676002)(36756003)(44832011)(81166007)(5660300002)(82740400003)(8936002)(47076005)(2906002)(41300700001)(426003)(356005)(36860700001)(86362001)(83380400001)(54906003)(70206006)(110136005)(70586007)(26005)(336012)(478600001)(40480700001)(7696005)(6666004)(40460700003)(4326008)(82310400005)(16526019)(186003)(2616005)(1076003)(316002)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:57.9514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de8c4f7d-b465-46be-1776-08daeecf3750
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index c52d246a1d96..fd2a7b66ac56 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -113,10 +113,9 @@ static void sdma_v2_4_init_golden_registers(struct amdgpu_device *adev)
 static void sdma_v2_4_free_microcode(struct amdgpu_device *adev)
 {
 	int i;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		release_firmware(adev->sdma.instance[i].fw);
-		adev->sdma.instance[i].fw = NULL;
-	}
+
+	for (i = 0; i < adev->sdma.num_instances; i++)
+		amdgpu_ucode_release(&adev->sdma.instance[i].fw);
 }
 
 /**
@@ -151,10 +150,7 @@ static int sdma_v2_4_init_microcode(struct amdgpu_device *adev)
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
 		else
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma1.bin", chip_name);
-		err = request_firmware(&adev->sdma.instance[i].fw, fw_name, adev->dev);
-		if (err)
-			goto out;
-		err = amdgpu_ucode_validate(adev->sdma.instance[i].fw);
+		err = amdgpu_ucode_request(adev, &adev->sdma.instance[i].fw, fw_name);
 		if (err)
 			goto out;
 		hdr = (const struct sdma_firmware_header_v1_0 *)adev->sdma.instance[i].fw->data;
@@ -176,10 +172,8 @@ static int sdma_v2_4_init_microcode(struct amdgpu_device *adev)
 out:
 	if (err) {
 		pr_err("sdma_v2_4: Failed to load firmware \"%s\"\n", fw_name);
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			release_firmware(adev->sdma.instance[i].fw);
-			adev->sdma.instance[i].fw = NULL;
-		}
+		for (i = 0; i < adev->sdma.num_instances; i++)
+			amdgpu_ucode_release(&adev->sdma.instance[i].fw);
 	}
 	return err;
 }
-- 
2.34.1

