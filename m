Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8781D3FD44A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 09:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27DF6E12A;
	Wed,  1 Sep 2021 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE336E12A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 07:12:58 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id k124so649559vke.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 00:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5OIZaaJOxzSwlBAyVUTzzSJStZdPh3eIjP+iaY26uus=;
 b=T8GcoEZQpWCJ/SqJDPVHfVszrar+t0waTnRjNLirfGFSpszU+ebaITwIC+/Je3Cnio
 P0F3xUR9ujKDVhamuastlo2OgNew7JAZEUYLPe09fieaR54NkvrLgiDChrWFpkfstkDD
 26ddIBwFVEANoZW7DOq64kIgJfeyuT1aoyFKetNHHC/sCZh0HgRh3S12ejEJl2v+X7CO
 gHEFahQ2iUlcc7lLOiJ1z/tFZO/gQln8xhWQlFeEn1173LjxRe7IvbH3yy+R2LFkQNoP
 cVokXjpB7KieX3N3dKh/wq7LD+Yu9pBKMkaqu7X5YdohQaMKmzbM7NNWIej9r8qP8a6v
 XJyQ==
X-Gm-Message-State: AOAM532FiSAdiJTwBWOhqra8AJlJr5QaNTNLioJn5IokGjqaP6OMSAHi
 M3n2iWXyefYINBrP1WEpIoAPRXOE9jNKjsyAPao=
X-Google-Smtp-Source: ABdhPJwQRLNOZObA78mZsGR2waDSEdFHfN+IPMckzWjh/Ic7JlwZtxoUt2HD8opLWAKvAPdjb/g3GaV+9/HP/TK9CG8=
X-Received: by 2002:a1f:2c97:: with SMTP id s145mr20725423vks.24.1630480377050; 
 Wed, 01 Sep 2021 00:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org>
 <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
 <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
 <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
 <CAMuHMdWbSUGRGAVi-17C3hyDBZnGLAsmbAs+wXPHiCNWWLbMpA@mail.gmail.com>
 <CAKMK7uF1cnen2UVWeOL164z1CCqOuRMC5SmM+5GvRvi7C-UOTw@mail.gmail.com>
 <CAMuHMdWNYaZxZB0Td4PFb76rrtQMumKu6cJgLi2aNnW-9NmG8A@mail.gmail.com>
 <CAKMK7uHuOQWUnsiH00QFbHKgTdjjryK0ra9We2stojXMiAVgJA@mail.gmail.com>
 <750ed1ae-de80-b232-4aea-79d60c212fab@i-love.sakura.ne.jp>
In-Reply-To: <750ed1ae-de80-b232-4aea-79d60c212fab@i-love.sakura.ne.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Sep 2021 09:12:45 +0200
Message-ID: <CAMuHMdX_AM4Dg-5d9D5M=7V-PjGQZ6hYWWMmhTc4tvuq_PcdDg@mail.gmail.com>
Subject: Re: [PATCH v2] fbmem: don't allow too huge resolutions
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
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Randy Dunlap <rdunlap@infradead.org>
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

On Wed, Sep 1, 2021 at 3:15 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> syzbot is reporting page fault at vga16fb_fillrect() [1], for
> vga16fb_check_var() is failing to detect multiplication overflow.
>
>   if (vxres * vyres > maxmem) {
>     vyres = maxmem / vxres;
>     if (vyres < yres)
>       return -ENOMEM;
>   }
>
> Since no module would accept too huge resolutions where multiplication
> overflow happens, let's reject in the common path.
>
> Link: https://syzkaller.appspot.com/bug?extid=04168c8063cfdde1db5e [1]
> Reported-by: syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>
> Debugged-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
