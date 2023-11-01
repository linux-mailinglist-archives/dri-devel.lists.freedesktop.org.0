Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DF27DE24D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 15:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACCE10E6FE;
	Wed,  1 Nov 2023 14:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884FC10E6FE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 14:22:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53F928D;
 Wed,  1 Nov 2023 15:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698848503;
 bh=n2rdYxd5Yv6fD7vS91tun0tk++E4eltMX2YMa/X3La0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fL09WS6WkMcLajJbn36rPPoSJMu8xoIgl4IE5IC9sxhIsLvyFuNvWlybFGpVNEF2j
 9IkPo4XtHNfcaOvtn384yd7CX5objcC4HG2hQxsvwyg/72kD0Ppneof/fkpjxQJjXs
 2ZX6X71Y4CKSsgRGZQTeExgRcv/xRPoWyETHiLas=
Date: Wed, 1 Nov 2023 16:22:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 06/10] drm/tidss: Check for K2G in in dispc_softreset()
Message-ID: <20231101142206.GV12764@pendragon.ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-6-45149e0f9415@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231101-tidss-probe-v1-6-45149e0f9415@ideasonboard.com>
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Nov 01, 2023 at 11:17:43AM +0200, Tomi Valkeinen wrote:
> K2G doesn't have softreset feature. Instead of having every caller of
> dispc_softreset() check for K2G, move the check into dispc_softreset(),
> and make dispc_softreset() return 0 in case of K2G.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index cdbb88289082..f204a0701e9f 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2707,6 +2707,10 @@ static int dispc_softreset(struct dispc_device *dispc)
>  	u32 val;
>  	int ret;
>  
> +	/* K2G display controller does not support soft reset */
> +	if (dispc->feat->subrev == DISPC_K2G)
> +		return 0;
> +
>  	/* Soft reset */
>  	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, 1, 1);
>  	/* Wait for reset to complete */
> @@ -2831,12 +2835,9 @@ int dispc_init(struct tidss_device *tidss)
>  
>  	tidss->dispc = dispc;
>  
> -	/* K2G display controller does not support soft reset */
> -	if (feat->subrev != DISPC_K2G) {
> -		r = dispc_softreset(dispc);
> -		if (r)
> -			return r;
> -	}
> +	r = dispc_softreset(dispc);
> +	if (r)
> +		return r;
>  
>  	return 0;
>  }
> 

-- 
Regards,

Laurent Pinchart
