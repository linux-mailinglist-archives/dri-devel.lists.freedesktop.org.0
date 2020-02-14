Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2B715F8D4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 22:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3686E880;
	Fri, 14 Feb 2020 21:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40766E880
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 21:39:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C993D20022;
 Fri, 14 Feb 2020 22:39:04 +0100 (CET)
Date: Fri, 14 Feb 2020 22:39:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 3/3] drm/panel: simple: fix osd070t1718_19ts sync drive
 edge
Message-ID: <20200214213902.GA22233@ravnborg.org>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-4-tomi.valkeinen@ti.com>
 <20191202130717.GI4929@pendragon.ideasonboard.com>
 <a9cf515c-dbdd-e70d-5a89-1211c1049d16@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9cf515c-dbdd-e70d-5a89-1211c1049d16@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8
 a=P1BnusSwAAAA:8 a=pE7bLHUCcVxUAAEgjrMA:9 a=CjuIK1q_8ugA:10
 a=aeg5Gbbo78KNqacMgKqU:22 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi.

On Mon, Feb 10, 2020 at 10:15:33AM +0200, Tomi Valkeinen wrote:
> Hi Thierry,
> 
> On 02/12/2019 15:07, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Nov 14, 2019 at 11:39:50AM +0200, Tomi Valkeinen wrote:
> > > The panel datasheet says that the panel samples at falling edge, but
> > > does not say anything about h/v sync signals. Testing shows that if the
> > > sync signals are driven on falling edge, the picture on the panel will
> > > be slightly shifted right.
> > > 
> > > Setting sync drive edge to the same as data drive edge fixes this issue.
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > 
> > I don't have access to the documentation, but this makes sense, so
> > 
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > ---
> > >   drivers/gpu/drm/panel/panel-simple.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index 5d487686d25c..0784536ae6af 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -2397,7 +2397,8 @@ static const struct panel_desc osddisplays_osd070t1718_19ts = {
> > >   		.height = 91,
> > >   	},
> > >   	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> > > +		DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
> > >   	.connector_type = DRM_MODE_CONNECTOR_DPI,
> > >   };
> 
> Can this be merged?

I have lost the original mail.
Can you re-send or provide a patchwork pointer or similar.
Then I will apply.

PS. Mail had been stuck in my spam quarantine so did not get it until
now.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
