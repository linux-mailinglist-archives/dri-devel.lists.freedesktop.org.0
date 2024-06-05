Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BF38FD5A4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 20:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E26B10E3D7;
	Wed,  5 Jun 2024 18:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="G2l0SHkf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17DB10E3D7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 18:22:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5J+HklMf5iRbaIGS/UjY5X/WovhGVHiv8o1t6J0j7L7QZ+jgRuSvA/mx25drQGdSd1Fra9vpaMz4Do5QF1079vlOawqQzHjYQNudO5SolYIM1K9aBExzefqwYxyYP432+/LcxxJ5nQ4hSseohl6Qd2cZSdzAchSe3perJg+H2b+GUMGKxLgKMUgbxAd/VUBlvVVedre535y2ze7+uU8trC/jBrV3qgnB7G+QUU08d3w9bNMCPWIsljriL2y3zTZs5UL3f5fOE/APMOeWVNXeQp1ftQZAzOTC2H9RltUVd3r2/p/gnLHJIMt+WOSA1RGEHtJfG2Y7DJ4dRinaLzqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dszcuq6HlSwdoLPPVVZg9vO5F4GpLQisiHO35fj5OM=;
 b=UsJEVcGE26RF2M06csPu/13iytrvAhANqwzjlO8GQpz9dPRDhSEM1O3ltGMIehMlwTVmYZQ8CUtrc50TuPx3YWQIx4nLhiSH/vK2A7x7Buhuqj13tv5Yw/lpmh/IPrDD1LzySu2GkoJyNRM0JIZrZ31Bruvb0VxVuu75aoqQNje9QVGevnnpMXzhzgpqeystnDnR6EUH9Yy1XcFX1n+IL/W+u+Vw4Z+Nt2D0xGn+Omc8E7NZmbX2OScspi6pzF6k5bu9KGz6rCWlY4Ca2/D2p/Nph/bHDz6zJ2K6if9RH878i8qkqo4VWiMn3TmAIsEY0WCYUQtTHB6AFvBTAJSNZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dszcuq6HlSwdoLPPVVZg9vO5F4GpLQisiHO35fj5OM=;
 b=G2l0SHkfQ9bzoI6k/lnTCATL425h+PHcjtgCqDkuK4GGDkL9pf745uOvav+8MaD1WbFe2x4p/E8OpH4hFTHyd4gJrfJ3AGB+ZEYrU7xJHFyix+b6ExS6UAdg2j90BIoYqiUDN8tHt+fHy5oRJA6iQW1E/IBrbbAR4zR+uhBdTvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7378.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 18:22:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 18:22:38 +0000
Date: Wed, 5 Jun 2024 14:22:26 -0400
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
 iommu@lists.linux.dev, linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/18] dmaengine: bcm2835: Use dma_map_resource to map
 addresses
