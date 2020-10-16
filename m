Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17328290428
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 13:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B3F6E111;
	Fri, 16 Oct 2020 11:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645196E111
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 11:36:06 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id e20so2064763otj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gn1EIrCBLe3kMxAu3aqhvHh/VtuD1Ysx6Q6NyBWISbI=;
 b=NhtTndPXDBQJ4gzAhxC4XtHHsfDPVfNfWSwbhvwygQkAgl+sfMOs4SETdOUNTJ8Ztq
 vVFFZkz4FcJ2mwDqtTTizCAyQKwShhb3YBqxVwHErxLDnOkwIVnbcWjeQ+CGWenL8+OD
 C0xb8qOIuhLJBFpZM1t3aYT2WvWh4bO0hniws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gn1EIrCBLe3kMxAu3aqhvHh/VtuD1Ysx6Q6NyBWISbI=;
 b=lgjgKWb0UM4wC8jkV7AmzzMhgzYD5PLK6xvjSL63YyoLr4HEl0rdCuAqXFYZY/7CEJ
 nxgdzn6424UHy8gO+n5NpaSfwbDqI7tUL3IOnawYqxiDBlXxl1XW6IdZyENhCUaq+uXI
 3dYeE8nW8q0yZKOzG4NtnqKdIZj5N0rP33kKQPNYuo4IjroGfIvATz0EV0wiVcmVtTrV
 itMSRBeZt5GNIA+O82Xv8ne9E4a01trPS+4Asc0YA90UbB+cesQFHp8N7DRiTlX2CSU1
 0+xAFdaK6DrF6VlTNIPh0FDwcQzqVHxO0ksMhy9Ngi2n2hnjYVZlUndICQr7kdVLb+DF
 mGQA==
X-Gm-Message-State: AOAM5323+USPyb51B/g0bB8vNcUx323VrCURyWuxjeAjsGDjxoHYhzR0
 00yghOpI9FMhczLiiIp7b9fhvneu7d/tbGtpLjJVUA==
X-Google-Smtp-Source: ABdhPJxLt29TqtEmzmfFoXOg2Y/t7+r8dFEMb+MrbR6taHb0In7MVxnd+7ihHeHLn7fMg6TYrju/TlCE3NnPC2jtcTg=
X-Received: by 2002:a05:6830:8b:: with SMTP id
 a11mr2127203oto.303.1602848165712; 
 Fri, 16 Oct 2020 04:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <UQ4Aj6rvEUPvWt1cTYlNRLNoawlAIGTCnzstzNkRjZkv_NH-jIpnL7Xt9kGALYGc1M0RzZS0BcdvTb0V4przOwP8UBG_Xm6q2yRjCi3n-QE=@emersion.fr>
In-Reply-To: <UQ4Aj6rvEUPvWt1cTYlNRLNoawlAIGTCnzstzNkRjZkv_NH-jIpnL7Xt9kGALYGc1M0RzZS0BcdvTb0V4przOwP8UBG_Xm6q2yRjCi3n-QE=@emersion.fr>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 16 Oct 2020 13:35:54 +0200
Message-ID: <CAKMK7uFtesxom12TL4MX2rAb2eW2nEmh5gfeCG-wVAyfNvkGRw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/vkms: Set preferred depth correctly
To: Simon Ser <contact@emersion.fr>
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 12:38 PM Simon Ser <contact@emersion.fr> wrote:
>
> > The only thing we support is xrgb8888.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index 726801ab44d4..eb4007443706 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -124,7 +124,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
> >       dev->mode_config.max_height = YRES_MAX;
> >       dev->mode_config.cursor_width = 512;
> >       dev->mode_config.cursor_height = 512;
> > -     dev->mode_config.preferred_depth = 24;
> > +     dev->mode_config.preferred_depth = 32;
>
> Are you sure xrgb8888's depth is 32 and not 24? Looking at drmdb [1], *all*
> drivers set it to 24.

Uh there's a problem I think. Depth should indeed stay at 24, the
problem is that fb helpers directly take that to be the bpp parameter,
which is a different thing. And if you look at how most drivers set up
that, they pick 32.

I guess I need to revert this here, and unconfuse the fb helpers about
depth vs bpp.

Maybe best would be to just switch over to preferred drm_fourcc format
code, or maybe just pick this up from the first format the primary
plane supports.

This is all getting slightly tricky and a lot more work :-/
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
