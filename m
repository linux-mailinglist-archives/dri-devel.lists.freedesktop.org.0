Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB1919C0A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 02:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F1310E004;
	Thu, 27 Jun 2024 00:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mBlNUmVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A0A10E004
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 00:46:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C2D4461D27;
 Thu, 27 Jun 2024 00:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B63CC116B1;
 Thu, 27 Jun 2024 00:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719449197;
 bh=0SG3laByZlaFUISZCHp29XT3JkoNZdaHE8iSnv9r4Ww=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mBlNUmVMzPFiiYZI8a8E65frgk5k1lxp0RkrYfN3Nlf/2A5ch4UMQN/KRSpXjJb2O
 djBU41eFDkc5BhBiVK+bvijq7reE+WvVLOjI6abwchbipLi50MqkLBcE9HAZXML2ZB
 vcXNkl0oVc41ZWhheArOwYfFHV0uN/gdJSrWAvNZjaO4ES7wR4BNnUbOfdxD7g2qby
 10el+2M74ZCpdaxOCG4dY/gaD016jFvumOcdSt4+KsTBMcEqxEPu2v7WSj29kUUMx0
 pwpxnw8AxBcF47BxCRsv11U6w9kvZBBbsJL9xFpmJWoMiS8guNVpQsYJOkzW+Fd5BG
 bUJejdYs3QDaw==
Date: Wed, 26 Jun 2024 17:46:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan
 Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, "Christian
 =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, Nikolay
 Aleksandrov <razor@blackwall.org>, Pavel Begunkov <asml.silence@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Stanislav Fomichev <sdf@google.com>
Subject: Re: [PATCH net-next v14 13/13] selftests: add ncdevmem, netcat for
 devmem TCP
Message-ID: <20240626174634.2adec19d@kernel.org>
In-Reply-To: <20240626150822.742eaf6a@kernel.org>
References: <20240625195407.1922912-1-almasrymina@google.com>
 <20240625195407.1922912-14-almasrymina@google.com>
 <20240626150822.742eaf6a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jun 2024 15:08:22 -0700 Jakub Kicinski wrote:
> On Tue, 25 Jun 2024 19:54:01 +0000 Mina Almasry wrote:
> > +CFLAGS += -I../../../net/ynl/generated/
> > +CFLAGS += -I../../../net/ynl/lib/
> > +
> > +LDLIBS += ../../../net/ynl/lib/ynl.a ../../../net/ynl/generated/protos.a  
> 
> Not as easy as this.. Please add this commit to your series:
> https://github.com/kuba-moo/linux/commit/c130e8cc7208be544ec4f6f3627f1d36875d8c47
> 
> And here's an example of how you then use ynl.mk to code gen and build
> for desired families (note the ordering of variables vs includes,
> I remember that part was quite inflexible..):
> https://github.com/kuba-moo/linux/commit/5d357f97ccd0248ca6136c5e11ca3eadf5091bb3

Investigating this further my patches will not work for O=xyz builds
either. Please squash this into the relevant changes:

diff --git a/tools/testing/selftests/drivers/net/Makefile b/tools/testing/selftests/drivers/net/Makefile
index db60d2718b35..9966e5b7139b 100644
--- a/tools/testing/selftests/drivers/net/Makefile
+++ b/tools/testing/selftests/drivers/net/Makefile
@@ -9,7 +9,8 @@ TEST_PROGS := \
 	stats.py \
 # end of TEST_PROGS
 
-# YNL files
+# YNL files, must be before "include ..lib.mk"
+EXTRA_CLEAN += $(OUTPUT)/libynl.a
 YNL_GEN_FILES := psp_responder
 TEST_GEN_FILES += $(YNL_GEN_FILES)
 
diff --git a/tools/testing/selftests/net/ynl.mk b/tools/testing/selftests/net/ynl.mk
index 0e01ad12b30e..59cb26cf3f73 100644
--- a/tools/testing/selftests/net/ynl.mk
+++ b/tools/testing/selftests/net/ynl.mk
@@ -18,6 +18,4 @@ $(YNL_OUTPUTS): CFLAGS += \
 
 $(OUTPUT)/libynl.a:
 	$(Q)$(MAKE) -C $(top_srcdir)/tools/net/ynl GENS="$(YNL_GENS)" libynl.a
-	$(Q)cp $(top_srcdir)/tools/net/ynl/libynl.a ./
-
-EXTRA_CLEAN += libynl.a
+	$(Q)cp $(top_srcdir)/tools/net/ynl/libynl.a $(OUTPUT)/libynl.a
