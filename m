Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4D0140A33
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 13:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEFE6E4F8;
	Fri, 17 Jan 2020 12:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92CA6E4F8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 12:53:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C137504;
 Fri, 17 Jan 2020 13:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1579265602;
 bh=KZtVEukbgVAcvBHpXN8iG1JBWJv5/gSEo61lqRh3+Zk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8qpr1++v9/3YjodjRsrpm2lzfgWR8RKhQqX7P6d78yU7w1tt9+pz4dsMnz0s25v1
 ba99/ttYalPvDiny4UP2ayw1FCOB7PdTtuTp6y391Bo7+XmiebDvVeDf9uuziZZ3Nv
 Vs12/JwCSWbGtsgSObI+vndLNDwRAA+gpq9Gl3u4=
Date: Fri, 17 Jan 2020 14:53:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/bridge: tfp410: add pclk limits
Message-ID: <20200117125307.GE5711@pendragon.ideasonboard.com>
References: <20200113134528.9851-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113134528.9851-1-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Mon, Jan 13, 2020 at 03:45:28PM +0200, Tomi Valkeinen wrote:
> Add pixel clock limits to the driver as per TFP410 datasheet: min 25MHz,
> max 165MHz.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/bridge/ti-tfp410.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index 6f6d6d1e60ae..f378a8f79bcb 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -167,10 +167,20 @@ static void tfp410_disable(struct drm_bridge *bridge)
>  	gpiod_set_value_cansleep(dvi->powerdown, 1);
>  }
>  
> +static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
> +					      const struct drm_display_mode *mode)
> +{
> +	if (mode->clock < 25000 || mode->clock > 165000)
> +		return MODE_BAD;

Shouldn't you return MODE_CLOCK_LOW AND MODE_CLOCK_HIGH respectively ?
Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	return MODE_OK;
> +}
> +
>  static const struct drm_bridge_funcs tfp410_bridge_funcs = {
>  	.attach		= tfp410_attach,
>  	.enable		= tfp410_enable,
>  	.disable	= tfp410_disable,
> +	.mode_valid	= tfp410_mode_valid,
>  };
>  
>  static void tfp410_hpd_work_func(struct work_struct *work)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
