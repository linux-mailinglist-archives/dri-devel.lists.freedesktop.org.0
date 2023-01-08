Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6D4661953
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 21:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E8C10E04F;
	Sun,  8 Jan 2023 20:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21A610E04F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 20:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=C5L2b3E9pjVq6LXYYYeAK09arnLn+mXAFAusyTiLYtM=;
 b=nTKn+n4lgiTjfD2VKToU6axN8gPcd5e73M4vSy/k1XU2CvufB5JON0iGZJvaIYarKXKqjIrRjLqPT
 fgO+lP1o7WNzsgCVM1gX/vf8p3Srt1Sy3jrhbqWPbZmGwoPa6enaJUadZx/d2EVJwwnZgtYp8Hhzag
 HBk4z0Ezz5oy2Z/j535u3Ai9X21x1KWD+8aabzfZO1aWEJAnGqoYNq+GpslWX1UI0w+EmgO0ZIL3z6
 vNqUzPb5/3oxTINHKsqnHYrd59yl/g1SHxW7toatY4pDAonTch+LEuU2IWjH2taSfaXx9gAPrtdtCp
 O7cGm8wZ/D/5tQcp0iKSqHuJJcYCvgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=C5L2b3E9pjVq6LXYYYeAK09arnLn+mXAFAusyTiLYtM=;
 b=HWVUdLyZ5eUHvE79ubttUHLptrX9PXLmdILJ58ckRRwFt+J10zuBzp9HvE4mc7C2KbULY7jBKFPz7
 LChrDvIDA==
X-HalOne-ID: 2f2d9a54-8f93-11ed-9409-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 2f2d9a54-8f93-11ed-9409-ede074c87fad;
 Sun, 08 Jan 2023 20:29:45 +0000 (UTC)
Date: Sun, 8 Jan 2023 21:29:43 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 09/15] staging: fbtft: fb_ssd1351.c: Introduce
 backlight_is_blank()
Message-ID: <Y7sntztwrNqw41+i@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-9-1bd9bafb351f@ravnborg.org>
 <20230108202817.7890f85c@heffalump.sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230108202817.7890f85c@heffalump.sk2.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Antonino Daplas <adaplas@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Lee Jones <lee@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 Miguel Ojeda <ojeda@kernel.org>,
 Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Sun, Jan 08, 2023 at 08:28:17PM +0100, Stephen Kitt wrote:
> On Sat, 07 Jan 2023 19:26:23 +0100, Sam Ravnborg via B4 Submission Endpoint
> <devnull+sam.ravnborg.org@kernel.org> wrote:
> 
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Avoiding direct access to backlight_properties.props.
> > 
> > Access to the deprecated props.fb_blank replaced by backlight_is_blank().
> > Access to props.power is dropped - it was only used for debug.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Stephen Kitt <steve@sk2.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: linux-fbdev@vger.kernel.org
> > ---
> >  drivers/staging/fbtft/fb_ssd1351.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/fbtft/fb_ssd1351.c
> > b/drivers/staging/fbtft/fb_ssd1351.c index b8d55aa8c5c7..995fbd2f3dc6 100644
> > --- a/drivers/staging/fbtft/fb_ssd1351.c
> > +++ b/drivers/staging/fbtft/fb_ssd1351.c
> > @@ -190,15 +190,12 @@ static struct fbtft_display display = {
> >  static int update_onboard_backlight(struct backlight_device *bd)
> >  {
> >  	struct fbtft_par *par = bl_get_data(bd);
> > -	bool on;
> > +	bool blank = backlight_is_blank(bd);
> >  
> > -	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
> > -		      "%s: power=%d, fb_blank=%d\n",
> > -		      __func__, bd->props.power, bd->props.fb_blank);
> > +	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: blank=%d\n", __func__,
> > blank); 
> > -	on = !backlight_is_blank(bd);
> >  	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
> > -	write_reg(par, 0xB5, on ? 0x03 : 0x02);
> > +	write_reg(par, 0xB5, !blank ? 0x03 : 0x02);
> >  
> >  	return 0;
> >  }
> > 
> > -- 
> > 2.34.1
> 
> For debugging purposes here, would there be any point in logging props.state?
> As in
> 
>         fbtft_par_dbg(DEBUG_BACKLIGHT, par,
> -                     "%s: power=%d, fb_blank=%d\n",
> -                     __func__, bd->props.power, bd->props.fb_blank);
> +                     "%s: power=%d, state=%u\n",
> +                     __func__, bd->props.power, bd->props.state);

Thanks for the suggestion - and the reviews!

I was tempted to just remove the debugging.
If we require debugging, then this could be added in the backlight core,
thus everyone would benefit from it.

The solution above avoid any direct use of backlight_properties
which I consider a layer violation outside the backlight core.
(We cannot avoid it today with the current interface - but we can
minimize it).

	Sam
