Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892608BE0B4
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 13:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36D810F4EF;
	Tue,  7 May 2024 11:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="JdP9Um10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC42510F4EF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 11:10:31 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-34f562474e8so298190f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715080230; x=1715685030; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJYqt/BR2CyiMdNEPrSYrl9Ymt3MProddXrjjgVptyM=;
 b=JdP9Um10+fxmoU/4+RxLDIepwVGv4NFtvtFkp3AIWovSNvCFGKCSh5x2vZqrNz+ZrI
 VYD1WzxO1rpYWikAtPHYt/1X3+evPCuTzIryQmBdQiheY1tlOwhKy0Gd5p0NQ/IMSZVr
 X+RzVRnMkdpyFuw5FmyvBNWevbQQ2le0CZ7rU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715080230; x=1715685030;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fJYqt/BR2CyiMdNEPrSYrl9Ymt3MProddXrjjgVptyM=;
 b=XpvRFK/FUG5K26IoIOKJ22NFlcDnuCOf5gawNMrBMIL+khslvLxP4Ll9XTnhco69zv
 olkpIiiuFi3y9Pnl4LZtF8pM7GbPTdJOrRfkJpzXFY+JZOpMe50+N/rWdoJ2ue3241Ea
 WdPKdeb/Wl4/jHMpSJ/N0W4hitcPFywdoiRMkfaNYs4/re+jPDAnxuSqDKlmaKSKCZYW
 swh+OXZbjOptMLQI6IxgzibszERrDP0Ftu25q1yQoIXMhhHttVF7RygHLkU7jZIIcUA5
 jv0dvtvKH0yk3+KPRgHkkSCFLkGhL/7gjjN0XWahivcqiqvq3Qdgo9f92HPlyjrSPNM9
 aJxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCYfQaBmN+Pu1cYY5uUwMFssGQxwW0e6fOUecn5n3b9HKdCB5SlmzTcvPaJ6vlMcbu9t0G1DwsFoShDe2XiJ5LIAXNcYE3wm0fQNcVogoX
X-Gm-Message-State: AOJu0YxasoPs0SPyizCzhF1hZvglrPE4i0r4pWTtVt1ldxgWGaDNrNNO
 yKWH2ALuX/XDsKctI0MN7djRW92bduRRAOJ3S/G5kGwPtR0F7MqHKxtLaGES5XA=
X-Google-Smtp-Source: AGHT+IF/Hd1GY1XB8xhfbN1Szh0u5/Xrk7BD1m4jsqPBczY5+6sTv/MdcrAjQUKWyV8Ee2+O8uQ1Pw==
X-Received: by 2002:a05:600c:3b93:b0:41b:e58c:e007 with SMTP id
 n19-20020a05600c3b9300b0041be58ce007mr9144024wms.4.1715080229932; 
 Tue, 07 May 2024 04:10:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c450900b0041bd920d41csm19216384wmo.1.2024.05.07.04.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 04:10:29 -0700 (PDT)
Date: Tue, 7 May 2024 13:10:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] fbdev: Have CONFIG_FB_NOTIFY be tristate
Message-ID: <ZjoMI5bJSlqhtOy1@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
References: <20240503192858.103640-1-florian.fainelli@broadcom.com>
 <8e1867fc-34da-457c-b95a-2d51ea97336a@app.fastmail.com>
 <05a5e893-12f7-49fd-9a9a-abd387571f9b@broadcom.com>
 <ZjjXtEwWWZX43c6l@phenom.ffwll.local>
 <47c63c4c-c657-4210-b476-c91c4f192483@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47c63c4c-c657-4210-b476-c91c4f192483@app.fastmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 06, 2024 at 04:53:47PM +0200, Arnd Bergmann wrote:
