Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 792F51A88D8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E166E113;
	Tue, 14 Apr 2020 18:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E93C6E113;
 Tue, 14 Apr 2020 18:15:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d77so14124782wmd.3;
 Tue, 14 Apr 2020 11:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VclBjPf0G+5Fbq0gaSlTkJ1trKfc494vLUCcFmtZb4c=;
 b=PsNiBJat77NUlKls3n38NeJLDYLaxdO6QQ6kNr7NquUmAWTr4Xr/gyZ+hbFWU/eXM7
 2RULAsbItfI/aUioDQWzlNzU9OwRPaWk6JkOzaTreyYLviOdSSY453B7dw+PDBDHSt5F
 x+ojvn8taK7Eh5VzTxRhgWytqULvg+MjLbTb5qPvwe3GT/SM9ICpx465II+ZHxlvDEu6
 EdZu5PKeyOnl92lAJp0VvmNLIhz/DfFnnJXqACQ6ap+4a4nM1nzV/2vePaF6OLLpoPp6
 VhB8C6nOdPPLhz3JyOYIeW/DRBlSu3OAR06M2NqGsi/j9hp5y8zxBDFL/blKkRX+TQ3S
 +mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VclBjPf0G+5Fbq0gaSlTkJ1trKfc494vLUCcFmtZb4c=;
 b=Yx8E+ShgZQLK9PpUzrQKZkYGhq51wlrufg0w33zTD9CtEEEFMLCpsJtBQ1Uq7ywPwe
 /J/FgDZXCQx4n84ffzBVptTKK3fbjv6Tlh9BroREUL5TJgYRYbnfjuI7DibHc7hvU64c
 p4HaTr5XSs/hVSPnAqtjNFmVg4nZ4IovdvPaX1Fgdwi8cd0can2buZUIjeE9Zmb97zTM
 vrwOEH/p1/1Nu00SECihqy+YhZ+XzHQzHz6CjbgI8hHWxmv9KXfvOZ6yfHVV+n2Y7o3L
 auk8EyGAP7JcOhmiF7jNppT21wlKdKm3hvtG+4QVr93E6TtyePbO47ZbOxKIdZUFxmN/
 IsKg==
X-Gm-Message-State: AGi0PuYvVJS98k9ob3We9e8YwtsMW1nxeXxnBA8+F3i68y598zR7eTvz
 Q4vd4KcZ2hjBMkq/7cI9pOU+RaIBKQV9EYB6aiw=
X-Google-Smtp-Source: APiQypLEf8jmLLVAWrEjgPnl0rCghmXeebEJ0OPl3F3M89wXZj0sFLn3oBx6ZCBDgzxk4rui1NHBjDA+ZFAHFVN+3TA=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr1101168wmb.56.1586888114753; 
 Tue, 14 Apr 2020 11:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <1586864113-30682-1-git-send-email-bernard@vivo.com>
In-Reply-To: <1586864113-30682-1-git-send-email-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Apr 2020 14:15:03 -0400
Message-ID: <CADnq5_Phca3L-HGOQz0DPBoARHgwcJRK_a7-WmeFMPkrPWeOeg@mail.gmail.com>
Subject: Re: [PATCH] Optimized division operation to shift operation
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, Oak Zeng <Oak.Zeng@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, kernel@vivo.com,
 Huang Rui <ray.huang@amd.com>, Kent Russell <kent.russell@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 9:05 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> On some processors, the / operate will call the compiler`s div lib,
> which is low efficient, We can replace the / operation with shift,
> so that we can replace the call of the division library with one
> shift assembly instruction.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Applied.  thanks.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> index b205039..66cd078 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> @@ -175,10 +175,10 @@ static int gmc_v6_0_mc_load_microcode(struct amdgpu_device *adev)
>         amdgpu_ucode_print_mc_hdr(&hdr->header);
>
>         adev->gmc.fw_version = le32_to_cpu(hdr->header.ucode_version);
> -       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
> +       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
>         new_io_mc_regs = (const __le32 *)
>                 (adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_offset_bytes));
> -       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
> +       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
>         new_fw_data = (const __le32 *)
>                 (adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_array_offset_bytes));
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> index 9da9596..ca26d63 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> @@ -193,10 +193,10 @@ static int gmc_v7_0_mc_load_microcode(struct amdgpu_device *adev)
>         amdgpu_ucode_print_mc_hdr(&hdr->header);
>
>         adev->gmc.fw_version = le32_to_cpu(hdr->header.ucode_version);
> -       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
> +       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
>         io_mc_regs = (const __le32 *)
>                 (adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_offset_bytes));
> -       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
> +       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
>         fw_data = (const __le32 *)
>                 (adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_array_offset_bytes));
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> index 27d83204..295039c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -318,10 +318,10 @@ static int gmc_v8_0_tonga_mc_load_microcode(struct amdgpu_device *adev)
>         amdgpu_ucode_print_mc_hdr(&hdr->header);
>
>         adev->gmc.fw_version = le32_to_cpu(hdr->header.ucode_version);
> -       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
> +       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
>         io_mc_regs = (const __le32 *)
>                 (adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_offset_bytes));
> -       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
> +       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
>         fw_data = (const __le32 *)
>                 (adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_array_offset_bytes));
>
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
