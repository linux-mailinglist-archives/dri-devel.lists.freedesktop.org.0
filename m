Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F1165DA65
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E74C10E58B;
	Wed,  4 Jan 2023 16:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D91010E57F;
 Wed,  4 Jan 2023 16:44:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNyi38S95ASyRSDLC7KpABoPgtKDkCtjlxZp/1r6cQDvwjriWon/Q4lyvbLu5kmg5x/ICMcXLhPA+LIlciI1iTn92cKRZ7zibTdVCNbzZZ9oHjQrgYq5AFQIe0CBb5YhJKIdEK6KY11gfv1vgX1aFJnLeoJwCUy894CyqeV/mEDekEgMK43VAtcumpi0GiWg8r+vvvXZPYgr5JW0rSQmv+AJUy9kOh7RKklF1gkBaYK7xI8M9yMrNJ4qyUWQqfmtD3W5tlozmeTbe/zE2NiHkIApxjHE9xs5Vq+dxOMqY5+s4WBrpiydm/avfgddWD9FLyzR/vzXISsmvBVvk0V7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wf93+5M97FMm0151DXNABEff4+vT8JxlCz2YYKAhjQw=;
 b=A/H9koYWMev226u15Wa6zO6vk+FZhh0Z/F3hp6NIkRoQcBneScULWa7gWGtSu+bMj+xrh4qvW6zHleweVxSRsB+4OxAepwZi5rc5SqiRK4LS19CW3P5fZmOw2fqQj0HX86D+UPkLgq4CJrGG3BmpXRLNbBsI54l0WPaDou40Sto8wwJypn9Q+kSKMy3F7xXWZDVO2Ma8ZRxEqTCU0g253RAB3kevk4D4mPehC+D/FweEq4HH0vye73zRLpBLKpiAmnzc/rvnclcfSbiOcF7ype98eQlW5UROIizGA4g9N3F0j5KdjqjCuwMFxYnTjiWISiMHxR7e9PyGmIueE87VDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf93+5M97FMm0151DXNABEff4+vT8JxlCz2YYKAhjQw=;
 b=AxidPZmU/iwxZjGlatzVlngoavK1RUoF3MoWiZ3BMLAyoF/gapNZBom8Kn2efj5qi2L2oPvuCkCvpaS97SYNqL/s73pGRB6lSeeODRSPKOKr3uIE+QOi2GMMYw7fiHcKozDqBM2AYhoJXjgq7bGfYXB9zqk/fx9Q67Hx+SGOULs=
Received: from MN2PR14CA0004.namprd14.prod.outlook.com (2603:10b6:208:23e::9)
 by DS7PR12MB8420.namprd12.prod.outlook.com (2603:10b6:8:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:26 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::ad) by MN2PR14CA0004.outlook.office365.com
 (2603:10b6:208:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:53 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:08 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 25/45] drm/amd: Use `amdgpu_ucode_release` helper for DMUB
Date: Wed, 4 Jan 2023 10:40:14 -0600
Message-ID: <20230104164042.30271-26-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|DS7PR12MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: a422a66b-d03d-4d30-bcad-08daee72f14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RUFMVBFtWiCbnl0OIx91Hn2/Rg8NOGJ/4s4/hvWbk6xART4AdyuXE23zcAfWV2xtf324eydn6aWMDOPSxETpHnpvXGFD9wOPOp+wbVSQ8kBMyR2ZbS3/T41JGMQcEJQbZMgkSDD0rp0PRyii/FRsZw4qLK9uTbTkYETZNnMUkFISGayF8bPWaDcrUJWoe50shBR1n9eoEyCEXSAURjfK0ELrR5tcRnw5cYVdaTpurTXOkYUKmb0jFYS43XjYma9uNOYxFCYC1Mtfn4aljojzylFWhCX1XBRATrPN6i2nufYeBV3yDj9a6Pk+6lXWC8mhii98AKvqIkM30RklK7ncSDisQrhRxg34HbspFtpzmSSArRqLwEJeVkcckkgSeT5BzrLcnPce+H9Lnxz+yiS/X0LXnk5+w4u9T2etiJvMRoMr68zet+fYyn53pkhNgOg/Ki2qCbC+BXi17r49PHU9qqAeZh8ixZ3deVTm8yAkb6rPmuYu7xQXfn/NBXVaFeZWfaqGYL5g9V/oPghL3XKGJ7usSnahVEWpRlSZaQ8e9fXxdz4WXeV0pu8liqd3MxtTm0NGRpj/89W0w/ANHX3SLewOU923H+PAY9UocutZU+DarJ2OIyNThv1go/nXSCLHDZTH8GDw4MtEmVRysgo0W2sy1f+fVxXAIK2GlZd+yHhYxLWW4z3Wg+dc/7cZ7UOfPOApsAwmOg8k0j9A4rtRajs4i7d9TtstfpP3OjiLxYzfsJEmR3ECzuzuzaGN9CG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(8936002)(4326008)(70206006)(5660300002)(70586007)(8676002)(2906002)(44832011)(41300700001)(54906003)(316002)(478600001)(36860700001)(82310400005)(110136005)(36756003)(6666004)(26005)(426003)(1076003)(83380400001)(186003)(2616005)(47076005)(16526019)(7696005)(82740400003)(356005)(40480700001)(86362001)(40460700003)(336012)(81166007)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:53.0576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a422a66b-d03d-4d30-bcad-08daee72f14a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8420
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

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c8c5d37c8b3a..3908d715b90b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1898,8 +1898,7 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
 	if (r) {
 		dev_err(adev->dev, "amdgpu_dm: Can't validate firmware \"%s\"\n",
 			fw_name_dmcu);
-		release_firmware(adev->dm.fw_dmcu);
-		adev->dm.fw_dmcu = NULL;
+		amdgpu_ucode_release(adev->dm.fw_dmcu);
 		return r;
 	}
 
@@ -2113,11 +2112,8 @@ static int dm_sw_fini(void *handle)
 		adev->dm.dmub_srv = NULL;
 	}
 
-	release_firmware(adev->dm.dmub_fw);
-	adev->dm.dmub_fw = NULL;
-
-	release_firmware(adev->dm.fw_dmcu);
-	adev->dm.fw_dmcu = NULL;
+	amdgpu_ucode_release(adev->dm.dmub_fw);
+	amdgpu_ucode_release(adev->dm.fw_dmcu);
 
 	return 0;
 }
-- 
2.34.1

