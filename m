Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB5BDAA2C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780FB10E65B;
	Tue, 14 Oct 2025 16:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="URJVs5mL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B6710E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:45:23 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b404a8be3f1so123245166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760445922; x=1761050722; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JEOQpQJo98QyfYnBlnV0kP+HUCRx4XT+4+xOb+xrqYg=;
 b=URJVs5mL3ocTD42yuxf7q/4aCoToKkfHqyRl73yhu3NYyAVTJebjjnHGqcdZ/mT38z
 oXOGGIO4iSf7N+l5oc0URBl0C8k1ChdF3QiOw+XtNpg9XZyj5X7Pgsy/m0KGnxLTwOcQ
 Y4G6jrueCUJSBhrrpplF+eyWnhEK7rEOljGgbjm10strRYLzImT1LJ1yVYGF/xJ32yZN
 L4X222pxEaQmFc2GQPZHouz3tTmx8w+YZ+wb28n1dPfwRPUSBcK+gkwz1f4Y9xamEHBK
 VoEeepaLMKQd1/MyecNlrgBzmA0/aLWluXuYhkf28f7G7q8Sx47UmYTpIDieZhafoWNN
 +lQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760445922; x=1761050722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JEOQpQJo98QyfYnBlnV0kP+HUCRx4XT+4+xOb+xrqYg=;
 b=glY3wPkc+AM3/3vpmZ4K8+piVqHvHeYAHzQgCREtw8ljXFE9YXOAjVRJTAtNbgR19N
 zgz23spza2sv2SFcjFyQiaLzpN1uSce/EdRqE8fjwVCNSuO94ORaEP3PGthD68EYCA7V
 n+AZd4H6xS2RctchGyqXbkXTKqjIDazljAMSgr+xgrcfUZj5G7Lu7otblf4WS/lXW6ea
 jbGl1KlzgpL2aToLl0cxRTSIiqHWQPGo0eJ3Geeg5S/30TC/7TqmDQUpazptKJleJhZ3
 0deoXZvn0yF2+gNmu3lPVjDl7bTFwUzACul4l/6LniDIuaAbzTXhogkTD90EENMCvpT1
 bLjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyThCDJ8kM5wYMqX9TbQGBFQ7FoLQqUcH4Pnm0lXUuaHL4uwIzVZlC7J/RSaD8Zlh8brGnV+J07Ng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRhRgmiHQKGF53Vtc8LvDbKFzOxIwTTFqpYbmgUwAcOFfttCdn
 SCNWu8UJrPFTFM9SFj1JphjFAXUkDLzky+94aJHKuKDS8L7oVy46WUDh86P5GhI7w0Q=
X-Gm-Gg: ASbGncvbjUte3DIeiYtaojWh16bJjntCtzXSkdNoeE8sI/MbIqV5UazjH5CleoZVItM
 jucfddVqQ4mMp0YEy2eJd59jXiC3JTmf6vYh1j4oyy1NggIS92fpRnLSCbTUVSXZn9643gcsZuk
 tyIVo9NY/TlDQCoJPM8AUYmItGQIX50leYw5VE0mFZY/CCsH5/ey/kIioF4mngtz5Hrfy6NgWVX
 N9yKKZ8uxjhXOeLoOeY/qGaVYpuUiJ7l5YJ0DPVtlgFlScphuu/zCLp3aKnr0gmNpG/j5Q68T1i
 F7lBiJj26l4rIJtW3BHhRDcLAsuqj4h83hsZej8Aqsk5hfnCdnk1oUGSUgK/vKaqiaYXaJhz73m
 8ULnzRI9Pm2klKCb3Mxb+MIvaoxRQqwxTZ+aRYwhPvWpO0oQ2ulN4kzuBY+ZfFxxxlVE664+sU2
 vKYQ==
X-Google-Smtp-Source: AGHT+IF98YZGXnc/a9+tF96u8G13aSwGmApwD+ogJyUi8W1JPjF4gTRZUKJnX0ICaKrlb9YoA4BxHw==
X-Received: by 2002:a17:907:7ea6:b0:b46:b8a9:ea6 with SMTP id
 a640c23a62f3a-b50ac6cd23fmr1429210866b.9.1760445921504; 
 Tue, 14 Oct 2025 05:45:21 -0700 (PDT)
