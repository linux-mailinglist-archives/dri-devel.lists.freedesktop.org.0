Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C580B089
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 00:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC52B10EB62;
	Fri,  8 Dec 2023 23:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6D410EB60
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 23:25:14 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-4b3203cdc78so644018e0c.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 15:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702077914; x=1702682714;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3tzRei4DqUvL1gHDjLu5ZyN+XyR0fbOVm4A1dgKAmU=;
 b=OkWfaCDVitnaGXa3fnmd42uBHExUXCIP0u3e43TTxbZ5fzV/8uP322nS0PQmnY3soq
 5AzTwV620pJ/ktaXDFsexVotfjPU4g7EI/5DW60CesjU2M/J0BsnfnvosTSElpzP9tXJ
 v/d1Fij0k12LNnF7DCFShltxKU5IFC4VJNQPYXTNHCCe1n6TJRHYT4FF65ARUBKmS65T
 PFkogk+1NbLQKGFRGq58KUm/gIJiOfFh6ktpxdP9tajM5V2zfF+AgTIOfApVjzVuM5+n
 2n8iOzjy19ZMQn6b8n5BFMwFrYeW8/qUkHVBe/8S2iEXdGlNA6PGlTbGiE52nOsdfgrk
 GnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702077914; x=1702682714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3tzRei4DqUvL1gHDjLu5ZyN+XyR0fbOVm4A1dgKAmU=;
 b=I6V2VOm0DtcdOTDHW1wJKYkPliIkvM14IhrG7F/oM4jND0nMhYrECE6w71eFwTbz3u
 JXKEU5NhByCevhGgzpr8WPm7lxT3nWa5eG7Qtc+vvmjQyi95zGUrvzFDz14d5M/Jr2VK
 PDpOTd1rN+QClMQqWQqUMH0idavfd09rmHsAuo5/JIptHaEgdXLV6UZCz/ppcdQ/qEMH
 bMo2r8ZhEXgblHg+bzT4dspToeXFxVRU/vc2TK+n5pV4xE9FEAUxpsttUkaaNwNklFez
 Mxb559XalxWeM7mQfHPl2/drM67isphhDk+wRd6ub2Fncv0GAF3Iqjc8h8EyOgQtwAvG
 ncAA==
X-Gm-Message-State: AOJu0YxO0YO1s90yEZkFk0G3bOtJl483Rirpmw8AoL8YMvLLGR00Z6sS
 5pxSYMPkqAmjEe1BxuZDse63tf7z0yQEuhCx4vR32w==
X-Google-Smtp-Source: AGHT+IEFKUc5exoP0JWsRvhqP/54jx/lwOw3AZl/60NefSo43kRLaVvc1XrXulWzYoWwJeZdst7FzfPYeaWKAp2Juns=
X-Received: by 2002:a05:6102:3f0a:b0:464:5036:fb69 with SMTP id
 k10-20020a0561023f0a00b004645036fb69mr858666vsv.30.1702077913540; Fri, 08 Dec
 2023 15:25:13 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-9-almasrymina@google.com>
 <b07a4eca-0c3d-4620-9f97-b1d2c76642c2@gmail.com>
In-Reply-To: <b07a4eca-0c3d-4620-9f97-b1d2c76642c2@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 8 Dec 2023 15:25:00 -0800
Message-ID: <CAHS8izNVFx6oHoo7y86P8Di9VCVe8A_n_9UZFkg5Wnt=A=YcNQ@mail.gmail.com>
Subject: Re: [net-next v1 08/16] memory-provider: dmabuf devmem memory provider
To: Pavel Begunkov <asml.silence@gmail.com>
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
Cc: linux-doc@vger.kernel.org, Kaiyuan Zhang <kaiyuanz@google.com>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 8, 2023 at 2:56=E2=80=AFPM Pavel Begunkov <asml.silence@gmail.c=
om> wrote:
>
> On 12/8/23 00:52, Mina Almasry wrote:
...
> > +     if (pool->p.queue)
> > +             binding =3D READ_ONCE(pool->p.queue->binding);
> > +
> > +     if (binding) {
> > +             pool->mp_ops =3D &dmabuf_devmem_ops;
> > +             pool->mp_priv =3D binding;
> > +     }
>
> Hmm, I don't understand why would we replace a nice transparent
> api with page pool relying on a queue having devmem specific
> pointer? It seemed more flexible and cleaner in the last RFC.
>

Jakub requested this change and may chime in, but I suspect it's to
further abstract the devmem changes from driver. In this iteration,
the driver grabs the netdev_rx_queue and passes it to the page_pool,
and any future configurations between the net stack and page_pool can
be passed this way with the driver unbothered.

