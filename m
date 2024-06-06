Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2A8FF2D7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 18:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8985510EA17;
	Thu,  6 Jun 2024 16:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mHbX+tb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFA710EA17
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 16:49:52 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so170065166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717692590; x=1718297390;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kXklq3VgB30R+o4fq7okdZC1G76cerOH8ymTCu7s03o=;
 b=mHbX+tb/1SwO+qJb663gC3r8ANcoBoNjrvEs/W3xEuGzTLrrD+Pw+T5rR4oVrPyVWE
 i+uZ9SCHY4MZyf1MHE4UDIu8btcgPmktiqCTily7lai1d5uI8j4+KrSYossKGf/REjEf
 CA5/0uMcb4ivwCJ2KmzU6oajeSmpFEOXKIoe01zLKLCAzwpU5pQB6yPn4jxYWyVlZkeD
 8GhQHCwIj7Fg4aC/mNRmuXEwO2KUrYGel0fvd40+nuM1wh9FyVU8jql+2VchRN+5RDHL
 sNvVZo3BIbZ29qk+ur25l6UPWh43P6UC26ixTYxrrw1KJuAqrn1lY2Spd+nB78FLnSOC
 kXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717692590; x=1718297390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kXklq3VgB30R+o4fq7okdZC1G76cerOH8ymTCu7s03o=;
 b=ohND+88tWwkUaTJuuqFRvUWHD82EPo2Si/qn2aDO1a5DgNWr4PiomEalC5LlQT4pEI
 Vq7xHipapVki2lCowtr07AFw8yBRK4zcm2lGzheESB3I/IvCgYKh4bF2JwdVY/6ocWMl
 qBihUsD4qZy9gyWvepn4r6sVAtDCeaB2IyFCik49OvG4fyHZ0Nm6DRGPCNmzLD6fTLRL
 9vtx1e/e/9qWQOcgkaWKARXf80EEpE29XEuZyPaOGujLOrmVyrbUbSuaFoUH9M9CmkMu
 fWbKir6GK0rGRZRvB5+cRgfsIEFWTsidAYqICrzM6hOV9or7sW/WoVS0pX62K15OTdcf
 AqfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWct/Ti7bziYz8OT8ZEeDAII7Xb6nFZteFDikv6VeaRvAOZz59kQryWP5izO+kCbsH0FKwOnn4u0LODu6276+B5uU9PGQC4HtdcN4EjHJND
X-Gm-Message-State: AOJu0Yzm3/Q/slc9otvKQ38B21KXn/oZygHgdcMnThmVXa/DrepWdPbi
 /xnXg8jUcL5vEzs1vl+8pcSOwhQP2MydK3SOBQeDnng83JoxHI/IlG0ICb3HZ9M5rEVxXFOc9O8
 y2YS4+b647mAfEU9SGrhJCbHMwunrpC+lY9KD
X-Google-Smtp-Source: AGHT+IH2yDy4H26F3I2+8dO9xS+2+lL/iHck43y2iBW4jw1+n0fE7mBk6YXmrPpbRP2wxNUQ12+YElL3P5ewJrljwbU=
X-Received: by 2002:a17:907:7786:b0:a68:c9fa:f19f with SMTP id
 a640c23a62f3a-a6cdb0f542cmr7959966b.53.1717692590194; Thu, 06 Jun 2024
 09:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-11-almasrymina@google.com>
 <84162ef4c695cb764454087ca0bc81082d4fac8d.camel@redhat.com>
In-Reply-To: <84162ef4c695cb764454087ca0bc81082d4fac8d.camel@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 6 Jun 2024 09:49:38 -0700
Message-ID: <CAHS8izNupu9u1zx9YD9KaNxahBeZeaajOUUSFePbQk+rfUFn+Q@mail.gmail.com>
Subject: Re: [PATCH net-next v10 10/14] net: add support for skbs with
 unreadable frags
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
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

On Tue, Jun 4, 2024 at 3:46=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On Thu, 2024-05-30 at 20:16 +0000, Mina Almasry wrote:
> > diff --git a/net/core/gro.c b/net/core/gro.c
> > index 26f09c3e830b7..7b9d018f552bd 100644
> > --- a/net/core/gro.c
> > +++ b/net/core/gro.c
> > @@ -422,6 +422,9 @@ static void gro_pull_from_frag0(struct sk_buff *skb=
, int grow)
> >  {
> >       struct skb_shared_info *pinfo =3D skb_shinfo(skb);
> >
> > +     if (WARN_ON_ONCE(!skb_frags_readable(skb)))
> > +             return;
> > +
> >       BUG_ON(skb->end - skb->tail < grow);
> >
> >       memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
> > @@ -443,7 +446,7 @@ static void gro_try_pull_from_frag0(struct sk_buff =
*skb)
> >  {
> >       int grow =3D skb_gro_offset(skb) - skb_headlen(skb);
> >
> > -     if (grow > 0)
> > +     if (grow > 0 && skb_frags_readable(skb))
> >               gro_pull_from_frag0(skb, grow);
> >  }
>
> I'm unsure if this was already mentioned, so please pardon the eventual
> duplicate...
>
> The above code is quite critical performance wise, and the previous
> patch already prevent frag0 from being set to a non paged frag,


Hi Paolo!

The last patch, d4d25dd237a61 ("net: support non paged skb frags"),
AFAICT doesn't prevent frag0 from being a non-paged frag. What we do
is set ->frag0=3Dskb->data, then prevent it from being reset to
skb_frag_address() for non-paged skbs. ->frag0 will likely actually be
a bad value for non-paged frags, so we need to check in
gro_pul_from_frag0() so that we don't accidentally pull from a bad
->frag0 value.

What I think I should do here is what you said. I should make sure
frag0 and frag0_len is not set if it's a non-paged frag. Then, we
don't need special checks in gro_pull_from_frag0 I think, because
skb_gro_may_pull() should detect that frag0_len is 0 and should
prevent a pull.

I will apply this fix to the next iteration for your review. Let me
know if I missed something.


> so what
> about dropping the above additional checks?
>


--
Thanks,
Mina
