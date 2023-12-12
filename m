Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A48E80E598
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 09:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01C910E4F6;
	Tue, 12 Dec 2023 08:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1BC10E4F6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 08:12:28 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50c0f6b1015so6316928e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 00:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702368747; x=1702973547; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cLK67MZ2cMXqVULAwpdm/zZK5C57DrnMrrkfs3M5C2A=;
 b=DxZOsYiiW+EW5f1Q8envdiMDBGMgF+3XVS6PXv3vL07d6VwOro6+xAYoGQG7QmeIbn
 9d/tUiCbugk2iyhlg6/wUVqGDewLNGcM7IIdH9HBFvQfYSd3Sm7XEDdke1dtF1SCGF/q
 LQq9ZxW4LDslFhPIseM7B4qHi7VM8kqpkPTC6Q8AJHtASv5bznbKkcGSZ0gQVIz5qlBU
 p86iEgkvOMDctc5m3vTAGerKISnhZd7dRsClFSh3cOBQOoKgt0tDDEYo+3qD5yy5YPZ1
 bSVaCvKLG9vB4nFZgQfH9dyra3TB8o8PfliqheqlIXZFerW1uR5nqriEx71+9Jk3OB9l
 pTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702368747; x=1702973547;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cLK67MZ2cMXqVULAwpdm/zZK5C57DrnMrrkfs3M5C2A=;
 b=IB9yeAFmzRdi2MO8rGlInjFsBD1hOoEV2t4TE3YSduhju13fZHIuLb9W3PgdeBRgg0
 XUfjm1lqOQlrxIz8ufoVnoFTL6lW+PcFSG1GLdrx5l6uO+57fkE1P2OFfbLFvGABfrx2
 spLxFO8kbQCPXGXj8mol++f8sfMWRkAVzg1Fv8cztg9MaPgM3gU9c3uQb26XoWoWwuiV
 X+mDdzK8/u1zmwTCQsthR7Za5WutjVZIWdwuGALuVYOHO12FaAzhYyjLTudNujNtWW2a
 a2iA9KaDIrgyGd7/QJroQYtS/YSrtn9kOT0ntQQz1+Fl9LDb05M4ZdLFzcxvwQeG6JRQ
 JAFA==
X-Gm-Message-State: AOJu0YwENYe/eCHT78ksicfNFd9ufuA9fg8k0Wtyu6R5lM2FmJtTzMF+
 iKcPXBMj0Z1HkdaYDvzlL0Lf+RKkjM5BerA8pbt5NA==
X-Google-Smtp-Source: AGHT+IE/4NCAGrcWlk83IyW9mzgbqR3p3HmgUFXHYCCu/8mM+LfWDqVB4qdieN1J9FLWy4acb9y4oFfWbA7pp1ExuZI=
X-Received: by 2002:a05:6512:2312:b0:50b:f6d2:8569 with SMTP id
 o18-20020a056512231200b0050bf6d28569mr2921097lfu.129.1702368746841; Tue, 12
 Dec 2023 00:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-2-almasrymina@google.com>
In-Reply-To: <20231208005250.2910004-2-almasrymina@google.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 12 Dec 2023 10:11:50 +0200
Message-ID: <CAC_iWjLfc_2cEzRQDRvG1abMYH6dPhc2-c0-skUD1tjdKVFcKw@mail.gmail.com>
Subject: Re: [net-next v1 01/16] net: page_pool: factor out releasing DMA from
 releasing the page
To: Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 02:52, Mina Almasry <almasrymina@google.com> wrote:
>
> From: Jakub Kicinski <kuba@kernel.org>
>
> Releasing the DMA mapping will be useful for other types
> of pages, so factor it out. Make sure compiler inlines it,
> to avoid any regressions.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
>
> ---
>
> This is implemented by Jakub in his RFC:
>
> https://lore.kernel.org/netdev/f8270765-a27b-6ccf-33ea-cda097168d79@redhat.com/T/
>
> I take no credit for the idea or implementation. This is a critical
> dependency of device memory TCP and thus I'm pulling it into this series
> to make it revewable and mergable.
>
> ---
>  net/core/page_pool.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index c2e7c9a6efbe..ca1b3b65c9b5 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -548,21 +548,16 @@ s32 page_pool_inflight(const struct page_pool *pool, bool strict)
>         return inflight;
>  }
>
> -/* Disconnects a page (from a page_pool).  API users can have a need
> - * to disconnect a page (from a page_pool), to allow it to be used as
> - * a regular page (that will eventually be returned to the normal
> - * page-allocator via put_page).
> - */
> -static void page_pool_return_page(struct page_pool *pool, struct page *page)
> +static __always_inline
> +void __page_pool_release_page_dma(struct page_pool *pool, struct page *page)
>  {
>         dma_addr_t dma;
> -       int count;
>
>         if (!(pool->p.flags & PP_FLAG_DMA_MAP))
>                 /* Always account for inflight pages, even if we didn't
>                  * map them
>                  */
> -               goto skip_dma_unmap;
> +               return;
>
>         dma = page_pool_get_dma_addr(page);
>
> @@ -571,7 +566,19 @@ static void page_pool_return_page(struct page_pool *pool, struct page *page)
>                              PAGE_SIZE << pool->p.order, pool->p.dma_dir,
>                              DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WEAK_ORDERING);
>         page_pool_set_dma_addr(page, 0);
> -skip_dma_unmap:
> +}
> +
> +/* Disconnects a page (from a page_pool).  API users can have a need
> + * to disconnect a page (from a page_pool), to allow it to be used as
> + * a regular page (that will eventually be returned to the normal
> + * page-allocator via put_page).
> + */
> +void page_pool_return_page(struct page_pool *pool, struct page *page)
> +{
> +       int count;
> +
> +       __page_pool_release_page_dma(pool, page);
> +
>         page_pool_clear_pp_info(page);
>
>         /* This may be the last page returned, releasing the pool, so
> --
> 2.43.0.472.g3155946c3a-goog
>

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
