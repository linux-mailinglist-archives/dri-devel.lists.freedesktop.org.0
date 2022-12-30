Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5AA6594F1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC32610E43C;
	Fri, 30 Dec 2022 05:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A951D10E0B6;
 Fri, 30 Dec 2022 05:21:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU+0tHg4yulIo+Owk8ZtpvyP/U8MeR9LnWNz37OZzXUqArylY1hMyB3kwfU6BMtBACKdGaswDNq1QLHS3Ax/bn1gIL0wbqJon2vjzjzyX8tqPXVm+mL1SlpfR2VR0/lhe+iWAkhddznMi2m73KKJwtQlkXekHU24phdifW4xrefOUUWRVve9mhSaAWL0BzWXpNHO/R5v+efbM75ZHXWj9y1TSliP403lb+7hddYNR9p6736BdPBQcYqFE/BCgN3wLkVVRWp2UHaqxYntSusjvv1eNDFDHv91NXZOyfyVd1Yd8i9bSFxvJT7hWMtJRMjquLtgFTa/ACn1XZcLjai0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fs2fcAKebO6z+BW7DnuL0g7pOz+qx2K78j4HSy2l+HQ=;
 b=fRIE0jrFg6KwgQaSobgx+r00KHhLnAxaG/EsSmmcQ7x9Qj4iAMqFl6cPKYmQh2DFz1UXEVFo7vmvvqAHygwhHVZOVYFyT/zdszR4OdSLY0BRnH/hwTBTCp9pu2x5BkjbIwHNJZ6eiiSd5hFLJu0nKXBZA9fj1ej/M5vRsNy62fdHLPvrhlUYc4svzTVwogDzvOdF3wszM+NZDhrMG96MEiyR2PaN8qDFd6qPHx94WFADuyUH0iyLhm880Y9AjJ6HQwlRyvGdQ6lpRwOAUjUd45kyYCzVzWeuVZZTdh2PmQer7bWrWoAibP3+evRAPGH0CrfwwIo24cVCK//YZwWgJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs2fcAKebO6z+BW7DnuL0g7pOz+qx2K78j4HSy2l+HQ=;
 b=s9G8mSBtopXWWtjejzhFcqFWAak+7CKb07KJoOuMMcnV0ein8nCXSkYZXnryR+IIlcuCs4MRPaD5aoNDmaHBlrn5a3r9kMEFJO2SBPzQeXjQTQLkctP8gwq1RDMaQILDx2rpn+LD+WHSNNd6vV9aCGbn/lfq3DwORpbLMLN9aQ0=
Received: from MW4PR03CA0336.namprd03.prod.outlook.com (2603:10b6:303:dc::11)
 by BN9PR12MB5033.namprd12.prod.outlook.com (2603:10b6:408:132::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Fri, 30 Dec
 2022 05:21:49 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::ac) by MW4PR03CA0336.outlook.office365.com
 (2603:10b6:303:dc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Fri, 30 Dec 2022 05:21:49 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:47 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 09/11] drm/amd: Request GFX10 microcode during IP discovery
