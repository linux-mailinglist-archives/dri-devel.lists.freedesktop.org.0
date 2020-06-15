Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355B91F9C46
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 17:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513376E372;
	Mon, 15 Jun 2020 15:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD4E6E372
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 15:51:51 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id t6so13449858otk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 08:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWyoo9JIc02kJrgZwZWDB6M+M+eayvoh4h0JfKlgAOg=;
 b=HZ9TGIHT3a6uTYpAL41ct8BaksKi9jcKD+CTcG4bhh49tCI0spnO7q4fba7ph6J5+u
 LSALdBHwUbHldi9ukvwr9xI0ecx34xxIsv5A9G8nByTcSF/RGMXOvoZAyE1Zivo97yeP
 xMbgtpCvWTGagmJbVQpMNElwruwDinKtRKbuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWyoo9JIc02kJrgZwZWDB6M+M+eayvoh4h0JfKlgAOg=;
 b=jLaUA3vnAyxs413R2bjmXdotmXS0o+IhT2/Ozgd+Wsi1GyOtIOrwECAlYD+rHJTFwh
 /CH4mW6q6syP5T5czUlnnIsDyl294TnPH0do3SV/JMx/GMtMlUBMRYTLqpK1O8o2dnFl
 f+E8xQmoKyl/IgW5+RXx9P+E758I+lGug40dwcoUBUPB1y7C9gAbPgn3GWFDmBN4g64l
 8CUXd3Qq2J3Oh3jd2dYh6lInoV60HDMV+GuV+BTsGXh0As9pWusr9brxBwpetNmmk8yW
 Zr+uwegsqxkSJL1aUB7zSycyP0UwFmPuhBB5TaZ6OeskEhP+PsUsgh16jpxk8/+Bgb8Z
 2HZA==
X-Gm-Message-State: AOAM530BKU4kVqMe6NVh+H3bUbr7n3UqWP0U9tAH82VK8pAq0BKujqxY
 6EYBwF+LvAQOlfZ6uD6W5MlXuWP0HuPS9qtCme3qRg==
X-Google-Smtp-Source: ABdhPJx6HqrEy7ruwqlLz5F7KsjYacsr6GyNremIHWvMKdV1r9zXlfsXDgmMhd5sUL1E7QvEGvXk/jO3No7vVKicdOY=
X-Received: by 2002:a05:6830:54:: with SMTP id
 d20mr23204225otp.281.1592236310586; 
 Mon, 15 Jun 2020 08:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200613223027.4189309-1-linus.walleij@linaro.org>
 <20200614074441.GA220677@ravnborg.org>
 <CACRpkdZNM7+qzbJqyfJfEDO8P9SqpO4W6+t0-t89CXeFk9tSRw@mail.gmail.com>
In-Reply-To: <CACRpkdZNM7+qzbJqyfJfEDO8P9SqpO4W6+t0-t89CXeFk9tSRw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 15 Jun 2020 17:51:39 +0200
Message-ID: <CAKMK7uHmSvGE+qSvxUMGE3CTak1_UOKpD0+NmRZYJDa-xBTgMA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: mcde: Fix display initialization problem
To: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Sean Paul <sean@poorly.run>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 11:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Jun 14, 2020 at 9:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> > Hi Linus.
> >
> > On Sun, Jun 14, 2020 at 12:30:26AM +0200, Linus Walleij wrote:
> > > The following bug appeared in the MCDE driver/display
> > > initialization during the recent merge window.
> > >
> > > First the place we call drm_fbdev_generic_setup() in the
> > > wrong place: this needs to be called AFTER calling
> > > drm_dev_register() else we get this splat:
> > >
> > >  ------------[ cut here ]------------
> > > WARNING: CPU: 0 PID: 1 at ../drivers/gpu/drm/drm_fb_helper.c:2198 drm_fbdev_generic_setup+0x164/0x1a8
> > > mcde a0350000.mcde: Device has not been registered.
> > > Modules linked in:
> > > Hardware name: ST-Ericsson Ux5x0 platform (Device Tree Support)
> > > [<c010e704>] (unwind_backtrace) from [<c010a86c>] (show_stack+0x10/0x14)
> > > [<c010a86c>] (show_stack) from [<c0414f38>] (dump_stack+0x9c/0xb0)
> > > [<c0414f38>] (dump_stack) from [<c0121c8c>] (__warn+0xb8/0xd0)
> > > [<c0121c8c>] (__warn) from [<c0121d18>] (warn_slowpath_fmt+0x74/0xb8)
> > > [<c0121d18>] (warn_slowpath_fmt) from [<c04b154c>] (drm_fbdev_generic_setup+0x164/0x1a8)
> > > [<c04b154c>] (drm_fbdev_generic_setup) from [<c04ed278>] (mcde_drm_bind+0xc4/0x160)
> > > [<c04ed278>] (mcde_drm_bind) from [<c04f06b8>] (try_to_bring_up_master+0x15c/0x1a4)
> > > (...)
> > >
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Yup, this is the right way to do it.
> >
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> Hm I can't seem to apply these because drm-misc-fixes isn't
> rebased to v5.8-rc1 or something (wrong ancestor).
>
> Does anyone know if ther is a special trick for this or do I
> need to wait for someone else to rebase that branch?

Thomas Zimmermann (added) as current -fixes handler needs to roll the
branch forward (and make sure nothing got lost).
-Daniel

>
> Yours,
> Linus Walleij
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
