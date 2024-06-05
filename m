Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9029F8FD582
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 20:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EAE10E39A;
	Wed,  5 Jun 2024 18:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="h3jVZY0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2066.outbound.protection.outlook.com [40.107.249.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3C710E39A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 18:13:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4RXyqxeXjfzSLzBiJucJ7TeHIg7lJGN1RFMQtrzbQZOjpbGFAJoNEV8pLVhfHFNKxcITviLJd9qG27QY0T9lqECDGkfVclbWOwU82MyPeutcqCrWQGSBPcy8cJ0WwLxvDiz3LqVoFPfS+kXNCeqiBtUzTCrgGoHtIYGDD/BKUZ8q6/EfxKB2IRxdzv4EFhdvrASPj4eEgJ2d//vpSPw4CwvaOWck1WuT4vYF9krXrbtqzOUKP1P69JCIjYeSdBwNJ6UI+LH0VzSif8QRbYn9lGr9yVmSulqaXm0ZmeKfRHVGrv9YWIVhKjH2x56Ju0xgpFZL41ctfboUDM365BxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7Vg1M2oFwK6yYwf+jz0/fn9iNOAJKJako3w38JvBa0=;
 b=gX3ivc+Dgf4AjEyd2+wk0xvUj8PxoatmHrNHC1Y42zhMvYE5fXPh+IcGZfQCk7MJw8u8TMdVDXuc7DudMRnpC6jKLaV0cnp0G6b1SfMqqUy8dUfXK5IYULEgNMzWufqa9DO739OXelgpwR8Gfq+zNLjRl3cVj1iQUnTyu70XPDYk0l2X2tczOka2Gwze47TmYSZ1AspjdtOKEKbveLbOzZFFBo6+mMiUcmEdipJX7FbxpM+IzUlzAgTJsiwbZhk8vdjLvuc6IFEOw5uTEYGA6INQYKu6ar54mDWBTFcXg3J39mA6wIEeLAD7QyDUIzEHNwu1Vpr/glwVg8ZPD8dNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7Vg1M2oFwK6yYwf+jz0/fn9iNOAJKJako3w38JvBa0=;
 b=h3jVZY0qmJvaTLMCG/WmDma5t1hhlLYBll7PfsdTUecGLoWtwoIz+tSuGJWRjhbd86cUPna+zhrKSvbzKyhzNjW3P5+9NLEq3kXDiXgnA8ceTdnq9f9DhlemIzJ7+OCVtKhBrvcbVxN95Qms1KAwydIFdEZys+uhVHprOBSe06M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10323.eurprd04.prod.outlook.com (2603:10a6:102:44e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 18:13:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 18:13:38 +0000
Date: Wed, 5 Jun 2024 14:13:26 -0400
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
Subject: Re: [PATCH 09/18] dmaengine: bcm2835: Add function to handle DMA
 mapping
Message-ID: <ZmCqxhv2jF3bT8dH@lizhi-Precision-Tower-5810>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-10-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524182702.1317935-10-dave.stevenson@raspberrypi.com>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10323:EE_
X-MS-Office365-Filtering-Correlation-Id: cdbc0140-0393-46a5-1427-08dc858b393b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|52116005|7416005|366007|376005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d7IKPpghG1nZP+Q7fsPN/jAAFOa9gUecZUw6WXe0S0VZ9BjwplCuiiO/qd72?=
 =?us-ascii?Q?T8J7ymqHfP9GoysHU0t8fzzgZv/TOB4w8DJjM2qdQoAMjh98swr2TWcG+gav?=
 =?us-ascii?Q?r7E1IxlP4ziT7Cv0JU+TYU0VontZl7wMl6kA817uFSEDzv/WM832GMwaR3l0?=
 =?us-ascii?Q?0XCUtYzoWtCL77Q2p+eiz0Ty1do5o3pTFexCyt7fufRoobQFu6g4Y8n2LZon?=
 =?us-ascii?Q?xPmINebD+Ncmc4eY9H7RJTzjlFaPmX7niQscG20SBOm1+yYEjA4+IRWoiyjf?=
 =?us-ascii?Q?ribsA44FN3wOtvVwkFQo/frxyh9N+hsz9a3mCRiiEVrlAJbU61qz7ob3z1pP?=
 =?us-ascii?Q?ZpCzNZWeYrebMwpvLu6JI17MtRLtqbLLsqbmabZ5ruURnRJjlRym8yz2at6Y?=
 =?us-ascii?Q?BIbAhDyYj5HRWHFs8q+F+4ymIMzfqU+Dra94gcyDhnM9yncX55ZnuYp1baWG?=
 =?us-ascii?Q?6pxv6lPC3Re0R6KFzf+R0VgMLFo09Zmae/7hgkkgDhCz0s6labmBaa+f1QMC?=
 =?us-ascii?Q?gHIA+/bBgRgeRnjIgVPSs0DuCLGhqVHUYYjpPY6JJe9Vx9YMPmGIAY84YJmP?=
 =?us-ascii?Q?idC+R0lSYTW5BbtZaDUwl5zU+NUnDFvQym+impcZ/HO/n3Um7ECUrv2co/aN?=
 =?us-ascii?Q?nr4SbF+dQwzVa5f6p/kMyvmBKw1A8xUFM1z6BUMc7tz2dI9Zsv7imn+mFEsM?=
 =?us-ascii?Q?mIkNTgiZnZ2dtIr7YnQT9ZsIf/RaG4QwxPmilKQ49EDwcFRoP9KFTu92sxy4?=
 =?us-ascii?Q?4M78Ud46i6PLSLxd/jwr/jBnMll2KdSBSQDz0depYdKzrzpgieCSGYQ2z28e?=
 =?us-ascii?Q?+HtVEM8zuQDbXKPub0BCCw0Q1Po1LTIiwUs2a61sOnbIc/Gfn245FmkF2XlF?=
 =?us-ascii?Q?cO03/feqw9A8rCgW+nfdVuin1DoXYZquXAXtgb1wEktsZVbc6symQ5IqHHT5?=
 =?us-ascii?Q?9H+FkATgQr8E1TcIJh6nW0OJmYYEHzeVOeyRhZ5mGEE3krgjF5Q/0mQMu8t/?=
 =?us-ascii?Q?0a3iLCDHPj9c2QBEWq1uqQwqu0JBPXWudkrsEp9wcTUye03YtKbDsDmzj9Lq?=
 =?us-ascii?Q?mTQNhwJhljgZz3juIOyk9h2klBvqHZ5qd0PLEKZPqJMlkqNeFncOHx6oE7XE?=
 =?us-ascii?Q?KqC/UC6/aYxjyI8tH3rtAGt5PefiY/LYbPOzZlS+DV07cggLASL+9O+KPIhs?=
 =?us-ascii?Q?/2Vrbc4idi7+WdQ7qK0m5ZGwitKa6+OaeAqg8Mtg2Z5Y2tat/pJj+EKOcj9C?=
 =?us-ascii?Q?aRWy4NPQ5MezuR8cRKUfTv43cJmj4aO5Y7zi0FKp5NHUUHe5Cd6httv8ioMS?=
 =?us-ascii?Q?I1qKpS+AEpYP7eTmy9koTOF7ZD4bAZ5cIW/hGGlhGMBfVg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(376005)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KTynahmYKFvKfokWmxXl0RelbBO5yyv0Zv8IqgkP+7p2e5uGAXkuG/Kcx2bD?=
 =?us-ascii?Q?Vrfbcb1hdAwu+9tcRoKIqWyC+1bbfGxnrbex+KlnJsyMLmiAmKewHYNMEjN7?=
 =?us-ascii?Q?Lcy4iC+aU6i8PuFzIS8ca4E1dvikT4X8wHTf/lfJ857TEIWEhpScWQTxzJoU?=
 =?us-ascii?Q?wZuk3ViMiHRSoj1ualJZGsS0CNLy4MFkMt5W/wn8Z4TN1Z61BrAr0MfPULIl?=
 =?us-ascii?Q?63+yt91EYiZZq4h7DWSNGwxTYVm4Vca+2TUMZgMwUMN3rj0z/UYwZ5StLzU5?=
 =?us-ascii?Q?BhF0pONmucJsAWpPl+wVz+bzNNPeTUXnriWlrx7HHLUlLMd0X2MibclX888S?=
 =?us-ascii?Q?3P6ZfxCFTkGYbz1BNQAQ2MYhL4HqGLYZN6nJzPFIujkCeDjfnES1eNrbvGPl?=
 =?us-ascii?Q?/J1wErFH2O2uA0/poGcpLgegWHisxqFq2gwg6RmDiaiMlAu0qLEhz5EIq/vJ?=
 =?us-ascii?Q?6WVrpIs9ydxn/PE4vZCN859M+APcsf79FjiVeB4VHbuO6khTrQGgnUqebkzV?=
 =?us-ascii?Q?nR55KRy3xYSvYkZw5CCN1jRdMPQQJit5zGf+YTYLsS98eXIMThd8sEMyi6rI?=
 =?us-ascii?Q?ZaCB3RlxrG3Ocax973sCrfvpmMDec0RT5qI3GCDoeIn5mms4hQeURT9sfHrV?=
 =?us-ascii?Q?U1rkebFgd/20yfcXSvQjyGhraJ7lYXy+5FSd8u9KZiafQiOiu/RlkDJJv7+7?=
 =?us-ascii?Q?cCS++RfhtFkaj8ElZxxweq49bBiUm1n/V74JYmxUpy6qSda0opCs8eRsa3bm?=
 =?us-ascii?Q?0fZtCdk/Hy9Tpp34yalKsxt+65qoD+pqJTk8z/raSgfVxjmQBXjof8A0EBUb?=
 =?us-ascii?Q?miXrd8/1/9hEAU9jlL82Dp22BoiXbDHbtOBv0AUNSs/7xSNgxPu7vpAaIDLJ?=
 =?us-ascii?Q?bd7nNMoK1k40G4+L87qXy1fh/ScJdowGWMXI8Mwu6QBbay1Vn+ZgGhBXjNFx?=
 =?us-ascii?Q?+Vz6QA+DQD8d0b/TrlKRpFKkXf8EXwd7EYqb/Q5t4+G/xLF84tuqj9vb3P0H?=
 =?us-ascii?Q?WVczqpRbWYYH20M3bPWG4XXEphhcSSEg4Z+Ruqvx7f3ZlzzVqJNdYGAPTu7D?=
 =?us-ascii?Q?bSZquIhu+QVeXcyHT5V6UHwZO/Jg8uvGbbzCD6mXMLJs9RknU/yddxyopTx8?=
 =?us-ascii?Q?vI7O9lWy+r2+FG84WuC0GOS/2OEwXiJGOjuN2QEYN1EHRUmvB8dpimOlwgLX?=
 =?us-ascii?Q?yDyJWiBSSZIV8sctzuOWcY3a/xUgLJFo/BCKPVURTYUuO6ZeneilKO01pQj7?=
 =?us-ascii?Q?TMq0pEVCIdkv8CiA4mwY7qbD+VyOm8uQfFBo6/K6ESaZfDnrW1et5YlTm5cI?=
 =?us-ascii?Q?VtpOwv54wkDwy01afH5R6YJHBoCFJrgf5xkZuiPhmAC/Bhtl/6yLrap9cB3B?=
 =?us-ascii?Q?JimhaBNx5ODnqOFEOPTWERUG/CP8UatkaFHOdyzGoyCWYosCvrYnkcV6+yQ0?=
 =?us-ascii?Q?Q98r0Es1HVWf+7KMrmqZx/Nv1xL/VUhaPR7TpaAj0/PoqBEl6eoNxKkAbFxw?=
 =?us-ascii?Q?co4iUy7ehBv0FXxHUyGeJYXdhm5tP+f2PkaswwavGDtsbLaPqwxMAvGq+U5k?=
 =?us-ascii?Q?I7k5i99661rqd3a+cf4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbc0140-0393-46a5-1427-08dc858b393b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 18:13:38.7609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFOMKP7i7WE1kAbCSBZo0yHsYqDGm5UtZCAqnXxoeQldtUvxW8EDwoVwSOGIs8TpY29Gya/ST4MLMNz423dS4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10323
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

On Fri, May 24, 2024 at 07:26:53PM +0100, Dave Stevenson wrote:
> The code handling DMA mapping is currently incorrect and
> needs a sequence of fixups.

Can you descript what incorrect here? 

> Move the mapping out into a separate function and structure
> to allow for those fixes to be applied more cleanly.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/dma/bcm2835-dma.c | 46 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index aefaa1f01d7f..ef1d95bae84e 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -65,6 +65,10 @@ struct bcm2835_cb_entry {
>  	dma_addr_t paddr;
>  };
>  
> +struct bcm2835_dma_chan_map {
> +	dma_addr_t addr;
> +};
> +
>  struct bcm2835_chan {
>  	struct virt_dma_chan vc;
>  
> @@ -74,6 +78,7 @@ struct bcm2835_chan {
>  	int ch;
>  	struct bcm2835_desc *desc;
>  	struct dma_pool *cb_pool;
> +	struct bcm2835_dma_chan_map map;

I suppose map should in bcm2835_desc.  if put in chan, how about client
driver create two desc by bcm2835_dma_prep_slave_sg()?

prep_slave_sg()
submit()
prep_savle_sg()
submit()
issue_pending()

Frank

>  
>  	void __iomem *chan_base;
>  	int irq_number;
> @@ -268,6 +273,19 @@ static inline bool need_dst_incr(enum dma_transfer_direction direction)
>  	}
>  
>  	return false;
> +};
> +
> +static int bcm2835_dma_map_slave_addr(struct dma_chan *chan,
> +				      phys_addr_t dev_addr,
> +				      size_t dev_size,
> +				      enum dma_data_direction dev_dir)
> +{
> +	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> +	struct bcm2835_dma_chan_map *map = &c->map;
> +
> +	map->addr = dev_addr;
> +
> +	return 0;
>  }
>  
>  static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
> @@ -734,13 +752,19 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
>  	}
>  
>  	if (direction == DMA_DEV_TO_MEM) {
> -		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
> +		if (bcm2835_dma_map_slave_addr(chan, c->cfg.src_addr,
> +					       c->cfg.src_addr_width,
> +					       DMA_TO_DEVICE))
>  			return NULL;
> -		src = c->cfg.src_addr;
> +
> +		src = c->map.addr;
>  	} else {
> -		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
> +		if (bcm2835_dma_map_slave_addr(chan, c->cfg.dst_addr,
> +					       c->cfg.dst_addr_width,
> +					       DMA_FROM_DEVICE))
>  			return NULL;
> -		dst = c->cfg.dst_addr;
> +
> +		dst = c->map.addr;
>  	}
>  
>  	/* count frames in sg list */
> @@ -795,14 +819,20 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
>  			      __func__, buf_len, period_len);
>  
>  	if (direction == DMA_DEV_TO_MEM) {
> -		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
> +		if (bcm2835_dma_map_slave_addr(chan, c->cfg.src_addr,
> +					       c->cfg.src_addr_width,
> +					       DMA_TO_DEVICE))
>  			return NULL;
> -		src = c->cfg.src_addr;
> +
> +		src = c->map.addr;
>  		dst = buf_addr;
>  	} else {
> -		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
> +		if (bcm2835_dma_map_slave_addr(chan, c->cfg.dst_addr,
> +					       c->cfg.dst_addr_width,
> +					       DMA_FROM_DEVICE))
>  			return NULL;
> -		dst = c->cfg.dst_addr;
> +
> +		dst = c->map.addr;
>  		src = buf_addr;
>  	}
>  
> -- 
> 2.34.1
> 
