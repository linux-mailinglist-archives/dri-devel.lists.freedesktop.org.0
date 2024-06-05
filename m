Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259F28FD514
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 20:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5683610E2C1;
	Wed,  5 Jun 2024 18:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="PiBFllur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2044.outbound.protection.outlook.com [40.107.8.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A538110E2C1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 18:05:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3Ic2wY1WEu4UagyCoo3PVyk8OPadR3wyeUcGb6LFQjTe2/ZTo9omUCgXAhh2B1LLXwXUQQz/qAFaR6Gc6VTnKubaQYrZ7JVXTEwuAHTQF587KDao9qYlI6TiApirVGW0nGdxvX96+hEAb5SJRavcUNfCuJNtwdjk+0Iaw2NnFhBpHKNKwzusIaei0nxuUfj7KqbdYBQNW6CHedS++kOQzX1hR/YoqXZnq8Mih9qEvR1L3Mwkqvnn9RsgVsM1U5z2xH8gC5CSsHsB0lJqLLVpFNFK3Gp6D5Kxrx0DiPLgIUyp+l/tcjW6zCBDwGnV0upszuqez1C8q532ETens7NzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEAGB/5UT4Ezk3vxcZ4vlToqBwLjbkVcJ0idUn+wLvM=;
 b=lmNZAKK2lc4io13L5hlsNFRZfluNPovkpPA+G1mYZkrOA7ZbB6TgWZFQCHJdBxWUWylcG8C0iD75TxTiZTa1r04CCpBdZZbHenZPMrhiSK7zuwa5buGboRwppGlEPviid1TkihLBcU6hRwSBSmmJfjNMilbPBhYBhSd16gMjjNPoK8eGGNxT+zBAiBORrFa6aca4MQ3R4ihQ1mskx/9GUYSVRFdwmDmS/joHbXAMIytReTA34SkofILJSHgRxhVs3tE8uAUdYT4/WM2sJz/z+OsjB1DC2Y5MNAuxB/sa5AuXzDG+v93l5zgaZi+COlAsoBkOI9bPZGuooqgyAg1vkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEAGB/5UT4Ezk3vxcZ4vlToqBwLjbkVcJ0idUn+wLvM=;
 b=PiBFllurxt86osrfpAaSLdBf2A9ShfbVA5UcI7JczeOuf9dnbdQ8u0EZsmdgpnt/PCORxmWRj7cgo7WPptE+3qTrYNmNL99CFQF7AglsB36f8paEFb2Ss2awmrsATdtLmL7/ALi1RDETCA7IX6QAZ8hATqQtY5Nbawr2XvcBWaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6832.eurprd04.prod.outlook.com (2603:10a6:803:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Wed, 5 Jun
 2024 18:05:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 18:05:33 +0000
Date: Wed, 5 Jun 2024 14:05:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
 iommu@lists.linux.dev, linux-sound@vger.kernel.org,
 Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 08/18] dmaengine: bcm2835: pass dma_chan to generic
 functions
