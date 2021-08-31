Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 489833FCB6A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 18:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B3F6E029;
	Tue, 31 Aug 2021 16:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B6D6E029
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 16:20:20 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so23492239otg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 09:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Nxjd5f4FQP+iuJdlCMMXyBCT1vbYwVqlZ+8XK9fwdQ=;
 b=J72jUYPDy5vSnEPtLJff6zOJWiJ8rBr7sxb0kJeX18yOKAaIgyhAtBo/RdbLgqvVbT
 +NJL+5U10HnPXrjROQSfIq3yQ6aZ5hP7SRh9gkLZO6vO2kx9nWceTIE8S2OJrVUDTDvy
 XSY+zI9ptht4vdGw7GKMLV5oX50v6/cjMOekM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Nxjd5f4FQP+iuJdlCMMXyBCT1vbYwVqlZ+8XK9fwdQ=;
 b=LVkoH5f91D2lPqklmXlepUvFDIpXbkMGmvN9cz7GfbnnOELAJoWdy+ASyXcVifi2jM
 uqZaP/7O8P9X4sYJ5w48Fv/XTA+V92TKLVWiHajb+LbYI8gLY38nng9PuiDV3EBpAI9u
 zV0hqQW1kMCmP4GSppPbAKU2nKlg+YiFasXyvd2NkBnjSMcV25DoONRgzryUc6bUyeku
 mJvuHc+oLzumAySmbbldzpJ5WfTdyMwUBPW3TwaKpJLNPuKhtL42wirgZ0NCjDKyHHph
 ww8oWPPnWMGFKEIMn8h7hB98sRrUgSZSXDKZfUr53kmj1pwLLwK2RaT0KWf6v/naylUS
 tz3g==
X-Gm-Message-State: AOAM530Cd29BKA2eY4TTuxFGK4dPfIR6qHbSww334eB/9lTGHDYHrner
 6HLmiCeg0xBXOrwKwNVSMdx7TCRJPpcpm67NQXWH8A==
X-Google-Smtp-Source: ABdhPJwStM5dJA6wjR+VVbKMzJ3V+gw9bRn26N055U5GnWbinAi7zEmvwJCmKgB5Hcu7VTrZr/ZjSHHRE3i3ciIrmVE=
X-Received: by 2002:a9d:65da:: with SMTP id z26mr24499621oth.303.1630426820214; 
 Tue, 31 Aug 2021 09:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org>
 <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
 <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
 <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
In-Reply-To: <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 31 Aug 2021 18:20:09 +0200
Message-ID: <CAKMK7uEbvUjskYmobK1g-iA++LeQvfUUik=ZJtrHh0+TdjE7+A@mail.gmail.com>
Subject: Re: [PATCH] fbmem: don't allow too huge resolutions
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
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

On Tue, Aug 31, 2021 at 5:24 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2021/08/31 15:48, Geert Uytterhoeven wrote:
> > Furthermore, this restricts the virtual frame buffer size on 64-bit,
> > too, while graphics cards can have much more than 4 GiB of RAM.
>
> Excuse me, but do you mean that some hardware allows allocating more than
> UINT_MAX bytes of memory for kernel frame buffer drivers?
>
> > IMHO that should be fixed in vga16fb, too.
>
> According to https://elixir.bootlin.com/linux/v5.14/A/ident/fb_check_var ,
> there are 89 files. Randomly picking up drivers/video/fbdev/udlfb.c as
> an example. dlfb_is_valid_mode() from dlfb_ops_check_var() is doing
>
>   if (mode->xres * mode->yres > dlfb->sku_pixel_limit)
>     return 0;
>   return 1;
>
> where max dlfb->sku_pixel_limit seems to be 2048 * 1152 but I think we need
> same overflow check. I want to avoid patching individual modules if possible.
> That depends on whether some hardware needs to allocate more than UINT_MAX
> bytes of memory.

Yeah basic input validation makes no sense to push into each driver.
That's just asking that most of the fbdev drivers will never be fixed.

Same for not-so-basic input validation, if there's no driver that
actually needs the flexibility (like the virtual vs physical size
thing that's floating around maybe).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
