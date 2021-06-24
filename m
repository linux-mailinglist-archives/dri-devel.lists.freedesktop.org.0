Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D83B2653
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 06:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189106E9DF;
	Thu, 24 Jun 2021 04:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFE76E9E3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 04:28:34 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id y29so9610070qky.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 21:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vf6iRayWkpLOoYUf7pNtG+CaRTyVw0JAqulSitMDQO0=;
 b=XhlMv+xUBROxE3lM6Rw1CgXO1kddD8cgUoOHPx8CrrP4EyoU4DEd7SG1RL9I+0DYan
 boJUZwUYrjArp3SWtAGk9E+FeS6qz4WFyjdbkPcDaZ6Ojv9o8/zJPPYdzKO3qy5vBtEQ
 HXmGW25TeHi/8kTi8dJmCqS/q5sIDUcuof6X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vf6iRayWkpLOoYUf7pNtG+CaRTyVw0JAqulSitMDQO0=;
 b=aivli1G1N2GGPlBgKZd8V4bZmR7t24o+oedgF/7NPWtUvmAgnNYOZ+lJRV0hmiFL2h
 vlKThPBw5tMeWLolDPVcPi1dVTT48Trh2QrDSMz5r9syTtX7mYqgybDRV4JjTpu6Q0kA
 KQeyIABKEEYkeMjWh241hXKnD8NEr+vujluigWtyNMP1zE5c6srZi6b488FQ2j/2kftY
 jz8SJiJIXfO1YwReooK0yJpCL0Lx2/Lu1Xe/NxdQSlF4bJV9DgT9ttKNszWt7uVwuXFR
 tkSjWIGTHpxYjlFI840cjPldF9GiMby9ju8LBNGl7/FOCNCHJ/nBLtPD4EKqAE2wMeb6
 kLHQ==
X-Gm-Message-State: AOAM5329uSg0PDtBOimqk5A2v14st9/xDxuBmabxY6SACNLydXk/w9Dp
 l2G47yGha4uZaPByoGv7X3ADCOMvMeL5tiv3PYKvlQ==
X-Google-Smtp-Source: ABdhPJzN6yIAnrutP4mXY4YUqxFUME7cFcfwCCdv9KLoP/1Ux65U8D0qn4SKiYpFY+s6pSHfO29nSf+YvOucHrB1PFc=
X-Received: by 2002:a05:620a:1a87:: with SMTP id
 bl7mr3690332qkb.232.1624508913860; 
 Wed, 23 Jun 2021 21:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-7-stevensd@google.com>
In-Reply-To: <20210624035749.4054934-7-stevensd@google.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 24 Jun 2021 13:28:23 +0900
Message-ID: <CAD=HUj6C455sDhBUdQ_Kev=DPpdLRDDycumqfh8kjvredGh=hw@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/i915/gvt: use gfn_to_pfn's page instead of pfn
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>
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
Cc: David Stevens <stevensd@google.com>, intel-gvt-dev@lists.freedesktop.org,
 Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please ignore this last patch. It was put together as an afterthought
and wasn't properly tested.

-David

