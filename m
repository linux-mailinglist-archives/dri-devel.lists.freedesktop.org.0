Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912C3DBD7A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 19:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A756E2D7;
	Fri, 30 Jul 2021 17:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCFF6E2D7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 17:08:16 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id r17so19234327lfe.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IV0tGa4+rpa0rWOKVy/RYqy1amnye8o4Jt6/b1EaRas=;
 b=C6FDsp9eo10MPB7h8sanJV5aN6A87Y6zvnhf4hLt8eXrk78vLYzMazC5TtOgLlOPY3
 q6Wjzc5G5DyLh+vBan4K/J3UkTpZk9Zz/tHyBwnmFN/5EodvKdl6FgMiGT62DUfWqlrJ
 CFHjvaoGeKrAtFractG9IPE4H024PaEN1hckYzkwZnlXcachhpXtQresnwHmLQ0ksg0x
 p4P3NNHOEMKY3qWIjd6qDKsCUDG0PnpKpr+TSZhFKtwgJbg2c8ef3I8Cpfsg3xrToL0H
 UgZn5Pr4DGCnZ1C0lX3+OMlNp5SKFXq2/hs7zv3T1TgDMiYGIhUNHql1vz9SGCm5BHse
 xWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IV0tGa4+rpa0rWOKVy/RYqy1amnye8o4Jt6/b1EaRas=;
 b=CoVwwtzVZcNR2ASZWyON/6Aa0WLWg25oixmjSk0kbVW05HE7EEXICPYt/6rWP/fTef
 +lX8kQj+9+Ge/jP2YreErKDYBQuXZqNfJp05m1SVYwh8jMkXYg6aZEqU74FIh/P8OslK
 +B+qwIf7d9wnFB9+0WwkM0LYJNy74ufpt+jjBWtIcYxGwygaRrjRegEgI0aQWwoZxQWs
 iANm2+pl2bsHCoBnD6QgSJE+lky4fMd83uFwcf5SrgmpONxTCkol+/MiM7cl6ad1Noh9
 Zmw68n1QT6elVdLZkNk450yigBMO24lIk9rpj7klRfOtSGjoMXU8YtnP/pnChj8Lam3j
 mnaA==
X-Gm-Message-State: AOAM531cJUStbQ9hbjjYX+pbQuH2QGFQYGeeqMHsU8J/h+95tVZuSRqy
 vfxpxkVLEJIlY+KSrCQOorBjuXZXkGnDs5sY8HhQBA==
X-Google-Smtp-Source: ABdhPJzj9IdxPOohHA8FDaGlITftqmCvtv1eT7HQAjqzz+pi/C9CDaOH613bJIBrdNXKsY/3pslb8syNjswLKo9CXgk=
X-Received: by 2002:a05:6512:32aa:: with SMTP id
 q10mr2512533lfe.368.1627664894662; 
 Fri, 30 Jul 2021 10:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210727205855.411487-2-keescook@chromium.org>
 <20210728085921.GV5047@twin.jikos.cz> <20210728091434.GQ1931@kadam>
 <c52a52d9-a9e0-5020-80fe-4aada39035d3@acm.org> <20210728213730.GR5047@suse.cz>
 <YQJDCw01gSp1d1/M@kroah.com> <20210729082039.GX25548@kadam>
 <202107291952.C08EAE039B@keescook> <20210730083845.GD5047@suse.cz>
 <20210730090054.GX1931@kadam> <202107300937.C7016A82@keescook>
In-Reply-To: <202107300937.C7016A82@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 30 Jul 2021 10:08:03 -0700
Message-ID: <CAKwvOdmtKszUS0-OyGMHuhqjyXQC_283KOQOouWWtimYCvsAoA@mail.gmail.com>
Subject: Re: [PATCH 01/64] media: omap3isp: Extract struct group for memcpy()
 region
To: Kees Cook <keescook@chromium.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, dsterba@suse.cz, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-hardening@vger.kernel.org, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev, 
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 clang-built-linux@googlegroups.com, nborisov@suse.com
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

On Fri, Jul 30, 2021 at 9:44 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Jul 30, 2021 at 12:00:54PM +0300, Dan Carpenter wrote:
> > On Fri, Jul 30, 2021 at 10:38:45AM +0200, David Sterba wrote:
> > > Then is explicit memset the only reliable way accross all compiler
> > > flavors and supported versions?
> > >
> >
> > The = { } initializer works.  It's only when you start partially
> > initializing the struct that it doesn't initialize holes.
>
> No, partial works. It's when you _fully_ initialize the struct where the
> padding doesn't get initialized. *sob*

I'm pretty sure that this has more to do with whether or not the
compiler applies SROA then observes uses of the individual members or
not.

>
> struct foo {
>         u8 flag;
>         /* padding */
>         void *ptr;
> };
>
> These are fine:
>
> struct foo ok1 = { };
> struct foo ok2 = { .flag = 7 };
> struct foo ok3 = { .ptr = NULL };
>
> This is not:
>
> struct foo bad = { .flag = 7, .ptr = NULL };
>
> (But, of course, it depends on padding size, compiler version, and
> architecture. i.e. things remain unreliable.)
>
> --

-- 
Thanks,
~Nick Desaulniers
