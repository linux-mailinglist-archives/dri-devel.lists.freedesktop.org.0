Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B15F7636
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 11:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF10C10E210;
	Fri,  7 Oct 2022 09:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B84510E210
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665134776; x=1696670776;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YIsvu8HuZoKfT0WBNxjXL2VasbVdSxWppe8Gs3rIq6U=;
 b=FsOizXMNUKlKwqSaXqK0kll0ZgBFmg3oSdkbKEgLnDsVVSENiwkaB9rs
 rdKLpvlNDXNuU7PPTUbfCbc9hcngAe+5dVrTRcXvq+H9IpA4OYI+mc3TM
 NkubIn4cYAod5mp/PfCD4ELzggwhrl5ZtYsVGQxiHx5+vJlB4I7Ke05H6
 OoqSpJQnGWYjsWkVBUZkPn1/JvA2lsBDf8xCEb65q6fE67nk1Rx1OB/0i
 bJn1hhxCllkeoGWYjtHO4cUyXqXqQb6RNCSFKfqQDbvGnix3fuNuwVKMc
 kqrnaCFs5543V6fQn92fXN/LP4ZOCT5lMLYIxNoaiZxIbiiq33NCD8YYH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="367822051"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="367822051"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 02:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="620199690"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="620199690"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Oct 2022 02:26:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 6645E17E; Fri,  7 Oct 2022 12:26:23 +0300 (EEST)
Date: Fri, 7 Oct 2022 12:26:23 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Message-ID: <Yz/wv0sqBR+J+jy+@black.fi.intel.com>
References: <20221006165346.73159-1-Jason@zx2c4.com>
 <20221006165346.73159-4-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006165346.73159-4-Jason@zx2c4.com>
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
 Yury Norov <yury.norov@gmail.com>, Toke H??iland-J??rgensen <toke@toke.dk>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>,
 linux-nvme@lists.infradead.org, loongarch@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 Christoph B??hmwalder <christoph.boehmwalder@linbit.com>,
 Chuck Lever <chuck.lever@oracle.com>, linux-crypto@vger.kernel.org,
 Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 06, 2022 at 10:53:44AM -0600, Jason A. Donenfeld wrote:
>  drivers/thunderbolt/xdomain.c                  |  2 +-

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
