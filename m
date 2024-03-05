Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234087293D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 22:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98774112CC2;
	Tue,  5 Mar 2024 21:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xQmZ5kHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69787112CC2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 21:17:25 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a458eb7db13so22342466b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 13:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709673443; x=1710278243;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LpvlKXjZceUyV7T13tDS41t/F1Xa1LPW/laeLkdBF1g=;
 b=xQmZ5kHibB0YN22mKlbFieQha8d6BZeA8QrhAwwONO9SGnMXhGVPLsQJXVlfbVeSx8
 SYMH+CW1QNUF1UPMsa10xmJ82kwF/T0LL1sKOdonHkBZO8HXxlQ/xcxoRJzkyiM3nC9R
 scC1lj4kaoVKTA5hetgm3fJSKQJTDZaKufsUrVAnCXTxjNYiFaTtiv5TKobI5xKPsVAm
 6Aq8gG0DOxuXwlf7i+9xZdkH9upUoX2Lgv5P55o1BAHW9LVpJhRDsTipOw7QaYDE1ho7
 S3U8nUeX8Fnnk8DBZTDo5Uw52WEdnqHENJSSrfEnQeGR3/hOX5EPgLbOwAml2uzTeMrs
 tLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709673443; x=1710278243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LpvlKXjZceUyV7T13tDS41t/F1Xa1LPW/laeLkdBF1g=;
 b=LScRwFYguOCTP53yrC/MwgBw3QdCzEthxusHHJxG2CJe5fU+7WJVo1Q4NrJ6tZv7hO
 jqPmh61HOGzguOa8zoFKyKA3xfxanaGL8nvRQVaTWXJHUPBP16xNqTGa7dlLs/z38xBx
 PvbAAFt3WDIburULfn0t43vpdxWC7vvNQ8bSdYeTSOs6b0ydwrzfCzms8TkCpS1xgoUv
 R3K1agnzVfIAFkpTcsxRoIMAYT83umq+LYbeu/EkL0KHNiHiNJMVms7rpByNUXRnyWfr
 oOoZaoqXOclGXgw8kaNaRvoqMzFqD0i6eEnUwvVp8NQ86wEqHxnR7/uyrgGZOfX0mQDO
 xBTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKbJf+XU10YAQVPbHr0ty+Ed3XYpodmeZyGRq0b/ZsfciARSe7Ea6WetgEZIxSVVNatyO0Iq/y5LNfk4Df42456tlCrjF12FpjjsyxR1CD
X-Gm-Message-State: AOJu0YwL3y1xxN0kVl/7x0BzdKVvEMarnymmNMz8bZ53P7tMJLfy7rbu
 pWBK8fNR2ZKe8r1xhWLb/fbkZaWMmmUaEVv8wkoKE72TX3x+n5fRS3psHGlBiwNRcqs7QjoymR6
 89K8OnmS3ae4Gl3np1VnE8u5i0L/ISUWvwc0k
X-Google-Smtp-Source: AGHT+IHlC+vBw635Kt73+dsHbQtM7EL6jyFCQWoNIhJRg5JiyGmYfM2wu4YJxtfkn8eGdUtq4eym/8JfbCk0TV4RoFA=
X-Received: by 2002:a17:906:3c17:b0:a43:86f3:b00b with SMTP id
 h23-20020a1709063c1700b00a4386f3b00bmr8581734ejg.0.1709673442968; Tue, 05 Mar
 2024 13:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-6-almasrymina@google.com>
 <da42cea9-c169-599e-f087-d38c419e3dab@huawei.com>
In-Reply-To: <da42cea9-c169-599e-f087-d38c419e3dab@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 13:17:08 -0800
Message-ID: <CAHS8izM7GbvWHrH=h9q0oG0DMU649EjT1udNEW_8F-hGeC15EQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 05/15] netdev: support binding dma-buf to
 netdevice
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
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
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
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

On Tue, Mar 5, 2024 at 4:55=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2024/3/5 10:01, Mina Almasry wrote:
>
> ...
>
> >
> > The netdev_dmabuf_binding struct is refcounted, and releases its
> > resources only when all the refs are released.
> >
> > Signed-off-by: Willem de Bruijn <willemb@google.com>
> > Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >
> > RFC v6:
> > - Validate rx queue index
> > - Refactor new functions into devmem.c (Pavel)
>
> It seems odd that the functions or stucts in a file called devmem.c
> are named after 'dmabuf' instead of 'devmem'.
>

So my intention with this naming that devmem.c contains all the
functions for all devmem tcp specific support. Currently the only
devmem we support is dmabuf. In the future, other devmem may be
supported and it can fit nicely in devmem.c. For example, if we want
to extend devmem TCP to support NVMe devices, we need to add support
for p2pdma, maybe, and we can add that support under the devmem.c
umbrella rather than add new files.

