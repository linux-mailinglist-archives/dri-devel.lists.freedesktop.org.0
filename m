Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05272A2A60
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 13:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6557189DE1;
	Mon,  2 Nov 2020 12:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A86D89DE1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 12:07:29 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id g19so2921814otp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 04:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LWn+Kk/LR4CLIgSUL0WH6BKPKleAbhlLjsDWMUTt58o=;
 b=lg9NFnwUL8O+S/q2Y/Z5jUXe9xAbho2UtRjG/qnE/9j1ybnaQJdkhB0KHG4No8ibWv
 4CXGXZh1IDdXCMh5N0clKM2rJoNtQ4+lIoJlVUDnw4JQoHvZmeVELY+PQaDdBZDGqgOb
 yet0DBOZYQe/EmqgSMIEVT06GzlSnpGwJQLich9gs5j2TJLd7WHdHUj5bFhF2a4IWXRs
 Bij4h/4ebovpdlHChhuQ+o+96yNQ+LawlY3LiE8MfUuM7JSnOtrYXAXZQyvd8ROaPm9r
 16kDlReHou7MzcIWZOizY0fc2ONVyL89zUa2Lux7lM5WxP3PGVDVtHYdxPL3lIMfkkKC
 XQWA==
X-Gm-Message-State: AOAM531jMS11sJWzkSGWMxESLBnq2otf5oAZJjnQgMBORrQappENr5qF
 ykCKxsn6PCdjLNRcG9A04sBqjlE15H22XlTc+O8=
X-Google-Smtp-Source: ABdhPJyFypih8UMfOlykjPRwRHXVCVKB5c89XVgMwoQBxNZrG6+ay9sZCqu7sy7TriXcc4FKBnp9ZrBZI0G4QkAfnbY=
X-Received: by 2002:a9d:3b76:: with SMTP id
 z109mr11857209otb.250.1604318848768; 
 Mon, 02 Nov 2020 04:07:28 -0800 (PST)
MIME-Version: 1.0
References: <20201101102941.2891076-1-geert@linux-m68k.org>
 <20201101112915.GB1263673@ravnborg.org> <874km91by4.fsf@igel.home>
 <CAMuHMdUMF4R91Nt6mv9Tqz0zSaNh7AV8mghUoKL+uO-_PUH2aQ@mail.gmail.com>
 <87mu0014kn.fsf@igel.home>
 <CAMuHMdX4dferHsLJ_z7GOC3R=LxZMKUBvhE-ff+jtw2H8x2MtQ@mail.gmail.com>
 <87eelc127t.fsf@igel.home>
In-Reply-To: <87eelc127t.fsf@igel.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2020 13:07:17 +0100
Message-ID: <CAMuHMdUUzkCzr+BG+=adMr6iU5zD6D-C=wcHJekBDN_8wL359A@mail.gmail.com>
Subject: Re: [PATCH/RFC v2] video: fbdev: atari: Fix TT High video mode
To: Andreas Schwab <schwab@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andreas,

On Mon, Nov 2, 2020 at 11:29 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Nov 02 2020, Geert Uytterhoeven wrote:
> > But 95 MHz sounds too low to me, and doesn't match the monitor docs.
> > Given the TT runs at 32 MHz, 32 * 4 = 128 MHz sounds reasonable.
>
> Since it is not programmable, the actual value doesn't matter anyway.

It does, to implement fbdev mode rounding rules.

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
