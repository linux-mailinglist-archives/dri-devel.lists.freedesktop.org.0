Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2324F2D64
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 13:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A9D10E93D;
	Tue,  5 Apr 2022 11:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7039D10EA3F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 11:42:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 628625D;
 Tue,  5 Apr 2022 13:42:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649158930;
 bh=BKnXaDB6e19/u6RKIOfoxvvk14h3gu5uX3laBLbr/CA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kBvDNIiMJnDe9oWAYWfxlZMFMg04btQkTfTU64nm8cxXPZTIfCGnwOcJbZSz8yI/y
 WQdiUktB/OJAWekI7PafyjzTQVFZfbCTIELbHNdq29gbWOpmo8NNx4SqLFn5j06y6S
 3uZyYFQjOSzqlOocRuTrSzRdPREc3TqNbFraX17Y=
Date: Tue, 5 Apr 2022 14:42:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status
 register after enabling the bridge
Message-ID: <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
References: <20220213022648.495895-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220213022648.495895-1-marex@denx.de>
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Sun, Feb 13, 2022 at 03:26:48AM +0100, Marek Vasut wrote:
> In rare cases, the bridge may not start up correctly, which usually
> leads to no display output. In case this happens, warn about it in
> the kernel log.

Do you know what this is caused by ? It's a bit annoying to add a 10+ms
delay at start time just to be notified of rare cases.

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 19daaddd29a41..1d7c154ea1d79 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -488,6 +488,11 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>  	/* Clear all errors that got asserted during initialization. */
>  	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>  	regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
> +
> +	usleep_range(10000, 12000);
> +	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> +	if (pval)
> +		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
>  }
>  
>  static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,

-- 
Regards,

Laurent Pinchart
