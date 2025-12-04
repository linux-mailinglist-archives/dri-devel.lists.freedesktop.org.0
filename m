Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A823CA5484
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 21:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B2110E1EC;
	Thu,  4 Dec 2025 20:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EoHcqT8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F53810E1EC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 20:21:21 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-640d0895d7cso2134824d50.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 12:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764879680; x=1765484480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zuo/W9he8IszoxzvcUUxPKSJh/P4Kfi+7HKwANVdvp8=;
 b=EoHcqT8MGCNeZkpeDDCGgdwIKWYIafXKON2MvFUtzy27HXoBRZlpbvAgZj0IyULSES
 HgIFkiAtPz84fUFFn2X++jHYnFYMLiYYW6J7nRc2Yu+Ubuq4koI1ktq0+yxILujifM7W
 7kIqikq8UCTkCdY4yMXj4tIGvHPDbFkgR2DQhum0k1iF8Wr4yN4E8ERASYnma/G123Zn
 TuWkH2PlSOHFXSNMazwdDoPSh90pe1WQHHU0kr5cd/w/Xe0XT0NTrsLLdJuBv4D51YWb
 zks0ceuLt8c60n0rNZKahNgL4cXQtN1WudLjgGxmo2BJse7WU6EdP1Dcb2MGVd2nvWgL
 NKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764879680; x=1765484480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zuo/W9he8IszoxzvcUUxPKSJh/P4Kfi+7HKwANVdvp8=;
 b=TZjj96msXyztpF+JGPekMLF3gm+KlFeSSgeYFmxfGcdQOO1D7Lz6IBz/zPP5bhkPmu
 BdVjpv303O34UelOKR/6ZqU8oObRP4kjAlOmPorXQaiN0yGFMxcl/TaA0Oq4IL9JH6jt
 bh1He5uOJPIN5wONaKm7BzpWqUzONZR0gfQHXeIOvvZqQnaF3SRfWZU6eJPZXgX3e8Bu
 FCT+CPgnPE5NUbWlktTjdzJo3LDOZ7NArmxjWhh/m5rkxZmtWl4OyF5g5NB6s+ZqzpVX
 CEezzrl/z4lr6/8XYnD1YHmCbKsDXEFo6Uun8FmQvLlnva7RX4IrWEqY9chqdqPHqWWi
 eQwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq8GlSXdHwtPuc+0MK2xe8xVJpBs4fqE4Na0IHNsGnndP8DS8fxZYWg3ixFYVD7n5ITSH8UA97zrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIkENwC0BXGWt/0JfPMSet1mfYMzmBKB/f70Zc9CgxIe1aFYyk
 DtPFK52dXjmBMY/MNGIxx7PlElw2jkYtGnUdzOvBYIs6+Y7wFh0k/J3SRvY1W5pphrfgGyT2UiE
 ABzQVn71Qqbt4hv8DoWEiaXY08QGXNn0=
X-Gm-Gg: ASbGncshHCwk5ietwhsMGty4PMl6/+F+Nxfe6dxFSNs9zSqAi1pNadH1ZfmtDK2DnW5
 j+85+95BgDC3fieQMaYQc5L747I5MjFHUUtRtDy4GVWOs+PH4/VJ21IIVtFyc/xux/4cZn4Ldw/
 XfRm8avtH7uNaJ6exeM6IxYIblkagZJSVOReLNO7QdK/4yML9LPV6M9zqrqI1UhJkdkwHic+/S3
 eksAQcSKE/kmOcr44C1/No5tBhy6UCavXVoplO2Z8R+iYbIbu0nsJQ2ykFqxSA0ZALQXnpTA8I2
 6iw7O40EVnICmLrmI8fSJC+krOfy5w==
X-Google-Smtp-Source: AGHT+IExp52CHdirajOyAS3cYqAxedkRdpjdbBoYVSBuPegJxpE6750mVOtoT8QbZkxshQzeT+2aFGuPoYgIXMvhI1w=
X-Received: by 2002:a05:690e:140e:b0:63f:acc8:f163 with SMTP id
 956f58d0204a3-6443d73873bmr3514447d50.21.1764879679948; Thu, 04 Dec 2025
 12:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
In-Reply-To: <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Dec 2025 12:21:08 -0800
X-Gm-Features: AQt7F2pIDvpd97xMRWCDmYHJEEteVTILRpAG97I-w06G30Mm7Yo4rOaiUqPS-Nw
Message-ID: <CAPaKu7R_PJPD3s6wvuduGHDFCy+AE+Hd+p1cS+ZSu_tTgE2txQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Wed, Dec 3, 2025 at 6:04=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Mali GPUs have three registers that indicate which parts of the hardware
> are powered and active at any moment. These take the form of bitmaps. In
> the case of SHADER_PWRACTIVE for example, a high bit indicates that the
> shader core corresponding to that bit index is active. These bitmaps
> aren't solely contiguous bits, as it's common to have holes in the
> sequence of shader core indices, and the actual set of which cores are
> present is defined by the "shader present" register.
>
> When the GPU finishes a power state transition, it fires a
> GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> received, the PWRACTIVE registers will likely contain interesting new
> information.
I am seeing

   irq/342-panthor-412     [000] .....   934.526754: gpu_power_active:
