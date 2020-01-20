Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE61432D6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 21:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890FF88161;
	Mon, 20 Jan 2020 20:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF526EB10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 20:20:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8C24C2002C;
 Mon, 20 Jan 2020 21:20:06 +0100 (CET)
Date: Mon, 20 Jan 2020 21:20:05 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [PATCH 1/3] drm/panel: make LVDS panel driver DPI capable
Message-ID: <20200120202005.GA17555@ravnborg.org>
References: <20200115123401.2264293-1-oleksandr.suvorov@toradex.com>
 <20200115123401.2264293-2-oleksandr.suvorov@toradex.com>
 <20200118130418.GA13417@ravnborg.org>
 <CAGgjyvHVg9OBWqpBd9k1hf561VjFQwh3o9QUFcy1A=_KNnK2Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGgjyvHVg9OBWqpBd9k1hf561VjFQwh3o9QUFcy1A=_KNnK2Gg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=vY_M7HEJ-dsChd7xKHoA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Igor Opanyuk <igor.opanyuk@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oleksandr.

Thanks for the quick reply.

On Mon, Jan 20, 2020 at 10:03:20AM +0000, Oleksandr Suvorov wrote:
> Hi Sam,
> 
> On Sat, Jan 18, 2020 at 3:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > The LVDS panel driver has almost everything which is required to
> > > describe a simple parallel RGB panel (also known as DPI, Display
> > > Pixel Interface).
> > >
> > > ---
> >
> > There are a few high-level things we need to have sorted out.
> >
> > The driver, when this patch is added, assumes that certain properties
> > are now mandatory when using the panel-dpi compatible.
> >   - data-mapping
> >   - width-mm
> >   - height-mm
> >   - panel-timing
> >
> > But this does not match the panel-dpi binding.
> > So we need the panel-dpi binding updated first.
I just sent a patch-set converting this binding to DT schema.
Let's land this and you can make your changes on top of it.
Care to review it?

> >
> >
> > The current driver specify the connector type in drm_panel_init().
> > But a DPI panel is assumed to use a DRM_MODE_CONNECTOR_DPI,
> > and not a DRM_MODE_CONNECTOR_LVDS.
> > So the drm_panel_init() call needs to take into account the type
> > of binding.
> >
> Thanks, I'll fix it in 2nd version.
> >
> > > @@ -257,7 +279,7 @@ static struct platform_driver panel_lvds_driver = {
> > >       .probe          = panel_lvds_probe,
> > >       .remove         = panel_lvds_remove,
> > >       .driver         = {
> > > -             .name   = "panel-lvds",
> > > +             .name   = "panel-generic",
> >
> > I think changing the name of the driver like this is an UAPI change,
> > which is not OK
> 
> I see 2 simple ways there:
> - keep the original platform driver name;
Please keep the original platform driver name.
It is a bit confusing but this is the best option I see.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
