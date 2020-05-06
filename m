Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC2B1C76BB
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 18:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D040F6E8A8;
	Wed,  6 May 2020 16:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DD86E8A8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 16:42:18 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7259A80500;
 Wed,  6 May 2020 18:42:16 +0200 (CEST)
Date: Wed, 6 May 2020 18:42:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 3/6] drm/tegra: output: Don't leak OF node on error
Message-ID: <20200506164215.GC19296@ravnborg.org>
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200418170703.1583-4-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=K8HgHsMCaQdvhFoLfFEA:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 18, 2020 at 08:07:00PM +0300, Dmitry Osipenko wrote:
> The OF node should be put before returning error in tegra_output_probe(),
> otherwise node's refcount will be leaked.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/tegra/output.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index e36e5e7c2f69..a6a711d54e88 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -102,10 +102,10 @@ int tegra_output_probe(struct tegra_output *output)
>  	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
>  	if (panel) {
>  		output->panel = of_drm_find_panel(panel);
> +		of_node_put(panel);
> +
>  		if (IS_ERR(output->panel))
>  			return PTR_ERR(output->panel);
> -
> -		of_node_put(panel);
>  	}
>  
>  	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
> @@ -113,13 +113,12 @@ int tegra_output_probe(struct tegra_output *output)
>  	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
>  	if (ddc) {
>  		output->ddc = of_find_i2c_adapter_by_node(ddc);
> +		of_node_put(ddc);
> +
>  		if (!output->ddc) {
>  			err = -EPROBE_DEFER;
> -			of_node_put(ddc);
>  			return err;
>  		}
> -
> -		of_node_put(ddc);
>  	}
>  
>  	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
