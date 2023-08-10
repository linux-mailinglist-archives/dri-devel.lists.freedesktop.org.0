Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABDC777582
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 12:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CBE10E16D;
	Thu, 10 Aug 2023 10:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606910E16D;
 Thu, 10 Aug 2023 10:11:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 736742CF;
 Thu, 10 Aug 2023 12:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691662247;
 bh=JLzx34SATwxcqWWL9wKiniqBwX1I2Wbwoo5F/RC7m6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BfVQBT3kj2sf/7XTD879gx41bBPEHP0keGuFsu1pTVjYFhEQdvc8RHUVHO3dGKq3o
 3tSEghKm2dreXCH8S3HVzUdeXWW2ZKwEHvaAxP1/s7d/+cbF/lpT+CASxqfzjYAEXH
 5RTZeEfOoIIO+z+pu1q9f63tqQb0/UQorWkGGOw8=
Date: Thu, 10 Aug 2023 13:12:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] drm/bridge: adv7511: fix Wvoid-pointer-to-enum-cast
 warning
Message-ID: <20230810101203.GB402@pendragon.ideasonboard.com>
References: <20230810095923.123388-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230810095923.123388-1-krzysztof.kozlowski@linaro.org>
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
 lima@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Thank you for the patch.

On Thu, Aug 10, 2023 at 11:59:22AM +0200, Krzysztof Kozlowski wrote:
> 'type' is an enum, thus cast of pointer on 64-bit compile test with W=1
> causes:
> 
>   adv7511_drv.c:1214:19: error: cast to smaller integer type 'enum adv7511_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 2611afd2c1c1..0e284f379602 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1211,7 +1211,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>  	adv7511->status = connector_status_disconnected;
>  
>  	if (dev->of_node)
> -		adv7511->type = (enum adv7511_type)of_device_get_match_data(dev);
> +		adv7511->type = (uintptr_t)of_device_get_match_data(dev);
>  	else
>  		adv7511->type = id->driver_data;
>  

-- 
Regards,

Laurent Pinchart
