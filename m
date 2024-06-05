Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3878FD45E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 19:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B7D10E111;
	Wed,  5 Jun 2024 17:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="rPJ40FBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0F110E111
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 17:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Clar/6THG5bDrLt4ouqCQWsJ0N1s4SB8by3A6Gb+waJVWn7oXLA6u7JcMXr23+E/ZAX7TDO11d080R0EW2Q+ofsU51UAMGaAN6Z/lBwaZrFw+a2wCzoO37NNZ/4XJ6CvZU47TkY32s4s7GmJsN50sg9U+OIKx8O2XylC4u6PZwU8oLWACj5tsEG5zF0Epv0NfZmps7pkCtjb/3i4Zx5ZdEnUMV4AXE9CayHPfo95jyRFQ32sCBzyaK/4p6RGVHPDMryJCVW0HlSTxQ//tQUq6D++S+iEcwXnXM5MGdOc4GgchyafDEpOVw1UwXSaB5YP44KuqYeHM6lFNgJsmIqmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2MCWJHefvvplIk0ZxN9KujW5v9jT/VsYe8TtPCQZPU=;
 b=PMA2z2Bp7bSSrIzNeL4/tn5ALU8lCTkA2IyOsQ3K0E2k7dJYvLvuosc4+PFDJxiaNJ9rH6pSvserb2avIw9fNvKc5dAySXCtX1PE5WYdGCEtWHJNFWp2QPBPL5rDmDX9H4SAt7yG8DJw+M2m3Td8X9loUm+nU+2Pwy14V+r/dKIg8N3F3aP6ru6H/Q0HvfVHjI+wwiXFxLKDAsNQcMfHSF/t8M4+nE5KOL3mrETVeFQ2Yvd0eobHK+mr7BIICuSTlmO5L/N2DfQnc3iCz1iXkQeT8ugCdOcieiHjtjlNDBhLwgfq0CNleblKGBDln+wg22ZEawpZvtH73OG6BEl5dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2MCWJHefvvplIk0ZxN9KujW5v9jT/VsYe8TtPCQZPU=;
 b=rPJ40FBLUcaOKDvW+YfHOwp08NmNeSh1foF5HwNHgSedMBq5JDpKR20O2SJmdKT8PSmodXZ/omndnCv7NRWUSYS5gvQzEbaLEmkQluGjdHugHL8ZRk0fQofHUXNATCsBtueCbjoRobA0W3T7gRHFf5iMYu+9jE8ODSgin4+Pdyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6959.eurprd04.prod.outlook.com (2603:10a6:803:139::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Wed, 5 Jun
 2024 17:52:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 17:52:58 +0000
Date: Wed, 5 Jun 2024 13:52:44 -0400
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
Subject: Re: [PATCH 06/18] dmaengine: bcm2835: make address increment
 platform independent
Message-ID: <ZmCl7LXbdCwJm/wJ@lizhi-Precision-Tower-5810>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-7-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524182702.1317935-7-dave.stevenson@raspberrypi.com>
X-ClientProxiedBy: BYAPR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:a03:114::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8fb22c-fb9f-42d9-2e97-08dc858855dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|1800799015|376005|366007|7416005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?smBGH0rG7FoxBn5y6mWW1lS6fMjUzeTyTNoyHdOrWZQ1hj43kaHT7TTV0owU?=
 =?us-ascii?Q?LkumNSlsQS/d7fbAJt/2lpo7c0s9kR5stN3CRC4d8Zu/vMLDy2ogxfvl5lp+?=
 =?us-ascii?Q?0tbwkLpR4hgh7xFybGqTllacIxw7/Fz5knz9Jx003ufU5/icG/7GOiUyenN1?=
 =?us-ascii?Q?ZyrGJOcectGJBDrMLATrq+7+VMUahZDqXiUfM5+VJNqa1NrJ3o4c/5aCbUXX?=
 =?us-ascii?Q?6Uo8CRE75bItYjv+Ux6SDuEMj2Xq+MyiB3eIse2SriDWxVihUq3YoxkQapwq?=
 =?us-ascii?Q?HckGyVvQB30LBUg32jX6eNaXyMuzDY8e+Xxe+U6W33dmue0ZhpNfloQteSCo?=
 =?us-ascii?Q?Cetyl18h7TQfHLq1lnXL+HkhSNtQwkUTWc6gLpkE6EBI7FV4/JPTnk8vQX+H?=
 =?us-ascii?Q?RWvQqvEUEiQCnPbgOEmckNCXDG9uwiGWO3aEEBTUtfoxGrDA9SWYrD95UgOy?=
 =?us-ascii?Q?QdTMMSSXZ4VCJOXibSEy6jRlTrHrIQovMbt5g/oNkCA/TprHfFZlHcFDA8jn?=
 =?us-ascii?Q?nLL1mxUmYQLaOb6s9w57Ysdj59e/jPYJ6x8eKeX6E0gFoqIGDTpia/MttcjS?=
 =?us-ascii?Q?d71FgZkQrgKasxJIDIxpcbuo17/Y1V0wu0dww37GmAVVFqL+EiIGJf8iQ87P?=
 =?us-ascii?Q?+Nfbb8PQTkhaoG4HN3s/Tx/j7QORGZaGzR0KE8kQh3UQfh/MLS5zPFK3L9cg?=
 =?us-ascii?Q?iGY4Fly4KD3hn4vmrGwnHXFnRVSTn22757wVrc8YiCwHAbRBKc8Uwqgyo01c?=
 =?us-ascii?Q?rjDtDDldQLfk7sUI2RXzVBby5L9IQEBUJJjAwUI9TwAtWT5Tmn6nbEGc0jzq?=
 =?us-ascii?Q?/YrtjDp7MfUcx52N92GDMuRg/bg7GJj2mzCPM1HSkHuVW2CWlxlLL2SQUpTD?=
 =?us-ascii?Q?BHz1V5nM4W++wyzAek+/QE6zIuWtXv6TLq18ikqnETceUmwyKz7pEMxS79sN?=
 =?us-ascii?Q?hCOK6YlhOTz+xFohttqXcPGuOkvv3pJ/LjuAR6jpzph9dbotkAfdT42tfhnR?=
 =?us-ascii?Q?3q86uP29pxx2Tb7wFUWX/Coi1bh1zlf5BmkBBE4SeiRLpPjES9X8mCxiAiil?=
 =?us-ascii?Q?IcsvMPHj1tB8x7t+kpA6y5Xah+BijKsXnhxqbe/Y+GN4xGr05wpDM+EzyaFr?=
 =?us-ascii?Q?TcnyTBRlDpt4LufrKwwG+MxCWjJRuPkjAnH+cBPBhiqstyfJBhXNF/YLv3oV?=
 =?us-ascii?Q?ZTON6qIP3+DaxwEjzwI2nLLlkH+0LzNzfvWWqT/xQ/7k+ZsI9CVE1ijPjlhA?=
 =?us-ascii?Q?NQsgOC8X9A3YQBrRV46FjSdkyv/vT8cKYVEsZfg5b8Bk7JLVgQbtn4aKSuqj?=
 =?us-ascii?Q?JjXugKlZIH3cYk9cs9mFe/C04B4F9CqKWzW7YcZuLFtLvgq+i4qsk1Q/NVuM?=
 =?us-ascii?Q?oBOJK6Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(376005)(366007)(7416005)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s73sUocWUyyeHMwr8FAxVLAuQCDl+/eHfu5G2w/bftUyYk/8AR3YDYTg3rhZ?=
 =?us-ascii?Q?4QcGPFAGD/HKfo4OT0UXSDfKard1pHHmR3VWEN578ZPge0XQzJy3wVY+6i7X?=
 =?us-ascii?Q?Vqn17+fWxhj5i/zqTBUHPVLlsGQBfSBslk2wKURNV272GOaG2+lxGxiDOn4K?=
 =?us-ascii?Q?q6Yw9RW76fMEbKXaTLeQr5n4LWi5UNOoM4QDUOnXoPIi/R7yACnG4CRIe1FW?=
 =?us-ascii?Q?u8P5wkOAAJ34GJMCoUD6NSqBZuT/+odEvep08LMEiC+TGpXYvdusiHKBmtGr?=
 =?us-ascii?Q?cDWUlgHoZ87vmYugMgrXAcPp0s6Uc9WIbyNtRrRJaF7ukyWtbfe1JrSosG+c?=
 =?us-ascii?Q?tj1VjTAgL1sKwhJIkbC826xZG/A8h2hzriv8dDzzta6tFk6tvfcFSjU9z0A4?=
 =?us-ascii?Q?heuNvkr5X61miz2EY015RqpuJgczyq5BmxlIELgSZQCyFKUi8xvT0gxJ/OnU?=
 =?us-ascii?Q?3pgi+wX2xPfRDfqH/5zxpRwOpJ3Z+UUDTCiS6YV8gi0DYSFTX0pBJHFcjLfq?=
 =?us-ascii?Q?ni8ei5adPPagjlNRUGR6p7lrxD1tmLTOMvB+FcwIDB4EPxXllEgYD6DnZlrY?=
 =?us-ascii?Q?DDaIsZrBpL7lWy9j6WgvlnBHTbH/yb/y4n7yR5Qfu2YMHdTWqaDjoI/kYtf7?=
 =?us-ascii?Q?Hg8cn93DZxfI+5hyopdw7GjZAnxojUKYf6X7Yv6qLp2yyyPxbUuAIG1Huwot?=
 =?us-ascii?Q?+7wNmYyfjJ0Da6V6tm+9Pk0ZLz/5xWmaPppOU7b8kU/UTwpWm3Tf2L7A2Dqv?=
 =?us-ascii?Q?CmCPQS8yAE6uk8F3NVwUDqlFC1oWINtiWkXrHYAl406y/2CarHYDKZutXAR2?=
 =?us-ascii?Q?D/Dcwz5Rj7xlLfX8Qa7VOrKeJkhg37KUN6I+9R62Rxf9Q78qgSnU6YoGGNXO?=
 =?us-ascii?Q?ab86Iup2FyUF4X0/GMZS6sFJfew/hHiKNp5SUZCgT4W/uGQtUh5CYavsztAJ?=
 =?us-ascii?Q?fXd/5Wc/pyGZq7QFeaa1CtfSJH0tybs3DjWwYsKcgIUth7xxBMSKvHeqvhQe?=
 =?us-ascii?Q?cvzyiWNG9oZqHveD73Xy2XjbNb/X1Zsey3hn/Fj9fYwQtOz80ZeLciWjAZi/?=
 =?us-ascii?Q?7b9h4l6rnKd5QJoGuFZZx0uWHyH/NqoBpt78cSZ3XwL3KeP5XscLTqqqSfVA?=
 =?us-ascii?Q?105c4qZvUI3XRb7nPgDGNd7X3k9FryZZ+Q6bMlTX68R6UH25m8Eqw+Q95IN4?=
 =?us-ascii?Q?LNERUs6rC7MlJl0Idfz0oFlHQ6y/hjs0Y1yBhCcTdv75U0dIWfu0hA4YZ2Rx?=
 =?us-ascii?Q?GnCbxcaaZTKwi5OIg8RprNUOo1GQk9SiZj9BM2w7jWkpdKVt1VNPVnGuvbyI?=
 =?us-ascii?Q?i2ZuPEtAGYEJbBSbAAqeGfT9cLfbikSN2fFTnJHvVrFlOkSRhuL2rmyKfnMo?=
 =?us-ascii?Q?RDGFATK+9LCFDn/wvHEGC9J6+ryZLNEPzVMoA/IaafrkIW6qr6xARin2KySu?=
 =?us-ascii?Q?S65mh9ofUB3HdaO/LkDxADJ4BJh4ki2GRCeNwNI3GllhMK7Xu5E/0uRzpLuc?=
 =?us-ascii?Q?6048hmPXhndftAjTr4TXR4/393Y9ZStYgT4lZK4d0eNp/YyZrEWmpcqGROAO?=
 =?us-ascii?Q?qK2gsSg48oVSyPOwZITYE1Q7nntGlfxJgNi7OaFt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8fb22c-fb9f-42d9-2e97-08dc858855dd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 17:52:58.3437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPo0VB6l8VmR+6P6Ah3GALj5FREQR7aO88mH8Nr+k3uJNTlw0Fdx9QRCDovXfvsbxmdaz+JZmHt+ex6IhaaXHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6959
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

On Fri, May 24, 2024 at 07:26:50PM +0100, Dave Stevenson wrote:
> From: Stefan Wahren <stefan.wahren@i2se.com>
> 
> Actually the criteria to increment source & destination address doesn't
> based on platform specific bits. It's just the DMA transfer direction which
> is translated into the info bits. So introduce two new helper functions
> and get the rid of these platform specifics.
> 

Fix increment source & destination address depend on the platform drvdata.
It should be depend on dma_transfer_direction.

look like it is bug fixes. Can you add fixes tag.

> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/dma/bcm2835-dma.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index ef452ebb3c15..d6c5a2762a46 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -252,6 +252,24 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
>  	return result;
>  }
>  
> +static inline bool need_src_incr(enum dma_transfer_direction direction)
> +{
> +	return direction != DMA_DEV_TO_MEM;
> +}
> +
> +static inline bool need_dst_incr(enum dma_transfer_direction direction)
> +{
> +	switch (direction) {
> +	case DMA_MEM_TO_MEM:
> +	case DMA_DEV_TO_MEM:
> +		return true;
> +	default:
> +		break;
> +	}
> +
> +	return false;
> +}
> +
>  static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
>  {
>  	size_t i;
> @@ -336,10 +354,8 @@ static inline size_t bcm2835_dma_count_frames_for_sg(
>   * @cyclic:         it is a cyclic transfer
>   * @info:           the default info bits to apply per controlblock
>   * @frames:         number of controlblocks to allocate
> - * @src:            the src address to assign (if the S_INC bit is set
> - *                  in @info, then it gets incremented)
> - * @dst:            the dst address to assign (if the D_INC bit is set
> - *                  in @info, then it gets incremented)
> + * @src:            the src address to assign
> + * @dst:            the dst address to assign
>   * @buf_len:        the full buffer length (may also be 0)
>   * @period_len:     the period length when to apply @finalextrainfo
>   *                  in addition to the last transfer
> @@ -408,9 +424,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
>  			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
>  
>  		/* update src and dst and length */
> -		if (src && (info & BCM2835_DMA_S_INC))
> +		if (src && need_src_incr(direction))
>  			src += control_block->length;
> -		if (dst && (info & BCM2835_DMA_D_INC))
> +		if (dst && need_dst_incr(direction))
>  			dst += control_block->length;
>  
>  		/* Length of total transfer */
> -- 
> 2.34.1
> 
