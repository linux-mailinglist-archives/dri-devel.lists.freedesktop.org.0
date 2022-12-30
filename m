Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7B6594DC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC58710E080;
	Fri, 30 Dec 2022 05:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F1010E057;
 Fri, 30 Dec 2022 05:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVwv79C/GPe8a+rPyPQGPBvL1OOeVtQ+k79EAoCQ2YFTsDprYPRExXh6lWsK3evD8zti4h+LtisGWCgG3Xlti7ofNwcKALVn17X3emJcBqdvsofNXuqj7Urzy2g7lRtcaMhC9FkkIKY/01kuBSsJgdoWA7WL/8E623A5oT5ZHsmNTch4QggHq5Nkf7grEMrDzU6/FO66Cw4IimyYtjgbVoG7klNJiOU3ImughH7T1AlvDf9XOC0gZ81HMyyf4E5aPtr1hVIh1SrH3Fc63m2svLd/bdTz0a7rMIZyOBIJ2tsR8eHZ1BZGmVij+mfBY4po1RN9hDcHl9s5xyR2iXog+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nshup5+hxVNcHqwDBboTY9qGlRob7VdXw+3tgRx/lRA=;
 b=EtTJVqkElsgzqNHCrqzIu0t+YZqEy9guMF2Hi2jYsIjCSbsAaheUV3J7tJLGVor2tPsAt0tpJlQT//NYx33Jvyu4X7v8pfNsqXO1rxHIeR+Yyf48O/+6rtwC6cVAWPpjkXK4bSOhuEk2LVWgE30iOqyqWSidAzBiY7t9GbsVoLVhFXRfOedTiMsdTDDsZ+xyA2t7i3qgAamhKL9OOtxslpAePmBCxiHOH69xS1Bq5Ie0jjYcOF7wPs0BLsKRRMETjAWP5vrT95g832wgStJvTQAS7cBVdfOMr2qaQcD+1uJK/6vzCST9i+NVgofFfg3jJKEoiMhpusF1ov3dnj8uQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nshup5+hxVNcHqwDBboTY9qGlRob7VdXw+3tgRx/lRA=;
 b=w/+P3QYw8rVMEqiJKoXCIqYmh06ADPmAV/tr+8r6USpEPqW31DPO4n3b+15fPjE+kJFSfQYeWXc3o6NvdZoM5wDX65oo7R7DpZsNlw5QqJkho9cgcEvhwSoObNPfaW/v1SG4X8v8YWYLVr3CR9vuj2d7B0pSBlmyEo1qAQEhD24=
Received: from MW4PR03CA0336.namprd03.prod.outlook.com (2603:10b6:303:dc::11)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 05:21:42 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::88) by MW4PR03CA0336.outlook.office365.com
 (2603:10b6:303:dc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Fri, 30 Dec 2022 05:21:42 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:40 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 04/11] drm/amd: Convert SMUv13 to use
 `amdgpu_ucode_ip_version_decode`
Date: Thu, 29 Dec 2022 23:21:08 -0600
Message-ID: <20221230052119.15096-5-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|MN2PR12MB4221:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a87a33e-e3e1-4efd-2a41-08daea25bc9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qxhHknK6k9XfXioJr4paWZejlFoBUoYTVVWEaiYv+dsUC5T33woUTYQYFiRoYRTFtuoa+dNLf/Z9wjtThjfemAKrAdjM8zdklEcpVbVbBK/VuPgd3RP2N9bqMXZHbktYP9Cj7lBCep3Z1KhcSbw/I7fTG2s30aa2nQqrtEyzcGNgI6LFlkkjriuRFtc7DyvApCq0DBsM5boilVkKfqOBrxCfvz6MmTqhiMW0YVsuZWoJvvZe+yK7j8WqmtCtNAFq810PApGi2NsZ+GwEKQ5HXPYS4ckLHdNKWK5PKBbm6vP9y7Z+zcvXijaDWDci4wHoh9ixH65xSaumb/sfuVKZN+2Bk+cUVgJ9ar/N2mb/kwi6/hDH7DvJj//qvLmY3SZLgNZatLAwiKWW2o8kxIAhylcsgnctxZYeRUMz6AQFLVXeY2Bw/fkEA97RJs5IRqszgqqGzUxWwDjT94HMc7TUpMqACCtD9OtfIzSOkpQt4WMUGaXzsiE4TJLy3rFlaSihQLrtlsRcsxooqNZJ0DxQSEkcZKUvkjeNaZdXO7CoRJafri3uoRvAwME0Rb+Z7fiH1+eKYdwa+lgZUYxPyLz7yW3R3UkD+SAM01YdeetCc9eoftQ98h2lzhctwLI8sgzGe1RBvsYWNKzst9vpb/FGbEbTdiSP4IKfX7fwyk8pKqxewSI0Ds5lYJLcaWnpMdnfyB7lEHPqSBa/kwB/GjxV9AtiPN79rvbXR/YPI2ZueqOmoIiKqXrXkZNhJrB0AEhrjeZAePL8NazCaMozQT2JEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(40480700001)(86362001)(70586007)(4326008)(8676002)(2906002)(5660300002)(8936002)(70206006)(44832011)(83380400001)(478600001)(47076005)(2616005)(6666004)(16526019)(1076003)(186003)(40460700003)(426003)(26005)(110136005)(7696005)(81166007)(36860700001)(316002)(356005)(336012)(54906003)(82740400003)(41300700001)(82310400005)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:42.3693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a87a33e-e3e1-4efd-2a41-08daea25bc9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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

The special case for the one dGPU has been moved into
`amdgpu_ucode_ip_version_decode`, so simplify this code.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
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

