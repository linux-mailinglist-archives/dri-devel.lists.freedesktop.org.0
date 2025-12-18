Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA814CCC272
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 15:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540B010E9E6;
	Thu, 18 Dec 2025 14:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mlsvZNpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8DA10E9D9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:00:53 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5959105629bso582318e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766066452; x=1766671252; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gia3XsZVU5S68keMVbCpat85CsVkLa/AQdgBIvpcJZo=;
 b=mlsvZNpOrfi/QjMoswdcnh7kxWQUJW+E1+GpLmKzvpxrzfXV0pk0fRpVenD4bLs1vt
 SeXkZMxMQQEOV/P1gkfzVvqo+gJLGfxe78q1SDhtRNYmHVR1ZDxNCHK2Mxr09WODo8Kf
 Bxvb+iwGbIbPhx1ekcbHNpujF3VTCqRdKa95QkdvMMQccyhywkqmTdW6Z4vlZiBqxUn5
 AHTAsi7rNQd1AaGuoZ/sl4SGHmGu0LscFcGG93ZhPzcgTiawlvPOwrjJ8PiGNVGbDLqH
 88GId+G3BCV5W3fJuWcaxMfflUnbmsGdEYeRSZgj7yDsnAhL/AL0iRYsbkQbdKSUs13L
 xEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766066452; x=1766671252;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gia3XsZVU5S68keMVbCpat85CsVkLa/AQdgBIvpcJZo=;
 b=JAqLTCXYt+vN4Bl90NJCXUSOKlO2gH95NrW+FQhwUSTMVRk4OAi1lzKGXXbg/0Zy74
 Em9smfqmcTms5mnch5ASwgRYGMj9PUlmbBBxa5IjsbiBTFv3LIT7J2gPKCwrBMf0CP9t
 qag936f+GtcPsfVPtdja/4QJIqjZz4RkGHLHfcQAcGnsO19dQHY+d7C9sLAjwxHJhqXH
 BojtiJ9ELQIEWeEz0N6TtYMp+wdhrenQVhqUNZ/7MhOsnlxVLX7jmBFOngkx4m/YG3B0
 siHl+OvqWIfVsfVTP4V+y4whtiFi0CzWk5n/89kCkycBPw8wyjw35q+Pf0+4DUMSyPlu
 +6Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Dh46++M+L7LmVzN419Ti6OZHhqMhzCefl7h/EFipr2KNg88Tdln6VarAZ5LCQ7wGIpFQB4WwXDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs6st0NsgawpLKglCMejRkEhF/EPmdFlLKRJ7tkBEhEjT3K/vw
 aoP4pfXgsuxoepwQ61Xg9liKtizlryH1w3f13qjhXDWFoE/868h1e0dlcXP9wn+n
X-Gm-Gg: AY/fxX5v23Wna0rln5FedkdsSZycA2NulHlaxfSxxI2diOVvS5d/iFHti1S4dWhOwl6
 SO/7ty7t16xqUHJ4f1N1YAut9QPcCdgQg6T5hqWLKE8j2pnjm+kZAqJgd77FDp8nUWR0v2/heDj
 b2OTaAscy/oBF8q/8TdJ8VX2RHFTvwPTVR3GY+b7eUkPYo+wlfNYhlLg9uiX+UdUbNlX1Ng7tNv
 kSYSGyTP2qxNPkdqjEEBHNDr+mZXRAiCJXP6RLlIrHHe+fUOAuaWAowzubTP0ioRuQg/lRw6X6h
 9HNhUowZKrVOssPFCP09NJkN3aoeHnMUk8o44FrZh3DYddrweCUIywU3f3SeIxZvoU4mue3gJTi
 op35s9MbPSKa63cR9nn9qgiuuvEdN2y8UuGr3fOvM/5IKMSTWxp9QxwHlcOMDn4Y=
X-Google-Smtp-Source: AGHT+IEl4Wys7Q4SsRgNG2E+WQ1GNUkskpWJrAarDBASWdaJXnRcMQIARLijn7oPvUMXkjAijza9bw==
X-Received: by 2002:a05:6512:3ba5:b0:597:d702:58e5 with SMTP id
 2adb3069b0e04-598faa8408amr8438081e87.39.1766066451811; 
 Thu, 18 Dec 2025 06:00:51 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a132d4109sm1108082e87.41.2025.12.18.06.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 06:00:51 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 18 Dec 2025 15:00:49 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 David Hildenbrand <david@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Message-ID: <aUQJEa643lQAGK6s@milan>
References: <20251215053050.11599-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215053050.11599-1-21cnbao@gmail.com>
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

On Mon, Dec 15, 2025 at 01:30:50PM +0800, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> In many cases, the pages passed to vmap() may include high-order
> pages allocated with __GFP_COMP flags. For example, the systemheap
> often allocates pages in descending order: order 8, then 4, then 0.
> Currently, vmap() iterates over every page individually—even pages
> inside a high-order block are handled one by one.
> 
> This patch detects high-order pages and maps them as a single
> contiguous block whenever possible.
> 
> An alternative would be to implement a new API, vmap_sg(), but that
> change seems to be large in scope.
> 
> When vmapping a 128MB dma-buf using the systemheap, this patch
> makes system_heap_do_vmap() roughly 17× faster.
> 
> W/ patch:
> [   10.404769] system_heap_do_vmap took 2494000 ns
> [   12.525921] system_heap_do_vmap took 2467008 ns
> [   14.517348] system_heap_do_vmap took 2471008 ns
> [   16.593406] system_heap_do_vmap took 2444000 ns
> [   19.501341] system_heap_do_vmap took 2489008 ns
> 
> W/o patch:
> [    7.413756] system_heap_do_vmap took 42626000 ns
> [    9.425610] system_heap_do_vmap took 42500992 ns
> [   11.810898] system_heap_do_vmap took 42215008 ns
> [   14.336790] system_heap_do_vmap took 42134992 ns
> [   16.373890] system_heap_do_vmap took 42750000 ns
> 
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  * diff with rfc:
>  Many code refinements based on David's suggestions, thanks!
>  Refine comment and changelog according to Uladzislau, thanks!
>  rfc link:
>  https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/
> 
>  mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 41dd01e8430c..8d577767a9e5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int stride, unsigned int max_steps, unsigned int idx)
> +{
> +	int nr_pages = 1;
> +
> +	/*
> +	 * Currently, batching is only supported in vmap_pages_range
> +	 * when page_shift == PAGE_SHIFT.
> +	 */
> +	if (stride != 1)
> +		return 0;
> +
> +	nr_pages = compound_nr(pages[idx]);
> +	if (nr_pages == 1)
> +		return 0;
> +	if (max_steps < nr_pages)
> +		return 0;
> +
> +	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
> +		return compound_order(pages[idx]);
> +	return 0;
> +}
> +
Can we instead look at this as: it can be that we have continues
set of pages let's find out. I mean if we do not stick just to
compound pages.

--
Uladzislau Rezki
