Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA12483728
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 19:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3518A89EA6;
	Mon,  3 Jan 2022 18:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D7989EA6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 18:45:42 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id by39so57111955ljb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 10:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bon2TzEaMZw9jM9XFv0NkWrGKfLJEYEyxT5WK0i6Teo=;
 b=T0+jz4Nr1t/1nhvRN719ZQEzSnmTKGHWI14rsGCizTeJ9+Pq3NHRf5WGkkBIO3ig2R
 WEsBXXSQUumOIlOM7VuWzBFKL3XVzl9phxO8l1rI60pEVA/jSbtEaqxaJ5xr+AqjiaTt
 V9YIkBrs6otgasLbADTppCmlu1+FupQanbqJzLXAR5Eb9dk4wSNwxdb2YVBB6/edLiSM
 yP6IneGgi3bV2TB7qc7sEDq7nMdaK0G8wYCotW4G9m8bxica4CM8Nj1zV09OSfnYcZEf
 CoWh/VuEeptwK1vuokWGTagQcKog6rUY02+q62DhRTQirM0coloCuZSgJV1+0r1q9z2e
 8n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bon2TzEaMZw9jM9XFv0NkWrGKfLJEYEyxT5WK0i6Teo=;
 b=iXIouITZZ8blaG0PcDaqLowMj9sIeH+EgpXMtxh/3Gpnf0/r+ZM2SDd83KttZ8wO8+
 jDsnkfDGQycGTSNSJ4OVzCY6p7x6T0MBoR6goJ62WfgbTAw4lDzeEG4xjxlWtvEDd3I0
 Wl5WCmXjxHLlAdsDYtYOBFj3v6ZDvm+KJuGLK3GJXVZEHnseynZPDx2HihmFB7AKNjGl
 LGGvMVVgF9yv/CoaQ2gMV0YkNQ8dJfS5js0djRUc+IhMf8Z8ScFNI4M2CvrxKSpvAkRo
 RaTZd42XWrKNyVDZb+5QemRAxkFtB+zgEq5mAv7Uu9OCL2Gph7jtVdnjva2H4Z7+RI8b
 FfZw==
X-Gm-Message-State: AOAM533kdc9FfPjVT7vvm5xkwk6TTM9Z/igeVtRVEH1oMJ7nJ1Z/Qava
 SUxEBgMoJ1ykTt0qB7/MUjhomLdWq+PYRQPJlOdQMQ==
X-Google-Smtp-Source: ABdhPJxEiB7uEhwcBh4Wz3syBaOYchuUr3Jz8MrBaTyqxDV1Dd7a0xiGHe0W7YzjhL4RNXWQ2n1CRmRoSgK8Vl+S02s=
X-Received: by 2002:a2e:2e18:: with SMTP id u24mr11896473lju.492.1641235540346; 
 Mon, 03 Jan 2022 10:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20211229070713.218548-1-o451686892@gmail.com>
In-Reply-To: <20211229070713.218548-1-o451686892@gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 3 Jan 2022 10:45:28 -0800
Message-ID: <CALAqxLXtUcign2gETHg=z24qYOFSALRjWNnJqqY6rk=gsfVwaw@mail.gmail.com>
Subject: Re: [PATCH RESEND] dma-buf: heaps: Fix mutex lock area and generalize
 struct dma_heap_attachment
To: Weizhao Ouyang <o451686892@gmail.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>, linaro-mm-sig@lists.linaro.org,
 Laura Abbott <labbott@kernel.org>, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 28, 2021 at 11:09 PM Weizhao Ouyang <o451686892@gmail.com> wrote:
>
> Fix cma_heap_buffer mutex lock area to protect vmap_cnt and vaddr. And
> move struct dma_heap_attachment to dma-heap.h so that vendor dma heaps
> can use it, the same behaviour as struct dma_buf_attachment.
>

Hey!
  Thanks for submitting this patch! Apologies for the slow reply (was
out for the holidays).

This patch is combining two changes in one patch, so they need to be
split up. The locking change looks sane, but moving the
dma_heap_attachment may need some extra justification as changing
upstream code just to support out of tree code isn't usually done (if
there was some benefit to the in-tree code, that would be fine
though).

I'd also be eager to try to get the vendor heap to be merged, assuming
we can also merge an upstream user for it.

thanks
-john
