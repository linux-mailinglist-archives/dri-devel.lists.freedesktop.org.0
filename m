Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD23FB4E3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 14:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D325F89C94;
	Mon, 30 Aug 2021 12:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59DB89C94
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 12:00:33 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id l24so7653948uai.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 05:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=11pv2ckVVYJo0g4/dbYTk5+xKODOJ86Wt8N4FuAzkzw=;
 b=bnZH1VggcPfs8Fe4YFGxjKTSjkxu700ZoLVz+8CNjtpeZTN+/bGbzKRQ54IOm7snl4
 QCT2O6yqRHjy/zgojb7Bst1btih9p5VcccX2fV85ftRPdJUU/oajnW7HpcgiQYrt1Eu1
 FAetmjyMCn4QPGrh7yE/hf+x/sJVJjLC82m2B3ev3tsIfa5AufEotijI3o4H7BSmG5we
 PS8GEWcBF+3cEzPy007cn4FSx8IvoTBilKfF2qx1eXw/6+W9V2Nwtt7waiBem/hOczE3
 1pzYnO8O+gvH57++I6IzpQACnOuOd96dcY4mKQ2njqQfYp70efISwXa25Z0vPvAc9U52
 PJ0w==
X-Gm-Message-State: AOAM533MnH2hNbw0ghkHSj5s8R1v81vntxN1JWokFCfgtT8z5wP9mLmc
 xB6aV1XyFoKSD4XZsXQqsSpmMbWiKXEa52IECtU=
X-Google-Smtp-Source: ABdhPJx00PUliqMVjy2+H+sP6oRkhmzsJ7PVLxQZrrTPRL/WUVNKSBJfsgZ5OfJP//LA62PgPuSisoNK8onZSU+t6oM=
X-Received: by 2002:ab0:6887:: with SMTP id t7mr14100361uar.114.1630324832645; 
 Mon, 30 Aug 2021 05:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
In-Reply-To: <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Aug 2021 14:00:21 +0200
Message-ID: <CAMuHMdV=xVhEHLEoYt3OF+kmGrLOr6t7SP1sghSmp9JqXD+3Og@mail.gmail.com>
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 vga16fb_fillrect
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
 syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin King <colin.king@canonical.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, syzkaller-bugs@googlegroups.com
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

Hi Testsuo,

On Mon, Aug 30, 2021 at 4:27 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2021/08/30 9:24, Randy Dunlap wrote:
> > Note that yres_virtual is set to 0x10000000. Is there no practical limit
> > (hence limit check) that can be used here?
> >
> > Also, in vga16fb_check_var(), beginning at line 404:
> >
> >   404        if (yres > vyres)
> >   405            vyres = yres;
> >   406        if (vxres * vyres > maxmem) {
> >   407            vyres = maxmem / vxres;
> >   408            if (vyres < yres)
> >   409                return -ENOMEM;
> >   410        }
> >
> > At line 406, the product of vxres * vyres overflows 32 bits (is 0 in this
> > case/example), so any protection from this block is lost.
>
> OK. Then, we can check overflow like below.
>
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> index e2757ff1c23d..e483a3f5fd47 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -403,7 +403,7 @@ static int vga16fb_check_var(struct fb_var_screeninfo *var,
>
>         if (yres > vyres)
>                 vyres = yres;
> -       if (vxres * vyres > maxmem) {
> +       if ((u64) vxres * vyres > (u64) maxmem) {

Mindlessly changing the sizes is not the solution.
Please use e.g. the array_size() helper from <linux/overflow.h>
instead.

>                 vyres = maxmem / vxres;
>                 if (vyres < yres)
>                         return -ENOMEM;
>
> But I think we can check overflow in the common code like below. (Both patch fixed the oops.)
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 1c855145711b..8899679bbc46 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1008,6 +1008,11 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>         if (var->xres < 8 || var->yres < 8)
>                 return -EINVAL;
>
> +       /* Don't allow u32 * u32 to overflow. */
> +       if ((u64) var->xres * var->yres > (u64) UINT_MAX ||
> +           (u64) var->xres_virtual * var->yres_virtual > (u64) UINT_MAX)
> +               return -EINVAL;
> +

Same comment here, of course.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
