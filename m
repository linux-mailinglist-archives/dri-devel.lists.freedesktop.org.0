Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0B245B9D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 06:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AA46E429;
	Mon, 17 Aug 2020 04:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FC06E429
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 04:28:25 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E71E92001F;
 Mon, 17 Aug 2020 06:28:22 +0200 (CEST)
Date: Mon, 17 Aug 2020 06:28:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: panel: Fix bus format for OrtusTech COM43H4M85ULC
 panel
Message-ID: <20200817042821.GA1468386@ravnborg.org>
References: <20200812220244.24500-1-laurent.pinchart@ideasonboard.com>
 <20200813191844.GA798515@ravnborg.org>
 <20200817003045.GG7729@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817003045.GG7729@pendragon.ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=kwiKrZd0KNJE94XuyrIA:9
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
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

On Mon, Aug 17, 2020 at 03:30:45AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> On Thu, Aug 13, 2020 at 09:18:44PM +0200, Sam Ravnborg wrote:
> > On Thu, Aug 13, 2020 at 01:02:44AM +0300, Laurent Pinchart wrote:
> > > The OrtusTech COM43H4M85ULC panel is a 18-bit RGB panel, set the bus
> > > format to MEDIA_BUS_FMT_RGB666_1X18.
> > > 
> > > Fixes: 725c9d40f3fe ("drm/panel: Add support for OrtusTech COM43H4M85ULC panel")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index ef8df838fe14..ef04fd75babd 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -3018,7 +3018,7 @@ static const struct panel_desc ortustech_com43h4m85ulc = {
> > >  		.width = 56,
> > >  		.height = 93,
> > >  	},
> > > -	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > > +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > >  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > >  	.connector_type = DRM_MODE_CONNECTOR_DPI,
> > >  };
> > 
> > So basically we say that this panel is bpc=8 but connected so we only
> > utilise 6 bits per color - seems like a waste but may be good enough.
> > There are other panels that is connected in the same way.
> 
> No, this is a 6 bpc panel, I just forgot to fix that :-S
> 
> > Applied.
> 
> Should I send a fix on top of drm-misc, or would you like to do so ?
Please send a fix.

	Sam
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