Message-ID: <ZmCs4vUoM7WYiba4@lizhi-Precision-Tower-5810>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-12-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524182702.1317935-12-dave.stevenson@raspberrypi.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: ee335081-7f73-46c4-ee67-08dc858c7b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|52116005|1800799015|376005|366007|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jEu1HeoW81K22zWPJMBYFQJzKFdf+sePOw2jbV13WyNLoBf79CnKSSVktywi?=
 =?us-ascii?Q?PZX7n5lBoLz5khxFouiieeeFac/FJQQK8g1HmUoKdpBYRFP2wbgprfH1rE5S?=
 =?us-ascii?Q?JsR6gtYYvuubLs5mVKfME6cHBM6jFqX/8vvIUJyCgnnbwZmjdwGX6L2IGFjq?=
 =?us-ascii?Q?kw6TnVaGVlksbrd3vpEK5GV+4iWDWqYPID4YRPD2AmzK34NRPlSE6SbqeGZP?=
 =?us-ascii?Q?1UlglQpK8o9XP8aBsufxlzbP6dpbnpXlxqq6Lr3YNeL0gcEgYgPOE9RaMBJI?=
 =?us-ascii?Q?ajDzLtE/Bugzs6uKCdnQXfUaWkk9ST3eYhCFjRjI4paU8FbMXWzOIgHoGsor?=
 =?us-ascii?Q?9oCs39JoYisptF6IkuUG5rYwJIIISq6/3qSg3MCpqyQr8KetOb/PQaRMxSER?=
 =?us-ascii?Q?HzgRyTJVMVTn7HeIjzNZSVbMpC7Pp8KRFeOpzau3fQptNLXw1uEYBtwEfjNR?=
 =?us-ascii?Q?ewUP2UFahW/erhfibcHuFTHvuQP4ZRtJ573akhbEGfwt3zs2QpaPWccBL/Uc?=
 =?us-ascii?Q?2FXkoM/2c6con1hqijsUgc0ZcQs5ElOvdJ8wNL2JQYYxJqABc6pqGmET0HMQ?=
 =?us-ascii?Q?wTTnNXs2MoMf5qS1UbqzIeze+OUd8eys1MS06xLk/feYPNzUPBMbxRIYTJVc?=
 =?us-ascii?Q?D/Q21Cc6T8/Uqhb2O3Tf6yEPWVbZSLPfxpkc6Xr3uDoOWGM27Q0CKYxM739e?=
 =?us-ascii?Q?hNyoUSNOU0b0/QlUDZotW1p0ECQskdm7xqmp5aIebFqWvrLkYzOcHpwP9ja/?=
 =?us-ascii?Q?1O+PymknTk60ko7qfnDzric17TLA8AK+qKUxWdnKcnRF7bwLJpfw56oSBL36?=
 =?us-ascii?Q?IkqpgRyp0nom2ElHdLzJpdSZuaakCJ7fdtr/aGusJIVYz7zPuucsyJ+PgErg?=
 =?us-ascii?Q?cquArne1aEvPkyAof1NIDnyRGHtbG79dmWAlZJyTKsPqBqfpDgs71Se4C/52?=
 =?us-ascii?Q?AgwxKScPi16e/PQENQfAXBGSy/A25e0lUu2AtSgb+eC70EZRaPzZxQrkxaoe?=
 =?us-ascii?Q?J1Lqb9UldNharlUfWwraqRUxrJ+RZGGtZxzJGok+VbEm7akQeZ8AuxJnVuSh?=
 =?us-ascii?Q?oZeVco40xQhnqpFGOTgDPEsyDteb5+q+nbEsnMbPO90StJcAm3pE9ORGMUbL?=
 =?us-ascii?Q?xRVYAPMrBDOK75fKKQRHfC9Snlu0tdxE9T285+vhgv6U7Ye34OJwngTsyPTh?=
 =?us-ascii?Q?/A11kbRzaypeHru916rZxhuj5GKEwlOUX9Vjs9lU7K4gJt9jPD9ObrBsg/W8?=
 =?us-ascii?Q?6j/dh5t0f09bybV5Ilb9XXmnmFfarI2trlv+PGQRLPuo3VrJGuafzzvHs4M8?=
 =?us-ascii?Q?9MZBjZ/QwXX5fdZ0YwIUDSNbErsDDqOFrXKVjhM3caxN5VY6IAlyDu4qPG9q?=
 =?us-ascii?Q?pH1KS50=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(52116005)(1800799015)(376005)(366007)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EsHZZk1v/j4K0xpMr/cxKXohbw4rAclPgFRVzRAVzH0JV6LD6kEv5EmEDv8u?=
 =?us-ascii?Q?BYSI2hKV/HOyyiSc/GN7lv9/372JzVSKRmtuQZ8R9SZPM9XprEV++ilXugsu?=
 =?us-ascii?Q?McxJRM8mXfp2RMqnz5AQIXG5aYYKQ7B5PnOoSP9IthbMT7icqdUMPFtPoS5y?=
 =?us-ascii?Q?eQsuN3ldG8WOchwa/4/VsevWU2F6USbdnNhNBNspINnrr196LlnHD3ppJHHI?=
 =?us-ascii?Q?qqSKeE9gwytUJ45+P4gJucWxo1kNRvqV4Ak4JiD9MpPbNVg012qnApY7diO5?=
 =?us-ascii?Q?d/+QlrjRxsxtOY7W1Kg1gkfBeJD7DanV3MwKFzH3RUNF+QMCSIecPiO8EZHA?=
 =?us-ascii?Q?hjZMVlYLmi8fhfxYUsJlhoUn+kG2YMkKhgYE3EJUZBKkk4VabfW6tFiboC2/?=
 =?us-ascii?Q?gAH++l65VX+KlYc7GMqoP5P0FOWfMHLnU8PsMPD5Qbo1KDw47rPZqdkrAuPa?=
 =?us-ascii?Q?ukXleA7ZIBOYf13bK41nq2Gh8jBjVthrQFp5sP4szYf5pxFgdQSaqYew+bXw?=
 =?us-ascii?Q?ZckJHmUlnte5o1eD9YRPuSr9rgdpimo52fo/OSZ+QrbYWIOoDJgCfDf93Uy3?=
 =?us-ascii?Q?cXQzPp3y0I38xqVlxfoZZMcrHC6pCuXF8ZGiF5G7BsnlAvJgxz39lmgPlsuA?=
 =?us-ascii?Q?EmF+Ph72ZTQkbMB6inSpbZZ23lSck31eM3Ak3sBRPnVgZXxU0fDmAMkE+2lo?=
 =?us-ascii?Q?kajRINHmh/kL0pOAyp3MMeqlF60NCU4iCpQQuRPUqfKTND5umQ/8Bk0JKNBP?=
 =?us-ascii?Q?yuxd8W7utcWWMYhrinvV5GvY7c28JCFTJtn/D1SvIDGerg/Q3pTHxSr8yX2n?=
 =?us-ascii?Q?KFUFr8eaKnpOwqwEwKYR0YWAGej9GI1i2zP4wm+wWwjfCxMY91jKFlZmuGfj?=
 =?us-ascii?Q?0wzVuuR3WcjEf2o4znlZFUOirACAhugdbhI0ZZr/EDuleSIx5Lmwejpwi42X?=
 =?us-ascii?Q?jF7u7anHGtvXu8rQLXYtyBwrWCdctLS8ZNS5HcPMno9HqrrCjUCMHoxHL4sE?=
 =?us-ascii?Q?X82ESVgd1FVv2PeyHQ+s7Q6klPA0RtgA1Cni8GGjyvwhacWtunPIGknmVfEo?=
 =?us-ascii?Q?ykUxWm8R7Ye0Vot3EtZ1P5+KpzBD4VPSJ3wnQ5KBd/DBewdy3p6XZjUEw/l1?=
 =?us-ascii?Q?lCg/BTrJU9QoI4NRRLNh0/JVNSR3Nb12qfQmKRKYwYLxdTp3yQ1ikWJQibJD?=
 =?us-ascii?Q?f+c8YVGBBMBs2WccCQCgXgu8St65YpvJVikAGWx5fV1d+9CfKJ2g3ZYIIFXh?=
 =?us-ascii?Q?13F/i5SRjNzFdpd0fr7w1DuMaEjnPVGHI2h63K7weZX4CiwGa+GFGy+5gY2P?=
 =?us-ascii?Q?ruLPj1CdFhYDqaDpNB3wNeqv98O2rlt4A0HiwhBAt1i0dE4WmZ0doyEhmowd?=
 =?us-ascii?Q?dojMOiejq9wjz9ZUzouiy3VaxAi9G2Px2NrSPBivmQkOZIDrtfRBeMooNxQg?=
 =?us-ascii?Q?xCYv7+ZU/RiL9xqwb7rhsxlwffXCxPUWjny/l++cxD8j/24Xajj8n6kMi5zV?=
 =?us-ascii?Q?JraIxq712bAeFchcd14d+R1K9cm5jTDcIBhHANZXPFleY6+zpCao1EHg0Mh/?=
 =?us-ascii?Q?wDNgItvxYFuchrdSIJirE5AJROtP/QCG+Jo5PrLK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee335081-7f73-46c4-ee67-08dc858c7b1e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 18:22:38.8915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmDCPB4NuqXvRzhGTNC1KD/krwkB+MBAzbvpIAIYMCu1vtW2dHfLrJCigdMxb3tNbJ2ny+aD+MM2KSrOw0f5eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7378
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

