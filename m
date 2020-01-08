Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26181133CEC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100186E869;
	Wed,  8 Jan 2020 08:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3306E196;
 Wed,  8 Jan 2020 08:16:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05D8020838;
 Wed,  8 Jan 2020 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578471367;
 bh=rJ6JYIGpzKdoDYXHO08q9UAkcS9JLwVuqyxgj7z6uFE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MkwH+3HkDf6s4f9UKMt0j3Yl68sYcovyitDwcZpCHeRNjfXvyP43W0pQEzIL5IC+w
 aBar8tImI2nbpit8mmPjPSR8+0RwgOJ9/SVVIDrK7xO2Eu6wG+pemFk9N++KW5kzE4
 p5mT60k4jBuix/ZvOoWmnjiIgd4PWx8KCVGOrzro=
Received: by mail-lf1-f54.google.com with SMTP id m30so1736285lfp.8;
 Wed, 08 Jan 2020 00:16:06 -0800 (PST)
X-Gm-Message-State: APjAAAWXFTjreih+98BpbGiGOrabFRfgqWACsPtJAAqyUnWShxaJadbb
 M2BqjSbeFa4woDtaufpxUXneT9uxgWAyR83VwBU=
X-Google-Smtp-Source: APXvYqzyctxfRgINTLWoapcTorSxrwMRpnKV5L9AyMA5cZ3MIwnHpgXp0xHUle0Z4Qdrv46T+HnJLWxMDUPl2bIDDVM=
X-Received: by 2002:ac2:5dc7:: with SMTP id x7mr2134684lfq.24.1578471362796;
 Wed, 08 Jan 2020 00:16:02 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
In-Reply-To: <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 8 Jan 2020 09:15:50 +0100
X-Gmail-Original-Message-ID: <CAJKOXPffZDPz6nAf8fGc-k76KiNWc2KXKJxkWuWjeDtEm1tTHA@mail.gmail.com>
Message-ID: <CAJKOXPffZDPz6nAf8fGc-k76KiNWc2KXKJxkWuWjeDtEm1tTHA@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Wed, 8 Jan 2020 at 09:08, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Krzysztof,
>
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

It's kind of separate issue although I could squash it to limit
redundant changes.

> > Patchset was really tested on all affected architectures.

I just spot an error in my first message. I wanted to say:
"Patchset was NOT really tested on all affected architectures."

Obviously.


> > Build testing is in progress - I hope auto-builders will point any issues.
> >
> >
> > Todo
> > ====
> > Convert also string versions (ioread16_rep() etc) if this aproach looks OK.
> >
> >
> > Merging
> > =======
> > The first 5 patches - iomap, alpha, sh, parisc and powerpc - should probably go
> > via one tree, or even squashed into one.
>
> Yes, they should be squashed, cfr. Arnd's comment.
> I also wouldn't bother doing the updates in patches 6-10.

Indeed, thanks for comments.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
