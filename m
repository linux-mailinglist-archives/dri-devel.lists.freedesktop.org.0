Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A6F4A5053
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 21:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1DB10E329;
	Mon, 31 Jan 2022 20:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2641810E329
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 20:39:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id p27so29432557lfa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 12:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=np4e6RD8bcxsxGDFQSQ6Wvj5x603dmmfdRkFqggTL3M=;
 b=Q4SKA5IdjOz/7QFJ4Z0X+4KOqGhoQSt94SjvwcSaCX0K1amQag2xp72Y70oVzIJGcV
 OlkNrq8mgz77qJTAyhk2ZhTUD8l59Ruv4ESJDIgK8PuM7cGAVMVlvhnSbXjs1Dm1PTRY
 daLdGSWYyMbdN4r/Q81TPuibY9bOCHGirpuyJzlZctK9lV4ipEdM3h6KtXdmooqEnaO1
 9TU2+AahMi3PpeYAKqyXsqLYMZt1e9n35LLp01tdvQKnUokZaNrpMl6TkYBgT1VVpPCZ
 lRqC1mC2TjZojYuydSDAxZMEl9jlC4KhGpqQRvRQzjGFHnHmWYcjF/NYXWXpESIunHpQ
 FsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=np4e6RD8bcxsxGDFQSQ6Wvj5x603dmmfdRkFqggTL3M=;
 b=xO08vTYThDSzJGRudjBuFDCeJX/1n7C4gDYUAzJOpGr57TcakwNAo0/XVEE9Zq5rct
 1mHgywMoKfVTMqMbYJDr6wvWBkGKHdzNUdem/mGbgQKfnfrfGygk1AJX+yuwmBLNUSQG
 EvXME9HqUi37qkMRv3P57B2dCDhy5sS6s/V/qGHT59mVZABh0mOxxDCYRI5BndQRMP4X
 4Fj7HECb0QcNtdFlvawPyiIqETILxtPeNtIQAyqLVrCot6QDJLHkTMZx+5kPhlh5WBle
 a9A2HeHOq8dxEC0WZqqQMlH8POm3Yi3fhPxVtWdJ3o9WU06LDdR/D7V5b/ypII/p34SY
 U3xA==
X-Gm-Message-State: AOAM531ZwedFMZ2nffanlMB7gjWqHF+dFGDoI/1xv+ICXg7q5tpuvwmt
 zojwRJvCaFDk84dBAA+7khifO17rM/B+2f7pOFmQJw==
X-Google-Smtp-Source: ABdhPJwujbhq+i0qTNRuZ+BiGkLSicKWY8TPo9L2LEzw9/qgpOhmUj+SNSa3a4Mh4JMV8MtM6PSgZiAXNhoauP0uUk4=
X-Received: by 2002:a05:6512:4012:: with SMTP id
 br18mr15944158lfb.533.1643661580262; 
 Mon, 31 Jan 2022 12:39:40 -0800 (PST)
MIME-Version: 1.0
References: <20220129150604.3461652-1-jordy@pwning.systems>
In-Reply-To: <20220129150604.3461652-1-jordy@pwning.systems>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 31 Jan 2022 12:39:29 -0800
Message-ID: <CALAqxLU58UYLRNrf4C7t4_SmSa1aUVaDj4SP=zCPfb9m6HBUNw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Fix potential spectre v1 gadget
To: Jordy Zomer <jordy@pwning.systems>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 29, 2022 at 7:06 AM Jordy Zomer <jordy@pwning.systems> wrote:
>
> It appears like nr could be a Spectre v1 gadget as it's supplied by a
> user and used as an array index. Prevent the contents
> of kernel memory from being leaked to userspace via speculative
> execution by using array_index_nospec.
>
> Signed-off-by: Jordy Zomer <jordy@pwning.systems>
> ---
>  drivers/dma-buf/dma-heap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 56bf5ad01ad5..8f5848aa144f 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -14,6 +14,7 @@
>  #include <linux/xarray.h>
>  #include <linux/list.h>
>  #include <linux/slab.h>
> +#include <linux/nospec.h>
>  #include <linux/uaccess.h>
>  #include <linux/syscalls.h>
>  #include <linux/dma-heap.h>
> @@ -135,6 +136,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
>         if (nr >= ARRAY_SIZE(dma_heap_ioctl_cmds))
>                 return -EINVAL;
>
> +       nr = array_index_nospec(nr, ARRAY_SIZE(dma_heap_ioctl_cmds));
>         /* Get the kernel ioctl cmd that matches */
>         kcmd = dma_heap_ioctl_cmds[nr];

Thanks for submitting this! It looks sane to me.

Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
