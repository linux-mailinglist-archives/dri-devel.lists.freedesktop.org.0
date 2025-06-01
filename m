Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10AFAC9DDA
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jun 2025 08:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A4710E25A;
	Sun,  1 Jun 2025 06:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="PyYcIZ5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0081510E06B
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 06:41:19 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-70e447507a0so27150877b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 May 2025 23:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1748760079;
 x=1749364879; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDv2NwLqpacBBYcKaq5onzHq7Gle/gc1PiMFPCdKyB0=;
 b=PyYcIZ5KYzWaoCgbjJsExtRBWSysrZz3Cc5dsQ7DFmiaRKnZ4xmI6W9MGOYbu8EVGo
 ati7fvlelKE/PMuO5dUtwxYkoX5SlBIJ3zyYy2Dzjz0/anlFOxjkkIeIlxqQ7j4BYBj1
 8k/rZA4dS8p/0ySJQmN1BcbTqJQs6dTZJiQrBqosOZdb2fqgwD35JAxbAWqc1cCyuTZK
 2lXbhREmPuGN4YW2w6RjHJ5UxLdXIxp9tBYn+TdubI/APplY/NeLOevMfiIBcDu+s9yR
 QX9/cIB/hRDdv8zgi6AZzlgsdYLoFfRyu1mbx3uMGn34oOOeInG8f53t9eLlLrWPfaVV
 Lk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748760079; x=1749364879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDv2NwLqpacBBYcKaq5onzHq7Gle/gc1PiMFPCdKyB0=;
 b=IS6iewfF2f5Toq/YLJ/nnsmzHA+/Crdce1QLk3XyXDeeImMQVsyE/KBgvtMTfYmqaL
 x7jZn7YzxuvavhL7Aeqndcy7pRfSsGPH5TKP6mQvQLRgsSyHgksbShiB9itVsl1372c/
 egBS9eZAtTmLkoSNrlGV74MS22aqSuPGnyl/HuFEzpx7sPwyRoBiGoWytLSMG+V3xSTV
 l2s3FyjES7Su3D+D0+kGMiKQ23Gu6DGC0K3QuiOKCqVdjKrv6k1Xn+bIs0K9/9jgIvfy
 61FrnRJUuUZxOWIL399Ro0A+/ultutL44rk1kS3vJ2f2/gBA/s3PI92/2XnLsCybpmff
 /PVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiCLz33ic1D7PHlt9P8NvABxQif2ThmMYdFHUhM6CSJbWtvwlqmBziLLm9qGKCMnQXbCTHWDq2OXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcTrIVridsY4ih2JoFYLiKDTiFI1Xb2xBUD3eLSFpuDB7o9dsB
 tMoWGnZQx1nI18GNtWwoEN9ODn9kIafdSWdnFAl+fzLvhXnDAeZBfYYiDA1xobwjatHHNBtyqT0
 rY8bKOug5Eg==
X-Gm-Gg: ASbGnctAynxbZDae/Ad0X7VzZ0ShyUgK48n4nymhxgMa8K5M5vmK5sTEOyMolszW83m
 ZLMl3eegSx6yhrqL+bVhUzZfUDzAJFiiIJSFuViASINAUP1tml52r9vzVCEYZPUV5/zbDdBQNkZ
 qAIrVSR6L9MrRaL+yzDjakcyX2KUTARXIYvfpwGLRtMAOPKey2Aq410cfnVZ/QNfwmw08iV3xVW
 pIkmSDZyFpm9mnDoMbAx2W7Ih0PzZakqAKvaCsxqAtk46mAFMoRmJM8Tl/RTDMeHdfDAlekbrjS
 lGihAXm6Nsj39rmUx01B1xHozuE+nGfqeknbeXoMYkfG2hNHtpmGOy9lW2vzsV+H1idpa2D5Frw
 ZFS3MQ35yLaWYxWht+pxAAuA5E/IWRQ==
