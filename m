Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046DA65C949
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E5D10E273;
	Tue,  3 Jan 2023 22:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C0C10E234;
 Tue,  3 Jan 2023 22:19:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lspqocApMiiH5Tui1ieyPDHY7OxRsRtGb8r66molBNxcoiSsugwAGjo712fDgJ4UOfffuQbbUjTHwW/aAIwXSpTtlMNh+yvgYhuXgsJC/A+DHdgX+1il905ipfeGOr0ml2qn0rKKrJVeVL8+JPnJ2W3y5p37DmetUr7wk6uJkXa+0EUGvRyRstrKc/W49R+0MeWsvIHg9QIsCJTx2poUyXncuXKrS3+WuXVMNdkRNzTYe3YGZvIG/oaPR/6JkamAXg/xBbR+XF9W8gfp43796emDUS56xCm5ICi/iKIhVUt06KUeEuRiw1mSoDM5IOdIiHMhMAEFMSsK2K3CwZxVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4VCws/yUIWHH8mzjzJpCMfQ6g7vtLh4Nisn4/ZZO7E=;
 b=a3DgmzvS4d0rDlux0/TFTI4rGbZQtLcWvNWfNba0vVDlvTOrjKhYpPnE+q0xCNgb8axgVE892P4zPusLiuC9q+J3EB9BdtKBoVXOLDPI55yg5H1oopzwiAmirLSJZqW7i0fbYuR/q/D59edfjA40KaVkyJ0ns3hmXS9XAgQrkqzNXoxgj+YMjD/2PXK2x9b3ZsiKmG9HxszLerZlbYEwyNRUXk0vHwCTjqFvOu5xcqUrPDtLeQWZcJ76aK3GWLpyVlbyZ9YZdcoSDMmJ9snT2nC/MY2/aeVc6NC1EhvHoEbJpgAiM0swE7cSB6JXume+e4m70qPBw8SGVLkWUFumkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4VCws/yUIWHH8mzjzJpCMfQ6g7vtLh4Nisn4/ZZO7E=;
 b=sk5KvTeHN/4E5kpQOHZiEt8oeKW+2mUe+LAKg1o0gBSfJXWGu8+D5JqgI5xQ5l0z5iwUJ3h6jpVjygklFHcVF/R5n7/efuU7KvxeFzADYcZpPcCa+dDjLEOTLCJJ/+LS3bN8sD441nK71tNpTwZ124gDHwHQtfcQlN6Q65i0iQA=
Received: from DS7PR03CA0360.namprd03.prod.outlook.com (2603:10b6:8:55::33) by
 MW4PR12MB6683.namprd12.prod.outlook.com (2603:10b6:303:1e2::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 22:19:30 +0000
Received: from DS1PEPF0000E653.namprd02.prod.outlook.com
 (2603:10b6:8:55:cafe::96) by DS7PR03CA0360.outlook.office365.com
 (2603:10b6:8:55::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E653.mail.protection.outlook.com (10.167.18.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:30 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:29 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 03/27] drm/amd: Convert SMUv11 microcode to use
 `amdgpu_ucode_ip_version_decode`
Date: Tue, 3 Jan 2023 16:18:22 -0600
Message-ID: <20230103221852.22813-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E653:EE_|MW4PR12MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a08c0b-da36-4ca1-a4be-08daedd8957b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t0IgqVc6xa9VEwVMNYTR/PZZ8zbu9FYzM6eyzOfPVQMNlONOFpAxrgdyorNAhrDIqKaJ+D2Q4zQKySJAd2a+GAyQtycfyXHNkLJKTtIbpZTnTKbw4dtoDQht45QaMvL+PbIrZrfJpzfVQTOc0cG8Zbr4ustttEo2gTooMFdg+IIv2GsofIKgt8DOd9Tk5muO9F3rhCPAN6YxMKTXFb9YbgtJoprVlKKVla8UtKIsaRq1fBVpLL/B4uii36L/PjjQKAbn6aBuzYfAQbIxyoyNcNIjG6lfKNOn7H1HF3DEVbkn2RkO8SAmOtNL0ihb2RmBqUyjcWM9VMi+VbPzBZl00xBComf9uUeRN3vmCyH/kwu1c23b/fRzWp8yF9g1bzem22ymvwbWTuAsjKN9KSp630mA109qBzS+MCshHt1II/VhBxkrRWQ650WrOT+EbeENbrQFt8hX0AnpuQlfhT99SkNDSOibM0LQ9Rpv/N+6oRTm4La/Gr879O420g5Q9fzcZq35UczsyzKrLtPcD0anWRSUD64Wm4AAf7Ji2owOkTczzBqle7zSpOZNYs0SL66bugjF9tpdU/fgjhzTS0NVJ1BYzaP3JTITOKNFArNVxG4F+U6OH7UuHq32rloAeZf/myFbylQ69Fup8OhqS83sN1NLe2CtEj5ML2ZWWpnVZpMgY5BnrxPVnG/VoivA4saH1IljuiseNRxly30baxIfnPTCNEWnw2I9ECgqkLqwbjjoORWdlZddsxTo4FNRveK46UePH3Btl+BgEs17OEfCvdMmgpolAIWJfPLHduTGtIE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(426003)(47076005)(16526019)(66574015)(26005)(1076003)(186003)(2616005)(82740400003)(81166007)(336012)(356005)(86362001)(83380400001)(82310400005)(36756003)(36860700001)(44832011)(40480700001)(41300700001)(8936002)(70206006)(8676002)(4326008)(40460700003)(5660300002)(70586007)(316002)(6666004)(478600001)(54906003)(7696005)(2906002)(110136005)(22166009)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:30.2348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a08c0b-da36-4ca1-a4be-08daedd8957b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E653.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6683
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
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the special casing from SMU v11 code. No intended functional
changes.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
v3->v4:
 * No changes
---
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    | 35 ++-----------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index ad66d57aa102..d4756bd30830 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -93,7 +93,7 @@ static void smu_v11_0_poll_baco_exit(struct smu_context *smu)
 int smu_v11_0_init_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-	const char *chip_name;
+	char ucode_prefix[30];
 	char fw_name[SMU_FW_NAME_LEN];
 	int err = 0;
 	const struct smc_firmware_header_v1_0 *hdr;
@@ -105,38 +105,9 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
 	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7))))
 		return 0;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
-	case IP_VERSION(11, 0, 0):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(11, 0, 5):
-		chip_name = "navi14";
-		break;
-	case IP_VERSION(11, 0, 9):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(11, 0, 7):
-		chip_name = "sienna_cichlid";
-		break;
-	case IP_VERSION(11, 0, 11):
-		chip_name = "navy_flounder";
-		break;
-	case IP_VERSION(11, 0, 12):
-		chip_name = "dimgrey_cavefish";
-		break;
-	case IP_VERSION(11, 0, 13):
-		chip_name = "beige_goby";
-		break;
-	case IP_VERSION(11, 0, 2):
-		chip_name = "arcturus";
-		break;
-	default:
-		dev_err(adev->dev, "Unsupported IP version 0x%x\n",
-			adev->ip_versions[MP1_HWIP][0]);
-		return -EINVAL;
-	}
+	amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_smc.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
 	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
 	if (err)
-- 
2.34.1

