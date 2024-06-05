Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B58FD5B9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 20:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7669D10E473;
	Wed,  5 Jun 2024 18:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VekqrrT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061.outbound.protection.outlook.com [40.107.249.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423E210E473
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 18:28:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2Q+Dfp/oF9f2LOsh5n+AC5CdXj2B5kkRSOyvZ+uBnulvEhPll79uCH+vQjn9Qcsm8o17KrsxdoQMael4/AoT0aEKU4esmlOVQuYbyTUFn/1Qce8Vw66Y4YnhdnjgjdP1NKN1WQa2wRSv/L2u7ddYQVPSdXVjGB4jKsJ+fJSWqP4KEO4I+2GhzfMAtD+JM+V4xXHMkS+5ND2xOdIEIok7eX7B/VDVMCsFH/VU/JmQU19blkZaYbXrl+Jzh23d8hga7Ji0X7br2edfWg71exeoS+09eBbX4B9uMGnScbZ1alezsUiHvZFb+xdYXuKTSwXWAvRRepr0kPanfyJeswkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMBBYpg3mi7aWqlP2BbsF8b+pD8UEkhOSYYQQhsKTVU=;
 b=Ix/n4dd5JmLBCHuQmb8xvxulV4+BnmEJvSV5oQdkAetVQ1X+/9qzQPSwtZ/Fhm3qNJT/weAdxS/Bu6LaK3wnyMndrAitMAnsEGtifP2Ey2t1S4FBH7eYy6my4eUw3mr8DvC6UJcbdUGilK3JYiUgtdEc4nERahJnLECHh4EBCnQSDdfeYCvjX01N0tGlhvuKpdMoMbKv7U3ahIcThAr/u3eRYPozD4YjUMeWX7IVxAAcb65RGi16LjwOQlxXULCgyxsjoQFihxA5Y5TQpoXsRUHN9rXodh0EvXeEcl6xfCCnB+T1tUKcyLgp8VFZz62FiaOARr8HBSgToc6DIh4/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMBBYpg3mi7aWqlP2BbsF8b+pD8UEkhOSYYQQhsKTVU=;
 b=VekqrrT7brUAPpgN2f7JgNhHSkxvTL3ypMsEZUQy1eVIgQgo+tE3M2hdZaYfp9oD5it96TSRxE1N8LTfJynMNjKjtNfmXvPURhTMw/bJtNxypJJWPkQqZ0+2JEXpPKBg1mXk2uQElNt7vWiibccD0UoKjF5EoWoetLzqpHhJgTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7906.eurprd04.prod.outlook.com (2603:10a6:20b:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 18:28:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 18:28:51 +0000
Date: Wed, 5 Jun 2024 14:28:38 -0400
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
Subject: Re: [PATCH 16/18] drm/vc4: Use phys addresses for slave DMA config
Message-ID: <ZmCuVtXrwDxbkqAR@lizhi-Precision-Tower-5810>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-17-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524182702.1317935-17-dave.stevenson@raspberrypi.com>
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: ef87de64-a382-48ab-ceb0-08dc858d594d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|1800799015|366007|7416005|52116005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6QKKJq3vF58VtTVeJV0e7TZMecz8CKSYxf9pT0wCspCG3tG8+M6OM8lAy86E?=
 =?us-ascii?Q?LEFjzhbxXXWQXOPRxJtoWpdq6yNqoDD6DiXxdW+599bz7iGdehYlOyzeTGmC?=
 =?us-ascii?Q?Zp+2xeVVZNOgqy9HMrPuoF1aTXL5nFNfwmnD7KMR3FbBoPhrxyUnfUMzBczU?=
 =?us-ascii?Q?ynHYFIm+x1/uNrLlGz4BrJRki4IC0+HhTVZxWDeI3dybGtqx+kKtNyQYR7D6?=
 =?us-ascii?Q?oio6MDb7CgliQ/5vf9q717vfTA+7nlKJiuDgvHV1pDrfYAY1p7Q4YAChqPz5?=
 =?us-ascii?Q?m250EVLrbqKl9WoWXi+aFB5WxBn4J1D+yVvUTcD3LbiX7ujL/v2D5ToiM0R2?=
 =?us-ascii?Q?rSsiqfImstoXXOxafq/2V3TXNDIB7nICWqSCvUU3rbX7ArUUWySrwgZ6e++q?=
 =?us-ascii?Q?EXSpZVVPEeyW1pzWzu99ire6+fBStDkKWSMtvI+Rk6n6TOXqeVGVR020USN2?=
 =?us-ascii?Q?s8O8F5nIdFTKfKnNw4zoFlhiH/lhAm2AIAs5f0i8R7ufQGfQM4zwPksK4VTi?=
 =?us-ascii?Q?sHYwCkfUzYMXbw+PEHROsbfygLqzQXplLbaGnuFJ3RVUIznwbMx6FhHkd3fn?=
 =?us-ascii?Q?w0IfZIQL3c3Te6dp1KfMIkze1Sv0/XowCt3S4/nqYkGQfQCzxmKq/WaPtBEG?=
 =?us-ascii?Q?io3Fv7UIyM3nyWq+gldTcym6VtbYRoeZi8veAu4s+y48nJph6M+p04EtDwsV?=
 =?us-ascii?Q?XRIUM9Y54j5rBzST8Ef4zAWMTWwBNJeEZqkZcDJHJ6T7drVbHHlAv3J2UWd4?=
 =?us-ascii?Q?frGjsfVwRkZcbc6GHsBgM7fEvFpsc7CxrLDE9TEOprIXZOn9J4zi0QcOnEkd?=
 =?us-ascii?Q?Xekw2PJysEyIbnHE0iq8Gi9KM2vs+ZW6ig6nmuTc7M8/d2Esdlm0Z5y44v5T?=
 =?us-ascii?Q?MeC0FJVMHiSIPEhzZUnhFfTncP6+fsalQbon3DLxKSUzv5udcfXYbfELuUQm?=
 =?us-ascii?Q?hqBNPtrqcSGSDFt+YVwwFNaiLO6qzr6nnmppj8WsPKWeRXiQfHklnWxiVrz5?=
 =?us-ascii?Q?5iYWUkPdu2AOnD8/e2dLQ4XvAX2FJH2m3wD+wLzDVqSS0R59m5QKSUS/RqMq?=
 =?us-ascii?Q?thTriX9+DMelQmXyZm+DE2hF7H2KMukBEXI2rqfPYdVbOfx+lrZaApcytJSm?=
 =?us-ascii?Q?V61PcHlBIWQf4DinF7eShK789mexxuTElauzeIwOF91qbM8drv73BL2/6Ypz?=
 =?us-ascii?Q?df9Ay6P9kIZrz0n6JeW7QTi/7Urh1rTsryjk1cfLZBeo4Nu2v1SryI6nSot+?=
 =?us-ascii?Q?ACvAa+prH+jbp6jzgvokCJMVJpBkTk7jA79bCJgl3vaSCzPKkfAKWlyYjdm2?=
 =?us-ascii?Q?EYf/6mwmvwBxRHwiPJ3x/3RehAHv6zLeQrwSICdOhbOl+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(7416005)(52116005)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f4JppEpsVHNRidpszQ7pTvwzJRWL10VYJD2WmA8+GmMvyvWj2nn24Y4AB7QT?=
 =?us-ascii?Q?8rcHZU5p/St5todaDrdw6+afB/edd2RX0H++qhMWIOyytRNLp3GIOMqIZ66I?=
 =?us-ascii?Q?5eKwJbQOKR0+8ZRrEEEJFGQFL4vZzuts/m3zkhnoOWz+N47k1XwGpzAQfDA5?=
 =?us-ascii?Q?GgFCaXB4XvfhtbfnINrDjemoWIe6ZY3IFYelVNyodUvWFe7LS6ETmkO643Wn?=
 =?us-ascii?Q?v1PXF9OS6antgU9DJELqZJ1VuN6YwC6+Zs2LNIligCH+f+WbCLSBb0l4/v52?=
 =?us-ascii?Q?Qm2gkZzKnaE0izOU2jml5nUI+Whg2ajr7az87rp+xZZzvl54oULRonSJ1PLn?=
 =?us-ascii?Q?itEX1BDpqWNByR27s/4RnrP6DELosWA9JoaxYeeiW4+pgjQP6iYGxbtn0ouH?=
 =?us-ascii?Q?O0oKzQUGJeV8vw03o0hdJYKaZmTbJz2qIfzAT7RCfwNw1W5ULJ16jXKO2KZf?=
 =?us-ascii?Q?2RaLkr6bgFwfnx9Glz0sP+XTkVnUS58mVtizJzDWeY/Z92w5MEXnvtne0knH?=
 =?us-ascii?Q?h1UekqZvxBXz16gIpYxEkHJePFcOqQxBxiHeEASTUXv5on+MwsyKMrwbF+ud?=
 =?us-ascii?Q?lcNWmrDYkluh+wexotmY3ywOf0QRZOf3t+38Fv3KR3TSGxEOu7m0cJBYMOek?=
 =?us-ascii?Q?F3oKwAPV+vYcPyEEbJL1voA0R8FWmomm8xafFljnPMiMyUyA+GN6muU77upp?=
 =?us-ascii?Q?YCdKd2GXayj+5W5+YFcz7DFCdLEgW8XOVS5VUfjwyWogL1F9pOuBXjSNGKG4?=
 =?us-ascii?Q?5JXxqDiWMPGyU5bQpk3nQqo5SVBWPMjGRUAgwr0J8uvG6BuK5DMfVbCxy1DP?=
 =?us-ascii?Q?pSy767LctEB3+tGNQxrVEX1XA9NdZJPZLozSxmAKKhCl23BoIUBurCQeALGz?=
 =?us-ascii?Q?68wUPfaktJMQ1Ru9C0eJAUc0Mpd9PtE3R3cNZUpw3OtGHYpbit3zYN31WO3H?=
 =?us-ascii?Q?MgAQBWElE3Lqm2fhGPuZHxknxVvQFBsJ3d0aKlhPUmaXPavyH4iBdOnV9OFi?=
 =?us-ascii?Q?qXqKsdF2DJDxXtu77MCYDML/NtAY32+jluLvJR9U4pBuML7UIiBc2XjobN90?=
 =?us-ascii?Q?42yxq+hVEbVVNQhOyeFjvMXEqd5NXCcxixVKj+XUuDIvx1tNrnssWiTi2M8j?=
 =?us-ascii?Q?tqTMKd8ZYOc2m3+j7ty2qcu3aCmeik9dq6g8Y4XcK0egzEzWx7/AmIajmBpQ?=
 =?us-ascii?Q?tKg8TC0twXwyd+dYmBdpeUWL92DYpG8abdTALLBRXBsnDKX0HcXImzfPsZWh?=
 =?us-ascii?Q?vIswlZcXDyWz5WPAfzx6oTly1xVbLb3JKta/a1i5hEiN+IKspfLihvDv7Fym?=
 =?us-ascii?Q?N1LOCQywlr//dZka/CIAZOiarWp1JZrHswaGyWir2oow+heQaj9+BSa8jEMg?=
 =?us-ascii?Q?BBesC2gTljxtAs/m3jgS7nOGk//L9w65Hw7DiyJ0KkRYW7zMaRnOW6BjPGGh?=
 =?us-ascii?Q?ryoBDBYT1Phk8VQQdmGUH/l8quk0NjYNUqsryIcgaLf6QHTsmok0emXNxYMr?=
 =?us-ascii?Q?LVBzoK+0Vhh6NfXuGEM2qgncaOvBXmAnqs0LOoHJcrY0jValEfgp0JgeOXNS?=
 =?us-ascii?Q?hX0h0O73OPfcmvUlzf6BO8Y4HjDUudjOlw5pte4G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef87de64-a382-48ab-ceb0-08dc858d594d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 18:28:51.5877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlDT/6XeYhA/R7WmhgCKJWO6H4F69joibEF5AOMLo+zd2LlAwdpoO+OCOYspKBL4D+mFbD55Ir0jy9zc10IWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7906
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

On Fri, May 24, 2024 at 07:27:00PM +0100, Dave Stevenson wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> Slave addresses for DMA are meant to be supplied as physical addresses
> (contrary to what struct snd_dmaengine_dai_dma_data does).

Can you use the same content for patch 14-17?

Frank

> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index d30f8e8e8967..c2afd72bd96e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2696,7 +2696,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>  	struct snd_soc_card *card = &vc4_hdmi->audio.card;
>  	struct device *dev = &vc4_hdmi->pdev->dev;
>  	struct platform_device *codec_pdev;
> -	const __be32 *addr;
> +	struct resource *iomem;
>  	int index, len;
>  	int ret;
>  
> @@ -2732,22 +2732,15 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>  	}
>  
>  	/*
> -	 * Get the physical address of VC4_HD_MAI_DATA. We need to retrieve
> -	 * the bus address specified in the DT, because the physical address
> -	 * (the one returned by platform_get_resource()) is not appropriate
> -	 * for DMA transfers.
> -	 * This VC/MMU should probably be exposed to avoid this kind of hacks.
> +	 * Get the physical address of VC4_HD_MAI_DATA.
>  	 */
>  	index = of_property_match_string(dev->of_node, "reg-names", "hd");
>  	/* Before BCM2711, we don't have a named register range */
>  	if (index < 0)
>  		index = 1;
> +	iomem = platform_get_resource(vc4_hdmi->pdev, IORESOURCE_MEM, index);
>  
> -	addr = of_get_address(dev->of_node, index, NULL, NULL);
> -	if (!addr)
> -		return -EINVAL;
> -
> -	vc4_hdmi->audio.dma_data.addr = be32_to_cpup(addr) + mai_data->offset;
> +	vc4_hdmi->audio.dma_data.addr = iomem->start + mai_data->offset;
>  	vc4_hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>  	vc4_hdmi->audio.dma_data.maxburst = 2;
>  
> -- 
> 2.34.1
> 