But I can rename to dmabuf.c if there is strong objection to the current na=
me.

> >
>
> ...
>
> > diff --git a/include/net/netmem.h b/include/net/netmem.h
> > index d8b810245c1d..72e932a1a948 100644
> > --- a/include/net/netmem.h
> > +++ b/include/net/netmem.h
> > @@ -8,6 +8,16 @@
> >  #ifndef _NET_NETMEM_H
> >  #define _NET_NETMEM_H
> >
> > +#include <net/devmem.h>
> > +
> > +/* net_iov */
> > +
> > +struct net_iov {
> > +     struct dmabuf_genpool_chunk_owner *owner;
> > +};
> > +
> > +/* netmem */
> > +
> >  /**
> >   * typedef netmem_ref - a nonexistent type marking a reference to gene=
ric
> >   * network memory.
> > diff --git a/net/core/Makefile b/net/core/Makefile
> > index 821aec06abf1..592f955c1241 100644
> > --- a/net/core/Makefile
> > +++ b/net/core/Makefile
> > @@ -13,7 +13,7 @@ obj-y                    +=3D dev.o dev_addr_lists.o =
dst.o netevent.o \
> >                       neighbour.o rtnetlink.o utils.o link_watch.o filt=
er.o \
> >                       sock_diag.o dev_ioctl.o tso.o sock_reuseport.o \
> >                       fib_notifier.o xdp.o flow_offload.o gro.o \
> > -                     netdev-genl.o netdev-genl-gen.o gso.o
> > +                     netdev-genl.o netdev-genl-gen.o gso.o devmem.o
> >
> >  obj-$(CONFIG_NETDEV_ADDR_LIST_TEST) +=3D dev_addr_lists_test.o
> >
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index fe054cbd41e9..bbea1b252529 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -155,6 +155,9 @@
> >  #include <net/netdev_rx_queue.h>
> >  #include <net/page_pool/types.h>
> >  #include <net/page_pool/helpers.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/dma-buf.h>
> > +#include <net/devmem.h>
> >
> >  #include "dev.h"
> >  #include "net-sysfs.h"
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > new file mode 100644
> > index 000000000000..779ad990971e
> > --- /dev/null
> > +++ b/net/core/devmem.c
> > @@ -0,0 +1,293 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *      Devmem TCP
> > + *
> > + *      Authors:     Mina Almasry <almasrymina@google.com>
> > + *                   Willem de Bruijn <willemdebruijn.kernel@gmail.com=
>
> > + *                   Kaiyuan Zhang <kaiyuanz@google.com
> > + */
> > +
> > +#include <linux/types.h>
> > +#include <linux/mm.h>
> > +#include <linux/netdevice.h>
> > +#include <trace/events/page_pool.h>
> > +#include <net/netdev_rx_queue.h>
> > +#include <net/page_pool/types.h>
> > +#include <net/page_pool/helpers.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/dma-buf.h>
> > +#include <net/devmem.h>
> > +
> > +/* Device memory support */
> > +
> > +#ifdef CONFIG_DMA_SHARED_BUFFER
>
> I still think it is worth adding its own config for devmem or dma-buf
> for networking, thinking about the embeded system.
>

FWIW Willem did weigh on this previously and said he prefers to have
it unguarded by a CONFIG, but I will submit to whatever the consensus
here. It shouldn't be a huge deal to add a CONFIG technically
speaking.

> > +static void netdev_dmabuf_free_chunk_owner(struct gen_pool *genpool,
> > +                                        struct gen_pool_chunk *chunk,
> > +                                        void *not_used)
>
> It seems odd to still keep the netdev_ prefix as it is not really related
> to netdev, perhaps use 'net_' or something better.
>

Yes, thanks for catching. I can change to net_devmem_ maybe or net_dmabuf_*=
.

> > +{
> > +     struct dmabuf_genpool_chunk_owner *owner =3D chunk->owner;
> > +
> > +     kvfree(owner->niovs);
> > +     kfree(owner);
> > +}
> > +
> > +void __netdev_dmabuf_binding_free(struct netdev_dmabuf_binding *bindin=
g)
> > +{
> > +     size_t size, avail;
> > +
> > +     gen_pool_for_each_chunk(binding->chunk_pool,
> > +                             netdev_dmabuf_free_chunk_owner, NULL);
> > +
> > +     size =3D gen_pool_size(binding->chunk_pool);
> > +     avail =3D gen_pool_avail(binding->chunk_pool);
> > +
> > +     if (!WARN(size !=3D avail, "can't destroy genpool. size=3D%lu, av=
ail=3D%lu",
> > +               size, avail))
> > +             gen_pool_destroy(binding->chunk_pool);
> > +
> > +     dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> > +                              DMA_BIDIRECTIONAL);
>
> For now DMA_FROM_DEVICE seems enough as tx is not supported yet.
>

