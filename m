Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC5FABEA04
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 04:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0367D10E246;
	Wed, 21 May 2025 02:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KMcywqlX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DE410E246
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 02:46:55 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30db1bc464dso59277771fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 19:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747795611; x=1748400411;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nxt6arEcdTzqN2aNV7xZMthDenOsecbhCIniDpCb5w8=;
 b=KMcywqlX600kW4JE/omBkuBtnJryti73BLhp4Tnj1a5I2KJbQT/fbfjkE7Udv3ljqV
 dRYWLyYST0BfW6f4K8yq7RBK67kI/QRa5Yv73nfI0SlddgCesKXfPsbASzRKgsZXbShZ
 DYGQFcsmBHmNS/5tJa52oScnjzX6HtTF7EhabWwJzFNfHc4a1QeFBbfKmw3U7U83nVSD
 qGGqH1Ce/yOQ7b10LocUOMlKd9suDhQROqwkDtEt2pGjkYvUlXIOlti7C0cT1sME9tPW
 yHMcBGQO+KwrhhWS9Ev08qgcutJNlHQEPlQCK30HaoyIA5So8WVvWvOoXLRT1+V6LuNd
 ivjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747795611; x=1748400411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nxt6arEcdTzqN2aNV7xZMthDenOsecbhCIniDpCb5w8=;
 b=uY40MPZ8dK4woeg4zo1A+tzLtZOEPNFXYAcvOWVDeNllT7DwmxuVYwrnJ3pcKvQbsj
 GD6ccf1sSARpRkudEz8rTLhxTLVQBIJ3LtsnjW9u683sG/LBunOijdzkdDpElqtuFcwD
 nEXIZPl4WYKA1scTTxfZ1n/I4QKWJThWBSB4/yKN6OrKn8kUoJx8/ZHjo+6hT490X1SX
 khbVxHTCjm+KRDDqoxTisE+wJ/ERo67R0eMMVYgSvkCX4j01UJxQ5uUQ2sGZy5aHbF/y
 oq6NEmxlklGFJW8vqhhRmdyWt3o72ViMf404u2g8ZOiWxBiFsKElAGuVK4Idwv/lm2Cd
 93Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmIOvxFYbnq3zdVz20LrWze7FSJLQJyYi+KqkeB0RHGlUdmXIj3TNjhuZqkU9SuDJopRLo9U68yBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS8Sp+7lm5+j2zIkzIeFzE7DDZZANbpejcx7/dLWxXEaoAQZwA
 vhUBqcSbMH+4r2xecQTuHJJIhsi1H6G6MlBhnm72Rkd2ko/C4mT/qsNX2m9GGcj90ctelYUvECX
 5L9ZM9Vjz4M7oCfT55/H7wNiCXPxNV+DWaOJdXaM=
X-Gm-Gg: ASbGncvehMW9gFUYlCSBBqkGOmjikH2wzpyTRPaG2pBIeVX0QEg0EL16I7HjF6SkQSA
 DoB235FiOVGBnOK/OnSWZ+1mWQtYnRxolqfVGD8SXDnSj31AkUjNAhmjNfrEzgelC4FdASkcFz7
 P14qJSLmDtpdwVC0nfdp9emM6m2W9O5gVP3EMYXY3KWCMiT9OYxRRWLZ5Mbqj7sN5X9oZZ9MA=
X-Google-Smtp-Source: AGHT+IHPiBTH/IUONoliZXjExrOKudiG9XvffXjRUKLNtiXlLaXy9m8H+bx6CRbSWTdibiF38hi9o5vXfOGfvKq6xdY=
X-Received: by 2002:a05:651c:54c:b0:30c:201a:149a with SMTP id
 38308e7fff4ca-328077a9f1bmr71629351fa.25.1747795611095; Tue, 20 May 2025
 19:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
In-Reply-To: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 20 May 2025 19:46:39 -0700
X-Gm-Features: AX0GCFvaIAnE0yZNsTcLxjSWVR6RvkV3hbcw5IoUnGn4QI2anEO8q4-VMGo9Bvw
Message-ID: <CANDhNCoQ=V5Uk0ThmeHdn20xmUucPb-mjCjX5pbM94EvzGRZMw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add naming guidelines
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, May 20, 2025 at 3:00=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> We've discussed a number of times of how some heap names are bad, but
> not really what makes a good heap name.
>
> Let's document what we expect the heap names to look like.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 535f49047ce6450796bf4380c989e109355efc05..b24618e360a9a9ba0bd85135d=
8c1760776f1a37f 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -21,5 +21,24 @@ following heaps:
>     usually created either through the kernel commandline through the
>     `cma` parameter, a memory region Device-Tree node with the
>     `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
>     `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
>     might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +
> +Naming Convention
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A good heap name is a name that:
> +
> +- Is stable, and won't change from one version to the other;
> +
> +- Describes the memory region the heap will allocate from, and will
> +  uniquely identify it in a given platform;
> +
> +- Doesn't use implementation details, such as the allocator;
> +
> +- Can describe intended usage.
> +

Thanks again for sending this out. Sorry I've been spotty in some of
the discussions (I'm really trying to step back from this area).

I might only suggest you provide a bit more "why" to the list of
qualities you highlight here, just to communicate more of the
spirit/philosophy of how these might be judged or reviewed in the
future.

> +For example, assuming a platform with a reserved memory region located
> +at the RAM address 0x42000000, intended to allocate video framebuffers,
> +and backed by the CMA kernel allocator. Good names would be
> +`memory@42000000` or `video@42000000`, but `cma-video` wouldn't.

The point about avoiding the allocator details, just so I better
understand the criteria: Would distinguishing from a contiguous pool
vs non-contiguous in the name be considered ok? As it's a property of
the buffer returned, and one that is critically important for some
devices. Or do you intend that to be opaque, and the usage->heap
mapping logic to provide that itself? (Effectively avoiding folks from
being able to make potentially problematic assumptions from the name?)

Similarly, how would you suggest naming a heap that provides 32bit
allocations?   Similarly for "protected' allocations, which are being
proposed?

thanks
-john
