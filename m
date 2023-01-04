Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625265DA7D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0859710E5A9;
	Wed,  4 Jan 2023 16:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88ED10E595;
 Wed,  4 Jan 2023 16:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAzwkHbA9KsGY5yhPPMIG9iZ6DZjqZEupPmPJoMfcBKYwk1CdKvnd6Ru3Hnpgt4ilC7lGh/3Gc5Vi5e/wCeNqbseTToI7tzeYceDkRoP3rON7tVwGbFPsZIUCXZMRHqRoIhyIVmrbxJ4SKiGtLfTMyz0bc0Ya3G0GbtbwgGop9c3lXAbzSYkZU1J9OuZoehLMm6Krdh+bJ0M0jAW2+xmHzNy7u1xvRGpLOAu2hLu7vYzYfIydDgMXH/pr0NOV9N/P11tFhZjXohV6h8a626Vnn7SxMhjmZjX1srJ8Qgf7EvzAxaBnt+kvykm2fGGGJoldrnxdXq6OAh3fdQ1M2+fyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSYH0+mZnX6kj7QMvkTZsqwvN+7CMKoKWHGZjMyeZkQ=;
 b=jOD51Hqedn7Wyqt5znUkhxhbhSukgeLz1I/18tAjmEpd8s4gvxPkHWtvJvj2xmIVXMy7kU1rlJmZLh18lcTA6ZNh4ci0zh4XvQI8OOxwXvu6OuCxlueDBeomdEcUbXfyfPmhgtd2KMZAD1PnzuzIo+zEJKsSamcE1OqTEcCaE5wXlENgX+p6BiJoXkSVELuB+OGvEKOapVADUzaXMqTYNpdsw/9uZd7oar3vJrHYOLXGkggcevYtofMpE2FD0gunXQ7tFY0rNmEBgn/Ltq8Tnk+muwFlg7amVzBwG1mhorR4mOs942XO1m9Mpg/KGdxS22MT1VlINgaYMDu46O4ttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSYH0+mZnX6kj7QMvkTZsqwvN+7CMKoKWHGZjMyeZkQ=;
 b=3XENkLCaqJcSvpJNGnLHJT6FbrvUdd6W8tsoIWPfC//H08mdRxiA8T7PZvCaLFbfVKZu1Zyr1uRn1cILfVZx4h8k/Mc3Gpidw58hyrN1ADa8je+KqQgjvq8g4jNmoc89cY1rtxy3En8pjOSkBi5X/Am4smeGmGjHes4uKe5FB68=
Received: from BN8PR15CA0020.namprd15.prod.outlook.com (2603:10b6:408:c0::33)
 by BL1PR12MB5222.namprd12.prod.outlook.com (2603:10b6:208:31e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:33 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:408:c0:cafe::f5) by BN8PR15CA0020.outlook.office365.com
 (2603:10b6:408:c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.20 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:33 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:32 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 38/45] drm/amd: Use `amdgpu_ucode_*` helpers for UVD
Date: Wed, 4 Jan 2023 10:40:27 -0600
Message-ID: <20230104164042.30271-39-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|BL1PR12MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: b25ac736-1d6d-461f-e643-08daee72f52d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOcdcoV+H7vrC0BN0yg68fQS+rdsk054nwG6xlG+akkUetZ9BNFJPlcY/4KGy5nINPX9CVkJyW+u5v3Pp1D8sleqtXLqnhNJs2zfgurkL83ScYLYH7NjGlZQjhajd4RVlKXWkh8fjQDT89olt/rf7LZt25exeASo2i4MZnlZnlI0PC/PZF8jYPVSQWxZir1NvCfiL/T53DjNk65n/W9UHfXjQRCiqgVgeivTrWEwXJh4PesvF6D+1Bn/VKOsO7EoSihWGbznCgvgZm7Xk46NJm/JSyHCdPdyAOAhj1G1vE47xlarl5uu5w48V46gdX9MiCJYa/pSFTAHlZPFnAmdC1vRWVo3cX+dZ5c/ysx5cP0zdEEyF6ySvG69H5DSZVq3DJ3koDIPtfEeq08bL0oImjAB3Ijx9LxKM9wZvhDQ8RmdoHyEa07doVBRml+mcyCCVkuU2Sv1UvnaLal5GnK2SW6AdYOSEh2c5pWDubyJE3JsJ1vA0wuA5aQuBq9VvnLDy6iT/S7gsLY57e1INSBqTxQM/XRFti2lSKqx2Nm5DD51F2CZJ/1+F3eq8L4akhZ7nM24tc7OYLwnmxCbM77bnphkvM7rCHXS38gGkKkzhr8l0NZBkqKhBsu3NivBohLjfogXcWPpbmAW+mKMlblppyG1UYO4FJYgfKa0I4CsPTZfT2VJesjGSO+lizfUGvE2xrLIk2iGLIJoeMGRGu/pm1kW7Avek9Aast2Shqt483lSokZFvwMAvV3yS2pwGiobBg+23E3A3AtEtR1yAp6Ypg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(426003)(47076005)(1076003)(16526019)(26005)(6666004)(336012)(82310400005)(7696005)(40480700001)(86362001)(40460700003)(36860700001)(36756003)(81166007)(82740400003)(356005)(2616005)(186003)(316002)(4326008)(478600001)(41300700001)(8676002)(2906002)(5660300002)(8936002)(44832011)(70586007)(54906003)(70206006)(110136005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:33.2986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b25ac736-1d6d-461f-e643-08daee72f52d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5222
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 6eac649499d3..ce19e73b75bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -260,19 +260,11 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	r = request_firmware(&adev->uvd.fw, fw_name, adev->dev);
-	if (r) {
-		dev_err(adev->dev, "amdgpu_uvd: Can't load firmware \"%s\"\n",
-			fw_name);
-		return r;
-	}
-
-	r = amdgpu_ucode_validate(adev->uvd.fw);
+	r = amdgpu_ucode_request(adev, &adev->uvd.fw, fw_name);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_uvd: Can't validate firmware \"%s\"\n",
 			fw_name);
-		release_firmware(adev->uvd.fw);
-		adev->uvd.fw = NULL;
+		amdgpu_ucode_release(adev->uvd.fw);
 		return r;
 	}
 
@@ -394,7 +386,7 @@ int amdgpu_uvd_sw_fini(struct amdgpu_device *adev)
 			amdgpu_ring_fini(&adev->uvd.inst[j].ring_enc[i]);
 	}
 	amdgpu_bo_free_kernel(&adev->uvd.ib_bo, NULL, &addr);
-	release_firmware(adev->uvd.fw);
+	amdgpu_ucode_release(adev->uvd.fw);
 
 	return 0;
 }
-- 
2.34.1

