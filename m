Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BE1323B55
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 12:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360526E8B6;
	Wed, 24 Feb 2021 11:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6C66E8B6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 11:35:50 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id l3so2096254oii.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 03:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7g4KDGkN4bTV6Y86WxSYXBrPiMRP6Icmxr97tcDgIM=;
 b=aGNOMB9XR1qaXf1wxrCY3gbZ5riy3OUV1adN76kihGxSvIWjhOKD9/bPdN7yNsoh/Z
 U4KBDQCARf4yq3TR4kBMto+hmPr8I1OM7TQbJGImY7rHJ38FTkjJZk2z1+uKbMuqpgS4
 KD9Ah8DGy4nKwvp+JCueQzSj+ZEwN6IzBtZssTwBqYuVgpaFcayUdeBToePFSCwfVw17
 bHr3jE/BGASogiWRFIa7N/FOHWHUt/1zIgn1XPs0bhBD3nI5ndwQhRTMnkGWTUZK3n8i
 vRvyILURdMIelvqnVSNFBpPoB/hzH5FDKn3xg5DQGQ2kh2SGltm8kkFEsXwKV4VD/VcH
 Wbbw==
X-Gm-Message-State: AOAM533OM/+whWzr0jzqQccWNTlY8yVbAU6+XH4vR4A4RKg8f/tLVvP1
 Nabok+mDqJbQE2bPlDaWvlR9zkjzJuY0/ZUuML8=
X-Google-Smtp-Source: ABdhPJyyC3OgPRc8t7eL+A4bFMUBKjhhxC28ihqPvnbBLD0NPyTb8VvBUkXvZsvXDHxGs0xnf2E2wchLYsmgbSu4vZ0=
X-Received: by 2002:aca:d8c6:: with SMTP id p189mr2430015oig.54.1614166549412; 
 Wed, 24 Feb 2021 03:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20210220230248.320870-1-ztong0001@gmail.com>
 <ea1c5ff3-0b24-71c9-7a44-08b184c4854d@infradead.org>
 <CAA5qM4D0y9-gL7AAMQvtwrfJC_UvSTB5_S5PX3qkYSxHRUS-Qw@mail.gmail.com>
In-Reply-To: <CAA5qM4D0y9-gL7AAMQvtwrfJC_UvSTB5_S5PX3qkYSxHRUS-Qw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Feb 2021 12:35:37 +0100
Message-ID: <CAMuHMdWM5z-vKRwhCgJHjU-S_L0WR=avmDN-b8dN87b=rgi08w@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: pm2fb: avoid stall on fb_sync
To: Tong Zhang <ztong0001@gmail.com>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tong,

On Sun, Feb 21, 2021 at 1:05 AM Tong Zhang <ztong0001@gmail.com> wrote:
> On Sat, Feb 20, 2021 at 6:33 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > On 2/20/21 3:02 PM, Tong Zhang wrote:
> > > pm2fb_sync is called when doing /dev/fb read or write.
> > > The original pm2fb_sync wait indefinitely on hardware flags which can
> > > possibly stall kernel and make everything unresponsive.
> > > Instead of waiting indefinitely, we can timeout to give user a chance to
> > > get back control.
> >
> > Is this a real problem or theoretical?
> > Does someone still use this driver?
>
> I currently have this problem on my machine.
> I have submitted a revised patch -- which includes the console log.

Your machine is "QEMU Standard"?
Can this happen on real hardware, too, or is this a deficiency in QEMU,
which should be fixed there?

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
