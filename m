Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959FE3FB89F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 16:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC83389ACC;
	Mon, 30 Aug 2021 14:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4498089ACC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 14:59:30 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id j5so4404219vki.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 07:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vfdnjnEp4XpXIUeX6ZT76KgIhW9q66X8YC+x/oa8NO4=;
 b=MDugX+GoKUK7QufoBERkMh4ENfu1FkjHsHYka+he70NV86A5EQRKVNKXqzkTQYW12d
 Zff1iVAx4enCKvxr/MhBV+C2qXKrx11/yfv2aZFpc2Z9I3DjEH6cYZJ2O3w9hF23mFqc
 ckpYmfrJtpKceNoe48B+a6OXhd5FwkKh3qyZjUejORJ1AgC8BcX1Sk8c+G/BlvlrfShB
 Sc3qo59LGlM6qodOQrxyq5v0rTXnajkS1LAEVBnN83QpQEeSpV4zFR+gxjumFGSMy1jI
 JnVsP5a7s8J2ChP9vfm45dPXkgsUQ6KStXET+sRFmpjlPoIiacD28/XH3LgoVi4+sSuJ
 GU0g==
X-Gm-Message-State: AOAM532A4ELZvUbIRz9/oGXAFokB7u3g6iGQ+Jv2mHHR4QDknIXqhpzb
 Cx/x4HQdY+HdB7xwqsg3U4SJSdSUicPoJ0ksb70=
X-Google-Smtp-Source: ABdhPJydLpFB2lNgVuMM9bZ4mnyHRiF4P8TW4Q5UiskyqqH0bqGTbirT4idHoa56DrU3sA/4b/qArusq4rnN12XhXmw=
X-Received: by 2002:a05:6122:809:: with SMTP id 9mr14007873vkj.4.1630335569285; 
 Mon, 30 Aug 2021 07:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <1630294223-7225-1-git-send-email-tcs_kernel@tencent.com>
 <YSyTzlUEhrxD7rU4@phenom.ffwll.local>
 <f9fda3fa-b2b7-57aa-8c37-69d93ae26045@i-love.sakura.ne.jp>
In-Reply-To: <f9fda3fa-b2b7-57aa-8c37-69d93ae26045@i-love.sakura.ne.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Aug 2021 16:59:18 +0200
Message-ID: <CAMuHMdV9cWSs0Hn2XJxj6HU1rAN0jYcOKLRn=1Z64nmGDp7bQQ@mail.gmail.com>
Subject: Re: [PATCH V4] fbcon: fix fbcon out-of-bounds write in sys_imageblit
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Daniel Vetter <daniel@ffwll.ch>, tcs.kernel@gmail.com, 
 Matthew Wilcox <willy@infradead.org>,
 George Kennedy <george.kennedy@oracle.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg KH <gregkh@linuxfoundation.org>, Haimin Zhang <tcs_kernel@tencent.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tetsuo,

On Mon, Aug 30, 2021 at 12:25 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2021/08/30 17:16, Daniel Vetter wrote:
> > On Mon, Aug 30, 2021 at 11:30:23AM +0800, tcs.kernel@gmail.com wrote:
> >> From: Haimin Zhang <tcs_kernel@tencent.com>
> >>
> >> yres and vyres can be controlled by user mode parameters, and cause
> >> p->vrows to become a negative value. While this value be passed to real_y
> >> function, the ypos will be out of screen range.This is an out-of-bounds
> >> write bug.
> >> some driver will check xres and yres in fb_check_var callback,but some not
> >> so we add a common check after that callback.
> >>
> >> Signed-off-by: Haimin Zhang <tcs_kernel@tencent.com>
> >> Signed-off-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
>
> Please s/Signed-off-by: Tetsuo Handa/Suggested-by: Tetsuo Handa/ .
> It is Haimin who debugged this problem and wrote this patch.
>
> >
> > Does this fix a syzbot crash or how was this discovered?
>
> Yes, Haimin's team is running syzkaller locally and found this bug.
> Therefore, no Reported-by: syzbot tag for this patch.
>
>
> -------- Forwarded Message --------
> Subject: Re: [PATCH v2] fbcon: fix Out-Of-Bounds write in sys_imageblit
> Message-ID: <33fc0e30-b94c-939f-a708-4b939af43100@gmail.com>
> Date: Mon, 2 Aug 2021 14:50:24 +0800
>
> hi, Tetsuo Handa
>
> i made a test with your suggested code, it can block the out-of-bound bug.
>
> where to add this check logic, i suggest to add it after the driver's
> fb_check_var callback.because what we plan to add is a common check by
> framework,but some driver can fault-tolerant invalid parameters(like
> yres_virtual > yres)
>
>         /* exist common check */
>         if (var->xres < 8 || var->yres < 8)
>                 return -EINVAL;
>
>         /* callback to drivers, some driver can fix invalid virtual
> xres or virtual yres */

Yes. Fbdev drivers are supposed to round up invalid or unsupported
values, or return -EINVAL.

>         ret = info->fbops->fb_check_var(var, info);
>         if (ret)
>                 return ret;
>         /* we add a more check here, if some drivers can't fix invalid x,y
> virtual values, we return a -EINVAL */
>         if (var->yres_virtual < var->yres || var->xres_virtual < var->xres)
>                 return -EINVAL;
>
> how about this fix ?  i can make a v3 patch.
>
>
>
> diff --git a/drivers/video/fbdev/core/fbmem.c
> b/drivers/video/fbdev/core/fbmem.c
> index 1c85514..9fb7e94 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1012,6 +1012,10 @@ static int fb_check_caps(struct fb_info *info,
> struct fb_var_screeninfo *var,
>
>         if (ret)
>                 return ret;
> +
> +       /* Virtual resolution cannot be smaller than visible resolution. */
> +       if (var->yres_virtual < var->yres || var->xres_virtual < var->xres)
> +               return -EINVAL;

So if this happens, it's a driver bug, not a userspace bug.

>
>         if ((var->activate & FB_ACTIVATE_MASK) != FB_ACTIVATE_NOW)
>                 return 0;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