Message-ID: <ZmCo4IfRhEzMf9gs@lizhi-Precision-Tower-5810>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-9-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524182702.1317935-9-dave.stevenson@raspberrypi.com>
X-ClientProxiedBy: BYAPR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 0319b694-fbbf-4ed0-aede-08dc858a182d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|7416005|376005|52116005|1800799015|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KMqGrDQ9QlQQnD1sZ59EES6CMkEoWFnXYsC5WW6hrSvEPQBh4MRTN1jlve6k?=
 =?us-ascii?Q?PYktf2NuSD/b14cyR1QT/En4RmEItIFFPWsOZcw0/on4J+dx5NfDmpqmZe+i?=
 =?us-ascii?Q?lHbMoKSDKZomAZItY2w8+ezEtC3SNrtYuikTq8+KHfCBJIiiGRzy26FKb9pI?=
 =?us-ascii?Q?OxRovINM0r4lCD2t2WKkhz9eTczGN8+dFybd5M20P5Zt+ZJVmx7e2A/v9DlL?=
 =?us-ascii?Q?lnvG3rpYK1r/L3buWcuHp0srexM1lr7aAMYHqGfxAwN6HERmN8WG1sdhHui3?=
 =?us-ascii?Q?wFalfnrI6FL4qZ9rfHOJK8hP82CTh9258t3JEVHg0pRpLx3W5aZVuBZ4Sy5y?=
 =?us-ascii?Q?ll6yB8qt540feY5uPUt8AWP4IfeyWU7mgTRPJf+SFmXzokwdvY2I8l/0yk8G?=
 =?us-ascii?Q?Vyr5fKkh38jf0TJfIWYozrvjFYX4+qSLhYvCoNMYRJP/vTSLjUfAT3z+GhXp?=
 =?us-ascii?Q?tRDHCXs+wSG4SnkdT4zbC+5qXADB/YrhuFeqIfk1aed+gxlWDapPgOFjWX/r?=
 =?us-ascii?Q?XoPGYV5bvZV9s+NvWZAklNueTEPIojqaTindKNZreEvow56oyVuARjMeo7gP?=
 =?us-ascii?Q?QgREV5ulj8EtP5TIYUrVZKf3FeVv2C0SaqlgGnvovkw1BKSe+24NkgpAjvMF?=
 =?us-ascii?Q?Im1sdMhR2NvKfj27/6aLEmZMBzpevysjXtJapBOYlSny07h/om4y2pyKgw9w?=
 =?us-ascii?Q?u57A+CoRtAtLy3SDV8oO5GvhS0Y/Sj5hdS+RemmABciaLKpoizw+PggehC6v?=
 =?us-ascii?Q?jo6PAFaeVBlsEwpLotHo/vt032nBFJUBxe7wIKs8WB5QQkrohXhSVRo3gqBT?=
 =?us-ascii?Q?aLz7+XkAb6elOkAP2+vHeo4WmERPDuuhVdDiHvNGsPTaP3kDucyCXMpjSyST?=
 =?us-ascii?Q?SIfZiE+hHP+ED5HQw0aptGLTLpjzlNf4DEUALr5CSoyHm5RLDwxKQ0ENcTST?=
 =?us-ascii?Q?Ee6ZJYFWu9zhU8EySukflqIVlBH0DhfSx5FG96eVxHRqdVf7AB7DatOwYNP3?=
 =?us-ascii?Q?QFkFhdNrI3C5u0LW/G62D8MDT33SX/utW46jPg0iERxGHoDG9K+B9hGrPM4f?=
 =?us-ascii?Q?mZLt/P2V2qnW//WkK+ckaa3mHURpwVjANPLX0LNCkOZ0K69NOOWFbddv9A9G?=
 =?us-ascii?Q?p7b3IgRj9sBhhH/o3ez4zgEF+V3rQSuv68QkSh9r1Lb5YolSWb3T5nE4IEe7?=
 =?us-ascii?Q?RBkY+nUaNsGDKA1I16jlpepbjkk2iGmYvxYfIzw/ZY//9//uk1pHlBqUT+46?=
 =?us-ascii?Q?aoANpDS6UErCk+IyjqyqhEFCz9RyZwX+e7o0NcPm9yJBqJ2IDAzRI495g+rV?=
 =?us-ascii?Q?IJ/tg3v5soCfz9pBZ/ENH89oQwn7E33puajkXXJg359uFA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(52116005)(1800799015)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m5yDdZD41BFVCa2kZ7u764hjXcWyZ16fmKckUaILteKV1rz9hXIMwo6LErvs?=
 =?us-ascii?Q?Z2IL9D0Re1/caOtV9nNdqD/KQ17IZsSgy6N60wXaDoRgrf/mSQv/EjCZJHxX?=
 =?us-ascii?Q?maR5ajQOQWFyFle63I2TS+n1xQ9bzz4FWiE56ODvBEQIY/Soxs2+kdxUiLF3?=
 =?us-ascii?Q?X/WtLjzA2aCSqxeaTWsM89MyDIHx6hAEmyj9KeKBtgOFqQzXsaqLm2XAfObf?=
 =?us-ascii?Q?NMkdD5wouUh4kAdSX7o0rzLnOG58bV+tQNgT3PqOgA/AKz8SC8BO1LDV6Xa9?=
 =?us-ascii?Q?FsaW6/PKqRhBF293kFUE66NQ5U70DW4IZZCeI/hY034JfURxfr5d7rVXHVXP?=
 =?us-ascii?Q?mXbUngB2dXfmtOkrED5iDxtva0a4xghQAxBhM126rOzeA8rvu41MD74fkuwZ?=
 =?us-ascii?Q?Q+8Lv9sUljtICAO8ga50ICLiaAiEktmomdc92X/MhQxNHAw4aPcNt9iYehzc?=
 =?us-ascii?Q?7v54c4XNRZAalQX9i8rLV0P04rF4cmxjdRtkEfUXxLLLHvqwOsygOvA0OAoB?=
 =?us-ascii?Q?1P2sV0XiPrBPXah9X7OTBAjYxPtrvOqCbgvFv18HAQo7Pz5Uk3fX1gHjrc3N?=
 =?us-ascii?Q?PfTfrtiadUh8uSkRKdSGeagZHvWVMxJwZoBqqMOFiFvwzvmOpqky/b3VUNEr?=
 =?us-ascii?Q?TcU4pepU9X+m3kHgm2MglMoC+VcO2u7/8S93dqH9/2gQQlBRWXwoB5RVl+l4?=
 =?us-ascii?Q?azAJVDxoiUlwETpiYoJTwc+8VvmvpoysRk9rg4U4EyEUiOJWjxKnM+24WATW?=
 =?us-ascii?Q?OuUtS7lBxLDXfttE1wAs4cyVALlqmGNDew0lWVFeRekw7aOCfVE8MTIJsIHh?=
 =?us-ascii?Q?Qxp7VmCN/RJMOAa7v0uQNK0UgffveIWXhSCYV1vzu4Rgq7QK/hwmVFJURo51?=
 =?us-ascii?Q?vrlFgasIVG/zN16XGO/hcRbsFSon0JgIwLndSywSAvyVwM8SWJ4ehT+K7Jry?=
 =?us-ascii?Q?eN6PUWl0HNhABPs0k6+4cw5xMHVLA+L+IpDKq64SdmJENJng/0WCHfR6xQf4?=
 =?us-ascii?Q?aABhV2iPrOBA1sAo0oTeXLHZvdwDNmKnvAQEX1BhRfWWaApFby26OH308U0s?=
 =?us-ascii?Q?L0ns3dza8sUs/ZLz/PderCp5yovMlUx9LS6TffO0G4Wo6w2yAT6+1a0TT2It?=
 =?us-ascii?Q?xCapuR76nA4CRia6ejmAdNsju9jNZX3kHp86nDki7q1abA3iyJt6dbDG3ZEf?=
 =?us-ascii?Q?5UqObcuV0MKU1sDKvmtH2JRadWQZL4XQ0Ab4vGgvICG7IHEXMAP48i7ndNuT?=
 =?us-ascii?Q?DNgpUwWzCDV8W7hlaAHCbVZyPwbczAmkfcScqgjUrJBCKMR2jCixe5/iBTXT?=
 =?us-ascii?Q?rQ7KwUhONQRRAbo21LRAbKOnU8i/gPGxueUyclhIA34xs8j4gy27FDi4E7pQ?=
 =?us-ascii?Q?a5zWpGeiUA7Cw1sdYvF+HR7v+jzBUFY7+LaT4iMzYStmyJ6EgbFfedZrL0n8?=
 =?us-ascii?Q?I28NqU2lJJyOGACWWX3K/WfWDtXdY8JFMzDBX2Sm06wq6Tsb+U8ae+YkoiAK?=
 =?us-ascii?Q?Gt0Y7yHqumGcrzUmXzQ/7q370EflQo46Ft7bnheh+AE8J+qpMruSkqhBS5FU?=
 =?us-ascii?Q?w6Oq4fDmkIeyJ93j1Aw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0319b694-fbbf-4ed0-aede-08dc858a182d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 18:05:33.8432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V08tGu04nPFoB8QDgQsT5CeNqZoesHSvcRfrVf22hbyGwb+1hCYTnKa7oIbZYaapmbr9FzJ4qnS498ADRLbO7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6832
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 24, 2024 at 07:26:52PM +0100, Dave Stevenson wrote:
> From: Stefan Wahren <stefan.wahren@i2se.com>
> 
> In preparation to support more platforms pass the dma_chan to the
> generic functions. This provides access to the DMA device and possible
> platform specific data.

