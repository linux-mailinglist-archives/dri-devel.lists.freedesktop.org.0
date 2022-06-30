Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB167560F7A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 05:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE6710E53F;
	Thu, 30 Jun 2022 03:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310B610E51F;
 Thu, 30 Jun 2022 03:18:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjJLolPsQOpYGOyfbwMNFpuVJBDyYHkg259mSGaKN3nZUL4JvbbKOFBwslnZoYshS4vom30mBQoYvGcC7vgsd9p9tXSGFXs8DyhrCXAzPBN0DK4D1eHiZCGYq6/KBq5YUX4aNiRgKqNqn94PLuabv7YUh0RKEQV3qg2Q8Ar6xO8ORuf8i08XNreLS9ALHgikRBiRXu18gUm6xpC/lkeKNGiIevBtj1EsicqNjaMPHpobLDszlhHiAG8z6ZvhdORlWJcZpYvCAOrjcnHxcVyygoDzGuP5W28TMLkk3zKTtGJNPdL8jjSEWM8uO1rAAUW9itBOvXLTPOFk4CzFsQY9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2Y4p2Nk3jye/Ecz3ntdWX2NtJcts78SlCFREbDvuas=;
 b=ef1/CZlA+cjU8oQLZ2yH1p1ZwBTLhQLeIXBCfVgqqNPh+KROFh6gS6u2Bp1abxz1gIUU7TjWjBvI/AyjJdsU7D0h9TcARCRDgXz1bDhC32yLsWpSLaPnnslrhwFR00HsDWaXswQeSJoWMuaJRI5u5vqWxVW0uSk8GHu0bEJjI6zGRRFZWgyy6AEYQ2Fe4MncdFJsx8E1z3re5d3k6zQiBjwvIOYvbwVjfTssjCG9JEUeYIFgDUFmQXIbDU9DMM/wZMunsQQW4M0c3KhIy4t4saI3RV9kjE8xTcw6reRlGGFZa3kKBe3gL2F4i04K+zvEZf/zmQkBPh1sxFUEGyi+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2Y4p2Nk3jye/Ecz3ntdWX2NtJcts78SlCFREbDvuas=;
 b=FwXAwdeXhOog0Wr0Gjyljyt/BP3QVxj/3/3zE3NWYwNluUlcSZ3qy7L0UL+XUcpT36pVSPltkSw0JAAgm44UEJTknaNyG0jb7iMY9tfGbBIxeP5+3mLdo+RNmEoz4Z/q+IwTs9EfBacMTWzzQfwUy5UXTGdMwS3IYry5DdVYtRo=
