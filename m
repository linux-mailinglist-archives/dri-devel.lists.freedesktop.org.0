Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D2C5F6B9A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 18:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1B410E837;
	Thu,  6 Oct 2022 16:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 27673 seconds by postgrey-1.36 at gabe;
 Thu, 06 Oct 2022 16:24:46 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DDD10E836
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 16:24:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 449B31F8C8;
 Thu,  6 Oct 2022 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665073484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mV/oM0ZFOSmZTr1tEI8al4WRLOksCnyDL+Y/DEXpI5s=;
 b=UpMGEnz8udfBQaYQea0RFWIGZLHq8VrOBgj52x/KJxgkfQbo9PUL5p/nyS4etrbrvNMKPh
 fN+XR3CloFKxtP83fRcyxMOWd16CNTY3lAy3rTchPXbCFCZFdCtXDbZGLw+MfNvd/rijOp
 IR8XPzPF4ITG5zf8YYhr11pLUpwah5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665073484;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mV/oM0ZFOSmZTr1tEI8al4WRLOksCnyDL+Y/DEXpI5s=;
 b=otxfHmXsbtMwOZmz0I8Sc9DZTAJO3Yvah3UhZWsIjZrjcfaHEUVz0PTrY55kP5B1vaKkmm
 X6r81foYz4EqG0Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0561F13AC8;
 Thu,  6 Oct 2022 16:24:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dJZHAUwBP2MOIwAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 06 Oct 2022 16:24:44 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 7D4DEA06E9; Thu,  6 Oct 2022 18:24:43 +0200 (CEST)
Date: Thu, 6 Oct 2022 18:24:43 +0200
From: Jan Kara <jack@suse.cz>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 1/5] treewide: use prandom_u32_max() when possible
Message-ID: <20221006162443.b66waqsxlntfeoek@quack3>
References: <20221006132510.23374-1-Jason@zx2c4.com>
 <20221006132510.23374-2-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006132510.23374-2-Jason@zx2c4.com>
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
 Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, KP Singh <kpsingh@kernel.org>,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, "H . Peter Anvin" <hpa@zytor.com>,
 Andreas Noever <andreas.noever@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Hugh Dickins <hughd@google.com>, kasan-dev@googlegroups.com,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Yury Norov <yury.norov@gmail.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 linux-nvme@lists.infradead.org, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jens Axboe <axboe@kernel.dk>,
 Theodore Ts'o <tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>,
 linux-kernel@vger.kernel.org,
 Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>,
 Thomas Graf <tgraf@suug.ch>, Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 06-10-22 07:25:06, Jason A. Donenfeld wrote:
> Rather than incurring a division or requesting too many random bytes for
> the given range, use the prandom_u32_max() function, which only takes
> the minimum required bytes from the RNG and avoids divisions.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: KP Singh <kpsingh@kernel.org>
> Reviewed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

for the ext2, ext4, and lib/sbitmap.c bits.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
