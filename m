Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6C165F1FA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4C810E7BB;
	Thu,  5 Jan 2023 17:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0762B10E797;
 Thu,  5 Jan 2023 17:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGNw3PblgmtNHxoXYwmVKI1t9Zp265Q+wGcVL41CgBdT1E72pEFOWO5MEXiMmWqAAlUFOcqQcPmPfFLWrk3dzkqM+4PNx7fZ+7WaQpGSeCZM0RNshD9hkopzDNjmStneTdPb68bBSimaTZrT/S3JElGXRwHc/CVhHSLSSIhtC083x/BL7k1W31kn57dgaY7pKUUKHCk0Nf94mPMQS3X6Sq3kjV2A8SkfDX+sQ5SNKWTIrGgVF0Ee360zGlHAov5Ftb7Nv3/Ri5Hd+zLge4+pk9ierDcySV6QPndc+CySG3DqeLTvBcp/L0ihdTVZxJQ5PCHBFXGy//tFzKRElEzivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/sbh1dcwbcGZt7V+PxLn2SG8QtiJbvLnK/Rst4IEtA=;
 b=dolmFc/JzKzVe7hFVaA6sdEMa8ua2EOa0lJBAuuGDXcUSdwcD9AdblpAyDZ4RzAqHjlhjPjvSGqlIyDVy/HA16diYWz925lIu9czqMUOfbzJPVXRm2vr0HR3gXlwVLCSE52zqB7f8JBBZB7Q0l9psoIj4+GZuv/G4OOhg1ZnTx6Wf3D9XcC9XEYNHk4v+XHTmuW+1EjEHPDFmGpxWPQOZ2cn9SexT6wu+XaZOxio+XTZLf4c5HbBHDApS6HrJSWPANrlRZon6sJA+zu3g94/fajZC0ZEzHij3MFfehwoJc5HdGfrA7aS5cuYf4635GmlXCQXJo88kOJqTOOFdv4Oug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/sbh1dcwbcGZt7V+PxLn2SG8QtiJbvLnK/Rst4IEtA=;
 b=GZ1HUvGju9cGh54otSsdq2OhVO4A9qaknqSyRMhveyiNKH3wCWtLC2HD0FKZPOypc0ZdOQZFB1w+4JjmULWOLCdlZJGwcgmdUTzusT/pKO021Eg13I/bycLhuOUE9qFehV/jiTdnEFT/p1BxZxQr1CQCrriJnI43VkQ/T2T9ulA=
Received: from BN0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:408:e6::27)
 by BL3PR12MB6377.namprd12.prod.outlook.com (2603:10b6:208:3b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 5 Jan
 2023 17:02:44 +0000
Received: from BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::11) by BN0PR03CA0022.outlook.office365.com
 (2603:10b6:408:e6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT079.mail.protection.outlook.com (10.13.177.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:44 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:42 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 35/45] drm/amd: Use `amdgpu_ucode_*` helpers for SDMA2.4
Date: Thu, 5 Jan 2023 11:01:21 -0600
Message-ID: <20230105170138.717-36-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT079:EE_|BL3PR12MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 49480174-b69f-47ad-9cfe-08daef3ea9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: isMCTh9YWrAoUrOs39pcc0tw/+XicTpvB/qmU4jQSvOBr4lge0U6Wdae1oUvU8vhkawjZrggr8LocMyZqFEpnY0plb5YyDnPPzaXW3VyOJt4JsFdb1OT6MTdU07y5jWTkW4K0CLeoeK8zQ7ncnPDN3GsZ8aGNvRLc4bsnD4y2XtLTeeq+Ytr/KCt7bHeto3rtJUQRFRB4Q1UQMqUDX9Bm72kEPDfkQOxu6Ks49ZBpxIpqndGvNOkx8en+NXNCPfTd3OHxKhI5wnYr7OTrUW8myBO94InMNSUQbdYR+P+qsTKtKa7ACbj/c/IsrgyRqczNgu5f5cDTskbI7tYv/SkHHr0h3HFvff8pBP850uwNzjNv7aPWXPpZAaQeYVwVEktkrnAkdp8Y6euKRQbV648w3epgVbCxY2NteRJ9nYsmNI7lapcvfxlVcsueOZLgeG2yNYyTkTdZh7pJrHY1rlkramnWIUoCiwikDrhnM4iodzyTyMNO+MUFhN5ay/vbIX+mEOvzjClaP7cohrz/adp4f5+3o8C2SHasHtYeeibAQchJ4HEnHMrNoTAwjTaF9xDViRBLMfd8+jqr7UiXhYUZ5kbVejw0mb6iWM2Mhus8NsOO4R4XxwJsdJv4RQOR/Vy1KVgyflqnQN+RstdqGRAnxOurHehQB0K0WzkPkwasFxX70PNnWPUiotXZOx9dshokYGACcqFuhOngtfCWM9yEj6rzop+jNwF8+zpSBUmTM859p49Sc667B4nNPoYfh8C
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(316002)(36756003)(356005)(40480700001)(186003)(6666004)(2616005)(26005)(40460700003)(86362001)(54906003)(44832011)(16526019)(5660300002)(70206006)(81166007)(8936002)(4326008)(70586007)(36860700001)(478600001)(2906002)(41300700001)(8676002)(83380400001)(7696005)(82740400003)(110136005)(426003)(1076003)(82310400005)(336012)(47076005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:44.0926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49480174-b69f-47ad-9cfe-08daef3ea9c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6377
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