Date: Thu, 29 Dec 2022 23:21:13 -0600
Message-ID: <20221230052119.15096-10-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221230052119.15096-1-mario.limonciello@amd.com>
References: <20221230052119.15096-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT055:EE_|BN9PR12MB5033:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc75c1c-f3ea-449b-5e03-08daea25c090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2q2ZlhBbs3eIuNG0BEaip0yH2jnoYU15fFJkzjQ3K5ZLOqHwFX5UZ5mZ7bUT5Hd8uT0+W+gOW7IWJZRdznVf2+AXDK3ELxfSxhPvHoxdipjPPrNg5gSA+e0Kymge6Ic39klYzs8jlJ40Ezy+vq24Rnc8IpYHjNUT/tvJ6zu7M1wBJ3/x8uuUvGvd7Bkbe1Sxztyzbq914xDbWv1n11ud1k/GIO2VBATvuVMwvTMExqkNE9hoA5h5GiwDvyZylnGOZvM24hWOUGidk8YN11vT3Hka6W9nk/d4j6xdUBMD6qrRdUSbG6xThRj3lwS8ucijpAmmyt3AluPW2PszgQEj7i3kr7345OFjqQ37usbxdxWY4pcP2eZOmCxBgBGg9gJm0d1ftNgd97jeItIXTsvUYBHeJlrqiQ7s14K1DDvgoJf9RGCh3XqfYedGEofxshHTC41bvuxLCzaHIuczW36gxSRrhVQjLRaFmmOJuWTl/dFBVhUjtiDK7ZZuLMbfrtciPgtYOUh083yy5H2I8gBSL7567uDyUw0mPE2dp0iW2JmCgrRWo8BQzMW0YxsQUSKa4rFsVLnPU09VVKwRyrN0GTiHKZMMMRw4EfxfNeiiFt/dxChxsN2VHLtF1WhqB8Vr7CQDbtGlIgBUgQfFDLb67hGupYiVkehmCLMJPXxLpIPXDx71R+YxrnrHYKmkcfiJOgrE99MQNGpE4+mvEtQaSheradBbPSapxrV/AQbQV4Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(40480700001)(356005)(110136005)(316002)(86362001)(54906003)(6666004)(19627235002)(478600001)(5660300002)(2906002)(30864003)(8936002)(8676002)(70586007)(4326008)(70206006)(36860700001)(44832011)(41300700001)(82740400003)(186003)(83380400001)(81166007)(336012)(7696005)(1076003)(16526019)(40460700003)(2616005)(82310400005)(426003)(47076005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:49.0316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc75c1c-f3ea-449b-5e03-08daea25c090
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5033
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If GFX10 microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for GFX10 microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 137 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 180 +-----------------
 2 files changed, 144 insertions(+), 173 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 0ff1b3872441..439b10fdff1b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -220,6 +220,102 @@ MODULE_FIRMWARE("amdgpu/green_sardine_mec.bin");
 MODULE_FIRMWARE("amdgpu/green_sardine_mec2.bin");
 MODULE_FIRMWARE("amdgpu/green_sardine_rlc.bin");
 
+/* gfx10 */
+MODULE_FIRMWARE("amdgpu/aldebaran_mec.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_mec2.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_rlc.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_sjt_mec.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_sjt_mec2.bin");
+
+MODULE_FIRMWARE("amdgpu/navi10_ce.bin");
+MODULE_FIRMWARE("amdgpu/navi10_pfp.bin");
+MODULE_FIRMWARE("amdgpu/navi10_me.bin");
+MODULE_FIRMWARE("amdgpu/navi10_mec.bin");
+MODULE_FIRMWARE("amdgpu/navi10_mec2.bin");
+MODULE_FIRMWARE("amdgpu/navi10_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/navi14_ce_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_pfp_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_me_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_mec_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_mec2_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_ce.bin");
+MODULE_FIRMWARE("amdgpu/navi14_pfp.bin");
+MODULE_FIRMWARE("amdgpu/navi14_me.bin");
+MODULE_FIRMWARE("amdgpu/navi14_mec.bin");
+MODULE_FIRMWARE("amdgpu/navi14_mec2.bin");
+MODULE_FIRMWARE("amdgpu/navi14_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/navi12_ce.bin");
+MODULE_FIRMWARE("amdgpu/navi12_pfp.bin");
+MODULE_FIRMWARE("amdgpu/navi12_me.bin");
+MODULE_FIRMWARE("amdgpu/navi12_mec.bin");
+MODULE_FIRMWARE("amdgpu/navi12_mec2.bin");
+MODULE_FIRMWARE("amdgpu/navi12_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_ce.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_pfp.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_me.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_mec.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_mec2.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/navy_flounder_ce.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_pfp.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_me.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_mec.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_mec2.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/vangogh_ce.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_pfp.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_me.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_mec.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_mec2.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_ce.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_pfp.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_me.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_mec.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_mec2.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/beige_goby_ce.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_pfp.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_me.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_mec.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_mec2.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/yellow_carp_ce.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_pfp.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_me.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_mec.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_mec2.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_ce.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_pfp.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_me.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_mec.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_mec2.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_ce.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_pfp.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_me.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_mec2.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_ce.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_pfp.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_me.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec2.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_rlc.bin");
+
 static const char *hw_id_names[HW_ID_MAX] = {
 	[MP1_HWID]		= "MP1",
 	[MP2_HWID]		= "MP2",
@@ -1984,6 +2080,44 @@ static int amdgpu_discovery_load_gfx9(struct amdgpu_device *adev, char *ucode_pr
 	return 0;
 }
 
+static int amdgpu_discovery_load_gfx10(struct amdgpu_device *adev, char *ucode_prefix)
+{
+	char fw_name[40];
+	char *wks = "";
+	int r;
+
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 1) &&
+		!(adev->pdev->device == 0x7340 &&
+			adev->pdev->revision != 0x00))
+		wks = "_wks";
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", ucode_prefix, wks);
+	r = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", ucode_prefix, wks);
+	r = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", ucode_prefix, wks);
+	r = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
+	r = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", ucode_prefix, wks);
+	r = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", ucode_prefix, wks);
+	r = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+
+	return 0;
+}
+
 static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 {
 	char ucode_prefix[30];
@@ -2018,6 +2152,9 @@ static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 	case IP_VERSION(10, 3, 6):
 	case IP_VERSION(10, 3, 3):
 	case IP_VERSION(10, 3, 7):
+		r = amdgpu_discovery_load_gfx10(adev, ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
 		break;
 	case IP_VERSION(11, 0, 0):
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 49d34c7bbf20..319548b81454 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -182,95 +182,6 @@
 #define mmRLC_SPARE_INT_0_Sienna_Cichlid               0x4ca5
 #define mmRLC_SPARE_INT_0_Sienna_Cichlid_BASE_IDX      1
 
-MODULE_FIRMWARE("amdgpu/navi10_ce.bin");
-MODULE_FIRMWARE("amdgpu/navi10_pfp.bin");
-MODULE_FIRMWARE("amdgpu/navi10_me.bin");
-MODULE_FIRMWARE("amdgpu/navi10_mec.bin");
-MODULE_FIRMWARE("amdgpu/navi10_mec2.bin");
-MODULE_FIRMWARE("amdgpu/navi10_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/navi14_ce_wks.bin");
-MODULE_FIRMWARE("amdgpu/navi14_pfp_wks.bin");
-MODULE_FIRMWARE("amdgpu/navi14_me_wks.bin");
-MODULE_FIRMWARE("amdgpu/navi14_mec_wks.bin");
-MODULE_FIRMWARE("amdgpu/navi14_mec2_wks.bin");
-MODULE_FIRMWARE("amdgpu/navi14_ce.bin");
-MODULE_FIRMWARE("amdgpu/navi14_pfp.bin");
-MODULE_FIRMWARE("amdgpu/navi14_me.bin");
-MODULE_FIRMWARE("amdgpu/navi14_mec.bin");
-MODULE_FIRMWARE("amdgpu/navi14_mec2.bin");
-MODULE_FIRMWARE("amdgpu/navi14_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/navi12_ce.bin");
-MODULE_FIRMWARE("amdgpu/navi12_pfp.bin");
-MODULE_FIRMWARE("amdgpu/navi12_me.bin");
-MODULE_FIRMWARE("amdgpu/navi12_mec.bin");
-MODULE_FIRMWARE("amdgpu/navi12_mec2.bin");
-MODULE_FIRMWARE("amdgpu/navi12_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_ce.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_pfp.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_me.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_mec.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_mec2.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/navy_flounder_ce.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_pfp.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_me.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_mec.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_mec2.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/vangogh_ce.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_pfp.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_me.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_mec.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_mec2.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_ce.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_pfp.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_me.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_mec.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_mec2.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/beige_goby_ce.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_pfp.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_me.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_mec.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_mec2.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/yellow_carp_ce.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_pfp.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_me.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_mec.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_mec2.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_ce.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_pfp.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_me.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_mec.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_mec2.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_ce.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_pfp.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_me.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_mec.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_mec2.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_ce.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_pfp.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_me.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec2.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_rlc.bin");
-
 static const struct soc15_reg_golden golden_settings_gc_10_1[] =
 {
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCB_HW_CONTROL_4, 0xffffffff, 0x00400014),
@@ -3974,9 +3885,6 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
 
 static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 {
-	const char *chip_name;
-	char fw_name[40];
-	char *wks = "";
 	int err;
 	const struct rlc_firmware_header_v2_0 *rlc_hdr;
 	uint16_t version_major;
@@ -3984,91 +3892,29 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 
 	DRM_DEBUG("\n");
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
-	case IP_VERSION(10, 1, 10):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(10, 1, 1):
-		chip_name = "navi14";
-		if (!(adev->pdev->device == 0x7340 &&
-		      adev->pdev->revision != 0x00))
-			wks = "_wks";
-		break;
-	case IP_VERSION(10, 1, 2):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(10, 3, 0):
-		chip_name = "sienna_cichlid";
-		break;
-	case IP_VERSION(10, 3, 2):
-		chip_name = "navy_flounder";
-		break;
-	case IP_VERSION(10, 3, 1):
-		chip_name = "vangogh";
-		break;
-	case IP_VERSION(10, 3, 4):
-		chip_name = "dimgrey_cavefish";
-		break;
-	case IP_VERSION(10, 3, 5):
-		chip_name = "beige_goby";
-		break;
-	case IP_VERSION(10, 3, 3):
-		chip_name = "yellow_carp";
-		break;
-	case IP_VERSION(10, 3, 6):
-		chip_name = "gc_10_3_6";
-		break;
-	case IP_VERSION(10, 1, 3):
-	case IP_VERSION(10, 1, 4):
-		chip_name = "cyan_skillfish2";
-		break;
-	case IP_VERSION(10, 3, 7):
-		chip_name = "gc_10_3_7";
-		break;
-	default:
-		BUG();
-	}
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.me_fw);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_CE);
 
 	if (!amdgpu_sriov_vf(adev)) {
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-		err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-		if (err)
-			goto out;
 		/* don't check this.  There are apparently firmwares in the wild with
 		 * incorrect size in the header
 		 */
 		err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
 		if (err)
 			dev_dbg(adev->dev,
-				"gfx10: amdgpu_ucode_validate() failed \"%s\"\n",
-				fw_name);
+				"gfx10: amdgpu_ucode_validate() failed\n");
 		rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
 		version_major = le16_to_cpu(rlc_hdr->header.header_version_major);
 		version_minor = le16_to_cpu(rlc_hdr->header.header_version_minor);
@@ -4077,35 +3923,23 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 			goto out;
 	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
-	if (!err) {
-		err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
-		if (err)
-			goto out;
-		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
-		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
-	} else {
-		err = 0;
-		adev->gfx.mec2_fw = NULL;
-	}
+	err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
+	if (err)
+		goto out;
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 
 	gfx_v10_0_check_fw_write_wait(adev);
 out:
 	if (err) {
 		dev_err(adev->dev,
-			"gfx10: Failed to init firmware \"%s\"\n",
-			fw_name);
+			"gfx10: Failed to init firmware\n");
 		release_firmware(adev->gfx.pfp_fw);
 		adev->gfx.pfp_fw = NULL;
 		release_firmware(adev->gfx.me_fw);
-- 
2.34.1

