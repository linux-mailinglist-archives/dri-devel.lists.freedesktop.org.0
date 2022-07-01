Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44265632B0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 13:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C2211BAB3;
	Fri,  1 Jul 2022 11:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D92311BAB3;
 Fri,  1 Jul 2022 11:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2XK0NLeRNA9z03ud3JleuWdLrQH9H38XD4cRzfOHEdldfv/0bQDICd8in2S/bj/LKO4le4YfGmEwiuWa8uk+gPqpASSLNzqHj5XE7gOEcyRKGadRb9McYG3S4ksESt0cr7nX5K3CcVoGYM3CQhN4KPHgInGxFvrWoZK8ZNYytiG4vX9uz5xUZXwkq6e1+wYHoCmaiXnPdjtMvtRDpl/h8eS5RzrPilF0I12h4OA5/Js/5FkBXhtpqUfNe+NfmALrmhrHe11ypSYEGYUEWwo5nXmVN+u1XYO7YaPARl5O8rDZ2AyLP7eu+btFH8EjqTRcM26GOwvGn8ucy+rZCuL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICABZwNdVzUwLSlk+XuVEOv6wxXrM9NPNXp6PnCGyT0=;
 b=I7rBiGYlRUgcUqC12nngAeddXlyC0o2HyW2Jq9ajHIIoNBfq+j5x1Bdqq6/i4qLV7Y1dlTiNomMOM/ew0TEhS1i7dT3qQZQA2KqSc3zufCAuqFvHTfuXQ/MAxizJXmxwm/BbmpF/Ua3awakHWaWoUfTadMD0QNq6XOlQDipHAKEZ0KFP8ba7zPb1hnzcvIrujveoPylWLHvP+uT+MAasLYlJvsIvKpVl5R/ww2hApVD3NdJ8deegBkeTCL9UDx30PqMv3RGRJ/BkAS5KcUG8xWmHK+GaWVTpOIkWQDSA80RT3Ki3v3U04LW1q/2K7ZRK1dCvNcXLc2z0amm9RvY/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICABZwNdVzUwLSlk+XuVEOv6wxXrM9NPNXp6PnCGyT0=;
 b=Ui8Mtvmii5XjRdx2bA56oPNnMk/P5M1SSQilNc7fXMBe3OHYVg0MjnXEPUVtNXVLX1jkakiK5a5B7qTlwtAGAAkNhF2yddXstjjI/20Q5UdFKxGPQ7cGfj6RGog8W1sf3p4J2ngXOKBQcUlGUasw8061NiqQK6IaIj3fwQW/eZU=
Received: from DS7PR03CA0033.namprd03.prod.outlook.com (2603:10b6:5:3b5::8) by
 BYAPR12MB3398.namprd12.prod.outlook.com (2603:10b6:a03:aa::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Fri, 1 Jul 2022 11:41:49 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::58) by DS7PR03CA0033.outlook.office365.com
 (2603:10b6:5:3b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 1 Jul 2022 11:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 11:41:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 06:41:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 04:41:47 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 1 Jul 2022 06:41:43 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2 3/5] ASoC: amd: add I2S MICSP instance support
Date: Fri, 1 Jul 2022 17:11:05 +0530
Message-ID: <20220701114107.1105948-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
References: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea04261b-506d-43c2-b06c-08da5b56af10
X-MS-TrafficTypeDiagnostic: BYAPR12MB3398:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIcLvG365gwQ/5Ra8zGBmdSRTO59Tt2fbrK3QngdKNdkBJMZKil1X38pu0pL2FND9rHiYpcG+JqZ+BM+/L39DkrJGBywe0BCJlCOvh6NuJGX2qUWqE5s3Q2dM7QkKybjkNolPwDz9lXBqYk1mTJzPXyW0P6ki4b2a47KmSQJrgXnsmY7iIhcXqM9PQwT3k67kVv+IqbvPxzZlAK6O4gimIr7xuVMsJZt8w++RanUu8XRc+hviNbtE2ebpL458qIvWYBNEji6wo9HnjHA1sADiP2frCorqndtTlfN5w2Hb3Sawo8w4TPzBJii40KAKgtQru5FZ1B7cflq0ZaJ1y3k9tHjWlBlDwyy6c0LJbKbVSiVD13DwbjI94dudMAC0HMXXzsFiTbe1xqnhISf4YQ1mzZecvjrBUGtxahZWSxWEjMV9Dr0BmXPpdFweENsyLBbDzzD6kiinVZktd8diYm7liU7Wb2DVx+mDeKuUSMOLZHHyKlm8yh1HTaKKVksfRDIoWrECs6ATJmSAO5uNtnP6Gn+XYd//Vb3Wje5iSPDEqdA6DNTpc+pAO2FvSK3Md2aE3654qA9pS4GiQ6xcpscoY/pC3OoaX1d/1WT2q7TXYHPs1ex0Z8M/KbvF4fO41Lg7y84clAgsCBFJkUPsLcQJ+ug/s4ywOV+b8nyXnEVPjN1Ydp+Uk6jutHTVCS5WsVzoiKcfxeAwpHgliqUSFmy88nx7y8ut+Z0It0knt+CPCeFxyGMnmDpY4c8G3JrCstGnwwWJpErLKSabseikkocs3l8VYZNYdQAIduzr5LyEGDbKpiHXHoK5dHppsNYTl+xWdxX3pcy6wzs+ycWSKoOFQk08A3UM4DvLNy3/cjORyQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(40470700004)(36840700001)(46966006)(7696005)(316002)(47076005)(8936002)(26005)(8676002)(70586007)(82310400005)(110136005)(36756003)(426003)(336012)(5660300002)(81166007)(83380400001)(4326008)(186003)(82740400003)(356005)(70206006)(41300700001)(54906003)(1076003)(7416002)(86362001)(40480700001)(36860700001)(478600001)(40460700003)(2616005)(6666004)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 11:41:48.7830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea04261b-506d-43c2-b06c-08da5b56af10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3398
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
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Meng Tang <tangmeng@uniontech.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
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

