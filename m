Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96C2F2726
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 05:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCAF89F27;
	Tue, 12 Jan 2021 04:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B185789F27
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 04:38:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBFB63E;
 Tue, 12 Jan 2021 05:37:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610426279;
 bh=JXMwIpyboCcKzCJXsNtKWX/esNzMw9e7pfIvcu3n2vE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rEkgccxGm3jhwLQrWHkwt00pU9LMdLL4/NwfyadZHiYkyKbsC0/gpEw40yCrLzOWX
 aUV1UsghW7ijFQThJLPscXA7hCcdTgB5x6wtcUvMhEv8EXcb7jyyGuMa3uQWSlGL5+
 agrb6waRf06ib+OX9eLqkj8sn0wYAYmVtybJY1Ys=
Date: Tue, 12 Jan 2021 06:37:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Avoid potential multiplication
 overflow on 32-bit
Message-ID: <X/0nmQ/XBpj6PJAh@pendragon.ideasonboard.com>
References: <20210111125702.360745-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111125702.360745-1-geert+renesas@glider.be>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Mon, Jan 11, 2021 at 01:57:02PM +0100, Geert Uytterhoeven wrote:
> As nwl_dsi.lanes is u32, and NSEC_PER_SEC is 1000000000L, the second
> multiplication in
> 
>     dsi->lanes * 8 * NSEC_PER_SEC
> 
> will overflow on a 32-bit platform.  Fix this by making the constant
> unsigned long long, forcing 64-bit arithmetic.
> 
> While iMX8 is arm64, this driver is currently used on 64-bit platforms
> only, where long is 64-bit, so this cannot happen.  But the issue may
> start to happen when the driver is reused for a 32-bit SoC, or when code
> is copied for a new driver.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 66b67402f1acd57d..a8da3081efdcc84e 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -195,7 +195,7 @@ static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
>  	u32 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>  
>  	return DIV64_U64_ROUND_UP(ps * dsi->mode.clock * bpp,
> -				  dsi->lanes * 8 * NSEC_PER_SEC);
> +				  dsi->lanes * 8ULL * NSEC_PER_SEC);

I wonder if we could get rid of a whole class of bugs by turning
NSEC_PER_SEC into a ULL, but I suppose there are valid cases where a
32-bit integer is enough.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

How did you come across this by the way ?

>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
