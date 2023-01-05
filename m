Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9AD65E414
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E2E10E692;
	Thu,  5 Jan 2023 03:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94E010E684;
 Thu,  5 Jan 2023 03:45:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/gNxnVkOxi0Sl0ZEDy0etqY8xeGmtixQt/fG4RamR3DJyyj4kRo3mzSS7OifPxccIYC2YAlWuLGUmWHtZN4cNltL9NgqL9GSxCYY+NBZOVQMHEvQqNfK0NK5m9loq65sYfYGvhAWNwPQexQKDogOXPxRL5XxZBHLMQQTpnUzNbLb9sXrn6nSOKx8vhF9VtUBVDgBI1tCk57I97fTfwyzT25SMjWkcAKnD5nosDOQpee3AE+tcfbY/ZRbUba2xt9OK3rrm2cna7vmPTTn2nl5MVoJz1G9zjaXaYVCMvaPwLe2SzyyT0Ojd8FHephFfoBaqb86xoYkEcVxykpDFIa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VF1aafMyOv67WCBTOPGQhQPgGQGXEPDRZh96oZA2AbU=;
 b=aLWMMX2slO+qHnsXUd1IhruLimPCDEv0iERJkVLzxBa/6Cm2aa67WRNt+jwBVdwToUt3CDwE4gtk7Knfr4J1sjb5d/B2g5xZnm0kVq4RCw8LuLMPrfDEhlIqmFV9i+poAu7e2Fbx/pcLLjb1qXuxGIjizA9YVuUN63T8+DJCzKGVJQrcaPFc13XPz6GV46oTM2bvlDUA/4ONaw60mU9p1TShvFYRfsWK0zX91/WapKnpoGufSbYPZS++bL3hca5yBN+Ab9u0Ngsp0Wt95roj03jH5YxEjwhp97whMSfdtIV+6j0ZM48lhgy8a2WyeUlrOQ0mazkacCZ8Rop9CI1YCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VF1aafMyOv67WCBTOPGQhQPgGQGXEPDRZh96oZA2AbU=;
 b=Z3/6hfM2eo7Qk+AhamoLlihHnIR2Ln94GdkIADyNKuA3UxNG5wXj6OvtY2RIHYFYUVeeCu9RQz5yOSdV/2hu8X+EBA6DY9Mu0xwoQ50q6zA1du+H/zmfjShDrG6hWAbITLOZbD6xbbfzT5N9256XcfKAEtDz2x0R8d+T07AntVk=
Received: from BN9PR03CA0541.namprd03.prod.outlook.com (2603:10b6:408:138::6)
 by BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:45:09 +0000
Received: from BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::cb) by BN9PR03CA0541.outlook.office365.com
 (2603:10b6:408:138::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Thu, 5 Jan 2023 03:45:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT077.mail.protection.outlook.com (10.13.177.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:45:08 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:45:05 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 40/45] drm/amd: Use `amdgpu_ucode_*` helpers for CGS
Date: Wed, 4 Jan 2023 21:43:14 -0600
Message-ID: <20230105034327.1439-41-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT077:EE_|BY5PR12MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: c705d78b-ff65-4111-376b-08daeecf3dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0rhSD5y+RGD8wGxLVvez8L3pg/WnAERaxVGsVsEMaBrUT6QmCkSfq8zTfz24mAM0UjTKfE51CdkjXwzv8K24bXSwHtUyKExaotXpIHza4RKNTsmEJiymUH4GxYi2JeFMYjiRVvyCBDT7Y3j5cKa0MTtGVBVeQaa39l1HRIcpGkDXkBA6mpo1nkd4W3UUFPYUL2AmxhTW3jaftQU/qL9jq60/abdM9t08I+yXBZgkpwPGKeXY6ml4vtKB7f3wJ0vtEnIuuzZk8TCPSIzpe6BgywzeqXtdaBeW0JxuMlfNXOJiXe/VJF5Te5v+2Gg5AnbR0u2/cWx9OMoc7DXWebRmQgJMpkQN8DqoWYqOv1ubkRI0LG9i3CdMkuTEeSiqwkt6hewRPhL9hhrbpnkTxFdNLrGJCFCpeGkz+uAqMF0e3XtACYqS8iVVpk+8xfQ0BnKoIcYXnRG/7kist4o/XkP8punojwwW7y+vt2pdx+qdZcq8XuZZnT52xPAT1EUOn2p+wfcYgjLQyGgKYspdsl5NZX6ARBeg+yB1nUDPxmK6Kgc8L7VfH24xAu3tu808aamuQoZVoyqAsecA29pOnkyF/I+Zfxd+tUlKYb/U/WN/Bj9J012ms0L4sNLXWcoJXViWJaW5+va3XYeZX5dskZERteNf0a0KL8yvg1Jo2MluAOFDsjyYcxxVRh6UBi6CVEZ1cXbnNL9q6Xhi4Krc+8un+b8HE5me8t440jaQrg/ZTZvTRMTJZTcHY/94noOhtTQRrb5mCzeJYVCpUlE0bijnOw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(70206006)(4326008)(41300700001)(70586007)(6666004)(47076005)(336012)(426003)(8676002)(356005)(316002)(86362001)(2906002)(26005)(186003)(54906003)(83380400001)(7696005)(81166007)(82310400005)(478600001)(44832011)(16526019)(82740400003)(36860700001)(110136005)(1076003)(8936002)(36756003)(40460700003)(5660300002)(40480700001)(2616005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:45:08.9648 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c705d78b-ff65-4111-376b-08daeecf3dde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4902
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