Received: from DM5PR07CA0091.namprd07.prod.outlook.com (2603:10b6:4:ae::20) by
 CY4PR12MB1288.namprd12.prod.outlook.com (2603:10b6:903:3d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14; Thu, 30 Jun 2022 03:18:23 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::b2) by DM5PR07CA0091.outlook.office365.com
 (2603:10b6:4:ae::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Thu, 30 Jun 2022 03:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Thu, 30 Jun 2022 03:18:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 22:18:22 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 29 Jun 2022 22:18:12 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/amdgpu: create I2S platform devices for Jadeite
 platform
Date: Thu, 30 Jun 2022 08:47:52 +0530
Message-ID: <20220630031755.1055413-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
References: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6343ef0-adb1-420f-75dc-08da5a4730d8
X-MS-TrafficTypeDiagnostic: CY4PR12MB1288:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0EayqkLbPoscg03b4pA6iCyGYpBlnrHcm0RBZNJ1X0Oh0a0vtd89hC1qX15Nz5V87KR56/stYLxHxQVNeMV6Q0DH6bowOXKg85rEZIF2/1yQVsyqbwW0xnPYdvQ4EY2axnEYV1WpJqWPXtwYXPRLwVUhcjCeDHaM8qXlzNcri/qDXBe4e3jXoQC6Gnwy1wdYMoHNvgUZN8JdF/KjtWhgNFazCUkblmnXrn1LYTw4vhjqIwe5FuFt5QgUXDrmNZfnRYgPaDpv3cKE9/IHVx1vur8Frl8ULwbVmhyrJzifmIMoloWJp+mS7cfW1itc3ZgyKItA+ZmnbE3NBYBGw53A+I8SrlBl/aSHkkMOyL8Sfoth9/OMktuk+Cauq1REWI6ooe4uhasaBUGrSIlMQq4QtxvT6JydGvcAwyAORBJZD/lWEm69In2VbQ5yU11pMLrdAgYJj95/ig+hlVBQZu3B3782NHGcwKXJwLKzluzew7QiQl7Fj6RrSLHhI8RUOHz6Z4cjHtiXEa9AaQEh2qmmA4r9lE4DfUayqiws9Hc52P2Jx6Gnz24cDfQ2Djs27Hpe7GGBlgleEeukZ1MJFDyfam8rAZc2ZJ7ZQ2mdMyaO3KmI1Rar1gDSpJSMONtzsci3gGG/TOvyxRUS8MyNw5UGJoqtlhGokTpn+CiQFV0EtZ1FVMhKlK5+8CFL8lCD+ERqiurCQPIYpjlz1139CRjyNKawDBcmvtbT4pNLGpk8hwbHO62Llb9mLP/qTqnAuwLGkPM9hKiYZECs2krb3SpRum9jnsLknKbkbkIGVJcc4MOrsPzhZuinPlnYoblw9ORz13FKANMJYI6HMNYZhj2Kn7mLBO8AMp6MuarNBIu0VqI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(136003)(36840700001)(46966006)(40470700004)(54906003)(70586007)(110136005)(70206006)(8676002)(4326008)(36756003)(7696005)(26005)(82310400005)(316002)(36860700001)(82740400003)(186003)(478600001)(86362001)(83380400001)(40460700003)(6666004)(40480700001)(81166007)(8936002)(30864003)(356005)(5660300002)(336012)(426003)(47076005)(2616005)(1076003)(2906002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 03:18:23.3922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6343ef0-adb1-420f-75dc-08da5a4730d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1288
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
Cc: Sunil-kumar.Dommati@amd.com, David Airlie <airlied@linux.ie>,
 Basavaraj.Hiregoudar@amd.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, zhuning@everest-semi.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jadeite platform uses I2S MICSP instance.
Create platform devices for DMA controller and I2S controller for
Jadeite platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 293 +++++++++++++++---------
 1 file changed, 184 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index af7b42056a89..d4b9fbc2654f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -266,125 +266,200 @@ static int acp_hw_init(void *handle)
 	adev->acp.acp_genpd->adev = adev;
 
 	pm_genpd_init(&adev->acp.acp_genpd->gpd, NULL, false);
+	dmi_check_system(acp_quirk_table);
+	switch (acp_machine_id) {
+	case ST_JADEITE:
+	{
+		adev->acp.acp_cell = kcalloc(2, sizeof(struct mfd_cell),
+					     GFP_KERNEL);
+		if (!adev->acp.acp_cell) {
+			r = -ENOMEM;
+			goto failure;
+		}
 
-	adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell), GFP_KERNEL);
-
-	if (!adev->acp.acp_cell) {
-		r = -ENOMEM;
-		goto failure;
-	}
-
-	adev->acp.acp_res = kcalloc(5, sizeof(struct resource), GFP_KERNEL);
-	if (!adev->acp.acp_res) {
-		r = -ENOMEM;
-		goto failure;
-	}
+		adev->acp.acp_res = kcalloc(3, sizeof(struct resource), GFP_KERNEL);
+		if (!adev->acp.acp_res) {
+			r = -ENOMEM;
+			goto failure;
+		}
 
-	i2s_pdata = kcalloc(3, sizeof(struct i2s_platform_data), GFP_KERNEL);
-	if (!i2s_pdata) {
-		r = -ENOMEM;
-		goto failure;
-	}
+		i2s_pdata = kcalloc(1, sizeof(struct i2s_platform_data), GFP_KERNEL);
+		if (!i2s_pdata) {
+			r = -ENOMEM;
+			goto failure;
+		}
 
-	switch (adev->asic_type) {
-	case CHIP_STONEY:
 		i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
-			DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+				      DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+		i2s_pdata[0].cap = DWC_I2S_PLAY | DWC_I2S_RECORD;
+		i2s_pdata[0].snd_rates = SNDRV_PCM_RATE_8000_96000;
+		i2s_pdata[0].i2s_reg_comp1 = ACP_I2S_COMP1_CAP_REG_OFFSET;
+		i2s_pdata[0].i2s_reg_comp2 = ACP_I2S_COMP2_CAP_REG_OFFSET;
+
+		adev->acp.acp_res[0].name = "acp2x_dma";
+		adev->acp.acp_res[0].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[0].start = acp_base;
+		adev->acp.acp_res[0].end = acp_base + ACP_DMA_REGS_END;
+
+		adev->acp.acp_res[1].name = "acp2x_dw_i2s_play_cap";
+		adev->acp.acp_res[1].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[1].start = acp_base + ACP_I2S_CAP_REGS_START;
+		adev->acp.acp_res[1].end = acp_base + ACP_I2S_CAP_REGS_END;
+
+		adev->acp.acp_res[2].name = "acp2x_dma_irq";
+		adev->acp.acp_res[2].flags = IORESOURCE_IRQ;
+		adev->acp.acp_res[2].start = amdgpu_irq_create_mapping(adev, 162);
+		adev->acp.acp_res[2].end = adev->acp.acp_res[2].start;
+
+		adev->acp.acp_cell[0].name = "acp_audio_dma";
+		adev->acp.acp_cell[0].num_resources = 3;
+		adev->acp.acp_cell[0].resources = &adev->acp.acp_res[0];
+		adev->acp.acp_cell[0].platform_data = &adev->asic_type;
+		adev->acp.acp_cell[0].pdata_size = sizeof(adev->asic_type);
+
+		adev->acp.acp_cell[1].name = "designware-i2s";
+		adev->acp.acp_cell[1].num_resources = 1;
+		adev->acp.acp_cell[1].resources = &adev->acp.acp_res[1];
+		adev->acp.acp_cell[1].platform_data = &i2s_pdata[0];
+		adev->acp.acp_cell[1].pdata_size = sizeof(struct i2s_platform_data);
+		r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, 2);
+		if (r)
+			goto failure;
+		r = device_for_each_child(adev->acp.parent, &adev->acp.acp_genpd->gpd,
+					  acp_genpd_add_device);
+		if (r)
+			goto failure;
 		break;
-	default:
-		i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
 	}
-	i2s_pdata[0].cap = DWC_I2S_PLAY;
-	i2s_pdata[0].snd_rates = SNDRV_PCM_RATE_8000_96000;
-	i2s_pdata[0].i2s_reg_comp1 = ACP_I2S_COMP1_PLAY_REG_OFFSET;
-	i2s_pdata[0].i2s_reg_comp2 = ACP_I2S_COMP2_PLAY_REG_OFFSET;
-	switch (adev->asic_type) {
-	case CHIP_STONEY:
-		i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
-			DW_I2S_QUIRK_COMP_PARAM1 |
-			DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
-		break;
 	default:
-		i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
-			DW_I2S_QUIRK_COMP_PARAM1;
-	}
+		adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
+					     GFP_KERNEL);
 