X-Google-Smtp-Source: AGHT+IGeWAz5v5E7HnJr/OjKWNmzwqdO2t3Jnv7Mli4jp5AkxtB/bHtnBA7M1CZX1EozPCF9fTK67Q==
X-Received: by 2002:a05:690c:6505:b0:70c:90af:154 with SMTP id
 00721157ae682-71057cd4914mr108121827b3.20.1748760078705; 
 Sat, 31 May 2025 23:41:18 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-70f8ad01703sm15599497b3.115.2025.05.31.23.41.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 May 2025 23:41:18 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e7c5d4709caso3232885276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 May 2025 23:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVqsRASRUOXRdHWqeZymrb8aoB7d/7NHrvzF2J9wI9duElGIGYjghQ8i7x4z8iEt4KmcpZ8CO9VlH0=@lists.freedesktop.org
X-Received: by 2002:a05:6902:1245:b0:e7d:c51d:4b17 with SMTP id
 3f1490d57ef6-e7fec876436mr9326569276.8.1748760077303; Sat, 31 May 2025
 23:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
 <CA+VMnFzisyMFzze52RRf6=Gstq29jmukrPSfqXfBWrVw0a7k1Q@mail.gmail.com>
In-Reply-To: <CA+VMnFzisyMFzze52RRf6=Gstq29jmukrPSfqXfBWrVw0a7k1Q@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 1 Jun 2025 08:41:06 +0200
X-Gmail-Original-Message-ID: <CAAObsKDhjkQ_wVcOiVsGPB6QPuWkKPrWEGd-6Oq7BgjX9NhTJA@mail.gmail.com>
X-Gm-Features: AX0GCFuCkivNAaBx7rL3ymXj2J3pJIXqNYSSzMxHaNqO3jwK8nThi-KXGe-k1Hs
Message-ID: <CAAObsKDhjkQ_wVcOiVsGPB6QPuWkKPrWEGd-6Oq7BgjX9NhTJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Jagan Teki <jagan@edgeble.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
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

On Fri, May 30, 2025 at 8:50=E2=80=AFPM Jagan Teki <jagan@edgeble.ai> wrote=
:
>
> On Mon, 19 May 2025 at 19:14, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> >
> > This series adds a new driver for the NPU that Rockchip includes in its
> > newer SoCs, developed by them on the NVDLA base.
> >
> > In its current form, it supports the specific NPU in the RK3588 SoC.
> >
> > The userspace driver is part of Mesa and an initial draft can be found =
at:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> > Changes in v4:
> > - Several fixes to DT bindings.
> > - Link to v3: https://lore.kernel.org/r/20250516-6-10-rocket-v3-0-7051a=
c9225db@tomeuvizoso.net
> >
> > Changes in v3:
> > - Reference in the device tree only the register blocks that are
> >   actually used.
> > - Several style and robustness fixes suggested in the mailing list.
> > - Added patches from Nicolas Frattaroli that add support to the NPU for
> >   the Rock 5B board.
> > - Link to v2: https://lore.kernel.org/r/20250225-6-10-rocket-v2-0-d4dbc=
fafc141@tomeuvizoso.net
> >
> > Changes in v2:
> > - Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian =
Reichel)
> > - Drop patch adding support for multiple power domains to rockchip-iomm=
u (Sebastian Reichel)
> > - Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e4=
8eea250@tomeuvizoso.net
> >
> > ---
> > Nicolas Frattaroli (2):
> >       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
> >       arm64: dts: rockchip: enable NPU on ROCK 5B
> >
> > Tomeu Vizoso (8):
> >       dt-bindings: npu: rockchip,rknn: Add bindings
> >       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
> >       arm64: dts: rockchip: Enable the NPU on quartzpro64
> >       accel/rocket: Add registers header
> >       accel/rocket: Add a new driver for Rockchip's NPU
> >       accel/rocket: Add IOCTL for BO creation
> >       accel/rocket: Add job submission IOCTL
> >       accel/rocket: Add IOCTLs for synchronizing memory accesses
>
> Can this be possible to infer yolov8/10? Do we need to convert PT/ONNX
> to any other common format's unlike rknn?

Both considerations are entirely dependent on the userspace driver.
This kernel driver should be able to support a userspace driver that
accelerates any YOLO version. Should also be able to support without
changes a userspace driver that implements execution of ONNX, PyTorch
models, etc. With or without conversion to an intermediate model
format.

Regarding the particular userspace driver that has been submitted for
review to Mesa, you can put questions and comments at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698

Thanks,

Tomeu
