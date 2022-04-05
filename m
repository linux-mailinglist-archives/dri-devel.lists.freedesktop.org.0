Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA874F31B0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 14:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A9B10E368;
	Tue,  5 Apr 2022 12:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD3F10E204
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 12:45:45 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id z8so13257780oix.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fSK3wIYPs6n2qINN5nYJyesIheSwIleocBs/dygaiJE=;
 b=ACdRCLSmKpUtw35Tc4y+nSENPlkL0E9NHuydD7LGFe8x6l8JK8oekrHOG6mSNLcRVP
 4dW0OXuEOg0YmO08BTm/yk7r2EqFJWkN9Qx/npGGVWhcqmb6FFMmMki3k1pL3KXBLVzk
 pdigfIkwOUryUNFldHYP8CLO0QCnVG9GJdD6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fSK3wIYPs6n2qINN5nYJyesIheSwIleocBs/dygaiJE=;
 b=AWt/NRyqmSEK3X+ows7EmfWdXMLww5e7DqZCd6HkWZu74DSPHabTG+4e+eIQWycJ7a
 5/x7hMXDWeZwD7C3fDCtpI8298FBmiXIY3+XTV6sJ1VZvfwKZ4tg6DG3m5BLWb9NRIN+
 3zCGiQyeHiUNR936Bpke5/Ld+x/xeB9QVDKIEsLvWq9UzEvvpT0jeq3Xu//WoQOMb+qc
 MDc5uSIpDlGs/byp3JT16IB72sRDXt0NpHWPLqZirKGGo+kLs91cE3IJ9cCAyAO/P3gQ
 KALI6sTFNISeDvWbfDdHNLprcpPQo93QElBN8bHNfO7AAF8AIH7btjdOS7phXrBNQuaA
 t5MA==
X-Gm-Message-State: AOAM531WwNQfn+c6ccF2M8g9WZze6CfjpYs6mq6kMQQXyZOacecHzRdX
 ZuZYO0Znccffr1X/fBLmMUmDtExJvRXJAjEH6lE4PA==
X-Google-Smtp-Source: ABdhPJyysM4DwOW6eEQYtrl8MIp7wJLwTUVMZicOb09i4aAnEyLxUHqi97Rk2dCm80rArKrRA53EJAnzE7Az1Qqynng=
X-Received: by 2002:a05:6808:1596:b0:2f7:5d89:eec7 with SMTP id
 t22-20020a056808159600b002f75d89eec7mr1343391oiw.228.1649162743867; Tue, 05
 Apr 2022 05:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220405105944.336896-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220405105944.336896-1-thomas.hellstrom@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 5 Apr 2022 14:45:32 +0200
Message-ID: <CAKMK7uGQVxBnjQn=oJOfLuzpTE_FtVAho1bvNo0tSjeh03TPYA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Improve on suspend / resume time
 with VT-d enabled
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Apr 2022 at 13:00, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> When DMAR / VT-d is enabled, the display engine uses overfetching,
> presumably to deal with the increased latency. To avoid display engine
> errors and DMAR faults, as a workaround the GGTT is populated with scatch
> PTEs when VT-d is enabled. However starting with gen10, Write-combined
> writing of scratch PTES is no longer possible and as a result, populating
> the full GGTT with scratch PTEs like on resume becomes very slow as
> uncached access is needed.
>
> Therefore, on integrated GPUs utilize the fact that the PTEs are stored i=
n
> stolen memory which retain content across S3 suspend. Don't clear the PTE=
s
> on suspend and resume. This improves on resume time with around 100 ms.
> While 100+ms might appear like a short time it's 10% to 20% of total resu=
me
> time and important in some applications.
>
> One notable exception is Intel Rapid Start Technology which may cause
> stolen memory to be lost across what the OS percieves as S3 suspend.
> If IRST is enabled or if we can't detect whether IRST is enabled, retain
> the old workaround, clearing and re-instating PTEs.
>
> As an additional measure, if we detect that the last ggtt pte was lost
> during suspend, print a warning and re-populate the GGTT ptes
>
> On discrete GPUs, the display engine scans out from LMEM which isn't
> subject to DMAR, and presumably the workaround is therefore not needed,
> but that needs to be verified and disabling the workaround for dGPU,
> if possible, will be deferred to a follow-up patch.
>
> v2:
> - Rely on retained ptes to also speed up suspend and resume re-binding.
> - Re-build GGTT ptes if Intel rst is enabled.
> v3:
> - Re-build GGTT ptes also if we can't detect whether Intel rst is enabled=
,
>   and if the guard page PTE and end of GGTT was lost.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

