Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB6121B7A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 22:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F4B6E8A3;
	Mon, 16 Dec 2019 21:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B3E6E8A3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 21:07:38 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id v140so4493776oie.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xf+PaVfK+fxzSPWZXkO3BuD6UEDzGPf8/U5sJKPnSqc=;
 b=j8lbUXIylU6AeuPYIm+5uxBq5U6RJpNmZZMLo5ctDECJri01nRMDpJ5qRfxwwPLKRh
 oumhJo/nkLVN3J+uYBGhFb7psH4p92UqoS8mv3UClvK2Rj8Hfce7HwlbKt3mkFhRdAkP
 TnIu+WS+NFDon5qVreiiJZ9yN5AOPtE73Nw0iuHl+i9MUoZYD5COw6VuUSjQ31RCI8BC
 FrP54MUwtkLp1q8MMg6IunDKh79oT6fC7Af9xdCCICHERafZPC+KyUgtaj6kxewFTu4n
 /mDrkysePXG5mRQudXLKdRO6CdfBN6Fb/JcCBLQ58167AzGCHTZf2a5HXnOT/ZA3qYSe
 7LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xf+PaVfK+fxzSPWZXkO3BuD6UEDzGPf8/U5sJKPnSqc=;
 b=Zwb/XC8D21Himk9T0HRGGzT/9i9whR5yJvSDckX7NM5frzDh1ma/JJu52CEPhPhDOo
 u91vDHZka3E52M6zwsC2FyjTiL0dGWqT7vkNmYpDfKIBjpTb57q7IZxvmQIjX9klPrcq
 EeC9O+f7ZzvpB6D/OPb0I8mx8Nou5l4S7GtRRXzjnQ3sC6LCNgwhwYLnMCZwecdVEH+Z
 ZYmCpPJyCm1JaNluYL5YKiesEYaNfVGYBsLS4KuoZYZGDsKhuXaV5YL2hpdltw31e94r
 2dsVSows4Mm2K/gqueHIZ90nuUlsQY5hb7VWb7uK+ss0Du06VkbnrlbWi9hQB4xLzjSa
 j+5g==
X-Gm-Message-State: APjAAAXoWoZEmL2PljeqQ2RyndRK+amUhwLYnA9knQ5v6jnW7TTq5+L/
 tzUtKFIFgc3lwhRo0UigINJoyybwoZHm+8jCgr325g==
X-Google-Smtp-Source: APXvYqzWzDWclkNVDspqgaIn1PCLoKAhYWLJAEqeDwyrdeQGyKLOwB+UvmXjFNWeRKfvZFp0VvkubgYEQrTULqVw92E=
X-Received: by 2002:aca:c551:: with SMTP id v78mr600481oif.161.1576530457340; 
 Mon, 16 Dec 2019 13:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20191216161059.269492-1-colin.king@canonical.com>
In-Reply-To: <20191216161059.269492-1-colin.king@canonical.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 16 Dec 2019 13:07:26 -0800
Message-ID: <CALAqxLVsFr6LLKvz9a5CRdddqhmMXUwKmfwqf3LRBbhksk5gHg@mail.gmail.com>
Subject: Re: [PATCH][next] dma-buf: fix resource leak on -ENOTTY error return
 path
To: Colin King <colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sandeep Patil <sspatil@android.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 8:11 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The -ENOTTY error return path does not free the allocated
> kdata as it returns directly. Fix this by returning via the
> error handling label err.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: John Stultz <john.stultz@linaro.org>

Thanks so much for submitting this!

Sumit, do you mind queueing this up for drm-misc-next?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
