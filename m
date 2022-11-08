Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93787621870
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 16:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5C610E491;
	Tue,  8 Nov 2022 15:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850B810E48B;
 Tue,  8 Nov 2022 15:36:59 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-13b23e29e36so16612120fac.8; 
 Tue, 08 Nov 2022 07:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zx57UILoxvgRruvcsmylD9V5bInFXLaIF25HM779Eps=;
 b=ajj7TOWsJs2doEafaCtG3aMLcO3/9z0rMnAJ1l/RSv8DO6shv6IF/I5HaUTobymbhL
 QiGcqZWSMPQtFo8lmQZsnFaegjfkj5jNzlOEtIMWDrREHdgyxgbQkevDBedgIP6Y9NAC
 zF3ve34Tyon99FIlvSTrNu3L+qHZXNt6jVLgI/LqHkrPU24YIBZZK/BYvwkcDMj/uR18
 FeXRwS4TDpiCMxog613Qpe+RpP0tU9SsvyP/oHaSW7vFqpuw11Uiwn5ws60YQwfyj+YQ
 tgQGw1bFzKUfDTwWW7RN745H11cT1FmzscRd031BTO7n1kUdMHNkAuJtk0LuKA5zl1Bu
 HFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zx57UILoxvgRruvcsmylD9V5bInFXLaIF25HM779Eps=;
 b=d7LsaiplE7V813GqhwxM1hujXkQfslrWw/o9xXNNxYt5Z5uN7iausS8MEPRmVtE3yg
 9oxtI78jm6W1pUGwWGvcZpiylVv1XJV0GY2KspKlBxIVfCQyVq5SggPcYL1bNXAg8Oog
 WDSuNzRN7Lp2UZj4mvFxG7pABF0/A12xDxaN43pE0K1w7op0/EFfxUaFKjnjb0j1GYIv
 CxLoMfccldgsYHP8kwGcJEXwD5eaQDm5ynqdZ+oYoQJPW0fI/2kmw+N/9XoG0EErDTdC
 I8hSsI8YKjzBw6Lljeia+YAZdVn/8i0DgSZ7HOjyVfokxJjUKMg4SpUyM5aoBWctFcn6
 A6NQ==
X-Gm-Message-State: ACrzQf0yybgLCosWzbDxrMULq1aHN5Jp/HCQL8OuRtUO08AxyjzqITrW
 SjdySa10XlP7aLF6h+QVKzZYOKykQzP99II49Wg=
X-Google-Smtp-Source: AMsMyM6TbDkdU8VWFbsTZf3PhlK9/YCaSk0GYY6O2W2sUAStpJvtjgqmIDWcq1UXauJMUQIhajWJy1+pisoYztwmL4Q=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr33865016oao.96.1667921818698; Tue, 08
 Nov 2022 07:36:58 -0800 (PST)
MIME-Version: 1.0
References: <1667555402-52866-1-git-send-email-guohanjun@huawei.com>
 <1667555402-52866-2-git-send-email-guohanjun@huawei.com>
In-Reply-To: <1667555402-52866-2-git-send-email-guohanjun@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Nov 2022 10:36:47 -0500
Message-ID: <CADnq5_O+o7nbSy--kuR3awK2GhV_PsXLONgOE36VFdyPCC1T_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/radeon: Add the missed acpi_put_table() to fix
 memory leak
To: Hanjun Guo <guohanjun@huawei.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks

On Fri, Nov 4, 2022 at 6:05 AM Hanjun Guo <guohanjun@huawei.com> wrote:
>
> When the radeon driver reads the bios information from ACPI
> table in radeon_acpi_vfct_bios(), it misses to call acpi_put_table()
> to release the ACPI memory after the init, so add acpi_put_table()
> properly to fix the memory leak.
>
> Fixes: 268ba0a99f89 ("drm/radeon: implement ACPI VFCT vbios fetch (v3)")
> Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
> ---
>  drivers/gpu/drm/radeon/radeon_bios.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
> index 520d1d6..16730c1 100644
> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> @@ -612,13 +612,14 @@ static bool radeon_acpi_vfct_bios(struct radeon_device *rdev)
>         acpi_size tbl_size;
>         UEFI_ACPI_VFCT *vfct;
>         unsigned long offset;
> +       bool r = false;
>
>         if (!ACPI_SUCCESS(acpi_get_table("VFCT", 1, &hdr)))
>                 return false;
>         tbl_size = hdr->length;
>         if (tbl_size < sizeof(UEFI_ACPI_VFCT)) {
>                 DRM_ERROR("ACPI VFCT table present but broken (too short #1)\n");
> -               return false;
> +               goto out;
>         }
>
>         vfct = (UEFI_ACPI_VFCT *)hdr;
> @@ -631,13 +632,13 @@ static bool radeon_acpi_vfct_bios(struct radeon_device *rdev)
>                 offset += sizeof(VFCT_IMAGE_HEADER);
>                 if (offset > tbl_size) {
>                         DRM_ERROR("ACPI VFCT image header truncated\n");
> -                       return false;
> +                       goto out;
>                 }
>
>                 offset += vhdr->ImageLength;
>                 if (offset > tbl_size) {
>                         DRM_ERROR("ACPI VFCT image truncated\n");
> -                       return false;
> +                       goto out;
>                 }
>
>                 if (vhdr->ImageLength &&
> @@ -649,15 +650,18 @@ static bool radeon_acpi_vfct_bios(struct radeon_device *rdev)
>                         rdev->bios = kmemdup(&vbios->VbiosContent,
>                                              vhdr->ImageLength,
>                                              GFP_KERNEL);
> +                       if (rdev->bios)
> +                          r = true;
>
> -                       if (!rdev->bios)
> -                               return false;
> -                       return true;
> +                       goto out;
>                 }
>         }
>
>         DRM_ERROR("ACPI VFCT table present but broken (too short #2)\n");
> -       return false;
> +
> +out:
> +       acpi_put_table(hdr);
> +       return r;
>  }
>  #else
>  static inline bool radeon_acpi_vfct_bios(struct radeon_device *rdev)
> --
> 1.7.12.4
>
