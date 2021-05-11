Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC8637AB34
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 17:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01F56EA73;
	Tue, 11 May 2021 15:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758776EA71;
 Tue, 11 May 2021 15:56:43 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id d21so19422613oic.11;
 Tue, 11 May 2021 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h7iIYF45nkSj7+g5JYXYO46CGjK7fSopGYuVYNTNps0=;
 b=I9MP1cP7gv8cqPNcmQDtTYNtqJ4PB4CylSFQh+goQYWbz50b9wOkMIhOszhCNA4BJX
 bAq6J7wjlHz4WfQ9Vc/N64YcxTTYOefrdjPVvErHp8kFfo1f2eFHWQCseZbUwoaKFGn1
 TU3Gmhrnx7oqRdejuwja+Ta2yxvk0X8uAGRPyo/zwzP6wVEV5fjx0/aJj4M62cKfPryV
 g5UnifHf7U1sA/v7IbNcCYLUP/yCwoJyO0bRg6Ls18RptGpVYKa7Wy5COmVAVqld/4Gk
 nWrMIz7B2JffLhfBAQus5CwtCeFfObhVkGE8/rc01pi8M41At4brUFPpl1LRm3uOU26M
 s/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h7iIYF45nkSj7+g5JYXYO46CGjK7fSopGYuVYNTNps0=;
 b=I6rJ47qTxOlyZloqRIOjUuoqKSMteDelT+aZ0XtrsMnLhS1rFgsaKvH0VIWDHfcG2x
 aQF9WTcpnhN/TGfhxu7iNx1O8H1fK+X7vBNo/oS4csQvSUVTxHxwhzdvAEfpal41wuzz
 XUgDFEgruY95uqqjj2fgBh36UeKWUbO+xezRv+AFCXtSrbJ0W4gpjz/L82UJzdsFTDyw
 O57h5Sy3Y34ajWNefZuy+sbtOFjt/MZtuQK3f4DleuzwMb+9YzL33/5J8q6y139O27ps
 mc5oeZuu8wMD9kDPn8y/DQiQ17TPDFAdjmrUe9OWYgEAnafyfI6fJDmICQ9JZSI9yuh8
 hkcw==
X-Gm-Message-State: AOAM530NJXWx99APdcL8CXuKJZogAR4OhH59hmG2lThomnqbd+IwWtBp
 Mmwrz463YDP0FGufYvdXxPfIswSP0CSBYC4dwUI=
X-Google-Smtp-Source: ABdhPJwRvCxLeiNcki/dxN9rN0hqGVEzuBvVEkbqHLe4xF644D25Kdv7Sq8e4RZJx6qQwPZlDrpnT6JzIew7eUKFWzA=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr22893488oii.123.1620748603019; 
 Tue, 11 May 2021 08:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-7-andrey.grodzovsky@amd.com>
In-Reply-To: <20210510163625.407105-7-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 May 2021 11:56:32 -0400
Message-ID: <CADnq5_MNd+2BLV-v9EJPR-zwW_qT4UVLMRowyY2_tEvsQRYvew@mail.gmail.com>
Subject: Re: [PATCH v6 06/16] drm/amdgpu: Handle IOMMU enabled case.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 12:37 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Handle all DMA IOMMU gropup related dependencies before the
> group is removed.
>
> v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
> v6: Drop the BO unamp list
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   | 3 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 9 +++++++++
>  drivers/gpu/drm/amd/amdgpu/cik_ih.c        | 1 -
>  drivers/gpu/drm/amd/amdgpu/cz_ih.c         | 1 -
>  drivers/gpu/drm/amd/amdgpu/iceland_ih.c    | 1 -
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c     | 3 ---
>  drivers/gpu/drm/amd/amdgpu/si_ih.c         | 1 -
>  drivers/gpu/drm/amd/amdgpu/tonga_ih.c      | 1 -
>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c     | 3 ---
>  11 files changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 18598eda18f6..a0bff4713672 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3256,7 +3256,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>         NULL
>  };
>
> -
>  /**
>   * amdgpu_device_init - initialize the driver
>   *
> @@ -3698,12 +3697,13 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>                 amdgpu_ucode_sysfs_fini(adev);
>         sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>
> -
>         amdgpu_fbdev_fini(adev);
>
>         amdgpu_irq_fini_hw(adev);
>
>         amdgpu_device_ip_fini_early(adev);
> +
> +       amdgpu_gart_dummy_page_fini(adev);
>  }
>
>  void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> index c5a9a4fb10d2..354e68081b53 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>   *
>   * Frees the dummy page used by the driver (all asics).
>   */
> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>  {
>         if (!adev->dummy_page_addr)
>                 return;
> @@ -375,5 +375,4 @@ int amdgpu_gart_init(struct amdgpu_device *adev)
>   */
>  void amdgpu_gart_fini(struct amdgpu_device *adev)
>  {
> -       amdgpu_gart_dummy_page_fini(adev);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> index a25fe97b0196..78dc7a23da56 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> @@ -58,6 +58,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>  void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>  int amdgpu_gart_init(struct amdgpu_device *adev);
>  void amdgpu_gart_fini(struct amdgpu_device *adev);
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>  int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>                        int pages);
>  int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> index 233b64dab94b..a14973a7a9c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -361,6 +361,15 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>                 if (!amdgpu_device_has_dc_support(adev))
>                         flush_work(&adev->hotplug_work);
>         }
> +
> +       if (adev->irq.ih_soft.ring)
> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);

Why is the ih_soft handled here and in the various ih sw_fini functions?

> +       if (adev->irq.ih.ring)
> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih);
> +       if (adev->irq.ih1.ring)
> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> +       if (adev->irq.ih2.ring)
> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> index 183d44a6583c..df385ffc9768 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> @@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         amdgpu_irq_fini_sw(adev);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>         amdgpu_irq_remove_domain(adev);
>
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> index d32743949003..b8c47e0cf37a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> @@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         amdgpu_irq_fini_sw(adev);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>         amdgpu_irq_remove_domain(adev);
>
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> index da96c6013477..ddfe4eaeea05 100644
> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> @@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         amdgpu_irq_fini_sw(adev);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>         amdgpu_irq_remove_domain(adev);
>
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> index 5eea4550b856..e171a9e78544 100644
> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> @@ -571,9 +571,6 @@ static int navi10_ih_sw_fini(void *handle)
>
>         amdgpu_irq_fini_sw(adev);
>         amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> index 751307f3252c..9a24f17a5750 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> @@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         amdgpu_irq_fini_sw(adev);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> index 973d80ec7f6c..b08905d1c00f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> @@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         amdgpu_irq_fini_sw(adev);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>         amdgpu_irq_remove_domain(adev);
>
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> index dead9c2fbd4c..d78b8abe993a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> @@ -515,9 +515,6 @@ static int vega10_ih_sw_fini(void *handle)
>
>         amdgpu_irq_fini_sw(adev);
>         amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>
>         return 0;
>  }
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