> > +
> >       if (pool->mp_ops) {
> >               err =3D pool->mp_ops->init(pool);
> >               if (err) {
> > @@ -1020,3 +1033,77 @@ void page_pool_update_nid(struct page_pool *pool=
, int new_nid)
> >       }
> >   }
> >   EXPORT_SYMBOL(page_pool_update_nid);
> > +
> > +void __page_pool_iov_free(struct page_pool_iov *ppiov)
> > +{
> > +     if (WARN_ON(ppiov->pp->mp_ops !=3D &dmabuf_devmem_ops))
> > +             return;
> > +
> > +     netdev_free_dmabuf(ppiov);
> > +}
> > +EXPORT_SYMBOL_GPL(__page_pool_iov_free);
>
> I didn't look too deep but I don't think I immediately follow
> the pp refcounting. It increments pages_state_hold_cnt on
> allocation, but IIUC doesn't mark skbs for recycle? Then, they all
> will be put down via page_pool_iov_put_many() bypassing
> page_pool_return_page() and friends. That will call
> netdev_free_dmabuf(), which doesn't bump pages_state_release_cnt.
>
> At least I couldn't make it work with io_uring, and for my purposes,
> I forced all puts to go through page_pool_return_page(), which calls
> the ->release_page callback. The callback will put the reference and
> ask its page pool to account release_cnt. It also gets rid of
> __page_pool_iov_free(), as we'd need to add a hook there for
> customization otherwise.
>
> I didn't care about overhead because the hot path for me is getting
> buffers from a ring, which is somewhat analogous to sock_devmem_dontneed(=
),
> but done on pp allocations under napi, and it's done separately.
>
> Completely untested with TCP devmem:
>
> https://github.com/isilence/linux/commit/14bd56605183dc80b540999e8058c79a=
c92ae2d8
>

This was a mistake in the last RFC, which should be fixed in v1. In
the RFC I was not marking the skbs as skb_mark_for_recycle(), so the
unreffing path wasn't as expected.

In this iteration, that should be completely fixed. I suspect since I
just posted this you're actually referring to the issue tested on the
last RFC? Correct me if wrong.

In this iteration, the reffing story:

- memory provider allocs ppiov and returns it to the page pool with
ppiov->refcount =3D=3D 1.
- The page_pool gives the page to the driver. The driver may
obtain/release references with page_pool_page_[get|put]_many(), but
the driver is likely not doing that unless it's doing its own page
recycling.
- The net stack obtains references via skb_frag_ref() ->
page_pool_page_get_many()
- The net stack drops references via skb_frag_unref() ->
napi_pp_put_page() -> page_pool_return_page() and friends.

Thus, the issue where the unref path was skipping
page_pool_return_page() and friends should be resolved in this
iteration, let me know if you think otherwise, but I think this was an
issue limited to the last RFC.

> > +
> > +/*** "Dmabuf devmem memory provider" ***/
> > +
> > +static int mp_dmabuf_devmem_init(struct page_pool *pool)
> > +{
> > +     struct netdev_dmabuf_binding *binding =3D pool->mp_priv;
> > +
> > +     if (!binding)
> > +             return -EINVAL;
> > +
> > +     if (!(pool->p.flags & PP_FLAG_DMA_MAP))
> > +             return -EOPNOTSUPP;
> > +
> > +     if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
> > +             return -EOPNOTSUPP;
> > +
> > +     netdev_dmabuf_binding_get(binding);
> > +     return 0;
> > +}
> > +
> > +static struct page *mp_dmabuf_devmem_alloc_pages(struct page_pool *poo=
l,
> > +                                              gfp_t gfp)
> > +{
> > +     struct netdev_dmabuf_binding *binding =3D pool->mp_priv;
> > +     struct page_pool_iov *ppiov;
> > +
> > +     ppiov =3D netdev_alloc_dmabuf(binding);
> > +     if (!ppiov)
> > +             return NULL;
> > +
> > +     ppiov->pp =3D pool;
> > +     pool->pages_state_hold_cnt++;
> > +     trace_page_pool_state_hold(pool, (struct page *)ppiov,
> > +                                pool->pages_state_hold_cnt);
> > +     return (struct page *)((unsigned long)ppiov | PP_IOV);
> > +}
> > +
> > +static void mp_dmabuf_devmem_destroy(struct page_pool *pool)
> > +{
> > +     struct netdev_dmabuf_binding *binding =3D pool->mp_priv;
> > +
> > +     netdev_dmabuf_binding_put(binding);
> > +}
> > +
> > +static bool mp_dmabuf_devmem_release_page(struct page_pool *pool,
> > +                                       struct page *page)
> > +{
> > +     struct page_pool_iov *ppiov;
> > +
> > +     if (WARN_ON_ONCE(!page_is_page_pool_iov(page)))
> > +             return false;
> > +
> > +     ppiov =3D page_to_page_pool_iov(page);
> > +     page_pool_iov_put_many(ppiov, 1);
> > +     /* We don't want the page pool put_page()ing our page_pool_iovs. =
*/
> > +     return false;
> > +}
> > +
> > +const struct memory_provider_ops dmabuf_devmem_ops =3D {
> > +     .init                   =3D mp_dmabuf_devmem_init,
> > +     .destroy                =3D mp_dmabuf_devmem_destroy,
> > +     .alloc_pages            =3D mp_dmabuf_devmem_alloc_pages,
> > +     .release_page           =3D mp_dmabuf_devmem_release_page,
> > +};
> > +EXPORT_SYMBOL(dmabuf_devmem_ops);
>
> --
> Pavel Begunkov



--=20
Thanks,
Mina
