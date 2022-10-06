Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328E75F6AD7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 17:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6F710E5C9;
	Thu,  6 Oct 2022 15:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615DA10E405
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 15:40:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4379B8210E;
 Thu,  6 Oct 2022 15:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD3CC433C1;
 Thu,  6 Oct 2022 15:40:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kBRHEGDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665070829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UErKVaJQCmz0JpPdH7ldbL7h3QJYSFC93QhEFTHl6oU=;
 b=kBRHEGDVb4SxSdQZmxiLlvgZp8K/L39m7Aawd9FrMpHZqd8fExzCnpgD1kYeWI3YH2l4Lx
 fCCrpTpQNaqSgsjJjoErAHYrbvZgFFKPcVuNFtEyerd6me5+szI5L8n0vd2h9+2EAno4dR
 GAH24PotmggWbf+yGCTE7zF3UfYlSOI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 477cd97a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 6 Oct 2022 15:40:29 +0000 (UTC)
Date: Thu, 6 Oct 2022 09:40:24 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v2 0/5] treewide cleanup of random integer usage
Message-ID: <Yz726M8q7RTNFKXb@zx2c4.com>
References: <20221006132510.23374-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221006132510.23374-1-Jason@zx2c4.com>
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
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
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Theodore Ts'o <tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>,
 Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>,
 Thomas Graf <tgraf@suug.ch>, Johannes Berg <johannes@sipsolutions.net>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FYI, v3, which I'll wait a bit before posting, will also take care of
get_random_int().
