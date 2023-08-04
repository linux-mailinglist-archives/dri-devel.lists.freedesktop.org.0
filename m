Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D206477028A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 16:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4717E10E70F;
	Fri,  4 Aug 2023 14:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E580D10E714
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 14:06:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FFC24E6;
 Fri,  4 Aug 2023 16:05:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691157939;
 bh=8LNzmHeeB+lW0wBZBacx/ttELqjRDfPORhidCw3qHAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y2TnL8iLvbI2V3wpNN6fAv3zG4Vvq33nlxPOujkiQHK2a+dWKmamTEHR1tagOIkDw
 +h4svtcyQECp2jvEOrufHWd9SDJzIMC9f952zetL2Sj9oisZX6HapqGOjSBxk1FDUa
 LEMR18iOMkSyYeWRxx56WtVk8558hdoN7iBvIfGA=
Date: Fri, 4 Aug 2023 17:06:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 2/2] drm/framebuffer: Fix use of uninitialized variable
Message-ID: <20230804140650.GH12951@pendragon.ideasonboard.com>
References: <20230804-uninit-fixes-v1-0-a60772c04db5@ideasonboard.com>
 <20230804-uninit-fixes-v1-2-a60772c04db5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230804-uninit-fixes-v1-2-a60772c04db5@ideasonboard.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 04, 2023 at 01:57:40PM +0300, Tomi Valkeinen wrote:
> smatch reports:
> 
> drivers/gpu/drm/drm_framebuffer.c:654 drm_mode_getfb2_ioctl() error: uninitialized symbol 'ret'.
> 
> 'ret' is possibly not set when there are no errors, causing the error
> above. I can't say if that ever happens in real-life, but in any case I
> think it is good to initialize 'ret' to 0.

I don't think it can happen in practice, but tools have no way to know
that.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_framebuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index aff3746dedfb..1955eaeba0ab 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -570,7 +570,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
>  	struct drm_mode_fb_cmd2 *r = data;
>  	struct drm_framebuffer *fb;
>  	unsigned int i;
> -	int ret;
> +	int ret = 0;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EINVAL;
> 

-- 
Regards,

Laurent Pinchart
