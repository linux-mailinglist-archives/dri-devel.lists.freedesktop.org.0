Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482FB3C5B2D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 13:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9887789B38;
	Mon, 12 Jul 2021 11:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4BE89B38
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 11:16:30 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id h5so9919823vsg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 04:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wb2gUE9RppEYjBtkun4RSMhw4ORgLmf2nLZuAw7U5rs=;
 b=l1f61JrswH3y6T8eB2u0WUZ1EFQfyg1q2t4eMbOATayZUfpSuP3KW7qGNyY7G08Bex
 qPf9dy2t62OSkvrfC8QfgPvYxe4zfsw9JffIm5pgpKgjQdiVUDvL0No7DgpPsUQD7n3m
 jJxnPL4tqIHX+/pLf/R02sW0IfebHIPd2Hiqf9b/24BfIRo6Pn0MVysZp1iSqx+jq9mk
 yuj3LjIgLQY6m5o8skSobH0Cm22oG7KmfEC5YRAbQZwSiiqYZUXtqiUrID6KJR0KZBto
 3CYI3lAfoiR6KrEGhf/fpYHS4bmVwr7yaFxokZTgTJvrZz/N4KtKYqY+S0r3+O+8gA78
 pZ+A==
X-Gm-Message-State: AOAM532HoOshE9q7zXwzty6R56y/fIi7glESuRlBayS0RA+d5v/30UK7
 Xf1fM31i1nbJcKkqCUt4pT97A60QJL59Pi6AZ1E=
X-Google-Smtp-Source: ABdhPJz0UtKPrQqYn0Fh3Lvo66wMSx+CxMp4eWOcF50Zng7y+eFTenh5uXzhQL0cCTFvRF5k0AF5lklpAfR2sB4/kAY=
X-Received: by 2002:a67:f98c:: with SMTP id b12mr47329347vsq.40.1626088588696; 
 Mon, 12 Jul 2021 04:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210709010055.86663-1-someguy@effective-light.com>
 <CAMuHMdWhs4en-yR9ic+d4V9M_0BUFX40rP0M=tZRGMaUy2wv3g@mail.gmail.com>
 <UBYZVQ.O83H1QJFD7TX@effective-light.com>
In-Reply-To: <UBYZVQ.O83H1QJFD7TX@effective-light.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jul 2021 13:16:17 +0200
Message-ID: <CAMuHMdUpGDarCkvAxe1V0c4kn68dHZozdDOq+Tyx9qsCWWZU6w@mail.gmail.com>
Subject: Re: [PATCH] fbcon: garbage collect fbdev scrolling acceleration
To: Hamza Mahfooz <someguy@effective-light.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jing Xiangfeng <jingxiangfeng@huawei.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>, Peilin Ye <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hamza,

On Fri, Jul 9, 2021 at 11:28 PM Hamza Mahfooz
<someguy@effective-light.com> wrote:
> On Fri, Jul 9 2021 at 09:49:02 AM +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > Bummer, more code to revert to re-enable acceleration in the _56_
> > fbdev drivers using acceleration (some of them unusable without),
> > despite commit 39aead8373b3 claiming "No other driver supportes
> > accelerated fbcon"...
> Should they be refactored to DRM drivers? (I don't mind looking into it
> if you believe it's worthwhile.)

Probably some of them can be converted.
Others must wait for DRM to gain e.g. more "low color" support
(plus whatever other dead bodies to be found during the conversion).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
