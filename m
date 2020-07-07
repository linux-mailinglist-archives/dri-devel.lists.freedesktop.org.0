Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95996217943
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCBE8951E;
	Tue,  7 Jul 2020 20:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5472C89003
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 20:23:08 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DCD23804F9;
 Tue,  7 Jul 2020 22:23:04 +0200 (CEST)
Date: Tue, 7 Jul 2020 22:23:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 17/20] backlight: use backligt_get_brightness()
Message-ID: <20200707202303.GA23150@ravnborg.org>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-18-sam@ravnborg.org>
 <20200707054820.GF3278063@phenom.ffwll.local>
 <20200707195928.GA18394@ravnborg.org>
 <CAKMK7uGAgYNZKRx6h0h1dL=Q8CUbxBkomAb2V=vMenx6VnHzzw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGAgYNZKRx6h0h1dL=Q8CUbxBkomAb2V=vMenx6VnHzzw@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=25-AhOLfAAAA:8 a=e5mUnYsNAAAA:8
 a=1kZSSmVXUWEAlb0RvMgA:9 a=VBPQRXalO7nChyQ-:21 a=-2dtOKPBNXQn0f0Q:21
 a=CjuIK1q_8ugA:10 a=dnuY3_Gu-P7Vi9ynLKQe:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-pwm <linux-pwm@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Andy Gross <agross@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel

> >
> > When I stop doing backlight stuff I will compose a proper
> > todo entry. Right now I hope to get first batch included in upstream.
> 
> Sounds all good to me.
> 
> > I hope this set can hit upstream.
> > Next it to convert backlight stuff in gpu/drm/ - let me see how that
> > all turns out. One idea is to support embedding struct backlight_device,
> > but I am not sure if this really will fly.
> 
> Embedding means you tie the lifetime of the backlight device to the
> lifetime of whatever structure it's embedded in. This might be a
> complete pain, but it might also work out since backlight
> register/unregistering is fairly simple. But I'd be vary, maybe before
> we do that we'll need stuff like device_link between backlight and
> drm_device (to make sure the drm_device never outlives the backlight
> at a device level), and maybe a few other tricks.
> 
> Does sound like a lot of head-scratcher fun though to work through all this :-)
If I see there are anything other than trivial lifetime issues
to consider I will not go down this route.
Thanks for the warning so I can keep an open eye on it.

	Sam

