Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3EA65E3C6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E49310E641;
	Thu,  5 Jan 2023 03:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D5210E641;
 Thu,  5 Jan 2023 03:44:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsgOrqPoz6JPsxrkHzEmQa7LB19/e9g2fkyS20Mk3fSux5K1zqq9uX0jsfye0H3TDypBZEEprO/SJguRfmEH2RWRgREYxgmwcfatVZx9LDGGrki3DKGj7l/UUVSby3lvPXshafh4k33ndz6Ytg8YZJbISs+c0OuONRT+jy5rIQ1ID3W7x3OoEaI7KV0EafkEb3+sSa7KcvJh97ubKcGuuEOzWLCLwi2eb98iglfy8SvblnGaCYwb1BbS7tE4QRgqBhMUsRciSBM4dHd45ECUXzVCnJ/66DpBBRbzglsXWyrV8aNMbGPNPGmHXs2Td5itZ701ViUtQN7uySR70A83ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xEOGjHayCRUZGs0qCqaljG6vqRGZGyFx1K6qJXODt4=;
 b=NY5FxHnez+OkU7rc+Yk2hSZ1vSePaKA6I7lq000zZ1/X5zcajeiIO/W7B2ujC0pLs0EwNUblZhN5sEEoCNhzh3esMgpJTGo5Q71OPMQhs2zsdWkWj+H1i/X30GFTI7kovGcQDysOyX9mP59TyaW2wsTqqB2v2vlPPeKrBOaeZoQTaWsL9wzVQvmmacMzsIn01267CK5oYThBkcAADr7Hje+wtDGKK2xqAdt96ub02/lDxN1akx0IaM3EK9AFdSSZ+DAr66ez4u9wFEurrvlMJfdn02Gh9AWTpC+WeIrlOMPZaSrrW26k4eY66R3N6wTDNZzd6ddx30HZUBz8EnCNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xEOGjHayCRUZGs0qCqaljG6vqRGZGyFx1K6qJXODt4=;
 b=U4TPxRoCT9IuMEVaQR8s6zXBZSllagt4LmwscA3mcNuRdLsD9EwTXWhFZIY93FuCJLO/DPbDw5Zm9cF/nze8ynhU6JBVj3oufpz1jz/iSFgdz34W0BS7rElOG3Cmq7XKuYNB+0aw8+P8f4mOZpnJisVwD89F19IRlGDw5CY8gaU=
Received: from BN0PR04CA0053.namprd04.prod.outlook.com (2603:10b6:408:e8::28)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:06 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::9e) by BN0PR04CA0053.outlook.office365.com
 (2603:10b6:408:e8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 03:44:06 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:00 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 06/45] drm/amd: Use `amdgpu_ucode_request` helper for SDMA
Date: Wed, 4 Jan 2023 21:42:40 -0600
Message-ID: <20230105034327.1439-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 0273cd01-106d-41a6-38d0-08daeecf18a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FI528YcA6VVw41Yow2F1hgowNReELM5Gka6wwmivS+7vVvjuAroEvpSnmG1yOgO6ymkKEk2XccesOSgmDmBbD+7HSWdffqHCkSI9aJxiXQW+13p7zh89fyBOnV/Bc07nM7AuhY5kMcPqTN4T66jsCjj+P8HW+EZT8MQ12QvCrfUjU10vnDrQxfIiOwqslMbvJ+BLv60xKWmVlz7qsjQIlCYuSb6rGl/2vr3yyfmcR6czd7BcjcEqAleMvzIec1M3gZDXsO3pwzQH8S3ZWKdZsTT3hKNnC+YnN6clELXxQiqdWPJ2sOovMrb+gOVu7ed8Zcy1M6SBeEze1IzXl/DNUJmLxVkcoNhxkLFsFpCLaq2XXfr85uitHuSKv6KAQx+DOZN2GhmT4Vqtr2ZTz7sYG69CcUfZDKiXOifHZiFhuVNKOOh7pTPP16ly4SfcHuA5ET87BHKM1U3Lq9P2JMyT0FhcWbiZJmE1VCUiquUWjpTijYO77ZR6R4Byjt2pn54rDHS0ghGUxxJ/xVavFFJTzDCM7XkWFs/GyEwNArthDxLvKRdu+KHyzjl6ZXENSZVz6Q9BtU+rD72RnJTn0KhCSnMiluAj5BX4HbzPqjpT3zDyASgpGktR0Zy+IwwMwptKPV8iHVxbM7OIapGlstUFtX2hqVvZMzm5Ow4Fg2CFVereGPFp/XMRnLEFiAWjKrPPfrZK557vX1uRuHeNozLgXsnog1DGqyU0iX3hxOiWEEN51VMUNhYrcXT0G/3eWgBLqkTSIZDC85ehXyZQ+3uLkQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(83380400001)(426003)(2616005)(26005)(186003)(82310400005)(16526019)(40480700001)(336012)(6666004)(7696005)(40460700003)(86362001)(36860700001)(36756003)(81166007)(356005)(82740400003)(1076003)(41300700001)(4326008)(8676002)(2906002)(5660300002)(8936002)(44832011)(316002)(478600001)(70206006)(110136005)(54906003)(70586007)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:06.4934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0273cd01-106d-41a6-38d0-08daeecf18a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index ea5278f094c0..a6a491569022 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -154,16 +154,11 @@ int amdgpu_sdma_process_ecc_irq(struct amdgpu_device *adev,
 
 static int amdgpu_sdma_init_inst_ctx(struct amdgpu_sdma_instance *sdma_inst)
 {
-	int err = 0;
 	uint16_t version_major;
 	const struct common_firmware_header *header = NULL;
 	const struct sdma_firmware_header_v1_0 *hdr;
 	const struct sdma_firmware_header_v2_0 *hdr_v2;
 
-	err = amdgpu_ucode_validate(sdma_inst->fw);
-	if (err)
-		return err;
-
 	header = (const struct common_firmware_header *)
 		sdma_inst->fw->data;
 	version_major = le16_to_cpu(header->header_version_major);
@@ -195,7 +190,7 @@ void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-		release_firmware(adev->sdma.instance[i].fw);
+		amdgpu_ucode_release(&adev->sdma.instance[i].fw);
 		if (duplicate)
 			break;
 	}
@@ -214,7 +209,7 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 	const struct sdma_firmware_header_v2_0 *sdma_hdr;
 	uint16_t version_major;
 
-	err = request_firmware(&adev->sdma.instance[instance].fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->sdma.instance[instance].fw, fw_name);
 	if (err)
 		goto out;
 
-- 
2.34.1

