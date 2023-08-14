Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7773277AFE9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 05:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564DD10E0D8;
	Mon, 14 Aug 2023 03:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE0A10E0D8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 03:15:32 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-447684c4283so1393011137.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 20:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691982931; x=1692587731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZznD3nQHeXt8rIyMKVuEIcq9PJ86Iyh5+Zr5YBSO+k=;
 b=lXEI8IIbpI8n48sOXr3hvDhwYRWLaTDyqwUEopiyBDxsyroPfxCckgLGtJrXmuv5yh
 NITt110gJN2BMfkRU1xGplJ26ZK+qKQYRffILXAItJkaK4lRLuHZEjYZnTLKLtvDUqJF
 z7fg+TOKpH+fPM8941NM360b/HAbCg3iUhHaTjpugygGNaOEuGA70Vn21HawfugEFCHN
 weYVPYF8lD67+G+frhtycpgZgoVDHLTM84707d7QIVuIwrnObyG/HuCplkhnYX4L7uLn
 kpNluRS6K8yqfS8UmbWRKOBDZPkS1CpKRnOyJ9iUYQ/0FwVbEK8YSR90IlMxJBL0hGjF
 sy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691982931; x=1692587731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NZznD3nQHeXt8rIyMKVuEIcq9PJ86Iyh5+Zr5YBSO+k=;
 b=JvMwuUyp1wyr+JhMZcx//T1kVPKJ2AyVs6CwYOa4ZELtsSPpDoyP6bTurOiCFcUvRS
 GY8MGJZpNS/uh1y2Qu2m7e17KS2Fj8GaRPcjtqCn/pSg8ZNeBFIiZZCc9r+7IzBx42yi
 fpfceCHhf6OGcW8PrshsHMtQTCUGJOl1G0habYobnA385kyYLQT9avZw3KHpGmtB3mW9
 te1U+C1RtqzOFssvzLPkLdpJ0BiSYfijh81O18onjrttjZWuNUbCiVULY4cAZKvdHG/z
 FTJKwEfwoy3teExnO8FqOAnTDufXW0yJImUtrdqG/Dn/DTE4eF/b85f7YkrGsPuA2LmP
 5W0A==
X-Gm-Message-State: AOJu0Yw0Km9WBGc42xuydalLMfG4ADfQMZ1pjIZGlhUzRRT515mqDxtm
 EDkQcc4x6TTWapNkq+xY0rXQazotyFMiwH1JlixPjA==
X-Google-Smtp-Source: AGHT+IEa0Tg5PtzOiTQt+NYNH3vBjS+uoUdGntOpsIviOEZ20x4xyWrm76A5rrriWvNB4qP5/8xSY+FG1P2Nd69YIWc=
X-Received: by 2002:a67:ffd1:0:b0:444:e9a0:13f7 with SMTP id
 w17-20020a67ffd1000000b00444e9a013f7mr8062119vsq.5.1691982930754; Sun, 13 Aug
 2023 20:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-3-almasrymina@google.com>
 <7dd4f5b0-0edf-391b-c8b4-3fa82046ab7c@kernel.org>
In-Reply-To: <7dd4f5b0-0edf-391b-c8b4-3fa82046ab7c@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 13 Aug 2023 20:15:19 -0700
Message-ID: <CAHS8izMpw6+5mUkk0=VxWPkxAiZVa5G_rhTC1MwctoAo1SqoxQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/11] netdev: implement netlink api to bind
 dma-buf to netdevice
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, stephen@networkplumber.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Eric Dumazet <edumazet@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>,
 Hari Ramakrishnan <rharix@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 13, 2023 at 6:10=E2=80=AFPM David Ahern <dsahern@kernel.org> wr=
