Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA1A5632AD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 13:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CB311BAAE;
	Fri,  1 Jul 2022 11:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDF611BAA3;
 Fri,  1 Jul 2022 11:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLOHdpj7Hn8jtZhUtUUfoxPJGY9OkBkw/v5EL6J6OFukAbjmzi0n/3oZfrRfoFttoZmNrjBHDk7QqJJ2WlilmQH8X67WxToY+edQTy76Qek86FrEsf53Xot08a3EBehM5V5UZCJkwizvmhBCXU38rSjdpJQt+M3C1YUSpugFBVfvJc04QS2iH+UYzqODYBTMTsqJ64mbI5CCw3M0mcC2n445QwrxPBZGwD7qtpW+v4tam8xh1OzZJF8/dl8vQEZ2fTHHENCN40+L8Y441xJcPfMhSl1nGSzw3PmKlyW59xdTED3JMHyiQdN2a/sFdClupxQF4gCBUh3qvmI60KxKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2Y4p2Nk3jye/Ecz3ntdWX2NtJcts78SlCFREbDvuas=;
 b=oI4wtTFBi4/xtUeszyA31cX885gmA58cuPsbxahRUgUmcM8z/oYk5me6ecWJYii1UDUYHHEvA9upah+V6smx5VEEN2dxaCxy/iB8FV2eBLcr37cy6UApyT3YMSwA2cFqBrTSjK5EB0/0wmt5eLPjthQYwUpRqT7nIH7cTmhO6eG/ww6xflQpxk6nyEtsoWCwJlY3on6P22Dh3p2xW0T1XgtcsVlNXP45+b7biHkk9gpfU405x6C2phNvM3fOqcCokBNTieAOG4MwWme/Q11muibod+2Mlll02Gj/OwM52VZoj569hzLGh3FSroyCUulhyV2uw+BTYI3Zq7yIoAWErw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2Y4p2Nk3jye/Ecz3ntdWX2NtJcts78SlCFREbDvuas=;
 b=141O0Eln7bUl17KL0hwqC1cffk7+BmhGmvqaywcYb7oJ2l2A8yqlvOiD7HebE4Ft25XazcWxzHxMQ2gSvh5ZJMz3rY3xfccirAhJGuTi+U6mF/FmXoF67d72Z0of/pz0hwaKLegmg1IDmlxYFIK2hxDhE2YummnS2COuUWj99Q8=
Received: from DS7PR03CA0208.namprd03.prod.outlook.com (2603:10b6:5:3b6::33)
 by CY5PR12MB6431.namprd12.prod.outlook.com (2603:10b6:930:39::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 11:41:42 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::40) by DS7PR03CA0208.outlook.office365.com
 (2603:10b6:5:3b6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Fri, 1 Jul 2022 11:41:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 11:41:41 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 06:41:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 04:41:41 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 1 Jul 2022 06:41:31 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2 2/5] drm/amdgpu: create I2S platform devices for Jadeite
 platform
Date: Fri, 1 Jul 2022 17:11:04 +0530
Message-ID: <20220701114107.1105948-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
References: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb8a78a8-c4c9-43f1-3de7-08da5b56ab04
X-MS-TrafficTypeDiagnostic: CY5PR12MB6431:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQ063zAi6C7tuoGvDC28vmm0vWE7/ZouT3jfn7kV89nSt0i6zTEeaTyvRCXtEQI7ApmHmsPOuXx+GrUddDmCfFJ2SIyNIXZY/xLkr3pvkJYdyzyJNxdEu5DCLiVUYzY3r/TLhKXiaSM+Bgwcm5yqZiuO2ezA47vKNRRTh6oG6Tjpx+wTjqxsLJxhDgxhK80J435fF+mHn3O4uQ1iQg+abW4mVRAI/nC6x466kdDUa/6nHuLakd0QAc59thuNEBFmSKvgwxi1/TCuH7TblN12fsL/4iiuICvpVtjxFTyP09zo/L5imLG00vm6GYYjUSUCeSc6v3Ue7RQFVbUHf8hNT2fOZcDnmFtqkAXLK0OvNWn145QG3e6OedCcYp1pZUc6qbIVtcxQm8+fKizvB+tUDE6aMbACBsx+ImUZfaLtRoaD7Je2yWLw8YPvv8rEqIbHZ42WeQUutvVra/z5Wph3PxyM8QivGjXu1WjYC/09PJyIeRXGuDGbT8MjNmtCue+8dpQi2FCEetr8GBzmhc9FjMxTSEWpMTx+3fd9bucEr6zOS9Kyg/kVhEPavpXDVqhn/29s9H1O2pOqU2uJi1DcEVdZoHgP6mGIFBthY3QJhb7SrWpDCDczQlx9BeqL8LPiIUORPy4ZUR1gzi1LMx0D8++70/QomDrYGib2jxAjlYPDS6oTpSk9T30fiInO1Q/+qaunx+ms3EBmLG8tKyRhAuxwnDgqa45XF/+sxwNPrqAHYhzgIXbD+qUQX+teiydbEBUwgHFKK+NsVeV/gSDyYyKvQgVIGow98vveV5vyCi2CS8Y+kO0cxT14KoEDngK8jgwmPIh43IIe+PhbmdBWd0puA+3UUg3JVQQiYcbLT34=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(40470700004)(336012)(186003)(426003)(47076005)(83380400001)(1076003)(110136005)(70586007)(6666004)(54906003)(40460700003)(4326008)(26005)(86362001)(8676002)(82310400005)(40480700001)(7696005)(70206006)(316002)(36756003)(5660300002)(8936002)(2616005)(30864003)(82740400003)(81166007)(36860700001)(478600001)(41300700001)(2906002)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 11:41:41.9593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8a78a8-c4c9-43f1-3de7-08da5b56ab04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6431
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

