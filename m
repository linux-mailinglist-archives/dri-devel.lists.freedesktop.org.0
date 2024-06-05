Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694B98FD2B5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 18:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB55410E171;
	Wed,  5 Jun 2024 16:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="qWZX4tN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A5710E470
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 16:19:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaeqbfaFXmNzZU3f6xwPqu0KWVxYNyzQWmiB6CloT/KjFSQXbes0FUwOsdvF84D9Dg8cuSgsTbnaUGVYzKDmBn6UQhkj5yb+H7QYt1p2jTn7ImLCo95ctj8Jy7RKJ2eqm+eW6AquNqCCKTqAVqk7rqnL8q/D+BnK5VIKeyTqyISbUHuyPS0IvKth9GKI93yHUZsMOQ5k3XmvRqnk31oaUyYIxSp+NUO6WhV8zDFH1pieE2WatGl02gsU6Oc/y1uhILx0VUIkDvc1RnIRhwqJFBdFfLpEcy6GHJ/N0SQeJPzOwAvpIvyPgTuLn2u06Jk0E/ysA2QUjqpskbUl8teFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9ooCDpKSMR5pw7gptePDTzTu6wkMgDUht61u5fZc/c=;
 b=CQrnhwJwmAGhxy0QKh2sQymAxtGTm8nEqxmWoI8gxHRDvD9B80CcEyLiBN+OtfGqZtsnsN+/XUBR7DzuH+wDnkS00UQotW8Kh3WMWkayWHlBu3e0XSazsdNm3p2CrIoDvKMUv99cTkn4hVCFPeszMsN5Jw2kP6DxvEcRiKLi/6oFTKSgUnA7PYPF/AmlkOIbv45GN9bowtJ3VpITPo526NcxBSVgNkPys0D1miMIdBQvTxXfg37nQmCKob5HBL9qwY9XwAxk2UKMMD3+rcuJV+MWyL/CpmvyfdM+GK+INtqHqCvf7xWNYVGF+qNSNsYiiOYDgCdI5U7lbA2n/R7erQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9ooCDpKSMR5pw7gptePDTzTu6wkMgDUht61u5fZc/c=;
 b=qWZX4tN5jbunM4W+QSuNcuSUU0FqZonGGaqwOY82nN6Vs8weFiAAqGTng4bC6mFPoz1H09nXvgcY3byMk97hwmoTM7zhWo11FLPZEfWoVuT4KRhGShQoPOJvrbjM2l9lrsR7EfDWYgHq0KZFj94XRuJ6OqX5HdJ0XngL3Lm9wQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6787.eurprd04.prod.outlook.com (2603:10a6:208:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 16:19:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 16:19:03 +0000
Date: Wed, 5 Jun 2024 12:18:50 -0400
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
Subject: Re: [PATCH 05/18] dmaengine: bcm2835: move CB final extra info
 generation into function
Message-ID: <ZmCP6o+NgCtINEW4@lizhi-Precision-Tower-5810>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-6-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524182702.1317935-6-dave.stevenson@raspberrypi.com>
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d600c2-a953-4dd6-b358-08dc857b3736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|52116005|366007|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bs2Eo1EyP4H73Orf4Ca+69M/7f0+89ELzHs8y7+r/3rTUMX+aqW8rdYrbHMi?=
 =?us-ascii?Q?2jyjdD1xTdai63jcXaDAB4SUjZoGvXRXgCxGvXn786YmTkmCin2sizCGRbgQ?=
 =?us-ascii?Q?hFn6itTKIfLw6HosHwpe9gq7jIRaAIt7DiweteLoUgbbApLMtQK31shdZCsE?=
 =?us-ascii?Q?WC93zXwi4qOHVOtzeW3ePtncivVA+1zG75Vd0Uh2bIwiuLde8OBqrhIX6PY7?=
 =?us-ascii?Q?rSVqbFihqlWqt1JbRndc6ltaadNvCWNH2V6TiP71v3Y2VhJMDTt5+diCSGQG?=
 =?us-ascii?Q?W3j6CxQhays/noDInAeeTVJ02t8bxzn1XM5cOXiwbouTmB9N3g0scP28GLf8?=
 =?us-ascii?Q?e6oWGgnueOHh8UH55Bo7iWVDIe0Qpgopl1LkSgV6JM31cq4punioTYMA1Rgp?=
 =?us-ascii?Q?H7Roih1B9pXAt8DnBMAJ1ACb3E8yX9cBv1QoSAbV29wXyssI63kg0rpSKfPG?=
 =?us-ascii?Q?jvdDE8cI4tlXXQnMMTalVQdDgxjwRIwMtF6L3p1Rk6JkzMTjiWTGuIdITggo?=
 =?us-ascii?Q?N0ieAJ9iM0ct9Ez5BzGkHY3OwPjk6FSoC2QbgmTuegSQYnx7nPF/wWfjvE67?=
 =?us-ascii?Q?9yHnnnKo0sDIiR1X0/p3lpsJcDlveAGDZ8dFd+IRJr3CEbF19k6Lyj0I459/?=
 =?us-ascii?Q?ooAwrJGpHXKdPm/xw/icWrnX2Ajk3uKwBmhzpLttkhUbpzIqBUK/LlM1ZBpx?=
 =?us-ascii?Q?WdkJyYP4pdSwfvbidhFahWY6CwhH7NylHdzTIKa+FEYaGDbn0oKjh84eK9a9?=
 =?us-ascii?Q?XdAZLVGn98XKbTuhY4jzRyc5de7zVUoE7B5sZFs8df2neNULIHktn2Dp9vci?=
 =?us-ascii?Q?lVUou9e0XvpqBDeuB3DZMCx4fGSFuH5HEP/BYkcHsdwwFExFpiVe4YprPoY9?=
 =?us-ascii?Q?oOSLR12nmTXOWIsHRDBGLG7hRrQ7i6lofiXN3A5FBOFRTPuLKkDYOE/GS8Tf?=
 =?us-ascii?Q?xhwGLPOMPAOTBY+clvAwXBe5SU1PmhKXx0Fc+skGib/OXrofBFxk8jyPFbSe?=
 =?us-ascii?Q?VzT2o8mYNPSM+/wONmKr4z0QYBv/JqFxW6k75zM5803h4zIAOvs80mp2A9Il?=
 =?us-ascii?Q?DUUGbXFYQ6u3wggtJBoN+CNp9z+o1n8xIcEa3Hf1pA2Cc/uYoW/6yU1/cNuY?=
 =?us-ascii?Q?EBwtoutLzXlr/z6XvgkaydUYZZER/i4Rf8vpp+asKCulnD74v/kEj+sug4Bx?=
 =?us-ascii?Q?TYZfjQ7fvLb8SzfHmZ1xnhe01BB6cDeKxLVhtMrx67L/+J8tPCVzkztv2Mzc?=
 =?us-ascii?Q?4YKMBFdd+ujhR8bo5CmEwkYWMoeaB06SccUvV+1IJ14WPGfchf6xc1F4n2xn?=
 =?us-ascii?Q?iGiEBfxNz9FhW/CVJyw+HjYr4/bsAgiq+ZNA2dmjpiojT50SMc+0ThTFxZQq?=
 =?us-ascii?Q?wUxZLVk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(52116005)(366007)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jU26UDz3+X15otbTMRHYgWMys9HWYleAV9hOHEHmVhjn1l0pKmcQLjsh4JCP?=
 =?us-ascii?Q?cdeWx+f+SlX8S5DQoTqkZFRuBmpKmodm7FSC2Rekg17mBDlveTAHQV1s8BAE?=
 =?us-ascii?Q?cIo6xEeUH5s3d0ow8cW/1rcZlXe9h3FdyiLftVr+C1Ba2hIaeX1L8ylgWhPR?=
 =?us-ascii?Q?y7o5pkjm6aD5iRZLK2fou24GM+Ny6IyKR9nS27pMrBA8XW9v9Ez8PnIdW97a?=
 =?us-ascii?Q?uYEEMzHzAcumaNu+TdwoEzMxhPs77Jdufej3skPURSW5BNYIL4RrM75N6xN3?=
 =?us-ascii?Q?jti+DdDk50kEAJRkgy0MVIEQEwPhz4U697/ufCICWiWv5cMTluDX9Ycv1s0l?=
 =?us-ascii?Q?5u6Ojdkkb19CvBFL2fNDRdueidK1MHvGDoXEHdAQ+HPV7KFe30jkuolJ4QQS?=
 =?us-ascii?Q?5E15SmeUan4jtwox70Az1e8p2Ybbqdb/L+1icCyH1/zPTFpAzwf8xM07SONz?=
 =?us-ascii?Q?aSHsuCd4JoCZp7c0JhjiK8+bpkJcbRIjcPlwxW5PEVbIz7+EF6u6QCqm/mzL?=
 =?us-ascii?Q?Fa/IyAWVMUd9jC32Uo8Jd4+I7jp4t/Nn3seZjjAdEDqn7TkQbhbTKSAY0qgr?=
 =?us-ascii?Q?GOYOkK6X/ihnvMP8IhyBX1VWCM6ayb55hJDtv077HTY8YELwP+f7liLgDTz0?=
 =?us-ascii?Q?KdVSux4r+n0/0ZpWlnrM1EjBGsg8qlN0P+btkJhlP89ZBRwrNzfb9hCOIWMN?=
 =?us-ascii?Q?WlL53ohuqwQE6J56FEUqxfbvtUYi0RH0DDR2qfTsm/WpV/hK9OY83oXJSBM6?=
 =?us-ascii?Q?cb2YtVfUgWr8PWEtCMsMEWS7axw5I41lqnRGRfc04MU708f9yEyyzhUPqaFX?=
 =?us-ascii?Q?jf9vE8b1DGlHdo/2TCdrAO/gy5ih37C0jZ4Jz67gaWcG5ctjYWhciMJy8a2d?=
 =?us-ascii?Q?Dd8bseajNKrgPbeLWuClAHdFC9b0C2mHA+Mw2QFLh3J5TMK92xgNODva9S6d?=
 =?us-ascii?Q?yY2vo6ZUGc1t865RCB8Xojq8SptoDOfSLyTv1Ym9jYq5p8OIwSsuPjwa4PWz?=
 =?us-ascii?Q?zby7d7MxRlxYFimNq1UXrusPKbXHD2ZnbykpxoK/bkwp9Sc2gZJNIGX+ZJaM?=
 =?us-ascii?Q?pdUufzZdENMUOuXmqGWYUxmGcR8Z0/CJgC0uZBww/24spSIYuv8DaQ6CKQcn?=
 =?us-ascii?Q?Ku0Z+CzLOFFzVW42emS4H6Xt0DIasCjdel/Qmzz+7boKgYqliW75TVOHua5D?=
 =?us-ascii?Q?huEhu8eJE4qKbroNm8UR1G7qHEfQbDdtG16YOirOm1DkyT0VRlu+8V2qxXaA?=
 =?us-ascii?Q?S8KFDvnCkUQ0CxyTGELn5d043NdJbnwx4aP/sCvmzQ5DO8BU8eY+GRTFzPrz?=
 =?us-ascii?Q?f9/dj4PX9wo/9UTF0zcMMmIQJJQtVe9DUiJ7yVD5lne5kRnyDTa7qjytfgYr?=
 =?us-ascii?Q?2eTkqRzMtgLBQkVmvOBl002RS1Nx8YUO0kGjYnnN1lajfbGehL/nwkQXoURw?=
 =?us-ascii?Q?WjcZgjcD7lyUhhYqANHE8c8mkDmtDVMmv8lV1qJVsa7nSy+fBHx5o5cAR5U6?=
 =?us-ascii?Q?Z+vUh5vFUDFeTU2pQdOOZ10m58SMS6um7y0JFn+5rdNLsK5pg9vsXyoGsm2k?=
 =?us-ascii?Q?dw8n09hSN1IIL3ZWAsvw0UF8YSTb6ZxYvz51BEFE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d600c2-a953-4dd6-b358-08dc857b3736
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 16:19:03.4559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NvWl/6nRXcesH1zuhZJnOyIMEON2AKaxKfbflEUAcjdyq207gx27YAaBISQQYDfUfNcdu8mBNGDHmuDUxOzkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6787
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

On Fri, May 24, 2024 at 07:26:49PM +0100, Dave Stevenson wrote:
> From: Stefan Wahren <stefan.wahren@i2se.com>
> 
> Similar to the info generation, generate the final extra info with a
> separate function. This is necessary to introduce other platforms
> with different info bits.

Each patch commit is independent. 

Introduce common help function to generate the final extra info to reduce
duplicate codes in each DMA operation.


> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/dma/bcm2835-dma.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 7cef7ff89575..ef452ebb3c15 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -229,6 +229,29 @@ static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
>  	return result;
>  }
>  
> +static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
> +					enum dma_transfer_direction direction,
> +					bool cyclic, bool final,
> +					unsigned long flags)
> +{
> +	u32 result = 0;
> +
> +	if (cyclic) {
> +		if (flags & DMA_PREP_INTERRUPT)
> +			result |= BCM2835_DMA_INT_EN;
> +	} else {
> +		if (!final)
> +			return 0;
> +
> +		result |= BCM2835_DMA_INT_EN;
> +
> +		if (direction == DMA_MEM_TO_MEM)
> +			result |= BCM2835_DMA_WAIT_RESP;
> +	}


move if (direction == DMA_MEM_TO_MEM) outof else branch. 
DMA_MEM_TO_MEM is impossible for cyclic. Reduce if level can help
easy to follow up.


	if (cyclic)
		...
	else
		...

	if (direction == DMA_MEM_TO_MEM)
		result |= BCM2835_DMA_WAIT_RESP; 



> +
> +	return result;
> +}
> +
>  static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
>  {
>  	size_t i;
> @@ -644,7 +667,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
>  	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
> -	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
> +	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
> +						 true, 0);
>  	size_t max_len = bcm2835_dma_max_frame_length(c);
>  	size_t frames;
>  
> @@ -675,7 +699,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
>  	struct bcm2835_desc *d;
>  	dma_addr_t src = 0, dst = 0;
>  	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
> -	u32 extra = BCM2835_DMA_INT_EN;
> +	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
>  	size_t frames;
>  
>  	if (!is_slave_direction(direction)) {
> @@ -723,7 +747,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
>  	dma_addr_t src, dst;
>  	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
>  					       buf_addr == od->zero_page);
> -	u32 extra = 0;
> +	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true, 0);
>  	size_t max_len = bcm2835_dma_max_frame_length(c);
>  	size_t frames;
>  
> @@ -739,9 +763,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
>  		return NULL;
>  	}
>  
> -	if (flags & DMA_PREP_INTERRUPT)
> -		extra |= BCM2835_DMA_INT_EN;
> -	else
> +	if (!(flags & DMA_PREP_INTERRUPT))
>  		period_len = buf_len;
>  
>  	/*
> -- 
> 2.34.1
> 
