Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FB749463E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 04:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646DA10E1C1;
	Thu, 20 Jan 2022 03:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2D810E123
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:49:09 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m3so16832586lfu.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 19:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AZnU5cEeFyaFBnpj/0CbEtA8JHuWrnQecXMIYCnzB/o=;
 b=ErV1kJfadCu1b5wgD6aEviZCSAk41KIjnGh8WYn8aHbrfBmz/Z03LAGBXFW2rQaPAJ
 8nUEBpkWeomoODmY334NhCZOU+o0EljJbg8u2iyiFqhQzZA+efnPNwuXwUbmf0s5v/T1
 kCYeVe9Uk4rKeiAhQV0qJH3LNcIRAZLLfIB4l+8HBTpN2EbhE7OMo9MsZ1jJFtNumTI7
 6nq4zktXZrLgMTkM/3rhi6H2v1j+XohmCPmuRZ67scdSpSHYsD2JZXkUmKHOEB9cL3zx
 lOz0lnwWIRRBoK8mzCl56IReSHCns1DzoysZ5ToPrtmXJlo7ywMjgvALaTMfHs/M01U3
 VAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AZnU5cEeFyaFBnpj/0CbEtA8JHuWrnQecXMIYCnzB/o=;
 b=ezXZ0ZWNOK3lHyrocKJOWb4kW7n6DaDNeOdGlqIE5I6djWYb2wAd9+uYgBBrClSU5X
 lodu4gAN5RwOsO4lRlM8xC23+nEDxE1vnGjZoKveC/f2Cc/PoUOdsP2ozw2KKeCodRJX
 rAQfmsdYQjko7vszeYWZmRTbJAnpE6WBuQqV6DS1M+LX8A0lXYnhbkz8UtRIijbZbGGR
 AFu9lCAg2KPHLbNYsv4jHs4FsHIa6Zz3MlxOnMj8njn/NxRR7+/WnLyasIsWc+sFBiGO
 WAIXtw2GtBEsjSDthpQE59UwJuiS+jWpDVrQOdDdY1tKAvu/XTK53FHA2hm+WK2Jnf/l
 9Emw==
X-Gm-Message-State: AOAM530TyvhDrtD+lDwhvUGADeWVZkicNAMDSHpAK7fNi9UJjOtLouyI
 sj0aEwRqVk8tCO60mZILGvlY76baHC5ReFr8WopOVA==
X-Google-Smtp-Source: ABdhPJx0/Bt4Fv7Zhtxsw2WH0QARsie3jQTiwGG/ZBJTXsXxHRBXcquj3uP0/ZLAIBtBfzPMkNDAYvLD72ukCtWU1g8=
X-Received: by 2002:a05:6512:3e1f:: with SMTP id
 i31mr25221311lfv.661.1642650547311; 
 Wed, 19 Jan 2022 19:49:07 -0800 (PST)
MIME-Version: 1.0
References: <CALAqxLUtK8V9LgC-DY+tkzFYyWfzF+JhbrLZk6UhEG57HQBDSA@mail.gmail.com>
 <20220120033450.90164-1-guangming.cao@mediatek.com>
In-Reply-To: <20220120033450.90164-1-guangming.cao@mediatek.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 19 Jan 2022 19:48:55 -0800
Message-ID: <CALAqxLW5uEZCGHGk3rYoiOGzN5XMKb39JzoPB1iEX9k3UsiT-A@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: system_heap: Add a size check for allocation
To: guangming.cao@mediatek.com
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
Cc: linux-arm-kernel@lists.infradead.org, caoguangming34@gmail.com,
 lmark@codeaurora.org, wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mingyuan.ma@mediatek.com,
 linaro-mm-sig@lists.linaro.org, michael.j.ruhl@intel.com, yf.wang@mediatek.com,
 linux-mediatek@lists.infradead.org, libo.kang@mediatek.com,
 benjamin.gaignard@linaro.org, bo.song@mediatek.com, matthias.bgg@gmail.com,
 labbott@redhat.com, christian.koenig@amd.com, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 7:34 PM <guangming.cao@mediatek.com> wrote:
>
> From: Guangming <Guangming.Cao@mediatek.com>
>
> Add a size check for allocation since the allocation size should be
> always less than the total DRAM size on system heap.
> And it can prevent consuming too much time for invalid allocations.
>
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..bd6f255620e2 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -347,6 +347,13 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>         struct page *page, *tmp_page;
>         int i, ret = -ENOMEM;
>
> +       /*
> +        * Size check. The "len" should be less than totalram since system_heap
> +        * memory is comes from system. Adding check here can prevent consuming
> +        * too much time for invalid allocations.
> +        */
> +       if (len >> PAGE_SHIFT > totalram_pages())
> +               return -EINVAL;

Thanks so much for revising and sending this along! It looks good to me.

Acked-by: John Stultz <john.stultz@linaro.org>

thanks again
-john
