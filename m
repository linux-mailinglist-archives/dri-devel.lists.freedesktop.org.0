Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DEA65E3BA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB19510E63D;
	Thu,  5 Jan 2023 03:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F32210E63B;
 Thu,  5 Jan 2023 03:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTkh25W/EeCOs4D3COTrvgNZdkDnclT5Rr4/kKm1Fj6THnDNqYC3K7oikygXB2j0vd9NMm/lJOXca8ZPlunaYBL4yOzeBb+wwpLcBGYZs0om8HU8NMoq8HQiKtzvpJbok+bX3tVskWJ45bpQUBdHEOdeCraz+nh8CLx668w1ZMMEpWeJWluzFUAmxdyme1lrp/ga8iddmCpC0ki5i2WZqYiRcGUGtkRuVVh5HzsppC6f9MYuC0En14G5fmEXkTBwW8RPfaZc94rIN7fuuDmQv1dJHJ44NbHfrIVlCZkUORpXmdYv90lGq2g0tBRFmjICs6FzT6CTzw6YdxzamrhdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/CUXZY3ymKw/py62nchby0/C4zszkm2EC1eX4SaeyA=;
 b=iVk0uKZzg0GcfqbBiK+DLJUb/poah6H4GOZXh3tPJBxJI2IkXMrBTGuvrzHiRxyCN2018IVdaTjemJ/ECTcW2FFavZ2N3JBKGXXHuFNvLronAIYa2kgX5vTNi6c6hvYv75/2vYQOnH8ysYjtKAja7MiMkKPviYlbsQ7pWz3vXvANRzGo1P6CafpCTM052613NwCJmj5WFYuuKZsJ6NJPwzwJGtOSer/K7w+LJuG6vjaOERP+3N+38aA0QK84wQoXofx0OAILem0yWmctO+Ry6AOqv8WQwhka7HszsyQzXf+U3XBij+AwcqOELFLiZnJ8QfEzYaFdgiQGqH04CXKH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/CUXZY3ymKw/py62nchby0/C4zszkm2EC1eX4SaeyA=;
 b=qrmv1oTlOnYUIG8mRJX0nDLEKjCedzrzWhHaGzVCnXIj6emSXS4q1wP/CnDKgOMB/5iW7aODBxsgPwDMFHD1wYEaW0hs2FU4zlpwdxHgQa7KpZrE+PcdsqwWm1aKIu76QMJ+Kct6USah5fft9VT6DNlugIokqZJniNWbYE5kNi4=
Received: from BN9PR03CA0759.namprd03.prod.outlook.com (2603:10b6:408:13a::14)
 by DS0PR12MB7510.namprd12.prod.outlook.com (2603:10b6:8:132::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:43:56 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::1d) by BN9PR03CA0759.outlook.office365.com
 (2603:10b6:408:13a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:43:56 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:43:54 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 03/45] drm/amd: Convert SMUv11 microcode to use
 `amdgpu_ucode_ip_version_decode`
Date: Wed, 4 Jan 2023 21:42:37 -0600
Message-ID: <20230105034327.1439-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT068:EE_|DS0PR12MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ea90c0-f5ea-4b07-85af-08daeecf12af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X+X7vTkwL1BGkXNOkUhcBbLBl8HIB8xHH5+SbEX41+zsCsS6wWpgG3Upn24RvsV1LLrOyk+m36rxZE6MsG522FdyUUWXckH4aBG3guOsziTYij5vOnQ9TAOochsF/SpXhPcNCFMoLvEYzx0CeNkhf5n2ZiQVy9Ymo9DXcTygyRNM0FycJt6c4oKcXfjyqw4kzzlkJTk5G57wuhnaFLPnZRxW6tc0ilEW8tI+9VKnp723JswYmwwUK7at/vQpRDLhxcPaUoEZhCxdG7j7UoMhG0rHV3RH4X+Lq8LFOWli9rWGQD4kSUa8yKatyh7QxOr/oU9fP5iJLrgycKxKTK6rzqfG5F4wUCCe+QY7WjYnzjI+crAphpi+48gv8/xoUMxdxU8vDLUzGgZ7LJOEAIFFqbObvfSn+kGCYnETScP1XTlQUMMp2ZHcuzw6YJIJ9eKlbeVu3mnB94t3gsojkHcV9g70zH4JAwgte/B48Wu/KSCAvD+j7AUYcYEBGUENE+2NjKSNHYfLET0SO2vegYVVpG+3RdzPcZH7USIXu6xBgdA5UnF0frsU5gJa6S/85hQXncA8AwyUzpSND6P13wU+LC+wD/WAHa4MHuji3DVap/7rO+c04wcC8PfjdcaNghlXqhC64Zd+7I8/nSvYCzMw2y6JdMATr1lqvBZIJuaF1zqd6S86ZB0NA/AUIdIQa6hwKVNYLEi/anVeG/aDQKGGEhJMGBzWSh/FKMRbAUIGty+Xve3diDNurCM4o/QbdVESMgqTcQlEjglwm0gQLNHNsg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(54906003)(186003)(26005)(1076003)(110136005)(6666004)(70206006)(478600001)(2616005)(16526019)(4326008)(83380400001)(336012)(44832011)(8676002)(66574015)(8936002)(426003)(5660300002)(47076005)(41300700001)(2906002)(316002)(70586007)(36860700001)(82740400003)(40480700001)(356005)(81166007)(40460700003)(86362001)(7696005)(36756003)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:43:56.5167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ea90c0-f5ea-4b07-85af-08daeecf12af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7510
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
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
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

