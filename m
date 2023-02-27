Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7626A44BB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 15:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA5010E415;
	Mon, 27 Feb 2023 14:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB9710E415
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 14:38:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-78-34-nat.elisa-mobile.fi
 [85.76.78.34])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F41C56A;
 Mon, 27 Feb 2023 15:38:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677508728;
 bh=flL3K74FpmQhbfYWrxtIBKmRyaIm0PL2gw4qy434ZP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RZDkwCgfR/ZjHWQxvkQiEwJAqsxC3NWoKOgQsAILaOfXPOZ8SgnHxmyRulFSvLO1g
 DP8EZ4QST+GAmivQm2aMRlpexQ/E2CsRQvpAQ4F8h9fQqQF+S8Pu3Zd0XGpiBufQRT
 6rschwE3fyKsHdrhaDAFUkl+fmOzGkofwa/WTq2s=
Date: Mon, 27 Feb 2023 16:38:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix a NULL vs IS_ERR() bug
Message-ID: <Y/zAWdgjKQjvdmXr@pendragon.ideasonboard.com>
References: <Y/yAw6sHu82OnOWj@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/yAw6sHu82OnOWj@kili>
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

Thank you for the patch.

On Mon, Feb 27, 2023 at 01:06:59PM +0300, Dan Carpenter wrote:
> The drmm_encoder_alloc() function returns error pointers.  It never
> returns NULL.  Fix the check accordingly.
> 
> Fixes: 7a1adbd23990 ("drm: rcar-du: Use drmm_encoder_alloc() to manage encoder")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index b1787be31e92..7ecec7b04a8d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -109,8 +109,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
>  				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
>  				  NULL);
> -	if (!renc)
> -		return -ENOMEM;
> +	if (IS_ERR(renc))
> +		return PTR_ERR(renc);
>  
>  	renc->output = output;
>  

-- 
Regards,

Laurent Pinchart
