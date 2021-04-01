Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A07FF3512D3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 11:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9786EC76;
	Thu,  1 Apr 2021 09:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E566EC76
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 09:56:02 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id e1so340088uaa.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 02:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YDXS92zPEjCpL7MJMbrT73u8MWdqrI408SBop4OgNb4=;
 b=SSZ04vIM9RXeRJ5dTzIiva8oAHfoxJAaOaqDbvoIu3ToqJOAvTeDdRfltsf6v2tKH8
 ZnDiYXe56T5/azAXsxsrQ9eb1JqbiD/ungYcnKiffKbC+ztAgln/knuwQ/ZFsn3/ykQ7
 5SH4MXWd3eYGIhlr32/f0AWIBWuO2tWyzEiFEHel9E8TJn41uQvUD2+7AYbGh+O5QwjJ
 eR1zqP+UYEdGGnBaLbAJpmV1K5bB8krWANMhkTOGBhoajg0Ui/6s8KFHXNI0cyWEWZRk
 Q1gpzqc6BmCFan44++2Rs63an3erAl6PA097XJFLmPS+Z3B/PMW6tEC81m+VSDnFcd+k
 7vKg==
X-Gm-Message-State: AOAM533iU5LxoC6fKDa9yAaYkyIy7QI0toZFu4O6HUYPieB2br2uMe96
 TLrbfCjpwy+yXHBaU1FNGlLJEW+Bzx+iCG7by4E=
X-Google-Smtp-Source: ABdhPJw3OSt8aNIPams9lW+tkRGTYrTBk/EgfCRROi8DV35dH66P0/bkhTWTHwVhx5OAEX8diuwcRf3DQ40g2O2+BYM=
X-Received: by 2002:ab0:64cf:: with SMTP id j15mr4124910uaq.4.1617270962087;
 Thu, 01 Apr 2021 02:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210331220719.1499743-1-phil@philpotter.co.uk>
In-Reply-To: <20210331220719.1499743-1-phil@philpotter.co.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Apr 2021 11:55:50 +0200
Message-ID: <CAMuHMdVh9JPZKphSi5+KR+BMJL7cQpVifrPBzhR3ees8QBhBXw@mail.gmail.com>
Subject: Re: [PATCH] zero-fill colormap in drivers/video/fbdev/core/fbcmap.c
To: Phillip Potter <phil@philpotter.co.uk>
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 1, 2021 at 12:09 AM Phillip Potter <phil@philpotter.co.uk> wrote:
> Use kzalloc() rather than kmalloc() for the dynamically allocated parts
> of the colormap in fb_alloc_cmap_gfp, to prevent a leak of random kernel
> data to userspace under certain circumstances.
>
> Fixes a KMSAN-found infoleak bug reported by syzbot at:
> https://syzkaller.appspot.com/bug?id=741578659feabd108ad9e06696f0c1f2e69c4b6e
>
> Reported-by: syzbot+47fa9c9c648b765305b9@syzkaller.appspotmail.com
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
