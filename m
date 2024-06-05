Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006128FD4A5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 20:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41FB10E3A6;
	Wed,  5 Jun 2024 18:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="e5+hFL4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CAC10E314
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 18:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOCjIbbvVAhD5KPd1sPNfwgijuSR8lxD8nEciv5HPKToGSpaCqd+aIq/kTi1Q4B8VljCYHKNe4l2pWiEahkdTN6BIfJEIRkHRD/rGD5Djm1TYHH/xpEV6vufuUOGn4KXLwg4P/VhjPkWyxRUpkTYFLCTXsi4licx9+kTDn3g8NhwCGnr//Bygujt0UCD52jYeCAAyPA4D73LqeynAQYoAT5UjCPGXhzLzJI/v8o70ssrj4qQnqlWFW0jYS2Nqjf0kAI5pbSUBoXFVetTpXVru+aRuEOLEsRzaDuiEQY9B3GpQ5YVaxXa6Cdv+vJk6Yc9LAol74JPPL5A2dAc+4wuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdLTSyBduHLvZcwqEyzwK2jqKez8VPETjfSihES13oM=;
 b=TpPodAOVEUd3QV1HlwxgKI/Hu8Ov2qN/ywAA+SoEc+NGd68mts52qiSZjmnPK8aJxToNnNq53ijeowLt7ld+F7as6cpIQKSJ28DpqOmoQwkCFSbs/NYVOSuN6cZLdNoAjBtvYmZkbfmE6gf/334u6kxtRd5/gJTWtT0FMEqqtJxZE7IftXWQgYVubIuHc7A3BJEWcbnB4r50X115zoNTN9cLX82m7MxJhDzzb9fWBLqR8w4NBil0r/pfX6JQX5LVvJm6NerSJsLxpwBj+HvaKzwuio5pAnfmNprWvU+pyWvx+YM9NoCDZIJPhqrqXdFrS/VhYvRliangQpPIlRqXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdLTSyBduHLvZcwqEyzwK2jqKez8VPETjfSihES13oM=;
 b=e5+hFL4YPAdFBo71elunCVEGhQVj+ikxbrkhIhomLUQGu7nx1rwMBVqaYy3rReReFipfUHThEcUW5LY1DvZBSMO7y4HEViq48ky8ijobI5rmgI10W56dedArEVtH8U9z1pk9BEZzfqydFE80DKTZys6CKFcN5LTnA5ULtLAAMtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6832.eurprd04.prod.outlook.com (2603:10a6:803:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Wed, 5 Jun
 2024 18:00:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 18:00:16 +0000
Date: Wed, 5 Jun 2024 14:00:03 -0400
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
Subject: Re: [PATCH 07/18] dmaengine: bcm2385: drop info parameters
Message-ID: <ZmCno9E9oi8sw3QC@lizhi-Precision-Tower-5810>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-8-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524182702.1317935-8-dave.stevenson@raspberrypi.com>
X-ClientProxiedBy: BY3PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: a155639c-b35e-4177-21d6-08dc85895ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|7416005|376005|52116005|1800799015|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y+kp+4QmMaMd8b+p6Klox8Rszs7IqsXLcYUjvhSBjzvvOAyT/J03xlZiScOV?=
 =?us-ascii?Q?szf1LhpyBm5Y3wMBph/urrL5qlEdPdHEbuMaGumz0vcu+ma2KwpnZAOset3H?=
 =?us-ascii?Q?028yDTDfGpdGPTHnxG/jsYYMuLVHavFH679s6ApsaTuJHoWAhDiJaXZkbMnl?=
 =?us-ascii?Q?yRBDnglSbZknXjZbgx4Hw3jyJgrIxps0lXoIxx5AOc7saWnILd4KrwrGjaPp?=
 =?us-ascii?Q?9mpHCIpKWsMRItRES1J/c53i3VGoTPjU6tExg8ljT6iVew18gbfL7D4VNZ7j?=
 =?us-ascii?Q?pLM7Qf18zX5BhBH3eZ87KkTsl6UO+lKfH9u4Pssv5I0HLIzzI5orIbjm5Bqx?=
 =?us-ascii?Q?Ydff1uFdAypvMqtvrBE84hQhriqx1OElHyN8cjmB169Hpl5wbT07UlI0yCed?=
 =?us-ascii?Q?3sJEw/gXYtaNMBgmCuFmXQdXC9Ym+a6tOYkL4HffaWC3ohwPM7uCINjrSExN?=
 =?us-ascii?Q?apJte/GDF61CGMNmvMzmqwd2G+amK9aFTJaQCRXrAk3/FrH06ymvPMbck6Jj?=
 =?us-ascii?Q?GSKa/LxMF8F64gi2abSfYGS6//zHpjzEKEdNSw/fj9I7BGmMrlWwYXnTXHzM?=
 =?us-ascii?Q?WWHEdGwJ/lkhrQyrcLJr1EIBUEnQjjq2StBEugoCt8aK/oO0IndCJyHeuEI4?=
 =?us-ascii?Q?5SL1p0UM0kz1UopXGSf494lPsMXXDrcOX8mw5hLpUN4IDY+7UgjG5BjpFOZf?=
 =?us-ascii?Q?1pE7y9HevtgQ/sA9TPly6ztzLesnPgyI7RXub236dXFhxFVNTwjHbvJVFNLK?=
 =?us-ascii?Q?UxL/xydJqlpdM50BKFCf78H26+m1RzAvSlzAiqaz3dtmTrrPH5LixhhBi1ig?=
 =?us-ascii?Q?9Cl5gJ7Ig4hDepmwGjAAXkf1/hKR10dVuQmDeS7yvlfKjdSaBalacWcu/oEc?=
 =?us-ascii?Q?WXxo1w4Rjm2BbQj8B0n4/oqvqFOtNlSzhufJs5diTBBvwV+OxX06hve4V774?=
 =?us-ascii?Q?67gF7ywYHIM9Qk/O5/g6stBhRy/E2XuLgW89aWsifFy9N2Nd1PwxjCa/37wU?=
 =?us-ascii?Q?11/939P1M6MWx7bhZOSfqdPKU17DXeRfLJQz/a/9/U/q8h4wpZqNoaN9Go76?=
 =?us-ascii?Q?GsNwaACHpPf6TpQgcr0K5MJSL7iaT4UtV6U4/8c+E/G8X9eFw4U+VGE3P0v/?=
 =?us-ascii?Q?uLmWf4LlJvP9vTw23NhIpCMXClbkh6OGBcOEXb7Aw3WEGZhQ5yvp/8rkb0ID?=
 =?us-ascii?Q?Fn4BFMguxdQcYX6zCqjBCW5nOeD6s2Ei5QCJag5AgOJ9RvXd2o7r0YjxL5oJ?=
 =?us-ascii?Q?I02U7SF69nsl9vFSOEVdlRCrUQj/w7xcYSy/B6X/xDIe2q2JZBPQQUjw2Wf+?=
 =?us-ascii?Q?0SGnMoG/GXVFV7iLBc72hH4XDgTGESktBNMzJARACDG3Xw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(52116005)(1800799015)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fejAJSkvIRXZbawls78o7bArRkb61dy6oosNJOJvCBXwxAIdiilX2ghBslTK?=
 =?us-ascii?Q?FmXp7Hr2Ux8qGVz30QVW2DdGCu06x8788V3DXsVbEhkjFq9psNOOnPWlcj2S?=
 =?us-ascii?Q?053iud7Fu4VetDm/AQV7Mp4DO8dm0eS/sYz+6XWM+FXSkrcERx3ZL/nl3LdJ?=
 =?us-ascii?Q?vhUdggqe0zzqzaVjNMTPfuvBDLzOMGYYxQEMAFwVgUTv7jwC3IPxmSPPDDWM?=
 =?us-ascii?Q?cEMgs6jqBAmQ8GiltJuuWW+sktHAcnB4vi2cOmFiO2zxlkMqigcp+2PDlnNC?=
 =?us-ascii?Q?l7LGLgCO0LZju0mryS6YIvtQQou4KccRV/6azE2W9SGsRXQiqibo/KeIQOFN?=
 =?us-ascii?Q?5RMiHE0qkqtr4EaVNFWx55j9gNA7xPKDFRUleF2pV3+AxJnRCGFK+jKmmo5o?=
 =?us-ascii?Q?Wz8ELWrOrusw9LPDPqlySJGdxasvOazuvdck6e9mIyIH32pykHmnsr7FZ6PX?=
 =?us-ascii?Q?aXx75aPnXsIFk4q+jQ7CukDnr9P2KBmJAfHXr5DySBetBNJbTt80X6XSdZr+?=
 =?us-ascii?Q?5P/WIoUmDfztT5sQDMWhocpZSu74OuG7jbIqXb00w24LMWCCxep2dmj11UyU?=
 =?us-ascii?Q?v/Mzk7dlVZKDY5s4LDimb23/NZ5IFOXJbg74B0m0Az+EWWBLSnHFUlQtYGY9?=
 =?us-ascii?Q?GCu+Hld0Gk1SFI4POAM4zZh0tpGkfcgRXLNviKurtEneToFL3Gwx56Rnj35z?=
 =?us-ascii?Q?XJzbm+r56YGKuJBR1kT5MKtZqXcH6U975WfIUjut1D8h2PmwSBSOIsJPhohx?=
 =?us-ascii?Q?rG/IDSuENiUHeaciahyiuTDqmMhAvv+9/Hf0whVWSGLTGBUfvmspoBnBeuDg?=
 =?us-ascii?Q?6ehSqokozm3JGSpO6L3vKuAK8WyPlw3Vjj9Ql/BD48UNY9dl90n5MlNE+3lu?=
 =?us-ascii?Q?xTl/Z3RzjjCi8Ll622+PJPNHsGO27VvmODEdaB1DO4pWTOFQMQuCBMIfUA/A?=
 =?us-ascii?Q?ofJ9tkMWshaaElUI2mFvgkjLckho5f57QUcDjHrKHBLCtm2gqwWvZF1YWH7M?=
 =?us-ascii?Q?mW4RZwg2q6BodMmyvDYtcEJ4pC0DjzhNJA/Ktdk3vVFbpS4njgqGTA/Sa7lN?=
 =?us-ascii?Q?WWW/SCyqvMV7627BFrcNNroLzbkOzdPxkVJ3Ap5hugmxgGOq4/nNtdRTvEJu?=
 =?us-ascii?Q?ckR4JGbD4vZ4mJOxYGBKGi06eSaoGDTplRW+3OiYE/MCczWA873Ghlhd7Vh8?=
 =?us-ascii?Q?NCmWlRwXgsOvXjtqVu6+VLeY5sDU0KmrGWr+g8xRhHDNDl5vCLTtn9Q0E768?=
 =?us-ascii?Q?jmVxpV13MnsOTlv8/A1+oIvng8A9lPv1PLiefuuRnA5FpN6EpbJjktfzpmCt?=
 =?us-ascii?Q?tTiFj/JN/EepvVpzWHCiuMDRfPnNpMgRbbj4chXQYxasYZ3F8/bBsyBhPi7i?=
 =?us-ascii?Q?8oQlDoHcRnifqQiNGsJ6y0YD/npg2ruM6N9KyEqNhFUHN6owrilfaXmtHF9n?=
 =?us-ascii?Q?OL9/vlTjl8663za9ogfY2YpdDl9UW7efd7KLQ00z1k/GGiMb++BhlPJ4Vs0h?=
 =?us-ascii?Q?wCr+QyOtSYTtE/oqga4WTYOwq6gE6OyVhuX5eAJRMR7RA6M8yv1y7FTaYU9C?=
 =?us-ascii?Q?8xg8uhJ6BhKrCahDNCkuQVDTOItssgL2JIvX6OXc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a155639c-b35e-4177-21d6-08dc85895ae3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 18:00:16.3793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYPOse00GzPAZdSkA6ItI67LPNJybSxrE5SWyhP0eSUqvnfNBx5w+lksYHzofgHOJk22fGrhCQOyDpqnsQkDhg==
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

On Fri, May 24, 2024 at 07:26:51PM +0100, Dave Stevenson wrote:
> From: Stefan Wahren <stefan.wahren@i2se.com>
> 
> The parameters info and finalextrainfo are platform specific. So drop
> them by generating them within bcm2835_dma_create_cb_chain().

Drop 'info' and 'finalextrainfo' because these can be generated by 
bcm2835_dma_create_cb_chain().

> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/dma/bcm2835-dma.c | 83 +++++++++++++++++++--------------------
>  1 file changed, 40 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index d6c5a2762a46..e2f9c8692e6b 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -287,13 +287,11 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
>  		container_of(vd, struct bcm2835_desc, vd));
>  }
>  
> -static void bcm2835_dma_create_cb_set_length(
> -	struct bcm2835_chan *chan,
> -	struct bcm2835_dma_cb *control_block,
> -	size_t len,
> -	size_t period_len,
> -	size_t *total_len,
> -	u32 finalextrainfo)
> +static bool
> +bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
> +				 struct bcm2835_dma_cb *control_block,
> +				 size_t len, size_t period_len,
> +				 size_t *total_len)

