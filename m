Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC865E41E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B3010E696;
	Thu,  5 Jan 2023 03:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F88D10E684;
 Thu,  5 Jan 2023 03:45:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fH8VmiL/4MkfaatLJ+Z4T/e8ZjFS/6vTZrSqQsDEIyKsEDTws2+bWvFTqsZh8ydI4YDLeitmPGvFobNTsRf0fbcmmVOKGjhhzUhXa8iy+N+yDgZUgDn2eMhDD/UYLpGvtQ4i+zOonbYDbb0hLk5uq8e0S2sxf4m9AaVI6pYlSe3P1HdpFcMNnxdvn9Iad5R31j6fxZTRZUs82DtpUQfP96uQnc/oJz7qVmHkSSP07/QF0Waz1v/nEhVc+D5sff4UuBbNB1YW1CLxvhFSKUDkb0a0AQLTHCBWPapTHFRqw5XplXtssE0QHILngDUAW8aQWRepfONsUpqBAWy8AasCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gipwuoML2fwQatLAfIc2kck649W+HfCcXg2A2WJTlA0=;
 b=EGmytDHhZkzcbWcSc21q0zRZ+05tvSQ01sdVsUOEEHHrWnh9Hcoky8LgzuYWALBLW4fT8gFrx8JtwrpWPD2dF/jVHpLXVaos90Ftkk7ghKtZ2LaT2Mg88GdNjLXQoIuhaiNTSiud5esidyH8QZo15Etquqa0mGyia/doPbjNg1hN3Zqq3lgPh1h3CJzUBz1ekjr7UxEXvipqrnpdBcsCQki7FyrSdU3COTsssORc4jMgfU/51TmnWbESKNkKOfOPNjTLDliS/qINi5UH9n7WgERyyAMMM9b8o/1U0xe0rE6sDvPDr58rJPVUBWOsnvgHuJaQcjMkwV5gYhPpvdVNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gipwuoML2fwQatLAfIc2kck649W+HfCcXg2A2WJTlA0=;
 b=VB9wPg5YsFT4C8G19eJB/7L85ArWGo3kTVLxinZqdk9/KLUcYr9pl6zaZ9VdeW/+E4iFBcBMmn3XiEHGmpPFL8j+FZX6nRk5U3Em0FXpGYAM6Jr7U7NtVoK6vcXavS3WSE2QG7b73dsAnLXBSuJGXt/I/VWXXZTV4ZjDZiNuCdI=
Received: from BN9PR03CA0569.namprd03.prod.outlook.com (2603:10b6:408:138::34)
 by PH7PR12MB6737.namprd12.prod.outlook.com (2603:10b6:510:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:45:11 +0000
Received: from BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::a7) by BN9PR03CA0569.outlook.office365.com
 (2603:10b6:408:138::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Thu, 5 Jan 2023 03:45:11 +0000
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
 2023 21:45:08 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 42/45] drm/amd: Use `amdgpu_ucode_*` helpers for DMCU
Date: Wed, 4 Jan 2023 21:43:16 -0600
Message-ID: <20230105034327.1439-43-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT077:EE_|PH7PR12MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: 955faf5e-cc41-47d6-85d5-08daeecf3f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ba60JHFTS6U+KI67XSL6HXKLX6M7A+GO2uWh4cFuqwsvu1Oiq4dNyVFqGSL1NBJmCQBLHK5kZ/vkVyMbtSbHi1C34cDEAfcqz55OufihUWhiN47HkYW9SU/KODxP9TGuwkVs7WGE4iaJXyohauX/f4g5kdmkmmq6bDpnt2un+v5CqagfT8MaqIAqZ1MMovFZgyje4vkMhbRgiV64tOiq9dAP4wOPI8QAUPqVKQqM/cMyL1N4mipxgIqAec3+5/qDb4qrYTV/ytVtJ+4PjI9e1L9JrbBhh6uNIzb29CqvvRXOsK2oP9jZ3HmJOzbQqewhTt+JFT//rjN6MWDgz3+w7UuD8H0s5tOUEjoaVSD5mkZBogoLZyECeFJQk3Jq9CkqrPI+dMBafIzj7fEa1tFFdpd5dWOS+ARmv9C5RGcw18mBxL91py7RV4sYu/dpLQxxNGItn/kOPtTPWTNNobJ5Ffjcus0nQIs7T4DcAxwp7IU4ORersAkOf9ujQNaKfXi1ylr/NKi275Bh3N3smdz5tZFW3/VR9ZHWFjZqXkGgQR+LIagiF0Inf7rj+RGHt30kBC3o5bBSOuYaxuHBlUGOWrNH63Mme2CcCVL8rjQxBJK8RG7A7xIfFFTx/4GMlemJMhsaauEF1IKbHYpDFLeggIiS1sxUhF5/jZmQc9vT2h02O+lN9TWoYL1UHWihFKBpKE3/1Anr4C1aasKgNBrHOeIY2/+sJJDvcW71gQ9RV9f5Q8agdW9KSe70ueEF+4XSwvNtf6Vh+8zc4W4bId4wGA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(41300700001)(426003)(40460700003)(47076005)(70206006)(316002)(54906003)(44832011)(336012)(8676002)(4326008)(2616005)(70586007)(36756003)(82740400003)(36860700001)(81166007)(82310400005)(86362001)(356005)(8936002)(40480700001)(83380400001)(110136005)(5660300002)(1076003)(2906002)(478600001)(6666004)(186003)(16526019)(7696005)(26005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:45:10.9959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 955faf5e-cc41-47d6-85d5-08daeecf3f16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6737
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Lazar Lijo <Lijo.Lazar@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>,
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 61c192ead62f..79c4652e8e40 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1881,20 +1881,13 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
 		return 0;
 	}
 
-	r = request_firmware_direct(&adev->dm.fw_dmcu, fw_name_dmcu, adev->dev);
-	if (r == -ENOENT) {
+	r = amdgpu_ucode_request(adev, &adev->dm.fw_dmcu, fw_name_dmcu);
+	if (r == -ENODEV) {
 		/* DMCU firmware is not necessary, so don't raise a fuss if it's missing */
 		DRM_DEBUG_KMS("dm: DMCU firmware not found\n");
 		adev->dm.fw_dmcu = NULL;
 		return 0;
 	}
-	if (r) {
-		dev_err(adev->dev, "amdgpu_dm: Can't load firmware \"%s\"\n",
-			fw_name_dmcu);
-		return r;
-	}
-
-	r = amdgpu_ucode_validate(adev->dm.fw_dmcu);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_dm: Can't validate firmware \"%s\"\n",
 			fw_name_dmcu);
-- 
2.34.1

