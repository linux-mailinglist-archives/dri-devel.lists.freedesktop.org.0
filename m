Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF575875CF9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 04:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EEF10F739;
	Fri,  8 Mar 2024 03:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZADXQRtg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6750A10F739
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 03:58:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 67D146124B;
 Fri,  8 Mar 2024 03:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA81C433F1;
 Fri,  8 Mar 2024 03:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709870312;
 bh=mF6Wbp6MtxfNFDHq0iHrXjjYNWZxisqag9vARhbWvOU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZADXQRtggZVF7jCXRnr/Nx++UqGw2O1E+U/KttSTtzSSlM9bBjttGEo/A8hRic7ge
 O+gDFK9MJBHmJ2YDam/9YZE3gp0xxBazL1mTi5MDwug/eJk53dwV/etCOw6KZlAWuN
 2i1Oe8pKYSCdgSopwQohIoatN4yPvCX5Cuzbnr/d5jvVAjw1Ie2U1uJLT8OtOKVyTs
 N5lwkQbIk4pRTkVTCTO3QA4II1m8BzPZ9ti7U330EoXvcxzor4u0v+kBt/tUSkRAKp
 tt8z4/H4M6CWk2MTdlJfmcAQM/5mZHnYRX7fG89CTjTzKp4ec7OLIdHAisaNLAPPMH
 kRchFPzFcbV0A==
Date: Thu, 7 Mar 2024 19:58:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, "Christian =?UTF-8?B?S8O2bmln?="
 <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, David
 Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeelb@google.com>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, Kaiyuan
 Zhang <kaiyuanz@google.com>
Subject: Re: [RFC PATCH net-next v6 05/15] netdev: support binding dma-buf
 to netdevice
Message-ID: <20240307195828.183a76c2@kernel.org>
In-Reply-To: <20240305020153.2787423-6-almasrymina@google.com>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-6-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon,  4 Mar 2024 18:01:40 -0800 Mina Almasry wrote:
> +	if (!dev || !dev->netdev_ops)
> +		return -EINVAL;

too defensive

> +	if (!dev->netdev_ops->ndo_queue_stop ||
> +	    !dev->netdev_ops->ndo_queue_mem_free ||
> +	    !dev->netdev_ops->ndo_queue_mem_alloc ||
> +	    !dev->netdev_ops->ndo_queue_start)
> +		return -EOPNOTSUPP;
> +
> +	new_mem = dev->netdev_ops->ndo_queue_mem_alloc(dev, rxq_idx);
> +	if (!new_mem)
> +		return -ENOMEM;
> +
> +	err = dev->netdev_ops->ndo_queue_stop(dev, rxq_idx, &old_mem);
> +	if (err)
> +		goto err_free_new_mem;
> +
> +	err = dev->netdev_ops->ndo_queue_start(dev, rxq_idx, new_mem);
> +	if (err)
> +		goto err_start_queue;
> +
> +	dev->netdev_ops->ndo_queue_mem_free(dev, old_mem);

nice :)

> +	rxq = __netif_get_rx_queue(dev, rxq_idx);
> +
> +	if (rxq->binding)

nit: a few places have an empty line between call and error check

> +		return -EEXIST;

> +	if (!capable(CAP_NET_ADMIN))
> +		return -EPERM;

this can be a flag on the netlink policy, no?

	flags: [ admin-perm ]

on the op

> +	dmabuf = dma_buf_get(dmabuf_fd);
> +	if (IS_ERR_OR_NULL(dmabuf))
> +		return -EBADFD;


> +	hdr = genlmsg_put(rsp, info->snd_portid, info->snd_seq,

genlmsg_iput()

> +static int netdev_netlink_notify(struct notifier_block *nb, unsigned long state,
> +				 void *_notify)
> +{
> +	struct netlink_notify *notify = _notify;
> +	struct netdev_dmabuf_binding *rbinding;
> +
> +	if (state != NETLINK_URELEASE || notify->protocol != NETLINK_GENERIC)
> +		return NOTIFY_DONE;
> +
> +	rtnl_lock();
> +
> +	list_for_each_entry(rbinding, &netdev_rbinding_list, list) {
> +		if (rbinding->owner_nlportid == notify->portid) {
> +			netdev_unbind_dmabuf(rbinding);
> +			break;
> +		}
> +	}
> +
> +	rtnl_unlock();
> +
> +	return NOTIFY_OK;
> +}

While you were not looking we added three new members to the netlink
family:

 * @sock_priv_size: the size of per-socket private memory
 * @sock_priv_init: the per-socket private memory initializer
 * @sock_priv_destroy: the per-socket private memory destructor

You should be able to associate state with a netlink socket
and have it auto-destroyed if the socket closes.
LMK if that doesn't work for you, I was hoping it would fit nicely.

I just realized now that the code gen doesn't know how to spit
those members out, but I'll send a patch tomorrow, you can hack
it manually until that gets in.
