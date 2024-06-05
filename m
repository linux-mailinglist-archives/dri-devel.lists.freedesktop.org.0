Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF8D8FD26D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 18:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF0F10E50F;
	Wed,  5 Jun 2024 16:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YkjBcw+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2048.outbound.protection.outlook.com [40.107.247.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108F310E50F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 16:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aV6SwaROweAyIp6n3b0ZrFV5wd74xvLRtDoCGL9co7XMMNN2rmGMR7zi0F8EuewZx3q7sEqfkKDyrF8zETCRloleiqal7sCxI99xFueahhVsz8jW6nJ+QTtAaE1vfh0VkRjL0K/TQ+wTI59iNSnxs9sgxFCUS+hjb7mW9/UjwcG5Q0+4yrb330aMREa8+lL87+LIBBHUuJCDNMN4dNftmaaj1Vt/j1CWOt8Uco60OlUXvpubFdVcXTqPUb5FFGbkMOISXtskxOAPyWmxAs8mx1GKI66120Vw4dkfE0dXP38mpxRahxds40xgbEl7kJrGuQQcEagX3mO3ucxzkvEvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcxOW4jR7COabzntVH9G0Yxw8fVkTniSRe6QsVUkz1A=;
 b=ieT1gk5+dsNCtg3yOKp5jHBrK23ul2njJPwFIcv4nWMUwFqP64NX9Nf50zG/9gRXCL80Kfw7e3kgYtbL4rAtlz/AkQ7PggsLg0US1/xlF1NCQ4gsOtnGBWGhuEnr/XT/7vrSqA1PeWVIoiVOOj1iIgV8ciXtP94ijbCLQZBTTsb6OjEFzb5c2aGUh3xYWDT2AOGqK/ifg6xPJXbhoFp8oKJuX2apF3djCzMAsK3/1v5bLWCUEiXaOtva2/JCWUruPs3n79wx1LHckG193OdjXps7JjIHKsrT2YrzPhS+Qyuh/sYC5bCP4Wvv5seXachMYVOARXvBYSN1TlKu9VjotQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcxOW4jR7COabzntVH9G0Yxw8fVkTniSRe6QsVUkz1A=;
 b=YkjBcw+H10RkG4OqxWEXKAG4KIkdKjxOiL+ipzB3nYBVLFaNIsskAZ0zAcLNKoLQsVGBm8IktYnB3yAEx8PZ3gC4qFFPiSVUFjM8HKqc/4kqJ7FT0GTHkjVHGrkljj9uYOS/hdHYOo5FKgRucnkwrWvUpNMW2Yn68MSpRJ8+ilY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Wed, 5 Jun
 2024 16:05:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 16:05:13 +0000
Date: Wed, 5 Jun 2024 12:05:01 -0400
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
Subject: Re: [PATCH 04/18] dmaengine: bcm2835: move CB info generation into
 separate function
Message-ID: <ZmCMrfX449qUudSo@lizhi-Precision-Tower-5810>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-5-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524182702.1317935-5-dave.stevenson@raspberrypi.com>
X-ClientProxiedBy: SJ0PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4a227f-be8e-4907-450a-08dc85794888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|376005|52116005|1800799015|7416005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bXMow/8g5HA7xs41Mddm7AqEgqlkGJKYc0Oex4Pb/sihGa9vw3R4TpeyG60v?=
 =?us-ascii?Q?scJLRBiubli49HWLdo7Q410N76vO8753qnWfpT5pjkvz+LHP5zIZ5tVnPWig?=
 =?us-ascii?Q?8vlEhq/3VbGxR9ZuF9VCIFXmzwynbynjDoD7Rm/UsQ3NefNA2R9y7KDUxVBM?=
 =?us-ascii?Q?ECFeEPRRloS/uJPklY/mBLCeRm02O7nWbQ9LvYRAtgYpVQq9dlopMG4c+gjX?=
 =?us-ascii?Q?Ay1qND+e+o4rosxSErJLNNLrGtbAW81dqqzjEmMfITKUb25h8exEa8BT+9RM?=
 =?us-ascii?Q?5C4PZFcQ4mQ/mCiq67sLK1UW7ANVi5bexQpEei6nVd4p18a6aGgzX9vp4to+?=
 =?us-ascii?Q?hBE695CPLWVHq671OQGFy3IQ6gT+6+aiLclFXIaubWLtn24Zb9Um7CNDPaZZ?=
 =?us-ascii?Q?XKkWZ4xTaJ6H2T9tPjE69V+ZzjFxPyY/3J2ePmCS55TtFRaY/4FEDOKgKOCT?=
 =?us-ascii?Q?UvK7p/W/btfSRHPSoueCf8Gtx7vUtP5tSuiVZQdToga3enKv2U89fYsrES3p?=
 =?us-ascii?Q?DxMG1dk4sZ6gIB7ELJh1CN7zI8RuzUKBhtDM7ZiIuYkatqL1IqCgW1S5e6iu?=
 =?us-ascii?Q?2xh+eJ6SM8bx3688PQBbnHooMqpqUI6FrUSUMUHX0XMfhpVY0sYUlEtNGW7z?=
 =?us-ascii?Q?KTCZTi/qKvVbuteDgMrjEpV1W4IDkyYKzhNiyafQX3lIa9igflfySoyGsPkS?=
 =?us-ascii?Q?xWCsxyQtQwc1L+N0s5J/dOhpHQETwttdpruVDfFKcJ+eIYAD0tKRwNDBt/88?=
 =?us-ascii?Q?J+MLw5ezEa62E+i3TONZ4tV6BvEybq2LiurLyFvOCB9D1k4mXA8B2D/7t6sa?=
 =?us-ascii?Q?9ZNAAAF49MNZuRrM6c2BJYPCsjn3as0rSF5ArOiqNF1Cun8ByjcMVdy1AWj4?=
 =?us-ascii?Q?kRWU+B3dkX7UsMxgnRG8d/E/R71XYHR4KU98lG/G3rG/9WdvOjIPQtlEkDnw?=
 =?us-ascii?Q?NUNWHSAokVp+1Xinm18zgEXUnBLiWKL8BdhzOLo5ZAAz+4TEV+usTChIALQg?=
 =?us-ascii?Q?dR6wq8BBjck0ifJvGWw6/08Y8b8jj14IXXftYAUkc0nqX9KuUn/CJxPHhyGH?=
 =?us-ascii?Q?dhSdauuhNadUbQc/GrDI+v12tqKfaPU6mI0Iw2KzB5un3fMAn6Yhhzy4vC3g?=
 =?us-ascii?Q?QBUOL9uXreSU/GaNEvLgdl0t+RzxYSP8cjAhZ9ke4rDJpIhZ208+ShUpy4JM?=
 =?us-ascii?Q?phU9CvSZDT6UtlkAWgDff227EHFONLKcxU9NySPjH35rom6Y8HwjutszBogk?=
 =?us-ascii?Q?U5NwMHOyzrYlKPmDS8Og7eB6fAx2lKTxti7GlAN629wGovvABryZ9yEpU18Q?=
 =?us-ascii?Q?y2BCXNniYNyjPv8dSFHAYAf6dFXpe7Sotfp5XxZb1pLy5zXxubJpqi1QB96+?=
 =?us-ascii?Q?HLqnYwU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(52116005)(1800799015)(7416005)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Sxs/4vXFH857CcZSKN32Z8VsGtuEp5w7F9eaCcDgVE2x8P8Oiy/lOLbCvxc?=
 =?us-ascii?Q?pk3jO9fHoA0Kvs6iqGut4X8a4hJS+R0P8Tx0fwBR8b1SmpPX+MXSdfGqjgQn?=
 =?us-ascii?Q?AeuQOcy0GrxmHdWErJbeuYObbi3a8QucPHzmHFhGBsAc7BAeMNQZ23j5uEdu?=
 =?us-ascii?Q?fe4EgFF0TLK88G2uMt2nxG1ynU/b0u/QNfjojkqBFTBwo1hUryX/Kb0mUtb4?=
 =?us-ascii?Q?0Dfrh1l+I0BIshW1IyFfqEqa4AayGvuptS47cgLf7hVDobfLn8aEjkRsuNYv?=
 =?us-ascii?Q?Mn/Gmvs4bKtPHcZWYxQIZaTxl+qE/MhNXyRKRjdMjlynKD7XeuWcUCn0EO9M?=
 =?us-ascii?Q?uidlK90/boYnSRoog3Y/vw/FFW0D8lBXumO/pcuw6Cy4U2Y6A0Gi+6jHrLtm?=
 =?us-ascii?Q?ny8uGkG7z2Hvt+NjRBsPhuZve6pNUry951U4AEdlFCr4OVMg3ifRmWaRV7qV?=
 =?us-ascii?Q?KCCGVwub7AMOufc8gongkbYg8awepeTNa6YncFZqGdA9ecdnPNwWcBjijTyr?=
 =?us-ascii?Q?Qb2XJjwOl3BbIfvN9O5IhBer5rKZ30f32srVDIwPyWZq6vjdg6hUGFgfmPMi?=
 =?us-ascii?Q?Y9GLH8Ll372tDpZmTlh5CrPQpBZXd7Y/+FJQLybiKjyPHVJPI9dN5XS+KWJn?=
 =?us-ascii?Q?Arzu/XP0Y0sHWae47RvlNHB0fx+oxQz4XyMaDJw92jFWB3AJTuXjOQqVWovG?=
 =?us-ascii?Q?kwXJAMmG0IOALZ8dZ7g8+hegIUuc+3/+vN51Vj06VS1bZzEL/b4BToiutGoO?=
 =?us-ascii?Q?RiU+C902SfXN7ym7bQcSlraSezo9ln3CbB/ZWNU9+PQrF3e17mps73LqWexu?=
 =?us-ascii?Q?GZ6MIJT6vXh0ioBmTHSltVHQGDFQWrKtsecxTDrBJRK6eHZ0HgiSQLwe2Xk8?=
 =?us-ascii?Q?7ZoXgVpV/cJEmC/ozNgzAWkq2OB5Bz8Oj5tXS0Auq9UqsMl6gJaFbm9c7U05?=
 =?us-ascii?Q?wRbp4JhqEAJiIGdeM9AAyfYyeWDj4W4h0h/HGASMXTeHZMa91BShRjEZNB+l?=
 =?us-ascii?Q?XHyVTDyLbl1H1sfnkMFP+zV4nsZQAd3Mm8AWUXGeMrP+YCnCfRYWok77VuOu?=
 =?us-ascii?Q?YlYMRfu+JAscWtl+bquxQuozTAZ74mHk70spJUZUesH+fs+BreIx9zWz03RN?=
 =?us-ascii?Q?1RS1b3fE6nBFuf1pFgwF8s5nTXcOUvuD9+stYncJx8EFh1zLOoSdklHgG9Kr?=
 =?us-ascii?Q?3a/N6rGwUIgq0jhN7AWdW4gEqM4uE4WOUAr5MKzZZG9szVJFWlL+KzEDmhDb?=
 =?us-ascii?Q?N94O2yWCy07I0NVwY3tEiGsj3UMesFO4vMAFZ0JbbIIPWBTCuYOaa0TuwPhB?=
 =?us-ascii?Q?VuHFhMKctshl9H4QXfFf4kbNKIEaAELvRcKOYSRmE4dJ/7u8esWGp71Sv0MD?=
 =?us-ascii?Q?SCg2Jc8nwt0H8J7nRlecUDRdrWQCE0IJNVwvTamhuMwtT1BHBKKrg1cnWg8u?=
 =?us-ascii?Q?xhMosceTnB7L4Kn3OKypSK6ypw4USB8h3mS9KL3HRdkBw/3UdJZ+QYP4Vx5G?=
 =?us-ascii?Q?9jGqUmhSA8lAj27nZV+4Y0kj6+4+y1ecDc39Tq5UFR7SYI3agR7l+e8+rd6B?=
 =?us-ascii?Q?SNj1HMIAnRnHqlnrg1hKOh/MuJY1jpwba3EeTAE0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4a227f-be8e-4907-450a-08dc85794888
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 16:05:13.5950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40Z+XO/brjhUCHFgPNRcjASPlLnSI40brvLO4h2XnBxHnhNrZn8Ut3QaNK+6Ngw5bKS1MAfCzUa1Oak4+j9VVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510
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

On Fri, May 24, 2024 at 07:26:48PM +0100, Dave Stevenson wrote:
> From: Stefan Wahren <stefan.wahren@i2se.com>
> 
> Actually the generation of the Control Block info follows some simple
> rules. So handle this with a separate function to avoid open coding
> for every DMA operation. Another advantage is that we can easier
> introduce other platforms with different info bits.

May simple said as:

Introduce common help funtion to prepare Control Block Info to avoid
dupicate code in every DMA operation.
 
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/dma/bcm2835-dma.c | 50 +++++++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 528c4593b45a..7cef7ff89575 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -201,6 +201,34 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
>  	return container_of(t, struct bcm2835_desc, vd.tx);
>  }
>  
> +static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
> +				       enum dma_transfer_direction direction,
> +				       bool zero_page)
> +{
> +	u32 result;
> +
> +	if (direction == DMA_MEM_TO_MEM)
> +		return BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
> +
> +	result = BCM2835_DMA_WAIT_RESP;
> +
> +	/* Setup DREQ channel */
> +	if (c->dreq != 0)
> +		result |= BCM2835_DMA_PER_MAP(c->dreq);
> +
> +	if (direction == DMA_DEV_TO_MEM) {
> +		result |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
> +	} else {
> +		result |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
> +
> +		/* non-lite channels can write zeroes w/o accessing memory */
> +		if (zero_page && !c->is_lite_channel)
> +			result |= BCM2835_DMA_S_IGNORE;
> +	}
> +
> +	return result;
> +}
> +
>  static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
>  {
>  	size_t i;
> @@ -615,7 +643,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
>  {
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
> -	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
> +	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
>  	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
>  	size_t max_len = bcm2835_dma_max_frame_length(c);
>  	size_t frames;
> @@ -646,7 +674,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
>  	dma_addr_t src = 0, dst = 0;
> -	u32 info = BCM2835_DMA_WAIT_RESP;
> +	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
>  	u32 extra = BCM2835_DMA_INT_EN;
>  	size_t frames;
>  
> @@ -656,19 +684,14 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
>  		return NULL;
>  	}
>  
> -	if (c->dreq != 0)
> -		info |= BCM2835_DMA_PER_MAP(c->dreq);
> -
>  	if (direction == DMA_DEV_TO_MEM) {
>  		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
>  			return NULL;
>  		src = c->cfg.src_addr;
> -		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
>  	} else {
>  		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
>  			return NULL;
>  		dst = c->cfg.dst_addr;
> -		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
>  	}
>  
>  	/* count frames in sg list */
> @@ -698,7 +721,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
>  	dma_addr_t src, dst;
> -	u32 info = BCM2835_DMA_WAIT_RESP;
> +	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
> +					       buf_addr == od->zero_page);
>  	u32 extra = 0;
>  	size_t max_len = bcm2835_dma_max_frame_length(c);
>  	size_t frames;
> @@ -729,26 +753,16 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
>  			      "%s: buffer_length (%zd) is not a multiple of period_len (%zd)\n",
>  			      __func__, buf_len, period_len);
>  
> -	/* Setup DREQ channel */
> -	if (c->dreq != 0)
> -		info |= BCM2835_DMA_PER_MAP(c->dreq);
> -
>  	if (direction == DMA_DEV_TO_MEM) {
>  		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
>  			return NULL;
>  		src = c->cfg.src_addr;
>  		dst = buf_addr;
> -		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
>  	} else {
>  		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
>  			return NULL;
>  		dst = c->cfg.dst_addr;
>  		src = buf_addr;
> -		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
> -
> -		/* non-lite channels can write zeroes w/o accessing memory */
> -		if (buf_addr == od->zero_page && !c->is_lite_channel)
> -			info |= BCM2835_DMA_S_IGNORE;
>  	}
>  
>  	/* calculate number of frames */
> -- 
> 2.34.1
> 