> On Mon, May 6, 2024, at 15:14, Daniel Vetter wrote:
> > On Fri, May 03, 2024 at 01:22:10PM -0700, Florian Fainelli wrote:
> >> On 5/3/24 12:45, Arnd Bergmann wrote:
> >> > On Fri, May 3, 2024, at 21:28, Florian Fainelli wrote:
> >> > > Android devices in recovery mode make use of a framebuffer device to
> >> > > provide an user interface. In a GKI configuration that has CONFIG_FB=m,
> >> > > but CONFIG_FB_NOTIFY=y, loading the fb.ko module will fail with:
> >> > > 
> >> > > fb: Unknown symbol fb_notifier_call_chain (err -2)
> >> > > 
> >> > > Have CONFIG_FB_NOTIFY be tristate, just like CONFIG_FB such that both
> >> > > can be loaded as module with fb_notify.ko first, and fb.ko second.
> >> > > 
> >> > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> >> > 
> >> > I see two problems here, so I don't think this is the right
> >> > approach:
> >> > 
> >> >   1. I don't understand your description: Since fb_notifier_call_chain()
> >> >      is an exported symbol, it should work for both FB_NOTIFY=y and
> >> >      FB_NOTIFY=m, unless something in Android drops the exported
> >> >      symbols for some reason.
> >> 
> >> The symbol is still exported in the Android tree. The issue is that the GKI
> >> defconfig does not enable any CONFIG_FB options at all. This is left for SoC
> >> vendors to do in their own "fragment" which would add CONFIG_FB=m. That
> >> implies CONFIG_FB_NOTIFY=y which was not part of the original kernel image
> >> we build/run against, and so we cannot resolve the symbol.
> 
> I see.
> 
> >> This could be resolved by having the GKI kernel have CONFIG_FB_NOTIFY=y but
> >> this is a bit wasteful (not by much since the code is very slim anyway) and
> >> it does require making changes specifically to the Android tree which could
> >> be beneficial upstream, hence my attempt at going upstream first.
> >
> > Making fbdev (the driver subsystem, not the uapi, we'll still happily
> > merge patches for that) more useful is really not the upstream direction :-)
> 
> I'm more worried about the idea of enabling an entire subsystem
> as a loadable module and expecting that to work with an existing
> kernel, specifically when the drm.ko and fb.ko interact with
> one another and are built with different .config files.
> 
> This is the current Android GKI config:
> https://android.googlesource.com/kernel/common.git/+/refs/heads/android-mainline/arch/arm64/configs/gki_defconfig
> where I can see that CONFIG_DRM is built-in, but DRM_FBDEV_EMULATION
> CONFIG_VT, CONFIG_FRAMEBUFFER_CONSOLE, CONFIG_FB_DEVICE and
> CONFIG_FB_CORE are all disabled.
> 
> So the console won't work at all,I think this means that there
> is no way to get the console working, but building a fb.ko module
> allows using /dev/fb with simplefb.ko (or any other one) happens
> to almost work, but only by dumb luck rather than by design.

So using /dev/fb chardev without fbcon is very much a real idea. This way
you should be able to run old userspace that uses fbdev directly for
drawing, but your console needs are served by a userspace console running
on top of drm.

vt switching gets a bit more entertaining, but I thought logind has all
the glue already to make that happen. Worst case you need a tiny launcher
tool to get your userspace console out of the way while you launch a fbdev
using application, but I think correctly implement the vt ioctls to switch
to graphics mode /should/ work automatically.

I do agree that this is only really a good idea with drm drivers, since
those do not rely on any of the fbdev infrastructure like the notifier
under discussion.

> >> > $ git grep -w fb_register_client
> >> > arch/arm/mach-pxa/am200epd.c:   fb_register_client(&am200_fb_notif);
> >> > drivers/leds/trigger/ledtrig-backlight.c:       ret = fb_register_client(&n->notifier);
> >> > drivers/video/backlight/backlight.c:    return fb_register_client(&bd->fb_notif);
> >> > drivers/video/backlight/lcd.c:  return fb_register_client(&ld->fb_notif);
> >> > 
> >> > Somewhat related but not directly addressing your patch, I wonder
> >> > if Android itself could migrate to using FB_CORE=m FB=n FB_NOTIFY=n
> >> > instead and use simpledrm for the console in place of the legacy
> >> > fbdev layer.
> >> 
> >> That is beyond my reach :)
> >
> > This one is. And it doesn't need to be simpledrm, just a drm kms driver
> > with fbdev emulation. Heck even if you have an fbdev driver you should
> > control the corresponding backlight explicitly, and not rely on the fb
> > notifier to magical enable/disable some random backlights somewhere.
> >
> > So please do not encourage using this in any modern code.
> 
> I suppose making CONFIG_FB_NOTIFIER optional for FB (on by
> default if any of the consumers of the notification are turned
> on) would not be a bad direction to go in general and also
> address Florian's link error, but that doesn't solve the
> more general concern about a third-party fb.ko module on a
> kernel that was explicitly built with FB disabled.
> 
> The GKI defconfig was initially done at a time where one could
> not have CONFIG_FBDEV_EMULATION and CONFIG_FB_DEVICE without
> pulling in the entire fbdev module, but now that is possible.
> Maybe that is something that Android could now include?
> 
> Alternatively, I wonder if that recovery image could be changed
> to access the screen through the /dev/dri/ interfaces? I have
> no experience in using those without Xorg or Wayland, is that
> a sensible thing to do?

Uh ... I think I'm confused about the requirements. Does android's
recovery image need fbdev (meaning /dev/fb chardevs), or does it need
fbcon?

Note that fbcon runs (or well, should run) totally fine on top of drm
drivers without the fb notifier. This wasn't the case a few years ago
(because fbcon also used that notifier), but nowadays fb notifiers are
only needed for legacy fbdev drivers. So could it be that this "need fb
notifier" requirement is a leftover from rather old kernel versions and
not actually needed anymore?

I think we should nail the actual requirements here first before jumping
to solutions ...
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
