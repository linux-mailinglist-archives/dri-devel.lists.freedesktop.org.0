Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120A23FB890
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 16:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1642E892BC;
	Mon, 30 Aug 2021 14:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74584892BC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 14:53:35 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id x23so7968190uav.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 07:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oOeLbxt57qZfv/yH8g9lzPrCzif+fnGpjQ2ymjIQjIU=;
 b=tpA2akE0wz0ENGtUSLmjaUqdbRjl8bh5nlKIaX5DybQ1CtM7kWTB8lwAgY3xnFfajf
 NqvA9XIwzbpXlG+T1iViFUwb/dPjxWj+YjGoQ8YRwbJSxARPhb23LzTu3DGwdbXPrsPm
 HO8PdcwJdWqmNGEK517nhLd0GqkL9knixhG0JJtYxLAbR+2QAaTBLY6UkdzOdBC+xZFZ
 gwYwjrWBZhRoayFGuqr2XgIzEOIGg0WxyBMCFROQbiTxN08uDnrl1QKwSRdVxikERaA3
 YUP+Fs3EnTbtUWxhm6qX1p/F3Cuup/lEZkNlfrDtQM6+CVZku8oAP7wZnZW4OCgid4BL
 34sA==
X-Gm-Message-State: AOAM531f8pENsefBGaD3vOlkU208FFnbkGdpT78KDoKsJfBmurKIjfD+
 yjaORdswoNzKDV6WNnWr2o/D8BUeWk0VASPRUTk=
X-Google-Smtp-Source: ABdhPJwmIV0qCAzV0q/OlL0uB0+VpSyYfMSp3r7kqu0hk1TSfG7YyjO/GNRUbbaJH49YxcrYEA7rPFV89kbYrCQkZKU=
X-Received: by 2002:ab0:209a:: with SMTP id r26mr15004025uak.14.1630335214663; 
 Mon, 30 Aug 2021 07:53:34 -0700 (PDT)
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
In-Reply-To: <ba78b9a5-08a5-36d3-7c6f-e26ee239d92f@i-love.sakura.ne.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Aug 2021 16:53:23 +0200
Message-ID: <CAMuHMdWLTPBatefOgdVpfcqQoBw-D1F-_+-+23WdoQfwBcrz6A@mail.gmail.com>
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

On Mon, Aug 30, 2021 at 4:38 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2021/08/30 23:30, Geert Uytterhoeven wrote:
> > The highest possible value of maxmem inside vga16fb_check_var()
> > is 65536.
>
> Yes.
>
> >
> > So I believe
> >
> >     if (array_size(vxres, vyres) > maxmem)
> >
> > should work fine.
>
> My intent is to check at common path than individual module so that we don't
> need to add same check to every module. Same approach is proposed at
> https://lkml.kernel.org/r/1630294223-7225-1-git-send-email-tcs_kernel@tencent.com .

Which I believe is wrong.
Thanks for the pointer, I will reply to the actual patch...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
