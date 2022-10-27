Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0969B60FC42
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EEA10E690;
	Thu, 27 Oct 2022 15:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB8C10E68B;
 Thu, 27 Oct 2022 15:48:03 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 d26-20020a05683018fa00b0066ab705617aso1200438otf.13; 
 Thu, 27 Oct 2022 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p96kBp25Ov/A/GjRgGCFDB+r52v32bcWFjBJuIPS5/s=;
 b=DGKA42Vc3qJ4zBFnWeJZF64ZS+FQFFuIPXB/YtKubVZ55XwZEVC312RLNqVbPMdqNT
 yHIkp9SMZM78IJ9WzcETgUK57nTZDsiOG9oWI8jL1iwQ7GDKMwfswNGa+snhFWjnTmJi
 4miUqoCEWGs9zXLFwTh5Av7jIugypdd5umZUQxyvK2ie9HAV1VlpwyUXpmO36OjKJdt6
 ExrQPT4R+uLP8e8ATi+3wx7IsBHs5Vh2dV3sCMA4DtaZQX2iacxOtM0URbP++VbYUGNC
 Ij/od7SWtoacvCgEV1LjQkK9lkdHSLnOUV2ofZr5/HbRgysnH5AgAdeyg/uMJva6Yrn8
 SXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p96kBp25Ov/A/GjRgGCFDB+r52v32bcWFjBJuIPS5/s=;
 b=PfNrk58y1paXNCA7O6Zebgw8EaFrthCMA6GDuJTLv+BQPQEZVC0jkfRoMbnrXZa0qe
 42nT9V/rYz3WpuW7hn17M7GJqw0fpuH84YQFtbVZJJ/ua+Fvt67iVepZmgHf1l3nPv0p
 +DgeGLwJu2M7Ws2nrwFH/K2e9Y9phIz3CplMhdHwhcyyRXTDKBaUAWMUJA8BOiHcghNl
 K+leyqydTor/3wKXgZvyiANpEL1uuhN/gL73MD7rp6JkC9enD2+rh2N416tBkcV+FxcY
 n96wzmZ2uYgtLnCBIWEQfeTip3c+SaiLZjVDBUtAR1t56RcOtEreO3PJ45TImb8H8UTo
 V9eQ==
X-Gm-Message-State: ACrzQf1HHvSItc6GEBKlciDanyr/GqGr1DDVQrqSTbqpVqs429/nd7Y5
 gcAMCQ/Yqoodz6Yy2GSuMpik4r2OHCQoi/hybMg=
X-Google-Smtp-Source: AMsMyM68Yu1S1ltSY/TkOf+T4xzorANP5Q3jHWA0km5D4/FU7FNAFn464o1T8QQC1eMbaU9lvdOgVgmcmULJJ4552Hs=
X-Received: by 2002:a05:6830:2644:b0:661:e80b:bd4b with SMTP id
 f4-20020a056830264400b00661e80bbd4bmr24548087otu.22.1666885682498; Thu, 27
 Oct 2022 08:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221025200357.3637161-1-dmitry.baryshkov@linaro.org>
 <20221025200357.3637161-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221025200357.3637161-2-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 27 Oct 2022 08:48:12 -0700
Message-ID: <CAF6AEGvhJzpX1sJ1+SE_FA0eL=XEyDKnvyLz_Q15-eJvvL65PQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm: move domain allocation into
 msm_iommu_new()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 1:04 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> After the msm_iommu instance is created, the IOMMU domain is completely
