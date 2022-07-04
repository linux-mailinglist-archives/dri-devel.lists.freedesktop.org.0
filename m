Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017A5565BFA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B37610FB80;
	Mon,  4 Jul 2022 16:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967EF10E14A;
 Mon,  4 Jul 2022 13:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx8VGnewwSq/7Dpd2MouV00EEoC/zeN6Y6n+725HEpv5v3bI1jBPgwa8toHg57yk2mmxK9iKGL7vCMzBTyNCI2lIFTBKjzSeQv88qlr0SzGgOgELwRbAvtagvIWD0WYTLcd65Rxr0X9+Rh3+gZQ73QEwfZNW0qs+1/RyAOyJzZ8ogy79CRLWP5hnqMLkYQ6n/6XeJd2nw0UIj9v+d9bHedw6+Gle/lDf7Kti/bnr/HpDZttEmTKcVlyNEXkL2AVeKjKIryNLGriBrSIZwF3bsCec+G4/RaO+QX4EUhQDZ+UcW2epIjeg6miumUbqP0ZLPCUV3axmFCdIuEsXtz5q8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B74JK09pO5tVPTGDfQdzGQef+x9lCTRXYpJMpRN65tI=;
 b=ZTEFw3wdfv8hKmVE+FcfnmzAFI5PXTByV80TZ1szLbL0IE7g0lV/ysmq3TyHn1YxU/p6ewbd2G+AECLH70q9Tibs76jCwB624yFyOeT1rbAhCTUoCr11YjUwFxKK6YWWdHSDQmd9P8MpeHVAF1ziaT8n4JPuluvB9QpG79I4HS8ieu0Zmz69pUavMuzLUS+icNGhFyBAphLl15l28WUcHoQ2/yWfJWBZ+GsVbNRg35Ho7N9afrtREFj3LQ+A+ivUW3uXv+Y7+FMwULOIjt8+2GiwpP+W32lhOo7O0Fidmoi+vvIt6TeB7MFRy2emz8MAq2x5l0zEM4bFh54OJFNe8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B74JK09pO5tVPTGDfQdzGQef+x9lCTRXYpJMpRN65tI=;
 b=Dh2dwbvX1lU52xHvuImoIG06wOn1ws4TS6tfzJ9iLSH+93LFCi6aVL9RJzoKpnk/2WWWeEkLFD/zIE1OT2ozLEvsYITtKornHYTrcd8anTV+862dMaOuOuRW2lRb/dOcKFJ2BJlUYWCDB/OA+iXbdQfVdnxx1Dme9BvKMQf5ewE=
Received: from DS7PR03CA0324.namprd03.prod.outlook.com (2603:10b6:8:2b::24) by
 MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 13:55:03 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::7a) by DS7PR03CA0324.outlook.office365.com
 (2603:10b6:8:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Mon, 4 Jul 2022 13:55:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.17 via Frontend Transport; Mon, 4 Jul 2022 13:55:03 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 4 Jul
 2022 08:55:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 4 Jul
 2022 06:55:02 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 4 Jul 2022 08:54:53 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH RESEND V2 3/3] drm/amdgpu: create I2S platform devices for
 Jadeite platform
Date: Mon, 4 Jul 2022 19:24:20 +0530
Message-ID: <20220704135421.1215140-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704135421.1215140-1-Vijendar.Mukunda@amd.com>
References: <20220704135421.1215140-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dd8eaf6-4263-4130-b812-08da5dc4cb76
X-MS-TrafficTypeDiagnostic: MN0PR12MB6032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BfL54WdqOOAXiMrZfrPGSC1UxZ4GqaKbxPj00FdZut8eFxvihJOnToTUlpo4tvQKCbBaKXlKWDDWsJHhM7UlMj+uWcKQcAlW/5hOozT+AUxWeFqW8PksR+MTH8iOR/NJyjA90yz+rg9qitUhlRjHqOHEfDFtDwWHG+QoXFDNcT5WqpIRcvy7sfCFVW1tBqswDkTIja2pux+dgxBSU2dUPX2gbYGM3D4ne1aIXYyFzWXSKaLX7fMN7QhycLpZSKlAKApsHlkwtYAmvXAy7yXwWhd4YQHpzKmy56RJsswTqv1pMU3tFVZcsI0HFyf9Z4uf7595tmRl6gGAy37JU9vKpWzNP+9MmCYsBeyz5x9xWTqjI96xdAUYSd7Rvu5iby8/bgkp9k2xj4SEUpUdUGvS/2ZFq00seXCh8LmXmv77v99dyHtKzZaW8Y59p7swzwjGubYldZIt7a/bhd60rlaESeKqgFU/whnhWKJ8oLdFfQ0xwMFR+8sv6l2E8Y/pMoWDWFeDucVKIsQyP3wlTvKwFB4aFx8LsbQR30do0PipSO5/bOZpk61iBzO4i2uWny5OO7YycpxWjmynevqgIoZ484ztcS01Tr+0g4c7ZHKEhvER31nEO3l/W/mvDJX/cAhzTRHQhUXiemaT6Pr+Rbfdp6E7r0RptH2JqJ6QGOChhpSDYnGPe2hXZ50Wd7J95dY9ICio85Wr9XIjuND104XE2lB5VnLAuUMu1Mtv8TUSQJ8YxZ+4OePnYidFyCPo4SrW5MOeMESHUZ7+cc9UZQ00yJwtdIBpEveFXh7LKNoGUXmlLhu1yxsz2A/XIrggDbg+XC2CttaPdZHd9/LWjt6XW14Px0m8gb+2ILh/ugW+EsMXuIHECug2ION4gPHedI4R
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(36840700001)(46966006)(40470700004)(2616005)(70206006)(4326008)(356005)(8676002)(40480700001)(478600001)(110136005)(54906003)(26005)(82310400005)(82740400003)(316002)(40460700003)(186003)(6666004)(70586007)(8936002)(81166007)(47076005)(83380400001)(426003)(336012)(36756003)(41300700001)(5660300002)(30864003)(2906002)(34020700004)(1076003)(36860700001)(7696005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 13:55:03.3781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd8eaf6-4263-4130-b812-08da5dc4cb76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032
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

Changes since v1:
    - Modified commit lable as drm/amdgpu
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

