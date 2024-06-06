Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7918FF31D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 18:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C26710EA21;
	Thu,  6 Jun 2024 16:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4xU/ogdp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D2C10EA21
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 16:58:18 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-57a2ed9af7dso1817889a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 09:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717693097; x=1718297897;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jylD5VdLotA86Z7MUVU8wz6TNgXb9980vHa3X2PNUNQ=;
 b=4xU/ogdptjo0NSFA+Oep81Z1lyseQiCTFuJCTjb0oJArComRmiz/NIFUjkZKpttun+
 k/xFxPoe7y7oEaCKTHiOWX4iiNN0D05+VARP0nwpEex0Zddzcn/IEVshuUFhGPeerl6x
 CmV/eOStgD6F0mKJSf4yIkHw40VbPJePXOqaA5hT09DadNV/zbGm90xko/MyRudatxWU
 ALqEo3Rlv6D3gel9YHQER6llPpLnbRqGjT0jRywNDUft0uDoHrUVzjl5L7qiRqovt+Rv
 2RVAB1i7HbK6lRgDvdm/U+15dnJhBb0/HypXRZGCQqTZIUkIPwUDQi2Px1VAhKY5VUtM
 HNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717693097; x=1718297897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jylD5VdLotA86Z7MUVU8wz6TNgXb9980vHa3X2PNUNQ=;
 b=tNUagKr/lMz+PEpYFyrjd39aNktQv0oOH5ubP/Q9DGRggL3QPsKXspGh3j6cWGPukm
 c+lilW4HgmZ+d6nzbSdyTJRfwsXTJdfN2DCb8n2vWohFdvzcsxs5SlTsomQ6I3f08hOP
 vlnSSvmMcul4Y4aYCF6LZtTkbeUEljHauLI9tke15c/AVnUAKNnuFAldV/arbUJvB9ll
 F24ndEiyqIfmQ5TS8eOXkCokGKTYEl/bYsr1XT7bJhCls1vAqnVKz5DjBv5Z1vrq7i2m
 BdxxbIJEsVK1aTvzWTGowCPXFCC2i5fV/HeqtzKmvmW8guYyyQyhZe4NsTCezas8WQHn
 2YIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPAF6ddWWuJnFtWS4joty4Z4x6p0/70oGLfQ1yjQUSJt2c08RyIkMg5y05dYOaNDODoYlC/wto1rIhnfg/9rx0D7NyzRAe2yr1sg4bvXPJ
X-Gm-Message-State: AOJu0YylXL9n5ZjScQDl6RSJucbHGx5TM81obDCt2X4JVK0o7bTVIsuS
 NOlpdDg2qYqsxUBWfuBgFzXfFXd1nKcDK9WMx90c2NfwWSIUIZyd+/KkRSeUNi3O1NBiYLUHJHI
 q9DJGUGjTdyIlGEBusTk1QLDbiKYRlkmkCDJA
X-Google-Smtp-Source: AGHT+IEy8tF4w5nFKpMjgp4LNCeJXDsMNuKu99RJBZQa2eob/f6gFlNSUxoAYqR0tlHBDkAdRThFWqNLt5Xt32HaUnk=
X-Received: by 2002:a17:906:1453:b0:a68:3e32:384 with SMTP id
 a640c23a62f3a-a6cd7a7eb86mr10614366b.46.1717693096783; Thu, 06 Jun 2024
 09:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-11-almasrymina@google.com>
 <84162ef4c695cb764454087ca0bc81082d4fac8d.camel@redhat.com>
 <CAHS8izNupu9u1zx9YD9KaNxahBeZeaajOUUSFePbQk+rfUFn+Q@mail.gmail.com>
In-Reply-To: <CAHS8izNupu9u1zx9YD9KaNxahBeZeaajOUUSFePbQk+rfUFn+Q@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 6 Jun 2024 09:58:04 -0700
Message-ID: <CAHS8izPw-R8MjZdgZTLcKoTe6=gSp1rh3GKZ9Q-Z7Txgc_RVjw@mail.gmail.com>
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

On Thu, Jun 6, 2024 at 9:49=E2=80=AFAM Mina Almasry <almasrymina@google.com=
> wrote:
>
> On Tue, Jun 4, 2024 at 3:46=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
> >
> > On Thu, 2024-05-30 at 20:16 +0000, Mina Almasry wrote:
> > > diff --git a/net/core/gro.c b/net/core/gro.c
> > > index 26f09c3e830b7..7b9d018f552bd 100644
> > > --- a/net/core/gro.c
> > > +++ b/net/core/gro.c
> > > @@ -422,6 +422,9 @@ static void gro_pull_from_frag0(struct sk_buff *s=
kb, int grow)
> > >  {
> > >       struct skb_shared_info *pinfo =3D skb_shinfo(skb);
> > >
> > > +     if (WARN_ON_ONCE(!skb_frags_readable(skb)))
> > > +             return;
> > > +
> > >       BUG_ON(skb->end - skb->tail < grow);
> > >
> > >       memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
> > > @@ -443,7 +446,7 @@ static void gro_try_pull_from_frag0(struct sk_buf=
f *skb)
> > >  {
> > >       int grow =3D skb_gro_offset(skb) - skb_headlen(skb);
> > >
> > > -     if (grow > 0)
> > > +     if (grow > 0 && skb_frags_readable(skb))
> > >               gro_pull_from_frag0(skb, grow);
> > >  }
> >
> > I'm unsure if this was already mentioned, so please pardon the eventual
> > duplicate...
> >
> > The above code is quite critical performance wise, and the previous
> > patch already prevent frag0 from being set to a non paged frag,
>
>
> Hi Paolo!
>
> The last patch, d4d25dd237a61 ("net: support non paged skb frags"),
> AFAICT doesn't prevent frag0 from being a non-paged frag. What we do
> is set ->frag0=3Dskb->data, then prevent it from being reset to
> skb_frag_address() for non-paged skbs. ->frag0 will likely actually be
> a bad value for non-paged frags, so we need to check in
> gro_pul_from_frag0() so that we don't accidentally pull from a bad
> ->frag0 value.
>
> What I think I should do here is what you said. I should make sure
> frag0 and frag0_len is not set if it's a non-paged frag. Then, we
> don't need special checks in gro_pull_from_frag0 I think, because
> skb_gro_may_pull() should detect that frag0_len is 0 and should
> prevent a pull.
>
> I will apply this fix to the next iteration for your review. Let me
> know if I missed something.
>
>

Actually, sorry you're right. As written, d4d25dd237a61 ("net: support
non paged skb frags") prevents frag0 from being a non-paged frag. I
can just drop these excessive checks with no downside. Sorry for the
noise!

--=20
Thanks,
Mina
