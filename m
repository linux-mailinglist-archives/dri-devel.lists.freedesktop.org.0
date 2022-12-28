Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA66581E6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526DC10E3C6;
	Wed, 28 Dec 2022 16:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2054.outbound.protection.outlook.com [40.107.212.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE1710E3BF;
 Wed, 28 Dec 2022 16:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFcVf8mP2vYVgHIYz2siCv664v8wBKaW75nUtCXw/LD7o3wa8o/xYrbL1h8zEgpAc+0JaR5VEu4zFrqh+M1SCbKmzT6sUbjslNMtd7Be3Mq/I2mcbgx8xyxvBWEoaKgElSdZiDVJpFWIJSF61bd7PllbaoV/YG8UoVwRC/G/iWNEH6CjjU2xPPdRZVdbiNAT5QPvmNI8RAVFhpoX3zR4sjq8Ft29Aj/x9zieE9znoa1OoV5w1NuwFBUXTbHqsqKP6XT5wz09eGF8/4d7LVhZiFLMwH/3MDZCoaYU2Vjcm8WLH6EWVEx09E3BcspcixMK2v6j9TybZ/8i9Ibbp//SSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3GL0paU87hRS/S6bgC6IDYc3yevwT801eQ1IB0nLog=;
 b=HWZJIIWO7ligvFwipf60ILeWhBcb+HgfAVE87rIr4YElGw5I2aoiLVGKexXldn2TMaP0W5X0GWKKGEmVPlxu4HcrAvlKNbqkxldU0Zverkw0XrXI2itlrg6zbUQAyU2iS+ua8OzokXfRYQwtq5OGRvZMw965HSYtDQ1lXnYNFeSFVbv/h4sY0WZTZ6fh4wGhCCJyxHQ4X1V0/XhiYMv3Hs/K9FTCpJ3T+O8s3JBR6RDqZXcU9smTymY0+Bi8KfDu+KjloxCYK9SSwAZFfdbqkdLKotX+xQ2zDZ+EmX7TZU+6gsU/Zg8raBiCiHdVRG2uMZC81JjFv1HuVzS3WJkzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3GL0paU87hRS/S6bgC6IDYc3yevwT801eQ1IB0nLog=;
 b=yC60Xo3CW1j77ic0G3YYGNMX3ZJaElczcTtI4BM8ADaTIEpCugCkOyg1zeU8zZW3SLC10XPLa/GNl6oLAigy8N4kusdY1wD4keI0JVlsqY6tCc7bYI3Sw/hnLcqcucRNSMNBxsbOCNXS8sxzt5qA29xtIUrfu73Fc392DvdAvSM=
Received: from MW4PR03CA0313.namprd03.prod.outlook.com (2603:10b6:303:dd::18)
 by PH7PR12MB7793.namprd12.prod.outlook.com (2603:10b6:510:270::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 16:31:19 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::42) by MW4PR03CA0313.outlook.office365.com
 (2603:10b6:303:dd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17 via Frontend
 Transport; Wed, 28 Dec 2022 16:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Wed, 28 Dec 2022 16:31:18 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:17 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 04/11] drm/amd: Convert SMU v13 to use
 `amdgpu_ucode_ip_version_decode`
Date: Wed, 28 Dec 2022 10:30:51 -0600
Message-ID: <20221228163102.468-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228163102.468-1-mario.limonciello@amd.com>
References: <20221228163102.468-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT032:EE_|PH7PR12MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: d257e1eb-1dd2-4988-61e5-08dae8f0f2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTeX78KNjYhb0hh9/FIvJ2wBhFlSH9WASdilNmnwUSz+MzndRjvA6YlT5/W0bSx2XF3aH01XoqYoUzYw5EC/+L9dx+lPf+N2IscO33fbmw59ZMlCKvXCwHkAvBqupsj91YhyQ6mzRR/IBWA4Wa2tN2Xou+LFFL9KGjJeIN6DBfRzURaz3BuswkaERaGBXVMwZi/lZeYpiZ+iifFp2U49rVeZ0O5FQvggES3oXxL6s4xxT4mQw+z3gUhOukfH80PyEtlnzw/nRb2tSkNTvfNoQ7J+qAOmPTbk1u4Aa2dLbjA4vavqJ9WyirLRktLyUNRfpZyTlSyP/Ns8rn5M1rKONdcA/JOM7ZulRS6BVS3LW/HGec2Xm2snJqoHbNpo6s32nLD3z9eqFUXdqLr/LjlRefM51wQUWhi3/nh01X1DpckyKSFo/zYoYw46naigVwOC1JsxAwu3PpdwEKoiIgtIhVSaBjuV87EHYp3+Zc9MGZ7nXAXX1Q4QvSqFoOp1HPLM/RsXqVviKPdtwDna9r/9VeljmceWcNRHwxrvfceksdrxUcugoTgaA7+pOtjW7PoioGDW5RckgRYWu/0OsW5AtOV13LYBnnT38tccz7EKh0pkwTRO4Kk0w2NMfKejWkEDhIxugq4J416mEEpk8f5hLwbL5hav6x5t23ix2X2OQOzxc17svotSUvxMmJqN7m+V1LzIkfUNlrXrXtF2zsizUR2EPJXkFmcY9lV0jv5KZd5921+iQK/Tn2JC0Ec7J8LvZQOzknkVxDZr7FQZkTTVQA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(26005)(186003)(40480700001)(81166007)(356005)(54906003)(478600001)(86362001)(16526019)(82310400005)(316002)(36756003)(110136005)(41300700001)(7696005)(2906002)(8936002)(47076005)(44832011)(5660300002)(83380400001)(6666004)(40460700003)(70206006)(8676002)(70586007)(4326008)(2616005)(1076003)(36860700001)(336012)(426003)(82740400003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:18.7076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d257e1eb-1dd2-4988-61e5-08dae8f0f2bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7793
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The special case for the one dGPU has been moved into
`amdgpu_ucode_ip_version_decode`, so simplify this code.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 0ac9cac805f9..506a49a4b425 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -88,7 +88,6 @@ static const int link_speed[] = {25, 50, 80, 160};
 int smu_v13_0_init_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-	const char *chip_name;
 	char fw_name[30];
 	char ucode_prefix[30];
 	int err = 0;
@@ -100,16 +99,9 @@ int smu_v13_0_init_microcode(struct smu_context *smu)
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
-	case IP_VERSION(13, 0, 2):
-		chip_name = "aldebaran_smc";
-		break;
-	default:
-		amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
-		chip_name = ucode_prefix;
-	}
+	amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
 	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
 	if (err)
-- 
2.34.1

