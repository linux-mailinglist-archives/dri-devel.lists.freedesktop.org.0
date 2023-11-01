Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AA27DE1BF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 14:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C6110E6F1;
	Wed,  1 Nov 2023 13:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525D110E6F1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 13:47:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDFAB8D;
 Wed,  1 Nov 2023 14:47:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698846452;
 bh=FPN8Dc91C03T+nlDMgTX3rWA1Ek2ie9ZO4kTgNKhUfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qHwo8jD4u/RRMajIOxn9tjjvAfC3zGRbcA/Jx/1Pir6wV6kdK9VRGtac26bQPQzfQ
 Jfvo99wSnrOMix8WqcBhSA8hplwx7+ByCDh6ofjVmTHi4ApeedRBVP7wXFXu/xZxOY
 qzFoIdIc8flKPOy7enbxCq7tq7PHc3wlb+PvARv4=
Date: Wed, 1 Nov 2023 15:47:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 01/10] drm/tidss: Use pm_runtime_resume_and_get()
Message-ID: <20231101134755.GQ12764@pendragon.ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-1-45149e0f9415@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231101-tidss-probe-v1-1-45149e0f9415@ideasonboard.com>
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

On Wed, Nov 01, 2023 at 11:17:38AM +0200, Tomi Valkeinen wrote:
> Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync(), which
> will handle error situations better. Also fix the return, as there
> should be no reason for the current complex return.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

But I think we would be better off dropping the two small wrappers.

> ---
>  drivers/gpu/drm/tidss/tidss_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 4d063eb9cd0b..f403db11b846 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -32,9 +32,9 @@ int tidss_runtime_get(struct tidss_device *tidss)
>  
>  	dev_dbg(tidss->dev, "%s\n", __func__);
>  
> -	r = pm_runtime_get_sync(tidss->dev);
> +	r = pm_runtime_resume_and_get(tidss->dev);
>  	WARN_ON(r < 0);
> -	return r < 0 ? r : 0;
> +	return r;
>  }
>  
>  void tidss_runtime_put(struct tidss_device *tidss)
> 

-- 
Regards,

Laurent Pinchart
