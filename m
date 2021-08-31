Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A6D3FCD1E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 20:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626BC89803;
	Tue, 31 Aug 2021 18:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B0589803
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 18:56:39 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id p14so406373vsm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 11:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0hrVR/Pp4bY5ExwU3CuX6SzlhALUUdWlYKXEp50Y348=;
 b=MyYAqZF4gi78hGhVVP/PL2X49K9e0GlEILuZtyMEt3hB9eTS1mC96GAlvhYdRelRke
 oc/WQjFf4YVv30Wmnxq+2jGip2mWiQi2Q55CitM9vMjqt9g3JirhJO+/9Na/9DZrqnke
 sSRrQ25d4G4Y9Z/xMMhF4wjsvvHAHvbznzxACrRaMsQ5W/bNDvxTmoxOpekga+npHMwP
 7hdJft+9tZ2YeUQ6uzsTcmH1k9KF7wH6uCTrras7WCWnldZzHg16Jl3cyuaxebgkHfwV
 r4DmlsvkBGvLFAXeg5C2HdfiCC+yItSSj0uQhNR4ghMkWShEI6TekaPPBa6QgEQ3YRQF
 UiFw==
X-Gm-Message-State: AOAM531sD4idnAv42hC90CHERwitIr+eoc/8d22WkeSSvIQJ55S7tbuW
 bGoaOG2Pr5pdiTyLFsIlpe55RtGD5hD65al1jQs=
X-Google-Smtp-Source: ABdhPJz9v59KKZoqK9rLnaHapES3XW5DBPdu8VPOELGOeHWSav0EGFF40rmu9oSffgZtAtzQvdPp23duhz+ykWeWZKU=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr20702000vsl.9.1630436198992; 
 Tue, 31 Aug 2021 11:56:38 -0700 (PDT)
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
In-Reply-To: <CAKMK7uF1cnen2UVWeOL164z1CCqOuRMC5SmM+5GvRvi7C-UOTw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Aug 2021 20:56:27 +0200
Message-ID: <CAMuHMdWNYaZxZB0Td4PFb76rrtQMumKu6cJgLi2aNnW-9NmG8A@mail.gmail.com>
Subject: Re: [PATCH] fbmem: don't allow too huge resolutions
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
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

Hi Daniel,

On Tue, Aug 31, 2021 at 8:53 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Tue, Aug 31, 2021 at 7:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Aug 31, 2021 at 5:24 PM Tetsuo Handa
> > <penguin-kernel@i-love.sakura.ne.jp> wrote:
> > > On 2021/08/31 15:48, Geert Uytterhoeven wrote:
> > > > Furthermore, this restricts the virtual frame buffer size on 64-bit,
> > > > too, while graphics cards can have much more than 4 GiB of RAM.
> > >
> > > Excuse me, but do you mean that some hardware allows allocating more than
> > > UINT_MAX bytes of memory for kernel frame buffer drivers?
> >
> > While smem_len is u32 (there have been complaints about such
> > limitations on 64-bit platforms as far as 10 years ago), I see no
> > reason why a graphics card with more than 4 GiB of RAM would not be
> > able to provide a very large virtual screen.
> >
> > Of course e.g. vga16fb cannot, as it is limited to 64 KiB.
>
> The first gpus with 4GB or more memory started shipping in 2012. We're
> not going to have fbdev drivers for these, so let's not invent code
> for use-cases that aren't please.

This code path is used with fbdev emulation for drm drivers, too,
right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
