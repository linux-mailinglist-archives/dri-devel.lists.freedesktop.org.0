Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE987E4B86
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 23:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B1810E6C4;
	Tue,  7 Nov 2023 22:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23E510E6C4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 22:11:07 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-45da062101bso1791376137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 14:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699395067; x=1699999867;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbbSAsuabIr4BwrZEqK8c8XYZufkR++Mr7B/MiPJA0o=;
 b=YEh5THVB15i7yDIRff3OrCXdMxfdrHS8/C07RjkKyy3ir3GrPUifyZy6k0eyXVrnN8
 QekjwvI0B6a9SJPTB3Ob8mNNQYBDGcb9jadfKx/xf9scDg7gPA/1BQJIsq0Z1AY6uDII
 qqYOGUkZ2HLXm1ZNQA4x5O1BEc/zyyi+UR3XT8bjDwZyG85C8whfwn5QssT8ap7qRNSz
 ut15BuGF2iaLbe9Z7VMyFVFqz4yb5fm2sGZAqrMxL5uye9FCa5MOCinYWotexriZub+K
 8/DEUHAtM9koNuMx+B6zFoqF246ckDsFDNafE5Snqlt8x5fh0Mg4vesvEz1FBNcqFVis
 dYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699395067; x=1699999867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbbSAsuabIr4BwrZEqK8c8XYZufkR++Mr7B/MiPJA0o=;
 b=ShGzo9RFVAW69LmTcyTAjMlHlp9kv1j4z9vavTIvgw8VxNkMm7ss9zVYjXTm2pX9Ue
 R+T3pBS54VmemwapFt6R6haAgoYZaJPlzBsCmhaIxdO+Ip46fAoUfAeXurFcgHzFHGmL
 GlXSNPEbMxL733lECfxQ0HYgYxZNolTAX9oYA+lEyZoDGvGfMv/jYaSEl87YvqgHto9K
 AMXJTKiMJF1NpMJPVj0kDx2WqJqbN7GaNAifT1YgXeacVC30LrvXQi6fCjaYTuUCwToP
 O1cqyiNlyz1VD6FcMt6PVvpqrIo5MwHEhQueOOj1EQ8DPKGXD7WuvLUZf8mScjQm5O5h
 5m7w==
X-Gm-Message-State: AOJu0YzzaFTpCIQWI5YPyTYmOVRiBzoC3sagmBFCaNLSC/Id3EZV3q7t
 s1wnhkHnHQwczoDjonBEZnSnK4K2Tl9nGJfGC6LQzQ==
X-Google-Smtp-Source: AGHT+IGk2R54zWB6aRa4RbSeBT9Z8J5T4TXiyB4Vle9bwzR5GqISmJH2OZCPqY1SUXwwMEpn8Stt8en869yrOvH8V6Y=
X-Received: by 2002:a05:6102:474b:b0:45f:4e55:9c4b with SMTP id
 ej11-20020a056102474b00b0045f4e559c4bmr5313415vsb.31.1699395066619; Tue, 07
 Nov 2023 14:11:06 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com>
 <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
In-Reply-To: <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Nov 2023 14:10:52 -0800
Message-ID: <CAHS8izOHYx+oYnzksUDrK1S0+6CdMJmirApntP5W862yFumezw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
To: David Ahern <dsahern@kernel.org>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 3:44=E2=80=AFPM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 11/5/23 7:44 PM, Mina Almasry wrote:
> > diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> > index eeeda849115c..1c351c138a5b 100644
> > --- a/include/linux/netdevice.h
> > +++ b/include/linux/netdevice.h
> > @@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
> >  };
> >
> >  #ifdef CONFIG_DMA_SHARED_BUFFER
> > +struct page_pool_iov *
> > +netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
> > +void netdev_free_devmem(struct page_pool_iov *ppiov);
>
> netdev_{alloc,free}_dmabuf?
>

Can do.

> I say that because a dmabuf can be host memory, at least I am not aware
> of a restriction that a dmabuf is device memory.
>

In my limited experience dma-buf is generally device memory, and
that's really its use case. CONFIG_UDMABUF is a driver that mocks
dma-buf with a memfd which I think is used for testing. But I can do
the rename, it's more clear anyway, I think.

On Mon, Nov 6, 2023 at 11:45=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2023/11/6 10:44, Mina Almasry wrote:
> > +
> > +void netdev_free_devmem(struct page_pool_iov *ppiov)
> > +{
> > +     struct netdev_dmabuf_binding *binding =3D page_pool_iov_binding(p=
piov);
> > +
> > +     refcount_set(&ppiov->refcount, 1);
> > +
> > +     if (gen_pool_has_addr(binding->chunk_pool,
> > +                           page_pool_iov_dma_addr(ppiov), PAGE_SIZE))
>
> When gen_pool_has_addr() returns false, does it mean something has gone
> really wrong here?
>

Yes, good eye. gen_pool_has_addr() should never return false, but then
again, gen_pool_free()  BUG_ON()s if it doesn't find the address,
which is an extremely severe reaction to what can be a minor bug in
the accounting. I prefer to leak rather than crash the machine. It's a
bit of defensive programming that is normally frowned upon, but I feel
like in this case it's maybe warranted due to the very severe reaction
(BUG_ON).

--=20
Thanks,
Mina
