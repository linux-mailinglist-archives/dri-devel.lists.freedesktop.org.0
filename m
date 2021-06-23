Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A063B162F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92836E885;
	Wed, 23 Jun 2021 08:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F0B6E507
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 08:48:04 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5470E9B1;
 Wed, 23 Jun 2021 10:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624438083;
 bh=3ujV73LdLnsx9p7SHxJnBMRq2/9SyhANtzEe43qLPfg=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=dvLNMm4EYAm/OuVc90+e1f//g5qL0rR1wwo6c1zStmX1aRRELzz4H4TzzMcYyGfxO
 NYW/ubKU4cdnBV51UanycjzJbDvgPguyFl+2jBMNPP14AokAyTj+mqmdNatEHLKhLw
 ppP60T9MS4nG0Y9P4j55Jkt1HjHFw7LzjMU4cwDI=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: lvds: use dev_err_probe()
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20210623030646.7720-1-laurent.pinchart+renesas@ideasonboard.com>
Message-ID: <9a71feae-b4e5-f512-c5ed-b1155914940f@ideasonboard.com>
Date: Wed, 23 Jun 2021 09:48:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623030646.7720-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 23/06/2021 04:06, Laurent Pinchart wrote:
> Simplify error handling by using the dev_err_probe() function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 5909173b26eb..165be31c4c45 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -839,9 +839,8 @@ static struct clk *rcar_lvds_get_clock(struct rcar_lvds *lvds, const char *name,
>  	if (PTR_ERR(clk) == -ENOENT && optional)
>  		return NULL;
>  
> -	if (PTR_ERR(clk) != -EPROBE_DEFER)
> -		dev_err(lvds->dev, "failed to get %s clock\n",
> -			name ? name : "module");
> +	dev_err_probe(lvds->dev, PTR_ERR(clk), "failed to get %s clock\n",
> +		      name ? name : "module");

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>  
>  	return clk;
>  }
> 
