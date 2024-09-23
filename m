Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB22897E606
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 08:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119A688284;
	Mon, 23 Sep 2024 06:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qNCAVtjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2366210E062
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:33:34 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f77be8ffecso37916111fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 23:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727073212; x=1727678012; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y5jTK+r41Ph8334euEi90MC38DwR8Kznsi20eXBe15E=;
 b=qNCAVtjS51a53+9TRaLlEOYZJt8XOccNp8wu9Jom9+lyUKnQzY/LbV1R+3Kd3UxUuP
 ZQuU7SaPA18I1/WAZZs5NpnW6a9DXi3L007Xxbs7NmrFrHF90n+bbcVG2OOJVsA7Pih+
 KrOCMRbOOrWFgqghCto3ZbXTlxIvMklJH39kxy7BsnIc8Yn6JmXVTy1GX8IXE3rwWhMP
 MqUdXz7mAdm9oX8LidZQzgkTmoh3tDWRFpTxcnyOW7U00+JIjIcyJl6B79DTxxhCYtNZ
 inYEepPXcNXoRh6IeCWbPs6zXOj+WXOEoAGIo8nRc6k605+OPXfiIp6Frc42Y8vOA25P
 O24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727073212; x=1727678012;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y5jTK+r41Ph8334euEi90MC38DwR8Kznsi20eXBe15E=;
 b=b54gNZyqmd/Jxqd69AFfq/Uuky4lq+kwTtNEdy571EUxKkJYkCChaSA9ZO433uvU5F
 RPdmqlsUrUmuESLywhPGaQlEUNutaC3ljo7OB/+Ld+yjxZFO2q2xUecKDWTS1+0N9nMb
 4/SpHsl/XbTvifmUUgCfhFHlET+wVTWau9H41PzxoWLs1EUjpBQBZMe8eUafzr5zA4Fb
 RYzIUP8ajmxf6NqJKyUPxpRs5hp04a3lsRqFMgnz7yTpiGWLeQUCPMNiUC4qm51pWDfb
 JICcJoeJc6ptSpuBKLMkPwt/JhYm6OB2JgHLl0pVcZNA9P9SqIJ1KWutzeVTKRpNt+SQ
 9Sjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoluA29q5gWeB8zKE6Xheqn7IkMsfsxznvTw4hhldlJHl0Oe55y2Rj0h24dNH3vXKBEoVJNK10i+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIsTKgUdNuwP+z9D238iZUYPGVCZ2ovfkakWy4SZfK+HCzM7qF
 biPfuaaHSoSDYsFt1+Fjy1SG085muK9//993w9+8GarEkCgf+aduvdIkkOYgaA8=
X-Google-Smtp-Source: AGHT+IF0SSg0hB/gqsdKj0/yr4GTl2yjAfBCnM5NlEWIac3bv4HTXek3j/tUDFkeNkN6x6DTtY/72Q==
X-Received: by 2002:a05:6512:110c:b0:52e:be1f:bf7f with SMTP id
 2adb3069b0e04-536ad1808d1mr4286439e87.27.1727073212004; 
 Sun, 22 Sep 2024 23:33:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870b4255sm3165429e87.259.2024.09.22.23.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 23:33:31 -0700 (PDT)
Date: Mon, 23 Sep 2024 09:33:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>
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

Hi,

On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> Hi,
> 
> This patch set is based on top of Yong Wu's restricted heap patch set [1].
> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> 
> The Linaro restricted heap uses genalloc in the kernel to manage the heap
> carvout. This is a difference from the Mediatek restricted heap which
> relies on the secure world to manage the carveout.
> 
> I've tried to adress the comments on [2], but [1] introduces changes so I'm
> afraid I've had to skip some comments.

I know I have raised the same question during LPC (in connection to
Qualcomm's dma-heap implementation). Is there any reason why we are
using generic heaps instead of allocating the dma-bufs on the device
side?

In your case you already have TEE device, you can use it to allocate and
export dma-bufs, which then get imported by the V4L and DRM drivers.

I have a feeling (I might be completely wrong here) that by using
generic dma-buf heaps we can easily end up in a situation when the
userspace depends heavily on the actual platform being used (to map the
platform to heap names). I think we should instead depend on the
existing devices (e.g. if there is a TEE device, use an IOCTL to
allocate secured DMA BUF from it, otherwise check for QTEE device,
otherwise check for some other vendor device).

The mental experiment to check if the API is correct is really simple:
Can you use exactly the same rootfs on several devices without
any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
laptop, etc)?

> 
> This can be tested on QEMU with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
>         -b prototype/sdp-v1
> repo sync -j8
> cd build
> make toolchains -j4
> make all -j$(nproc)
> make run-only
> # login and at the prompt:
> xtest --sdp-basic
> 
> https://optee.readthedocs.io/en/latest/building/prerequisites.html
> list dependencies needed to build the above.
> 
> The tests are pretty basic, mostly checking that a Trusted Application in
> the secure world can access and manipulate the memory.

- Can we test that the system doesn't crash badly if user provides
  non-secured memory to the users which expect a secure buffer?

- At the same time corresponding entities shouldn't decode data to the
  buffers accessible to the rest of the sytem.

> 
> Cheers,
> Jens
> 
> [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
> 
> Changes since Olivier's post [2]:
> * Based on Yong Wu's post [1] where much of dma-buf handling is done in
>   the generic restricted heap
> * Simplifications and cleanup
> * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
>   support"
> * Replaced the word "secure" with "restricted" where applicable
> 
> Etienne Carriere (1):
>   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> 
> Jens Wiklander (2):
>   dma-buf: heaps: restricted_heap: add no_map attribute
>   dma-buf: heaps: add Linaro restricted dmabuf heap support
> 
> Olivier Masse (1):
>   dt-bindings: reserved-memory: add linaro,restricted-heap
> 
>  .../linaro,restricted-heap.yaml               |  56 ++++++
>  drivers/dma-buf/heaps/Kconfig                 |  10 ++
>  drivers/dma-buf/heaps/Makefile                |   1 +
>  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
>  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
>  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
>  drivers/tee/tee_core.c                        |  38 ++++
>  drivers/tee/tee_shm.c                         | 104 ++++++++++-
>  include/linux/tee_drv.h                       |  11 ++
>  include/uapi/linux/tee.h                      |  29 +++
>  10 files changed, 426 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
