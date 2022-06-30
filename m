Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E6560F80
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 05:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F5089122;
	Thu, 30 Jun 2022 03:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD98610EB49;
 Thu, 30 Jun 2022 03:18:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxUKafxmzjwLP00whft1WgDdUJjvmDSQpeApsjOvbUQoIl1pmNGc6fumTX6UrMWM+950560rk0JaVOgYlD/oVU/9hvWOPK9NffZqYt4ntm2sUznAXToOejVgaQS+eSCbRSNyiq8IoD24ihw29N4YP00IpGx/fh00dhC6VmI1SdzIiqq+c4eVns8xISor0AHPvE0ewPDqI9/1MuKH5MAchU8aTAaSBK47nd1vqTpC1cZ/mWna7WVfiUf/RjdeMoV0NBkuItfNCAewa0CUgKFZaDrGTGIqt0hIcOn1qyxwIhivN0+KmjFNmLvxSywfaqII9yU3IHihRxHCaQw2jgs7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICABZwNdVzUwLSlk+XuVEOv6wxXrM9NPNXp6PnCGyT0=;
 b=Z/QusUfQFT5zCtJIgaOWGxgrTKBs2xTNvMFRY2qBlJoH8S8QYztLsdmGOpze/FchjQrwQIgy3eDcpCjZPnxELtfMLA21d6wYlhIsu5esCOxCpcfSPKdcYwDuX4eYKjn6Gc5+Whg9Mzy2nFKj3u0VIFMmlWTBI83WKhOZy61hjZE3fGYGo/gGAkL7bHv8yM/sWvWs846d4DI1SyJvnS/5U35p5qBpfFXcWfmHL9O2vOcA+lPd++S+KkVVX7b23hjGHY8A1udwLH4pAf5tASaF5xEvk2M2fYKmCVzNb0lM9kj56jKTk5DplQzcdin6KU/MUEg5h8rqs4+D3pDiwbOBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICABZwNdVzUwLSlk+XuVEOv6wxXrM9NPNXp6PnCGyT0=;
 b=gMvr+fhzM05ctSrPtJkFxoIttXVZ8g4FXyTZMHxsiGushr99cQQiMogl4tLNYGCg6PjrrE06BN3+RUJIaSMYybetOXezA6ZqAqWE7VPoIaAhe+OQNPXPdL8mqiY5hnkDQvrLsY/GCbVIiohNnyKHN9UTNnViSGB/VuyDU51Jiwc=
Received: from BN0PR07CA0006.namprd07.prod.outlook.com (2603:10b6:408:141::23)
 by MN2PR12MB3502.namprd12.prod.outlook.com (2603:10b6:208:c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 03:18:46 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::fd) by BN0PR07CA0006.outlook.office365.com
 (2603:10b6:408:141::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 30 Jun 2022 03:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Thu, 30 Jun 2022 03:18:46 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 22:18:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 20:18:29 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 29 Jun 2022 22:18:24 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/5] ASoC: amd: add I2S MICSP instance support
