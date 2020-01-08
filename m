Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC37133CA5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60DC89BC0;
	Wed,  8 Jan 2020 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37D489BC0;
 Wed,  8 Jan 2020 08:08:06 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id c77so1886042oib.7;
 Wed, 08 Jan 2020 00:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X9lAK3bszh6tWp/dVwz4gJZ7NIZBKvl8mgEWhJz1N9U=;
 b=NnkJS9Gugads9XC1oieJkiwxm7xAdqSCphczdbjNQWq/+lT1DLz/xziibWAgU4DFQK
 Px2eS0TQX8l3hEklAQnXcUKkfegivrflg91ZYlWqBGDSFKNRmjgi+dDI7tWeG/cICOsU
 3c5J2Jc0sPP8xtWld/XAuSaCR2q0/jz/TEmAKHVMqRwr3vXs9GyuDJ9Tzu6rg8edzbXh
 HLQ7sJWzVTeDtIj5PYDsqDQoZwiAKbcA7VdAOomM6N2MxFOrIVSy2TUY7TVHtMx7ZIVD
 79YU9sjqE6u0Vf0tKOwOYdFX6OtCcxRDTlHpGsJsVtx40M/cjMMXHEKRJiEAR1G4Xcxz
 oT3Q==
X-Gm-Message-State: APjAAAXpEbN82XfHgdNLBAStGa+FLrkDVoIR6L385GuYsp0xKkqo3TZb
 dwk+AIgcyviCkhwMNZu86mKJkiH/qdhUlmQuerQ=
X-Google-Smtp-Source: APXvYqyHxa8fgIJDObTLOZ73RoRUdvNM74muiuZsOkTaJvwYlT+0s8R5nYIen4AoxoDKsD4fs/oquvfeWacJQ1YKaqA=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr1987025oia.148.1578470885935; 
 Wed, 08 Jan 2020 00:08:05 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-1-git-send-email-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2020 09:07:54 +0100
Message-ID: <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The ioread8/16/32() and others have inconsistent interface among the
> architectures: some taking address as const, some not.
>
> It seems there is nothing really stopping all of them to take
> pointer to const.

Shouldn't all of them take const volatile __iomem pointers?
It seems the "volatile" is missing from all but the implementations in
include/asm-generic/io.h.

> Patchset was really tested on all affected architectures.
> Build testing is in progress - I hope auto-builders will point any issues.
>
>
> Todo
> ====
> Convert also string versions (ioread16_rep() etc) if this aproach looks OK.
>
>
> Merging
> =======
> The first 5 patches - iomap, alpha, sh, parisc and powerpc - should probably go
> via one tree, or even squashed into one.

Yes, they should be squashed, cfr. Arnd's comment.
I also wouldn't bother doing the updates in patches 6-10.

The rest looks good to me.
Thanks a lot!

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
