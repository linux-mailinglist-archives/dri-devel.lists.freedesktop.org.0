Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C01639AAE3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 21:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CB66F503;
	Thu,  3 Jun 2021 19:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2F76F4F3;
 Thu,  3 Jun 2021 19:21:39 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id u11so7408002oiv.1;
 Thu, 03 Jun 2021 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DCd+Js7x35BRGZXfWolgmG59TF3YUGqV0VSBXueuPA0=;
 b=hkA/DyJ2sLR2D7PYIK9efy4xQzqaSBypMSfskGdmaDhKNZkGMUzP987MqtKaHwMK+m
 4t0tS6U3cGPpRdijl8nw+/yw8lrdG40HruVXuworxoRpbM8U0s9XW511/xDmiG1DMLCD
 E6TLr0AOyYQufzJLTWKDGGOGI92oRiF1+uV75ONeEhNe16yTasIRVx0YaNAKYtJYX2EC
 plqp8ydfl4OuaYhtUb2rhs3HnuzFaH/XxZ9BCJ5jjrUgfsX5lHorDPfsHsU9xORqFcuF
 PoP1H5FuAcymyt7irv/7q5Y73O1rtqDepP/WqqwN4Mj4rdVCMxQkFlO2pkG7+FfzNWgO
 eyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCd+Js7x35BRGZXfWolgmG59TF3YUGqV0VSBXueuPA0=;
 b=Bz7I5TWQidXoeT3+2DPgIEURrjO6SYywj9zq2k2IPy4ZH55k5JY36Dv6h+bw/TFsmB
 7/6eYxgnsT5hNZC3mOKf4gXdsQJHbk91+nOoQddGMgHYXfRzVgCbuHXsgSqI5M8x4d08
 Q4lnlVumkspjdAyiNf/bbfc0I+hgbeV9SEelmWTDksOTmwIp3MDP4lzVgmXO+s0bcOjb
 VGtDGmV690T4hw+r90plGdtrFXzGwojOwzY8XhDJcLb9Dc3k0WuL7GHUhBrgatPjkUVV
 7/VrJ5rym9PgUB61DA/x2FSjXUw2sW/6WWvBPzEpt+d2yGzyDY+qogbMr1w9K+nSFZjj
 aSig==
X-Gm-Message-State: AOAM531X9f02uOs096t57Je6ouuG6hDiXm/ySHHNprOji+C2NSKw7q3k
 X+X70OmNr2bH1wSbOjN2y488vpH7uma86uO8iGE=
X-Google-Smtp-Source: ABdhPJzWkTX6vRMR+uBIu8hDUsOPxhyr3oPBIh21PkI0WEijAarE7m/m4tspL1zo5oT/gzxyVP/f31SQWVIWSVAGqI0=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr495320oiw.123.1622748099282; 
 Thu, 03 Jun 2021 12:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <87o8cnfr3s.wl-chenli@uniontech.com>
In-Reply-To: <87o8cnfr3s.wl-chenli@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Jun 2021 15:21:28 -0400
Message-ID: <CADnq5_PorxhXnVXY8NxqjTj-1y-n0589QSiqUQc=QGNVhzP0xw@mail.gmail.com>
Subject: Re: [PATCH] radeon: use memcpy_to/fromio for UVD fw upload
To: Chen Li <chenli@uniontech.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 3:35 AM Chen Li <chenli@uniontech.com> wrote:
>
>
> I met a gpu addr bug recently and the kernel log
> tells me the pc is memcpy/memset and link register is
> radeon_uvd_resume.
>
> As we know, in some architectures, optimized memcpy/memset
> may not work well on device memory. Trival memcpy_toio/memset_io
> can fix this problem.
>
> BTW, amdgpu has already done it in:
> commit ba0b2275a678 ("drm/amdgpu: use memcpy_to/fromio for UVD fw upload"),
> that's why it has no this issue on the same gpu and platform.
>
> Also fix some coding issues reported from sparse.

Can you split the sparse fixes and the mmio fixes into two patches?

Thanks,

Alex

