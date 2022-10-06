Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616B35F67E9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 15:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E4310E81A;
	Thu,  6 Oct 2022 13:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AEF10E817
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 13:26:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 037DB619AC;
 Thu,  6 Oct 2022 13:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05ABCC433B5;
 Thu,  6 Oct 2022 13:26:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="m0HkubMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665062772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFCjWqQv2aesuJpqe1Hhx/O5Y2jwoykcxVrUd1V3HAc=;
 b=m0HkubMpyr+io0tEyhxQqLoHBA7QUTEVSQeBMkrZtfIGFHX5AJ8sFxZWJtXbZ2bDCoWgJI
 01ds+HduDIzsD9+UHRFpOFVDT68S/oFyi5wZ8FcOieW3Smln7GhSJ0+Pbb21scwB88szRh
 DYoMiljAKGawIA0gEPoYFYgAzYoSn2M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d21f0881
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 6 Oct 2022 13:26:12 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 5/5] prandom: remove unused functions
Date: Thu,  6 Oct 2022 07:25:10 -0600
Message-Id: <20221006132510.23374-6-Jason@zx2c4.com>
In-Reply-To: <20221006132510.23374-1-Jason@zx2c4.com>
References: <20221006132510.23374-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-wireless@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
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
 Jakub Kicinski <kuba@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 linux-media@vger.kernel.org, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 linux-nvme@lists.infradead.org, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jens Axboe <axboe@kernel.dk>,
 Theodore Ts'o <tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>,
 =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>,
 Thomas Graf <tgraf@suug.ch>, Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With no callers left of prandom_u32() and prandom_bytes(), remove these
deprecated wrappers.

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 include/linux/prandom.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index 78db003bc290..e0a0759dd09c 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -12,18 +12,6 @@
 #include <linux/percpu.h>
 #include <linux/random.h>
 
-/* Deprecated: use get_random_u32 instead. */
-static inline u32 prandom_u32(void)
-{
-	return get_random_u32();
-}
-
-/* Deprecated: use get_random_bytes instead. */
-static inline void prandom_bytes(void *buf, size_t nbytes)
-{
-	return get_random_bytes(buf, nbytes);
-}
-
 struct rnd_state {
 	__u32 s1, s2, s3, s4;
 };
-- 
2.37.3

