Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B4665DA79
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A370E10E59E;
	Wed,  4 Jan 2023 16:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A4B10E58C;
 Wed,  4 Jan 2023 16:44:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlSLfhKA4mDIu7s1ucjEQamH7ldRppjLowscETtf/x8Ml2SaOgJkx7Sehv/WTPJneYlOInjr7whr4FslWlJRD9Gds2a+7xdgIfhOHd4yPL7m+N3oN1rFE/fGpbc3Rh5RYOjX96i4Ral/WNt+YvItwuYFr951t6DsIlA1xe+WmC0P+ahWPyi55cH1cVehvmhLLWPTr7Tlb2AhgiUNGIF6pceXOO35Ks+PaZy5OkLhWWUHshkvLdthNc92PGMM0hhqfy2ow79hqOPZ5walnUngglQiElyif0v48qvB96fulFzdESyLIw1dNzKtiZFtH7qFFATDzdzT/gWaHOQIhPBvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsrW767LczqfNIt4VUnmmB/NRtKKiXdowhEelPGWIBY=;
 b=AN7MNL73MoK0/NGl7WMA91lUJm0QowEsQS3EogFk3BMJgYttthpXL+BMgmPNpTKP7fgK1QL4aGRUTRNljIYPn02c/IdxEJtu8eQrWShVl/Mb3kYnkFJfl+R2bScsaYZSEKYhLlZb8P4emdWXgzMNaxiQmQIJcOJBNbJZ6wUx3+3/8GF69/Lq2nEQl/yx7bXXp2ClVk/DNuXwNSWjoXtvNnoEOJAfr18PONLl9Esq31Z8anLFkSSLHVkGjdo0hMcTTLHvYSkHqB1Rn869bxYEy9uAqIgcPJGpIbz0Kg5rTppoyjC9PwIF/iU6OgGmONCvSdTfk8iu8AOdLYuZj70A/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsrW767LczqfNIt4VUnmmB/NRtKKiXdowhEelPGWIBY=;
 b=FJ6vzIlNHhrxMhvrOsZkIDYYG9EyeOAyaNoXUnLQWlxsYp5muQBqjwCBSHUYhpfEOgeeloTzpa+i2YnhIIff6GOFFqtgVevAxo2MpqN7AEKgYdhdvKDzHoKr8flWJHGTiRFsVTeYg0MvsDyZe2yTOCDoE4cX6oaE1m6dzC0jnz4=
Received: from BN8PR15CA0010.namprd15.prod.outlook.com (2603:10b6:408:c0::23)
 by CH0PR12MB8551.namprd12.prod.outlook.com (2603:10b6:610:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:27 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:408:c0:cafe::97) by BN8PR15CA0010.outlook.office365.com
 (2603:10b6:408:c0::23) with Microsoft SMTP Server (version=TLS1_2,
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
 2023 10:43:48 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 31/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX8
Date: Wed, 4 Jan 2023 10:40:20 -0600
Message-ID: <20230104164042.30271-32-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|CH0PR12MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: bbca1ab5-664d-4598-bed2-08daee72f19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lipZ9UoWjZxkjAU8BMbwZ2HXu26FZopnqRdiSMX9ARFX+KVwvzW+C+HrMZwYg1M7BmJB03xIf+2/lXbuUitB/Ka8th1WiakC+APz4JMm1lEfdJTZZguGv/6sSeXXTFLdQUh+H4wz1UZ2FcjqjkEaDgkp+/UuUQ4RslVvLHj0baLlWKEMJg7KKqT8y/VzXWWlOYAnPiLmn9uW+uvm5DXs53ecCmXy9EGYNzcTR+9F0R5nmD2l43qK6Q6Q1H5/JGuk/OPiH9NC8O96dR/0H+lJDn8daeUft8+S5fxgdugZ8+QCZRe1lNBO9mUzb+f9whYkK2JRhN9TYi3hQ9cQDq5mBzz+aLFuk8X1E1Kr2lUPRSKyZKDcLzIfvGidufOQKb4Dylr5rMtyFb9nh0xr0K8xaOuqPBcNVg2RYw/k2XX1+EXo2mS28H5hVh9F6c5KqUa88H5f02tE3Kc9T8tcI3H5vvMbW4T5Qvk+wysWegahPeabbVs45ZLApJqco1Bk4ogVyVFMj+SeJRS7q81w+SuRWx2op+mGcpBhGLgv7h9g9/gSliJsikg7rjTcwCtIDGwzRjsjm88QAnBCkhHFF1K8lQyrLDvarq6ioe9CDDvS/15/1AAN5oSaxmrcpcovECZYg1pXRxADuhAmjuLi1L+AhlJTFZ81Tpygco9taNf0lsF3FhkLraNqhZr1/KCEo4dPo0ytG7hlKbcOl9XbuPI9Aegcfq09Q6a9GRwShS0e6GTK7rWbAOINDi1NrLqCmHI4CgPie3d6xKGygd8O8XSvlA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(70206006)(4326008)(2616005)(1076003)(36756003)(8676002)(40460700003)(70586007)(81166007)(336012)(41300700001)(426003)(316002)(54906003)(47076005)(2906002)(86362001)(356005)(5660300002)(82740400003)(36860700001)(82310400005)(110136005)(40480700001)(8936002)(16526019)(478600001)(44832011)(186003)(6666004)(83380400001)(26005)(7696005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:27.3141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbca1ab5-664d-4598-bed2-08daee72f19c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8551
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
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 94 ++++++++++-----------------
 1 file changed, 33 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index d47135606e3e..7197b342944c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -924,20 +924,14 @@ static int gfx_v8_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 
 static void gfx_v8_0_free_microcode(struct amdgpu_device *adev)
 {
-	release_firmware(adev->gfx.pfp_fw);
-	adev->gfx.pfp_fw = NULL;
-	release_firmware(adev->gfx.me_fw);
-	adev->gfx.me_fw = NULL;
-	release_firmware(adev->gfx.ce_fw);
-	adev->gfx.ce_fw = NULL;
-	release_firmware(adev->gfx.rlc_fw);
-	adev->gfx.rlc_fw = NULL;
-	release_firmware(adev->gfx.mec_fw);
-	adev->gfx.mec_fw = NULL;
+	amdgpu_ucode_release(adev->gfx.pfp_fw);
+	amdgpu_ucode_release(adev->gfx.me_fw);
+	amdgpu_ucode_release(adev->gfx.ce_fw);
+	amdgpu_ucode_release(adev->gfx.rlc_fw);
+	amdgpu_ucode_release(adev->gfx.mec_fw);
 	if ((adev->asic_type != CHIP_STONEY) &&
 	    (adev->asic_type != CHIP_TOPAZ))
-		release_firmware(adev->gfx.mec2_fw);
-	adev->gfx.mec2_fw = NULL;
+		amdgpu_ucode_release(adev->gfx.mec2_fw);
 
 	kfree(adev->gfx.rlc.register_list_format);
 }
@@ -989,18 +983,15 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 
 	if (adev->asic_type >= CHIP_POLARIS10 && adev->asic_type <= CHIP_POLARIS12) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp_2.bin", chip_name);
-		err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-		if (err == -ENOENT) {
+		err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
+		if (err == -ENODEV) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-			err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
+			err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 		}
 	} else {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-		err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	}
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.pfp_fw->data;
@@ -1009,18 +1000,15 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 
 	if (adev->asic_type >= CHIP_POLARIS10 && adev->asic_type <= CHIP_POLARIS12) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me_2.bin", chip_name);
-		err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-		if (err == -ENOENT) {
+		err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
+		if (err == -ENODEV) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-			err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 		}
 	} else {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-		err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	}
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.me_fw->data;
@@ -1030,18 +1018,15 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 
 	if (adev->asic_type >= CHIP_POLARIS10 && adev->asic_type <= CHIP_POLARIS12) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce_2.bin", chip_name);
