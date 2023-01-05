Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21FA65F205
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769EC10E797;
	Thu,  5 Jan 2023 17:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0F810E7BA;
 Thu,  5 Jan 2023 17:02:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSlGL1eb9vGMAtUuPy2mA0LuUg3XYntR3yWAriRmTIwoXJlizHbGpXMYj5tHFMZDpFeCrPdWiie+IY6mLWq5oF9b4vTp5tmCCStAsDD+zumQDuETZpHBUhPEctc11vZsPFWjI/xhhWUi2O95llbnshpjvQfrkJZdlVWGSviHL0DZ4Ev6Wzm109TLc0LoAlvFJulHlTJZHTgHlaGelHb/BEzPXW7cocXg7DA73g4SUTA1o206I050vcLfOk69hWTca481Q/l6XPrb9hpclZNCaD1L00d+7cZdlxQfWflagUkxSqoanx5lh+O5sece/02WvD7Ar21tMuINaUX7xnUYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1pwPFsYyJ2Etq+d42jFE8DbYc+NuAH9kNmF55hK1yY=;
 b=AlydKcu4xd3MakzFZzLrKuKDrnlO1ycTxRshdYtbltfovAgRhOd0haEfliX/QneiJiVxVa170iNbl/evkHMFoT5i6npc0UBMCLb9PxdnbXojUElJZVWLPs2Qgxtev4SE+CUEM44iKjdtIYAt9nkMgFu3En6Op4+X2oNP82Krv226O4yl/DVn3n6B0R0aI89BZDbTXzOVotl7avsDwTXeVmzTWJ58sKb1GXFlbYAEsyPjWJb9wf9OnX4p9GA0AWKB7WjAejdZa+m/pEQuxa63aJYWCxDFaTGzpB5zwAVlmrYVee/DMpebkseN9DUk3w4b5lDymgm/BKGH7o7e6Hd9OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1pwPFsYyJ2Etq+d42jFE8DbYc+NuAH9kNmF55hK1yY=;
 b=dkUgW2k4Apcb1k8SIBW7il9/+1xyA22X+CxhDSLPRluOZP9JeNq0N0+izn+BkTgnOSJ+OZhM0Iy6tkvb83DAe7KsBn6zADjNWm1DcTbG4gOfDSwHBC5dC+/UuWejNcRqzGvFVYrAU1xqoOZPxexOOnY1ElQLPq+oWQLDucOYNr4=
Received: from BN9PR03CA0162.namprd03.prod.outlook.com (2603:10b6:408:f4::17)
 by DS7PR12MB5790.namprd12.prod.outlook.com (2603:10b6:8:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:57 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::d5) by BN9PR03CA0162.outlook.office365.com
 (2603:10b6:408:f4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:57 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:53 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 44/45] drm/amd: Use `amdgpu_ucode_release` helper for si
Date: Thu, 5 Jan 2023 11:01:30 -0600
Message-ID: <20230105170138.717-45-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT014:EE_|DS7PR12MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2c82b6-61dd-485f-0979-08daef3eb1dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SyG7DJ7Uy3NAWA9mboqmnDTR4GuFqqSUqAUxySv6TntWEBkyAa+FaAGW5QNkcwNt57My7VM6M1b0UAgcCDc38ACPZJguBKEsHwLuwYiiF1KrdHz6idWfnV++Ff/zwaOMpd01sUkyHtBoLjI2Bxsr+yMyTXkeLqPZEzQJ0x83w/6VVkDt8jSKbzcaGvlUiMDXFlkwIauRT0d9W8VNugHYMfVXGv3+Xp/IjyoVsAERTHkN2f0QKurzZgD7IGL0uGpl25a3RNz/5hZLNaOh502qJ3zm+dGF9TtFaxSNF1QvUfnXPrvizI56ztA163p1UIewkrkaAoBgg0Y/BHgAhNmusS5DFXTRl/3sltqTuz+1Y0/EDKntr3MLknQio8QiwheHgY55NYsEBryGBW4hQwwxhpOg3iRs1f2VHROzLGjmIFEUz7ZTbVAMFTTpZD7tbF1/hZ5dMfgzPJAcvQRNLCRsxMkf817TQ9+Tprlx/MYfc4NPu+ypmIOeRhbqrgd6qvXgExjkIRGV6eJ7VePB2dHvhzRcUlNsXl7o0xYFtEiN3ktFK6YVR8TQxMfrqEm6j8sjSSkx+rEkoGisUCkj1MCUTlA8dcmbkKNhj1F00sytJyKySYGLF1BbyEM5lu7IBl/PI1uukxUYyhCA9kNUKc0mOvlos2IhkqnzTljQsL9QpJUCG42pqEOUlGAQAkNOZSivv98T3AT2MYBCfpHvcTq52Jhbto1deFrhvQ1IThlMkvfv+opQrwcslkf2b1Ov6vA3SbKTB2eHS9p3uUeqRJ5CGg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(356005)(44832011)(47076005)(5660300002)(8936002)(2906002)(426003)(36860700001)(83380400001)(41300700001)(86362001)(82310400005)(40480700001)(82740400003)(36756003)(40460700003)(54906003)(186003)(81166007)(26005)(110136005)(16526019)(6666004)(316002)(478600001)(7696005)(8676002)(2616005)(4326008)(70206006)(1076003)(70586007)(336012)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:57.6941 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2c82b6-61dd-485f-0979-08daef3eb1dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5790
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
 Carlos Soriano Sanchez <csoriano@redhat.com>, Evan Quan <evan.quan@amd.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `amdgpu_ucode_release` helper is replacing all calls
to release_firmware.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 49c398ec0aaf..d6d9e3b1b2c0 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7714,20 +7714,13 @@ static int si_dpm_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_smc.bin", chip_name);
-	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->pm.fw);
-
-out:
+	err = amdgpu_ucode_request(adev, &adev->pm.fw, fw_name);
 	if (err) {
 		DRM_ERROR("si_smc: Failed to load firmware. err = %d\"%s\"\n",
 			  err, fw_name);
-		release_firmware(adev->pm.fw);
-		adev->pm.fw = NULL;
+		amdgpu_ucode_release(&adev->pm.fw);
 	}
 	return err;
-
 }
 
 static int si_dpm_sw_init(void *handle)
-- 
2.34.1