On Fri, May 24, 2024 at 07:26:55PM +0100, Dave Stevenson wrote:
> There is a need to account for dma-ranges and iommus in the
> dma mapping process, and the public API for handling that is
> dma_map_resource.

what's means?

> 
> Add support for mapping addresses to the DMA driver.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/dma/bcm2835-dma.c | 46 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 9531c0b82071..e48008b06716 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -67,6 +67,10 @@ struct bcm2835_cb_entry {
>  
>  struct bcm2835_dma_chan_map {
>  	dma_addr_t addr;
> +	enum dma_data_direction dir;
> +
> +	phys_addr_t slave_addr;
> +	unsigned int xfer_size;
>  };
>  
>  struct bcm2835_chan {
> @@ -294,12 +298,44 @@ static int bcm2835_dma_map_slave_addr(struct dma_chan *chan,
>  		return 0;
>  	}

where umap function? I suppose you should unmap all when terminate chan
or free chan by client driver. 

>  
> -	/*
> -	 * This path will be updated to handle new clients, but currently should
> -	 * never be used.
> -	 */
> +	if (dev_size != DMA_SLAVE_BUSWIDTH_4_BYTES)
> +		return -EIO;
> +
> +	/* Reuse current map if possible. */
> +	if (dev_addr == map->slave_addr &&
> +	    dev_size == map->xfer_size &&
> +	    dev_dir == map->dir)
> +		return 0;
> +
> +	/* Remove old mapping if present. */
> +	if (map->xfer_size) {
> +		dev_dbg(chan->device->dev, "chan: unmap %zx@%pap to %pad dir: %s\n",
> +			dev_size, &dev_addr, &map->addr,
> +			dev_dir == DMA_TO_DEVICE ? "DMA_TO_DEVICE" : "DMA_FROM_DEVICE");
> +		dma_unmap_resource(chan->device->dev, map->addr,
> +				   map->xfer_size, map->dir, 0);
> +	}
> +	map->xfer_size = 0;
>  
> -	return -EINVAL;
> +	/* Create new slave address map. */
> +	map->addr = dma_map_resource(chan->device->dev, dev_addr, dev_size,
> +				     dev_dir, 0);
> +
> +	if (dma_mapping_error(chan->device->dev, map->addr)) {
> +		dev_err(chan->device->dev, "chan: failed to map %zx@%pap",
> +			dev_size, &dev_addr);
> +		return -EIO;
> +	}
> +
> +	dev_dbg(chan->device->dev, "chan: map %zx@%pap to %pad dir: %s\n",
> +		dev_size, &dev_addr, &map->addr,
> +		dev_dir == DMA_TO_DEVICE ? "DMA_TO_DEVICE" : "DMA_FROM_DEVICE");
> +
> +	map->slave_addr = dev_addr;
> +	map->xfer_size = dev_size;
> +	map->dir = dev_dir;
> +
> +	return 0;
>  }
>  
>  static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
> -- 
> 2.34.1
> 
