Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E772198E1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 08:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C249E6E9AF;
	Thu,  9 Jul 2020 06:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D376E9AF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 06:51:59 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id lx13so1127419ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 23:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qC6ikPyAkkZDEb9ir5eEV2kSBTjyBB0hcPesB8iDBzU=;
 b=HMkT8gZtcPJUF8GcOk4mhQA0XzCuo24QFbpsy/EQ++/a9dyIEzXHW5pWoHG+rdOYsm
 xoxASy9VtzcGgvTPgxN+Wxa8/m7Axkq2Hi3BJ94g6Vl5qwmM3gKpwebpczBWGvJBlIRK
 rzMZrOsMRep1fyOEpevHPW43USm2kdy7jah/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qC6ikPyAkkZDEb9ir5eEV2kSBTjyBB0hcPesB8iDBzU=;
 b=n7zYpB6GNdVbgI3lcKX7jH0WE0Ft4lvlKjWUijTOdku/prl+gKX3UqU15gqvS3bYGC
 ITuKheZjxmykk28bKqnXzF+UbIGVwpP3TAVkOs87Ht6gSGCE3T1E8rj/qdOeWQjB3YoN
 8CbpQwfOEvbA/Nzm19rANqARvrDgTlKEKP6RTPYbCijiCtGxdxTItW2NKDuHmAdsSK9O
 5WSEjinQgM8Xyh4Y7tyRCFKwzOWZBHutUkC6bEhM77bSuVD2r7GymgROZqnDSWUuzpZE
 ijpsSV7jwJk+gnRsnromH6X2poB2H0rKw7YNqLC4kUnfqR6nmTn0rXZNHgDssA7BDwIY
 85Dw==
X-Gm-Message-State: AOAM5325paexczEb/Aq5cRgXCCSAlc8TpBC1Ewf5+K54bpM74mBmf8Pw
 pfktwDfUTk5vSjXsI3RMFmdsS7KQOxqLsVJ379o=
X-Google-Smtp-Source: ABdhPJyk8qb4D04v5BrhicG+Xy3FGlw4wqFYNSQErh6C94HtP/sa7EmHdq4CIsCgiOB3EWMM+rqGoeThfN/1ns6BMRk=
X-Received: by 2002:a17:906:1455:: with SMTP id
 q21mr38382187ejc.139.1594277518385; 
 Wed, 08 Jul 2020 23:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200701001002.74997-1-linux@roeck-us.net>
 <20200701091021.GA266726@ravnborg.org>
In-Reply-To: <20200701091021.GA266726@ravnborg.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Jul 2020 06:51:46 +0000
Message-ID: <CACPK8Xcb2jskKRsPEQ98Ty-yetkUZbZ8KzTGZ-ncc43nSXsRug@mail.gmail.com>
Subject: Re: [PATCH] drm/aspeed: Call drm_fbdev_generic_setup after
 drm_dev_register
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, g@ravnborg.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 1 Jul 2020 at 09:10, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Guenter.
>
> On Tue, Jun 30, 2020 at 05:10:02PM -0700, Guenter Roeck wrote:
> > The following backtrace is seen when running aspeed G5 kernels.
> >
> > WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_fb_helper.c:2233 drm_fbdev_generic_setup+0x138/0x198
> > aspeed_gfx 1e6e6000.display: Device has not been registered.
> > CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3 #1
> > Hardware name: Generic DT based system
> > Backtrace:
> > [<8010d6d0>] (dump_backtrace) from [<8010d9b8>] (show_stack+0x20/0x24)
> > r7:00000009 r6:60000153 r5:00000000 r4:8119fa94
> > [<8010d998>] (show_stack) from [<80b8cb98>] (dump_stack+0xcc/0xec)
> > [<80b8cacc>] (dump_stack) from [<80123ef0>] (__warn+0xd8/0xfc)
> > r7:00000009 r6:80e62ed0 r5:00000000 r4:974c3ccc
> > [<80123e18>] (__warn) from [<80123f98>] (warn_slowpath_fmt+0x84/0xc4)
> > r9:00000009 r8:806a0140 r7:000008b9 r6:80e62ed0 r5:80e631f8 r4:974c2000
> > [<80123f18>] (warn_slowpath_fmt) from [<806a0140>] (drm_fbdev_generic_setup+0x138/0x198)
> > r9:00000001 r8:9758fc10 r7:9758fc00 r6:00000000 r5:00000020 r4:9768a000
> > [<806a0008>] (drm_fbdev_generic_setup) from [<806d4558>] (aspeed_gfx_probe+0x204/0x32c)
> > r7:9758fc00 r6:00000000 r5:00000000 r4:9768a000
> > [<806d4354>] (aspeed_gfx_probe) from [<806dfca0>] (platform_drv_probe+0x58/0xa8)
> >
> > Since commit 1aed9509b29a6 ("drm/fb-helper: Remove return value from
> > drm_fbdev_generic_setup()"), drm_fbdev_generic_setup() must be called
> > after drm_dev_register() to avoid the warning. Do that.
> >
> > Fixes: 1aed9509b29a6 ("drm/fb-helper: Remove return value from drm_fbdev_generic_setup()")
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> I thought we had this fixed already - but could not find the patch.
> Must have been another driver then.
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> I assume Joel Stanley will pick up this patch.

I do not have the drm maintainer tools set up at the moment. Could one
of the other maintainers put this in the drm-misc tree?

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

>
>         Sam
>
> > ---
> >  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> > index 6b27242b9ee3..bca3fcff16ec 100644
> > --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> > +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> > @@ -173,8 +173,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
> >
> >       drm_mode_config_reset(drm);
> >
> > -     drm_fbdev_generic_setup(drm, 32);
> > -
> >       return 0;
> >  }
> >
> > @@ -225,6 +223,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
> >       if (ret)
> >               goto err_unload;
> >
> > +     drm_fbdev_generic_setup(&priv->drm, 32);
> >       return 0;
> >
> >  err_unload:
> > --
> > 2.17.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
