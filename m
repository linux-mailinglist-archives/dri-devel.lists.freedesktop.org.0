Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699307DE1CB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 14:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D64C10E6F8;
	Wed,  1 Nov 2023 13:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F96510E6F8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 13:57:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45D1D8D;
 Wed,  1 Nov 2023 14:57:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698847046;
 bh=WdEnXxzZzV4vCDA6996OmVTFkq2J1CGwfST93FFdxPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QorMDBHMzluLEKY2CnKc2BPzuWsYlOgbNFg/XJ/C+eWA9uDyt7yWOOB6l9xIUfdVH
 fxCPV75RB7TaXtsTpl+wpUXxmuyDOK6+O+qjqyqdz/lRPWZsoeVmgaqkKjqyzkPzK2
 t52NgJyYWJ8FK/AvueuoJwZQm9Y2OZkd4PfRTRes=
Date: Wed, 1 Nov 2023 15:57:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 04/10] drm/tidss: Move reset to the end of dispc_init()
Message-ID: <20231101135749.GT12764@pendragon.ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-4-45149e0f9415@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231101-tidss-probe-v1-4-45149e0f9415@ideasonboard.com>
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

On Wed, Nov 01, 2023 at 11:17:41AM +0200, Tomi Valkeinen wrote:
> We do a DSS reset in the middle of the dispc_init(). While that happens
> to work now, we should really make sure that e..g the fclk, which is
> acquired only later in the function, is enabled when doing a reset. This
> will be handled in a later patch, but for now, let's move the
> dispc_softreset() call to the end of dispc_init(), which is a sensible
> place for it anyway.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

But do I understand correctly that the device isn't powered up at this
point ? That seems problematic.

I'm also not sure why we need to reset the device at probe time.

> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index ad7999434299..9430625e2d62 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2777,10 +2777,6 @@ int dispc_init(struct tidss_device *tidss)
>  			return r;
>  	}
>  
> -	/* K2G display controller does not support soft reset */
> -	if (feat->subrev != DISPC_K2G)
> -		dispc_softreset(dispc);
> -
>  	for (i = 0; i < dispc->feat->num_vps; i++) {
>  		u32 gamma_size = dispc->feat->vp_feat.color.gamma_size;
>  		u32 *gamma_table;
> @@ -2831,5 +2827,9 @@ int dispc_init(struct tidss_device *tidss)
>  
>  	tidss->dispc = dispc;
>  
> +	/* K2G display controller does not support soft reset */
> +	if (feat->subrev != DISPC_K2G)
> +		dispc_softreset(dispc);
> +
>  	return 0;
>  }
> 

-- 
Regards,

Laurent Pinchart
