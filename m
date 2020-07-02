Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD3211DAC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 10:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D106E13F;
	Thu,  2 Jul 2020 08:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DD96E13F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 08:01:12 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C4DC080575;
 Thu,  2 Jul 2020 10:01:06 +0200 (CEST)
Date: Thu, 2 Jul 2020 10:01:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v3 0/16] backlight updates
Message-ID: <20200702080105.GA1277474@ravnborg.org>
References: <20200601065207.492614-1-sam@ravnborg.org>
 <CACvgo51z0Vvz9LkfqePmuwx19+NhaMEBHe9r5=uYWqhEdnia_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51z0Vvz9LkfqePmuwx19+NhaMEBHe9r5=uYWqhEdnia_Q@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=OR89HmRyg7TBtgxA9QYA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Andy Gross <agross@kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 patches@opensource.cirrus.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.

Long overdue feedback, I did not find time to go back to this patch-set
until now.

On Tue, Jun 02, 2020 at 03:04:39PM +0100, Emil Velikov wrote:
> Hi Sam,
> 
> On Mon, 1 Jun 2020 at 07:52, Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > v3:
> >  - Dropped video patch that was reviewd and thus applied
> >  - Updated kernel-doc so all fields now have a short intro
> >  - Improved readability in a lot of places, thanks to review
> >    feedback from Daniel - thanks!
> >  - Added better intro to backlight
> >  - Added acks
> >
> >    Several other smaller changes documented in the
> >    patches.
> >    I left out patches to make functions static as
> >    there are dependencies to drm-misc-next for these.
> >    When this is landed I have a pile of follow-up patches waiting,
> >    mostly introducing backlight_is_blank() all over.
> >
> What happened with my suggestion to use backlight_is_blank() in fbdev
> core itself?
Following your suggestion I implemented:

+static inline int backlight_get_brightness(struct backlight_device *bd)
+{
+	if (backlight_is_blank(bd))
+		return 0;
+	else
+		return bd->props.brightness;
+}

This results in code like this:

static int adp8870_bl_update_status(struct backlight_device *bl)
{
        return adp8870_bl_set(bl, backlight_get_brightness(bl));
}

Compare that with the original code:
static int adp8870_bl_update_status(struct backlight_device *bl)
{
	int brightness = bl->props.brightness;

	if (bl->props.power != FB_BLANK_UNBLANK)
		brightness = 0;

	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
		brightness = 0;

	return adp8870_bl_set(bl, brightness);
}

Much nicer!

The old code reads the brightness property direct.
I prefer the small helper so we do not hardcode too much of the
internals in the drivers.
Also the above is simpler than trying to maintain the correct value in
props.brightness all the time. And can be introduced gradually.

I will rework the series to use this helper.
I will also fix so I can use a const backlight_device *.

Thanks for the suggestion.

	Sam


> It effectively makes 13/13 and the above mentioned follow-up series obsolete.
> 
> That said, series look spot on. With the documentation fixed (pointer
> by Daniel) patches 1-12 are:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> -Emil
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
