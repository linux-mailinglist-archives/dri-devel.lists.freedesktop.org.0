Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9579265F1F4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA1F10E7B2;
	Thu,  5 Jan 2023 17:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EB810E796;
 Thu,  5 Jan 2023 17:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbKLWVx9PMz4hs/TZTN746ySriHDHZyUDnBZKhvAeYEsFgjK3QUo3dmSMOJTR5YU+CsSvNjhhWIIO8DO5A3bX1jH7feirC3jCB0XdzDAZ7S9a+WWWT4+1Js6Jr/9PlYEjqU8fsJdu2nuKvqWTOPN1PZcoRo2RzaNa+ogGcDME3m8bobhi9MHu2Dfqj0BQatJmmpT1P6prk5EABeNbsQdTSMYNzSxa36OCZH3Y21fC50/+YvWKa5lcJS7qZqnlq9HKyQserh01/g3y2Z73aPqI6nkaBEM1xl3k/LKo1LHgGMAduhyPiccGN1bC0LT13FBCvzTxnARMZ/tgGe/OD5uUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXHXobqIrNHxfwgyjbdJKj6JNNT/BgvSNFG2dkGFj8Q=;
 b=IUXjyQrGte27SKzd++zWeyOxf28awIJx2AAz++SR/dOjZfuh4/dE/GDgtatRgNzlZfrBOiegzYyyY7uW1y4J63NV+t/vPxxI6xSTyQCTdkJLcM9kum8AUF1Z0z3d3GexMH+pMv2jlW+ioa+5gsMG4O0RbZMnwAAVS1hEhjYqDpnWvQY0p5uEELCuJX0Y3MdDG3egN//eAfH6PcUAzRfKGd/tDjAuGZlarrtDVt1NwwW2gBiZWpfa9Ndh9Ug9dPDkCdm++AkPWVv6mn7lhstpLVyNwfD23cEa2ridWDSYAhKHg+szVEhbwIo8o4mfX4bBaw+P6dUfhiU6mlLMrUNieA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXHXobqIrNHxfwgyjbdJKj6JNNT/BgvSNFG2dkGFj8Q=;
 b=KFO4FNrfwTFPxzSfPrCEhXCZI6omZkYRJybbjxLU08EQj0z3nl36sFoNWmUvLH5gH8iSIl3qsx3HkRkV+PMBho7a1IlTa2NLHVA8g3o0TP58+VsCmM5FlAu0FvcvPVmk7c5cF9d2enqafmEMmsw3ozAHidp+mGpAjsN4n95jncA=
Received: from BN9PR03CA0978.namprd03.prod.outlook.com (2603:10b6:408:109::23)
 by MW4PR12MB7309.namprd12.prod.outlook.com (2603:10b6:303:22f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:40 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::83) by BN9PR03CA0978.outlook.office365.com
 (2603:10b6:408:109::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:39 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:33 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 28/45] drm/amd: Optimize SRIOV switch/case for PSP
 microcode load
Date: Thu, 5 Jan 2023 11:01:14 -0600
Message-ID: <20230105170138.717-29-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105170138.717-1-mario.limonciello@amd.com>
References: <20230105170138.717-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|MW4PR12MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1f0c55-2da1-4169-e1d9-08daef3ea731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pl6J/NHz9HO5J9zJ5MzkbjPv9SVoKZCGe7tT+eSO0fBd8uWggq9+7PiNkxCL4cpLJ5h0yPeNKFWJZoFkahpcMGqnNbWRiCnZIDjWKT9BncS1nvaoQmm+8Qcs0sLL4DfmACslSAzNeA/0QCPtCwCAHt+JS1nbhSdiIO2x07iy9KrodbMxQn4OyZBGeWAQAat7vrb0xmLhaYcQ3mIF0KOEkysdNqMnrh6Q571CdpXCnbJwUsSC1ZwnduzguNHSSnhqUt8+FvOFmI8ZlN6Clj4db5kYXcLcod4EtrUd+8ZhmShbmsHWnZkiDGOYPNPS9f11gc/RpgDdSIc9ztect/7NpLfAF+VrdLxifECfn8i+qkcEI0sJMkDH6n5zkaT+p2u26TMqV/zNVsO9b2vQTy4qnnVx7NPw00CJfQXJv5trQMKl6nr1qqrfFeGQMSQuqJcP4oumLDd1vkZKM0oQ0iMyko8eKT+eMLH1DoOv/I5LdoYxOhGBRzoGHUP8LWI/YGG519f6fWXtdXsJ/zITQ6sSpRdyobVRFqR2NYlAByyicuCZbAdzapyRF6QFo/FnpIY+U6aaft7ChzV41gkp2aNnHt/kmRAodyIH33AvNdewlLaf3Guye4LqMmXzCPc/V0Jv0pM+B3lZYOVPYb5e2X8f/vJR+JYL5EX0OK5mA9kALdzo1VB5pFmPtrp7ZD19zkue4Ya8QvDAdfbPxX+09GoKRgPWzCBe5peUyR5pJDmwdsU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(8936002)(41300700001)(5660300002)(8676002)(70586007)(54906003)(110136005)(2906002)(4326008)(7696005)(70206006)(316002)(6666004)(478600001)(47076005)(336012)(86362001)(426003)(44832011)(26005)(186003)(83380400001)(16526019)(2616005)(36756003)(82740400003)(81166007)(40480700001)(356005)(1076003)(40460700003)(36860700001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:39.7952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1f0c55-2da1-4169-e1d9-08daef3ea731
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7309
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

Now that IP version decoding is used, a number of case statements
can be combined.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index aae76acc38e5..706cce2edfaa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -132,14 +132,8 @@ static int psp_init_sriov_microcode(struct psp_context *psp)
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(9, 0, 0):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, ucode_prefix);
-		break;
-	case IP_VERSION(11, 0, 9):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, ucode_prefix);
-		break;
 	case IP_VERSION(11, 0, 7):
+	case IP_VERSION(11, 0, 9):
 		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
 		ret = psp_init_cap_microcode(psp, ucode_prefix);
 		break;
-- 
2.34.1

