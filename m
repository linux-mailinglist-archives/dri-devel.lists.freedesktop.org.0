Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC7965F20E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DBD10E7E4;
	Thu,  5 Jan 2023 17:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2045.outbound.protection.outlook.com [40.107.212.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2A610E797;
 Thu,  5 Jan 2023 17:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD3qUuTEG/nlmOXR97lrcCGhiwfG/kzQuBvgB+yoEV4EmzfJRESHRpxGNgBB4Ycq6M77ZiF+7eAvIMUwr4g1bGTmPJyX+0hGJvEKSeoXQyQRxAyTCDAUbkUmDybakM6CDyZTNpfZw3FGD27jtxprbIJHZW1OOOYYKGjNrVGoHVsHkw868fwDRWEFO+NSNKs2GoZMKHvyBnw8e0sFauulugISMt2pkuLfPvh27JnS5tZkNRon+8nQ/TQZJqsPjnXdpvOhH7RTA29l90LIH+UFOxTaih9gXkUTtnlJlM5Csei8F2GXMw8gw3ZR/Yf3v3TrNpJgmQfUR2bofea2PMB4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7zXxZne47y4jAd7J/obdLs/bK0bvRFF5mmEw3LyeeU=;
 b=I3PF61UCYWNDIx7e/fZMcdBSNdaW+57wDikiliDunGGfC6SkjgmWBtYD8mggztXC0T/HGnYSzisMhCoDV3dSR4nGBEloMm0wPQLeDYGvji9X22qvbNLTCVG7sIx9CrbWj+yr8x1+NEglVNqstM2iWw4bfwg6yfuEBz7hxmqF1XU6ZeoYgIwj/fo4wKHglEgIJl0gxm+V72j3//YRZdI9fZT1TVShHakrL5lFEFGjoT3IEv52VHu5T1GzfK2F4fMg48gY9I/uSf9nD3qMgMeaVy5/b96QsEpgLGcesNWfKy8nVE5xwwxEaBa5OGP9jx75QMWnHL9+wgsWx8v0KqXHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7zXxZne47y4jAd7J/obdLs/bK0bvRFF5mmEw3LyeeU=;
 b=Mh5Fwi3rKiiN3Ky28GCDBHfDnlhUbOfW7J1tqLTKvjyiOkzMb7YL3LVfUiMpTF/a7GrtbLqDmQmkJKikCF+nvh+Z3iK5VitzS/hrx+uUZpWwsdM8JmOWmd6A8HazkE4un/q1KBVEF2p4z5EfGFNMCutFRr686VgD4FodGNRHQ98=
Received: from BN7PR02CA0004.namprd02.prod.outlook.com (2603:10b6:408:20::17)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:50 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::21) by BN7PR02CA0004.outlook.office365.com
 (2603:10b6:408:20::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:49 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:48 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 40/45] drm/amd: Use `amdgpu_ucode_*` helpers for CGS
Date: Thu, 5 Jan 2023 11:01:26 -0600
Message-ID: <20230105170138.717-41-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT062:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 913e5e80-4a71-40d9-06a8-08daef3ead42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +XorngsMEN+NG/uCIYfQjOcDtCg494+1wU9vK2FWwwMjrPROemYou+gJh2jJcolvZqp2iHAaHw/DymhDtE/16W26GWtZV7Be9gkZYZ3pUZv1Jex3t/SrmQsQPbKFJkSg0TW2xvnsvmK7DrifNh52c4FJA/2ng9DbrpR1ENyxq3mLzkhWm2MtBwZevQITwHKdJcvwCjLzyoeb4TULo0O1+gLYzQv/6aBjqyuurT/mblcF8XnfcikoPfkwOH/+GDeIk1r4IKRh68mUF3zFv+wroIfVX0b9FoM5+6SBwfkqkbioo+bwGZeuWARNlbrGhCrDbF7BPyaatCT7VnyP/s7F/B29AkqiNXZ5/BjoY7EBZc1ewzdWFOL5RtJMFpPpEwquUQim4GqVYoLnTZ6pe7D3OXnZK9dPmbKMcKUxeq0T4JaBeSUxjBGFXoUDi/40r9GoYH+KEydUwUrzYY1gJBAX+kAf4lh/V9xZ4dPvGrzEE45/wWY3cL+VA3w+LNuS4Bhh20kfyDU7emTW2IShiLNpuMxiV/BCCPcmYcw6uudBCGQD/qU+GKye3GYWCMeOOkkK/AZErAxSmUWtuk2hcCYD4rv+mSLaT5HWKGjnQk+7nEI4eJLx5ESI32BJT+PsbUybGiLO+MryaN0SPdltT7UpmBHqye1U/C00OeIZxETwkhnFhWEvRAC7ZfAVu7GJb72vxVw0tQM/NDhjVfjYjIXQmCtlOGv6N2JnhsE0nzbgj/pdChbLzfU7GZoM6rDYFm40lQXCct581MWxg+AhoZvY3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(36860700001)(47076005)(426003)(86362001)(41300700001)(44832011)(8936002)(356005)(82740400003)(2906002)(5660300002)(7696005)(82310400005)(40480700001)(4326008)(6666004)(40460700003)(26005)(316002)(186003)(336012)(8676002)(16526019)(2616005)(1076003)(478600001)(70586007)(54906003)(110136005)(81166007)(70206006)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:49.9674 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 913e5e80-4a71-40d9-06a8-08daef3ead42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
index f1a050379190..456e385333b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
@@ -411,17 +411,10 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
 				return -EINVAL;
 			}
 
-			err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
-			if (err) {
-				DRM_ERROR("Failed to request firmware\n");
-				return err;
-			}
-
-			err = amdgpu_ucode_validate(adev->pm.fw);
+			err = amdgpu_ucode_request(adev, &adev->pm.fw, fw_name);
 			if (err) {
 				DRM_ERROR("Failed to load firmware \"%s\"", fw_name);
-				release_firmware(adev->pm.fw);
-				adev->pm.fw = NULL;
+				amdgpu_ucode_release(&adev->pm.fw);
 				return err;
 			}
 
-- 
2.34.1

