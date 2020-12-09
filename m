Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A912D5551
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6F06E9F3;
	Thu, 10 Dec 2020 08:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E7D6E19A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 20:28:22 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id q25so2689000otn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 12:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a9oodgx96dNE52G7HAnQoVS4BjUM+0QDI3RZyqRo6JQ=;
 b=W187LOtE+RHCqwlNXiHpy3CdUMT0GCU02YuJP39fNyxI/tNje4TnbFUawd0jTYkIFp
 bvmiDH0g4Z1jTfGgO1/kDzoz4xo5kX1ihX+UkO4XXeM3i8uuvVBWJYEiQn5fu2gbv4vw
 tIBMKUE10LuxhfE66JpOXlBAgfjzdxnS+Ooc9+PgfQprLX0pxAO48amtyIsjatHaHhcg
 7gHHR4Cf3bRnBtKeg9+XZlBJK0bmI9CBvl49EUvxStFBCeqtujaiNHbqLnEZ4ejexuac
 7dBhOLXaKTbO5RsEMhpI+VjDoo2kTkuII3x9xN54G7gSd+inXFdI44wUQA+pE6GVTLPG
 aiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a9oodgx96dNE52G7HAnQoVS4BjUM+0QDI3RZyqRo6JQ=;
 b=kxAxXBY7YrzNjA8LkyuaizbVfcOJ6u1W8KwiO4CdYpARc0c8uAFPU2UuFxSTOr2Z0p
 8zWtn+W/5Ho81DeFJ/xDawDDicr6B0NOOlUCGfmV5Ob7VoMw1Yh5HvVI9Sje81f28BZf
 gKTx2woeJf+pcw2u2x8cT0wC1DuuDIcD/KpBF4sYswHhLlmhrEsyT9FrVgkUBEr51AW+
 X7y8/Tj8bfb7lvDqt1Vhsi9Ws7uEM9rmhFvDrUJ3L4xYAac5vI/R/Eyr1a4iB8zbUo/Z
 03XbMiLvqvkvDj94ZmOMcw3xWKxHzglwsxL51iX67RUZAb6YYU0sbdM8VIAJZiTs8sE7
 FGlw==
X-Gm-Message-State: AOAM531QtIwB1cgOSWgVwJ2WZk+kMM44Ydwi9pBSykzENMBYT2mRYfd2
 9PIy0gVN8TfDPFKPG5lKVqJNWg==
X-Google-Smtp-Source: ABdhPJxLeRoMsBE6D7ok4ULm9GgSEBt+PzF/4irRRS7oD2zpgkJoDZIZHIb8/FvNGaUJfndGFLa6zA==
X-Received: by 2002:a05:6830:1c62:: with SMTP id
 s2mr3364351otg.177.1607545701571; 
 Wed, 09 Dec 2020 12:28:21 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id y10sm601332ota.42.2020.12.09.12.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 12:28:20 -0800 (PST)
Date: Wed, 9 Dec 2020 14:28:18 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm/panel: Make backlight attachment lazy
Message-ID: <X9EzYtuR+EwliYrv@builder.lan>
References: <20201208044446.973238-1-bjorn.andersson@linaro.org>
 <X891/LvEJT1bLtjH@ulmo> <X8/36HXL1IYPXA0J@builder.lan>
 <20201208235249.GD401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208235249.GD401619@phenom.ffwll.local>
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:39 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 08 Dec 17:52 CST 2020, Daniel Vetter wrote:

