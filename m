Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B436FBCF5
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 04:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DE710E322;
	Tue,  9 May 2023 02:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2B310E1CE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 02:14:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5008C85FE2;
 Tue,  9 May 2023 04:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683598452;
 bh=xEoYb2xvPRwLyc46wdI5EgNKAR1nZoXMta3OPGG44ew=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iWod83Xhh6gAViiy3/MfBkHDYkQuG/qh40xtEs0jtBlKRA/OdT3BfO3FXR9adLr4G
 2/Xb1PU+NaVDclwGDHsq1746zUPFevni+6Tr5I8zbmWp0bC5T0gs0Fm8ZDltUgIE7S
 c2XA4bOOl2Ybk9HXuML0oPjxs9d6DrJKss9Z9wf/qOfRp2vDv6ChSlrwSrpZaDpmoh
 4+OokQhVBPbGturixBLeKY5iKH5gqD5KOBPXsbdrjjIuhQvQ4uFKcuklmYJRYAbkcz
 wCo5j1m02g+YpmO1y2EOuda0kN6Z7i+jpIXR9u2wkuJ2OyJCr6PNekNte19gMti8Lt
 i+t6nPP0de12g==
Message-ID: <2ef8da6c-a16b-4396-1456-9a4d75ca5200@denx.de>
Date: Tue, 9 May 2023 02:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 5/6] drm: lcdif: Add multiple encoders and first
 bridges support
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230508055740.635256-1-victor.liu@nxp.com>
 <20230508055740.635256-6-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230508055740.635256-6-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: conor+dt@kernel.org, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/8/23 07:57, Liu Ying wrote:
> The single LCDIF embedded in i.MX93 SoC may drive multiple displays
> simultaneously.  Look at LCDIF output port's remote port parents to
> find all enabled first bridges.  Add an encoder for each found bridge
> and attach the bridge to the encoder.  This is a preparation for
> adding i.MX93 LCDIF support.
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4->v5:
> * Rebase upon v6.4-rc1 and resolve a trivial conflict.
> * Add Alexander's A-b and T-b tags.
> 
> v3->v4:
> * Improve warning message when ignoring invalid LCDIF OF endpoint ids.
>    (Alexander)
> 
> v2->v3:
> * No change.
> 
> v1->v2:
> * Split from patch 2/2 in v1. (Marek, Alexander)
> * Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
> * Drop unneeded 'bridges' member from lcdif_drm_private structure.
> 
>   drivers/gpu/drm/mxsfb/lcdif_drv.c | 68 +++++++++++++++++++++++++++----
>   drivers/gpu/drm/mxsfb/lcdif_drv.h |  4 +-
>   drivers/gpu/drm/mxsfb/lcdif_kms.c | 21 ++--------
>   3 files changed, 66 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index e816f87828fb..cf27b63b1899 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -9,13 +9,16 @@
>   #include <linux/dma-mapping.h>
>   #include <linux/io.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/of_device.h>
> +#include <linux/of_graph.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_drv.h>
> +#include <drm/drm_encoder.h>
>   #include <drm/drm_fbdev_dma.h>
>   #include <drm/drm_gem_dma_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> @@ -38,19 +41,68 @@ static const struct drm_mode_config_helper_funcs lcdif_mode_config_helpers = {
>   	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>   };
>   
> +static const struct drm_encoder_funcs lcdif_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>   static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>   {
> -	struct drm_device *drm = lcdif->drm;
> +	struct device *dev = lcdif->drm->dev;
> +	struct device_node *ep;
>   	struct drm_bridge *bridge;
>   	int ret;
>   
> -	bridge = devm_drm_of_get_bridge(drm->dev, drm->dev->of_node, 0, 0);
> -	if (IS_ERR(bridge))
> -		return PTR_ERR(bridge);
> -
> -	ret = drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
> -	if (ret)
> -		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
> +	for_each_endpoint_of_node(dev->of_node, ep) {
> +		struct device_node *remote;
> +		struct of_endpoint of_ep;
> +		struct drm_encoder *encoder;
> +
> +		remote = of_graph_get_remote_port_parent(ep);
> +		if (!of_device_is_available(remote)) {
> +			of_node_put(remote);
> +			continue;
> +		}
> +		of_node_put(remote);
> +
> +		ret = of_graph_parse_endpoint(ep, &of_ep);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to parse endpoint %pOF\n", ep);
> +			of_node_put(ep);
> +			return ret;
> +		}
> +
> +		if (of_ep.id >= MAX_DISPLAYS) {

Can we make the maximum number of displays, or really bridge, specific 
to IP instance instead (1 for mx8mp, 3 for mx93) ? If so, then I think 
we need to track a list of bridges in some linked list or some such 
dynamic structure, which would allow us to get rid of MAX_DISPLAYS macro.

> +			dev_warn(dev, "ingoring invalid endpoint id %u\n", of_ep.id);

s@ingoring@ignoring@

[...]
