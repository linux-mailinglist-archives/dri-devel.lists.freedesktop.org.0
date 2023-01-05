Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE39A65E415
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4AA10E695;
	Thu,  5 Jan 2023 03:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D130810E691;
 Thu,  5 Jan 2023 03:45:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nilPqSG2eMKXgX0EKlzhMoGdwLrFnlM3zw+EqUfjBOeQAg7HA8a6vRilv6NnOHumVxOOVRklLe7/qQxGQkRLU/O9QapgPGuZhqJljqCfydL1owOSDjNGeyjdmZCKUBSQBwE4+foAMc6MRFZd6aaOYjwqCPlV68qL+EOZ4PA5BWeDLgnJuVS77JMpnGX0zhMQ7F1/SilLVTqjTPHy1WI7eWYIsljveiC3wDWDuQ7ZUSuGEuPaPNx6sHtgl6o85kaDXAZxnmWUzwF/kSEJ88d8ExlGw2w2jHB3Hg077UkdnNOQeHlPDcmRAOW/t8HUvOXBSBuzrcxRKHhTGrqLmO0i8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ie7CJsESTUZS8l1QSP/Xr3uAc0A81zgCBeTSmNAnf4A=;
 b=eVizgtgU+rT0xmAMwF7PO/E6FjZwPBQIrcKv4krIZzmVfpHjJIULZuX1ApxBwi/ubCn0W85xseZokg3fT5+/KlSaKC/Qc2UkdtmHhUJTkEtMFOOE3/lb4EvRkDNNRRAiTnK6jETpJfgBVImkwDbbCrusZkATMQHAgtX1EBV5H4q5uq3sxu62eS3h+A+WJYOB2G93MalFh/ZXgEqKFXhmqLTuYnm7zyQvcaDKqpU93A8UZrTiyDCnI76Zi9YceJN2jy4OBu4HUL4hNN26Y9URllmedme88XAbVHdnFc+8vgk6TfosGEa1oyMk+HaRwvOBFs2DnBnZR1z2gO/MibN6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ie7CJsESTUZS8l1QSP/Xr3uAc0A81zgCBeTSmNAnf4A=;
 b=kPSd+cot+F75bS7RE6ygjVJiUeBq8oQryHttNulHkXcfwG0RjjY2yWr5hEoN9Wir9xNDnF+6Ne0daHe77lbHJG8X5hM82NXOXwf1k3Gsnm5OiiWSd5I7rpaksyzpcyMpwV/rtfSy+Uyc282T7WUigL13PEfk9iY4vAcQ+1hr2t8=
Received: from BN9PR03CA0551.namprd03.prod.outlook.com (2603:10b6:408:138::16)
 by DM4PR12MB7599.namprd12.prod.outlook.com (2603:10b6:8:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:45:08 +0000
Received: from BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::41) by BN9PR03CA0551.outlook.office365.com
 (2603:10b6:408:138::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22 via Frontend
 Transport; Thu, 5 Jan 2023 03:45:08 +0000
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
 2023 21:45:03 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 39/45] drm/amd: Use `amdgpu_ucode_*` helpers for VCE
Date: Wed, 4 Jan 2023 21:43:13 -0600
Message-ID: <20230105034327.1439-40-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT077:EE_|DM4PR12MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: ce19720a-2f58-4075-8b51-08daeecf3d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7kJ1QyhTjKK0UJ8BAkkVvThcHT0Ymr0L5RooiQ2wgcNO0NL/7CaKqCF2Hdhh8KIKG9FWEpEz53uZNXzKGbYnhFMSsDnpFEo5BzojfTJWjVw/FUXHbTmwr5syNHqzq2En/fAiadmhKaBJ36ESuC4XcchiE3K4T/UhqItnXJBqRf8uZwurdgCRO37KzE5X7GJmipIgkGdkPmOipbmZy6wAY4p3IRJXJh5zB/ZFygYaQPIrCHBsrtyAKoqmtY6B6uZWDPjOmfTYeGcRBYrq7hdVQr4I82rMk4M7m4hIxQVNW6quiS4eXFWNJclC3OOg74jIYDzxHC5hkgCo60/S3Nfjp91dyqsnLpd/+LIrxktGwPCcuHlRZevl/2/nqW52fnkf2Xp0PbxM0S0UXlVmRZoXum+lHehYlXBvJwIKzj8qsavboom3L/u23gR3FrNFOCoD1Djdj9VvyFe8rkKelsp/XA3KYwEtTZyaRwFNoC6S9jVSXMBSbOhRB3GJL1k81iTcOVs63Ck3JNYBg3OekPi8aPbg2SdGSp+ieDmV3jvtikOVGmBnEWmQ2O04Qc+UpetDpmj/W5hrcgmSekhcEAX4fvnpbT0TlBA4n5vGt5mnrG95kuUg0OyJ/sOjBcGsHNBEvecCsVVDcdbekUKlHVuqY4D5fPBnYP8H1BUEO5xuVBeZpxSFgOCLmFD+EBe2HBzEG7et4QB5jfRJUMmw0aqRH+fmHRsLWiqPozEA9wrA3v5A9Vz2AfqOYgzivScn7kdeLdBeOKSRRtf2Xl5raYeccA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(83380400001)(426003)(2616005)(26005)(186003)(82310400005)(16526019)(40480700001)(336012)(6666004)(7696005)(40460700003)(86362001)(36860700001)(36756003)(81166007)(356005)(82740400003)(1076003)(41300700001)(4326008)(8676002)(2906002)(5660300002)(8936002)(44832011)(316002)(478600001)(70206006)(110136005)(54906003)(70586007)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:45:08.4179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce19720a-2f58-4075-8b51-08daeecf3d8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7599
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

