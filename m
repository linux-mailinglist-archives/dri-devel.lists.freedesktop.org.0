Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3427E3223
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF44310E47D;
	Tue,  7 Nov 2023 00:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D81810E47D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:16:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1049B60959;
 Tue,  7 Nov 2023 00:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EF7C433C8;
 Tue,  7 Nov 2023 00:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699316181;
 bh=rdCTl+4hQmLubYiMS/p2QV8xEsJXv+ZSM2pgQqPjLVQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LHFJpRRpE9spIepJHWhKG3x06BG5ePCOBuH4QJZkUidEwERp/tNEcGEPDfwoYcMsD
 LwQ+LDowdMk/nRme8Pe/2PP8U5mpI2/vbQhTfrjDmoqRK0P0GMn3klxMiSbaEGAvQx
 TxXq8Y5RvYtNAFTBQmRE6GfauJ63a/UJka/kDzDprGDEt16iWZR1vfQi3/2DP/Asai
 fs3QZ5heBo/8vttlafXTbhlXmNU5RDgI6S3oS67JNxncI/lQdczhxSDJGJZhgR1QIC
 kDsR5rXhwiQHG8PesuHnV3MhFJjuLD1YVEoyKFwdec07E1shE+t0tHzE2NG0moUC11
 E/fd2myN6ldFA==
Message-ID: <fa44c3d1-92b9-4686-ab3b-4fcda257aafd@kernel.org>
Date: Mon, 6 Nov 2023 17:16:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20231106024413.2801438-10-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/5/23 7:44 PM, Mina Almasry wrote:
> diff --git a/net/core/datagram.c b/net/core/datagram.c
> index 176eb5834746..cdd4fb129968 100644
> --- a/net/core/datagram.c
> +++ b/net/core/datagram.c
> @@ -425,6 +425,9 @@ static int __skb_datagram_iter(const struct sk_buff *skb, int offset,
>  			return 0;
>  	}
>  
> +	if (skb_frags_not_readable(skb))
> +		goto short_copy;
> +
>  	/* Copy paged appendix. Hmm... why does this look so complicated? */
>  	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
>  		int end;
> @@ -616,6 +619,9 @@ int __zerocopy_sg_from_iter(struct msghdr *msg, struct sock *sk,
>  {
>  	int frag;
>  
> +	if (skb_frags_not_readable(skb))
> +		return -EFAULT;

This check ....
> +
>  	if (msg && msg->msg_ubuf && msg->sg_from_iter)
>  		return msg->sg_from_iter(sk, skb, from, length);


... should go here. That allows custome sg_from_iter to have access to
the skb. What matters is not expecting struct page (e.g., refcounting);
if the custom iter does not do that then all is well. io_uring's iter
does not look at the pages, so all good.

>  
> diff --git a/net/core/gro.c b/net/core/gro.c
> index 42d7f6755f32..56046d65386a 100644
> --- a/net/core/gro.c
> +++ b/net/core/gro.c
> @@ -390,6 +390,9 @@ static void gro_pull_from_frag0(struct sk_buff *skb, int grow)
>  {
>  	struct skb_shared_info *pinfo = skb_shinfo(skb);
>  
> +	if (WARN_ON_ONCE(skb_frags_not_readable(skb)))
> +		return;
> +
>  	BUG_ON(skb->end - skb->tail < grow);
>  
>  	memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
> @@ -411,7 +414,7 @@ static void gro_try_pull_from_frag0(struct sk_buff *skb)
>  {
>  	int grow = skb_gro_offset(skb) - skb_headlen(skb);
>  
> -	if (grow > 0)
> +	if (grow > 0 && !skb_frags_not_readable(skb))
>  		gro_pull_from_frag0(skb, grow);
>  }
>  
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 13eca4fd25e1..f01673ed2eff 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -1230,6 +1230,14 @@ void skb_dump(const char *level, const struct sk_buff *skb, bool full_pkt)
>  		struct page *p;
>  		u8 *vaddr;
>  
> +		if (skb_frag_is_page_pool_iov(frag)) {

Why skb_frag_is_page_pool_iov here vs skb_frags_not_readable?
