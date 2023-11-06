Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22D67E3194
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A7610E45D;
	Mon,  6 Nov 2023 23:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D009F10E45D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 23:44:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E0D1EB81238;
 Mon,  6 Nov 2023 23:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9A3C433C7;
 Mon,  6 Nov 2023 23:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699314286;
 bh=t0BwAmAb144cG2eL0TnYT2JWy9BOS2OIlHQw4E5qN9k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=s53NL0fUZ9FBNFCipYjRnFb3FG746CBTXqochlWbarCvEwzcoPCcYJ2NLfA4wdIki
 E2onJ2+3Cat4oLe552PHcA0d/oghgDT6US1+1ZbqNtHDkCIk/vCQ7t4MUFs3vwUmyW
 GcqQu1qbBd/O2KS+fus8SxOzrPruj0rVCt+jAFArPK/tZLUGb7SkPNnRW6sk+Eains
 esV82j+7jylgEynsJGVUcmnLlSgYnDEvo+cbue1jD8SPe0/Qa6ngdKOy889KT/cxx7
 pfSfv4Qsoko6kf4Bo6MWJmfBUaQdUibdsazVbyUz/uOT8YXHCELcsmcTx4ukNRCa0d
 6fzgAAIDOTpGQ==
Message-ID: <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
Date: Mon, 6 Nov 2023 16:44:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20231106024413.2801438-6-almasrymina@google.com>
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
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index eeeda849115c..1c351c138a5b 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
>  };
>  
>  #ifdef CONFIG_DMA_SHARED_BUFFER
> +struct page_pool_iov *
> +netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
> +void netdev_free_devmem(struct page_pool_iov *ppiov);

netdev_{alloc,free}_dmabuf?

I say that because a dmabuf can be host memory, at least I am not aware
of a restriction that a dmabuf is device memory.