Can you document this function, what's return value means? look like if
need extrainfo?

>  {
>  	size_t max_len = bcm2835_dma_max_frame_length(chan);
>  
> @@ -302,7 +300,7 @@ static void bcm2835_dma_create_cb_set_length(
>  
>  	/* finished if we have no period_length */
>  	if (!period_len)
> -		return;
> +		return false;
>  
>  	/*
>  	 * period_len means: that we need to generate
> @@ -316,7 +314,7 @@ static void bcm2835_dma_create_cb_set_length(
>  	if (*total_len + control_block->length < period_len) {
>  		/* update number of bytes in this period so far */
>  		*total_len += control_block->length;
> -		return;
> +		return false;
>  	}
>  
>  	/* calculate the length that remains to reach period_length */
> @@ -325,8 +323,7 @@ static void bcm2835_dma_create_cb_set_length(
>  	/* reset total_length for next period */
>  	*total_len = 0;
>  
> -	/* add extrainfo bits in info */
> -	control_block->info |= finalextrainfo;
> +	return true;
>  }
>  
>  static inline size_t bcm2835_dma_count_frames_for_sg(
> @@ -352,7 +349,6 @@ static inline size_t bcm2835_dma_count_frames_for_sg(
>   * @chan:           the @dma_chan for which we run this
>   * @direction:      the direction in which we transfer
>   * @cyclic:         it is a cyclic transfer
> - * @info:           the default info bits to apply per controlblock
>   * @frames:         number of controlblocks to allocate
>   * @src:            the src address to assign
>   * @dst:            the dst address to assign
> @@ -360,22 +356,24 @@ static inline size_t bcm2835_dma_count_frames_for_sg(
>   * @period_len:     the period length when to apply @finalextrainfo
>   *                  in addition to the last transfer
>   *                  this will also break some control-blocks early
> - * @finalextrainfo: additional bits in last controlblock
> - *                  (or when period_len is reached in case of cyclic)
>   * @gfp:            the GFP flag to use for allocation
> + * @flags
>   */
>  static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
>  	struct dma_chan *chan, enum dma_transfer_direction direction,
> -	bool cyclic, u32 info, u32 finalextrainfo, size_t frames,
> -	dma_addr_t src, dma_addr_t dst, size_t buf_len,
> -	size_t period_len, gfp_t gfp)
> +	bool cyclic, size_t frames, dma_addr_t src, dma_addr_t dst,
> +	size_t buf_len,	size_t period_len, gfp_t gfp, unsigned long flags)
>  {
> +	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	size_t len = buf_len, total_len;
>  	size_t frame;
>  	struct bcm2835_desc *d;
>  	struct bcm2835_cb_entry *cb_entry;
>  	struct bcm2835_dma_cb *control_block;
> +	u32 extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic,
> +						     false, flags);
> +	bool zero_page = false;
>  
>  	if (!frames)
>  		return NULL;
> @@ -389,6 +387,14 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
>  	d->dir = direction;
>  	d->cyclic = cyclic;
>  
> +	switch (direction) {
> +	case DMA_MEM_TO_MEM:
> +	case DMA_DEV_TO_MEM:
> +		break;
> +	default:
> +		zero_page = src == od->zero_page;
> +	}
> +
>  	/*
>  	 * Iterate over all frames, create a control block
>  	 * for each frame and link them together.
> @@ -402,7 +408,8 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
>  
>  		/* fill in the control block */
>  		control_block = cb_entry->cb;
> -		control_block->info = info;
> +		control_block->info = bcm2835_dma_prepare_cb_info(c, direction,
> +								  zero_page);
>  		control_block->src = src;
>  		control_block->dst = dst;
>  		control_block->stride = 0;
> @@ -410,10 +417,12 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
>  		/* set up length in control_block if requested */
>  		if (buf_len) {
>  			/* calculate length honoring period_length */
> -			bcm2835_dma_create_cb_set_length(
> -				c, control_block,
> -				len, period_len, &total_len,
> -				cyclic ? finalextrainfo : 0);
> +			if (bcm2835_dma_create_cb_set_length(c, control_block,
> +							     len, period_len,
> +							     &total_len)) {
> +				/* add extrainfo bits in info */
> +				control_block->info |= extrainfo;
> +			}
>  
>  			/* calculate new remaining length */
>  			len -= control_block->length;
> @@ -434,7 +443,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
>  	}
>  
>  	/* the last frame requires extra flags */
> -	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
> +	extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic, true,
> +						 flags);
> +	d->cb_list[d->frames - 1].cb->info |= extrainfo;
>  
>  	/* detect a size missmatch */
>  	if (buf_len && (d->size != buf_len))
> @@ -682,9 +693,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
>  {
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
> -	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
> -	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
> -						 true, 0);
>  	size_t max_len = bcm2835_dma_max_frame_length(c);
>  	size_t frames;
>  
> @@ -696,9 +704,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
>  	frames = bcm2835_dma_frames_for_length(len, max_len);
>  
>  	/* allocate the CB chain - this also fills in the pointers */
> -	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false,
> -					info, extra, frames,
> -					src, dst, len, 0, GFP_KERNEL);
> +	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false, frames,
> +					src, dst, len, 0, GFP_KERNEL, 0);
>  	if (!d)
>  		return NULL;
>  
> @@ -714,8 +721,6 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
>  	dma_addr_t src = 0, dst = 0;
> -	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
> -	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
>  	size_t frames;
>  
>  	if (!is_slave_direction(direction)) {
> @@ -738,10 +743,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
>  	frames = bcm2835_dma_count_frames_for_sg(c, sgl, sg_len);
>  
>  	/* allocate the CB chain */
> -	d = bcm2835_dma_create_cb_chain(chan, direction, false,
> -					info, extra,
> -					frames, src, dst, 0, 0,
> -					GFP_NOWAIT);
> +	d = bcm2835_dma_create_cb_chain(chan, direction, false, frames, src,
> +					dst, 0, 0, GFP_NOWAIT, 0);
>  	if (!d)
>  		return NULL;
>  
> @@ -757,13 +760,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
>  	size_t period_len, enum dma_transfer_direction direction,
>  	unsigned long flags)
>  {
> -	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
>  	dma_addr_t src, dst;
> -	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
> -					       buf_addr == od->zero_page);
> -	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true, 0);
>  	size_t max_len = bcm2835_dma_max_frame_length(c);
>  	size_t frames;
>  
> @@ -814,10 +813,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
>  	 * note that we need to use GFP_NOWAIT, as the ALSA i2s dmaengine
>  	 * implementation calls prep_dma_cyclic with interrupts disabled.
>  	 */
> -	d = bcm2835_dma_create_cb_chain(chan, direction, true,
> -					info, extra,
> -					frames, src, dst, buf_len,
> -					period_len, GFP_NOWAIT);
> +	d = bcm2835_dma_create_cb_chain(chan, direction, true, frames, src, dst,
> +					buf_len, period_len, GFP_NOWAIT, flags);
>  	if (!d)
>  		return NULL;
>  
> -- 
> 2.34.1
> 
