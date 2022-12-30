Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298476594E6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874D110E089;
	Fri, 30 Dec 2022 05:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A57010E068;
 Fri, 30 Dec 2022 05:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KezzRisulhMHm7QcJHUvmkaTezli810r73+IJ+qptQyzMHarGR9SpQbqg1BQCQchkX3rf+B09fE99V+NUJda39498nIa1h3eOk+IZbO7uzxtrgTP0Q8T277AuG9NSORVp/1hVCRkxvg983thR4mncEuBSzY9XdQhpwiVZGyD1aDFxghRTfy06x3Fo2VWl8kOJXEY8L27nA5yWRgFs9/JKaliuauOs5qhRL4nFejyMc3n8Qe2aVswOBb5eFpXtQmNFg4F/kEW1y8r5B5oGlrIzVYrTkg2AiocJhr9pm3r2of+sURx5Zz30TquXlxvbnrldAw8aZYn8qcX+rdOVVlEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqzjHR50u8col4Qg0Tv77O/+5WqAjV7+m5KHlYTwwXI=;
 b=VUuSwqc93apaXeCwpantbEeSuBW8WJbtLA5xpZFVDULTBPpMPwW1N4wlpSA/kZf9XL30pZ/c3yPDeWNkMfZuOaZGMv/l49Irc5SYJlbGuVKLX/X2KFbRfGLYkMEv1xHuy4ic4wUzZocq2Cng6yovR4RozC6H+css5Icq87dL5PRtqe/82DURa+v+q+9wOmOiK6odXt+tsTmsJdhKHGxnqprDJ3TaoY3OVNrom/Q0SvE8O6wq2AjJQO5JozwzXCsJos2MYqKpBFU3ORqOrZz1g6MlWTgRAGyLiuurv8kmKEcQOX8251TVsDqCQt/AiIpyj06pTEPilxa7GTyim40/Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqzjHR50u8col4Qg0Tv77O/+5WqAjV7+m5KHlYTwwXI=;
 b=dsgzT/UZVx0oKKFrYNWhOPsSyF0KS9ykG9guT4GDDoMlW3HNOOA8imVyU3HGt685Wb3S0o8jgOfRfyyAMgMvOU9dnCk0YJCf5slbz6/0+WsBaLPJZc+ICC7gzxQfzqSdIyyChW+mcOp3Att15QzIDiJo546ix1ooSypOR/cEjgE=
Received: from MW4PR04CA0292.namprd04.prod.outlook.com (2603:10b6:303:89::27)
 by CH3PR12MB7596.namprd12.prod.outlook.com (2603:10b6:610:14b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 05:21:42 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::1) by MW4PR04CA0292.outlook.office365.com
 (2603:10b6:303:89::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.6 via Frontend Transport; Fri, 30 Dec 2022 05:21:41 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:39 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 03/11] drm/amd: Convert SMUv11 microcode init to use
 `amdgpu_ucode_ip_version_decode`
Date: Thu, 29 Dec 2022 23:21:07 -0600
Message-ID: <20221230052119.15096-4-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT043:EE_|CH3PR12MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: b4eb3d77-078e-4097-1d89-08daea25bc38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LwtjTsAkTOfBoApqNi4OaumOPNIXHJt/KFOAD0eIdAhppJk4wi4yVb6mIZMNZjBSzMyVLL70SEPLWYJ/FsZzgQZaNHT+J7oRZBGflNHNFS1rUFB/NZwh4zFYu3bp/PqFvAAIMG0/G0Trx1gnvC7AabXEhb3x3zOnI2agXAKGhUQV8Wd/H2QJba4r9q+eygl1cgotHpjNZSwNbTZ0pTVoN4AnIxq6tYhY7S5RNHgnKzMyIxOVAYUYuqPvJTjOVXPI4/43S/+qcmKaiMwlOp+SAHBlElk300PelrshlZtyavnD65ck1mjmwlsD3oMcFCD0zJQPADviTVKBtI52aj0ToRKKnFB/rgjC0EX19p0JJAj4fJc9vhG91DeCW5yKo/G06/S6YFZQDbHbX7P2UPSiCpGTZXQYv01CZ/5SLayvoYZBNzLEYFvVFHRrLJrvG+gU25xQScNZFQc7YuugUop0o+5Uqde4Z4flZDU9iXGCE7hd4274Y6s8a3JK4L6xAcGiJy+hOC9j8Cd3GMQfpkK3grTxG+qe2w9ufNVLYXIQZsn14fd6tXZjyLEfRXJR7FfXA6pPB4AoyXamikPTcDLlMQwcC96qM+avKixcACqPul5QnnzTWt/70atop+xDN1yIS6F1SF/UM+gt+FYC6krPPBbSTQcOxayYRmLn32S3z6UNUGKYpaxnc4ISyhTqbbku3AgyS5PM9sVQU4c+Z8NmWZfLTNf3nyWvgm/9DL1Wj7/G7GH91Iw0dq2Th527InwUv4tz0LIYp5Fe6z5wd18ZwA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(426003)(83380400001)(47076005)(86362001)(44832011)(8936002)(5660300002)(41300700001)(82740400003)(40480700001)(40460700003)(6666004)(82310400005)(478600001)(186003)(316002)(1076003)(336012)(16526019)(26005)(2616005)(8676002)(4326008)(7696005)(81166007)(110136005)(54906003)(70586007)(356005)(2906002)(70206006)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:41.7424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4eb3d77-078e-4097-1d89-08daea25bc38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7596
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
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the special casing from SMU v11 code. No intended functional
changes.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
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

