Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF1133CE3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD8F6E86D;
	Wed,  8 Jan 2020 08:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0EA6E875;
 Wed,  8 Jan 2020 08:12:59 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r9so2711607otp.13;
 Wed, 08 Jan 2020 00:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fbJJB3WrQSG/aLI6W0tp/gWGqaTYGmXXjnwzN3HgNmk=;
 b=qdTpxl0B8tpckunh05AN+xm33/kFPB6iFJa9FcVKYA2pe9G3UEygHuzQZewAwkMKmi
 4eg/loTfPE41PmhsTbJ2l0PvNrrqI6jdWS1AvwYO/lwLW32wp87aXwA4puMsoA8cVbaj
 1njE/dwvkL7EBXJYJSe/GFYntNWSVa3He7Gsmf7RoJeLlFshqhwhZ7VkMBOmJZVdSuWE
 5IwFImDJRP7S4FzNeySOa1l4VLADOzkSkPxh+SQEoZlOFfWEqsIacqKZYnTKRSEkHaGR
 gZhf4epWzj6Ih7Tb9S0SmwCZjHQqm05UHygnvUGzfnwZdFUAI9/+qqvSbb7+u9SFSIR4
 jrcw==
X-Gm-Message-State: APjAAAUM68oKodmgL2tlRe2E2pK87+U0EeAT8ycZQBeETU2qqMMsbZPX
 2Scd15JSqv5DJfuKs+/R4AMY0aqsR30OXjjG3yQ=
X-Google-Smtp-Source: APXvYqwmH7m1+9vDxuev+5inhGSC6vEDnCL0sxcZGlshqWSwfptz4C63wHebnfbZQpKCDEbUG2A5rdvMjyOud7C+JPk=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr3308976ots.250.1578471178824;
 Wed, 08 Jan 2020 00:12:58 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
In-Reply-To: <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2020 09:12:47 +0100
Message-ID: <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
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

On Wed, Jan 8, 2020 at 9:07 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > The ioread8/16/32() and others have inconsistent interface among the
> > architectures: some taking address as const, some not.
> >
> > It seems there is nothing really stopping all of them to take
> > pointer to const.
>
> Shouldn't all of them take const volatile __iomem pointers?
> It seems the "volatile" is missing from all but the implementations in
> include/asm-generic/io.h.

As my "volatile" comment applies to iowrite*(), too, probably that should be
done in a separate patch.

Hence with patches 1-5 squashed, and for patches 11-13:
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