ote:
>
> On 8/9/23 7:57 PM, Mina Almasry wrote:
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 8e7d0cb540cd..02a25ccf771a 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -151,6 +151,8 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/prandom.h>
> >  #include <linux/once_lite.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/dma-buf.h>
> >
> >  #include "dev.h"
> >  #include "net-sysfs.h"
> > @@ -2037,6 +2039,182 @@ static int call_netdevice_notifiers_mtu(unsigne=
d long val,
> >       return call_netdevice_notifiers_info(val, &info.info);
> >  }
> >
> > +/* Device memory support */
> > +
> > +static void netdev_devmem_free_chunk_owner(struct gen_pool *genpool,
> > +                                        struct gen_pool_chunk *chunk,
> > +                                        void *not_used)
> > +{
> > +     struct dmabuf_genpool_chunk_owner *owner =3D chunk->owner;
> > +
> > +     kvfree(owner->ppiovs);
> > +     kfree(owner);
> > +}
> > +
> > +void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *bindin=
g)
> > +{
> > +     size_t size, avail;
> > +
> > +     gen_pool_for_each_chunk(binding->chunk_pool,
> > +                             netdev_devmem_free_chunk_owner, NULL);
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
> > +     dma_buf_detach(binding->dmabuf, binding->attachment);
> > +     dma_buf_put(binding->dmabuf);
> > +     kfree(binding);
> > +}
> > +
> > +void netdev_unbind_dmabuf_to_queue(struct netdev_dmabuf_binding *bindi=
ng)
> > +{
> > +     struct netdev_rx_queue *rxq;
> > +     unsigned long xa_idx;
> > +
> > +     list_del_rcu(&binding->list);
> > +
> > +     xa_for_each(&binding->bound_rxq_list, xa_idx, rxq)
> > +             if (rxq->binding =3D=3D binding)
> > +                     rxq->binding =3D NULL;
> > +
> > +     netdev_devmem_binding_put(binding);
>
> This does a put on the binding but it does not notify the driver that
> that the dmabuf references need to be flushed from the rx queue.
>

Correct, FWIW this is called out in the commit message of this patch,
and is a general issue with all memory providers and not really
specific to the memory provider added for devmem TCP. Jakub described
the issue in the cover letter of the memory provider proposal:
https://lore.kernel.org/netdev/20230707183935.997267-1-kuba@kernel.org/

For now the selftest triggers a driver reset after bind & unbind for
the configuration to take effect. I think the right thing to do is a
generic solution should be applied to the general memory provider
proposal and devmem TCP will follow that.

One way to resolve this could be to trigger ethtool_ops->reset() call
on any memory provider configuration, which would recreate the queues
as part of the reset. Or adding a new API (ethtool op or otherwise)
which will only recreate the queues (or a specific queue).

> Also, what about the device getting deleted - e.g., the driver is removed=
?
>

Good point, I don't think I'm handling that correctly. I'm not sure
what the solution is at the moment. It probably is not right for the
bind to do a netdev_hold(), because it doesn't make much sense for the
dma-buf binding to keep the netdev alive, I think.

So probably the netdev freeing needs to unbind from the dma-buf, and
the netlink unbind needs to not duplicate the unbind. Should be simple
to implement I think. Thanks for catching.

> > +}
> > +
> > +int netdev_bind_dmabuf_to_queue(struct net_device *dev, unsigned int d=
mabuf_fd,
> > +                             u32 rxq_idx, struct netdev_dmabuf_binding=
 **out)
