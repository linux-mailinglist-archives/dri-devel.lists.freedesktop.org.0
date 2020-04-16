Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0120F1ACEAF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 19:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D186E0B6;
	Thu, 16 Apr 2020 17:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D5C6E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:27:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A838B23;
 Thu, 16 Apr 2020 19:27:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587058059;
 bh=2oEsITlKsJY88YYqzsh6fJEmUOFQaNSHSjn/9Tj3WN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cz/mwzxPMTVQQmY/eHuOzRF4rb5ao5dK3ywKpwgzbEECiwCr3vRpv3b/zClKr/7g1
 M2/T33fgavzAzVRGiYWqxbZYlSF7WMJtJoy6IxTHf3hEdiTcB2gLZspbzzPOlLVS6A
 nhQueS3FFcR82qMioUu0uEXB0+eVj8HLw6d1nRgo=
Date: Thu, 16 Apr 2020 20:27:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 1/2] drm/tegra: output: Don't leak OF node on error
Message-ID: <20200416172727.GN4796@pendragon.ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416172405.5051-2-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patch.

On Thu, Apr 16, 2020 at 08:24:04PM +0300, Dmitry Osipenko wrote:
> The OF node should be put before returning error in tegra_output_probe(),
> otherwise node's refcount will be leaked.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