On Thu, Jun 24, 2021 at 12:59 PM David Stevens <stevensd@chromium.org> wrote:
>
> Return struct page instead of pfn from gfn_to_mfn. This function is only
> used to determine if the page is a transparent hugepage, to enable 2MB
> huge gtt shadowing. Returning the page directly avoids the risk of
> calling pfn_to_page on a VM_IO|VM_PFNMAP pfn.
>
> This change also properly releases the reference on the page returned by
> gfn_to_pfn.
>
> Signed-off-by: David Stevens <stevensd@google.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c       | 12 ++++++++----
>  drivers/gpu/drm/i915/gvt/hypercall.h |  3 ++-
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 12 ++++--------
>  drivers/gpu/drm/i915/gvt/mpt.h       |  8 ++++----
>  4 files changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index 9478c132d7b6..b2951c560582 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -1160,16 +1160,20 @@ static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
>         struct intel_gvt_gtt_entry *entry)
>  {
>         struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
> -       unsigned long pfn;
> +       struct page *page;
> +       bool is_trans_huge;
>
>         if (!HAS_PAGE_SIZES(vgpu->gvt->gt->i915, I915_GTT_PAGE_SIZE_2M))
>                 return 0;
>
> -       pfn = intel_gvt_hypervisor_gfn_to_mfn(vgpu, ops->get_pfn(entry));
> -       if (pfn == INTEL_GVT_INVALID_ADDR)
> +       page = intel_gvt_hypervisor_gfn_to_mfn_page(vgpu, ops->get_pfn(entry));
> +       if (!page)
>                 return -EINVAL;
>
> -       return PageTransHuge(pfn_to_page(pfn));
> +       is_trans_huge = PageTransHuge(page);
> +       put_page(page);
> +
> +       return is_trans_huge;
>  }
>
>  static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
> diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
> index b79da5124f83..017190ff52d5 100644
> --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> @@ -60,7 +60,8 @@ struct intel_gvt_mpt {
>                         unsigned long len);
>         int (*write_gpa)(unsigned long handle, unsigned long gpa, void *buf,
>                          unsigned long len);
> -       unsigned long (*gfn_to_mfn)(unsigned long handle, unsigned long gfn);
> +       struct page *(*gfn_to_mfn_page)(unsigned long handle,
> +                                       unsigned long gfn);
>
>         int (*dma_map_guest_page)(unsigned long handle, unsigned long gfn,
>                                   unsigned long size, dma_addr_t *dma_addr);
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index b829ff67e3d9..1e97ae813ed0 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1928,21 +1928,17 @@ static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
>         return -EFAULT;
>  }
>
> -static unsigned long kvmgt_gfn_to_pfn(unsigned long handle, unsigned long gfn)
> +static struct page *kvmgt_gfn_to_page(unsigned long handle, unsigned long gfn)
>  {
>         struct kvmgt_guest_info *info;
>         kvm_pfn_t pfn;
>
>         if (!handle_valid(handle))
> -               return INTEL_GVT_INVALID_ADDR;
> +               return NULL;
>
>         info = (struct kvmgt_guest_info *)handle;
>
> -       pfn = kvm_pfn_page_unwrap(gfn_to_pfn(info->kvm, gfn));
> -       if (is_error_noslot_pfn(pfn))
> -               return INTEL_GVT_INVALID_ADDR;
> -
> -       return pfn;
> +       return gfn_to_pfn(info->kvm, gfn).page;
>  }
>
>  static int kvmgt_dma_map_guest_page(unsigned long handle, unsigned long gfn,
> @@ -2112,7 +2108,7 @@ static const struct intel_gvt_mpt kvmgt_mpt = {
>         .disable_page_track = kvmgt_page_track_remove,
>         .read_gpa = kvmgt_read_gpa,
>         .write_gpa = kvmgt_write_gpa,
> -       .gfn_to_mfn = kvmgt_gfn_to_pfn,
> +       .gfn_to_mfn_page = kvmgt_gfn_to_page,
>         .dma_map_guest_page = kvmgt_dma_map_guest_page,
>         .dma_unmap_guest_page = kvmgt_dma_unmap_guest_page,
>         .dma_pin_guest_page = kvmgt_dma_pin_guest_page,
> diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
> index 550a456e936f..9169b83cf0f6 100644
> --- a/drivers/gpu/drm/i915/gvt/mpt.h
> +++ b/drivers/gpu/drm/i915/gvt/mpt.h
> @@ -214,17 +214,17 @@ static inline int intel_gvt_hypervisor_write_gpa(struct intel_vgpu *vgpu,
>  }
>
>  /**
> - * intel_gvt_hypervisor_gfn_to_mfn - translate a GFN to MFN
> + * intel_gvt_hypervisor_gfn_to_mfn_page - translate a GFN to MFN page
>   * @vgpu: a vGPU
>   * @gpfn: guest pfn
>   *
>   * Returns:
> - * MFN on success, INTEL_GVT_INVALID_ADDR if failed.
> + * struct page* on success, NULL if failed.
>   */
> -static inline unsigned long intel_gvt_hypervisor_gfn_to_mfn(
> +static inline unsigned long intel_gvt_hypervisor_gfn_to_mfn_page(
>                 struct intel_vgpu *vgpu, unsigned long gfn)
>  {
> -       return intel_gvt_host.mpt->gfn_to_mfn(vgpu->handle, gfn);
> +       return intel_gvt_host.mpt->gfn_to_mfn_page(vgpu->handle, gfn);
>  }
>
>  /**
> --
> 2.32.0.93.g670b81a890-goog
>
