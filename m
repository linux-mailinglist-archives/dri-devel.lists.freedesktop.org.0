Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E555FAAF7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 05:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FCA10E484;
	Tue, 11 Oct 2022 03:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B19B10E484
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 03:00:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD5A76106D;
 Tue, 11 Oct 2022 03:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207E1C433D6;
 Tue, 11 Oct 2022 03:00:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="HINC5krz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665457216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qirw48xc/tsq9oJ9bN2wDgpC7gkOILHLI1FFvZKjy0g=;
 b=HINC5krzVlg2RfBkI+DN4TfkkfdILG81+nGbG6H3ymULtvrDJBAAPyivNN5Ks6xLTRDgBj
 St0npOJIqnMiQJAEsME6hn8HSGUVr7vaSgTvTLlUyVWoppp8tjC9zJyq6/W2qkBuApVnBr
 cXYoav/TXzo4IDNClYviVzHvX/Qex3Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a7ccddd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 11 Oct 2022 03:00:16 +0000 (UTC)
Date: Mon, 10 Oct 2022 21:00:08 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Elliott, Robert (Servers)" <elliott@hpe.com>
Subject: Re: [PATCH v6 3/7] treewide: use get_random_{u8,u16}() when
 possible, part 1
Message-ID: <Y0TcOH/BDfg5c1gj@zx2c4.com>
References: <20221010230613.1076905-1-Jason@zx2c4.com>
 <20221010230613.1076905-4-Jason@zx2c4.com>
 <MW5PR84MB18421AC962BE140DDEB58A8BAB239@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MW5PR84MB18421AC962BE140DDEB58A8BAB239@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
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
 Vignesh Raghavendra <vigneshr@ti.com>,
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
 Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Heiko Carstens <hca@linux.ibm.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
 Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 01:18:40AM +0000, Elliott, Robert (Servers) wrote:
> 
> > diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> ...
> > @@ -944,7 +944,7 @@ static void generate_random_bytes(u8 *buf, size_t count)
> >  	default:
> >  		/* Fully random bytes */
> >  		for (i = 0; i < count; i++)
> > -			buf[i] = (u8)prandom_u32();
> > +			buf[i] = get_random_u8();
> 
> Should that whole for loop be replaced with this?
>     get_random_bytes(buf, count);

Wow, that's kind of grotesque. Yea, it certainly should. But that's
beyond the scope of this patchset. I'll send a follow-up patch just for
this case to Herbert after this cleanup lands, though.

Jason