why need this change? you can easy convert between dma_chan and
bcm2835_chan.


> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/dma/bcm2835-dma.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index e2f9c8692e6b..aefaa1f01d7f 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -288,12 +288,13 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
>  }
>  
>  static bool
> -bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
> +bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
>  				 struct bcm2835_dma_cb *control_block,
>  				 size_t len, size_t period_len,
>  				 size_t *total_len)
>  {
> -	size_t max_len = bcm2835_dma_max_frame_length(chan);
> +	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> +	size_t max_len = bcm2835_dma_max_frame_length(c);
>  
>  	/* set the length taking lite-channel limitations into account */
>  	control_block->length = min_t(u32, len, max_len);
> @@ -417,7 +418,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
>  		/* set up length in control_block if requested */
>  		if (buf_len) {
>  			/* calculate length honoring period_length */
> -			if (bcm2835_dma_create_cb_set_length(c, control_block,
> +			if (bcm2835_dma_create_cb_set_length(chan, control_block,
>  							     len, period_len,
>  							     &total_len)) {
>  				/* add extrainfo bits in info */
> @@ -485,8 +486,9 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
>  	}
>  }
>  
> -static void bcm2835_dma_abort(struct bcm2835_chan *c)
> +static void bcm2835_dma_abort(struct dma_chan *chan)
>  {
> +	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	void __iomem *chan_base = c->chan_base;
>  	long int timeout = 10000;
>  
> @@ -513,8 +515,9 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
>  	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
>  }
>  
> -static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
> +static void bcm2835_dma_start_desc(struct dma_chan *chan)
>  {
> +	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
>  	struct bcm2835_desc *d;
>  
> @@ -533,7 +536,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
>  
>  static irqreturn_t bcm2835_dma_callback(int irq, void *data)
>  {
> -	struct bcm2835_chan *c = data;
> +	struct dma_chan *chan = data;
> +	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
>  	unsigned long flags;
>  
> @@ -566,7 +570,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
>  			vchan_cyclic_callback(&d->vd);
>  		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
>  			vchan_cookie_complete(&c->desc->vd);
> -			bcm2835_dma_start_desc(c);
> +			bcm2835_dma_start_desc(chan);
>  		}
>  	}
>  
> @@ -594,7 +598,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
>  	}
>  
>  	return request_irq(c->irq_number, bcm2835_dma_callback,
> -			   c->irq_flags, "DMA IRQ", c);
> +			   c->irq_flags, "DMA IRQ", chan);
>  }
>  
>  static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
> @@ -682,7 +686,7 @@ static void bcm2835_dma_issue_pending(struct dma_chan *chan)
>  
>  	spin_lock_irqsave(&c->vc.lock, flags);
>  	if (vchan_issue_pending(&c->vc) && !c->desc)
> -		bcm2835_dma_start_desc(c);
> +		bcm2835_dma_start_desc(chan);
>  
>  	spin_unlock_irqrestore(&c->vc.lock, flags);
>  }
> @@ -846,7 +850,7 @@ static int bcm2835_dma_terminate_all(struct dma_chan *chan)
>  	if (c->desc) {
>  		vchan_terminate_vdesc(&c->desc->vd);
>  		c->desc = NULL;
> -		bcm2835_dma_abort(c);
> +		bcm2835_dma_abort(chan);
>  	}
>  
>  	vchan_get_all_descriptors(&c->vc, &head);
> -- 
> 2.34.1
> 