shader_bitmap=3D0x0 tiler_bitmap=3D0x0 l2_bitmap=3D0x0
   irq/342-panthor-412     [000] .....   936.640356: gpu_power_active:
shader_bitmap=3D0x0 tiler_bitmap=3D0x0 l2_bitmap=3D0x0

on a gpu-bound test. It does not look like collecting samples on
GPU_IRQ_POWER_CHANGED_ALL gives too much info.

I think they are more useful to be collected periodically, such that
we know that in the past X seconds, Y out of a total of Z samples
indicates activities. That's best done in userspace, and panthor's
role should be to provide an uapi such as
https://lore.kernel.org/all/cover.1743517880.git.lukas.zapolskas@arm.com/.

>
> This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
> which is something related to Mali v14+'s power control logic. The
> PWRACTIVE registers and corresponding interrupts are already available
> in v9 and onwards.
>
> Expose this as a tracepoint to userspace. This allows users to debug
> various scenarios and gather interesting information, such as: knowing
> how much hardware is lit up at any given time, correlating graphics
> corruption with a specific active shader core, measuring when hardware
> is allowed to go to an inactive state again, and so on.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  1 +
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  9 ++++++++
>  drivers/gpu/drm/panthor/panthor_trace.h  | 38 ++++++++++++++++++++++++++=
++++++
>  3 files changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index e133b1e0ad6d..a3cb934104b8 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -548,6 +548,7 @@ int panthor_device_resume(struct device *dev)
>                             DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
>         atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
>         mutex_unlock(&ptdev->pm.mmio_lock);
> +
>         return 0;
>
>  err_suspend_devfreq:
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/pant=
hor/panthor_gpu.c
> index 9cb5dee93212..8830aa9a5c4b 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -22,6 +22,9 @@
>  #include "panthor_hw.h"
>  #include "panthor_regs.h"
>
> +#define CREATE_TRACE_POINTS
> +#include "panthor_trace.h"
> +
>  /**
>   * struct panthor_gpu - GPU block management data.
>   */
> @@ -46,6 +49,7 @@ struct panthor_gpu {
>         (GPU_IRQ_FAULT | \
>          GPU_IRQ_PROTM_FAULT | \
>          GPU_IRQ_RESET_COMPLETED | \
> +        GPU_IRQ_POWER_CHANGED_ALL | \
>          GPU_IRQ_CLEAN_CACHES_COMPLETED)
>
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
> @@ -97,6 +101,11 @@ static void panthor_gpu_irq_handler(struct panthor_de=
vice *ptdev, u32 status)
>                 wake_up_all(&ptdev->gpu->reqs_acked);
>         }
>         spin_unlock(&ptdev->gpu->reqs_lock);
> +
> +       if (status & GPU_IRQ_POWER_CHANGED_ALL)
> +               trace_gpu_power_active(gpu_read64(ptdev, SHADER_PWRACTIVE=
),
> +                                      gpu_read64(ptdev, TILER_PWRACTIVE)=
,
> +                                      gpu_read64(ptdev, L2_PWRACTIVE));
>  }
>  PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
>
> diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/pa=
nthor/panthor_trace.h
> new file mode 100644
> index 000000000000..01013f81e68a
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2025 Collabora ltd. */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM panthor
> +
> +#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> +#define __PANTHOR_TRACE_H__
> +
> +#include <linux/tracepoint.h>
> +#include <linux/types.h>
> +
> +TRACE_EVENT(gpu_power_active,
> +       TP_PROTO(u64 shader_bitmap, u64 tiler_bitmap, u64 l2_bitmap),
> +       TP_ARGS(shader_bitmap, tiler_bitmap, l2_bitmap),
> +       TP_STRUCT__entry(
> +               __field(u64, shader_bitmap)
> +               __field(u64, tiler_bitmap)
> +               __field(u64, l2_bitmap)
> +       ),
> +       TP_fast_assign(
> +               __entry->shader_bitmap  =3D shader_bitmap;
> +               __entry->tiler_bitmap   =3D tiler_bitmap;
> +               __entry->l2_bitmap      =3D l2_bitmap;
> +       ),
> +       TP_printk("shader_bitmap=3D0x%llx tiler_bitmap=3D0x%llx l2_bitmap=
=3D0x%llx",
> +                 __entry->shader_bitmap, __entry->tiler_bitmap, __entry-=
>l2_bitmap
> +       )
> +);
> +
> +#endif /* __PANTHOR_TRACE_H__ */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE panthor_trace
> +
> +#include <trace/define_trace.h>
>
> --
> 2.52.0
>