> handled inside the msm_iommu code. Move the iommu_domain_alloc() call
> into the msm_iommu_new() to simplify callers code.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 12 +++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 25 +++++++++---------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 25 +++++++++---------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  2 --
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 +++++++++---------
>  drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++++---------
>  drivers/gpu/drm/msm/msm_iommu.c          | 20 ++++++++++++++++---
>  drivers/gpu/drm/msm/msm_mmu.h            |  3 ++-
>  8 files changed, 60 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index e033d6a67a20..6484b97c5344 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1213,19 +1213,17 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
>
>  static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>  {
> -       struct iommu_domain *domain;
>         struct msm_mmu *mmu;
>
> -       domain = iommu_domain_alloc(&platform_bus_type);
> -       if (!domain)
> +       mmu = msm_iommu_new(gmu->dev, 0);
> +       if (!mmu)
>                 return -ENODEV;
> +       if (IS_ERR(mmu))
> +               return PTR_ERR(mmu);
>
> -       mmu = msm_iommu_new(gmu->dev, domain);
>         gmu->aspace = msm_gem_address_space_create(mmu, "gmu", 0x0, 0x80000000);
> -       if (IS_ERR(gmu->aspace)) {
> -               iommu_domain_free(domain);
> +       if (IS_ERR(gmu->aspace))
>                 return PTR_ERR(gmu->aspace);
> -       }
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index fdc578016e0b..7a1b4397b842 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1784,37 +1784,30 @@ static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  static struct msm_gem_address_space *
>  a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>  {
> -       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -       struct iommu_domain *iommu;
>         struct msm_mmu *mmu;
>         struct msm_gem_address_space *aspace;
> +       struct iommu_domain_geometry *geometry;
>         u64 start, size;
>
> -       iommu = iommu_domain_alloc(&platform_bus_type);
> -       if (!iommu)
> -               return NULL;
> -
>         /*
>          * This allows GPU to set the bus attributes required to use system
>          * cache on behalf of the iommu page table walker.
>          */
> -       if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> -               adreno_set_llc_attributes(iommu);
> -
> -       mmu = msm_iommu_new(&pdev->dev, iommu);
> -       if (IS_ERR(mmu)) {
> -               iommu_domain_free(iommu);
> +       mmu = msm_iommu_new(&pdev->dev, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);

I think/assume the quirk still needs to be conditional on
a6xx_gpu->htw_llc_slice.. or at least I'm not sure what happens if we
set it but do not have an LLCC (or allocated slice)

BR,
-R

> +       if (IS_ERR_OR_NULL(mmu))
>                 return ERR_CAST(mmu);
> -       }
> +
> +       geometry = msm_iommu_get_geometry(mmu);
> +       if (IS_ERR(geometry))
> +               return ERR_CAST(geometry);
>
>         /*
>          * Use the aperture start or SZ_16M, whichever is greater. This will
>          * ensure that we align with the allocated pagetable range while still
>          * allowing room in the lower 32 bits for GMEM and whatnot
>          */
> -       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> -       size = iommu->geometry.aperture_end - start + 1;
> +       start = max_t(u64, SZ_16M, geometry->aperture_start);
> +       size = geometry->aperture_end - start + 1;
>
>         aspace = msm_gem_address_space_create(mmu, "gpu",
>                 start & GENMASK_ULL(48, 0), size);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 382fb7f9e497..5808911899c7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -191,37 +191,30 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>         return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>
> -void adreno_set_llc_attributes(struct iommu_domain *iommu)
> -{
> -       iommu_set_pgtable_quirks(iommu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
> -}
> -
>  struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>                 struct platform_device *pdev)
>  {
> -       struct iommu_domain *iommu;
>         struct msm_mmu *mmu;
>         struct msm_gem_address_space *aspace;
> +       struct iommu_domain_geometry *geometry;
>         u64 start, size;
>
> -       iommu = iommu_domain_alloc(&platform_bus_type);
> -       if (!iommu)
> -               return NULL;
> -
> -       mmu = msm_iommu_new(&pdev->dev, iommu);
> -       if (IS_ERR(mmu)) {
> -               iommu_domain_free(iommu);
> +       mmu = msm_iommu_new(&pdev->dev, 0);
> +       if (IS_ERR_OR_NULL(mmu))
>                 return ERR_CAST(mmu);
> -       }
> +
> +       geometry = msm_iommu_get_geometry(mmu);
> +       if (IS_ERR(geometry))
> +               return ERR_CAST(geometry);
>
>         /*
>          * Use the aperture start or SZ_16M, whichever is greater. This will
>          * ensure that we align with the allocated pagetable range while still
>          * allowing room in the lower 32 bits for GMEM and whatnot
>          */
> -       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> -       size = iommu->geometry.aperture_end - start + 1;
> +       start = max_t(u64, SZ_16M, geometry->aperture_start);
> +       size = geometry->aperture_end - start + 1;
>
>         aspace = msm_gem_address_space_create(mmu, "gpu",
>                 start & GENMASK_ULL(48, 0), size);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e7adc5c632d0..707273339969 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -338,8 +338,6 @@ struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>                 struct platform_device *pdev);
>
> -void adreno_set_llc_attributes(struct iommu_domain *iommu);
> -
>  int adreno_read_speedbin(struct device *dev, u32 *speedbin);
>
>  /*
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 964573d26d26..9a1a0769575d 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -387,7 +387,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>         struct msm_drm_private *priv = dev->dev_private;
>         struct mdp4_kms *mdp4_kms;
>         struct msm_kms *kms = NULL;
> -       struct iommu_domain *iommu;
> +       struct msm_mmu *mmu;
>         struct msm_gem_address_space *aspace;
>         int irq, ret;
>         u32 major, minor;
> @@ -499,10 +499,15 @@ static int mdp4_kms_init(struct drm_device *dev)
>         mdp4_disable(mdp4_kms);
>         mdelay(16);
>
> -       iommu = iommu_domain_alloc(pdev->dev.bus);
> -       if (iommu) {
> -               struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
> -
> +       mmu = msm_iommu_new(&pdev->dev, 0);
> +       if (IS_ERR(mmu)) {
> +               ret = PTR_ERR(mmu);
> +               goto fail;
> +       } else if (!mmu) {
> +               DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
> +                               "contig buffers for scanout\n");
> +               aspace = NULL;
> +       } else {
>                 aspace  = msm_gem_address_space_create(mmu,
>                         "mdp4", 0x1000, 0x100000000 - 0x1000);
>
> @@ -514,10 +519,6 @@ static int mdp4_kms_init(struct drm_device *dev)
>                 }
>
>                 kms->aspace = aspace;
> -       } else {
> -               DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
> -                               "contig buffers for scanout\n");
> -               aspace = NULL;
>         }
>
>         ret = modeset_init(mdp4_kms);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 28034c21f6bc..be32b4460e94 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -276,7 +276,6 @@ static int msm_drm_uninit(struct device *dev)
>
>  struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>  {
> -       struct iommu_domain *domain;
>         struct msm_gem_address_space *aspace;
>         struct msm_mmu *mmu;
>         struct device *mdp_dev = dev->dev;
> @@ -292,22 +291,21 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>         else
>                 iommu_dev = mdss_dev;
>
> -       domain = iommu_domain_alloc(iommu_dev->bus);
> -       if (!domain) {
> +       mmu = msm_iommu_new(iommu_dev, 0);
> +       if (IS_ERR(mmu))
> +               return ERR_CAST(mmu);
> +
> +       if (!mmu) {
>                 drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
>                 return NULL;
>         }
>
> -       mmu = msm_iommu_new(iommu_dev, domain);
> -       if (IS_ERR(mmu)) {
> -               iommu_domain_free(domain);
> -               return ERR_CAST(mmu);
> -       }
> -
>         aspace = msm_gem_address_space_create(mmu, "mdp_kms",
>                 0x1000, 0x100000000 - 0x1000);
> -       if (IS_ERR(aspace))
> +       if (IS_ERR(aspace)) {
> +               dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
>                 mmu->funcs->destroy(mmu);
> +       }
>
>         return aspace;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 5577cea7c009..c2507582ecf3 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -186,6 +186,13 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
>         return 0;
>  }
>
> +struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu)
> +{
> +       struct msm_iommu *iommu = to_msm_iommu(mmu);
> +
> +       return &iommu->domain->geometry;
> +}
> +
>  static const struct msm_mmu_funcs pagetable_funcs = {
>                 .map = msm_iommu_pagetable_map,
>                 .unmap = msm_iommu_pagetable_unmap,
> @@ -367,17 +374,23 @@ static const struct msm_mmu_funcs funcs = {
>                 .resume_translation = msm_iommu_resume_translation,
>  };
>
> -struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
> +struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
>  {
> +       struct iommu_domain *domain;
>         struct msm_iommu *iommu;
>         int ret;
>
> +       domain = iommu_domain_alloc(dev->bus);
>         if (!domain)
> -               return ERR_PTR(-ENODEV);
> +               return NULL;
> +
> +       iommu_set_pgtable_quirks(domain, quirks);
>
>         iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
> -       if (!iommu)
> +       if (!iommu) {
> +               iommu_domain_free(domain);
>                 return ERR_PTR(-ENOMEM);
> +       }
>
>         iommu->domain = domain;
>         msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
> @@ -386,6 +399,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>
>         ret = iommu_attach_device(iommu->domain, dev);
>         if (ret) {
> +               iommu_domain_free(domain);
>                 kfree(iommu);
>                 return ERR_PTR(ret);
>         }
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index de158e1bf765..74cd81e701ff 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -40,7 +40,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
>         mmu->type = type;
>  }
>
> -struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
> +struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
>  struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
>
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
> @@ -58,5 +58,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>
>  int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
>                 int *asid);
> +struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
>
>  #endif /* __MSM_MMU_H__ */
> --
> 2.35.1
>
