Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBFF5FFB84
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 19:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2885310E031;
	Sat, 15 Oct 2022 17:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCC410E031
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 17:31:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21697480;
 Sat, 15 Oct 2022 19:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665855075;
 bh=o+mYus/Iw5szw/esqjPjuy353lC8yPUvWnvUlpyrTHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IZkwjWyRtjFHBpMtknuGpeeyI7WPyk/2OUcc4/EYMkS1pA+eEFixIiHHBZV+gIIZX
 ml0cbgMJpzIU+7X1bTJrfMvWq/+tFC535+HHH53bVTlX+LCxS5OZhUwW0rsWOv/xWd
 tM54ckbM34yoxEGePX+ycL02/OJE1hcd42kzEGzU=
Date: Sat, 15 Oct 2022 20:30:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 5/7] drm/vc4: dpi: Support BGR666 formats
Message-ID: <Y0ruTEuq1flo7/dt@pendragon.ideasonboard.com>
References: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
 <20221013-rpi-dpi-improvements-v1-5-8a7a96949cb0@cerno.tech>
 <Y0rtVpMROELzbApj@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y0rtVpMROELzbApj@pendragon.ideasonboard.com>
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

On Sat, Oct 15, 2022 at 08:26:48PM +0300, Laurent Pinchart wrote:
> Hi Maxime and Joerg,
> 
> Thank you for the patch.
> 
> On Thu, Oct 13, 2022 at 11:56:49AM +0200, Maxime Ripard wrote:
> > From: Joerg Quinten <aBUGSworstnightmare@gmail.com>
> > 
> > The VC4 DPI output can support multiple BGR666 variants, but they were
> > never added to the driver. Let's add the the support for those formats.
> > 
> > Signed-off-by: Joerg Quinten <aBUGSworstnightmare@gmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/gpu/drm/vc4/vc4_dpi.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> > index 7da3dd1db50e..ecbe4cd87036 100644
> > --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> > @@ -170,10 +170,16 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
> >  				dpi_c |= VC4_SET_FIELD(DPI_ORDER_BGR,
> >  						       DPI_ORDER);
> >  				break;
> > +			case MEDIA_BUS_FMT_BGR666_1X24_CPADHI:
> > +				dpi_c |= VC4_SET_FIELD(DPI_ORDER_BGR, DPI_ORDER);
> > +				fallthrough;

Upon closer inspection of the code, I think you also need

-			dpi_c &= ~DPI_FORMAT_MASK;
+			dpi_c &= ~(DPI_ORDER_MASK | DPI_FORMAT_MASK);

a few lines above.

> >  			case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> >  				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_18BIT_666_RGB_2,
> >  						       DPI_FORMAT);
> >  				break;
> > +			case MEDIA_BUS_FMT_BGR666_1X18:
> > +				dpi_c |= VC4_SET_FIELD(DPI_ORDER_BGR, DPI_ORDER);
> > +				fallthrough;
> >  			case MEDIA_BUS_FMT_RGB666_1X18:
> >  				dpi_c |= VC4_SET_FIELD(DPI_FORMAT_18BIT_666_RGB_1,
> >  						       DPI_FORMAT);
> > 

-- 
Regards,

Laurent Pinchart
