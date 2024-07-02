Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9992471F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 20:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA1810E288;
	Tue,  2 Jul 2024 18:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WcmLUQ+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0999B10E2C8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 18:15:09 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6b5d6ba7c90so4804406d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719944108; x=1720548908;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jfhmwJ2ZaitPnbChce0yHI1r7AowuVw/8E/XjQzADk=;
 b=WcmLUQ+0JfAgAigFVvin6xn7jqxAgv/8hnXS9aVwfZWLMFp4jREnCQLpsln1TEOeBG
 EjkOfk7XlP4zAcfD6OtYCEQa57Y8jX/2gO8BtGQLpSxHIAEP99z9/0s8VgGDSLYPhQci
 GYNFI75Iqdh6CWGcz7/kaj2TygEd5YbZTqKP+IH50KtJFU+oc6rEGtyT2QaNS5/PcRv7
 R0cYpXX9FtUraEJkCpc1iEDNtZdySG454CP9PcinAfgxFjpQNwLxN5BtVv/1/dZ4TuhY
 loWW5gIea8+IZZ1/Ov/PeA4YveXbAF8e/O4bMfQVDQmzDQ3vh/0BgG6IfJqBK+Jq6jyK
 D4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719944108; x=1720548908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jfhmwJ2ZaitPnbChce0yHI1r7AowuVw/8E/XjQzADk=;
 b=AkzBaVsSE7mCllqjgRCJfJLgAka+J7f/KO1FlV6xz9CCigpwWP8QRr/XfONAcnF5ES
 MuGT7aRLNwMhTfjm1q5nsh8IVUW1k+l7k6AXW6p3PbaA8ocbY1DWY6R2FgFKS5gjdjsG
 JeDQid1Qe7kS1X+jnuW7uqYlgNRrf7fTxPBeuMy3e7dUssDmeU41tBdXSEJb2CP14obl
 J8q73ve6BUgYOYII7kosrYGbSjxRfaurlS+BoYHC9BQFZUK4QNzzf1n6JLy2uG39DNJ3
 gupY30rLkajymxAnWgIiUu6+dPDzsgUHNCD8EhFdRVF1ZBj+/SAM+YCmqRmnOLT6mVDF
 /xTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuskjl2VyXjs1V+/537cqxVm7HnuFZ/dADzF3/NwwmfBcMEJ2GGETbDiiRZC6NgF21RbHpyMbiSXXRCESTytWuyjVk9zqtovtsThSwOwRk
X-Gm-Message-State: AOJu0YxNA4H9UJDwocieHx/A241xGqd6Z4cBhBOegG5NG5hS8mqXv+OV
 YDAf2PAbUPTQCrKHDKpInjgQ3AsMJQDsDJ47XgO8H3GHJ2fODhCoukcPOiJWXIqjRwEu9u8QvPG
 4PxErDFl7eX4FD0dg0jDrqs5tPQ2C4i3Bf2Ml
X-Google-Smtp-Source: AGHT+IFmyhMURbw09NuTqgYr3jOM6q8xc9WTxYBf4c7zqxp++C39G8nCnNJajyD2MlYoocDGcyD9JLOGWT3xUoIcMjk=
X-Received: by 2002:a05:6214:1d2f:b0:6b5:a4f6:514 with SMTP id
 6a1803df08f44-6b5b70caff8mr117075946d6.35.1719944108107; Tue, 02 Jul 2024
 11:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-11-almasrymina@google.com>
 <35691b55-436c-4c52-b241-f0c5326227cb@app.fastmail.com>
In-Reply-To: <35691b55-436c-4c52-b241-f0c5326227cb@app.fastmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 2 Jul 2024 11:14:53 -0700
Message-ID: <CAHS8izN+wiY8rNDhK7XdF-9L=PdHGMSj7uHKkyCDsW8_6M76SQ@mail.gmail.com>
Subject: Re: [PATCH net-next v15 10/14] tcp: RX path for devmem TCP
To: Arnd Bergmann <arnd@arndb.de>
Cc: Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 Linux-Arch <linux-arch@vger.kernel.org>, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, shuah <shuah@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
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

