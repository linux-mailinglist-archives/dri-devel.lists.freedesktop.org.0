Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB56581C2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5650E10E3BD;
	Wed, 28 Dec 2022 16:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D570110E3BA;
 Wed, 28 Dec 2022 16:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX907+Z3Z1ugjzJL8eXPnP/LO8rX+8+ZoMrN+Lb/k9HkGsAwZVmyqdf23pGFAc6bEjtunSELcT1y0Vk43KA1qMr4noXR+8WJwDDBA4zRTpvksBsNs4d+ZP5pZ7wsDQnq6NFhBayjA3mIdt6JKBNmeJCtlsNEG7JkzlNmbUOSqvghUl0ss4lj/c4Gn02Z4QjqVkPabksexq1IEXPT92hDjRIUB+6pSevP+2gMLnyZBSYKONmovJHEqKYJQTnwoYIueLN+6p8cvtkfvZp3XG+z2N7d8VyvEf76GtoZVZg8JKSXr7DDitiffrsmTFIDnGszfqRoCftTB63OlBtLXxEoqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqzjHR50u8col4Qg0Tv77O/+5WqAjV7+m5KHlYTwwXI=;
 b=mgR0J7BxLGXhGrCJ0xA5iFVAFCEVcs7mG7ukKQCC05E789PzzjhOs6aWtIu+6f6w5RRs8LAmicybHQ3MQlpq8poDP+GIwzuoOpu1mbwMWNUbAi6Rwap0K4a3sIFH0B10dgkq9R2xSeizbcyBnPACMxzmGjf4n1I7/0+qG2vEFYUDulAZ21Ea64FdY98S7CJOWlrV5rDzAnWK6NiUhc+yBJElxTNnexFjogz38reCzQNedTWtYd2Pg4wEKu5E/AlAI9ZfW5GOloNTsaGQLLKQ/cnIVxWhSNYLracD8VTV2VCk54i6gvLJh4c34bUS0Ja0OEE0sQJkvcsO+jgevCjUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqzjHR50u8col4Qg0Tv77O/+5WqAjV7+m5KHlYTwwXI=;
 b=acals505G0iqFj6iKZcXK9g31v6+UH6UOTDex+QKSKrq/hXMQjxgJ2qXkPz/UxANQoIrWsytMY/UCV9yAi9gXbBxSXooIq2oepcgOOpO99tTJl0kKgPQRBYJ3uHdk55MpLN9AS1uSEKOHRO7dhMbfE8ocbilXrzlfiMShbwJT1Q=
Received: from MW4PR03CA0311.namprd03.prod.outlook.com (2603:10b6:303:dd::16)
 by BN9PR12MB5163.namprd12.prod.outlook.com (2603:10b6:408:11c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 16:31:18 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::c5) by MW4PR03CA0311.outlook.office365.com
 (2603:10b6:303:dd::16) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.5966.17 via Frontend Transport; Wed, 28 Dec 2022 16:31:17 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:16 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 03/11] drm/amd: Convert SMUv11 microcode init to use
 `amdgpu_ucode_ip_version_decode`
Date: Wed, 28 Dec 2022 10:30:50 -0600
Message-ID: <20221228163102.468-4-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT032:EE_|BN9PR12MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: 2807ebe4-8dd4-4dd2-cc06-08dae8f0f243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TMQffrBDMJCv3B+F9u5Ai2bGKsY4dHokw7s1XH+ByeyNnEVF4x8cneA3P3DvHUVCaDyVg83dhaKWV9XUpZpFUt5DIGIgUUjbzIyco+HietG/7zSns1R0ih/UYSC+Wn7hUkEmR+91peKwnxsxcu2gF93mi6n1c5af2TosmTHMpX+IxNENz2J8MDvAnCCxJe6hxEqkSLaTWdLQK6RgsMBVEo/H7DMXmrbSOfbSEVwITwar8T8UA5dEQwTmOSMgI8husxrLN8YKZq9/ytJShd9xUmNI5oQSiOWeGu7Jdi+o9fpUjrWvfvu+KjIok1oYQjoGEqWS8BfM2b661NP7MUBUN6a6tNwsQbIYYUB+0uBcSemxPp8UV4El0UEhl2ASZv22zSGPmHyAMNCQHSawZoVP9+hgTXCVoyyzeLpqZOfGmzHTBE0Pm+TPNwDFQRtq4S9gFRcskOJdale5c3IVM7O7j5fdebuISc5JwCZ8rmtJgigpgkP0wfcCcuzBcjmRhUadkitHJhbFnWE8e2K9CWOH3wQpakrZ6HVkScyo8ARjqaFFuJWfHbMK686OUOsdf65e4VYQ2wFOCGjtY1GZ2hmpsGJR5/fgDaVTCHk7CLLxrUMUfeWG7EqWw9LUwt6tj3S8zZfrLO7x4gdmBS2ko4MH6p3oqF4lWsOzGWDllUrhHJty/ZNJNob2xkHW8dSzFCJON9jFvsFSAo62wh4i5OPsR8HH8PQlZtViZbns74NIP3RXyWsNXPQBvzEDP2bzCt8uYG8RxLuQTmn/vi0zJnFmRw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(2906002)(70206006)(44832011)(8936002)(186003)(4326008)(70586007)(8676002)(41300700001)(54906003)(316002)(110136005)(356005)(16526019)(7696005)(478600001)(6666004)(82310400005)(40480700001)(336012)(2616005)(83380400001)(36756003)(1076003)(426003)(47076005)(5660300002)(81166007)(82740400003)(26005)(40460700003)(86362001)(36860700001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:17.8952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2807ebe4-8dd4-4dd2-cc06-08dae8f0f243
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5163
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