Date: Thu, 30 Jun 2022 08:47:53 +0530
Message-ID: <20220630031755.1055413-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
References: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f69ea24-3a9d-4c9b-6b31-08da5a473e65
X-MS-TrafficTypeDiagnostic: MN2PR12MB3502:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D9uNpwv7yDCj8i5Noav+VaaLPWSxXixa24MyOkWR9UUFc8l62nLwGIM/BRXEePmNyn/7UXA8SFFcMYCx93iIS02wCFi/oG6ZOiII8glj/UOUmRpNTBPeYDQXWHGeXR7Yrjlnd1IY5/SoDT0N/uaKydq6weQfkRoDlctPItRUuQQPP4ZZKTmZDAexiftCSavy7uvBOUyuM5mm3nA5dHCQypop0TeXCHzYgoJRwolrWcvtzuYetepNIe3svjEaTJXSP59vkM46lE0yCykddg2si3E//CmS+HtEqMGBPryJlTsMDARQsFrJQv6h6NhSd+fCL3Z/RsGjgmjoicTFtKHm28QcACzIDN17QHza1HEGXu1H4aq4+/lWXSNNmuawFey2W09adXMSe/67NTH0NWy7p4R7cbiW7dDk7Fwl4tC0w48hnLnzMDwjCMcxA60l2a2donJ0OD2a4LgHrC+C/VlcWtnECVmvMdK7nOOIHim/rt/0zjN+Ya5fxW1zETYUSIjUTzHK4gAD9rUixyb1pAj8KGvjTjZ1QdfV5HLqpLzsi5yuG2T94FRFk/9cUoU928gxUgIollM9T/QY6moDr/bOq+A8eIC3J94prJnCMDols+hrpS94h8a12zQoE3QgLyYvoRZSVcdxf0oYcydS+fEaXQL81ivIjmLzlqfuBKf9obitY4Amiwczd0XEvuME/gd9Tem6cDjgXqhS1IbO7YWQsKLicPh7rNqLXGlV2YPxHhl/AVKhIc9JLKfngTysb7lcNPfkakrr4YrLp3SwMu96a5N3jy9+5s/WMgfUA7F55JeBi+R9MuUN1dAYumTB2vi80wSkm5Nqmln9GNv1xGrlDzJqNeSOX+rKVdrV3G3lgv4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(36840700001)(40470700004)(46966006)(83380400001)(36860700001)(110136005)(54906003)(40460700003)(40480700001)(82310400005)(8936002)(36756003)(86362001)(2906002)(5660300002)(7416002)(356005)(82740400003)(81166007)(8676002)(70586007)(316002)(4326008)(70206006)(7696005)(6666004)(41300700001)(478600001)(26005)(186003)(1076003)(2616005)(336012)(426003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 03:18:46.1733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f69ea24-3a9d-4c9b-6b31-08da5a473e65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3502
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, Meng Tang <tangmeng@uniontech.com>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, zhuning@everest-semi.com,
 Gu Shengxian <gushengxian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add I2S MICSP instance support for Stoney variant.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-pcm-dma.c | 50 +++++++++++++++++++++++++++++++++++--
 sound/soc/amd/acp.h         | 13 ++++++++++
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 1cd2e70a57df..198358d28ea9 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -433,6 +433,7 @@ static void acp_dma_start(void __iomem *acp_mmio, u16 ch_num, bool is_circular)
 	case I2S_TO_ACP_DMA_CH_NUM:
 	case ACP_TO_I2S_DMA_BT_INSTANCE_CH_NUM:
 	case I2S_TO_ACP_DMA_BT_INSTANCE_CH_NUM:
+	case ACP_TO_I2S_DMA_MICSP_INSTANCE_CH_NUM:
 		dma_ctrl |= ACP_DMA_CNTL_0__DMAChIOCEn_MASK;
 		break;
 	default:
@@ -710,6 +711,13 @@ static irqreturn_t dma_irq_handler(int irq, void *arg)
 			      acp_mmio, mmACP_EXTERNAL_INTR_STAT);
 	}
 