Yes, good catch. I suspect we want to reuse this code for TX path. But
for now, I'll test with DMA_FROM_DEVICE and if I see no issues I'll
apply this change.

> > +     dma_buf_detach(binding->dmabuf, binding->attachment);
> > +     dma_buf_put(binding->dmabuf);
> > +     xa_destroy(&binding->bound_rxq_list);
> > +     kfree(binding);
> > +}
> > +
> > +static int netdev_restart_rx_queue(struct net_device *dev, int rxq_idx=
)
> > +{
> > +     void *new_mem;
> > +     void *old_mem;
> > +     int err;
> > +
> > +     if (!dev || !dev->netdev_ops)
> > +             return -EINVAL;
> > +
> > +     if (!dev->netdev_ops->ndo_queue_stop ||
> > +         !dev->netdev_ops->ndo_queue_mem_free ||
> > +         !dev->netdev_ops->ndo_queue_mem_alloc ||
> > +         !dev->netdev_ops->ndo_queue_start)
> > +             return -EOPNOTSUPP;
> > +
> > +     new_mem =3D dev->netdev_ops->ndo_queue_mem_alloc(dev, rxq_idx);
> > +     if (!new_mem)
> > +             return -ENOMEM;
> > +
> > +     err =3D dev->netdev_ops->ndo_queue_stop(dev, rxq_idx, &old_mem);
> > +     if (err)
> > +             goto err_free_new_mem;
> > +
> > +     err =3D dev->netdev_ops->ndo_queue_start(dev, rxq_idx, new_mem);
> > +     if (err)
> > +             goto err_start_queue;
> > +
> > +     dev->netdev_ops->ndo_queue_mem_free(dev, old_mem);
> > +
> > +     return 0;
> > +
> > +err_start_queue:
> > +     dev->netdev_ops->ndo_queue_start(dev, rxq_idx, old_mem);
>
> It might worth mentioning why queue start with old_mem will always
> success here as the return value seems to be ignored here.
>

So the old queue, we stopped it, and if we fail to bring up the new
queue, then we want to start the old queue back up to get the queue
back to a workable state.

I don't see what we can do to recover if restarting the old queue
fails. Seems like it should be a requirement that the driver tries as
much as possible to keep the old queue restartable.

I can improve this by at least logging or warning if restarting the
old queue fails.

> > +
> > +err_free_new_mem:
> > +     dev->netdev_ops->ndo_queue_mem_free(dev, new_mem);
> > +
> > +     return err;
> > +}
> > +
> > +/* Protected by rtnl_lock() */
> > +static DEFINE_XARRAY_FLAGS(netdev_dmabuf_bindings, XA_FLAGS_ALLOC1);
> > +
> > +void netdev_unbind_dmabuf(struct netdev_dmabuf_binding *binding)
> > +{
> > +     struct netdev_rx_queue *rxq;
> > +     unsigned long xa_idx;
> > +     unsigned int rxq_idx;
> > +
> > +     if (!binding)
> > +             return;
> > +
> > +     if (binding->list.next)
> > +             list_del(&binding->list);
>
> The above does not seems to be a good pattern to delete a entry, is
> there any reason having a checking before the list_del()? seems like
> defensive programming?
>

I think I needed to apply this condition to handle the case where
netdev_unbind_dmabuf() is called when binding->list is not initialized
or is empty.

netdev_nl_bind_rx_doit() will call unbind to free a partially
allocated binding in error paths, so, netdev_unbind_dmabuf() may be
called with a partially initialized binding. This is why we check for
binding->list is initialized here and check that rxq->binding =3D=3D
binding below. The main point is that netdev_unbind_dmabuf() may be
asked to unbind a partially bound dmabuf due to error paths.

Maybe a comment here will test this better. I will double confirm the
check is needed for the error paths in netdev_nl_bind_rx_doit().

> > +
> > +     xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
> > +             if (rxq->binding =3D=3D binding) {
>
> It seems like defensive programming here too?
>
> > +                     /* We hold the rtnl_lock while binding/unbinding
> > +                      * dma-buf, so we can't race with another thread =
that
> > +                      * is also modifying this value. However, the dri=
ver
> > +                      * may read this config while it's creating its
> > +                      * rx-queues. WRITE_ONCE() here to match the
> > +                      * READ_ONCE() in the driver.
> > +                      */
> > +                     WRITE_ONCE(rxq->binding, NULL);
> > +
> > +                     rxq_idx =3D get_netdev_rx_queue_index(rxq);
> > +
> > +                     netdev_restart_rx_queue(binding->dev, rxq_idx);
> > +             }
> > +     }
> > +
> > +     xa_erase(&netdev_dmabuf_bindings, binding->id);
> > +
> > +     netdev_dmabuf_binding_put(binding);
> > +}
> > +
>


--=20
Thanks,
Mina