-	i2s_pdata[1].cap = DWC_I2S_RECORD;
-	i2s_pdata[1].snd_rates = SNDRV_PCM_RATE_8000_96000;
-	i2s_pdata[1].i2s_reg_comp1 = ACP_I2S_COMP1_CAP_REG_OFFSET;
-	i2s_pdata[1].i2s_reg_comp2 = ACP_I2S_COMP2_CAP_REG_OFFSET;
+		if (!adev->acp.acp_cell) {
+			r = -ENOMEM;
+			goto failure;
+		}
 
-	i2s_pdata[2].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
-	switch (adev->asic_type) {
-	case CHIP_STONEY:
-		i2s_pdata[2].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
-		break;
-	default:
-		break;
-	}
+		adev->acp.acp_res = kcalloc(5, sizeof(struct resource), GFP_KERNEL);
+		if (!adev->acp.acp_res) {
+			r = -ENOMEM;
+			goto failure;
+		}
+
+		i2s_pdata = kcalloc(3, sizeof(struct i2s_platform_data), GFP_KERNEL);
+		if (!i2s_pdata) {
+			r = -ENOMEM;
+			goto failure;
+		}
+
+		switch (adev->asic_type) {
+		case CHIP_STONEY:
+			i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
+				DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+			break;
+		default:
+			i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
+		}
+		i2s_pdata[0].cap = DWC_I2S_PLAY;
+		i2s_pdata[0].snd_rates = SNDRV_PCM_RATE_8000_96000;
+		i2s_pdata[0].i2s_reg_comp1 = ACP_I2S_COMP1_PLAY_REG_OFFSET;
+		i2s_pdata[0].i2s_reg_comp2 = ACP_I2S_COMP2_PLAY_REG_OFFSET;
+		switch (adev->asic_type) {
+		case CHIP_STONEY:
+			i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
+				DW_I2S_QUIRK_COMP_PARAM1 |
+				DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+			break;
+		default:
+			i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
+				DW_I2S_QUIRK_COMP_PARAM1;
+		}
+
+		i2s_pdata[1].cap = DWC_I2S_RECORD;
+		i2s_pdata[1].snd_rates = SNDRV_PCM_RATE_8000_96000;
+		i2s_pdata[1].i2s_reg_comp1 = ACP_I2S_COMP1_CAP_REG_OFFSET;
+		i2s_pdata[1].i2s_reg_comp2 = ACP_I2S_COMP2_CAP_REG_OFFSET;
 
