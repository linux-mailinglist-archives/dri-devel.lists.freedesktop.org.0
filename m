Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F03FCC3B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 19:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75566E086;
	Tue, 31 Aug 2021 17:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9DC6E086
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 17:19:40 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id d6so124696vsr.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 10:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UMOX2To1IEOY2ZnzUeCxb0+BBk/jcmCPbhrdDzxJbcg=;
 b=nk396mGmiStqAA3qvD2bczCi0HNpqRDYYx1EZBXDTqtGgqFxbmrC43phUmJbbXrgT+
 v6Cw1HMYSPIO7Hfr2rOZuvqm9XF5+byV9wSXoJDs9BxTKgWFYKURCbTsUMUX5vYiAYUn
 Q5vlVHIBvStX/RfB0EXw3kMysXzN0oPQw83CxQ/b2c8LTIe/uengAVh6xg2N3XVai3DT
 HxsBPmlL/07nogyEAxl0jfDK/YADIMDtuq+7axHBQOmOntmTDMRhzMaNq3ZXw28AAvyt
 S6dOgiPJUtPwP1yKbWvep1KwYq2hOaDm+ZUEEoH1siMa/eUFcs7ASf34OIc91cQDjGTY
 VoDw==
X-Gm-Message-State: AOAM531Q/pw4jQBqmMLakUvdF2Z5v6BAV0E7WYgcPToHDlYPA/oiIc2g
 q9/imUNe/r5+eXhf+x2NIoeOxQ+zCUyDJMnU/VA=
X-Google-Smtp-Source: ABdhPJzwIcYtEYXT+4ELrSXZhc7SGBnDBykZ6QWPifjhJFCJ02Jh+wK9QnEW6KWY0HcJvsALfiP7/h+mMWcZEJ7eWpI=
X-Received: by 2002:a67:c789:: with SMTP id t9mr20435604vsk.60.1630430379297; 
 Tue, 31 Aug 2021 10:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org>
 <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
 <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
 <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
In-Reply-To: <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Aug 2021 19:19:27 +0200
Message-ID: <CAMuHMdWbSUGRGAVi-17C3hyDBZnGLAsmbAs+wXPHiCNWWLbMpA@mail.gmail.com>
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

Hi Handa-san,

On Tue, Aug 31, 2021 at 5:24 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2021/08/31 15:48, Geert Uytterhoeven wrote:
> > Furthermore, this restricts the virtual frame buffer size on 64-bit,
> > too, while graphics cards can have much more than 4 GiB of RAM.
>
> Excuse me, but do you mean that some hardware allows allocating more than
> UINT_MAX bytes of memory for kernel frame buffer drivers?

While smem_len is u32 (there have been complaints about such
limitations on 64-bit platforms as far as 10 years ago), I see no
reason why a graphics card with more than 4 GiB of RAM would not be
able to provide a very large virtual screen.

Of course e.g. vga16fb cannot, as it is limited to 64 KiB.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
