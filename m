Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D7F890B73
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 21:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3383910EC3D;
	Thu, 28 Mar 2024 20:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dRfKVHSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFBC10EC3D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 20:38:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3145E6103B;
 Thu, 28 Mar 2024 20:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC19C433F1;
 Thu, 28 Mar 2024 20:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711658301;
 bh=4V4w7fC0EBbm7te+ffIKRQDvDxxoYpzMpaa3f0AoWlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dRfKVHScDsH8tRE1//91CYwzd5KWuDIPzdzz4FYy70fYNQxTI4FdYsr0rnVlRlDzy
 bg2yy/d0f1eEfdelx5bbivx7vjt1I2XcdZlEKOdXeDikFSelU1LkYAktJZJQE5tLsR
 aWlyXBPbOFfiGkb1rQ9ZnTbgEL0YbJ4i2SbETO+aCf/YHhMcqNdelehX5uFfKS1xll
 hu+eiqfLfnMN5AkY0NodQO3KanPcw3aHDw1BYdD1SX/2LmnaHHwN/NMDk0K7Em2Psg
 C2FdKw3cfmIzQDuZNhqbtY1LdZDhPcphkaPSG7Rh5XQWxlmM7Qthw7AzeTMMxiHvhg
 jCFiIDoVfirww==
Date: Thu, 28 Mar 2024 20:38:08 +0000
From: Simon Horman <horms@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [RFC PATCH net-next v7 04/14] netdev: support binding dma-buf to
 netdevice
Message-ID: <20240328203808.GL651713@kernel.org>
References: <20240326225048.785801-1-almasrymina@google.com>
 <20240326225048.785801-5-almasrymina@google.com>
 <20240328182812.GJ651713@kernel.org>
 <CAHS8izMZuRwQZsL7PQdoRcrgeh6rEa7n1NMhbm-aZMes2QHVzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izMZuRwQZsL7PQdoRcrgeh6rEa7n1NMhbm-aZMes2QHVzg@mail.gmail.com>
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

On Thu, Mar 28, 2024 at 11:55:23AM -0700, Mina Almasry wrote:
> On Thu, Mar 28, 2024 at 11:28 AM Simon Horman <horms@kernel.org> wrote:
> >
> > On Tue, Mar 26, 2024 at 03:50:35PM -0700, Mina Almasry wrote:
> > > Add a netdev_dmabuf_binding struct which represents the
> > > dma-buf-to-netdevice binding. The netlink API will bind the dma-buf to
> > > rx queues on the netdevice. On the binding, the dma_buf_attach
> > > & dma_buf_map_attachment will occur. The entries in the sg_table from
> > > mapping will be inserted into a genpool to make it ready
> > > for allocation.
> > >
> > > The chunks in the genpool are owned by a dmabuf_chunk_owner struct which
> > > holds the dma-buf offset of the base of the chunk and the dma_addr of
> > > the chunk. Both are needed to use allocations that come from this chunk.
> > >
> > > We create a new type that represents an allocation from the genpool:
> > > net_iov. We setup the net_iov allocation size in the
> > > genpool to PAGE_SIZE for simplicity: to match the PAGE_SIZE normally
> > > allocated by the page pool and given to the drivers.
> > >
> > > The user can unbind the dmabuf from the netdevice by closing the netlink
> > > socket that established the binding. We do this so that the binding is
> > > automatically unbound even if the userspace process crashes.
> > >
> > > The binding and unbinding leaves an indicator in struct netdev_rx_queue
> > > that the given queue is bound, but the binding doesn't take effect until
> > > the driver actually reconfigures its queues, and re-initializes its page
> > > pool.
> > >
> > > The netdev_dmabuf_binding struct is refcounted, and releases its
> > > resources only when all the refs are released.
> > >
> > > Signed-off-by: Willem de Bruijn <willemb@google.com>
> > > Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> > > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ...
> >
> > > +int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
> > > +                                 struct net_devmem_dmabuf_binding *binding)
> > > +{
> > > +     struct netdev_rx_queue *rxq;
> > > +     u32 xa_idx;
> > > +     int err;
> > > +
> > > +     if (rxq_idx >= dev->num_rx_queues)
> > > +             return -ERANGE;
> > > +
> > > +     rxq = __netif_get_rx_queue(dev, rxq_idx);
> > > +     if (rxq->mp_params.mp_priv)
> > > +             return -EEXIST;
> > > +
> > > +     err = xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit_32b,
> > > +                    GFP_KERNEL);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     /* We hold the rtnl_lock while binding/unbinding dma-buf, so we can't
> > > +      * race with another thread that is also modifying this value. However,
> > > +      * the driver may read this config while it's creating its * rx-queues.
> > > +      * WRITE_ONCE() here to match the READ_ONCE() in the driver.
> > > +      */
> > > +     WRITE_ONCE(rxq->mp_params.mp_ops, &dmabuf_devmem_ops);
> >
> > Hi Mina,
> >
> > This causes a build failure because mabuf_devmem_ops is not added until a
> > subsequent patch in this series.
> >
> 
> My apologies. I do notice the failure in patchwork now. I'll do a
> patch by patch build for the next iteration.

Thanks, much appreciated.

> > > +     WRITE_ONCE(rxq->mp_params.mp_priv, binding);
> > > +
> > > +     err = net_devmem_restart_rx_queue(dev, rxq_idx);
> > > +     if (err)
> > > +             goto err_xa_erase;
> > > +
> > > +     return 0;
> > > +
> > > +err_xa_erase:
> > > +     WRITE_ONCE(rxq->mp_params.mp_ops, NULL);
> > > +     WRITE_ONCE(rxq->mp_params.mp_priv, NULL);
> > > +     xa_erase(&binding->bound_rxq_list, xa_idx);
> > > +
> > > +     return err;
> > > +}
> >
> > ...
> 
> 
> 
> -- 
> Thanks,
> Mina
> 
