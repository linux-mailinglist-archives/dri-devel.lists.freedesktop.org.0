Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5401A362B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 16:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD3D883C5;
	Thu,  9 Apr 2020 14:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A90D6E226
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 14:46:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7A1A820029;
 Thu,  9 Apr 2020 16:46:14 +0200 (CEST)
Date: Thu, 9 Apr 2020 16:46:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/panel: update backlight handling for
 samsung-s6e63j0x03
Message-ID: <20200409144613.GA5396@ravnborg.org>
References: <20200409115239.5149-1-sam@ravnborg.org>
 <20200409115239.5149-3-sam@ravnborg.org>
 <CACvgo50wKm15F8z6xmTcXZHZt0NoXqpeuitmLFoenueJuY9nNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50wKm15F8z6xmTcXZHZt0NoXqpeuitmLFoenueJuY9nNA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=hD80L64hAAAA:8 a=pGLkceISAAAA:8 a=BIUAI-DsY62N6ERaLFUA:9
 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Joonas =?iso-8859-1?Q?Kylm=E4l=E4?= <joonas.kylmala@iki.fi>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Hyungwon Hwang <human.hwang@samsung.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.

Thanks for your feedback!

On Thu, Apr 09, 2020 at 03:13:28PM +0100, Emil Velikov wrote:
> On Thu, 9 Apr 2020 at 12:53, Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > The samsung-s6e63j0x03 had a local way to handle backlight.
> >
> > Update the driver to use a devm_ based register function
> > and utilize drm_panel backlight support. The changes results
> > in a simpler driver with the same functionality.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Joonas Kylm=E4l=E4 <joonas.kylmala@iki.fi>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Cc: Hyungwon Hwang <human.hwang@samsung.com>
> > Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > ---
> >  .../gpu/drm/panel/panel-samsung-s6e63j0x03.c  | 55 ++++++++++---------
> >  1 file changed, 29 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers=
/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > index a3570e0a90a8..2c035f87e3f0 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > @@ -36,7 +36,6 @@
> >  struct s6e63j0x03 {
> >         struct device *dev;
> >         struct drm_panel panel;
> > -       struct backlight_device *bl_dev;
> >
> >         struct regulator_bulk_data supplies[2];
> >         struct gpio_desc *reset_gpio;
> > @@ -184,7 +183,7 @@ static unsigned int s6e63j0x03_get_brightness_index=
(unsigned int brightness)
> >  static int s6e63j0x03_update_gamma(struct s6e63j0x03 *ctx,
> >                                         unsigned int brightness)
> >  {
> > -       struct backlight_device *bl_dev =3D ctx->bl_dev;
> > +       struct backlight_device *bl_dev =3D ctx->panel.backlight;
> >         unsigned int index =3D s6e63j0x03_get_brightness_index(brightne=
ss);
> >         int ret;
> >
> > @@ -217,6 +216,30 @@ static const struct backlight_ops s6e63j0x03_bl_op=
s =3D {
> >         .update_status =3D s6e63j0x03_set_brightness,
> >  };
> >
> > +static int s6e63j0x03_backlight_register(struct s6e63j0x03 *ctx)
> > +{
> > +       struct backlight_properties props =3D {
> Pretty sure we can (should really) make the props const.
Thanks, will fix either in v2 or when I apply.

> =

> Quick grep through drm, shows that there're other offenders, so might
> as well do that in separate series.
> Seems like other panels could follow suite, with later series of course.
> =

> Back on topic, it's not immediately obvious why the FB_BLANK_*
> handling is safe to remove. Please add small mention in the commit log
> mentioning why.

Maybe because it is not so?
Lets take a closer look.
backlight_enable() and backlight_disable() are called from
drm_panel - because drm_panel->backlight is assigned.


drm_panel_prepare:
OLD:	ctx->bl_dev->props.power =3D FB_BLANK_NORMAL;
NEW:

drm_panel_enable:
OLD:	ctx->bl_dev->props.power =3D FB_BLANK_UNBLANK;
NEW:	backlight_enable() =3D> =

		bd->props.power =3D FB_BLANK_UNBLANK;
		bd->props.fb_blank =3D FB_BLANK_UNBLANK;
	        bd->props.state &=3D ~BL_CORE_FBBLANK;

drm_panel_disable:
OLD:	ctx->bl_dev->props.power =3D FB_BLANK_NORMAL;
NEW:	backlight_disable() =3D>
		bd->props.power =3D FB_BLANK_POWERDOWN;
	        bd->props.fb_blank =3D FB_BLANK_POWERDOWN;
        	bd->props.state |=3D BL_CORE_FBBLANK;


drm_panel_unprepare:
OLD:	ctx->bl_dev->props.power =3D FB_BLANK_POWERDOWN;
NEW:

So old and new code are not exactly the same.

But with my (limited) backlight understanding this should
work as expected - and it works for many other drivers.
So if this does not work, then we should look at the backlight
handling and not do workarounds in the driver.

I will summarize the above in the individual changelogs.

	Sam


> =

> -Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
