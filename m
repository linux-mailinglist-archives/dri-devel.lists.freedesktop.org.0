Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5397265E417
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2739D10E693;
	Thu,  5 Jan 2023 03:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556ED10E67E;
 Thu,  5 Jan 2023 03:45:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyWcmUklKtKpS8hfbz99QJC8adkeVHXKT5P7kzEXdkESEgMEiogWY1Kao9yH21H0n1qdiFg/iAx3eO2OlNQ9Ox4M5UD5rDwxGEF9XjLtWPClc5/gKpzTdQ1LCTZK/ecdJocgfodOTFqk4auN1qcSNzOBRWkWt+w1cL7P6rXDgJRQ6ox6x/Ff142/buW7CnCGIVCQR1csGbPk1CEhl+CvhwJNU/yowmQInhqy9RELfKswUnpH8Jxk5ovuJn0f9IcM8/pJsKGcVLFabzTKX45xdwm7xgWSf2lXzz2Q4nx7hGosLAXj1KJvKflW8XHFt8XN0D0yixu0TIOOdawDttHXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m2Tn2NktN0yDHYGRfgY9OijGnYjgUWmZTYpNEHqT30=;
 b=EOWrKycgv/XWjJQbAQbdfS7EbzzT1oojPA3vm4nkGWETORxwwrxSltqsSpu0Dx5Qvuo6UhkpK53oHr+2pRGi+rNwYfYUsxsjkgMLBVCpgBToWkr2vHM06V5vWrQQWZ1LyZdug6mETAW4R4JcytGOuC+vQSZMHjOU2y0dilVvmQnfh1JcLuuTwpPzig40NfOplvfatvH/OHbNUxpnvjcwIFWgglxAqrDnZSBsJfOS0yzHHfatzHUOEopncCegXD0lgxk8NuQhoznZs7+vazpOLadjEa2mDXoiwFxVaX6RgcKcVcbcBX+L0RSksQXIWax0Qm7DFyN8qUz564mXPromWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m2Tn2NktN0yDHYGRfgY9OijGnYjgUWmZTYpNEHqT30=;
 b=1Vjhtu34whfBYFML4YRb140PV8rjzjm7ELm9JkXOlL3gwDanEjoEQfy/23XdPOuzOOZn4/0hYbyo4/K/8PWbUq9TrkhjeevXyiOMqHPgUsC6iFYu+e00trxNg/3pKgLQrZ+oHwnJ+HfSeZxiqFwbJxN8OHAbYz0fiCj5QfUUcyI=
Received: from BN9PR03CA0568.namprd03.prod.outlook.com (2603:10b6:408:138::33)
 by CY5PR12MB6370.namprd12.prod.outlook.com (2603:10b6:930:20::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:45:10 +0000
Received: from BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::4) by BN9PR03CA0568.outlook.office365.com
 (2603:10b6:408:138::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 03:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT077.mail.protection.outlook.com (10.13.177.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:45:10 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:45:06 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 41/45] drm/amd: Use `amdgpu_ucode_*` helpers for GPU info
 bin
Date: Wed, 4 Jan 2023 21:43:15 -0600
Message-ID: <20230105034327.1439-42-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT077:EE_|CY5PR12MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: baf059bb-4bd8-4d68-7921-08daeecf3ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i8laQpw0xro2Y4Fg4Cz2paAcMPvhCXmGmu4lNN6rb8RF7As1SFUIVD1d5ef9UIEZatsisIP8n7lldqadMuCYUmpO3oOS63U4gyi95/zvprr4588rqKaFyXCi8zujtNFwsxy0jzzlEiRv4Buk98MBFcqabxJwLusjylusuPx4mZ71zK8KKvzMtle4P+OL+Gmifkm4L9OB1bd8cWdl2dWYAvrRYkVePjX3T9Il+LbenkJlak2XfYhERWqoioYSKifymxMdnALHQCliSNmuSb6w0CfCPKoE+FZrTbJHoU/hLe0nUfAUmRT289AGNGevLhKBeM5YqkxVAu+xvMgalvHvqUZBW9XNNxmImC2FmpbG7LSyX2k4Wkmg3kO8kvgM4+jBVIoWjf89nMUpNTeKbWrJT7140b4dU+sfKLE2c48gqhL+0cVvCO6oVxcAmUrn7CXIGeKglkhs1QcUFrYgX3TVdQ8pArlycOq49vW5Z91BeDKCadMYOcH8W8UBhKM3PEllvZ4JgPuUUycL+Mk/MlsMOpzODGOEcfFETQ+wl/KeWiaI8z93gW+DgCvSGggYZdoy5ajW5WBkc2pqvHTrlv9H23O5W80pnACr1JAeBZariRBldYU9hl0LtZx+RDHfgT2uyCTZhueb5bXEXt2+HZAmyeQ5J5lUkMS7xfHHWFfRvHUK0URdvC0uUN/aa0snuDkY+TiE0lySWk6h0z/nXJq3azsEHhLYgZPVNagI2c30smPD/BMAYlgik51ak1jZKY/BrP+NQJZSORTmAfoEQOQ1sw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(2906002)(316002)(186003)(70586007)(110136005)(70206006)(54906003)(44832011)(5660300002)(478600001)(26005)(6666004)(7696005)(41300700001)(16526019)(4326008)(336012)(86362001)(40480700001)(83380400001)(47076005)(36860700001)(426003)(2616005)(82740400003)(81166007)(1076003)(356005)(36756003)(8936002)(8676002)(40460700003)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:45:10.2616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baf059bb-4bd8-4d68-7921-08daeecf3ea6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6370
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cdb681398a99..406d53ac3096 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1983,17 +1983,10 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_gpu_info.bin", chip_name);
-	err = request_firmware(&adev->firmware.gpu_info_fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->firmware.gpu_info_fw, fw_name);
 	if (err) {
 		dev_err(adev->dev,
-			"Failed to load gpu_info firmware \"%s\"\n",
-			fw_name);
-		goto out;
-	}
-	err = amdgpu_ucode_validate(adev->firmware.gpu_info_fw);
-	if (err) {
-		dev_err(adev->dev,
-			"Failed to validate gpu_info firmware \"%s\"\n",
+			"Failed to get gpu_info firmware \"%s\"\n",
 			fw_name);
 		goto out;
 	}
@@ -4030,8 +4023,7 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 
 	amdgpu_fence_driver_sw_fini(adev);
 	amdgpu_device_ip_fini(adev);
-	release_firmware(adev->firmware.gpu_info_fw);
-	adev->firmware.gpu_info_fw = NULL;
+	amdgpu_ucode_release(&adev->firmware.gpu_info_fw);
 	adev->accel_working = false;
 	dma_fence_put(rcu_dereference_protected(adev->gang_submit, true));
 
-- 
2.34.1

