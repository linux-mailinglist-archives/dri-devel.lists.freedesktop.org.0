Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549A83FC2D9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 08:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7038489AC3;
	Tue, 31 Aug 2021 06:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186E789AC3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 06:49:07 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id g34so112155vkd.11
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 23:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zKUmgc5HsRuZ5PLjImhWvj4wVvW9mMCLXiQ/PKtOxMo=;
 b=C2yH2rR0LfJqODzwcmOCCufMIMdbxYhU4jNQ8VStVcWEVznX7ulT6LhXh10YHE1Dzu
 NJTK81890htcCoJQJIX9LfeQaaxkJ7OMm4K68yQXoDccDHQ+6gqG/OGLlaWxBKJEvdFt
 6K52xT0GwmfMJCggfnZdyxxw4HSBNaBZ73hzfDWLudiQBbW6BCJGI8yqcCPZ/vhZ1Tc1
 tJodUT+0tioMz9jiBbLqLRcDjLzSnZNF4RxpCMJKaKqa1et2Hyoy5vvT5MChmy+WCTWQ
 4lLeb+nlOL1vd/h2BUNYH8ctRet7cnnEjuBledfEI3h0wWAqRL5pw0/EkbMSbqa941DX
 cb3Q==
X-Gm-Message-State: AOAM530n4QSw2zGGMnBN7RcdRWsbqcNhy8REw8SLha7N0a6++ErTswMo
 NV3zhADOAyYEiUinXyLmXWn8cItXbWDbZFxyxMI=
X-Google-Smtp-Source: ABdhPJzEoZFw11dTEebUr/ZL3MQASD4gZXPDPDil0jflTrPULArVww18ZayyTQn/pA0/lqVcrURes38hVPnfukRK4Xc=
X-Received: by 2002:a1f:738f:: with SMTP id o137mr16613429vkc.2.1630392546165; 
 Mon, 30 Aug 2021 23:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org>
 <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
In-Reply-To: <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Aug 2021 08:48:53 +0200
Message-ID: <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
Subject: Re: [PATCH] fbmem: don't allow too huge resolutions
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, 
 syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin King <colin.king@canonical.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 syzkaller-bugs@googlegroups.com, Randy Dunlap <rdunlap@infradead.org>
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

Thanks for your patch!

On Mon, Aug 30, 2021 at 6:05 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> syzbot is reporting page fault at vga16fb_fillrect() [1], for
> vga16fb_check_var() is failing to detect multiplication overflow.
>
>   if (vxres * vyres > maxmem) {
>     vyres = maxmem / vxres;
>     if (vyres < yres)
>       return -ENOMEM;
>   }

IMHO that should be fixed in vga16fb, too.

> Since no module would accept too huge resolutions where multiplication
> overflow happens, let's reject in the common path.
>
> This patch does not use array_size(), for array_size() is allowed to
> return UINT_MAX on 32bits even if overflow did not happen. We want to
> detect only overflow here, for individual module will recheck with more
> strict limits as needed.

Which is IMHO not really an issue, as I believe on 32-bit you cannot
use a very large frame buffer, long before you reach UINT_MAX.

> Link: https://syzkaller.appspot.com/bug?extid=04168c8063cfdde1db5e [1]
> Reported-by: syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>
> Debugged-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Tested-by: syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>
> ---
>  drivers/video/fbdev/core/fbmem.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 1c855145711b..9f5075dc2345 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1008,6 +1008,11 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>         if (var->xres < 8 || var->yres < 8)
>                 return -EINVAL;
>
> +       /* Don't allow u32 * u32 to overflow. */
> +       if ((u64) var->xres * var->yres > UINT_MAX ||
> +           (u64) var->xres_virtual * var->yres_virtual > UINT_MAX)
> +               return -EINVAL;
> +

I think it would still be better to use check_mul_overflow(), as that
makes it clear and explicit what is being done, even without a comment.

Furthermore, this restricts the virtual frame buffer size on 64-bit,
too, while graphics cards can have much more than 4 GiB of RAM.

>         ret = info->fbops->fb_check_var(var, info);
>
>         if (ret)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
