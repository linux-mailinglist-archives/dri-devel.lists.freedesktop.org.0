Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42210904102
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 18:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DEE10E039;
	Tue, 11 Jun 2024 16:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VHwIApY5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABBF10E039
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 16:18:13 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so1646878a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718122692; x=1718727492;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=na2N2aBps+zArVIvZGGC671qT/pe5H2J6aVTa83RG9Y=;
 b=VHwIApY5Ir3crKRV0kkATBu/RE/b8z8ZlEbMRKL3MVRaqnNj4PNffNQBpouOiYK2JW
 RnmYoDJAMDRDPolhAoHg4JvXqUPpqPeKhcH5g9bFbSXRDtaErbkVkUZpaG09bdU6ldu/
 /wLVI6p071XJLPxpmwWdZLbHAydiZsm6u6refSRv2lRIjA4iDo4VJirJnaSlT66GziOI
 QxH8VGnP2msTdvKp4+g78KHXbujhI9+2VaJptkHpcWHfQ/+39dafSXSMDldQ2qi6jo/0
 ct8RMZq1RnYLVEZVPp58KD/YVZ7itVd8YCVC9xvKFeU8uZqIvf25rpSNVB6h2oVsURpu
 aKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718122692; x=1718727492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=na2N2aBps+zArVIvZGGC671qT/pe5H2J6aVTa83RG9Y=;
 b=kCRHahOrF/WSNcyzsYXLbwz92XH+GD6iRabXBkD9WETc63fFHy5KjaD5zUi1pW6k0N
 E9UZj+Wf0k8focp2EcxAzl3m4w84ek4hIZH63LCTFYQYR1FW+dXvjssHrkWLRcuo0tmx
 /GgsAHXaqwRzPzr1zOnsHBd6JJKl/dMG8CmWhPr2Lfg5RGU7FLjTK9d0VmsyjFvGkS4m
 c/2kdfUVa7n17xHsYr3yew7OtNcO5oSQjSTMrvYsc34T0hYLaN7f6bajzdXidqzy06QM
 3csfvkWn0TKwe6ZLNWeQuHqV3UujX7XxdA14QmUtgxL4jv+tXvLNfbVLHLSJJ2bgh3bP
 u6Kg==
X-Gm-Message-State: AOJu0Yw1im/ZVaPqBalltY139tjkK09DrWIsVy1MuFgkKba0Jt4K5EVi
 uIPUD9VxG6HAMIJmOEL7U4e+joiFQ+VgLEfF48IN0/ib2l2IQVBqiGMSSpNUJh4e5NjNXqo3k2o
 Kfbnhu300VbpmmQ57nIKaxrv+CWacFmii848u
X-Google-Smtp-Source: AGHT+IHMr/1xk34wAAvEn0V0+CVzuZqwqewTcIoAVyIAALUM5ZoRoDXCpavBszQCRPcPvyVxo2YymYooG7xymIv57qA=
X-Received: by 2002:a50:9fad:0:b0:57c:6b68:3ba8 with SMTP id
 4fb4d7f45d1cf-57c6b6840acmr6101346a12.12.1718122691662; Tue, 11 Jun 2024
 09:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240611093441.200910-1-carsten.haitzler@foss.arm.com>
In-Reply-To: <20240611093441.200910-1-carsten.haitzler@foss.arm.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 11 Jun 2024 09:17:58 -0700
Message-ID: <CABdmKX3jw9QJJEhVTzj-vQbnzoAu3WAzK0OaruO2nbym8A_FNA@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix alignment of temporary stack ioctl buffers
To: carsten.haitzler@foss.arm.com
Cc: dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
 christian.koenig@amd.com, Felix.Kuehling@amd.com, alexander.deucher@amd.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
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

On Tue, Jun 11, 2024 at 2:35=E2=80=AFAM <carsten.haitzler@foss.arm.com> wro=
te:
>
> From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
>
> In a few places (core drm + AMD kfd driver), the ioctl handling uses a
> temporary 128 byte buffer on the stack to copy to/from user. ioctl data
> can have structs with types of much larger sizes than a byte and a
> system may require alignment of types in these. At the same time the
> compiler may align a char buf to something else as it has no idea that
> this buffer is used for storing structs with such alignment
> requirements. At a minimum putting in alignment information as an
> attribute should be a warning in future if an architecture that needs
> more alignment appears.
>
> This was discovered while implementing capability ABI support in Linux
> on ARM's Morello CPU (128 bit capability "pointers" in userspace, with
> a 64bit non-capability kernel (hybrid) setup). In this, userspace
> ioctl structs now had to transport capabilities that needed 16 byte
> alignment, but the kernel was not putting these data buffers on that
> alignment boundary.
>
> Currently the largest type that is needed is a u64 so the alignment
> only asks for that.

Makes sense to me.

Now that the kernel depends on C11, I think:
__attribute__((aligned(__alignof__(u64))))

can be simply reduced to:
_Alignas(u64)

and put first instead of last in the declaration:
_Alignas(u64) char stack_kdata[128];

>
> Signed-off-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
> ---
>  drivers/dma-buf/dma-heap.c               | 2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
>  drivers/gpu/drm/drm_ioctl.c              | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 84ae708fafe7..a49e20440edf 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -126,7 +126,7 @@ static unsigned int dma_heap_ioctl_cmds[] =3D {
>  static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
>                            unsigned long arg)
>  {
> -       char stack_kdata[128];
> +       char stack_kdata[128] __attribute__((aligned(__alignof__(u64))));
>         char *kdata =3D stack_kdata;
>         unsigned int kcmd;
>         unsigned int in_size, out_size, drv_size, ksize;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index fdf171ad4a3c..69a0aae0f016 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -3236,7 +3236,7 @@ static long kfd_ioctl(struct file *filep, unsigned =
int cmd, unsigned long arg)
>         amdkfd_ioctl_t *func;
>         const struct amdkfd_ioctl_desc *ioctl =3D NULL;
>         unsigned int nr =3D _IOC_NR(cmd);
> -       char stack_kdata[128];
> +       char stack_kdata[128] __attribute__((aligned(__alignof__(u64))));
>         char *kdata =3D NULL;
>         unsigned int usize, asize;
>         int retcode =3D -EINVAL;
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index e368fc084c77..aac3d5a539a6 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -767,7 +767,7 @@ long drm_ioctl(struct file *filp,
>         drm_ioctl_t *func;
>         unsigned int nr =3D DRM_IOCTL_NR(cmd);
>         int retcode =3D -EINVAL;
> -       char stack_kdata[128];
> +       char stack_kdata[128] __attribute__((aligned(__alignof__(u64))));
>         char *kdata =3D NULL;
>         unsigned int in_size, out_size, drv_size, ksize;
>         bool is_driver_ioctl;
> --
> 2.25.1
>
