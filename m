Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447A23207C1
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 01:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B666E8DD;
	Sun, 21 Feb 2021 00:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034F56E8DD
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 00:00:42 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id a7so9576594iok.12
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 16:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eyv75EVqtjc5sQV9MZqlAZakzRqPKcB25AWLRe+93L4=;
 b=EeEEtR5leYnNT9Sg+XnH3v351ZDvCxVEBjBfcUET5qi1u/cmUQkdNKI9mUIlJo7Q3s
 5UIS16soeZu9Ggp3Y/TUbOFBgxAZLL1YthsBzdJVSC9gsOZ25285t5TXzbPw6rJ4cQ4L
 DSkculSrmw7+55COZVPqPw/oOsYis1xq41wYAaeGtUQTsdf0k3oxsg7B90zktWnb7ort
 dhA86+BOwdVgoapWJ/Jxm3KZshiESGcd0tRtyPguIWBOH+l6ECeu2WMk000w0ldrYUP9
 4Rqaq/Eiz3bclqRUoBwzKxxPIutKWSfmiSGUC0j+XoIfVBNJ+LoxTRZqRQAbXi6x1DpW
 H75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eyv75EVqtjc5sQV9MZqlAZakzRqPKcB25AWLRe+93L4=;
 b=mvTA6wMOuLZnJsBtUc6BNlYETtyN9RFVELYMcljpRBet2oAYTU1QsJajmtofoAYvln
 6hQ7FpNlXYn5CzYFvbNB+sP2glZHYHoJFdj14bj22LRVL4i7+m7BmnhcZZGh4XWyztbP
 M/ndBKXoqNvbwMbcxrpytFeQRVSpjEpYQ0IC9isZKXGj/cYUdpTMZgm55YivQnlroAFE
 NGEdBq5OSCJrK0eGzZjpO4ZuUjK+JuHmYl0Z7rYkROKHHUJk1v3IwfInUxNXEoEfCGwD
 zmqCLwDWxp2tIaOYtNqbua2hziDWzte+hxiv2nhvf2+DB+f+d6PwIXji1BXiYWKhugAk
 72Vw==
X-Gm-Message-State: AOAM532Fb5M39zBY920sG8S6ATOOQVbVN20uzhDctQR0cGaG3mV/hS6Q
 KwJPEAU4e92defY2/EN7FEi49J/jh2PMWqi2SK0=
X-Google-Smtp-Source: ABdhPJz3rxxFjCPyN29YDDBIIwzFQM+arC6T2FY7bbj046hdU3CXgyZf6jieSBzvW96n+pRuJB+O6FpE2+XZRZLta08=
X-Received: by 2002:a6b:8dcc:: with SMTP id p195mr9669717iod.74.1613865642373; 
 Sat, 20 Feb 2021 16:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20210220230248.320870-1-ztong0001@gmail.com>
 <ea1c5ff3-0b24-71c9-7a44-08b184c4854d@infradead.org>
In-Reply-To: <ea1c5ff3-0b24-71c9-7a44-08b184c4854d@infradead.org>
From: Tong Zhang <ztong0001@gmail.com>
Date: Sat, 20 Feb 2021 19:00:31 -0500
Message-ID: <CAA5qM4D0y9-gL7AAMQvtwrfJC_UvSTB5_S5PX3qkYSxHRUS-Qw@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: pm2fb: avoid stall on fb_sync
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,
Thanks for the comment.
I currently have this problem on my machine.
I have submitted a revised patch -- which includes the console log.
Thanks!
- Tong

On Sat, Feb 20, 2021 at 6:33 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi--
>
> On 2/20/21 3:02 PM, Tong Zhang wrote:
> > pm2fb_sync is called when doing /dev/fb read or write.
> > The original pm2fb_sync wait indefinitely on hardware flags which can
> > possibly stall kernel and make everything unresponsive.
> > Instead of waiting indefinitely, we can timeout to give user a chance to
> > get back control.
>
> Is this a real problem or theoretical?
> Does someone still use this driver?
>
>
> > Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> > ---
> >  drivers/video/fbdev/pm2fb.c | 29 ++++++++++++++++++++++++++---
> >  1 file changed, 26 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
> > index 27893fa139b0..8578c64a0c54 100644
> > --- a/drivers/video/fbdev/pm2fb.c
> > +++ b/drivers/video/fbdev/pm2fb.c
> > @@ -183,12 +183,23 @@ static inline void pm2v_RDAC_WR(struct pm2fb_par *p, s32 idx, u32 v)
> >
> >  #ifdef CONFIG_FB_PM2_FIFO_DISCONNECT
> >  #define WAIT_FIFO(p, a)
> > +#define WAIT_FIFO_TIMEOUT(p, a) (0)
> >  #else
> >  static inline void WAIT_FIFO(struct pm2fb_par *p, u32 a)
> >  {
> >       while (pm2_RD(p, PM2R_IN_FIFO_SPACE) < a)
> >               cpu_relax();
> >  }
> > +static int inline void WAIT_FIFO_TIMEOUT(struct pm2fb_par *p, u32 a)
>
> drop      void       ^^^
> It's already "int".
> Did you compile this?
>
> > +{
> > +     int timeout = 10000;
> > +     while (pm2_RD(p, PM2R_IN_FIFO_SPACE) < a) {
> > +             cpu_relax();
> > +             if (--timeout==0)
>
> spaces around ==
>
> > +                     return 1;
> > +     }
> > +     return 0;
> > +}
> >  #endif
> >
> >  /*
> > @@ -1031,15 +1042,27 @@ static int pm2fb_blank(int blank_mode, struct fb_info *info)
> >  static int pm2fb_sync(struct fb_info *info)
> >  {
> >       struct pm2fb_par *par = info->par;
> > +     int timeout_sync = 10000;
> > +     int timeout_fifo;
> >
> > -     WAIT_FIFO(par, 1);
> > +     if (WAIT_FIFO_TIMEOUT(par, 1))
> > +             goto end;
> >       pm2_WR(par, PM2R_SYNC, 0);
> >       mb();
> >       do {
> > -             while (pm2_RD(par, PM2R_OUT_FIFO_WORDS) == 0)
> > +             timeout_fifo = 10000;
> > +             while (pm2_RD(par, PM2R_OUT_FIFO_WORDS) == 0) {
> >                       cpu_relax();
> > -     } while (pm2_RD(par, PM2R_OUT_FIFO) != PM2TAG(PM2R_SYNC));
> > +                     if (--timeout_fifo==0)
>
> spaces around ==
>
> > +                             goto end;
> > +             }
> > +             if (pm2_RD(par, PM2R_OUT_FIFO) == PM2TAG(PM2R_SYNC))
> > +                     break;
> > +     } while (--timeout_sync>0);
>
> spaces around >
>
> >
> > +end:
> > +     if ((!timeout_sync) || (!timeout_fifo))
> > +             printk_ratelimited(KERN_WARNING "pm2fb: sync timeout!\n");
> >       return 0;
> >  }
> >
> >
>
>
> thanks.
> --
> ~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
