Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 532795FFB5E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 19:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785CF10E151;
	Sat, 15 Oct 2022 17:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650CA10E151
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 17:14:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FCF7480;
 Sat, 15 Oct 2022 19:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665854041;
 bh=mlExtG3PX3BfXsQGa88t7dxFY/1l+czRQhArSgZe9Do=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HZshcaZbPpeYrYKHrCqfYrfyJ0oMng/IGit7wXLru3zGYdIgD4Y9eTtYU14rr0rIt
 C9RRISG4SlPoz87rLi6p96KyGxLd9EO3dR6pgPgCT0eB20oiovZsTzUKv7dsl5bIIY
 quHMKLNAjEMp6uUhyHduCf0LmOHGJdKiClKMTtks=
Date: Sat, 15 Oct 2022 20:13:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 6/7] drm/vc4: dpi: Change the default DPI format to being
 18bpp, not 24.
Message-ID: <Y0rqQu8Ztowj3/Gi@pendragon.ideasonboard.com>
References: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
 <20221013-rpi-dpi-improvements-v1-6-8a7a96949cb0@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221013-rpi-dpi-improvements-v1-6-8a7a96949cb0@cerno.tech>
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
Cc: Chris Morgan <macromorgan@hotmail.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Eric Anholt <eric@anholt.net>, Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime (and Dave),

Thank you for the patch.

On Thu, Oct 13, 2022 at 11:56:50AM +0200, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> DPI hasn't really been used up until now, so the default has
> been meaningless.
> In theory we should be able to pass the desired format for the
> adjacent bridge chip through, but framework seems to be missing
> for that.

Doesn't the bridge infrastructure allow that ? Or maybe this commit
message was written a while ago, before it was possible ?

In any case, it would be nice to use the bus format exposed by the next
bridge in the chain, but that can be done in a subsequent step. The new
default seems reasonable.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> As the main device to use DPI is the VGA666 or Adafruit Kippah,
> both of which use RGB666, change the default to being RGB666 instead
> of RGB888.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index ecbe4cd87036..fdae02760b6d 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -150,8 +150,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
>  	}
>  	drm_connector_list_iter_end(&conn_iter);
>  
> -	/* Default to 24bit if no connector or format found. */
> -	dpi_c |= VC4_SET_FIELD(DPI_FORMAT_24BIT_888_RGB, DPI_FORMAT);
> +	/* Default to 18bit if no connector or format found. */
> +	dpi_c |= VC4_SET_FIELD(DPI_FORMAT_18BIT_666_RGB_1, DPI_FORMAT);
>  
>  	if (connector) {
>  		if (connector->display_info.num_bus_formats) {
> 

-- 
Regards,

Laurent Pinchart
