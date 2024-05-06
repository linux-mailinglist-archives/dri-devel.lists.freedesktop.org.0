Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB398BCEBF
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A0C10F0B2;
	Mon,  6 May 2024 13:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RpiUvUCA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502DF10F0B2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:14:33 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2e1e8c880ffso4713921fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715001271; x=1715606071; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hcGOVp9unOUJdofB/8SfIMCkzzBFqbYaTzZjCQ22Ceo=;
 b=RpiUvUCAtBCuZf3aiu2/3jyzL0/am1v90VM/roBPx0u/88+aRTOHgo/ZBVBxdYhFy9
 1pPXrO8V6LAuU3nhEx4gGhkiUR8TuOaxqsOx0PwEjjY2tAQFa2dz/aJsRfSlQTCps9lr
 qiq4M+RVVE/0FT5O75rDUjiEG2uZdcYbkmUxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715001271; x=1715606071;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hcGOVp9unOUJdofB/8SfIMCkzzBFqbYaTzZjCQ22Ceo=;
 b=AnDyPVqoRUCEojdF7dyTkDxMUSO7WLaFqN9xM/qj8ZZ1d8ZCTPJz9w6ApMQPB76QNn
 pK8tMqufLO2TGqtRZiLfC7qUi8nTxRnAFFiFz2mRo7vFaY/Gf06NeapBWeD3meiFLB+3
 hINWmI4D5hWKA4OkMDAbRbIQQnCcsqxKwL36BMXul+160lE951A2IDHbFa4pfrtvi6a/
 yWYwa0P3SPCGXHz6Din/aWU7xJYX1OWsfVDyShQw+0SExCX1W3mMxtPr6wum24RfN2sp
 h4G4ljiyr4Yq7RyYZABCO2mGzEAPnEww5MIDp6fJelBDCeS8qgPEqx481/kQs7Zm9eqQ
 YnWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsxkywq/HPIhBzv7c1VHFvcizbRiUAQicSF3GlQFua/haNzoVArHj2pWBadpvDMNbBHAZIX8zy+b1fgemjW2t0cERwvUNdV+/1vnb797IY
X-Gm-Message-State: AOJu0YxGHfy4NSnns9u/GJOhfCKsqIytdVuTBIof6KZLu1p/LgLMa50K
 UFn1XajQqVZmQVkcJya2Q7y+ag0S9TDXQzNATsf9npGOBu0ZsUUmVgrRipb+3jw=
X-Google-Smtp-Source: AGHT+IGi/la6Qcz7XisPeA2mbmqeuLa+J0eHqdFBkqiw++9QIWvkPyhu9oI7nfBs0pbXiB2cPZJTyA==
X-Received: by 2002:a2e:97c5:0:b0:2e3:ba0e:de02 with SMTP id
 m5-20020a2e97c5000000b002e3ba0ede02mr494955ljj.5.1715001271237; 
 Mon, 06 May 2024 06:14:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c469100b0041b083e16e2sm19958456wmo.2.2024.05.06.06.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 06:14:30 -0700 (PDT)
Date: Mon, 6 May 2024 15:14:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] fbdev: Have CONFIG_FB_NOTIFY be tristate
Message-ID: <ZjjXtEwWWZX43c6l@phenom.ffwll.local>
Mail-Followup-To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
References: <20240503192858.103640-1-florian.fainelli@broadcom.com>
 <8e1867fc-34da-457c-b95a-2d51ea97336a@app.fastmail.com>
 <05a5e893-12f7-49fd-9a9a-abd387571f9b@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05a5e893-12f7-49fd-9a9a-abd387571f9b@broadcom.com>
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

On Fri, May 03, 2024 at 01:22:10PM -0700, Florian Fainelli wrote:
> On 5/3/24 12:45, Arnd Bergmann wrote:
> > On Fri, May 3, 2024, at 21:28, Florian Fainelli wrote:
> > > Android devices in recovery mode make use of a framebuffer device to
> > > provide an user interface. In a GKI configuration that has CONFIG_FB=m,
> > > but CONFIG_FB_NOTIFY=y, loading the fb.ko module will fail with:
> > > 
> > > fb: Unknown symbol fb_notifier_call_chain (err -2)
> > > 
> > > Have CONFIG_FB_NOTIFY be tristate, just like CONFIG_FB such that both
> > > can be loaded as module with fb_notify.ko first, and fb.ko second.
> > > 
> > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > 
> > I see two problems here, so I don't think this is the right
> > approach:
> > 
> >   1. I don't understand your description: Since fb_notifier_call_chain()
> >      is an exported symbol, it should work for both FB_NOTIFY=y and
> >      FB_NOTIFY=m, unless something in Android drops the exported
> >      symbols for some reason.
> 
> The symbol is still exported in the Android tree. The issue is that the GKI
> defconfig does not enable any CONFIG_FB options at all. This is left for SoC
> vendors to do in their own "fragment" which would add CONFIG_FB=m. That
> implies CONFIG_FB_NOTIFY=y which was not part of the original kernel image
> we build/run against, and so we cannot resolve the symbol.
> 
> This could be resolved by having the GKI kernel have CONFIG_FB_NOTIFY=y but
> this is a bit wasteful (not by much since the code is very slim anyway) and
> it does require making changes specifically to the Android tree which could
> be beneficial upstream, hence my attempt at going upstream first.

Making fbdev (the driver subsystem, not the uapi, we'll still happily
merge patches for that) more useful is really not the upstream direction :-)

> IMHO it makes sense for all subsystem supporting code to be completely
> modular or completely built-in, or at least allowed to be.
> 
> > 
> >   2. This breaks if any of the four callers of fb_register_client()
> >      are built-in while CONFIG_FB_NOTIFY is set to =m:
> 
> Ah good point, I missed that part, thanks, adding "select FB_NOTIFY" ought
> to be enough for those.
> 
> > 
> > $ git grep -w fb_register_client
> > arch/arm/mach-pxa/am200epd.c:   fb_register_client(&am200_fb_notif);
> > drivers/leds/trigger/ledtrig-backlight.c:       ret = fb_register_client(&n->notifier);
> > drivers/video/backlight/backlight.c:    return fb_register_client(&bd->fb_notif);
> > drivers/video/backlight/lcd.c:  return fb_register_client(&ld->fb_notif);
> > 
> > Somewhat related but not directly addressing your patch, I wonder
> > if Android itself could migrate to using FB_CORE=m FB=n FB_NOTIFY=n
> > instead and use simpledrm for the console in place of the legacy
> > fbdev layer.
> 
> That is beyond my reach :)

This one is. And it doesn't need to be simpledrm, just a drm kms driver
with fbdev emulation. Heck even if you have an fbdev driver you should
control the corresponding backlight explicitly, and not rely on the fb
notifier to magical enable/disable some random backlights somewhere.

So please do not encourage using this in any modern code.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
