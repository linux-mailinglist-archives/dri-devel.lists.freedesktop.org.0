Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A027E4A79
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BF410E37E;
	Tue,  7 Nov 2023 21:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFE510E013
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:19:47 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-45d8c405696so1306578137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 13:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699391987; x=1699996787;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6vtB6oGNeNraeO1yfc6WDVHQCGu06A7XkYHqu97D2c=;
 b=sTDAe/P+tOPAFRdbUVR39my/S2WlCLVsjkgbbKH+QV8+Uddwi3XyeXcw/5xLmK9Rf6
 4NJ2zm38YywnfcXtWt9Ck98Dtcr935ucpXwq+2ap5oHO8FKZw5ROIiUE3xZSpghKg1Br
 C/kWLQsEfmwNf5lKhXVWuupu5h38R53G1DpOL7in3xGj5ER1i/QY390LqoMrIBYrENzw
 pzUeqzAIdIySQEjV9tOMz1/mTh/8CwrhV6JhLwCBRRCYxbhYQ63/WLWyb4z4h654pedV
 OckgrOhFnowqwjVoLciubJwjmhAMJcNlF8ICxqHr7JSLoGYjlv/YsOrrDdrdKEM/2bkb
 ghyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699391987; x=1699996787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H6vtB6oGNeNraeO1yfc6WDVHQCGu06A7XkYHqu97D2c=;
 b=pOr4AeS8bmjOoJtxjhHwgHQaUdYwQ37AaEJGyus4MOERq5ehRwtqLptIBs8SpjCGyT
 uDxfk1aznxDdTypSqeHpFAIdnjrhz3gWqBspanBGZaqRxfpk+7SJdPlG25Ym0twrIDFp
 JhhC8+NUXg+WicMH1g4RTu7Uz3KqSuk6WMpNELITZypkBKdNf/y1ED9KYAgB9ew136gK
 cdFb2F89ZcJRmoHXuzw4xwkGB6A7to7GB/c654yV6GT+ADJPb80lOFdT6CHdq8Kbz21J
 E02d7R3hAgnZbVGC1aTxJ44r7rZYshlsUQcWg7tcXT6SiTXKpNd9uwbz7MuINOgH6soe
 srpw==
X-Gm-Message-State: AOJu0YzA5qhs2NUbyItCD8q/Yb+sHiEA5WLmLzBpb2iIgp/zTE9M56vs
 fXEN9CfH9u1w+qSDlIghMOiVkP9QQ4Vod4WLxB/9IA==
X-Google-Smtp-Source: AGHT+IGP/CXPxw/3EMz20UnoxCfjtef8X0h1zK6Yh6FlZoE34oBHf9lsr5FmmVHSCxlfjvy68G8o2l++xlKxI0QUgP0=
X-Received: by 2002:a05:6102:4712:b0:45d:91b3:74b7 with SMTP id
 ei18-20020a056102471200b0045d91b374b7mr12087084vsb.27.1699391986590; Tue, 07
 Nov 2023 13:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-9-almasrymina@google.com>
 <7e851882-9a85-3672-c3d5-73b47599873c@huawei.com>
In-Reply-To: <7e851882-9a85-3672-c3d5-73b47599873c@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Nov 2023 13:19:32 -0800
Message-ID: <CAHS8izPGa99LyEc=AeqNaK8X68b7dovxCHOLbR=hnbaybN_zgQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 08/12] net: support non paged skb frags
To: Yunsheng Lin <linyunsheng@huawei.com>
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
Cc: dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 7, 2023 at 1:00=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2023/11/6 10:44, Mina Almasry wrote:
> > Make skb_frag_page() fail in the case where the frag is not backed
> > by a page, and fix its relevent callers to handle this case.
> >
> > Correctly handle skb_frag refcounting in the page_pool_iovs case.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
>
> ...
>
> >  /**
> >   * skb_frag_page - retrieve the page referred to by a paged fragment
> >   * @frag: the paged fragment
> >   *
> > - * Returns the &struct page associated with @frag.
> > + * Returns the &struct page associated with @frag. Returns NULL if thi=
s frag
> > + * has no associated page.
> >   */
> >  static inline struct page *skb_frag_page(const skb_frag_t *frag)
> >  {
> > -     return frag->bv_page;
> > +     if (!page_is_page_pool_iov(frag->bv_page))
> > +             return frag->bv_page;
> > +
> > +     return NULL;
>
> It seems most of callers don't expect NULL returning for skb_frag_page(),
> and this patch only changes a few relevant callers to handle the NULL cas=
e.
>

Yes, I did not change code that I guessed was not likely to be
affected or enable the devmem TCP case. Here is my breakdown:

=E2=9E=9C  cos-kernel git:(tcpdevmem) =E2=9C=97 ack -i "skb_frag_page\("
--ignore-dir=3Ddrivers -t cc -l
net/core/dev.c
net/core/datagram.c
net/core/xdp.c
net/core/skbuff.c
net/core/filter.c
net/core/gro.c
net/appletalk/ddp.c
net/wireless/util.c
net/tls/tls_device.c
net/tls/tls_device_fallback.c
net/ipv4/tcp.c
net/ipv4/tcp_output.c
net/bpf/test_run.c
include/linux/skbuff.h

I'm ignoring ank skb_frag_page() calls in drivers because drivers need
to add support for devmem TCP, and handle these calls at time of
adding support, I think that's reasonable.

net/core/dev.c:
I think I missed ilegal_highdma()

net/core/datagram.c:
__skb_datagram_iter() protected by not_readable(skb) check.

net/core/skbuff.c:
protected by not_readable(skb) check.

net/core/filter.c:
bpf_xdp_frags_shrink_tail seems like xdp specific, not sure it's relevant h=
ere.

net/core/gro.c:
skb_gro_reset_offset: protected by NULL check

net/ipv4/tcp.c:
tcp_zerocopy_receive protected by NULL check.

net/ipv4/tcp_output.c:
tcp_clone_payload: handles NULL return fine.

net/bpf/test_run.c:
seems xdp specific and not sure if it can run into devmem issues.

include/linux/skbuff.h:
I think the multiple calls here are being handled correctly, but let
me know if not.

All the calls in these files, I think, are code paths not possible to
hit devmem TCP with the current support, I think:
net/core/xdp.c
net/appletalk/ddp.c
net/wireless/util.c
net/tls/tls_device.c
net/tls/tls_device_fallback.c

All in all I think maybe all in all I missed illegal_highdma(). I'll
fix it in the next iteration.

> It may make more sense to add a new helper to do the above checking, and
> add a warning in skb_frag_page() to catch any missing NULL checking for
> skb_frag_page() caller, something like below?
>
>  static inline struct page *skb_frag_page(const skb_frag_t *frag)
>  {
> -       return frag->bv_page;
> +       struct page *page =3D frag->bv_page;
> +
> +       BUG_ON(page_is_page_pool_iov(page));
> +
> +       return page;
> +}
> +
> +static inline struct page *skb_frag_readable_page(const skb_frag_t *frag=
)
> +{
> +       struct page *page =3D frag->bv_page;
> +
> +       if (!page_is_page_pool_iov(page))
> +               return page;
> +
> +       return NULL;
>  }
>
>

My personal immediate reaction is that this may just introduce code
churn without significant benefit. If an unsuspecting caller call
skb_frag_page() on devmem frag and doesn't correctly handle NULL
return, it will crash or error out anyway, and likely in some obvious
way, so maybe the BUG_ON() isn't so useful that it's worth changing
all the call sites. But if there is consensus on adding a change like
you propose, I have no problem adding it.

--=20
Thanks,
Mina
