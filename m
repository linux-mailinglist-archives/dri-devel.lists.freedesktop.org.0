Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B83D3FB842
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 16:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4839B89E57;
	Mon, 30 Aug 2021 14:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5A689E57
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 14:30:49 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id f6so8093235vsr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 07:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VgKhHizq2L8dQZoQcxBfufERxFjnVK3q48k2GBzHxbg=;
 b=UTnFQJIZFgWypJntdakjFYd/UFYcv/GPsPofenRAWn/6gDCx67R3XUmc9Du2Mw+9gI
 /yy74u47cCGc100kv8DtaTM0JuLs2oeExXx8+abOfGgFFhhim+Ns7ic/YIlt+UbEYdpL
 DQFszsmocHTsoJOqQQeV0noKxwicsX8mjFnd4mHUlQXx2PU1C0FP7mAST/xRqU4OlGTl
 yTqiYPlbYkEVhSRQVE0J2pgPwOiFdE3K28lvI2lwuZUVkv7+2GFbhWoUgIpy7gi+PKGk
 WHKU02WvWXo7+h9haK8VuZRPygCYgSqSDrMLfMuQ9ZSYzVXF7Qy16QWyKQr21OHOly2k
 W6FA==
X-Gm-Message-State: AOAM530oXPwR2a9mA9INfJHTYkjT74+i7VWfV8ljIC1wODakiux/SYyM
 S+SMJZafpg/2Rha6AEQrtBOA4/TE7w6PU5+It/g=
X-Google-Smtp-Source: ABdhPJwXrGuINMzmLOeLoNvKrXr8kded9JMrOcZu3G8T8pbvFnWwxXU9kXJU7O9Mej5MH/LuttPsiK2qv0RDHBrX1gw=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr14980584vsl.9.1630333847661; 
 Mon, 30 Aug 2021 07:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <CAMuHMdV=xVhEHLEoYt3OF+kmGrLOr6t7SP1sghSmp9JqXD+3Og@mail.gmail.com>
 <20210830130000.GW7722@kadam>
 <8ed0ca59-226b-2d0e-b1ae-82305202558d@i-love.sakura.ne.jp>
 <20210830134719.GI12231@kadam>
 <03d0f549-9731-8b06-1393-60d4bef27884@i-love.sakura.ne.jp>
In-Reply-To: <03d0f549-9731-8b06-1393-60d4bef27884@i-love.sakura.ne.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Aug 2021 16:30:36 +0200
Message-ID: <CAMuHMdXp7D02Z_Hs4wT9y4WeNzqdxHMgExiOzVauvpfgf4Veig@mail.gmail.com>
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 vga16fb_fillrect
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Randy Dunlap <rdunlap@infradead.org>, 
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

Hi Tetsuo,

On Mon, Aug 30, 2021 at 4:26 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2021/08/30 22:47, Dan Carpenter wrote:
> > On Mon, Aug 30, 2021 at 10:37:31PM +0900, Tetsuo Handa wrote:
> >> On 2021/08/30 22:00, Dan Carpenter wrote:
> >>>>> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> >>>>> index e2757ff1c23d..e483a3f5fd47 100644
> >>>>> --- a/drivers/video/fbdev/vga16fb.c
> >>>>> +++ b/drivers/video/fbdev/vga16fb.c
> >>>>> @@ -403,7 +403,7 @@ static int vga16fb_check_var(struct fb_var_screeninfo *var,
> >>>>>
> >>>>>         if (yres > vyres)
> >>>>>                 vyres = yres;
> >>>>> -       if (vxres * vyres > maxmem) {
> >>>>> +       if ((u64) vxres * vyres > (u64) maxmem) {
> >>>>
> >>>> Mindlessly changing the sizes is not the solution.
> >>>> Please use e.g. the array_size() helper from <linux/overflow.h>
> >>>> instead.
> >>>
> >>> On a 64bit system the array_size() macro is going to do the exact same
> >>> casts?  But I do think this code would be easier to understand if the
> >>> integer overflow check were pull out separately and done first:
> >>>
> >>>     if (array_size(vxres, vyres) >= UINT_MAX)
> >>>             return -EINVAL;
> >>
> >> This is wrong. array_size() returns ULONG_MAX on 64bits upon overflow and
> >> returns UINT_MAX on 32bits upon overflow. However, UINT_MAX is a valid
> >> value without overflow (e.g. vxres == UINT_MAX / 15 && vyres == 15).
> >
> > Huh...  I just assumed we didn't allow resolutions that high.
>
> Of course, we don't allow resolutions that high. ;-)
>
> Since I don't know possible max resolutions, I chose UINT_MAX + 1 as a common
> limit for returning -EINVAL. Unless overflow happens, vga16fb_check_var() will
> return -ENOMEM on such high resolutions.

The highest possible value of maxmem inside vga16fb_check_var()
is 65536.

So I believe

    if (array_size(vxres, vyres) > maxmem)

should work fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
