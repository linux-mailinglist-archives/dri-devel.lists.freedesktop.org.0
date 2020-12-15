Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D992DB579
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 21:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531BD8955D;
	Tue, 15 Dec 2020 20:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD688955D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 20:55:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8005593;
 Tue, 15 Dec 2020 21:55:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608065751;
 bh=xb5DZF/iWKAUZNc6CW2hz9ucfUBOKmdOEtE5j10xqKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cTs2Z/0N0Tq+OeZkdUlBYRk1YGBZnr0PvspMQvidJUmRuFS7SqYWGvRTSyBJ5BHgQ
 eYhc2EQzeIJQMuMMqQDcnC4yB4hyNoHFBsBPQldMIKn94CKfC145z8heRKwsMmm2zS
 3zvst31S7grYS4ESBaxfNainwljQFlQFYIRUu+kY=
Date: Tue, 15 Dec 2020 22:55:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] drm/bridge: thc63lvd1024: Fix regulator_get_optional()
 misuse
Message-ID: <X9ki0azMrvOZvhJQ@pendragon.ideasonboard.com>
References: <20191108173208.51677-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108173208.51677-1-broonie@kernel.org>
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
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

Thank you for the patch.

On Fri, Nov 08, 2019 at 05:32:08PM +0000, Mark Brown wrote:
> The thc63lvd1024 driver requests a supply using regulator_get_optional()
> but both the name of the supply and the usage pattern suggest that it is
> being used for the main power for the device and is not at all optional
> for the device for function, there is no handling at all for absent
> supplies.  Such regulators should use the vanilla regulator_get()
> interface, it will ensure that even if a supply is not described in the
> system integration one will be provided in software.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and queued in my tree for v5.12.

> ---
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index 3d74129b2995..ffca28ccc2c4 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -200,7 +200,7 @@ static int thc63_probe(struct platform_device *pdev)
>  	thc63->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, thc63);
>  
> -	thc63->vcc = devm_regulator_get_optional(thc63->dev, "vcc");
> +	thc63->vcc = devm_regulator_get(thc63->dev, "vcc");
>  	if (IS_ERR(thc63->vcc)) {
>  		if (PTR_ERR(thc63->vcc) == -EPROBE_DEFER)
>  			return -EPROBE_DEFER;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