> > +{
> > +     struct netdev_dmabuf_binding *binding;
> > +     struct netdev_rx_queue *rxq;
> > +     struct scatterlist *sg;
> > +     struct dma_buf *dmabuf;
> > +     unsigned int sg_idx, i;
> > +     unsigned long virtual;
> > +     u32 xa_idx;
> > +     int err;
> > +
> > +     rxq =3D __netif_get_rx_queue(dev, rxq_idx);
> > +
> > +     if (rxq->binding)
> > +             return -EEXIST;
>
> So this proposal is limiting a binding to a single dmabuf at a time? Is
> this just for the RFC?
>

I'm only allowing 1 rx queue to be bound to 1 dma-buf, and that is a
permanent restriction, I think. It would be amazing if we could bind
multiple dma-bufs to the same rx queue and the driver could somehow
know which dma-buf this packet is destined for. Unfortunately I don't
think drivers can do this without fancy parsing of incoming traffic,
and devmem TCP is possible without such driver support - as long as we
restrict 1 dma-buf per queue.

> Also, this suggests that the Rx queue is unique to the flow.  I do not
> recall a netdev API to create H/W queues on the fly (only a passing
> comment from Kuba), so how is the H/W queue (or queue set since a
> completion queue is needed as well) created for the flow? And in turn if
> it is unique to the flow, what deletes the queue if an app does not do a
> proper cleanup? If the queue sticks around, the dmabuf references stick
> around.
>

An RX queue is unique to an application & its dma-buf, not a single
flow. It is possible for the application to bind its dma-buf to an rx
queue, then steer multiple flows to that rx queue, and receive
incoming packets from these multiple flows onto its dma-buf.

Not implemented in this POC RFC, but will be implemented in the next
version: it should also be possible for the application to bind its
dma-buf to multiple rx queues, and steer its flows to one of these rx
queues, and receive incoming packets on the dma-buf.

I'm currently not thinking along the lines of creating a new H/W queue
for each new devmem flow. Instead, an existing queue gets re-purposed
for device memory TCP by binding it to a dma-buf and configuring flow
steering & RSS to steer this dma-buf owner's flows onto this rx queue.

We could go in the direction of creating new H/W queues for each
dma-buf binding if you think there is some upside. Off the top of my
head, I think the current model fits in better with the general
memory-provider plans which configure existing queues rather than
create new ones.

> Also, if this is an app specific h/w queue, flow steering is not
> mentioned in this RFC.
>

Technically it's not an app-specific h/w queue. In theory it's also
possible for multiple applications running under the same user to
share a single dma-buf which is bound to any number of rx queues, and
for all these applications to receive incoming packets on the shared
dma-buf simultaneously.

Flow steering is mentioned as a dependency in the cover letter, but
I've largely neglected to elaborate on how the use case works
end-to-end with userspace flow steering & RSS configuration, largely
because the APIs are flexible to handle many different use cases.
Sorry about that, I'll add a section regarding that in the next
iteration.

> > +
> > +     dmabuf =3D dma_buf_get(dmabuf_fd);
> > +     if (IS_ERR_OR_NULL(dmabuf))
> > +             return -EBADFD;
> > +
> > +     binding =3D kzalloc_node(sizeof(*binding), GFP_KERNEL,
> > +                            dev_to_node(&dev->dev));
> > +     if (!binding) {
> > +             err =3D -ENOMEM;
> > +             goto err_put_dmabuf;
> > +     }
> > +
> > +     xa_init_flags(&binding->bound_rxq_list, XA_FLAGS_ALLOC);
> > +
> > +     refcount_set(&binding->ref, 1);
> > +
> > +     binding->dmabuf =3D dmabuf;
> > +
> > +     binding->attachment =3D dma_buf_attach(binding->dmabuf, dev->dev.=
parent);
> > +     if (IS_ERR(binding->attachment)) {
> > +             err =3D PTR_ERR(binding->attachment);
> > +             goto err_free_binding;
> > +     }
> > +
> > +     binding->sgt =3D dma_buf_map_attachment(binding->attachment,
> > +                                           DMA_BIDIRECTIONAL);
> > +     if (IS_ERR(binding->sgt)) {
> > +             err =3D PTR_ERR(binding->sgt);
> > +             goto err_detach;
> > +     }
> > +
> > +     /* For simplicity we expect to make PAGE_SIZE allocations, but th=
e
> > +      * binding can be much more flexible than that. We may be able to
> > +      * allocate MTU sized chunks here. Leave that for future work...
> > +      */
> > +     binding->chunk_pool =3D gen_pool_create(PAGE_SHIFT,
> > +                                           dev_to_node(&dev->dev));
> > +     if (!binding->chunk_pool) {
> > +             err =3D -ENOMEM;
> > +             goto err_unmap;
> > +     }
> > +
> > +     virtual =3D 0;
> > +     for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
> > +             dma_addr_t dma_addr =3D sg_dma_address(sg);
> > +             struct dmabuf_genpool_chunk_owner *owner;
> > +             size_t len =3D sg_dma_len(sg);
> > +             struct page_pool_iov *ppiov;
> > +
> > +             owner =3D kzalloc_node(sizeof(*owner), GFP_KERNEL,
> > +                                  dev_to_node(&dev->dev));
> > +             owner->base_virtual =3D virtual;
> > +             owner->base_dma_addr =3D dma_addr;
> > +             owner->num_ppiovs =3D len / PAGE_SIZE;
> > +             owner->binding =3D binding;
> > +
> > +             err =3D gen_pool_add_owner(binding->chunk_pool, dma_addr,
> > +                                      dma_addr, len, dev_to_node(&dev-=
>dev),
> > +                                      owner);
> > +             if (err) {
> > +                     err =3D -EINVAL;
> > +                     goto err_free_chunks;
> > +             }
> > +
> > +             owner->ppiovs =3D kvmalloc_array(owner->num_ppiovs,
> > +                                            sizeof(*owner->ppiovs),
> > +                                            GFP_KERNEL);
> > +             if (!owner->ppiovs) {
> > +                     err =3D -ENOMEM;
> > +                     goto err_free_chunks;
> > +             }
> > +
> > +             for (i =3D 0; i < owner->num_ppiovs; i++) {
> > +                     ppiov =3D &owner->ppiovs[i];
> > +                     ppiov->owner =3D owner;
> > +                     refcount_set(&ppiov->refcount, 1);
> > +             }
> > +
> > +             dma_addr +=3D len;
> > +             virtual +=3D len;
> > +     }
> > +
> > +     /* TODO: need to be able to bind to multiple rx queues on the sam=
e
> > +      * netdevice. The code should already be able to handle that with
> > +      * minimal changes, but the netlink API currently allows for 1 rx
> > +      * queue.
> > +      */
> > +     err =3D xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit=
_32b,
> > +                    GFP_KERNEL);
> > +     if (err)
> > +             goto err_free_chunks;
> > +
> > +     rxq->binding =3D binding;
> > +     *out =3D binding;
> > +
> > +     return 0;
> > +
> > +err_free_chunks:
> > +     gen_pool_for_each_chunk(binding->chunk_pool,
> > +                             netdev_devmem_free_chunk_owner, NULL);
> > +     gen_pool_destroy(binding->chunk_pool);
> > +err_unmap:
> > +     dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> > +                              DMA_BIDIRECTIONAL);
> > +err_detach:
> > +     dma_buf_detach(dmabuf, binding->attachment);
> > +err_free_binding:
> > +     kfree(binding);
> > +err_put_dmabuf:
> > +     dma_buf_put(dmabuf);
> > +     return err;
> > +}
> > +
> >  #ifdef CONFIG_NET_INGRESS
> >  static DEFINE_STATIC_KEY_FALSE(ingress_needed_key);
> >
> > diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> > index bf7324dd6c36..288ed0112995 100644
> > --- a/net/core/netdev-genl.c
> > +++ b/net/core/netdev-genl.c> @@ -167,10 +231,37 @@ static int netdev_g=
enl_netdevice_event(struct
> notifier_block *nb,
> >       return NOTIFY_OK;
> >  }
> >
> > +static int netdev_netlink_notify(struct notifier_block *nb, unsigned l=
ong state,
> > +                              void *_notify)
> > +{
> > +     struct netlink_notify *notify =3D _notify;
> > +     struct netdev_dmabuf_binding *rbinding;
> > +
> > +     if (state !=3D NETLINK_URELEASE || notify->protocol !=3D NETLINK_=
GENERIC)
> > +             return NOTIFY_DONE;
> > +
> > +     rcu_read_lock();
> > +
> > +     list_for_each_entry_rcu(rbinding, &netdev_rbinding_list, list) {
> > +             if (rbinding->owner_nlportid =3D=3D notify->portid) {
> > +                     netdev_unbind_dmabuf_to_queue(rbinding);
>
> This ties the removal of a dmabuf to the close of the netlink socket as
> suggested in the previous round of comments. What happens if the process
> closes the dmabuf fd? Is the outstanding dev binding sufficient to keep
> the allocation / use in place?
>

Correct, the outstanding dev binding keeps the dma-buf & its
attachment in place until the driver no longer needs the binding and
drops the references.

--=20
Thanks,
Mina