>
> Signed-off-by: Chen Li <chenli@uniontech.com>
> ---
>  drivers/gpu/drm/radeon/radeon_uvd.c | 30 ++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index dfa9fdbe98da..0d6a5cfa2abf 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -152,9 +152,11 @@ int radeon_uvd_init(struct radeon_device *rdev)
>
>                         rdev->uvd.fw_header_present = true;
>
> -                       family_id = le32_to_cpu(hdr->ucode_version) & 0xff;
> -                       version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
> -                       version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
> +                       family_id = (__force u32)(hdr->ucode_version) & 0xff;
> +                       version_major = (le32_to_cpu((__force __le32)(hdr->ucode_version))
> +                                                        >> 24) & 0xff;
> +                       version_minor = (le32_to_cpu((__force __le32)(hdr->ucode_version))
> +                                                        >> 8) & 0xff;
>                         DRM_INFO("Found UVD firmware Version: %u.%u Family ID: %u\n",
>                                  version_major, version_minor, family_id);
>
> @@ -286,7 +288,9 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>         if (rdev->uvd.vcpu_bo == NULL)
>                 return -EINVAL;
>
> -       memcpy(rdev->uvd.cpu_addr, rdev->uvd_fw->data, rdev->uvd_fw->size);
> +       memcpy_toio((void __iomem *)rdev->uvd.cpu_addr,
> +                               rdev->uvd_fw->data,
> +                               le32_to_cpu((__force __le32)rdev->uvd_fw->size));
>
>         size = radeon_bo_size(rdev->uvd.vcpu_bo);
>         size -= rdev->uvd_fw->size;
> @@ -294,7 +298,7 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>         ptr = rdev->uvd.cpu_addr;
>         ptr += rdev->uvd_fw->size;
>
> -       memset(ptr, 0, size);
> +       memset_io((void __iomem *)ptr, 0, size);
>
>         return 0;
>  }
> @@ -791,17 +795,17 @@ int radeon_uvd_get_create_msg(struct radeon_device *rdev, int ring,
>                 return r;
>
>         /* stitch together an UVD create msg */
> -       writel(cpu_to_le32(0x00000de4), &msg[0]);
> +       writel((__force u32)cpu_to_le32(0x00000de4), &msg[0]);
>         writel(0x0, (void __iomem *)&msg[1]);
> -       writel(cpu_to_le32(handle), &msg[2]);
> +       writel((__force u32)cpu_to_le32(handle), &msg[2]);
>         writel(0x0, &msg[3]);
>         writel(0x0, &msg[4]);
>         writel(0x0, &msg[5]);
>         writel(0x0, &msg[6]);
> -       writel(cpu_to_le32(0x00000780), &msg[7]);
> -       writel(cpu_to_le32(0x00000440), &msg[8]);
> +       writel((__force u32)cpu_to_le32(0x00000780), &msg[7]);
> +       writel((__force u32)cpu_to_le32(0x00000440), &msg[8]);
>         writel(0x0, &msg[9]);
> -       writel(cpu_to_le32(0x01b37000), &msg[10]);
> +       writel((__force u32)cpu_to_le32(0x01b37000), &msg[10]);
>         for (i = 11; i < 1024; ++i)
>                 writel(0x0, &msg[i]);
>
> @@ -827,9 +831,9 @@ int radeon_uvd_get_destroy_msg(struct radeon_device *rdev, int ring,
>                 return r;
>
>         /* stitch together an UVD destroy msg */
> -       writel(cpu_to_le32(0x00000de4), &msg[0]);
> -       writel(cpu_to_le32(0x00000002), &msg[1]);
> -       writel(cpu_to_le32(handle), &msg[2]);
> +       writel((__force u32)cpu_to_le32(0x00000de4), &msg[0]);
> +       writel((__force u32)cpu_to_le32(0x00000002), &msg[1]);
> +       writel((__force u32)cpu_to_le32(handle), &msg[2]);
>         writel(0x0, &msg[3]);
>         for (i = 4; i < 1024; ++i)
>                 writel(0x0, &msg[i]);
> --
> 2.31.1
>
>
>
