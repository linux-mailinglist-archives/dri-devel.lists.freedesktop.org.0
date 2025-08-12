Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A10B22784
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 14:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EE010E33A;
	Tue, 12 Aug 2025 12:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FFY21p6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021F310E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 12:57:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8642D45D4D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 12:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB32C4CEFC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 12:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755003425;
 bh=qghFQCOOR0UBMf1erX9Gzu5+pSrhr+ojvuByHjWtUkg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FFY21p6fWGgX3tqv+54v6/2y2QKYGHPBYVWxO3SccGYmbsLOdENRKVqo8ykjz4E/+
 Vg5erN9uAv+YdUjlYBiJUL4f9SlUiuA89a83P/EGxTptUX7cDAcRGUvEdp5+5DtOI8
 BKG3YuGzpnu2RhQNOv/xAuP98l/0xoAClzpXC2PWnJ7Uewk0ioGtB7KatkF/nrJdwt
 +kVkcXwM+pnrZQOJJs3MH3Gh8ntbmhXncvjlgdBB+WkvjjKL8K0r4F98rdQ6krIiu5
 P0oiUvraDeQjLVYxZeiGEv6diX8HWgdI0Iiq5oVrY8IMfXZlhNhV9PtImwnWNK7hKQ
 HMZsLT8biUy7A==
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-af939afe5efso631475666b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUfASdarpJ3xjuY81/poXGArZ/m+HBD6wfusZQERy80Mt5+PJvUNf7VPBHZIbYTIoDhLqahP0EMQPM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmR02KQrhbr1RCU/pycHTbdiU3we5qZMezW+phhrZr8mIEWkJs
 qcNd/gAmt7d1TfgiKm0DTYzFBpOrjez6tQA3LS0hSWrU0EXpHtuIyyLIBXRusSQF9xKHM48C+9E
 lFV9a++IfMlT07G3gE0xqLVeSOLjF8A==
X-Google-Smtp-Source: AGHT+IFDUbbe2PhMsIRWb9q1ckE7Y9HH+PJ5GWNSinNHIim73doYwGhVoAfafcP5txHzDsr8Ed8+WkTjBqTHjyEPdqM=
X-Received: by 2002:a17:906:4796:b0:af9:8c20:145b with SMTP id
 a640c23a62f3a-af9c634f563mr1528914666b.10.1755003423802; Tue, 12 Aug 2025
 05:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org>
 <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
 <8a872e48-0743-43b0-8259-70d6b8e4c221@suse.de>
In-Reply-To: <8a872e48-0743-43b0-8259-70d6b8e4c221@suse.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Aug 2025 07:56:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJL5sy7Otzo7R8mYW_-7s+ajggjtuW7tYBnVxYPaJHs+w@mail.gmail.com>
X-Gm-Features: Ac12FXwuFSQu1fZPX73cq3WQKGjboa7GxXCNwN2iRczUjfXBezoHJpzIMA5o6NE
Message-ID: <CAL_JsqJL5sy7Otzo7R8mYW_-7s+ajggjtuW7tYBnVxYPaJHs+w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Tue, Aug 12, 2025 at 6:01=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 11.08.25 um 23:05 schrieb Rob Herring (Arm):
> > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > relatively simple interface with single command stream to describe
> > buffers, operation settings, and network operations. It supports up to =
8
> > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > are designed to use an SRAM for scratch memory. Region 2 is reserved
> > for SRAM (like the downstream driver stack and compiler). Userspace
> > doesn't need access to the SRAM.
> >
> > The h/w has no MMU nor external IOMMU and is a DMA engine which can
> > read and write anywhere in memory without h/w bounds checks. The user
> > submitted command streams must be validated against the bounds of the
> > GEM BOs. This is similar to the VC4 design which validates shaders.
> >
> > The job submit is based on the rocket driver for the Rockchip NPU
> > utilizing the GPU scheduler. It is simpler as there's only 1 core rathe=
r
> > than 3.
> >
> > Tested on i.MX93 platform (U65) with WIP Mesa Teflon support.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> I've looked over this patch and it looks good to me. There's a
> dev_info() in ethos_init() of which I think it should become drm_dbg().
> Anyway

I prefer to print out what h/w we've discovered. That's a fairly
common pattern for drivers (and more useful than announcing drivers
that only loaded).

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

> Side note: I noticed that there's buffer-allocation code here that
> reinvents dumb buffers. We've ocationally talked about creating a better
> dumb-buffers ioctl interface and this drivers could be another use case.

Yeah. In the past I got told don't use dumb buffers APIs for anything
but dumb scanout buffers. I guess with enough copies opinions
change...

Rob
