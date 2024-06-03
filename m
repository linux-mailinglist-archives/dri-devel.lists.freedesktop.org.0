Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6EE8D84B7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 16:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0DC10E0A0;
	Mon,  3 Jun 2024 14:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="bTYHizDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECF310E0A0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 14:17:23 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a68c2915d99so237671866b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717424242; x=1718029042;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hX960fiFK86sEZShyroAmINX+eMw+I3MOlcUpYKxHw8=;
 b=bTYHizDWVz+USvIEVohR+jg7uyEsxmAyD7AQVFwhdaDrjgk3wj0Zbs27znq64GUYQs
 UndH1zIADcgGR/0M6QPHX0F1K7JIWXU8YwaM1Pt7/+mkVaCUHmeAtTzYwQ6GaKLD+fgQ
 817hkUGGN2km6ciNagZJPaqMjM2gR6DXd2kiHBDIWCEFg3ZLGXzpnO+FrBNQ09kknWxR
 /kXdeRY4gO+mOirIqcMhvuP0SVOAm3equwnBIH6wlpz5w8xkb4FyvXW5KC/fVx0OHTRE
 73EZHh0zbgavBslPsSrL/YCn0qsLoIGvGKDrBcJt0S8uUiJyie7eqIUvfun0+9C0yDhI
 4pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717424242; x=1718029042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hX960fiFK86sEZShyroAmINX+eMw+I3MOlcUpYKxHw8=;
 b=TId0L7ctS2KShCjDr2DREBtuYio9ia1taj19nNvdNESh6jBkqAPWC9H4apYce0l6U9
 YfetJ1LTjfnbjQdiNAl98yChtg6L+IvaCqHxzPSD4Li77wiu3gkcbu+T4xK02eY22N9u
 qnGzULXXrD8x3Qh6ypGwXm72t6CGLEqjV8FdrHf+0rAIfo/Ih7ysgQDmXr5vS5grkKQO
 BkiAjefJgkmS/RKYIliuR79Qt52qTDqySbp44hdtyyS9IBXIGGAqtYvcjU1iX42dECzR
 2XxHfUQ5khlyECKcaegOpHpBhcQk8o8a/R+y4QuW9cdu9ACJ77ZYFOEeX3Yg1La08xAk
 cM6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0VQkkhWk16JcRpLDfvR09Cj3BTS9v3DwgcXOjCpbRCHnN7VmBD5c6jQua6WwH5xUDV8gUZkqxRogAyYlxDejb3VNybi5GPxdKqAt2z6ih
X-Gm-Message-State: AOJu0YxNfUXcBeMaibBA5vJvVM4nYTMYrxozPOmP3+WnFKQGaYYl2ddj
 ZlZeD5cxvuHa0/AklcAMxMQuQmMo4WRqXQtIyfRovrgCZJC2ytdal0zYxv9WFX10Cul8xWvNPuN
 H+MRPQ7LcWD1kHItXHqOdcSapVJqRQFSpjqwW
X-Google-Smtp-Source: AGHT+IF2dM971g+G40jgbxNlCnWLD2vDmcmV06zLLO0GJhjluR0VCD0WMHMSdMpVvOnlSN5qx4LmzaU7Z6g2TUlHcjM=
X-Received: by 2002:a17:907:914e:b0:a68:9621:a93c with SMTP id
 a640c23a62f3a-a689621ab6fmr371329366b.8.1717424241215; Mon, 03 Jun 2024
 07:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
In-Reply-To: <ZlqzER_ufrhlB28v@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 3 Jun 2024 07:17:05 -0700
Message-ID: <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 31, 2024 at 10:35=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Thu, May 30, 2024 at 08:16:01PM +0000, Mina Almasry wrote:
> > I'm unsure if the discussion has been resolved yet. Sending the series
> > anyway to get reviews/feedback on the (unrelated) rest of the series.
>
> As far as I'm concerned it is not.  I've not seen any convincing
> argument for more than page/folio allocator including larger order /
> huge page and dmabuf.
>

Thanks Christoph, this particular patch series adds dmabuf, so I
assume no objection there. I assume the objection is that you want the
generic, extensible hooks removed.

To be honest, I don't think the hooks are an integral part of the
design, and at this point I think we've argued for them enough. I
think we can easily achieve the same thing with just raw if statements
in a couple of places. We can always add the hooks if and only if we
actually justify many memory providers.

Any objections to me removing the hooks and directing to memory
allocations via simple if statements? Something like (very rough
draft, doesn't compile):

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 92be1aaf18ccc..2cc986455bce6 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -557,8 +557,8 @@ netmem_ref page_pool_alloc_netmem(struct page_pool
*pool, gfp_t gfp)
                return netmem;

        /* Slow-path: cache empty, do real allocation */
-       if (static_branch_unlikely(&page_pool_mem_providers) && pool->mp_op=
s)
-               netmem =3D pool->mp_ops->alloc_pages(pool, gfp);
+       if (unlikely(page_pool_is_dmabuf(pool)))
+               netmem =3D mp_dmabuf_devmem_alloc_pages():
        else
                netmem =3D __page_pool_alloc_pages_slow(pool, gfp);
        return netmem;


--=20
Thanks,
Mina