Received: from mordecai.tesarici.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d66cc4b8sm1150612066b.30.2025.10.14.05.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:45:21 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:45:13 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
 <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Mel Gorman
 <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, Zhaoyang Huang <huangzhaoyang@gmail.com>,
 <steve.kang@unisoc.com>
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
Message-ID: <20251014144513.445a370d@mordecai.tesarici.cz>
In-Reply-To: <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 14 Oct 2025 16:36:49 +0000
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

On Tue, 14 Oct 2025 16:32:30 +0800
"zhaoyang.huang" <zhaoyang.huang@unisoc.com> wrote:

> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> The size of once dma-buf allocation could be dozens MB or much more
> which introduce a loop of allocating several thousands of order-0 pages.
> Furthermore, the concurrent allocation could have dma-buf allocation enter
> direct-reclaim during the loop. This commit would like to eliminate the
> above two affections by introducing alloc_pages_bulk_list in dma-buf's
> order-0 allocation. This patch is proved to be conditionally helpful
> in 18MB allocation as decreasing the time from 24604us to 6555us and no
> harm when bulk allocation can't be done(fallback to single page
> allocation)
> 
> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 36 +++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index bbe7881f1360..71b028c63bd8 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -300,8 +300,8 @@ static const struct dma_buf_ops system_heap_buf_ops = {
>  	.release = system_heap_dma_buf_release,
>  };
>  
> -static struct page *alloc_largest_available(unsigned long size,
> -					    unsigned int max_order)
> +static void alloc_largest_available(unsigned long size,
> +		    unsigned int max_order, unsigned int *num_pages, struct list_head *list)

This interface feels weird. Maybe you could return the number of pages
instead of making this a void function and passing a pointer to get that
number?

>  {
>  	struct page *page;
>  	int i;
> @@ -312,12 +312,19 @@ static struct page *alloc_largest_available(unsigned long size,
>  		if (max_order < orders[i])
>  			continue;
>  
> -		page = alloc_pages(order_flags[i], orders[i]);
> -		if (!page)
> +		if (orders[i]) {
> +			page = alloc_pages(order_flags[i], orders[i]);

nitpick: Since the lowest order is special-cased now, you can simply
use HIGH_ORDER_GFP here and remove order_flags[] entirely.

> +			if (page) {
> +				list_add(&page->lru, list);
> +				*num_pages = 1;
> +			}
> +		} else
> +			*num_pages = alloc_pages_bulk_list(LOW_ORDER_GFP, size / PAGE_SIZE, list);
> +
> +		if (list_empty(list))
>  			continue;
> -		return page;
> +		return;
>  	}
> -	return NULL;
>  }
>  
>  static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
> @@ -335,6 +342,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  	struct list_head pages;
>  	struct page *page, *tmp_page;
>  	int i, ret = -ENOMEM;
> +	unsigned int num_pages;
> +	LIST_HEAD(head);
>  
>  	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
>  	if (!buffer)
> @@ -348,6 +357,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  	INIT_LIST_HEAD(&pages);
>  	i = 0;
>  	while (size_remaining > 0) {
> +		num_pages = 0;
> +		INIT_LIST_HEAD(&head);
>  		/*
>  		 * Avoid trying to allocate memory if the process
>  		 * has been killed by SIGKILL
> @@ -357,14 +368,15 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  			goto free_buffer;
>  		}
>  
> -		page = alloc_largest_available(size_remaining, max_order);
> -		if (!page)
> +		alloc_largest_available(size_remaining, max_order, &num_pages, &head);
> +		if (!num_pages)
>  			goto free_buffer;
>  
> -		list_add_tail(&page->lru, &pages);
> -		size_remaining -= page_size(page);
> -		max_order = compound_order(page);
> -		i++;
> +		list_splice_tail(&head, &pages);
> +		max_order = folio_order(lru_to_folio(&head));
> +		size_remaining -= PAGE_SIZE * (num_pages << max_order);

This looks complicated. What about changing alloc_largest_available()
to return the total number of pages and using PAGE_SIZE * num_page?

Ah, you still have to look at the folio order to determine the new
value of max_order, so no big win. Hm. You could pass a pointer to
max_order down to alloc_largest_available(), but at that point I think
it's a matter of taste (aka bikeshedding).

Petr T

> +		i += num_pages;
> +
>  	}
>  
>  	table = &buffer->sg_table;