On Tue, Jul 2, 2024 at 8:25=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jun 28, 2024, at 02:32, Mina Almasry wrote:
> > --- a/arch/alpha/include/uapi/asm/socket.h
> > +++ b/arch/alpha/include/uapi/asm/socket.h
> > @@ -140,6 +140,11 @@
> >  #define SO_PASSPIDFD         76
> >  #define SO_PEERPIDFD         77
> >
> > +#define SO_DEVMEM_LINEAR     78
> > +#define SCM_DEVMEM_LINEAR    SO_DEVMEM_LINEAR
> > +#define SO_DEVMEM_DMABUF     79
> > +#define SCM_DEVMEM_DMABUF    SO_DEVMEM_DMABUF
>
> Something is still wrong with the number assignment:
>
> > --- a/arch/mips/include/uapi/asm/socket.h
> > +++ b/arch/mips/include/uapi/asm/socket.h
> > @@ -151,6 +151,11 @@
> >  #define SO_PASSPIDFD         76
> >  #define SO_PEERPIDFD         77
> >
> > +#define SO_DEVMEM_LINEAR     78
> > +#define SCM_DEVMEM_LINEAR    SO_DEVMEM_LINEAR
> > +#define SO_DEVMEM_DMABUF     79
> > +#define SCM_DEVMEM_DMABUF    SO_DEVMEM_DMABUF
> > +
> >  #if !defined(__KERNEL__)
> >
> >  #if __BITS_PER_LONG =3D=3D 64
>
> so alpha and mips use the same numbering system as
> the generic version for existing numbers
>
> > diff --git a/arch/parisc/include/uapi/asm/socket.h
> > b/arch/parisc/include/uapi/asm/socket.h
> > index be264c2b1a117..2b817efd45444 100644
> > --- a/arch/parisc/include/uapi/asm/socket.h
> > +++ b/arch/parisc/include/uapi/asm/socket.h
> > @@ -132,6 +132,11 @@
> >  #define SO_PASSPIDFD         0x404A
> >  #define SO_PEERPIDFD         0x404B
> >
> > +#define SO_DEVMEM_LINEAR     78
> > +#define SCM_DEVMEM_LINEAR    SO_DEVMEM_LINEAR
> > +#define SO_DEVMEM_DMABUF     79
> > +#define SCM_DEVMEM_DMABUF    SO_DEVMEM_DMABUF
>
> parisc uses a different number, but you start using the
> generic version here. This is probably fine but needs
> a comment.
>
> > index 8ce8a39a1e5f0..25a2f5255f523 100644
> > --- a/include/uapi/asm-generic/socket.h
> > +++ b/include/uapi/asm-generic/socket.h
> > @@ -135,6 +135,11 @@
> >  #define SO_PASSPIDFD         76
> >  #define SO_PEERPIDFD         77
> >
> > +#define SO_DEVMEM_LINEAR     98
> > +#define SCM_DEVMEM_LINEAR    SO_DEVMEM_LINEAR
> > +#define SO_DEVMEM_DMABUF     99
> > +#define SCM_DEVMEM_DMABUF    SO_DEVMEM_DMABUF
>
> These on the other hand look like a typo: did you
> mean number 78 and 79 instead of 98 and 99?
>

Ooops, I think this is a typo or error indeed. I will fix.

> Alternatively, you could continue with number 87,
> which is the next unused number on sparc, and have
> the same numbers on all architectures?
>

I don't know enough about the tradeoffs of either approach to be
honest, so I'll do what you prefer. I think I'll just fix the ones in
asm-generic/socket.h since that is what we aligned on from previous
iterations I believe, unless you tell me to do differently.

--=20
Thanks,
Mina
