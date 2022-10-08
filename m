Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545385F81ED
	for <lists+dri-devel@lfdr.de>; Sat,  8 Oct 2022 03:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E31F10E18E;
	Sat,  8 Oct 2022 01:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9775E10E18E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 01:29:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 880ACCE1926;
 Sat,  8 Oct 2022 01:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C01C433C1;
 Sat,  8 Oct 2022 01:29:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="F0WFV840"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665192550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2a2X1YlfkZ0pGgKe1BT3qPauqYJUuDonzfwdbODwUj0=;
 b=F0WFV8408bfDyb840yWHYb2sS5Uszq0PMkkmtmrVRBUNL2FY49DLuZ3A8VZX01cjH92PRw
 963/yLDTfSbPjK9v/cSx6ClQtvwOaP31xlyhs5+LtAOzyMXtRqv5atZ8HOk8wnFIOFKYJl
 weXSG5WPTsM48QIVGdJf4b19sbZPAzo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 08b122db
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sat, 8 Oct 2022 01:29:09 +0000 (UTC)
Date: Fri, 7 Oct 2022 19:28:59 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH v4 2/6] treewide: use prandom_u32_max() when possible
Message-ID: <Y0DSW4AAX/yA3CdI@zx2c4.com>
References: <20221007180107.216067-1-Jason@zx2c4.com>
 <20221007180107.216067-3-Jason@zx2c4.com>
 <Y0CXYjV8qMpJxxBa@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y0CXYjV8qMpJxxBa@magnolia>
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
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 x86@kernel.org, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org,
 KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com,
 "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Borislav Petkov <bp@alien8.de>, linux-nvme@lists.infradead.org,
 loongarch@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>,
 Thomas Graf <tgraf@suug.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 07, 2022 at 02:17:22PM -0700, Darrick J. Wong wrote:
> On Fri, Oct 07, 2022 at 12:01:03PM -0600, Jason A. Donenfeld wrote:
> > Rather than incurring a division or requesting too many random bytes for
> > the given range, use the prandom_u32_max() function, which only takes
> > the minimum required bytes from the RNG and avoids divisions.
> > 
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Reviewed-by: KP Singh <kpsingh@kernel.org>
> > Reviewed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> # for drbd
> > Reviewed-by: Jan Kara <jack@suse.cz> # for ext2, ext4, and sbitmap
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> 
> <snip, skip to the xfs part>
> 
> > diff --git a/fs/xfs/libxfs/xfs_alloc.c b/fs/xfs/libxfs/xfs_alloc.c
> > index e2bdf089c0a3..6261599bb389 100644
> > --- a/fs/xfs/libxfs/xfs_alloc.c
> > +++ b/fs/xfs/libxfs/xfs_alloc.c
> > @@ -1520,7 +1520,7 @@ xfs_alloc_ag_vextent_lastblock(
> >  
> >  #ifdef DEBUG
> >  	/* Randomly don't execute the first algorithm. */
> > -	if (prandom_u32() & 1)
> > +	if (prandom_u32_max(2))
> 
> I wonder if these usecases (picking 0 or 1 randomly) ought to have a
> trivial wrapper to make it more obvious that we want boolean semantics:
> 
> static inline bool prandom_bool(void)
> {
> 	return prandom_u32_max(2);
> }
> 
> 	if (prandom_bool())
> 		use_crazy_algorithm(...);
> 

Yea, I've had a lot of similar ideas there. Part of doing this (initial)
patchset is to get an intuitive sense of what's actually used and how
often. On my list for investigation are a get_random_u32_max() to return
uniform numbers by rejection sampling (prandom_u32_max() doesn't do
that uniformly) and adding a function for booleans or bits < 8. Possible
ideas for the latter include:

   bool get_random_bool(void);
   bool get_random_bool(unsigned int probability);
   bool get_random_bits(u8 bits_less_than_eight);

With the core of all of those involving the same batching as the current
get_random_u{8,16,32,64}() functions, but also buffering the latest byte
and managing how many bits are left in it that haven't been shifted out
yet.

So API-wise, there are a few ways to go, so hopefully this series will
start to give a good picture of what's needed.

One thing I've noticed is that most of the prandom_u32_max(2)
invocations are in debug or test code, so that doesn't need to be
optimized. But kfence does that too in its hot path, so a
get_random_bool() function there would in theory lead to an 8x speed-up.
But I guess I just have to try some things and see.

Anyway, that is a long way to say, I share you curiosity on the matter
and I'm looking into it.

Jason
