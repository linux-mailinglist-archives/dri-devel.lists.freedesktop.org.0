Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C155E16FC06
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 11:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15025898F5;
	Wed, 26 Feb 2020 10:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46967898F5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:24:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16B8843F;
 Wed, 26 Feb 2020 11:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582712678;
 bh=Lm8rEXb3feusd6GdVTy83/P52TZ8Y0opBd2NmJhOjIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HGLQ0n4Pg/B5DYhIIpYGrRDviRYdkooY/NUKhcd9cY39tRGPapLNC0/OGw+AGYpqv
 Vpaz0n5QASQyz04bRuQrfXr46tWb8eJqvqrQ8x53rAxpbFUn+DiyrMXUVjQD6cJJLK
 /vVFJph7sMhd12fy4kCMCuk3haz1wVC/4b7gNRsA=
Date: Wed, 26 Feb 2020 12:24:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/bridge: sii9234: silence warning about regulators
 during deferred probe
Message-ID: <20200226102416.GA4770@pendragon.ideasonboard.com>
References: <CGME20200226101316eucas1p2fd16a7c821632084710167216b78f6c5@eucas1p2.samsung.com>
 <20200226101307.16708-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226101307.16708-1-m.szyprowski@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, linux-samsung-soc@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Wed, Feb 26, 2020 at 11:13:07AM +0100, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about failure in getting
> regulators in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/sii9234.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index f81f81b7051f..b1258f0ed205 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -836,7 +836,8 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>  	ctx->supplies[3].supply = "cvcc12";
>  	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
>  	if (ret) {
> -		dev_err(ctx->dev, "regulator_bulk failed\n");
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(ctx->dev, "regulator_bulk failed\n");
>  		return ret;
>  	}
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
