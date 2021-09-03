Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC883FF895
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 03:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A846E839;
	Fri,  3 Sep 2021 01:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AD46E839
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 01:09:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id x11so8660472ejv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 18:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gd2E/Pl/C0iRwR3hxdHVkR2H3jQVrFOHkTXAIcMx9So=;
 b=hos4NkT51fiFcBY57hEeTVQaFRW4FOP4pR2h+DPAvgnPHi63S/YPrVoFvI5dKoCffc
 OiicE1MLsCuDbBIlnwfHXn89PB4ZgVDWB0Rg5fotdwJibGx01HcPZ6kVIOmCsPkxkXeu
 BmoYS7dB8vrLkAl1eNbZRyWZZYJVnJyhPfWJOUk8UbDJwwtpcuKcqNBrZlgHZ7c4AXvn
 MMIpLat1dhDzQXl6EeaotT/f2AIuiCT6XtdAt5jPpr8NtrAuE+izPjW1pb9Rw5Sm5L7h
 510AQ+D2qhiuhtIAMXynlpVXe1L1ELZiw2/cTDjEOQgEFEO+uQZdogABeCtDDfAcPBMN
 4dMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gd2E/Pl/C0iRwR3hxdHVkR2H3jQVrFOHkTXAIcMx9So=;
 b=tGOlPXEx93VYwVlyI7GiyTDZSO90yA8bspeWv9BZvnqZkCfeszXP30JvC+oqoqajrY
 INTcZ4WkLBi0mGJAaA1qL7RgCC5gXa0cJiqb/72QG+ypDMWpe/tCZBSzreCjFijcvdHd
 7b+dlBwr7tdLedzlaF9fUXsJCOL+D9oTnmYygASbnWkqRsVNQ2Z4iflsiy4i5u0xpBwz
 MleMR9gmeFIErQNK37NA+HOfvu0fqYy7x7ltvtSoXzWh6QBGkelaPBkXfJ4KTPLVKe9w
 knQAzfv5TMlIR2WJ1AQGYmJFwpt3yuCxb1xnKfvc9Ug/YahHEHsaQbyYZ9VdLjHwKeYP
 KzkQ==
X-Gm-Message-State: AOAM533N+T6NC5RVx/dKbcsJsMcNeLsKuSH7LRzXN/NggtK5SeOr7fni
 aZrOQFMcldNSBxS79CD5YnWNwb3TVyrCfMzLMHA=
X-Google-Smtp-Source: ABdhPJxQUW7pz+w3kHrnLXwXO9K7bT20swTyi0GJXxEfubexYEGopC9Wz2mqd2HHOynHT3ga/FjTxH0PVSC8LUbx1wo=
X-Received: by 2002:a17:907:3393:: with SMTP id
 zj19mr1097188ejb.535.1630631372347; 
 Thu, 02 Sep 2021 18:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210902060213.1702544-1-mudongliangabcd@gmail.com>
 <CAMuHMdVPUMGZ7Sq2rBgr+US0H3ZF4WVkfPPnKQD1cMg5Wd0+-w@mail.gmail.com>
In-Reply-To: <CAMuHMdVPUMGZ7Sq2rBgr+US0H3ZF4WVkfPPnKQD1cMg5Wd0+-w@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Fri, 3 Sep 2021 09:09:03 +0800
Message-ID: <CAD-N9QVngAyEszUViVCaaCeC2Q-71qqdWC1yqXD3a5inGQCA6w@mail.gmail.com>
Subject: Re: [PATCH 4.19] fbmem: add margin check to fb_check_caps()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 George Kennedy <george.kennedy@oracle.com>, 
 syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com, 
 Dan Carpenter <dan.carpenter@oracle.com>,
 Dhaval Giani <dhaval.giani@oracle.com>, Sasha Levin <sashal@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Thu, Sep 2, 2021 at 9:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Dongliang,
>
> On Thu, Sep 2, 2021 at 8:04 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> > [ Upstream commit a49145acfb975d921464b84fe00279f99827d816 ]
>
> Oops, looks like I missed when that one was submitted for review...

This patch cannot directly apply to old stable trees. Maybe that's the reason.

>
> > A fb_ioctl() FBIOPUT_VSCREENINFO call with invalid xres setting
> > or yres setting in struct fb_var_screeninfo will result in a
> > KASAN: vmalloc-out-of-bounds failure in bitfill_aligned() as
> > the margins are being cleared. The margins are cleared in
> > chunks and if the xres setting or yres setting is a value of
> > zero upto the chunk size, the failure will occur.
> >
> > Add a margin check to validate xres and yres settings.
>
> Shouldn't (the caller of) bitfill_aligned() be fixed instead?
> Can this be triggered by e.g. using the mini_4x6 font?

I am sorry. I don't know much detail about this subsystem. I just
found syzkaller can still trigger this bug in linux-4.19.

Combined with the bug information, I found this patch is not merged
into the old kernel trees. So I send this patch rebased on linux-4.19.
Also I have tested it on linux-4.14 and below.

>
> > Note that, this patch needs special handling to backport it to linux
> > kernel 4.19, 4.14, 4.9, 4.4.
> >
> > Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> > Reported-by: syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com
> > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Cc: Dhaval Giani <dhaval.giani@oracle.com>
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Link: https://patchwork.freedesktop.org/patch/msgid/1594149963-13801-1-git-send-email-george.kennedy@oracle.com
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  drivers/video/fbdev/core/fbmem.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index 84845275dbef..de04c097d67c 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -991,6 +991,10 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
> >                         goto done;
> >                 }
> >
> > +               /* bitfill_aligned() assumes that it's at least 8x8 */
> > +               if (var->xres < 8 || var->yres < 8)
> > +                       return -EINVAL;
>
> Are you sure there don't exist such small displays (e.g. OLED)?
>
> > +
> >                 ret = info->fbops->fb_check_var(var, info);
> >
> >                 if (ret)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
