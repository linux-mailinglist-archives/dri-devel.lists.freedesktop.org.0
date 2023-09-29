Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8262E7B3C0A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 23:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BE710E13D;
	Fri, 29 Sep 2023 21:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B80210E13D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 21:38:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-116-43-nat.elisa-mobile.fi
 [85.76.116.43])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21DEC844;
 Fri, 29 Sep 2023 23:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1696023386;
 bh=EVzNApoD3AOoyuoMhFWMBQeyLIuJ2jjPmfo+8wSbqvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rui7dFDOE9xIdZ2kM3Ff4A2QvcEvOSPekvBIoA4/xhGwZSnYtTwD9ezO/7CKUovfc
 dqZl2mj8ZLbyVsYcISjVFmBcA0ewO9r2drMjf9ul4rMCQF3zlS3gYr7BxCtjQc9SCR
 0FdNWW04GJoEFNFahnY1qPXq7rtOFbfs3+j815zg=
Date: Sat, 30 Sep 2023 00:38:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] drm/bridge: adv7511: Convert to use maple tree register
 cache
Message-ID: <20230929213817.GB28737@pendragon.ideasonboard.com>
References: <20230929-drm-adv7511-v1-1-b871b28ee594@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230929-drm-adv7511-v1-1-b871b28ee594@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

Thank you for the patch.

On Fri, Sep 29, 2023 at 02:54:19PM +0200, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.

I trust on your this statement.

> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Out of curiosity, is this part of an effort to drop the rbtree cache ?

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 2611afd2c1c1..d518de88b5c3 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -121,7 +121,7 @@ static const struct regmap_config adv7511_regmap_config = {
>  	.val_bits = 8,
>  
>  	.max_register = 0xff,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>  	.reg_defaults_raw = adv7511_register_defaults,
>  	.num_reg_defaults_raw = ARRAY_SIZE(adv7511_register_defaults),
>  
> @@ -1068,7 +1068,7 @@ static const struct regmap_config adv7511_cec_regmap_config = {
>  	.val_bits = 8,
>  
>  	.max_register = 0xff,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>  	.volatile_reg = adv7511_cec_register_volatile,
>  };
>  
> 
> ---
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
> change-id: 20230929-drm-adv7511-2d592921f8a2

-- 
Regards,

Laurent Pinchart
