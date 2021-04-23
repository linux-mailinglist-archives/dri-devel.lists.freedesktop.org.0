Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2741B3696A2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 18:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FA16E10D;
	Fri, 23 Apr 2021 16:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4274F6E103;
 Fri, 23 Apr 2021 16:07:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mk9Yg8BEXCG9WYxs9lye/hXNaWgZxUc0Bve12sM/BKKTC8sbfSOGJ3Lj+2jdH/Ly6mIM7A3N6k+YLu56HRSELD10q16xxxpKx1GT6fIDqM4bas2yWrvNa3WhMFmNv4Lg0IqcezkK+VRRSAe+qqqtnaS6CSuYll/0h2+NMOuDW3orUs1q+WG9mIbkq5gx6p4xmLUpOAjEIEMU43YyryqCdW8j8NAsDIUmXqMv3Ccr+oKzqU5gP+HDP6LA7Zch79gVBnNbFOInlgAnHaYcEroy0ps9Aa7ChRhu0Rpf7BtcRGTke4ouc4zQ4V+Z9qIqQ7w19+jZEgvjndyEKFgyWW3nkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGwLqH6nD305nX/sR9Lv6FU1fqt96mZNv7H9BzGycO8=;
 b=fLwJytAXpbI/dX1uMz5w3W0BwRo6FkCw0nS7hm86x2I5w0XGrUdr0okyQCcbxXHKSbNRNLA003uzB2WMsEbyGe4GS6+bNFoNHbqY40vruOOb3NN/2hbarCzPYeG7lkaWR8LenU1i7lTjNPEzvxa1c1VuGmFw9f0EAeVU7xyZ0u21BvlZmCEYtkSnJtmMvc/L+IL4Co3Z1/UwB4ENVLGkDDIM4FlfLQwVnBNShJH1xI5RB/aDAa+Y1bFsbXKTuZ86UlVsSItxT6TQ7OLrsIr5YKO15ZTm4t5MR5goZgucBlFz6VE7zAy/zNrUEVMgPFWGJEEoVCj8tY4fqxXJrqaaGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGwLqH6nD305nX/sR9Lv6FU1fqt96mZNv7H9BzGycO8=;
 b=P+Jw1jnTtmkTmGUjtt8ZoPl6iWmSJWkTOBKpSIocEEynwXSUf40mebmEOjmp4Xiut94cH4GxuKVE4bPJ1dMEbeakAQyF7t7ACtilcLypMGdfU7ytnSXWu2UAC2mwrz9RNDTfkKHFSnhu7OveGm5pSqa4j6qfN2uQghmS6C8FV3w=
Received: from MWHPR22CA0022.namprd22.prod.outlook.com (2603:10b6:300:ef::32)
 by BN6PR12MB1729.namprd12.prod.outlook.com (2603:10b6:404:108::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 16:07:42 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ef:cafe::4f) by MWHPR22CA0022.outlook.office365.com
 (2603:10b6:300:ef::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 16:07:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 16:07:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 23 Apr
 2021 11:07:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 23 Apr
 2021 11:07:37 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 23 Apr 2021 11:07:27 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/2] drm/amd/amdgpu: Add dwc quirk for Stoney/CZ platforms
