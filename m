Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBEF3FB8A6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 17:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAB489971;
	Mon, 30 Aug 2021 15:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52A589971
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 15:01:02 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id m19so10735697vsj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u13jY3wSZM31fcmpr4GBs3113ESNVPQ9w7zIuFDRtqA=;
 b=TdIZejpdrDnVG/+pKfUsJTsoo7a9Y3CxJxv1x1C5yF7c88iUzHlTNZEDx0HF6J/tvt
 5yHZVg37U0Z0ZMf7wKVSI7ayHXBFbYePrKtdbYNVexDDK1Vf0STgDzLLM8NVp7O6UeMM
 dacYrQoBnrTTv66nQHWMA5jaCVQDKihgmbwcsx4XC1niOlI9n9elexgYbJaWNB+FQ3rB
 vK+SaN6qy2vIBk0IO/H08dltue2ANSqrhNbmXBO1HPLMuqcxPqao5CC+jCXwbqJuqrvs
 lUCGan6TTj4q1paeuPzt08CFLCXR08BD2cL3EMM7RorfHuy761oKSl3cx4SdB/MLY/Ob
 9U0A==
X-Gm-Message-State: AOAM531Slnfiac3LT0CafaxZv1RYkZoxXKd5gNqGOljrWz07JE3oCPZ3
 29tArz7B7ktA8MsrcFGUcs+8QA2rmE7PQXZ3/1A=
X-Google-Smtp-Source: ABdhPJycXkCL/LhUbLlVUIVrKZgwucuUJ5aj2ffNWq+81tLkWAXOEw1KSPDM3UaKy+3i0pGmd6eAWJNnwA27a2ky+cc=
X-Received: by 2002:a67:c789:: with SMTP id t9mr15437109vsk.60.1630335661896; 
 Mon, 30 Aug 2021 08:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <CAMuHMdV=xVhEHLEoYt3OF+kmGrLOr6t7SP1sghSmp9JqXD+3Og@mail.gmail.com>
 <20210830130000.GW7722@kadam>
 <8ed0ca59-226b-2d0e-b1ae-82305202558d@i-love.sakura.ne.jp>
 <20210830134719.GI12231@kadam>
 <03d0f549-9731-8b06-1393-60d4bef27884@i-love.sakura.ne.jp>
 <CAMuHMdXp7D02Z_Hs4wT9y4WeNzqdxHMgExiOzVauvpfgf4Veig@mail.gmail.com>
 <ba78b9a5-08a5-36d3-7c6f-e26ee239d92f@i-love.sakura.ne.jp>
 <CAMuHMdWLTPBatefOgdVpfcqQoBw-D1F-_+-+23WdoQfwBcrz6A@mail.gmail.com>
In-Reply-To: <CAMuHMdWLTPBatefOgdVpfcqQoBw-D1F-_+-+23WdoQfwBcrz6A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Aug 2021 17:00:49 +0200
Message-ID: <CAMuHMdUtjd7Uf9VPEEztL+raasLdRqfMN55S8B8Nqoh0vxuk1g@mail.gmail.com>
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

On Mon, Aug 30, 2021 at 4:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Aug 30, 2021 at 4:38 PM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> > On 2021/08/30 23:30, Geert Uytterhoeven wrote:
> > > The highest possible value of maxmem inside vga16fb_check_var()
> > > is 65536.
> >
> > Yes.
> >
> > >
> > > So I believe
> > >
> > >     if (array_size(vxres, vyres) > maxmem)
> > >
> > > should work fine.
> >
> > My intent is to check at common path than individual module so that we don't
> > need to add same check to every module. Same approach is proposed at
> > https://lkml.kernel.org/r/1630294223-7225-1-git-send-email-tcs_kernel@tencent.com .
>
> Which I believe is wrong.
> Thanks for the pointer, I will reply to the actual patch...

Upon second look, that patch is not really wrong, as the check happens
after calling into info->fbops->fb_check_var().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
