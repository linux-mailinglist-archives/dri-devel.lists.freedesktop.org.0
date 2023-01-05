Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842665F1F7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F81310E7B4;
	Thu,  5 Jan 2023 17:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE5710E79F;
 Thu,  5 Jan 2023 17:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bomQ5wQ3Tz2B2ESjskUyyHHM7VDe2P6YQaTtYrA/fphheozcrfq39x28AyFuuXW4QewHUJOWgwiN+I+Pmbb71hOzG6LKc5FmOmzrO821g6G+msitj7GVZvUx5iGmlRFQaFh3SMyEhVL2QG1HNfHGJmU/Nm42GBEeG4i2hCxVnKPcUOS6RgLVqqhpLkEuJhAML+CZ4RP9MwMUQtnmGaE+s9VYFFnVt2JB+ihbGgT4uNPh8Rhu0820ZeRgHEc9CJUnvZwQw6AybTPpAhGagcgDtp7RXHgu1DQnPqEoArTlbtzu6ojO5Cq2xxVzImQ3YvqtYQ64b4WgGRK9MYv8pD5iIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMi1raoWYJ7gp64dPGMxAPtICHOvQ9ICV8XSZP+zGVA=;
 b=WAi6LN0/rY1Ircup+jo6ST7hqaf2Pj7uNIwAI4e9jaJIqh5kC4u0DhJuOh0SI+XQLkCHuWnJhAKzfGZP2X8mYrtoLX1Jfp5f82y9f3ey/pgLkkjj6n1ePq5YhfvRPSufUtUlI7ngkrD9/Go6dPxf+iXAs+rW0qY75jHtbPq7k/nlZ9DeOHWB9EwH9o9bf0czuYP5IUnoH+ehC5skJZgsttSORSYIDfM16oXsswHVIkx92bmUDiAjEVTgkh1RoAQGBneq5f2SVmvoEM/+yDgPWpYYP9qOuRnxgkDSShvI+UPpWueh57eldWtbDokdPRIgqEX94UcfjRJKl5z0IJEZEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMi1raoWYJ7gp64dPGMxAPtICHOvQ9ICV8XSZP+zGVA=;
 b=eJY+Oe1j30PmnOoyH59pzRqgiXl6UATkeJoRIjrPmmsoMu3Co2+MKiFhJXggJTTz3vEkqjCBu71hFYpCbszE3lA8g9plB1mL8MgDz4DJoX1k+OVAVDtR8Cx9KTC7mn2jHzQZKJm3mNXc5uoFqIyRtq5d7UKqYkPPOVRXyW/cKvI=
Received: from BN0PR04CA0009.namprd04.prod.outlook.com (2603:10b6:408:ee::14)
 by BY5PR12MB4052.namprd12.prod.outlook.com (2603:10b6:a03:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:49 +0000
Received: from BN8NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::a0) by BN0PR04CA0009.outlook.office365.com
 (2603:10b6:408:ee::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT099.mail.protection.outlook.com (10.13.177.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:48 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:47 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 39/45] drm/amd: Use `amdgpu_ucode_*` helpers for VCE
Date: Thu, 5 Jan 2023 11:01:25 -0600
Message-ID: <20230105170138.717-40-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105170138.717-1-mario.limonciello@amd.com>
References: <20230105170138.717-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT099:EE_|BY5PR12MB4052:EE_
X-MS-Office365-Filtering-Correlation-Id: 7831ea59-729a-4e66-71db-08daef3eac8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8p3ZbJUQu0gAZ36lQCwbzQ7kFw5P5ciU6NFdveBIVmaYchl7/ewX3jbnZ4EyVwxYKClJFMoSQ7F1lv8xQN63VYmWrsVXTXlur3Bj7Yy+bmKMdlzZHIxqp+QoCxPfpFmOnwdSYnn48mI9slL5arhIMEfdi+6ETuwKWGbmgjNMDguOMuTdAxG7Tbtc8EDYCf5flNKNrhZ9dM4UCgVdKy7EqpMN1+0GJuHNIGv0uLBfXghDbLzjaHynnTaaDVfxpBMCZpASvUd26FqBMmvalPen4Gi9Wfhi4hyn1TFDpnkjilMaYCdW39lr3/OZbro0ZUBbsNShZZqQ7PhKuxjjxQcHftp6Ugik3YoLbfUGNBqhj6joFIs4PmOMRRM9xCOdYEsmZWvf986Yo3FYBl0ij8zzxJkzq0UrfVF77wPD2hZIvjA2n5hg4R6lraenDQZiEHKkaTLAeOuaDoyimdHkwKU75sHbuwQ0DhFeih8aaBjOJ27myjhFnR7V5tuHvm2Sgy+GOk1QEAHTrTAs/YMAMW76cLeaSTwHCtiNI8VqBPXHdmc8YxRbRAjikJq0C7cSfi9MxTL8GC86z4VE/ihO6SrhYO/kgkWUokd9D0/UfcNZ3t/fFZg+xj7ZpizH9Xlz1imubAMzj7+p/o7Mqy4rCw+m8Bkv9jXF6XRssGAucwAWVdTz0op4Vat9VBjP0f9NHGaXBrzvEYX9R/I3E2GU5zrZi9abt73W42uVqGBLdZ5YFa9uVnhozxkoqSr/He/26D7/XreF4smMrfcIJCgXaQafJA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(2906002)(5660300002)(44832011)(8936002)(41300700001)(478600001)(316002)(4326008)(8676002)(54906003)(70206006)(110136005)(70586007)(6666004)(26005)(16526019)(40480700001)(336012)(82310400005)(83380400001)(426003)(47076005)(1076003)(7696005)(2616005)(82740400003)(81166007)(356005)(186003)(40460700003)(86362001)(36860700001)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:48.7708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7831ea59-729a-4e66-71db-08daef3eac8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4052
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
 Carlos Soriano Sanchez <csoriano@redhat.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 02cb3a12dd76..ea78b7513182 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -158,19 +158,11 @@ int amdgpu_vce_sw_init(struct amdgpu_device *adev, unsigned long size)
 		return -EINVAL;
 	}
 
-	r = request_firmware(&adev->vce.fw, fw_name, adev->dev);
-	if (r) {
-		dev_err(adev->dev, "amdgpu_vce: Can't load firmware \"%s\"\n",
-			fw_name);
-		return r;
-	}
-
-	r = amdgpu_ucode_validate(adev->vce.fw);
+	r = amdgpu_ucode_request(adev, &adev->vce.fw, fw_name);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_vce: Can't validate firmware \"%s\"\n",
 			fw_name);
-		release_firmware(adev->vce.fw);
-		adev->vce.fw = NULL;
+		amdgpu_ucode_release(&adev->vce.fw);
 		return r;
 	}
 
@@ -226,7 +218,7 @@ int amdgpu_vce_sw_fini(struct amdgpu_device *adev)
 	for (i = 0; i < adev->vce.num_rings; i++)
 		amdgpu_ring_fini(&adev->vce.ring[i]);
 
-	release_firmware(adev->vce.fw);
+	amdgpu_ucode_release(&adev->vce.fw);
 	mutex_destroy(&adev->vce.idle_mutex);
 
 	return 0;
-- 
2.34.1