-		err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-		if (err == -ENOENT) {
+		err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
+		if (err == -ENODEV) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-			err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
+			err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 		}
 	} else {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-		err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 	}
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.ce_fw->data;
@@ -1060,10 +1045,9 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 		adev->virt.chained_ib_support = false;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-	err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 	if (err)
 		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
 	rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
 	adev->gfx.rlc_fw_version = le32_to_cpu(rlc_hdr->header.ucode_version);
 	adev->gfx.rlc_feature_version = le32_to_cpu(rlc_hdr->ucode_feature_version);
@@ -1110,18 +1094,15 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 
 	if (adev->asic_type >= CHIP_POLARIS10 && adev->asic_type <= CHIP_POLARIS12) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec_2.bin", chip_name);
-		err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-		if (err == -ENOENT) {
+		err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
+		if (err == -ENODEV) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
-			err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
+			err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 		}
 	} else {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
-		err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	}
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.mec_fw->data;
@@ -1132,19 +1113,16 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 	    (adev->asic_type != CHIP_TOPAZ)) {
 		if (adev->asic_type >= CHIP_POLARIS10 && adev->asic_type <= CHIP_POLARIS12) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2_2.bin", chip_name);
-			err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
-			if (err == -ENOENT) {
+			err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
+			if (err == -ENODEV) {
 				snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name);
-				err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+				err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 			}
 		} else {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name);
-			err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+			err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 		}
 		if (!err) {
-			err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
-			if (err)
-				goto out;
 			cp_hdr = (const struct gfx_firmware_header_v1_0 *)
 				adev->gfx.mec2_fw->data;
 			adev->gfx.mec2_fw_version =
@@ -1219,18 +1197,12 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 		dev_err(adev->dev,
 			"gfx8: Failed to load firmware \"%s\"\n",
 			fw_name);
-		release_firmware(adev->gfx.pfp_fw);
-		adev->gfx.pfp_fw = NULL;
-		release_firmware(adev->gfx.me_fw);
-		adev->gfx.me_fw = NULL;
-		release_firmware(adev->gfx.ce_fw);
-		adev->gfx.ce_fw = NULL;
-		release_firmware(adev->gfx.rlc_fw);
-		adev->gfx.rlc_fw = NULL;
-		release_firmware(adev->gfx.mec_fw);
-		adev->gfx.mec_fw = NULL;
-		release_firmware(adev->gfx.mec2_fw);
-		adev->gfx.mec2_fw = NULL;
+		amdgpu_ucode_release(adev->gfx.pfp_fw);
+		amdgpu_ucode_release(adev->gfx.me_fw);
+		amdgpu_ucode_release(adev->gfx.ce_fw);
+		amdgpu_ucode_release(adev->gfx.rlc_fw);
+		amdgpu_ucode_release(adev->gfx.mec_fw);
+		amdgpu_ucode_release(adev->gfx.mec2_fw);
 	}
 	return err;
 }
-- 
2.34.1

