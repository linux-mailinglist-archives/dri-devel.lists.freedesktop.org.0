Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5762E7E8683
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 00:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFB510E2CA;
	Fri, 10 Nov 2023 23:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C9E10E2C7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 23:19:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B2D361B36;
 Fri, 10 Nov 2023 23:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C55C433C9;
 Fri, 10 Nov 2023 23:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699658377;
 bh=luJNmLAVg0NvFE4vMKzZIgSGc1vreIiFo+6ll6uU50g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K1fE9DxAmngdEnLFVm0IGl0MMxV8bmBLE0Ae9DA9ep5/htSzaSPrZ06BwKpbu8Awv
 QQkFJyOpbK1xhaj0LojSLeZ6qxU+20U73LLDIwR8j0EbdT2o90JDNif00PNGcZjgQX
 R+z1UqQYhwDMVhxvxSxemLWgLvTkTyTjtXhnMqvI7zRUOwypHo4TEp0IkYZQUrVHW/
 hgFXKLSR/BOf7nYeVqQ30PWCnefMPg90ivl3acdKti9EBwizBYD4TTbUSk/87mr5p0
 VkzMPc0fv3Vdsxw8bT+iI8746rthCtklXgTSra4ki3boHAj2e4s8JAKvzp/9+hlwSH
 /4kbehSUkS9kQ==
Date: Fri, 10 Nov 2023 15:19:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 08/12] net: support non paged skb frags
Message-ID: <20231110151935.0859fd7a@kernel.org>
In-Reply-To: <20231106024413.2801438-9-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-9-almasrymina@google.com>
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
Cc: linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>, linux-kselftest@vger.kernel.org,
 Praveen Kaligineedi <pkaligineedi@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun,  5 Nov 2023 18:44:07 -0800 Mina Almasry wrote:
>  #include <net/net_debug.h>
>  #include <net/dropreason-core.h>
> +#include <net/page_pool/types.h>
> +#include <net/page_pool/helpers.h>

>  /**
>   * DOC: skb checksums
> @@ -3402,15 +3404,38 @@ static inline void skb_frag_off_copy(skb_frag_t *fragto,
>  	fragto->bv_offset = fragfrom->bv_offset;
>  }
>  
> +/* Returns true if the skb_frag contains a page_pool_iov. */
> +static inline bool skb_frag_is_page_pool_iov(const skb_frag_t *frag)
> +{
> +	return page_is_page_pool_iov(frag->bv_page);
> +}

Maybe we can create a new header? For skb + page pool.

skbuff.h is included by 1/4th of the kernel objects, we should not
be adding dependencies to this header, it really slows down incremental
builds.

