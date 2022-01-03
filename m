Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B9483745
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 19:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BC410E12A;
	Mon,  3 Jan 2022 18:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4910E124
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 18:57:44 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id s4so39122832ljd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 10:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MMhWstZ09q6Cszqpd54WHd2qjsYduZF9Gp6qbEFoKEg=;
 b=CYPX06mYYQ2+cOhSoLGgV/rWQWqKCDXJJ9Iw+5ssEOfXIYPGzUj7v+4rgZWAs1vh9q
 5dxy3dqwPKsdPh8M3wwJtoHaqrBWQUbMh0A78AgqwE65oMtsmJWN3KeAWc/54E/cAKAr
 Af4lQCwRkQcSkAYn+OL6rnmExbIWZFSFNvDj7/ZAPCsUj/Rz2SXUD2thJ9cfusFoDFQr
 QGbuXD9mOwVVPjgcFZxbjvS/9OAAV9ib3h9azZpUnhYbKgMGsSu28tLpirCWUJjnPYR+
 xzbw3RM5EoVWXwBcFP6EaXw9vEwmSo8tRcQaG21dwkUF+pAPRLaunXbEMhCn4sM7w1Y6
 xpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MMhWstZ09q6Cszqpd54WHd2qjsYduZF9Gp6qbEFoKEg=;
 b=WoQZ3+X6DMnh3V92Jz5vc0zQsr3IXvuXH3o9Fx9GTcqlb2GCjaVasEPX8XWJQ5/2EX
 KmTBpfFqsudG00H1PHTUqwbOX3YHA1FCNUcsah4m0HjzrZ3cZQYPyMKgVtJAtROVSNU5
 hHe/23VxhOMB7th/ewttrOtWJw4AcI2ut4WckE2+wsghJIz9UakGt1465iRwUoIvC8an
 WCy3OxveFl8RzwL7MOgP6VYEWbvYOTQUDHyCxZBktCYaImeIz/sqfX0WvRoifedQoZmZ
 2IFZDFv+V5Z6GLq+AuwckPmpzEeXp9Yr9Bsh8lESwrXgFbBkGjLE6mNKr6yMqGnn7xOL
 pMow==
X-Gm-Message-State: AOAM533di9NKej6xV3HTt1wCFmQiO2WXXw4fZH+wiyhnV8pbHFXVTfJy
 b19ATgYGd5iHRfQ5iKkAOUBt6PQm8/9cDik8swbbCQ==
X-Google-Smtp-Source: ABdhPJxESlTLF6vDjNiq9g3jYw19mn2gjb5KvscdlznFgTwwArdG339mJObBz8nFkUB+6pOx0s4aqg8oPJhp9SWaWGY=
X-Received: by 2002:a2e:9b96:: with SMTP id z22mr37955720lji.427.1641236262660; 
 Mon, 03 Jan 2022 10:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20211217094104.24977-1-guangming.cao@mediatek.com>
 <20211227095102.6054-1-guangming.cao@mediatek.com>
In-Reply-To: <20211227095102.6054-1-guangming.cao@mediatek.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 3 Jan 2022 10:57:30 -0800
Message-ID: <CALAqxLVA4jUk-2o28RZobrPDUnuXfV1xN77Pt8Pu1o27V3aUQQ@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
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
Cc: wsd_upstream@mediatek.com, Libo Kang <libo.kang@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 jianjiao zeng <jianjiao.zeng@mediatek.com>, Yunfei Wang <yf.wang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Bo Song <bo.song@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 mingyuan ma <mingyuan.ma@mediatek.com>, Laura Abbott <labbott@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 27, 2021 at 1:52 AM <guangming.cao@mediatek.com> wrote:
>
> From: Guangming <Guangming.Cao@mediatek.com>
>

Thanks for submitting this!

> Add a size check for allcation since the allocation size is

nit: "allocation" above.

> always less than the total DRAM size.

In general, it might be good to add more context to the commit message
to better answer *why* this change is needed rather than what the
change is doing.  ie: What negative thing happens without this change?
And so how does this change avoid or improve things?


> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
> ---
> v2: 1. update size limitation as total_dram page size.
>     2. update commit message
> ---
>  drivers/dma-buf/dma-heap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 56bf5ad01ad5..e39d2be98d69 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -55,6 +55,8 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
>         struct dma_buf *dmabuf;
>         int fd;
>
> +       if (len / PAGE_SIZE > totalram_pages())
> +               return -EINVAL;

This seems sane. I know ION used to have some 1/2 of memory cap to
avoid unnecessary memory pressure on crazy allocations.

Could you send again with an improved commit message?

thanks
-john