+	if ((intr_flag & BIT(ACP_TO_I2S_DMA_MICSP_INSTANCE_CH_NUM)) != 0) {
+		valid_irq = true;
+		snd_pcm_period_elapsed(irq_data->play_i2s_micsp_stream);
+		acp_reg_write((intr_flag & BIT(ACP_TO_I2S_DMA_MICSP_INSTANCE_CH_NUM)) << 16,
+			      acp_mmio, mmACP_EXTERNAL_INTR_STAT);
+	}
+
 	if ((intr_flag & BIT(ACP_TO_I2S_DMA_BT_INSTANCE_CH_NUM)) != 0) {
 		valid_irq = true;
 		snd_pcm_period_elapsed(irq_data->play_i2sbt_stream);
@@ -807,7 +815,8 @@ static int acp_dma_open(struct snd_soc_component *component,
 	 * stream is not closed
 	 */
 	if (!intr_data->play_i2ssp_stream && !intr_data->capture_i2ssp_stream &&
-	    !intr_data->play_i2sbt_stream && !intr_data->capture_i2sbt_stream)
+	    !intr_data->play_i2sbt_stream && !intr_data->capture_i2sbt_stream &&
+	    !intr_data->play_i2s_micsp_stream)
 		acp_reg_write(1, adata->acp_mmio, mmACP_EXTERNAL_INTR_ENB);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -867,6 +876,9 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 			case I2S_BT_INSTANCE:
 				val |= ACP_I2S_BT_16BIT_RESOLUTION_EN;
 				break;
+			case I2S_MICSP_INSTANCE:
+				val |= ACP_I2S_MICSP_16BIT_RESOLUTION_EN;
+				break;
 			case I2S_SP_INSTANCE:
 			default:
 				val |= ACP_I2S_SP_16BIT_RESOLUTION_EN;
@@ -876,6 +888,7 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 			case I2S_BT_INSTANCE:
 				val |= ACP_I2S_BT_16BIT_RESOLUTION_EN;
 				break;
+			case I2S_MICSP_INSTANCE:
 			case I2S_SP_INSTANCE:
 			default:
 				val |= ACP_I2S_MIC_16BIT_RESOLUTION_EN;
@@ -901,6 +914,27 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 					mmACP_I2S_BT_TRANSMIT_BYTE_CNT_LOW;
 			adata->play_i2sbt_stream = substream;
 			break;
+		case I2S_MICSP_INSTANCE:
+			switch (adata->asic_type) {
+			case CHIP_STONEY:
+				rtd->pte_offset = ACP_ST_PLAYBACK_PTE_OFFSET;
+				break;
+			default:
+				rtd->pte_offset = ACP_PLAYBACK_PTE_OFFSET;
+			}
+			rtd->ch1 = SYSRAM_TO_ACP_MICSP_INSTANCE_CH_NUM;
+			rtd->ch2 = ACP_TO_I2S_DMA_MICSP_INSTANCE_CH_NUM;
+			rtd->sram_bank = ACP_SRAM_BANK_1_ADDRESS;
+			rtd->destination = TO_ACP_I2S_2;
+			rtd->dma_dscr_idx_1 = PLAYBACK_START_DMA_DESCR_CH4;
+			rtd->dma_dscr_idx_2 = PLAYBACK_START_DMA_DESCR_CH5;
+			rtd->byte_cnt_high_reg_offset =
+					mmACP_I2S_MICSP_TRANSMIT_BYTE_CNT_HIGH;
+			rtd->byte_cnt_low_reg_offset =
+					mmACP_I2S_MICSP_TRANSMIT_BYTE_CNT_LOW;
+
+			adata->play_i2s_micsp_stream = substream;
+			break;
 		case I2S_SP_INSTANCE:
 		default:
 			switch (adata->asic_type) {
@@ -939,6 +973,7 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 			rtd->dma_curr_dscr = mmACP_DMA_CUR_DSCR_11;
 			adata->capture_i2sbt_stream = substream;
 			break;
+		case I2S_MICSP_INSTANCE:
 		case I2S_SP_INSTANCE:
 		default:
 			rtd->pte_offset = ACP_CAPTURE_PTE_OFFSET;
@@ -1160,6 +1195,9 @@ static int acp_dma_close(struct snd_soc_component *component,
 		case I2S_BT_INSTANCE:
 			adata->play_i2sbt_stream = NULL;
 			break;
+		case I2S_MICSP_INSTANCE:
+			adata->play_i2s_micsp_stream = NULL;
+			break;
 		case I2S_SP_INSTANCE:
 		default:
 			adata->play_i2ssp_stream = NULL;
@@ -1181,6 +1219,7 @@ static int acp_dma_close(struct snd_soc_component *component,
 		case I2S_BT_INSTANCE:
 			adata->capture_i2sbt_stream = NULL;
 			break;
+		case I2S_MICSP_INSTANCE:
 		case I2S_SP_INSTANCE:
 		default:
 			adata->capture_i2ssp_stream = NULL;
@@ -1197,7 +1236,8 @@ static int acp_dma_close(struct snd_soc_component *component,
 	 * another stream is also not active.
 	 */
 	if (!adata->play_i2ssp_stream && !adata->capture_i2ssp_stream &&
-	    !adata->play_i2sbt_stream && !adata->capture_i2sbt_stream)
+	    !adata->play_i2sbt_stream && !adata->capture_i2sbt_stream &&
+	    !adata->play_i2s_micsp_stream)
 		acp_reg_write(0, adata->acp_mmio, mmACP_EXTERNAL_INTR_ENB);
 	kfree(rtd);
 	return 0;
@@ -1245,6 +1285,7 @@ static int acp_audio_probe(struct platform_device *pdev)
 	audio_drv_data->capture_i2ssp_stream = NULL;
 	audio_drv_data->play_i2sbt_stream = NULL;
 	audio_drv_data->capture_i2sbt_stream = NULL;
+	audio_drv_data->play_i2s_micsp_stream = NULL;
 
 	audio_drv_data->asic_type =  *pdata;
 
@@ -1333,6 +1374,11 @@ static int acp_pcm_resume(struct device *dev)
 		config_acp_dma(adata->acp_mmio, rtd, adata->asic_type);
 	}
 	if (adata->asic_type != CHIP_CARRIZO) {
+		if (adata->play_i2s_micsp_stream &&
+		    adata->play_i2s_micsp_stream->runtime) {
+			rtd = adata->play_i2s_micsp_stream->runtime->private_data;
+			config_acp_dma(adata->acp_mmio, rtd, adata->asic_type);
+		}
 		if (adata->play_i2sbt_stream &&
 		    adata->play_i2sbt_stream->runtime) {
 			rtd = adata->play_i2sbt_stream->runtime->private_data;
diff --git a/sound/soc/amd/acp.h b/sound/soc/amd/acp.h
index db80a73aa593..b29bef90f886 100644
--- a/sound/soc/amd/acp.h
+++ b/sound/soc/amd/acp.h
@@ -55,6 +55,7 @@
 
 #define I2S_SP_INSTANCE                 0x01
 #define I2S_BT_INSTANCE                 0x02
+#define I2S_MICSP_INSTANCE		0x03
 #define CAP_CHANNEL0			0x00
 #define CAP_CHANNEL1			0x01
 
@@ -85,6 +86,10 @@
 #define I2S_TO_ACP_DMA_BT_INSTANCE_CH_NUM 10
 #define ACP_TO_SYSRAM_BT_INSTANCE_CH_NUM 11
 
+/* Playback DMA channels for I2S MICSP instance */
+#define SYSRAM_TO_ACP_MICSP_INSTANCE_CH_NUM  4
+#define ACP_TO_I2S_DMA_MICSP_INSTANCE_CH_NUM 5
+
 #define NUM_DSCRS_PER_CHANNEL 2
 
 #define PLAYBACK_START_DMA_DESCR_CH12 0
@@ -108,8 +113,15 @@
 #define CAPTURE_START_DMA_DESCR_CH11 14
 #define CAPTURE_END_DMA_DESCR_CH11 15
 
+/* I2S MICSP Instance DMA Descriptors */
+#define PLAYBACK_START_DMA_DESCR_CH4 0
+#define PLAYBACK_END_DMA_DESCR_CH4 1
+#define PLAYBACK_START_DMA_DESCR_CH5 2
+#define PLAYBACK_END_DMA_DESCR_CH5 3
+
 #define mmACP_I2S_16BIT_RESOLUTION_EN       0x5209
 #define ACP_I2S_MIC_16BIT_RESOLUTION_EN 0x01
+#define ACP_I2S_MICSP_16BIT_RESOLUTION_EN 0x01
 #define ACP_I2S_SP_16BIT_RESOLUTION_EN	0x02
 #define ACP_I2S_BT_16BIT_RESOLUTION_EN	0x04
 #define ACP_BT_UART_PAD_SELECT_MASK	0x1
@@ -149,6 +161,7 @@ struct audio_drv_data {
 	struct snd_pcm_substream *capture_i2ssp_stream;
 	struct snd_pcm_substream *play_i2sbt_stream;
 	struct snd_pcm_substream *capture_i2sbt_stream;
+	struct snd_pcm_substream *play_i2s_micsp_stream;
 	void __iomem *acp_mmio;
 	u32 asic_type;
 	snd_pcm_sframes_t delay;
-- 
2.25.1

