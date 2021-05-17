Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AAE383CC9
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 20:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62DF6EA3C;
	Mon, 17 May 2021 18:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29296EA39;
 Mon, 17 May 2021 18:56:50 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so6475785otp.4; 
 Mon, 17 May 2021 11:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kgCDzON2LQ0I20HT7JO8ZVEI4np/E0DaLMXnfz3i4GE=;
 b=P7SNNSD5yGtQfHlkILGXWUu95Q0ZJd2msjwte0cOVeZdVJWoeD0yLN0gBgtCyh9w2Y
 fSzBDa3iSa/t7Fu7CQ5yM/e4Tz0gCFmMNc4eczEY9Nd0MnUIaB2BcIFbK3GqDDWOC/EQ
 +fVY0Lm24w1dP98sbalitITWUn/8etAv108hNRXAOg/e6tlPA53Lde8an1WZesv9TxUh
 FTEx0C8xd2UPsq5TkjFoh3mv1hGLIhccrHM+rvRA4A3/tulmhUFaCmKa82J7Z0oHePot
 97F+6pyNNnQnWSYpTvAlMT2vjBI8PAq32jqWyU8u+n2usxaEtvXeNdzJ4Wi3bWfM1JRx
 L8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kgCDzON2LQ0I20HT7JO8ZVEI4np/E0DaLMXnfz3i4GE=;
 b=oZo/x4m8thKA4T7go7Vln/VAXQYiMguU3qDMpj26Jo7ANCDK2+4XeM2K0MKQ4nBUXW
 gS9k+XP9eXo0Q2BUfo4OaCH1poU/wPccaK7sFG9HxnfNXKFmyDIoDBTZPL3dzoZ8yr4Z
 GjGBr0SYIfIty6jO78rBV8qptB9BG1XLfY9FDkYyCdgvyI0bCzdg2CSL73Ky3knyzN8g
 GxBncl79zXh5IBFR3sZJsFRZmA7SR8+aOScWGqE+zwuFtfAx3dA97pe6HKEBHlCXG3kf
 bu0EO0zIHrNjx8nYhTSHH3mAIAfxSH2wSSNpYoqFdqduDVgT/jNTvm383G3hx+e1yKs0
 NoHQ==
X-Gm-Message-State: AOAM532DCCKFrEZw0dg1oJRJy7pxd3q8cHnVP3zUiYDA1ULKCRqbQBT9
 SWaHSxBg2qaZrb70sM78VkSsLHXA9iPaiiV0MDc=
X-Google-Smtp-Source: ABdhPJxexUIKMJXrucoug+LNQa5T+ojtNy+qPzeMwkirJhW3hSi5bzxgX3KFHSrO3FPq50K/B0WYcUis0+Z1tPRnsns=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr860880oti.23.1621277810147;
 Mon, 17 May 2021 11:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-17-andrey.grodzovsky@amd.com>
 <CADnq5_M-Sy3cF762044Ub9J=N_U6uQ2h2j40Y=fof04dXL5h7w@mail.gmail.com>
 <1882dd85-7ac6-8e54-b66d-fe09718d0262@amd.com>
In-Reply-To: <1882dd85-7ac6-8e54-b66d-fe09718d0262@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 May 2021 14:56:38 -0400
Message-ID: <CADnq5_N1EDO326hwG_3QKk9hsDwVZq1CqbEHgveN4pg6rF3zww@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] drm/amdgpu: Unmap all MMIO mappings
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

On Mon, May 17, 2021 at 2:46 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
>
>
> On 2021-05-17 1:43 p.m., Alex Deucher wrote:
> > On Wed, May 12, 2021 at 10:27 AM Andrey Grodzovsky
> > <andrey.grodzovsky@amd.com> wrote:
> >>
> >> Access to those must be prevented post pci_remove
> >>
> >> v6: Drop BOs list, unampping VRAM BAR is enough.
> >>
> >> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 +++++++++++++++++++---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  1 +
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ----
> >>   3 files changed, 22 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> index f7cca25c0fa0..73cbc3c7453f 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> @@ -3666,6 +3666,25 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> >>          return r;
> >>   }
> >>
> >> +static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
> >> +{
> >> +       /* Clear all CPU mappings pointing to this device */
> >> +       unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
> >> +
> >> +       /* Unmap all mapped bars - Doorbell, registers and VRAM */
> >> +       amdgpu_device_doorbell_fini(adev);
> >> +
> >> +       iounmap(adev->rmmio);
> >> +       adev->rmmio = NULL;
> >> +       if (adev->mman.aper_base_kaddr)
> >> +               iounmap(adev->mman.aper_base_kaddr);
> >> +       adev->mman.aper_base_kaddr = NULL;
> >> +
> >> +       /* Memory manager related */
> >
> > I think we need:
> > if (!adev->gmc.xgmi.connected_to_cpu) {
> > around these two to mirror amdgpu_bo_fini().
> >
> > Alex
>
> I am working of off drm-misc-next and here amdgpu_xgmi
> doesn't have connected_to_cpu yet.

Ah, right.  Ok.  Do we need to remove the code from bo_fini() if we
handle it here now?

Alex


>
> Andrey
>
> >
> >> +       arch_phys_wc_del(adev->gmc.vram_mtrr);
> >> +       arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
> >> +}
> >> +
> >>   /**
> >>    * amdgpu_device_fini - tear down the driver
> >>    *
> >> @@ -3712,6 +3731,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
> >>          amdgpu_device_ip_fini_early(adev);
> >>
> >>          amdgpu_gart_dummy_page_fini(adev);
> >> +
> >> +       amdgpu_device_unmap_mmio(adev);
> >>   }
> >>
> >>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> >> @@ -3739,9 +3760,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> >>          }
> >>          if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> >>                  vga_client_register(adev->pdev, NULL, NULL, NULL);
> >> -       iounmap(adev->rmmio);
> >> -       adev->rmmio = NULL;
> >> -       amdgpu_device_doorbell_fini(adev);
> >>
> >>          if (IS_ENABLED(CONFIG_PERF_EVENTS))
> >>                  amdgpu_pmu_fini(adev);
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> index 0adffcace326..882fb49f3c41 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> @@ -533,6 +533,7 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
> >>                  return -ENOMEM;
> >>          drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
> >>          INIT_LIST_HEAD(&bo->shadow_list);
> >> +
> >>          bo->vm_bo = NULL;
> >>          bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
> >>                  bp->domain;
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >> index 0d54e70278ca..58ad2fecc9e3 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >> @@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
> >>          amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
> >>          amdgpu_ttm_fw_reserve_vram_fini(adev);
> >>
> >> -       if (adev->mman.aper_base_kaddr)
> >> -               iounmap(adev->mman.aper_base_kaddr);
> >> -       adev->mman.aper_base_kaddr = NULL;
> >> -
> >>          amdgpu_vram_mgr_fini(adev);
> >>          amdgpu_gtt_mgr_fini(adev);
> >>          ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
> >> --
> >> 2.25.1
> >>