It's not great, but I think it's better than building another
complication into our allocator just to handle this all.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c | 56 +++++++++++++++++++++++++---
>  drivers/gpu/drm/i915/gt/intel_gtt.h  | 20 ++++++++++
>  drivers/gpu/drm/i915/i915_driver.c   | 16 ++++++++
>  3 files changed, 86 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/=
gt/intel_ggtt.c
> index 04191fe2ee34..98441b1c1b75 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -23,6 +23,13 @@
>  #include "intel_gtt.h"
>  #include "gen8_ppgtt.h"
>
> +static inline bool suspend_retains_ptes(struct i915_address_space *vm)
> +{
> +       return GRAPHICS_VER(vm->i915) >=3D 8 &&
> +               !HAS_LMEM(vm->i915) &&
> +               vm->is_ggtt;
> +}
> +
>  static void i915_ggtt_color_adjust(const struct drm_mm_node *node,
>                                    unsigned long color,
>                                    u64 *start,
> @@ -116,6 +123,23 @@ static bool needs_idle_maps(struct drm_i915_private =
*i915)
>         return false;
>  }
>
> +/*
> + * Return the value of the last GGTT pte cast to an u64, if
> + * the system is supposed to retain ptes across resume. 0 otherwise.
> + */
> +static u64 read_last_pte(struct i915_address_space *vm)
> +{
> +       struct i915_ggtt *ggtt =3D i915_vm_to_ggtt(vm);
> +       gen8_pte_t __iomem *ptep;
> +
> +       if (!suspend_retains_ptes(vm))
> +               return 0;
> +
> +       GEM_BUG_ON(GRAPHICS_VER(vm->i915) < 8);
> +       ptep =3D (typeof(ptep))ggtt->gsm + (ggtt_total_entries(ggtt) - 1)=
;
> +       return readq(ptep);
> +}
> +
>  /**
>   * i915_ggtt_suspend_vm - Suspend the memory mappings for a GGTT or DPT =
VM
>   * @vm: The VM to suspend the mappings for
> @@ -179,7 +203,10 @@ void i915_ggtt_suspend_vm(struct i915_address_space =
*vm)
>                 i915_gem_object_unlock(obj);
>         }
>
> -       vm->clear_range(vm, 0, vm->total);
> +       if (!suspend_retains_ptes(vm))
> +               vm->clear_range(vm, 0, vm->total);
> +       else
> +               i915_vm_to_ggtt(vm)->probed_pte =3D read_last_pte(vm);
>
>         vm->skip_pte_rewrite =3D save_skip_rewrite;
>
> @@ -578,6 +605,8 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>         struct drm_mm_node *entry;
>         int ret;
>
> +       ggtt->pte_lost =3D true;
> +
>         /*
>          * GuC requires all resources that we're sharing with it to be pl=
aced in
>          * non-WOPCM memory. If GuC is not present or not in use we still=
 need a
> @@ -1309,11 +1338,20 @@ bool i915_ggtt_resume_vm(struct i915_address_spac=
e *vm)
>  {
>         struct i915_vma *vma;
>         bool write_domain_objs =3D false;
> +       bool retained_ptes;
>
>         drm_WARN_ON(&vm->i915->drm, !vm->is_ggtt && !vm->is_dpt);
>
> -       /* First fill our portion of the GTT with scratch pages */
> -       vm->clear_range(vm, 0, vm->total);
> +       /*
> +        * First fill our portion of the GTT with scratch pages if
> +        * they were not retained across suspend.
> +        */
> +       retained_ptes =3D suspend_retains_ptes(vm) &&
> +               !i915_vm_to_ggtt(vm)->pte_lost &&
> +               !GEM_WARN_ON(i915_vm_to_ggtt(vm)->probed_pte !=3D read_la=
st_pte(vm));
> +
> +       if (!retained_ptes)
> +               vm->clear_range(vm, 0, vm->total);
>
>         /* clflush objects bound into the GGTT and rebind them. */
>         list_for_each_entry(vma, &vm->bound_list, vm_link) {
> @@ -1322,9 +1360,10 @@ bool i915_ggtt_resume_vm(struct i915_address_space=
 *vm)
>                         atomic_read(&vma->flags) & I915_VMA_BIND_MASK;
>
>                 GEM_BUG_ON(!was_bound);
> -               vma->ops->bind_vma(vm, NULL, vma->resource,
> -                                  obj ? obj->cache_level : 0,
> -                                  was_bound);
> +               if (!retained_ptes)
> +                       vma->ops->bind_vma(vm, NULL, vma->resource,
> +                                          obj ? obj->cache_level : 0,
> +                                          was_bound);
>                 if (obj) { /* only used during resume =3D> exclusive acce=
ss */
>                         write_domain_objs |=3D fetch_and_zero(&obj->write=
_domain);
>                         obj->read_domains |=3D I915_GEM_DOMAIN_GTT;
> @@ -1352,3 +1391,8 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>
>         intel_ggtt_restore_fences(ggtt);
>  }
> +
> +void i915_ggtt_mark_pte_lost(struct drm_i915_private *i915, bool val)
> +{
> +       to_gt(i915)->ggtt->pte_lost =3D val;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/g=
t/intel_gtt.h
> index 4529b5e9f6e6..7561672c4f17 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -345,6 +345,15 @@ struct i915_ggtt {
>
>         bool do_idle_maps;
>
> +       /**
> +        * Whether the system was recently restored from hibernate and
> +        * thus may have lost pte content.
> +        */
> +       bool pte_lost;
> +
> +       /** Probed pte value on suspend. Re-checked on resume. */
> +       u64 probed_pte;
> +
>         int mtrr;
>
>         /** Bit 6 swizzling required for X tiling */
> @@ -571,6 +580,17 @@ bool i915_ggtt_resume_vm(struct i915_address_space *=
vm);
>  void i915_ggtt_suspend(struct i915_ggtt *gtt);
>  void i915_ggtt_resume(struct i915_ggtt *ggtt);
>
> +/**
> + * i915_ggtt_mark_pte_lost - Mark ggtt ptes as lost or clear such a mark=
ing
> + * @i915 The device private.
> + * @val whether the ptes should be marked as lost.
> + *
> + * In some cases pte content is retained across suspend, but typically l=
ost
> + * across hibernate. Typically they should be marked as lost on
> + * hibernation restore and such marking cleared on suspend.
> + */
> +void i915_ggtt_mark_pte_lost(struct drm_i915_private *i915, bool val);
> +
>  void
>  fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int=
 count);
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 64e6f76861f9..f50256e4c2d2 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -98,6 +98,9 @@
>  #include "intel_region_ttm.h"
>  #include "vlv_suspend.h"
>
> +/* Intel Rapid Start Technology ACPI device name */
> +static const char irst_name[] =3D "INT3392";
> +
>  static const struct drm_driver i915_drm_driver;
>
>  static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
> @@ -1425,6 +1428,8 @@ static int i915_pm_suspend(struct device *kdev)
>                 return -ENODEV;
>         }
>
> +       i915_ggtt_mark_pte_lost(i915, false);
> +
>         if (i915->drm.switch_power_state =3D=3D DRM_SWITCH_POWER_OFF)
>                 return 0;
>
> @@ -1477,6 +1482,14 @@ static int i915_pm_resume(struct device *kdev)
>         if (i915->drm.switch_power_state =3D=3D DRM_SWITCH_POWER_OFF)
>                 return 0;
>
> +       /*
> +        * If IRST is enabled, or if we can't detect whether it's enabled=
,
> +        * then we must assume we lost the GGTT page table entries, since
> +        * they are not retained if IRST decided to enter S4.
> +        */
> +       if (!IS_ENABLED(CONFIG_ACPI) || acpi_dev_present(irst_name, NULL,=
 -1))
> +               i915_ggtt_mark_pte_lost(i915, true);
> +
>         return i915_drm_resume(&i915->drm);
>  }
>
> @@ -1536,6 +1549,9 @@ static int i915_pm_restore_early(struct device *kde=
v)
>
>  static int i915_pm_restore(struct device *kdev)
>  {
> +       struct drm_i915_private *i915 =3D kdev_to_i915(kdev);
> +
> +       i915_ggtt_mark_pte_lost(i915, true);
>         return i915_pm_resume(kdev);
>  }
>
> --
> 2.34.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
