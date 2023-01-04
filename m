Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B7265DA74
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C510510E5A1;
	Wed,  4 Jan 2023 16:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0383210E594;
 Wed,  4 Jan 2023 16:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ww+5jUxA0xs6Pw5B/9Z438nlNV/nS6BBe9EkjNsHgNx3YlcAY1KYxsam4/YJ90YxYHZz4g24bWaehtbWgxxA7dYne3zAcIQCZnD+L37qt2wNdSZxDBHDaRN/ryi5UMCzU8R1204+x1RdkXlsyi+prt12ai41KlnTtZCy69xW8PsTJrh59Saue17jY4P6pjp3dapEW8GRHMBib9KLdtsvHa7KSs4KVN2Yrz3OHXDod+Bi/88hVtsjk5Hfe/XzAdV+KEWzLqHPNkHsLxOBRYUuwAGcD6z9znEw43xA7u7EDKDTBiiNaylNHAgwnRGI7f/edWlGlUoFdZqaSmaKAKDa4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG8GSN2xT/clqjksKE9gqJFdnzdD92TeCz8xdRbaRE8=;
 b=fyw3y7LoTOM2xR+EFqJjC4fr9ZpARp+POMT9CHnY/Ca38OdunvFkduZVDLcakbIyjjGpgM8v5YY4hE+1YfbnJOaTvA46htXUD7nmzsTIU46GOt6PeFZGiOMIalIt27+c6MtI/T1w3UFeaSSWszBysd5mlMW3em/oE9IgGqTE8YVZpEVBP3o7avQIGhp5EjDuYKWHAyuLf2erT1R6hcdDYhZxLC6V1+DWfv79JaaAo0uTfWuDrKoMagLW9UF69Mp+kfEuEdAzucQ8oskTAJ+uFzSy38K7oh24+n1YouY5c+/KHYGeYCgsoHkCmG8zKYaiC/H5z+Dx6mkD0a1dtcG2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oG8GSN2xT/clqjksKE9gqJFdnzdD92TeCz8xdRbaRE8=;
 b=NXWaIwlZKBKsFBT4RSM8nUyQlhU61nSWYTZecrPN170bnirZMX7729FOrWMpcpPx48XPVpAjvKWMEOBct/fO2n7q+iijVVw03bcbs37rSsWU5ORMWvBCG4fiKRu8v941m/dongT3qV171j95Jhe9OOpk1rv/G+D84XErBSD4bug=
Received: from BN9PR03CA0621.namprd03.prod.outlook.com (2603:10b6:408:106::26)
 by SJ0PR12MB6734.namprd12.prod.outlook.com (2603:10b6:a03:478::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:36 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::a3) by BN9PR03CA0621.outlook.office365.com
 (2603:10b6:408:106::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:36 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:35 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 41/45] drm/amd: Use `amdgpu_ucode_*` helpers for GPU info
 bin
Date: Wed, 4 Jan 2023 10:40:30 -0600
Message-ID: <20230104164042.30271-42-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|SJ0PR12MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8212a1-97c3-459b-5274-08daee72f72b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KwukuH+728Vb2QkCoVQzY2KqVowCB62ifbHOcYGjtwn4WFTTFndSLucr8GeCQQr+bCtgUHnfWRuQowLluJLO28205eJR8C3QNDKl/aAMP+oipsu3i2In8s9QARZE8hUKtT3thtRGjBoqAijHOWbUB0bNZdSfe7yREz2wzn42H5S3T722S89l1DoaL6kwm4o8y8XkUhIZ7sHBTmGe1dpNYNNTGADvd3xH99c7aDAgqscJRu85ktNUQAWFSoa5Q9Ee3BfBLqxeg8Vco22i+y/s1xUHUJeGd1SWbFiQn7ZuwWOA6vcgjFxzDSy7hGrA+gNRXEQZmQC6JosuJEJF7v3B/lmCapMboY9xBvxQEnRBt2LcW7s3KW0CYLO8RlqyhvaRnm5adbawxXVHDpUbI18HjYXL4Pd1FEH6r3Yn47cEqIi8S2NAfCGGp4OgKk6Jwxhkha29y/Olpqe7Hwj6xfEnsWn87jLZjM1JJXxx69pIWj8Pr1fFnjwrQMPgTkAmOrLqEa7TgrhyS/E85uxeubxtsf1sY4JT9kwKFVnsFhxZtsVt/ZdcwvsKjMwEihf96lYRwh6FS3aWmRZhNbAxrNmQVqnYayFMWlmlp16B/HW1MZAxnRQo5Nd0m3hBFoUpVRfSwfenh9OFCyt3OQ9pWcAzZQE2EIi5gfa6lPKrWtmFHOxWMhJeU7YhAUYlLjsmhsYmlfAPZ+NS6HJbOELGgfdo4ZDyL6PRfeNCSir/ENZEPxZJyanPUWZrWgUKBMOiiFsg7M2qUbiA4E5W3vgYh7aekw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(426003)(83380400001)(86362001)(82740400003)(356005)(47076005)(2906002)(8936002)(41300700001)(5660300002)(44832011)(40480700001)(316002)(40460700003)(478600001)(82310400005)(6666004)(26005)(336012)(1076003)(186003)(8676002)(4326008)(2616005)(7696005)(16526019)(110136005)(70206006)(54906003)(81166007)(70586007)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:36.6371 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8212a1-97c3-459b-5274-08daee72f72b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6734
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cdb681398a99..0d70eeb75731 100644
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
+	amdgpu_ucode_release(adev->firmware.gpu_info_fw);
 	adev->accel_working = false;
 	dma_fence_put(rcu_dereference_protected(adev->gang_submit, true));
 
-- 
2.34.1

