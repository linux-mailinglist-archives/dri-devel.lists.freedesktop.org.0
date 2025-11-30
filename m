Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58378C952F6
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 18:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9307310E041;
	Sun, 30 Nov 2025 17:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Dl5yHnKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331E010E041
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 17:40:19 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4779e2ac121so195345e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 09:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764524418; x=1765129218;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L4Na1WnWt98FnIwMW2cXnPG9QEtYrpTgxkwDunJeAk8=;
 b=Dl5yHnKL7sRfrMwyI6WPxwmktMkQW1wR/WQxup5VMuIz6V601rLXOonl6H0Lm3CyHR
 rkZ25u+n5XzwRcn+OMCwTGf6gVQMX/RiL9Ux9ljoiuVoNelM79GhS6jpakxDLKd8XDSu
 R8I9xeC8T4qtJudLrJb1bmiKUmWzRzcbKPvpPveoTS/CfrdpissgyQMCaYe6keQ7HF8W
 144Sd3liOLPSATLV/vU+pitZCVBop8MHmELu1ltAnXihjdFhL18Xuux1eV0KMUvfN6d0
 QaKWGo/MDHe7OOvBChT7IB5Tc1oNtQNRnDIYuD1gmumHHvMt72eAnCovdOHeUsgMYVbo
 3AQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764524418; x=1765129218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L4Na1WnWt98FnIwMW2cXnPG9QEtYrpTgxkwDunJeAk8=;
 b=d4/HxkgC8RcS6wYL8AqAYPlc6Nw5nwvMr0qYufixVB4Ftua/LQBwXT20JZtV9nrrTK
 B7zzWELbPRcMSMPZVk7qqHdfoNPDWR5zRHcgwoMBWKTAaN1Dw41gxZz3e6hylQqWjY0v
 4dUhgkmnan3pFXSmvaB5qQ8l7mH+3pdQoKcL8GvML7Zing8pKfwebnaJzNcCqOaXaDZE
 jlzHAQhLyobRmOLPZ/jNRL4REPMSAWgcAZdip0kGZgA00C7WkkkgOQDN8WpNtCdDog0j
 L21EV686T7JQcAiVl0H/Yadm2aaPYK6qbiPe87rH6mBcRFtLaNcWUmbXi579yf6ZawNQ
 u9nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMCllVNRJQKTd2BXW5JZV5AEHaJ+FOJg2jFo4GkcZdyozO5FwlVK2od4uYj9rkB96bM+5KKTv57pU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyZGJEzTL3yXCQsJumxgX/CD4ZaE9GMQPiXaO0mtm2162J92rx
 k+eegcfK2Rwv1Mm6+0SF3BrLVWD8LCqoYwELBa+f/ebr2DwYI8RnhHVXZORD1/koYPLkK2r9zi8
 i+RRxkracuzBSyFBxECDkxgTe0vb1MEFAhlNA/zpf
X-Gm-Gg: ASbGncuiNUdIoQcQ2gOBzmW1S13W3sdpgZiWB3XY3qtpGMNfMePzGaWZSU9Y6gRAoUL
 ok6UXhT5XWgf824QaXSttjL6O8C0OByc0aUQeWvJqD3NnEovpEonYnVI4LMIWH7EQbkAoWqOlqS
 yMtODlFJprKv/aQF7eP5RJzUQ++sHUsl8e3Xo4G5i3cqszv4JolE0DuIsbJA1Qgh/0a8uD+wQ8s
 JRTTgsITH5vC+xYf/Q5ScYZcRPf43HwE2uK9NOsVdVHrt4eVFHzmDwW192IpvaRh7WvQq5NR3l3
 hMpcqOxYbWNcsidL1LAW1RrTo+K7TX5g3VfUV8vRZm04LHI9hAqdx/ZLatoGzw==
X-Google-Smtp-Source: AGHT+IHlTVz7wW8BG+EB/zJr/z7m4Wjnt3IV1uAh9XtpVidYWPvE2DdOvZABmgAV2wINgEeD93te3ZXLwt2sI23wYH8=
X-Received: by 2002:a05:600d:104:b0:477:86fd:fb1b with SMTP id
 5b1f17b1804b1-47910a0f7cdmr1051315e9.11.1764524417540; Sun, 30 Nov 2025
 09:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20251130-dma-buf-heap-clear-page-v1-1-a8dcea2a88ee@linaro.org>
In-Reply-To: <20251130-dma-buf-heap-clear-page-v1-1-a8dcea2a88ee@linaro.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Sun, 30 Nov 2025 09:40:05 -0800
X-Gm-Features: AWmQ_blosOa_VWvpKHaVXV4SgNmym-5ipECN2hZ2hHZsTsjHR9HcSCxA6X756f0
Message-ID: <CABdmKX3-jP7s5CCGeHc8Gz-mHBEwob983KXMcRmrTfpZz6d=Rg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Clear CMA pages with clear_page()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Nov 30, 2025 at 2:54=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> clear_page() translates into memset(*p, 0, PAGE_SIZE) on some
> architectures, but on the major architectures it will call
> an optimized assembly snippet so use this instead of open
> coding a memset().
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

> ---
>  drivers/dma-buf/heaps/cma_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 0df007111975..9eaff80050f2 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -315,7 +315,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_h=
eap *heap,
>                 while (nr_clear_pages > 0) {
>                         void *vaddr =3D kmap_local_page(page);
>
> -                       memset(vaddr, 0, PAGE_SIZE);
> +                       clear_page(vaddr);
>                         kunmap_local(vaddr);
>                         /*
>                          * Avoid wasting time zeroing memory if the proce=
ss
>
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251129-dma-buf-heap-clear-page-248bb236e4c4
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>
