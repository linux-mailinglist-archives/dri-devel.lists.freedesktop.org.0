Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3197E788C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 05:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A396010E647;
	Fri, 10 Nov 2023 04:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5834110E648
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 04:06:12 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-45d6d97af38so1074767137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 20:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699589171; x=1700193971;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHJDdNWZZ4tIwkHZEN1gC9OcT0HCJr1RVppBH6tmUws=;
 b=B8nuVIHhlQD5MQ8tsNPePvPngY4Sx59b+fWqIN9xM9zMP/Dq+Ac2nBxrn5YIB7zxUe
 kULBLV6cR3njeODZyalH4Se74As8PUIP/tlEB5q+O3DG5pKrsyTtbIuzNGkqQUtGjFbm
 2EaZrxYTXX8nc3JlNdlNDMCIZjYqbI5dtokgXD5wA4VM8Xk3MEGPstNtymYc6meKC2dw
 WMIGnn5W/uG3oLQzZOkKtxljkqaZh3KUih2vTl/Ri1hVFze6YQh5TQjrbYLqtD84/qYL
 usH4pSI+Nff7kyAaG3LeWAIyz1khTpAeS1eF5FAivWKv4BxsNSGr5h/F+84lxBQi/RN9
 YP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699589171; x=1700193971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHJDdNWZZ4tIwkHZEN1gC9OcT0HCJr1RVppBH6tmUws=;
 b=wrIredpZeafiwrH1dvinyCpQl9LcpAdR4yUgGa6wUmR+lCTpYLRJ8tRY4XKwyj47b0
 LzL+Jq4ajZAXH/eETdstLnDLlEwXHMnCHtVsBkDQeAay2BHOufRaNZcsaknjSDwjfxWP
 PqFktK4rUpVEkntJ9BqG+haO93qSzyDi0phA9tf02Er6HcQO8x4u9gr7JIdZ50gQ0mIl
 QvPNWZgio9mnyvpSbwyyKl+rfctcXjpkI5dFrwFanEdc/88YDVqR94GBtJ80f7iLP2gH
 XAjxxgvC5GsnZfHvmBoyYJ9r0QpxfuNY6dGfE/RpLD3H+k+4iqpoVaUIKdVMewvuqRCt
 ONPA==
X-Gm-Message-State: AOJu0YxdED0/fuDmCnS6etMf3jVU4RKYn9rFk/Bl8rCUdW/of/BzYmUv
 bjfbxLLMa2wcOBx2acszA//ypFISD2vbkwiIocBTBA==
X-Google-Smtp-Source: AGHT+IHV8+0MFbC/VQpqHkvElGy/RL/z/ISeA+lbF9gB7A+2xFrkzHZehvrtNrke+02jjGbQaJXjvKRk/eDFLYB8QzU=
X-Received: by 2002:a05:6102:3d8b:b0:44d:38d6:5cb8 with SMTP id
 h11-20020a0561023d8b00b0044d38d65cb8mr631035vsv.10.1699589171185; Thu, 09 Nov
 2023 20:06:11 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-9-almasrymina@google.com>
 <adde2b31fdd9e7bb4a09f0073580b840bea0bab1.camel@redhat.com>
In-Reply-To: <adde2b31fdd9e7bb4a09f0073580b840bea0bab1.camel@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 9 Nov 2023 20:06:00 -0800
Message-ID: <CAHS8izMrJVb0ESjFhqUWuxdZ8W5HDmg=yRj1J1sTeGoQjDcJog@mail.gmail.com>
Subject: Re: [RFC PATCH v3 08/12] net: support non paged skb frags
To: Paolo Abeni <pabeni@redhat.com>
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
Cc: linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>, linux-kselftest@vger.kernel.org,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 9, 2023 at 1:15=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On Sun, 2023-11-05 at 18:44 -0800, Mina Almasry wrote:
> [...]
> > @@ -3421,7 +3446,7 @@ static inline struct page *skb_frag_page(const sk=
b_frag_t *frag)
> >   */
> >  static inline void __skb_frag_ref(skb_frag_t *frag)
> >  {
> > -     get_page(skb_frag_page(frag));
> > +     page_pool_page_get_many(frag->bv_page, 1);
>
> I guess the above needs #ifdef CONFIG_PAGE_POOL guards and explicit
> skb_frag_is_page_pool_iov() check ?
>

It doesn't actually. page_pool_page_* helpers are compiled in
regardless of CONFIG_PAGE_POOL, and handle both page_pool_iov* & page*
just fine (the checking happens inside the function).

You may yell at me that it's too confusing... I somewhat agree, but
I'm unsure of what is a better name or location for the helpers. The
helpers handle (page_pool_iov* || page*) gracefully, so they seem to
belong in the page pool for me, but it is indeed surprising/confusing
that these helpers are available even if !CONFIG_PAGE_POOL.

>
> Cheers,
>
> Paolo
>
>


--=20
Thanks,
Mina
