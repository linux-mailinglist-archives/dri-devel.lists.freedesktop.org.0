Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E4822F5D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 15:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AC810E22F;
	Wed,  3 Jan 2024 14:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF7610E0BD;
 Wed,  3 Jan 2024 14:23:33 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-204ec50010eso3041223fac.3; 
 Wed, 03 Jan 2024 06:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704291812; x=1704896612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0u826NVcXuA1deo06C7JGYj/B5yIiaVOcjSt+2ZaOw=;
 b=VKTiId4iEsq95qB3xBr4KgI3AGOUChCTjlsLg4i7QMBqh3f7dZHo+CCXLzjip7YFNs
 fk+I7SFbsQJfBwj61ZaSxEneHs8zrXGmTdvJW2SaFebQC+N3esbCsaUE8iul6S0lLdrG
 dAMUwCZ2qOUXJCcJMIT7hlzRH2HqWNIieH8ivFeXKy7Ly14h2Ipu4hlZwZd8Yn9qFstV
 /iq8AnPdx0O/VWw50vOAswQn/x7S0UFqPTBlo+VGoeVrN+OK/tS04NIso2RplCrlL2M5
 kU3NJ2Kkd0FCZuDJoAk9KpM8SgfbFNhc4edihk5mT20nJAw/O39ymqId/suHOZH6hFmu
 peLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704291812; x=1704896612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0u826NVcXuA1deo06C7JGYj/B5yIiaVOcjSt+2ZaOw=;
 b=R/rr6Op6A8ksXYV7zTyDk3wIYX3v7eAQpQCv00fz02LyAndRaq8sBo7xdwTflW1pPE
 sQVYjI310YHRVe/gsZCMt8AbD7Q/opzcc8M4Xbq302m6MFCeP7eYWYzRej4MBF47lE4n
 XQw8GyQsJl1/LL2zKVHqx/X9tuxN10lPjJRq7KKd4zH85gFufwdizjx8Ce+a3PWcAT9t
 9sFvcebrWF9c9/o92RT6xUCPAPGUvHL7e4WGfra5W4ZeYMRvR5H9y9+l8sGlU1PUXtqy
 uQ4ldQMJXHnNS5IIEriyYUl7enPL1VlHKDVWVUY5+GQk9qKtIo8qFe0lmhsLrVtK/1d5
 TfrQ==
X-Gm-Message-State: AOJu0Yy8x0t0epwTtPq89ulp239DxXlUjfSDUYXt4+MlQ8duNHxYdkju
 FUmh+SbHkRFORCO50YRPMBOgW5VHdBVsCEXjb0k=
X-Google-Smtp-Source: AGHT+IGAhuyc++24/hXo0uMiV0YfsaH29lLz29e+DTX2LlDh7OpJ5Skbt5VbhN7OZ7EGZkfYmIb5BMXXqyil9+1zwFk=
X-Received: by 2002:a05:6870:e248:b0:1fb:75b:99c5 with SMTP id
 d8-20020a056870e24800b001fb075b99c5mr19601190oac.116.1704291812554; Wed, 03
 Jan 2024 06:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20231231143700.893822-1-dhirschfeld@habana.ai>
In-Reply-To: <20231231143700.893822-1-dhirschfeld@habana.ai>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Jan 2024 09:23:21 -0500
Message-ID: <CADnq5_NmXQBBH9WSfTWJPO+hZajQ9YE0Babrwo43O+9restaBA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fixes for HMM mem allocation
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
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
Cc: ogabbay@kernel.org, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 obitton@habana.ai, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 Felix.Kuehling@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 31, 2023 at 9:39=E2=80=AFAM Dafna Hirschfeld <dhirschfeld@haban=
a.ai> wrote:
>
> Few fixes to amdkfd and the doc of
> devm_request_free_mem_region.
>
> Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 6 +++---
>  kernel/resource.c                        | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_migrate.c
> index 6c25dab051d5..b8680e0753ca 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -1021,7 +1021,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *=
adev)
>         } else {
>                 res =3D devm_request_free_mem_region(adev->dev, &iomem_re=
source, size);
>                 if (IS_ERR(res))
> -                       return -ENOMEM;
> +                       return PTR_ERR(res);
>                 pgmap->range.start =3D res->start;
>                 pgmap->range.end =3D res->end;
>                 pgmap->type =3D MEMORY_DEVICE_PRIVATE;
> @@ -1037,10 +1037,10 @@ int kgd2kfd_init_zone_device(struct amdgpu_device=
 *adev)
>         r =3D devm_memremap_pages(adev->dev, pgmap);
>         if (IS_ERR(r)) {
>                 pr_err("failed to register HMM device memory\n");
> -               /* Disable SVM support capability */
> -               pgmap->type =3D 0;
>                 if (pgmap->type =3D=3D MEMORY_DEVICE_PRIVATE)
>                         devm_release_mem_region(adev->dev, res->start, re=
source_size(res));
> +               /* Disable SVM support capability */
> +               pgmap->type =3D 0;
>                 return PTR_ERR(r);
>         }
>
> diff --git a/kernel/resource.c b/kernel/resource.c
> index 866ef3663a0b..fe890b874606 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -1905,8 +1905,8 @@ get_free_mem_region(struct device *dev, struct reso=
urce *base,
>   * devm_request_free_mem_region - find free region for device private me=
mory
>   *
>   * @dev: device struct to bind the resource to
> - * @size: size in bytes of the device memory to add
>   * @base: resource tree to look in
> + * @size: size in bytes of the device memory to add

This change should be a separate patch?  It looks unrelated.

Alex

>   *
>   * This function tries to find an empty range of physical address big en=
ough to
>   * contain the new resource, so that it can later be hotplugged as ZONE_=
DEVICE
> --
> 2.34.1
>
