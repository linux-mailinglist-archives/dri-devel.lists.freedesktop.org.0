Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 435BE5F88A1
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 02:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAFA10E482;
	Sun,  9 Oct 2022 00:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F2C10E476
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 00:26:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 525F760B3A
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 00:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B903C43146
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 00:26:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="eXcn74ON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665275187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7zZXtzJcFLYkSrXJJYKIVFffp4v7t60F00p3NU1sSks=;
 b=eXcn74ONvMPA9ryxT/a7aYIuja8VAvsA7PuDEGzhdmUJfRXYr75ikGVRouYkjysBLHUqM6
 bmtziGf54vTRtEdjIHOQYcbNdVpfP7hpYiyLhRuXMv/QimXPGPuUWPxNUtYVovTrbZM9V8
 8mlE3AMCNacUB8Fh8IylFdp9kN3UapQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 38d2b356
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <dri-devel@lists.freedesktop.org>;
 Sun, 9 Oct 2022 00:26:27 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-35711e5a5ceso73462107b3.13
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Oct 2022 17:26:26 -0700 (PDT)
X-Gm-Message-State: ACrzQf1sR9dNR65fEgq0QVVtMBLRqiMRefopf3eDuafNlp+6BI57XF6y
 fzTkPlCQtWcZIAHxZ3jq4OxercpMXpAZRdFngOA=
X-Google-Smtp-Source: AMsMyM7Ghd+rNLLkdUe772S1SZ8rADl1G6UAF0aO2TFON1i86eRArx6SOwts50zdZDWmmLpyXWt8nLKkLulPCRn4G5w=
X-Received: by 2002:ab0:70b9:0:b0:3d7:84d8:35ae with SMTP id
 q25-20020ab070b9000000b003d784d835aemr6771029ual.24.1665275171232; Sat, 08
 Oct 2022 17:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221007180107.216067-1-Jason@zx2c4.com>
 <20221007180107.216067-5-Jason@zx2c4.com>
 <f1ca1b53bc104065a83da60161a4c7b6@AcuMS.aculab.com>
 <Y0H7rcJ3/JOyDYU8@zx2c4.com>
In-Reply-To: <Y0H7rcJ3/JOyDYU8@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 8 Oct 2022 18:26:00 -0600
X-Gmail-Original-Message-ID: <CAHmME9ojgUnrp+Mys3pzJZ=0C7RHbgsm-wOkWk-GdW2dnJwf8g@mail.gmail.com>
Message-ID: <CAHmME9ojgUnrp+Mys3pzJZ=0C7RHbgsm-wOkWk-GdW2dnJwf8g@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] treewide: use get_random_u32() when possible
To: David Laight <David.Laight@aculab.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "x86@kernel.org" <x86@kernel.org>,
 Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 KP Singh <kpsingh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Yury Norov <yury.norov@gmail.com>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 Heiko Carstens <hca@linux.ibm.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Florian Westphal <fw@strlen.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Chuck Lever <chuck.lever@oracle.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 8, 2022 at 4:37 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Sat, Oct 08, 2022 at 10:18:45PM +0000, David Laight wrote:
> > From: Jason A. Donenfeld
> > > Sent: 07 October 2022 19:01
> > >
> > > The prandom_u32() function has been a deprecated inline wrapper around
> > > get_random_u32() for several releases now, and compiles down to the
> > > exact same code. Replace the deprecated wrapper with a direct call to
> > > the real function. The same also applies to get_random_int(), which is
> > > just a wrapper around get_random_u32().
> > >
> > ...
> > > diff --git a/net/802/garp.c b/net/802/garp.c
> > > index f6012f8e59f0..c1bb67e25430 100644
> > > --- a/net/802/garp.c
> > > +++ b/net/802/garp.c
> > > @@ -407,7 +407,7 @@ static void garp_join_timer_arm(struct garp_applicant *app)
> > >  {
> > >     unsigned long delay;
> > >
> > > -   delay = (u64)msecs_to_jiffies(garp_join_time) * prandom_u32() >> 32;
> > > +   delay = (u64)msecs_to_jiffies(garp_join_time) * get_random_u32() >> 32;
> > >     mod_timer(&app->join_timer, jiffies + delay);
> > >  }
> > >
> > > diff --git a/net/802/mrp.c b/net/802/mrp.c
> > > index 35e04cc5390c..3e9fe9f5d9bf 100644
> > > --- a/net/802/mrp.c
> > > +++ b/net/802/mrp.c
> > > @@ -592,7 +592,7 @@ static void mrp_join_timer_arm(struct mrp_applicant *app)
> > >  {
> > >     unsigned long delay;
> > >
> > > -   delay = (u64)msecs_to_jiffies(mrp_join_time) * prandom_u32() >> 32;
> > > +   delay = (u64)msecs_to_jiffies(mrp_join_time) * get_random_u32() >> 32;
> > >     mod_timer(&app->join_timer, jiffies + delay);
> > >  }
> > >
> >
> > Aren't those:
> >       delay = prandom_u32_max(msecs_to_jiffies(xxx_join_time));
>
> Probably, but too involved and peculiar for this cleanup.
>
> Feel free to send a particular patch to that maintainer.

I guess the cocci patch looks like this, so maybe I'll put that in 1/7
if I respin this.

@@
expression E;
identifier get_random_u32 =~ "get_random_int|prandom_u32|get_random_u32";
typedef u64;
@@
- ((u64)(E) * get_random_u32() >> 32)
+ prandom_u32_max(E)
