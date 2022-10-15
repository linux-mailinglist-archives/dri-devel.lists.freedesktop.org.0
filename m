Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF37B5FFB62
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 19:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE8910E140;
	Sat, 15 Oct 2022 17:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD92510E140
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 17:19:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50097480;
 Sat, 15 Oct 2022 19:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665854367;
 bh=BVOOMbpo1cWjq0urB9svsEQu97CcZuMCenTe5Ij8sA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DyiCDzW028z9H41qVM3cfYeTvLivo1EdVFOGacX1QeUZUAZ/6X5By32pWpMVk5YGi
 QiLIbgPxKT5l3CEmnVsgoCRWDpnDaOyWTj7ctXW4eye5thMsksVnel+CgbqbSr1aPk
 wdCobjIJeM3q2OlIqwKpoVChfo845s/fRZOoks+I=
Date: Sat, 15 Oct 2022 20:19:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 7/7] drm/vc4: dpi: Fix format mapping for RGB565
Message-ID: <Y0rrh4cvqHFgcz9M@pendragon.ideasonboard.com>
References: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
 <20221013-rpi-dpi-improvements-v1-7-8a7a96949cb0@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221013-rpi-dpi-improvements-v1-7-8a7a96949cb0@cerno.tech>
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

Hi Maxime and Dave,

Thank you for the patch.

On Thu, Oct 13, 2022 at 11:56:51AM +0200, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The mapping is incorrect for RGB565_1X16 as it should be
> DPI_FORMAT_18BIT_666_RGB_1 instead of DPI_FORMAT_18BIT_666_RGB_3.

The driver includes the following macro definitions and comments:

/* Outputs 00000000rrrrrggggggbbbbb */
# define DPI_FORMAT_16BIT_565_RGB_1     1
/* Outputs 000rrrrr00gggggg000bbbbb */
# define DPI_FORMAT_16BIT_565_RGB_2     2
/* Outputs 00rrrrr000gggggg00bbbbb0 */
# define DPI_FORMAT_16BIT_565_RGB_3     3

MEDIA_BUS_FMT_RGB565_1X16 is defined as described in
https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/subdev-formats.html#id3:

Bit  | 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
Data | r4 r3 r2 r1 r0 g5 g4 g3 g2 g1 g0 b4 b3 b2 b1 b0 

This seems to match DPI_FORMAT_16BIT_565_RGB_1 indeed.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Fixes: 08302c35b59d ("drm/vc4: Add DPI driver")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index fdae02760b6d..a7bebfa5d5b0 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -185,7 +185,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
>  						       DPI_FORMAT);
>  				break;
>  			case MEDIA_BUS_FMT_RGB565_1X16:
> -				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
> +				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_1,
>  						       DPI_FORMAT);
>  				break;
>  			case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
> 

-- 
Regards,

Laurent Pinchart
