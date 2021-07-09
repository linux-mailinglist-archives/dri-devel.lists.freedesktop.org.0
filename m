Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31A63C29B5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB246EA75;
	Fri,  9 Jul 2021 19:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815A36EA75
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:30:06 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 0c531187-e0ec-11eb-9082-0050568c148b;
 Fri, 09 Jul 2021 19:29:58 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id A05C6194B06;
 Fri,  9 Jul 2021 21:30:12 +0200 (CEST)
Date: Fri, 9 Jul 2021 21:30:01 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Yunus Bas <Y.Bas@phytec.de>
Subject: Re: [PATCH v3 2/2] drm/panel: simple: Add support for EDT
 ETM0350G0DH6 panel
Message-ID: <YOijuQoj0wV/MhWJ@ravnborg.org>
References: <20210706075908.907659-1-y.bas@phytec.de>
 <20210706075908.907659-2-y.bas@phytec.de>
 <YOiReNdogi3POjUS@ravnborg.org>
 <0f25d847360c9f9925fea216c2d15200acb5ff42.camel@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f25d847360c9f9925fea216c2d15200acb5ff42.camel@phytec.de>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunus,

On Fri, Jul 09, 2021 at 07:02:52PM +0000, Yunus Bas wrote:
> Hi Sam,
> 
> Am Freitag, dem 09.07.2021 um 20:12 +0200 schrieb Sam Ravnborg:
> > Hi Yunus,
> > 
> > On Tue, Jul 06, 2021 at 09:59:08AM +0200, Yunus Bas wrote:
> > > From: Stefan Riedmueller <s.riedmueller@phytec.de>
> > > 
> > > This patch adds support for the EDT ETM0350G0DH6 3.5" (320x240) lcd
> > > panel to DRM simple panel driver.
> > > 
> > > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> > > Signed-off-by: Yunus Bas <y.bas@phytec.de>
> > > ---
> > > Changes in v3:
> > > - No changes in general, added additional maintainers and also
> > > sending
> > > to general kernel mailing list
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 29
> > > ++++++++++++++++++++++++++++
> > >  1 file changed, 29 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > > b/drivers/gpu/drm/panel/panel-simple.c
> > > index 07433bff6c2b..8aba473a7592 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -1929,6 +1929,32 @@ static const struct panel_desc edt_et035012dm6
> > > = {
> > >         .bus_flags = DRM_BUS_FLAG_DE_LOW |
> > > DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
> > >  };
> > >  
> > > +static const struct drm_display_mode edt_etm0350g0dh6_mode = {
> > > +       .clock = 6520,
> > > +       .hdisplay = 320,
> > > +       .hsync_start = 320 + 20,
> > > +       .hsync_end = 320 + 20 + 68,
> > > +       .htotal = 320 + 20 + 68,
> > > +       .vdisplay = 240,
> > > +       .vsync_start = 240 + 4,
> > > +       .vsync_end = 240 + 4 + 18,
> > > +       .vtotal = 240 + 4 + 18,
> > > +       .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> > > +};
> > > +
> > > +static const struct panel_desc edt_etm0350g0dh6 = {
> > > +       .modes = &edt_etm0350g0dh6_mode,
> > > +       .num_modes = 1,
> > > +       .bpc = 6,
> > > +       .size = {
> > > +               .width = 70,
> > > +               .height = 53,
> > > +       },
> > > +       .bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > > +       .bus_flags = DRM_BUS_FLAG_DE_HIGH |
> > > DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> > > +       .connector_type = DRM_MODE_CONNECTOR_DPI,
> > > +};
> > > +
> > >  static const struct drm_display_mode edt_etm043080dh6gp_mode = {
> > >         .clock = 10870,
> > >         .hdisplay = 480,
> > > @@ -4355,6 +4381,9 @@ static const struct of_device_id
> > > platform_of_match[] = {
> > >         }, {
> > >                 .compatible = "edt,et035012dm6",
> > >                 .data = &edt_et035012dm6,
> > > +       }, {
> > > +               .compatible = "edt,etm0350g0dh6",
> > > +               .data = &edt_etm0350g0dh6,
> > 
> > The compatible "edt,etm0350g0dh6" is not documented.
> > You likely need to add it to panel-simple.yaml - and likewise for the
> > first patch.
> > 
> > dt people like binding patches in separate patches so add them both in
> > one dedicated patch.
> 
> I've already sent devicetree patches. Here is the link:
> https://lore.kernel.org/linux-devicetree/20210331181317.464926-1-y.bas@phytec.de/
> 
> It was just pending and waiting for these patches. Shall I send again?
I have likely deleted the patches already, so please resend.
Been mostly offline for a period and then one week wihtout access to my
linux box, and have to delete a lot to avoid getting too much behind.

	Sam
