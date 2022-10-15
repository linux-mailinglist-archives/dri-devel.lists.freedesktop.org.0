Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE675FFB77
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 19:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874AD10E1E6;
	Sat, 15 Oct 2022 17:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4A010E042
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 17:29:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EFDA480;
 Sat, 15 Oct 2022 19:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665854983;
 bh=Cpxftv70YRjRtiWqBhl77lTxBNOYifeMbq6wRStaWx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qxU89CU4XAg/DORwBL5LFLqBISS+SRsDZ0m5mesuWjGziyFqH+akGoczHGc3b8eic
 8DTbi6mmxkxb+oiIA672IhpK4fcykeovz10g8ZCJeQEj5Ra9ozQHLLv3lBWXKd0Goi
 hAp7Pk/49GyMhcywoN74MoNjpw/nwjrPqXdPHVE0=
Date: Sat, 15 Oct 2022 20:29:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 4/7] drm/vc4: dpi: Support RGB565 format
Message-ID: <Y0rt8FIkRniuv0l4@pendragon.ideasonboard.com>
References: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
 <20221013-rpi-dpi-improvements-v1-4-8a7a96949cb0@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221013-rpi-dpi-improvements-v1-4-8a7a96949cb0@cerno.tech>
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

Hi Maxime and Chris,

Thank you for the patch.

On Thu, Oct 13, 2022 at 11:56:48AM +0200, Maxime Ripard wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The RGB565 format with padding over 24 bits
> (MEDIA_BUS_FMT_RGB565_1X24_CPADHI) is supported by the vc4 DPI
> controller as "mode 3".  This is what the Geekworm MZP280 DPI display

The code below uses DPI_FORMAT_16BIT_565_RGB_2. Is that mode 3, or
should the commit message refer to mode 2 ?

With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> uses, so let's add support for it in the DPI controller driver.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index 1f8f44b7b5a5..7da3dd1db50e 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -182,6 +182,10 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
>  				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
>  						       DPI_FORMAT);
>  				break;
> +			case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
> +				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_2,
> +						       DPI_FORMAT);
> +				break;
>  			default:
>  				DRM_ERROR("Unknown media bus format %d\n",
>  					  bus_format);
> 

-- 
Regards,

Laurent Pinchart
