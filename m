Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6216D762D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D686E10E865;
	Wed,  5 Apr 2023 08:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BB910E860
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 08:03:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp
 [118.241.147.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEBFD128D;
 Wed,  5 Apr 2023 10:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680681814;
 bh=OhniUp66frtdoSzLUqwO7AJFuxYHi4PQenCuZaW+Ih0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YdUzRnB3za40iJl/nraN18Jmocd6my/WVe+PWYWnFUpHQjmGDa9368yC6zeJ6XOl6
 1UHnhJtCTrWMm5VgvwGeCI/+AK39T3N83kKu3cgIK8zbKP2TBZPC4lmqBvW7pejpek
 6uNaXCkOe1YNEn0zTjM6qIMA03zfY40aBamc4V7g=
Date: Wed, 5 Apr 2023 11:03:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi83: use dev_err_probe if host
 attach failed
Message-ID: <20230405080341.GA9915@pendragon.ideasonboard.com>
References: <20230405075223.579461-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230405075223.579461-1-alexander.stein@ew.tq-group.com>
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
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

Thank you for the patch.

On Wed, Apr 05, 2023 at 09:52:23AM +0200, Alexander Stein wrote:
> There might be cases where the host attach is deferred, use dev_err_probe
> to add more detailed information to /sys/kernel/debug/devices_deferred.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 91ecfbe45bf9..988e537ab884 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -698,8 +698,10 @@ static int sn65dsi83_probe(struct i2c_client *client)
>  	drm_bridge_add(&ctx->bridge);
>  
>  	ret = sn65dsi83_host_attach(ctx);
> -	if (ret)
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to attach DSI host\n");
>  		goto err_remove_bridge;
> +	}
>  
>  	return 0;
>  

-- 
Regards,

Laurent Pinchart
