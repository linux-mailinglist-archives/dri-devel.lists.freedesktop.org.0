Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12223D3895C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 23:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BFE10E289;
	Fri, 16 Jan 2026 22:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JXf9+HIG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEC810E278
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 22:37:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47ee730612dso19085e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 14:37:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768603026; cv=none;
 d=google.com; s=arc-20240605;
 b=KPNazycwQiWyMt/meagRC2GSYdG8NGJrbtwrNt+J74CjrpOC7qy/lnHUJNLvtEmG4y
 hqS7bUGXNuwWIrZ9+XlatxMWFjMK52CCiL/tzIML7RaWEfIqdnrU03v90zciO98JFqMp
 KP6Lg+cv5Bs87PfKpgJfzuP1gj2K4iCchh1fdZ3+Q+OIQZMCk88X7yrMaIysq3ihODjn
 DrapppvDeLeIFeoiTeyVNWwfKiVc0s63MpJTU5QOG4AMv7kfeGcolDneXqRzvQU6xoiz
 Z35On6rYnukBqr1hXQlff1M/g9SWWj3xM0VNDRYV3luadYHFqN9i4sD3BvSWWUB8pt0W
 6vyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nPj7qs12piP/bjZVzPpDAGGP7hNz3JwnoCUD9QPt/xg=;
 fh=/yS1c/a8kcjTvG4lzaJtwRG94ildCbFQIhx9Rc1N+Jk=;
 b=WP25oPv15a+49ZiDGEyUab2hYlMxhkya3cRNhUtTBU5C9NlviiTu1h5WbZ3oqnnlFM
 /c9oVfovsNbH9hAvQDz8+WECHQGEVAHSwh5TNmrW8im/JzT21ww7/Bjm+jgWifMhP75M
 hon6tBeng0Xo03sr5V5iyp1rtZNvAv/RhVIlJyToCpdAYLsmmIttiN7IT4f7VKS2fJ8J
 ryyHncilbLfiOGvItpc/7lv1QxHEIL4ilIMdnAjI8RWj8yBtt7afP6SQBhlVBUBWlvtE
 ra0Ql0b12Qkgak03yigMEK4PeViHDbOXiJgM5pFYuJCHe/95XQ6H3fWB1lZHiJVVYnVE
 ED9g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768603026; x=1769207826;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPj7qs12piP/bjZVzPpDAGGP7hNz3JwnoCUD9QPt/xg=;
 b=JXf9+HIG8szkARWyxHPo7BqX9PqWdf6/0DaJdaDEtbOYD58Qc6/PfS/+D0nCLOYT8m
 da9gDuOnuh6H1AmrLnTXmm1T4pzAq6P2FvZgWMc+C7I7XGaiAY7spm4Cv3UZFaA8Yzyi
 k6aMjXQxtpXXGXTCUjfSRKw5Iu7Urvzc0Z4WtDLKTMQC+nEGRtn6hNS8+pCMBOlyC/ie
 zyP5wCNo49caIJwhjGklwdC821Py11LDbvUF/G9RtVZlMF7ZogZQX7rLhO7ypyvyjFGq
 wmhozYew99/kcgaRc1PEgiI9oefLfIZGVWFiutRjClzYwu4xtHFaI9D7XreeQ0/QwGR0
 acgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768603026; x=1769207826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nPj7qs12piP/bjZVzPpDAGGP7hNz3JwnoCUD9QPt/xg=;
 b=Shxc4mjgmdZXE8VJ0bTpJWM6Cknx6V5+aBsz6M8vTIVDdlc7YmW9UWUwaL36oO3oH2
 FIXvyRuq0r/WGpzK2/kR16rXEAlRY8vaXXAu/3fxtSUJ1YrAtS/OgHbl/5f3zrPyPkoZ
 UcpFs5wZzu741dr6XovPrr1qaO1NgpOhkdMS5du836G+pTy5ZwmeTEADLXPyiIB4G5Uz
 QPYHQH6PekAuP1XGe/MB11tyaFDwJNHof3lh6Oc9+f8QZfavjWMcit+fPt/ZtSjIt2kb
 G7F+FOejSKseOP3dfzqSsPxxzxxycLoMZsakG8/PaWIUsWrMx+jmX0hLiFBzq1bYk8pN
 H+5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY+OV/ISMI8jgUPBzJqWQk1LrHOnzLmU2RmFtJ4ChQ61ItOko7JvAfAbgkWJhEmny8i+tOnw79VJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2PoKaUuwFl7wqyigj6ZiDJnnJpLAQ/cksrbCLYcAuPfTwhyvx
 eSE018uIouQ7NEyVEHYAtbsYeOuy2RAcHFaXDcYipEPOVA+kOzAJjKhMTbfjaDMd8Wd0xx9G2LI
 5uIrRcSKU4sKO92EuSHls0/ipLWm76AyGwGkF43uU
X-Gm-Gg: AY/fxX7IXF9W4rMrjVD/pgJ9+m0CCaJMaC/F0d6A/y4ZlL/s0DuXPwJ43bZsEJPRekw
 tCaAc51/XnDRgT/LGG9XDE+7dnPD7Of56DZBeIt4hhe0dkQ7YzMkzbvmMN7hAGIV8imFEtOcxy3
 96tsKidvhh4YyKVWk+gEHa5NiOf9W6CfOzWKHnKk0B4uHpZk81gmN7pTH3y7Auz2BQNY9YBNdCt
 T6sXREyWiYz/5w9KmwktWRS3P8wYtar1148a485GXsz49WGo9CcjWV975pjkdtavHh0HIttaCab
 Yv14wq7Np3jc6WZxZ8aa0dD9HA==
X-Received: by 2002:a05:600c:4884:b0:47e:de1d:ce99 with SMTP id
 5b1f17b1804b1-480278c7966mr158495e9.12.1768603025656; Fri, 16 Jan 2026
 14:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
 <20260116-dmabuf-heap-system-memcg-v3-2-ecc6b62cc446@redhat.com>
In-Reply-To: <20260116-dmabuf-heap-system-memcg-v3-2-ecc6b62cc446@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 Jan 2026 14:36:53 -0800
X-Gm-Features: AZwV_Qij6KmRcwRqfzeiTk7l4B0hSiDhM7NFKcXm1BXyseKimbBVodrdbzenvJQ
Message-ID: <CABdmKX21XWwwOWZ969GT=DOu7_aofKR7E6+4iMggbELVM=zYAQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Jan 16, 2026 at 12:06=E2=80=AFPM Eric Chanudet <echanude@redhat.com=
> wrote:
>
> The system dma-buf heap lets userspace allocate buffers from the page
> allocator. However, these allocations are not accounted for in memcg,
> allowing processes to escape limits that may be configured.
>
> Pass __GFP_ACCOUNT for system heap allocations, based on the
> dma_heap.mem_accounting parameter, to use memcg and account for them.
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