> On Tue, Dec 08, 2020 at 04:02:16PM -0600, Bjorn Andersson wrote:
> > On Tue 08 Dec 06:47 CST 2020, Thierry Reding wrote:
> > 
> > > On Mon, Dec 07, 2020 at 10:44:46PM -0600, Bjorn Andersson wrote:
> > > > Some bridge chips, such as the TI SN65DSI86 DSI/eDP bridge, provides
> > > > means of generating a PWM signal for backlight control of the attached
> > > > panel. The provided PWM chip is typically controlled by the
> > > > pwm-backlight driver, which if tied to the panel will provide DPMS.
> > > > 
> > > > But with the current implementation the panel will refuse to probe
> > > > because the bridge driver has yet to probe and register the PWM chip,
> > > > and the bridge driver will refuse to probe because it's unable to find
> > > > the panel.
> > > 
> > > What you're describing is basically a circular dependency. Can't we get
> > > rid of that in some other way? Why exactly does the bridge driver refuse
> > > to probe if the panel can't be found?
> > > 
> > > In other words, I see how the bridge would /use/ the panel in that it
> > > forward a video stream to it. But how does the panel /use/ the bridge?
> > > 
> > 
> > Yes, this is indeed a circular dependency between the components.
> > 
> > The involved parts are:
> > * the bridge driver that implements the PWM chip probe defers on
> >   drm_of_find_panel_or_bridge() failing to find the panel.
> > * the pwm-backlight driver that consumes the PWM channel probe defer
> >   because the pwm_chip was not registered by the bridge.
> > * the panel that uses the backlight for DPMS purposes probe defer
> >   because drm_panel_of_backlight() fails to find the pwm-backlight.
> > 
> > I looked at means of postponing drm_of_find_panel_or_bridge() to
> > drm_bridge_funcs->attach(), but at that time "deferral" would be fatal.
> > I looked at registering the pwm_chip earlier, but that would depend on a
> > guarantee of the pwm-backlight and panel driver to probe concurrently.
> > And the current solution of not tying the backlight to the panel means
> > that when userspace decides to DPMS the display the backlight stays on.
> > 
> > 
> > The proposed solution (hack?) means that DPMS operations happening
> > before the pwm-backlight has probed will be missed, so it's not perfect.
> > It does however allow the backlight on my laptop to turn off, which is a
> > big improvement.
> > 
> > But I'm certainly welcome to suggestions.
> 
> Entirely hand-waving, why doesn't the following work:
> 
> 1. driver for the platform device which is the bridge loads
> 2. that platform driver registers the pwm
> 3. it registers some magic for later on (more below)
> 4. panel driver has deferred loading until step 2 happened
> 5. panel driver registers drm_panel
> 6. the magic from step 3 picks up (after having been deferred for a few
> times probably) grabs the panel, and sets up the actual drm_bridge driver
> 
> Everyone happy, or not? From the description it looks like the problem
> that the pwm that we need for the backlight is tied to the same driver as
> the drm_bridge, and always torn down too if the drm_bridge setup fails
> somehow for a reason. And that reason is the circular dependency this
> creates.
> 
> Now for the magic in step 3, there's options:
> - change DT to split out that pwm as a separate platform_device, that way
>   bridge and panel can load indepedently (hopefully)
> 

This is an i2c device, so describing it multiple times would mean we
have multiple devices with the same address...

> - convert bridge to a multi-function device (mfd), essentially a way to
>   instantiate more devices with their drivers at runtime. Then the actual
>   pwm and drm_bridge parts of your bridge driver bind against those
>   sub-functions, and can defer indepedently
> 

But, this sounds reasonable and would rely on the existing probe
deferral logic and if there's ever any improvements in this area we
would directly benefit from it.

> - we could create a callback/wait function for "pls wait for any panel to
>   show up". Then your bridge driver could launch a work_struct with that
>   wait function, which will do the bridge setup once the panel has shown
>   up. The pwm will be registered right away. It's essentially hand-rolling
>   EPROBE_DEFERRED for work_struct in drm/panel. Maybe we might even have
>   that exported from the driver core, e.g.
> 
> register_bridge_fn(struct work *)
> {
> 	do_wait_probe_defer();
> 	panel = drm_of_find_panel_or_bridge();
> 	if (!panel) {
> 		schedule_work(); /* want to restart the work so it can be stopped on driver unload */
> 		return;
> 	}
> 
> 	/* we have the panel now, register drm_bridge */
> }
> 
> - cobble something together with component.c, but that's more for
>   collecting unrelated struct device into a logical one than splitting it
>   up more.
> 
> tldr; I think you can split this loop here at the bridge by untangling the
> pwm from the drm_bridge part sufficiently.

Yes, it seems like a reasonable path forward. But I wanted some input
before refactoring the whole thing.

Thank you,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