> 
> Cheers, Daniel
> 
> >
> >         Sam
> >
> > > -Daniel
> > >
> > > > ---
> > > >  drivers/video/backlight/88pm860x_bl.c | 13 +------------
> > > >  drivers/video/backlight/adp5520_bl.c  | 10 +---------
> > > >  drivers/video/backlight/adp8860_bl.c  | 10 +---------
> > > >  drivers/video/backlight/adp8870_bl.c  | 10 +---------
> > > >  drivers/video/backlight/bd6107.c      |  7 +------
> > > >  drivers/video/backlight/corgi_lcd.c   |  8 +-------
> > > >  drivers/video/backlight/da903x_bl.c   | 13 +------------
> > > >  drivers/video/backlight/ep93xx_bl.c   |  8 +-------
> > > >  drivers/video/backlight/hp680_bl.c    |  6 +-----
> > > >  drivers/video/backlight/kb3886_bl.c   |  6 +-----
> > > >  drivers/video/backlight/led_bl.c      |  7 +------
> > > >  drivers/video/backlight/lm3533_bl.c   |  8 +-------
> > > >  drivers/video/backlight/locomolcd.c   |  6 +-----
> > > >  drivers/video/backlight/lv5207lp.c    |  7 +------
> > > >  drivers/video/backlight/max8925_bl.c  | 13 +------------
> > > >  drivers/video/backlight/pwm_bl.c      |  7 +------
> > > >  drivers/video/backlight/qcom-wled.c   |  7 +------
> > > >  drivers/video/backlight/tps65217_bl.c | 10 +---------
> > > >  drivers/video/backlight/wm831x_bl.c   | 13 +------------
> > > >  19 files changed, 19 insertions(+), 150 deletions(-)
> > > >
> > > > diff --git a/drivers/video/backlight/88pm860x_bl.c b/drivers/video/backlight/88pm860x_bl.c
> > > > index 20d96a5ac384..25e409bbb1a2 100644
> > > > --- a/drivers/video/backlight/88pm860x_bl.c
> > > > +++ b/drivers/video/backlight/88pm860x_bl.c
> > > > @@ -121,18 +121,7 @@ static int pm860x_backlight_set(struct backlight_device *bl, int brightness)
> > > >
> > > >  static int pm860x_backlight_update_status(struct backlight_device *bl)
> > > >  {
> > > > -   int brightness = bl->props.brightness;
> > > > -
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.state & BL_CORE_SUSPENDED)
> > > > -           brightness = 0;
> > > > -
> > > > -   return pm860x_backlight_set(bl, brightness);
> > > > +   return pm860x_backlight_set(bl, backlight_get_brightness(bl));
> > > >  }
> > > >
> > > >  static int pm860x_backlight_get_brightness(struct backlight_device *bl)
> > > > diff --git a/drivers/video/backlight/adp5520_bl.c b/drivers/video/backlight/adp5520_bl.c
> > > > index 0f63f76723a5..686988c3df3a 100644
> > > > --- a/drivers/video/backlight/adp5520_bl.c
> > > > +++ b/drivers/video/backlight/adp5520_bl.c
> > > > @@ -65,15 +65,7 @@ static int adp5520_bl_set(struct backlight_device *bl, int brightness)
> > > >
> > > >  static int adp5520_bl_update_status(struct backlight_device *bl)
> > > >  {
> > > > -   int brightness = bl->props.brightness;
> > > > -
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   return adp5520_bl_set(bl, brightness);
> > > > +   return adp5520_bl_set(bl, backlight_get_brightness(bl));
> > > >  }
> > > >
> > > >  static int adp5520_bl_get_brightness(struct backlight_device *bl)
> > > > diff --git a/drivers/video/backlight/adp8860_bl.c b/drivers/video/backlight/adp8860_bl.c
> > > > index 19968104fc47..ddc7f5f0401f 100644
> > > > --- a/drivers/video/backlight/adp8860_bl.c
> > > > +++ b/drivers/video/backlight/adp8860_bl.c
> > > > @@ -361,15 +361,7 @@ static int adp8860_bl_set(struct backlight_device *bl, int brightness)
> > > >
> > > >  static int adp8860_bl_update_status(struct backlight_device *bl)
> > > >  {
> > > > -   int brightness = bl->props.brightness;
> > > > -
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   return adp8860_bl_set(bl, brightness);
> > > > +   return adp8860_bl_set(bl, backlight_get_brightness(bl));
> > > >  }
> > > >
> > > >  static int adp8860_bl_get_brightness(struct backlight_device *bl)
> > > > diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backlight/adp8870_bl.c
> > > > index 4c0032010cfe..8b5213a39527 100644
> > > > --- a/drivers/video/backlight/adp8870_bl.c
> > > > +++ b/drivers/video/backlight/adp8870_bl.c
> > > > @@ -399,15 +399,7 @@ static int adp8870_bl_set(struct backlight_device *bl, int brightness)
> > > >
> > > >  static int adp8870_bl_update_status(struct backlight_device *bl)
> > > >  {
> > > > -   int brightness = bl->props.brightness;
> > > > -
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   return adp8870_bl_set(bl, brightness);
> > > > +   return adp8870_bl_set(bl, backlight_get_brightness(bl));
> > > >  }
> > > >
> > > >  static int adp8870_bl_get_brightness(struct backlight_device *bl)
> > > > diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
> > > > index d5d5fb457e78..515184fbe33a 100644
> > > > --- a/drivers/video/backlight/bd6107.c
> > > > +++ b/drivers/video/backlight/bd6107.c
> > > > @@ -82,12 +82,7 @@ static int bd6107_write(struct bd6107 *bd, u8 reg, u8 data)
> > > >  static int bd6107_backlight_update_status(struct backlight_device *backlight)
> > > >  {
> > > >     struct bd6107 *bd = bl_get_data(backlight);
> > > > -   int brightness = backlight->props.brightness;
> > > > -
> > > > -   if (backlight->props.power != FB_BLANK_UNBLANK ||
> > > > -       backlight->props.fb_blank != FB_BLANK_UNBLANK ||
> > > > -       backlight->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> > > > -           brightness = 0;
> > > > +   int brightness = backlight_get_brightness(backlight);
> > > >
> > > >     if (brightness) {
> > > >             bd6107_write(bd, BD6107_PORTSEL, BD6107_PORTSEL_LEDM(2) |
> > > > diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
> > > > index 25ef0cbd7583..33f5d80495e6 100644
> > > > --- a/drivers/video/backlight/corgi_lcd.c
> > > > +++ b/drivers/video/backlight/corgi_lcd.c
> > > > @@ -420,13 +420,7 @@ static int corgi_bl_set_intensity(struct corgi_lcd *lcd, int intensity)
> > > >  static int corgi_bl_update_status(struct backlight_device *bd)
> > > >  {
> > > >     struct corgi_lcd *lcd = bl_get_data(bd);
> > > > -   int intensity = bd->props.brightness;
> > > > -
> > > > -   if (bd->props.power != FB_BLANK_UNBLANK)
> > > > -           intensity = 0;
> > > > -
> > > > -   if (bd->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           intensity = 0;
> > > > +   int intensity = backlight_get_brightness(bd);
> > > >
> > > >     if (corgibl_flags & CORGIBL_SUSPENDED)
> > > >             intensity = 0;
> > > > diff --git a/drivers/video/backlight/da903x_bl.c b/drivers/video/backlight/da903x_bl.c
> > > > index 62540e4bdedb..71f21bbc7a9f 100644
> > > > --- a/drivers/video/backlight/da903x_bl.c
> > > > +++ b/drivers/video/backlight/da903x_bl.c
> > > > @@ -77,18 +77,7 @@ static int da903x_backlight_set(struct backlight_device *bl, int brightness)
> > > >
> > > >  static int da903x_backlight_update_status(struct backlight_device *bl)
> > > >  {
> > > > -   int brightness = bl->props.brightness;
> > > > -
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.state & BL_CORE_SUSPENDED)
> > > > -           brightness = 0;
> > > > -
> > > > -   return da903x_backlight_set(bl, brightness);
> > > > +   return da903x_backlight_set(bl, backlight_get_brightness(bl));
> > > >  }
> > > >
> > > >  static int da903x_backlight_get_brightness(struct backlight_device *bl)
> > > > diff --git a/drivers/video/backlight/ep93xx_bl.c b/drivers/video/backlight/ep93xx_bl.c
> > > > index 4149e0b2f83c..2387009d452d 100644
> > > > --- a/drivers/video/backlight/ep93xx_bl.c
> > > > +++ b/drivers/video/backlight/ep93xx_bl.c
> > > > @@ -36,13 +36,7 @@ static int ep93xxbl_set(struct backlight_device *bl, int brightness)
> > > >
> > > >  static int ep93xxbl_update_status(struct backlight_device *bl)
> > > >  {
> > > > -   int brightness = bl->props.brightness;
> > > > -
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK ||
> > > > -       bl->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   return ep93xxbl_set(bl, brightness);
> > > > +   return ep93xxbl_set(bl, backlight_get_brightness(bl));
> > > >  }
> > > >
> > > >  static int ep93xxbl_get_brightness(struct backlight_device *bl)
> > > > diff --git a/drivers/video/backlight/hp680_bl.c b/drivers/video/backlight/hp680_bl.c
> > > > index 8ea42b8d9bc8..9123c33def05 100644
> > > > --- a/drivers/video/backlight/hp680_bl.c
> > > > +++ b/drivers/video/backlight/hp680_bl.c
> > > > @@ -33,12 +33,8 @@ static void hp680bl_send_intensity(struct backlight_device *bd)
> > > >  {
> > > >     unsigned long flags;
> > > >     u16 v;
> > > > -   int intensity = bd->props.brightness;
> > > > +   int intensity = backlight_get_brightness(bd);
> > > >
> > > > -   if (bd->props.power != FB_BLANK_UNBLANK)
> > > > -           intensity = 0;
> > > > -   if (bd->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           intensity = 0;
> > > >     if (hp680bl_suspended)
> > > >             intensity = 0;
> > > >
> > > > diff --git a/drivers/video/backlight/kb3886_bl.c b/drivers/video/backlight/kb3886_bl.c
> > > > index 1dfe13c18925..55794b239cff 100644
> > > > --- a/drivers/video/backlight/kb3886_bl.c
> > > > +++ b/drivers/video/backlight/kb3886_bl.c
> > > > @@ -87,12 +87,8 @@ static const struct dmi_system_id kb3886bl_device_table[] __initconst = {
> > > >
> > > >  static int kb3886bl_send_intensity(struct backlight_device *bd)
> > > >  {
> > > > -   int intensity = bd->props.brightness;
> > > > +   int intensity = backlight_get_brightness(bd);
> > > >
> > > > -   if (bd->props.power != FB_BLANK_UNBLANK)
> > > > -           intensity = 0;
> > > > -   if (bd->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           intensity = 0;
> > > >     if (kb3886bl_flags & KB3886BL_SUSPENDED)
> > > >             intensity = 0;
> > > >
> > > > diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> > > > index 3f66549997c8..f54d256e2d54 100644
> > > > --- a/drivers/video/backlight/led_bl.c
> > > > +++ b/drivers/video/backlight/led_bl.c
> > > > @@ -54,12 +54,7 @@ static void led_bl_power_off(struct led_bl_data *priv)
> > > >  static int led_bl_update_status(struct backlight_device *bl)
> > > >  {
> > > >     struct led_bl_data *priv = bl_get_data(bl);
> > > > -   int brightness = bl->props.brightness;
> > > > -
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK ||
> > > > -       bl->props.fb_blank != FB_BLANK_UNBLANK ||
> > > > -       bl->props.state & BL_CORE_FBBLANK)
> > > > -           brightness = 0;
> > > > +   int brightness = backlight_get_brightness(bl);
> > > >
> > > >     if (brightness > 0)
> > > >             led_bl_set_brightness(priv, brightness);
> > > > diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
> > > > index ee09d1bd02b9..d07a2bd805fc 100644
> > > > --- a/drivers/video/backlight/lm3533_bl.c
> > > > +++ b/drivers/video/backlight/lm3533_bl.c
> > > > @@ -39,14 +39,8 @@ static inline int lm3533_bl_get_ctrlbank_id(struct lm3533_bl *bl)
> > > >  static int lm3533_bl_update_status(struct backlight_device *bd)
> > > >  {
> > > >     struct lm3533_bl *bl = bl_get_data(bd);
> > > > -   int brightness = bd->props.brightness;
> > > >
> > > > -   if (bd->props.power != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -   if (bd->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   return lm3533_ctrlbank_set_brightness(&bl->cb, (u8)brightness);
> > > > +   return lm3533_ctrlbank_set_brightness(&bl->cb, backlight_get_brightness(bd));
> > > >  }
> > > >
> > > >  static int lm3533_bl_get_brightness(struct backlight_device *bd)
> > > > diff --git a/drivers/video/backlight/locomolcd.c b/drivers/video/backlight/locomolcd.c
> > > > index cdc02e04f89d..297ee2e1ab0b 100644
> > > > --- a/drivers/video/backlight/locomolcd.c
> > > > +++ b/drivers/video/backlight/locomolcd.c
> > > > @@ -111,12 +111,8 @@ static int current_intensity;
> > > >
> > > >  static int locomolcd_set_intensity(struct backlight_device *bd)
> > > >  {
> > > > -   int intensity = bd->props.brightness;
> > > > +   int intensity = backlight_get_brightness(bd);
> > > >
> > > > -   if (bd->props.power != FB_BLANK_UNBLANK)
> > > > -           intensity = 0;
> > > > -   if (bd->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           intensity = 0;
> > > >     if (locomolcd_flags & LOCOMOLCD_SUSPENDED)
> > > >             intensity = 0;
> > > >
> > > > diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlight/lv5207lp.c
> > > > index c6ad73a784e2..1842ae9a55f8 100644
> > > > --- a/drivers/video/backlight/lv5207lp.c
> > > > +++ b/drivers/video/backlight/lv5207lp.c
> > > > @@ -46,12 +46,7 @@ static int lv5207lp_write(struct lv5207lp *lv, u8 reg, u8 data)
> > > >  static int lv5207lp_backlight_update_status(struct backlight_device *backlight)
> > > >  {
> > > >     struct lv5207lp *lv = bl_get_data(backlight);
> > > > -   int brightness = backlight->props.brightness;
> > > > -
> > > > -   if (backlight->props.power != FB_BLANK_UNBLANK ||
> > > > -       backlight->props.fb_blank != FB_BLANK_UNBLANK ||
> > > > -       backlight->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> > > > -           brightness = 0;
> > > > +   int brightness = backlight_get_brightness(backlight);
> > > >
> > > >     if (brightness) {
> > > >             lv5207lp_write(lv, LV5207LP_CTRL1,
> > > > diff --git a/drivers/video/backlight/max8925_bl.c b/drivers/video/backlight/max8925_bl.c
> > > > index 97cc260ff9d1..e607ec6fd4bf 100644
> > > > --- a/drivers/video/backlight/max8925_bl.c
> > > > +++ b/drivers/video/backlight/max8925_bl.c
> > > > @@ -64,18 +64,7 @@ static int max8925_backlight_set(struct backlight_device *bl, int brightness)
> > > >
> > > >  static int max8925_backlight_update_status(struct backlight_device *bl)
> > > >  {
> > > > -   int brightness = bl->props.brightness;
> > > > -
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.state & BL_CORE_SUSPENDED)
> > > > -           brightness = 0;
> > > > -
> > > > -   return max8925_backlight_set(bl, brightness);
> > > > +   return max8925_backlight_set(bl, backlight_get_brightness(bl));
> > > >  }
> > > >
> > > >  static int max8925_backlight_get_brightness(struct backlight_device *bl)
> > > > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > > > index 82b8d7594701..eff64db2e02e 100644
> > > > --- a/drivers/video/backlight/pwm_bl.c
> > > > +++ b/drivers/video/backlight/pwm_bl.c
> > > > @@ -108,14 +108,9 @@ static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness)
> > > >  static int pwm_backlight_update_status(struct backlight_device *bl)
> > > >  {
> > > >     struct pwm_bl_data *pb = bl_get_data(bl);
> > > > -   int brightness = bl->props.brightness;
> > > > +   int brightness = backlight_get_brightness(bl);
> > > >     struct pwm_state state;
> > > >
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK ||
> > > > -       bl->props.fb_blank != FB_BLANK_UNBLANK ||
> > > > -       bl->props.state & BL_CORE_FBBLANK)
> > > > -           brightness = 0;
> > > > -
> > > >     if (pb->notify)
> > > >             brightness = pb->notify(pb->dev, brightness);
> > > >
> > > > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > > > index 4c8c34b99441..94d3b96244f0 100644
> > > > --- a/drivers/video/backlight/qcom-wled.c
> > > > +++ b/drivers/video/backlight/qcom-wled.c
> > > > @@ -433,14 +433,9 @@ static int wled5_ovp_delay(struct wled *wled)
> > > >  static int wled_update_status(struct backlight_device *bl)
> > > >  {
> > > >     struct wled *wled = bl_get_data(bl);
> > > > -   u16 brightness = bl->props.brightness;
> > > > +   u16 brightness = backlight_get_brightness(bl);
> > > >     int rc = 0;
> > > >
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK ||
> > > > -       bl->props.fb_blank != FB_BLANK_UNBLANK ||
> > > > -       bl->props.state & BL_CORE_FBBLANK)
> > > > -           brightness = 0;
> > > > -
> > > >     mutex_lock(&wled->lock);
> > > >     if (brightness) {
> > > >             rc = wled->wled_set_brightness(wled, brightness);
> > > > diff --git a/drivers/video/backlight/tps65217_bl.c b/drivers/video/backlight/tps65217_bl.c
> > > > index 762e3feed097..8457166f357f 100644
> > > > --- a/drivers/video/backlight/tps65217_bl.c
> > > > +++ b/drivers/video/backlight/tps65217_bl.c
> > > > @@ -77,15 +77,7 @@ static int tps65217_bl_update_status(struct backlight_device *bl)
> > > >  {
> > > >     struct tps65217_bl *tps65217_bl = bl_get_data(bl);
> > > >     int rc;
> > > > -   int brightness = bl->props.brightness;
> > > > -
> > > > -   if (bl->props.state & BL_CORE_SUSPENDED)
> > > > -           brightness = 0;
> > > > -
> > > > -   if ((bl->props.power != FB_BLANK_UNBLANK) ||
> > > > -           (bl->props.fb_blank != FB_BLANK_UNBLANK))
> > > > -           /* framebuffer in low power mode or blanking active */
> > > > -           brightness = 0;
> > > > +   int brightness = backlight_get_brightness(bl);
> > > >
> > > >     if (brightness > 0) {
> > > >             rc = tps65217_reg_write(tps65217_bl->tps,
> > > > diff --git a/drivers/video/backlight/wm831x_bl.c b/drivers/video/backlight/wm831x_bl.c
> > > > index e55977d54c15..c5aaee205bdf 100644
> > > > --- a/drivers/video/backlight/wm831x_bl.c
> > > > +++ b/drivers/video/backlight/wm831x_bl.c
> > > > @@ -91,18 +91,7 @@ static int wm831x_backlight_set(struct backlight_device *bl, int brightness)
> > > >
> > > >  static int wm831x_backlight_update_status(struct backlight_device *bl)
> > > >  {
> > > > -   int brightness = bl->props.brightness;
> > > > -
> > > > -   if (bl->props.power != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> > > > -           brightness = 0;
> > > > -
> > > > -   if (bl->props.state & BL_CORE_SUSPENDED)
> > > > -           brightness = 0;
> > > > -
> > > > -   return wm831x_backlight_set(bl, brightness);
> > > > +   return wm831x_backlight_set(bl, backlight_get_brightness(bl));
> > > >  }
> > > >
> > > >  static int wm831x_backlight_get_brightness(struct backlight_device *bl)
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
