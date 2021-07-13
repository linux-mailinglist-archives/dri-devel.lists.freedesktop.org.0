Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE43C6F45
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 13:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2FB6E073;
	Tue, 13 Jul 2021 11:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A286E073
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 11:15:50 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id m18so847921oie.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 04:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4U+dpFlbVDJAptoBsJwRV5rg5yTKxT0i49dSys/T/o0=;
 b=k/Gw6fsU1KJkPIdtK8Mwlin1Tkyia5Myc0J/qodmmo3Xk8iYWjTAM9FBHc3fp9T5/C
 RQJmlYoUEZgc3xBtswsx7GdGZHU8VP4WEhqj0WA8vXO/QRq4gqo9hJjNSfgonASSu7ZG
 NZhvqsLbi9mfJ2Ornopc+/Ex1qXfult9t93Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4U+dpFlbVDJAptoBsJwRV5rg5yTKxT0i49dSys/T/o0=;
 b=Tzl2mufOL/WkH9AuToVeBfzKLT37fL6IZXXyaYM6YEPYJPiE+Q/94xsAgJLcDJA8uk
 Hv1XNprQBFh2iEfZ0dryv86w4TeTQ+jX/gw/K2qkcwoehvYG2wxM/06ttllCJYVP4r4l
 yuAFBvHwuk0+gU5SM2/gdq02bklJ/yfZ2LEA0bsx1tubV8imyiK7QlcldXYThpKF7BIm
 qRaeqqf44LESyhKjX7T1yavsO9YiYFngo+7DGN6ZBWkZhJ8/TLG+sINddVZbi1KNIkNL
 VvzmzUhhoRT9pxlTTsD8hW3jIuFop4Lkc76myoqLfh6BEUbFiTjVNBop07K47cRSm/Tj
 FptA==
X-Gm-Message-State: AOAM532hSzSZn4ic+WjXX4NVMfdUD8b3jsKXk6tOfVTWczvnFb7KxTmZ
 ukZ8QyVFbHVXiXx3xumKl+hg55Hl0oV9WLWdzvJDqg==
X-Google-Smtp-Source: ABdhPJwl9FIe/eZAGKxCpTTSp0CfSAouaVvuXROTRb5aItJZQfuCfTjzvJHjagD3TETh0ln0G3xy3Ap7JzPHqLyb2vM=
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr608583oig.14.1626174949394; 
 Tue, 13 Jul 2021 04:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210712085544.2828-1-thunder.leizhen@huawei.com>
 <YOxTvOayYYCro+qh@phenom.ffwll.local>
In-Reply-To: <YOxTvOayYYCro+qh@phenom.ffwll.local>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 13 Jul 2021 13:15:38 +0200
Message-ID: <CAKMK7uEpUQ-t3iWLaJ=mL=r1xOF7fS9+fh3VDmvaHM8bnO1XZg@mail.gmail.com>
Subject: Re: [PATCH 1/1] fbmem: Do not delete the mode that is still in use
To: Zhen Lei <thunder.leizhen@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 4:37 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Mon, Jul 12, 2021 at 04:55:44PM +0800, Zhen Lei wrote:
> > The execution of fb_delete_videomode() is not based on the result of the
> > previous fbcon_mode_deleted(). As a result, the mode is directly deleted,
> > regardless of whether it is still in use, which may cause UAF.
> >
> > ==================================================================
> > BUG: KASAN: use-after-free in fb_mode_is_equal+0x36e/0x5e0 \
> > drivers/video/fbdev/core/modedb.c:924
> > Read of size 4 at addr ffff88807e0ddb1c by task syz-executor.0/18962
> >
> > CPU: 2 PID: 18962 Comm: syz-executor.0 Not tainted 5.10.45-rc1+ #3
> > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ...
> > Call Trace:
> >  __dump_stack lib/dump_stack.c:77 [inline]
> >  dump_stack+0x137/0x1be lib/dump_stack.c:118
> >  print_address_description+0x6c/0x640 mm/kasan/report.c:385
> >  __kasan_report mm/kasan/report.c:545 [inline]
> >  kasan_report+0x13d/0x1e0 mm/kasan/report.c:562
> >  fb_mode_is_equal+0x36e/0x5e0 drivers/video/fbdev/core/modedb.c:924
> >  fbcon_mode_deleted+0x16a/0x220 drivers/video/fbdev/core/fbcon.c:2746
> >  fb_set_var+0x1e1/0xdb0 drivers/video/fbdev/core/fbmem.c:975
> >  do_fb_ioctl+0x4d9/0x6e0 drivers/video/fbdev/core/fbmem.c:1108
> >  vfs_ioctl fs/ioctl.c:48 [inline]
> >  __do_sys_ioctl fs/ioctl.c:753 [inline]
> >  __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:739
> >  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
> >  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >
> > Freed by task 18960:
> >  kasan_save_stack mm/kasan/common.c:48 [inline]
> >  kasan_set_track+0x3d/0x70 mm/kasan/common.c:56
> >  kasan_set_free_info+0x17/0x30 mm/kasan/generic.c:355
> >  __kasan_slab_free+0x108/0x140 mm/kasan/common.c:422
> >  slab_free_hook mm/slub.c:1541 [inline]
> >  slab_free_freelist_hook+0xd6/0x1a0 mm/slub.c:1574
> >  slab_free mm/slub.c:3139 [inline]
> >  kfree+0xca/0x3d0 mm/slub.c:4121
> >  fb_delete_videomode+0x56a/0x820 drivers/video/fbdev/core/modedb.c:1104
> >  fb_set_var+0x1f3/0xdb0 drivers/video/fbdev/core/fbmem.c:978
> >  do_fb_ioctl+0x4d9/0x6e0 drivers/video/fbdev/core/fbmem.c:1108
> >  vfs_ioctl fs/ioctl.c:48 [inline]
> >  __do_sys_ioctl fs/ioctl.c:753 [inline]
> >  __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:739
> >  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
> >  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >
> > Fixes: 13ff178ccd6d ("fbcon: Call fbcon_mode_deleted/new_modelist directly")
> > Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>
> Nice catch, that indeed got lost.
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: <stable@vger.kernel.org> # v5.3+
>
> Needs to be applied to drm-misc-fixes, but the tree isn't ready yet.

Tree still isn't ready, adding Thomas.

Thomas, can you pls apply this when drm-misc-fixes is forwarded?

Thanks, Daniel

> -Daniel
>
> > ---
> >  drivers/video/fbdev/core/fbmem.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index 98f193078c05..1c855145711b 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -970,13 +970,11 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
> >               fb_var_to_videomode(&mode2, &info->var);
> >               /* make sure we don't delete the videomode of current var */
> >               ret = fb_mode_is_equal(&mode1, &mode2);
> > -
> > -             if (!ret)
> > -                     fbcon_mode_deleted(info, &mode1);
> > -
> > -             if (!ret)
> > -                     fb_delete_videomode(&mode1, &info->modelist);
> > -
> > +             if (!ret) {
> > +                     ret = fbcon_mode_deleted(info, &mode1);
> > +                     if (!ret)
> > +                             fb_delete_videomode(&mode1, &info->modelist);
> > +             }
> >
> >               return ret ? -EINVAL : 0;
> >       }
> > --
> > 2.25.1
> >
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