Date: Fri, 23 Apr 2021 21:54:39 +0530
Message-ID: <1619195089-29710-2-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d31d9c17-a362-42a4-cc3b-08d90671ec78
X-MS-TrafficTypeDiagnostic: BN6PR12MB1729:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1729462A7F3BEDE645D5828297459@BN6PR12MB1729.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5kUol8h4sw6v0WMK+grkP1sA3KAE/PCo6STVy6D6Y4WGQwV+t0ti2OdfRDs2hlFf9FYrLQ1MSeH18J1RPA134xZCFB//xmLfUH4Zx7BcDB7ic+rC220KWR1jepGFPiUHvEQItDuFYQLKy5P82DKY0V7K94DU1SYgQgXGgwgUtVVkLd2Qi3OR8hUwNWgC8ugAZoXAxUPradG1GyEu1PMhGG5Qs87tyoDUPNUtk5sIiXS/m9uxsZCQkA5bQNL4QpOPk6AtuLQUzgGVYfLYjosUCuOvENA2UtjyXUGSQ0IO7eVzUgOvJfYjTIHPNFcCoUSOakOrjpY2IC3MWyqdD0t6SO5m5EopHPcCwdYgdpDY36RBfcKpJjWdl0YyQLswywMLYKM/HPbLLPeXFqaL1N1FkhtLRM9ifIXcI/GSlVerIAvCJoqtICte6Zz0ymbuRx74I13a+LPpsI0z4NmsgtRjirdeIKrd/BI+KrBr+6ki+dbKOON206AplQD/zJ/oP1xNJBQYYHLdxNx7Xmo4ZBSNCju+4wJJtX/7WZUp+A3Cu/2EXNYr3Wo6tCCmlFKnrdXv2dMAfUOXxaVZJo3nZubyOk6s5RuXO3U6wGiYDOmhOdabJK8IYAHB0edGtADd+LLqKvg00BSqf2+ydaWQf46Vc3457acbBKL6bPUj16KC+a5zN3FOh2tIT339dTuzlAeb
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(36840700001)(46966006)(478600001)(70206006)(70586007)(81166007)(83380400001)(36860700001)(82310400003)(47076005)(5660300002)(7416002)(2906002)(316002)(8936002)(426003)(110136005)(54906003)(336012)(6666004)(356005)(86362001)(7696005)(2616005)(26005)(8676002)(82740400003)(186003)(36756003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 16:07:41.6407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31d9c17-a362-42a4-cc3b-08d90671ec78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1729
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
Cc: Deepak R Varma <mh12gx2825@gmail.com>, Sunil-kumar.Dommati@amd.com,
 amistry@google.com, David Airlie <airlied@linux.ie>,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.das@amd.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 nartemiev@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN for Stoney/CZ
platforms.

For CZ/StoneyRidge platforms, ACP DMA between ACP SRAM and
I2S FIFO should be stopped before stopping I2S Controller DMA.

When DMA is progressing and stop request received, while DMA
transfer ongoing between ACP SRAM and I2S FIFO, Stopping I2S DMA
prior to ACP DMA stop resulting ACP DMA channel stop failure.

ACP DMA driver can't fix this issue due to design constraint.
By setting this quirk, I2S DMA gets stopped after ACP DMA stop
which will fix the ACP DMA stop failure.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 38 +++++++++++----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index b8655ff..6866b73 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -245,42 +245,30 @@ static int acp_hw_init(void *handle)
 		goto failure;
 	}
 
-	switch (adev->asic_type) {
-	case CHIP_STONEY:
-		i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
-			DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
-		break;
-	default:
-		i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
-	}
+	i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
+			      DW_I2S_QUIRK_STOP_ON_SHUTDOWN;
+	if (adev->asic_type == CHIP_STONEY)
+		i2s_pdata[0].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+
 	i2s_pdata[0].cap = DWC_I2S_PLAY;
 	i2s_pdata[0].snd_rates = SNDRV_PCM_RATE_8000_96000;
 	i2s_pdata[0].i2s_reg_comp1 = ACP_I2S_COMP1_PLAY_REG_OFFSET;
 	i2s_pdata[0].i2s_reg_comp2 = ACP_I2S_COMP2_PLAY_REG_OFFSET;
-	switch (adev->asic_type) {
-	case CHIP_STONEY:
-		i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
-			DW_I2S_QUIRK_COMP_PARAM1 |
-			DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
-		break;
-	default:
-		i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
-			DW_I2S_QUIRK_COMP_PARAM1;
-	}
+	i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
+			      DW_I2S_QUIRK_COMP_PARAM1 |
+			      DW_I2S_QUIRK_STOP_ON_SHUTDOWN;
+	if (adev->asic_type == CHIP_STONEY)
+		i2s_pdata[1].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
 
 	i2s_pdata[1].cap = DWC_I2S_RECORD;
 	i2s_pdata[1].snd_rates = SNDRV_PCM_RATE_8000_96000;
 	i2s_pdata[1].i2s_reg_comp1 = ACP_I2S_COMP1_CAP_REG_OFFSET;
 	i2s_pdata[1].i2s_reg_comp2 = ACP_I2S_COMP2_CAP_REG_OFFSET;
 
-	i2s_pdata[2].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
-	switch (adev->asic_type) {
-	case CHIP_STONEY:
+	i2s_pdata[2].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
+			      DW_I2S_QUIRK_STOP_ON_SHUTDOWN;
+	if (adev->asic_type == CHIP_STONEY)
 		i2s_pdata[2].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
-		break;
-	default:
-		break;
-	}
 
 	i2s_pdata[2].cap = DWC_I2S_PLAY | DWC_I2S_RECORD;
 	i2s_pdata[2].snd_rates = SNDRV_PCM_RATE_8000_96000;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