-	i2s_pdata[2].cap = DWC_I2S_PLAY | DWC_I2S_RECORD;
-	i2s_pdata[2].snd_rates = SNDRV_PCM_RATE_8000_96000;
-	i2s_pdata[2].i2s_reg_comp1 = ACP_BT_COMP1_REG_OFFSET;
-	i2s_pdata[2].i2s_reg_comp2 = ACP_BT_COMP2_REG_OFFSET;
-
-	adev->acp.acp_res[0].name = "acp2x_dma";
-	adev->acp.acp_res[0].flags = IORESOURCE_MEM;
-	adev->acp.acp_res[0].start = acp_base;
-	adev->acp.acp_res[0].end = acp_base + ACP_DMA_REGS_END;
-
-	adev->acp.acp_res[1].name = "acp2x_dw_i2s_play";
-	adev->acp.acp_res[1].flags = IORESOURCE_MEM;
-	adev->acp.acp_res[1].start = acp_base + ACP_I2S_PLAY_REGS_START;
-	adev->acp.acp_res[1].end = acp_base + ACP_I2S_PLAY_REGS_END;
-
-	adev->acp.acp_res[2].name = "acp2x_dw_i2s_cap";
-	adev->acp.acp_res[2].flags = IORESOURCE_MEM;
-	adev->acp.acp_res[2].start = acp_base + ACP_I2S_CAP_REGS_START;
-	adev->acp.acp_res[2].end = acp_base + ACP_I2S_CAP_REGS_END;
-
-	adev->acp.acp_res[3].name = "acp2x_dw_bt_i2s_play_cap";
-	adev->acp.acp_res[3].flags = IORESOURCE_MEM;
-	adev->acp.acp_res[3].start = acp_base + ACP_BT_PLAY_REGS_START;
-	adev->acp.acp_res[3].end = acp_base + ACP_BT_PLAY_REGS_END;
-
-	adev->acp.acp_res[4].name = "acp2x_dma_irq";
-	adev->acp.acp_res[4].flags = IORESOURCE_IRQ;
-	adev->acp.acp_res[4].start = amdgpu_irq_create_mapping(adev, 162);
-	adev->acp.acp_res[4].end = adev->acp.acp_res[4].start;
-
-	adev->acp.acp_cell[0].name = "acp_audio_dma";
-	adev->acp.acp_cell[0].num_resources = 5;
-	adev->acp.acp_cell[0].resources = &adev->acp.acp_res[0];
-	adev->acp.acp_cell[0].platform_data = &adev->asic_type;
-	adev->acp.acp_cell[0].pdata_size = sizeof(adev->asic_type);
-
-	adev->acp.acp_cell[1].name = "designware-i2s";
-	adev->acp.acp_cell[1].num_resources = 1;
-	adev->acp.acp_cell[1].resources = &adev->acp.acp_res[1];
-	adev->acp.acp_cell[1].platform_data = &i2s_pdata[0];
-	adev->acp.acp_cell[1].pdata_size = sizeof(struct i2s_platform_data);
-
-	adev->acp.acp_cell[2].name = "designware-i2s";
-	adev->acp.acp_cell[2].num_resources = 1;
-	adev->acp.acp_cell[2].resources = &adev->acp.acp_res[2];
-	adev->acp.acp_cell[2].platform_data = &i2s_pdata[1];
-	adev->acp.acp_cell[2].pdata_size = sizeof(struct i2s_platform_data);
-
-	adev->acp.acp_cell[3].name = "designware-i2s";
-	adev->acp.acp_cell[3].num_resources = 1;
-	adev->acp.acp_cell[3].resources = &adev->acp.acp_res[3];
-	adev->acp.acp_cell[3].platform_data = &i2s_pdata[2];
-	adev->acp.acp_cell[3].pdata_size = sizeof(struct i2s_platform_data);
-
-	r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, ACP_DEVS);
-	if (r)
-		goto failure;
-
-	r = device_for_each_child(adev->acp.parent, &adev->acp.acp_genpd->gpd,
-				  acp_genpd_add_device);
-	if (r)
-		goto failure;
+		i2s_pdata[2].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
+		switch (adev->asic_type) {
+		case CHIP_STONEY:
+			i2s_pdata[2].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+			break;
+		default:
+			break;
+		}
+
+		i2s_pdata[2].cap = DWC_I2S_PLAY | DWC_I2S_RECORD;
+		i2s_pdata[2].snd_rates = SNDRV_PCM_RATE_8000_96000;
+		i2s_pdata[2].i2s_reg_comp1 = ACP_BT_COMP1_REG_OFFSET;
+		i2s_pdata[2].i2s_reg_comp2 = ACP_BT_COMP2_REG_OFFSET;
+
+		i2s_pdata[3].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
+		switch (adev->asic_type) {
+		case CHIP_STONEY:
+			i2s_pdata[3].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+			break;
+		default:
+			break;
+		}
+		adev->acp.acp_res[0].name = "acp2x_dma";
+		adev->acp.acp_res[0].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[0].start = acp_base;
+		adev->acp.acp_res[0].end = acp_base + ACP_DMA_REGS_END;
+
+		adev->acp.acp_res[1].name = "acp2x_dw_i2s_play";
+		adev->acp.acp_res[1].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[1].start = acp_base + ACP_I2S_PLAY_REGS_START;
+		adev->acp.acp_res[1].end = acp_base + ACP_I2S_PLAY_REGS_END;
+
+		adev->acp.acp_res[2].name = "acp2x_dw_i2s_cap";
+		adev->acp.acp_res[2].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[2].start = acp_base + ACP_I2S_CAP_REGS_START;
+		adev->acp.acp_res[2].end = acp_base + ACP_I2S_CAP_REGS_END;
+
+		adev->acp.acp_res[3].name = "acp2x_dw_bt_i2s_play_cap";
+		adev->acp.acp_res[3].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[3].start = acp_base + ACP_BT_PLAY_REGS_START;
+		adev->acp.acp_res[3].end = acp_base + ACP_BT_PLAY_REGS_END;
+
+		adev->acp.acp_res[4].name = "acp2x_dma_irq";
+		adev->acp.acp_res[4].flags = IORESOURCE_IRQ;
+		adev->acp.acp_res[4].start = amdgpu_irq_create_mapping(adev, 162);
+		adev->acp.acp_res[4].end = adev->acp.acp_res[4].start;
+
+		adev->acp.acp_cell[0].name = "acp_audio_dma";
+		adev->acp.acp_cell[0].num_resources = 5;
+		adev->acp.acp_cell[0].resources = &adev->acp.acp_res[0];
+		adev->acp.acp_cell[0].platform_data = &adev->asic_type;
+		adev->acp.acp_cell[0].pdata_size = sizeof(adev->asic_type);
+
+		adev->acp.acp_cell[1].name = "designware-i2s";
+		adev->acp.acp_cell[1].num_resources = 1;
+		adev->acp.acp_cell[1].resources = &adev->acp.acp_res[1];
+		adev->acp.acp_cell[1].platform_data = &i2s_pdata[0];
+		adev->acp.acp_cell[1].pdata_size = sizeof(struct i2s_platform_data);
+
+		adev->acp.acp_cell[2].name = "designware-i2s";
+		adev->acp.acp_cell[2].num_resources = 1;
+		adev->acp.acp_cell[2].resources = &adev->acp.acp_res[2];
+		adev->acp.acp_cell[2].platform_data = &i2s_pdata[1];
+		adev->acp.acp_cell[2].pdata_size = sizeof(struct i2s_platform_data);
+
+		adev->acp.acp_cell[3].name = "designware-i2s";
+		adev->acp.acp_cell[3].num_resources = 1;
+		adev->acp.acp_cell[3].resources = &adev->acp.acp_res[3];
+		adev->acp.acp_cell[3].platform_data = &i2s_pdata[2];
+		adev->acp.acp_cell[3].pdata_size = sizeof(struct i2s_platform_data);
+
+		r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, ACP_DEVS);
+		if (r)
+			goto failure;
+
+		r = device_for_each_child(adev->acp.parent, &adev->acp.acp_genpd->gpd,
+					  acp_genpd_add_device);
+		if (r)
+			goto failure;
+	}
 
 	/* Assert Soft reset of ACP */
 	val = cgs_read_register(adev->acp.cgs_device, mmACP_SOFT_RESET);
-- 
2.25.1

