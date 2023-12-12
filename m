Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A180F608
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 20:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163F710E04C;
	Tue, 12 Dec 2023 19:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C78110E04C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 19:08:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7F6760EEA;
 Tue, 12 Dec 2023 19:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54B9C433C8;
 Tue, 12 Dec 2023 19:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702408094;
 bh=jhISTjjXnV6IhH0cY8Vge/0tePQdfehvyIi305w0McY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Au4hC/1gn8GAGqeNMIHMx+pf9H5e6cZx6if1YTAQ6myI1fcVcXp5E5HE2JZd7l5Ox
 z67YTPNEYCNjnSuydNuYjf11+fIKfzPgHgAvXDJMesthEcR7qviRft/QV/5zK2IHqc
 ruHQ42BTGcBdnaq77FMuM0r1fOHC9LqNVWjgGTPuAoXZTpwGA7dF5WXD028QLwM5fU
 83R8uUGoHmwAgKnoHD0ERZyXGTjjQTXsSeJdhkJcoe/E2jvGdjrJ/mAO3N0OzKkaja
 5wgu6LG6g2ra++dYX1DnvaNKyc0fxe1LJrSA1Kpyox0qvKLpHzYMqlHmzVyMur9vKu
 ehmZCE5A0RUew==
Date: Tue, 12 Dec 2023 19:08:06 +0000
From: Simon Horman <horms@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [net-next v1 14/16] net: add SO_DEVMEM_DONTNEED setsockopt to
 release RX frags
Message-ID: <20231212190806.GB5817@kernel.org>
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-15-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208005250.2910004-15-almasrymina@google.com>
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 04:52:45PM -0800, Mina Almasry wrote:
> Add an interface for the user to notify the kernel that it is done
> reading the devmem dmabuf frags returned as cmsg. The kernel will
> drop the reference on the frags to make them available for re-use.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

...

> diff --git a/net/core/sock.c b/net/core/sock.c
> index fef349dd72fa..521bdc4ff260 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -1051,6 +1051,41 @@ static int sock_reserve_memory(struct sock *sk, int bytes)
>  	return 0;
>  }
>  
> +static noinline_for_stack int
> +sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
> +{
> +	struct dmabuf_token tokens[128];

Hi Mina,

I am guessing it is mostly due to the line above,
but on x86 32bit builds I see:

	warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than

> +	unsigned int num_tokens, i, j;
> +	int ret;
> +
> +	if (sk->sk_type != SOCK_STREAM || sk->sk_protocol != IPPROTO_TCP)
> +		return -EBADF;
> +
> +	if (optlen % sizeof(struct dmabuf_token) || optlen > sizeof(tokens))
> +		return -EINVAL;
> +
> +	num_tokens = optlen / sizeof(struct dmabuf_token);
> +	if (copy_from_sockptr(tokens, optval, optlen))
> +		return -EFAULT;
> +
> +	ret = 0;
> +	for (i = 0; i < num_tokens; i++) {
> +		for (j = 0; j < tokens[i].token_count; j++) {
> +			struct page *page = xa_erase(&sk->sk_user_pages,
> +						     tokens[i].token_start + j);
> +
> +			if (page) {
> +				if (WARN_ON_ONCE(!napi_pp_put_page(page,
> +								   false)))
> +					page_pool_page_put_many(page, 1);
> +				ret++;
> +			}
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  void sockopt_lock_sock(struct sock *sk)
>  {
>  	/* When current->bpf_ctx is set, the setsockopt is called from

...
