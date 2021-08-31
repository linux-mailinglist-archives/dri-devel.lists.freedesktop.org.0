Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF7A3FCD1C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 20:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E5189568;
	Tue, 31 Aug 2021 18:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD1C89568
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 18:53:33 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 z1-20020a4a2241000000b0028e8dfb83b4so35078ooe.13
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 11:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K3WeVuI2Ie18d37UDwbFXiRTN6XtflUPlbndkkdnihc=;
 b=Fw6KBtGLD/jWglWRhsR/o4BZqgoEc6axGzFW2v+o9w0LIHT39bt8YL7h3Tz9WrzHj5
 wuClhCt0Mzh//bdKhWPGY4xZ9lq2K6S68RrqL+OGdRWe+DbyoWNmBh4Ld1LF03AkCDkh
 5eJBtcldjtHzWuPfbKf8QouJRnOZuVyzn3Dbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K3WeVuI2Ie18d37UDwbFXiRTN6XtflUPlbndkkdnihc=;
 b=phFNtcz0jlNXgBlK84yZVCPkK1/1Unt0ZkC1EBb6boM+q04sNKg/QW7TLPqVBU4oms
 0XYDmiR2qe8AWRBkJUbmSWaRk/Y8MzW53tg6Fu/TfG/bSW/SAdMw8UkLGwUx/r1hM9wv
 VTpLUUcpUvY567DqujwdKXqOpio5juIkcc0/Fj7JUQXocZYCOPNDxcs8zsJbacY45K+E
 B3TQ65imXAs3dk0k3mI66gdm5fEoGkYqnL1bOG73mkBPrv9ln1c1vZedXzORSeXHbzmd
 1nXET2inEHyb2ya34YeUxNScZLGjggSF9dMXC4bEpfJcSOLS+Cbf28UktDJ2XijKVHBA
 f4LQ==
X-Gm-Message-State: AOAM530eiwkOnn1bTuVhB2zcWNjoAqMotgawSaLdD8Rv8iDKmp6tNXcp
 bJvjoONw9zPQ5f4UO/rim3mcdHgDBXuEqpPe4OQD+A==
X-Google-Smtp-Source: ABdhPJyxNK7E5I3v65z4yphp0rFW9SBfjaG5Qv+6XKkbHiElJJdCebdvqr57TPyZWckcm3owXCsKyPmjeB6gUqbBBbg=
X-Received: by 2002:a4a:2549:: with SMTP id v9mr15539279ooe.28.1630436012777; 
 Tue, 31 Aug 2021 11:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org>
 <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
 <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
 <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
 <CAMuHMdWbSUGRGAVi-17C3hyDBZnGLAsmbAs+wXPHiCNWWLbMpA@mail.gmail.com>
In-Reply-To: <CAMuHMdWbSUGRGAVi-17C3hyDBZnGLAsmbAs+wXPHiCNWWLbMpA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 31 Aug 2021 20:53:21 +0200
Message-ID: <CAKMK7uF1cnen2UVWeOL164z1CCqOuRMC5SmM+5GvRvi7C-UOTw@mail.gmail.com>
Subject: Re: [PATCH] fbmem: don't allow too huge resolutions
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, Aug 31, 2021 at 7:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Handa-san,
>
> On Tue, Aug 31, 2021 at 5:24 PM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> > On 2021/08/31 15:48, Geert Uytterhoeven wrote:
> > > Furthermore, this restricts the virtual frame buffer size on 64-bit,
> > > too, while graphics cards can have much more than 4 GiB of RAM.
> >
> > Excuse me, but do you mean that some hardware allows allocating more than
> > UINT_MAX bytes of memory for kernel frame buffer drivers?
>
> While smem_len is u32 (there have been complaints about such
> limitations on 64-bit platforms as far as 10 years ago), I see no
> reason why a graphics card with more than 4 GiB of RAM would not be
> able to provide a very large virtual screen.
>
> Of course e.g. vga16fb cannot, as it is limited to 64 KiB.

The first gpus with 4GB or more memory started shipping in 2012. We're
not going to have fbdev drivers for these, so let's not invent code
for use-cases that aren't please.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
