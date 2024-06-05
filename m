Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E6D8FD215
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 17:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB3210E34E;
	Wed,  5 Jun 2024 15:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bmy0w9F6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2073.outbound.protection.outlook.com [40.107.14.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3739B10E34E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 15:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCfsotHeApdCn9EpkFQgsxvpEJvnIjnRq5n4jHnKTkEYO/fknasdYc/9XuTprc0kb9BYZq6ujI+PbpJ4xOM4mCnceiHd7qpSzH6cicNTXFN4+Mu73vb45cSlJuXQeRSRilKqg/d9MO215K6CYBd5o7S7A3Iq4mbBAWkoUDZdiRMMJS0nvZXftsZ8BvP6raw7G/tXX1eCgGvhqXjn7sRx08EcpR2nrV+CSdV4RZJKXTFP8mFqZ0tDrYEZq3tsng5vF+JeeO9fYwiZCxXwZXmr1wt1Yvqu6qnTzvkT0Ya8VyYQtacaiy+jjWOOuIxZK+tYS2dL2isR4QHsTPJv9kNqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyT+R5ReYEiGut2WzsvRuW/zVZPBteFgO15hUewHxHc=;
 b=HRrdHfegmXLY269yRpb3olu9Uh+nib8OOYgOqRku2sOUBL6sfqC4SwLB0LHU2CZR9yvAEUAUjwm05Mmtvc7oSDGsmvlLEgmgL0LdRYTFG0wosgOE16Fh/5dGpRLkgXRqp5R4quoVJMCgFCYNpDR/LaDmzcf1qsy1rezv5bhzksPVL00g1BRHnfs6eCi+fWewMLGl0u/oN7uIHY13Ap7A6+QoL95ss5LXJtBWH5IzjHrW2oK+bJ27/JuhqEsZFDwSa+Sw+ZhbaFrEAiRukhxtwtUNqoz+VkZeEBnyYT/0gVCVexsI4VDiNR7pKpY3q+Agq9mB4B0e+rjmdrjgMMYY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyT+R5ReYEiGut2WzsvRuW/zVZPBteFgO15hUewHxHc=;
 b=bmy0w9F6UqAgo8KekuBxx1KIRKCnGm271rqNsGZMIBDOeLb8t4Jd+y9SnLyF2XKWC9DyuP4Q92xI+sTTVm+Ve7hrWGUTclT1CMbBX9ryGjFUUSAlVbZKNNajdunbOzYdJPZAAoVPloU+DxS5ZDGTmuYZoY47/S2D5rjgn2Hn9qo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Wed, 5 Jun
 2024 15:52:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 15:52:19 +0000
Date: Wed, 5 Jun 2024 11:52:04 -0400
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
Subject: Re: [PATCH 02/18] dmaengine: bcm2835: Support common dma-channel-mask
Message-ID: <ZmCJpCUc3BcC065R@lizhi-Precision-Tower-5810>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-3-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524182702.1317935-3-dave.stevenson@raspberrypi.com>
X-ClientProxiedBy: SJ0PR03CA0263.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: c2902b79-fa33-40a5-4e9c-08dc85777afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|7416005|376005|52116005|366007|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fOoByJG7643ZI9kc4y/QZzBDwqeFKf5vEEHPiC73ihBcp8kO2lE7G0Hr3aH+?=
 =?us-ascii?Q?I0dHBiTJ7aHvYqWB6/utg46Gle/jJYobjjmAkkl/R7iaieSBnUvMH9jVWzFy?=
 =?us-ascii?Q?gaHkh13O1VKjCvR5J+cPUL0t1YVUzA+i8NIeR1nEiRopjEmEJvtIwmE6j0a8?=
 =?us-ascii?Q?ZRal1CVkiQDIv1BtOUXxoI+s4hV3WuDpwFAROceAQSZJPQZmEc4AcN0QRBMA?=
 =?us-ascii?Q?Bc/ICTyhaf9JTQtFZHoIm4mmIo9sdwltUwMqZO2vy1G0aMp95jACuduWa0JC?=
 =?us-ascii?Q?2pWvqD0Hj/N+BRucZwl4Ub/fH1TnEf4zeF3SS0EN70tUMt3fqTFqsaJflOKh?=
 =?us-ascii?Q?WM5h0mfKH+mAVwVcQcqdSEyJXE5UlAcES2sIacdAiR9wV2A6OxoMS3ZHOaJZ?=
 =?us-ascii?Q?HVOPQcQS5T/aCf2ur+K4z/nhsLNdXsad1BUbpgNbTrOAfpYco3oUSikGxEbD?=
 =?us-ascii?Q?Dl27lNbPSCfh26F0gv0IezuNSOFrG+UMjS46h05tpif+aQhiGRBubfKdX+xb?=
 =?us-ascii?Q?xbc7uka5WpYq9wrXpim590P/n3iztpuL9UVPZ62rF62sQRNpqoUBfEKeH6bc?=
 =?us-ascii?Q?Rrxx/cyxXQsGot9DnB/z0HMLVZnW5xgK1BP7AsOx6NwSmuddWOSpNdwZG3H0?=
 =?us-ascii?Q?BJc6vH7ePRAtOyLKlFyGwiTr0E9qt5YrZdueNb/9vpqVcYN97sD9BVPQ1CmS?=
 =?us-ascii?Q?i/9KZ4I2z2kuxrGcukoLiJ8TfbceNDEtgDhOdeqdTe3v1vb7JoHD0iJFOmiw?=
 =?us-ascii?Q?CrM9LJYnxFjAwc3Kh1RKdJZPy0X8TRVmGX5Z+wUWqko76m6L+S6i2lorzf5a?=
 =?us-ascii?Q?0ohWjyrDPTEzTrhXmWb0unWB1+hmhG77z0XlhNjhH1oBy9RWABcGpp5DiVQo?=
 =?us-ascii?Q?vOMsJ8N1GgddurTSptRN8rXHpRJw2XeWzydzfdbnpgQ5FTk+tGgvWaYIGmjP?=
 =?us-ascii?Q?82Onr5Gg0WTIPdsljldq0QJhZyFVrJqXIzq8HRT06zWgm4WoocvinclTjO8V?=
 =?us-ascii?Q?CWW7D3xWMNvFGgWprWP11YWL/NSLRFy1edIQp/lNa4+Oiz8L0awvLoU+O6a+?=
 =?us-ascii?Q?Wk8U9awG+T6o5SVy1uhbPY/xxRzj09NVFLHfra0+AdfJDMXbyqPrFU2d4O03?=
 =?us-ascii?Q?HrubN4mxHu38zkbH+QY07jlsumkpYTQ3SCLRKdTENTMX2yx2EgBDIgQESN/c?=
 =?us-ascii?Q?HqmLhwcl6Z2ND7Qq15Xgnl6FsNWTamAqJLAIhSvNBYug9LpTPnNoZCEtKZQp?=
 =?us-ascii?Q?3ahWsUlDo28nrab6VB0vm9gCk5BsBiPQlOP8OA601mhrHSNEX0FmO3g7JNvE?=
 =?us-ascii?Q?DnFWm/gSVwJyqK/kO1Frty8CQA1KoMorp5dwJvf8/XHqcR57kVebGGtG9zPQ?=
 =?us-ascii?Q?BjNmCC4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(52116005)(366007)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+YU0pQ50kNnij8nsRPXN2bFzvwx0FbxHjrPyGKYcS78VbTY+xFXqXY+R8SQO?=
 =?us-ascii?Q?q059yP2k+H5WKfUQajJXFivtaSdUSO9iTq0UXUDlW6NV6OAm8i0G6b+ogLbr?=
 =?us-ascii?Q?Mz857I+KuT877uHPRi8GDaq971iPPdQZma1wpvOs87Hoxb3fq/KROhpsconw?=
 =?us-ascii?Q?2BQnxCjqWP7IzOkRC9IclgZUBSkTSlGhVtV+dPIlL93q3I6PWLZzIg6HUJny?=
 =?us-ascii?Q?Ok1y9JhpXwrpsTX6AUBvyH9aO8L0ODMy56bzb3UhazKY5zAp5b2T4pe8k36S?=
 =?us-ascii?Q?0G0t3pVER3r25mqDyF37TrDOWW8WyoHiren02Ky1pTJ3pwzS5SDH+u6mGtEu?=
 =?us-ascii?Q?/PiJY2CuZlyNYTD9lNV+GjIoDPtSZDd9KB85SHU3fwq7feWEQ/5UzrScC8Gv?=
 =?us-ascii?Q?DmiMx66XLy3yZ4BTsIUtdIRZlHf8UtRjU1ydQdXBcpKLfIkchjhEVN3hH6/r?=
 =?us-ascii?Q?qA1MYvRER6h4a931NSiD2Hw2brLBAW7nNKxfs56M9rruGmlDupDDlgqhE6D6?=
 =?us-ascii?Q?Y7CxF7ssx/IEbmtbZY8jac8WJlMj3i+tvSqZrkwiUgi17VKqimmfsUqHdlwA?=
 =?us-ascii?Q?xqo9LIbNhylELtTLKFdBA7sY0hgTkO96KUZiDqi6y33lqK9+bUvfgk8Gfe65?=
 =?us-ascii?Q?QegcZB1dfkd8ROLYZesy3ElB+HEHqtmhXG0AlM3jvxUwjppnSUqpGYoR4kbx?=
 =?us-ascii?Q?hFXDDSr9sfdaiRB5ff8qb0I1ktpEB91tYCbLM0NBSaSUCSqQ8SAaQybD9HTK?=
 =?us-ascii?Q?9U6m+fiNgGgCXi3gJ+ypmbN0WVKmqX6UJ5j1JX8FOaQC8XJZPnoKX3b/iEJ3?=
 =?us-ascii?Q?860A63CcMEC2ZjUDE5VZn42KM9pNpbKr7gRSIL95jv2M5hiUCEmkc/TyOr++?=
 =?us-ascii?Q?3xX9jkyugBBpznj5bbyhOTU19eqhxteYUoJS0mfK/kqyhSWvNdA7WBWeq7Ol?=
 =?us-ascii?Q?reBQX7BtFDN7HZI+ENDy0/wFeQXAD7a6UsN+E9znWB37FZyifMGOPGSqDmgM?=
 =?us-ascii?Q?9ueEPk5jRAeGGClJsJ3tqKJjqYUy35MYQX0qDuiEm7Ec8nNUwfpUsBvQL1QC?=
 =?us-ascii?Q?vLYUZc1oL8Hb80t2Z703waWWrIMR3M+wXaMi0PdnSf1Bk88O8y2aynaQ0RJ0?=
 =?us-ascii?Q?mgIVo6iBa9jyPtVvhqL14TKKMObpd/SdTvFek38c9BtPMAwZ8Zt81Ii3u7CQ?=
 =?us-ascii?Q?8Tf31MaSg0126YZ4m4qzSknNyZYff9oPwMNpGa5w7LbVhjdTD7Wq6jMhelQz?=
 =?us-ascii?Q?53vfPXIje5MSFCiI9J+ctx4nCdKnKAgdM/PgmvWi+ZdQGNgc4ulHJnO7soWc?=
 =?us-ascii?Q?4sBs9k/pm7LlW91bdIOozgnTf3pl5GV/aph5uqmNCjiXsahC0JKU9HdqM/K4?=
 =?us-ascii?Q?T0lcPl/b5xdB9TPbMJyY1BaOk9BjdrF+L8ObskF7WEwGAV8CJDCM0oGzQDrp?=
 =?us-ascii?Q?5sQORz7wJSZh2fatp1gATYlCAw/k++s+MVi44UmhCZ3WW/m+C2RqXtYzQCkc?=
 =?us-ascii?Q?joeggEvU6Fg9i4mKjMR5b455SVYQwmR5Vyyz4dhmgIqHySkcRhr0sxrL1Uzw?=
 =?us-ascii?Q?TE06JLtrBPUxul0ug2kxDgDHlJZq+iIY56xUBMk7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2902b79-fa33-40a5-4e9c-08dc85777afa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 15:52:19.2376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsJ2BiUZe0E0fCsUNcVU1LPGf5Jt+MGrlo915nZhTW1kRBTXt74QBgQDSAiPBBmD4fPIYpZ/fv5qXEQqzgcyaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864
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

On Fri, May 24, 2024 at 07:26:46PM +0100, Dave Stevenson wrote:
> From: Stefan Wahren <stefan.wahren@i2se.com>
> 
> Nowadays there is a generic property for dma-channel-mask in the DMA
> controller binding. So prefer this one instead of the old vendor specific
> one. Print a warning in case the old one is used. Btw use the result of
> of_property_read_u32() as return code in error case.

Use generic 'dma-channel-mask' property. Print a warning in case the
old brcm,dma-channel-mask is used.

Did you update binding doc?

> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 9d74fe97452e..528c4593b45a 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -941,12 +941,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Request DMA channel mask from device tree */
> -	if (of_property_read_u32(pdev->dev.of_node,
> -			"brcm,dma-channel-mask",
> -			&chans_available)) {
> -		dev_err(&pdev->dev, "Failed to get channel mask\n");
> -		rc = -EINVAL;
> -		goto err_no_dma;
> +	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
> +				  &chans_available);
> +
> +	if (rc) {
> +		/* Try deprecated property */
> +		if (of_property_read_u32(pdev->dev.of_node,
> +					 "brcm,dma-channel-mask",
> +					 &chans_available)) {
> +			dev_err(&pdev->dev, "Failed to get channel mask\n");
> +			goto err_no_dma;
> +		}
> +
> +		dev_warn(&pdev->dev, "brcm,dma-channel-mask deprecated - please update DT\n");
>  	}
>  
>  	/* get irqs for each channel that we support */
> -- 
> 2.34.1
> 
