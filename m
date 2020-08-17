Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A729245A51
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 02:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC07089F73;
	Mon, 17 Aug 2020 00:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D6F89F73
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 00:31:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50CCCF9;
 Mon, 17 Aug 2020 02:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597624261;
 bh=R+3w/KuUwQkKLhnRLG+IHO494WA1V/CIp4DtrNP5f7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HWh5CrDLWnx4NBbVF/ll9uvf7jPSsUIYV/cuRbcyopZeKXLjIiqOFxYCeF5IvOijr
 A44VPxhq4IYx424LFGK9XJjtJNbvwgZghsgekuVt9k4SnxEfrOCh4XfwIX6a96QfIH
 MZle+VxEf/gOazz25/hN6hx6xzTUKCicEuTpY93E=
Date: Mon, 17 Aug 2020 03:30:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: panel: Fix bus format for OrtusTech COM43H4M85ULC
 panel
Message-ID: <20200817003045.GG7729@pendragon.ideasonboard.com>
References: <20200812220244.24500-1-laurent.pinchart@ideasonboard.com>
 <20200813191844.GA798515@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813191844.GA798515@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Thu, Aug 13, 2020 at 09:18:44PM +0200, Sam Ravnborg wrote:
> On Thu, Aug 13, 2020 at 01:02:44AM +0300, Laurent Pinchart wrote:
> > The OrtusTech COM43H4M85ULC panel is a 18-bit RGB panel, set the bus
> > format to MEDIA_BUS_FMT_RGB666_1X18.
> > 
> > Fixes: 725c9d40f3fe ("drm/panel: Add support for OrtusTech COM43H4M85ULC panel")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index ef8df838fe14..ef04fd75babd 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -3018,7 +3018,7 @@ static const struct panel_desc ortustech_com43h4m85ulc = {
> >  		.width = 56,
> >  		.height = 93,
> >  	},
> > -	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> >  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	.connector_type = DRM_MODE_CONNECTOR_DPI,
> >  };
> 
> So basically we say that this panel is bpc=8 but connected so we only
> utilise 6 bits per color - seems like a waste but may be good enough.
> There are other panels that is connected in the same way.

No, this is a 6 bpc panel, I just forgot to fix that :-S

> Applied.

Should I send a fix on top of drm-misc, or would you like to do so ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
