Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7260660ECCB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 02:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696910E5DC;
	Thu, 27 Oct 2022 00:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC9110E5D1;
 Thu, 27 Oct 2022 00:01:43 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id ml12so12127505qvb.0;
 Wed, 26 Oct 2022 17:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkwZ9UxpN+5RxXBDncw8vjIe3FN4zBnz7PIpORGodgk=;
 b=L+ls/p56gxCBnUoTOXLMhaJrLQP4elffDyoQ0czc7jiwGsskA2eBQWdSdSM1RCM671
 LiE+oqHzfTVRkUrQFSYeMhm90/q/n82tfhhD9jz+q+3E0/SFtGUszLGtcY9MlU4C+oMZ
 +QOaK6TVd+urVYbx8XhY02d/hfQxktKdKfWA2ontJoaZP+pX+DgIe6BPuIkNSeTHczu6
 g+aJb9kkOKWzr7gPcL7Tb+V9UCdgKKKi2UstB1q6E5gsOZtL5AUny2DyazrfqKO1Ao5m
 StqvE8NBitzqh9EjfO5/+WvdpUGV30tqFHuLtOaMiwC2AW7MmH4EpfaM3MR7imTpv7If
 t1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZkwZ9UxpN+5RxXBDncw8vjIe3FN4zBnz7PIpORGodgk=;
 b=daq5hWRkqVvYoYaLN06antiX6a2ZnDYZrrvMqU1XaGMrmWwVwBQSdfbPDMe+Xfr3us
 MIb7WVx3rJ/fkyA1hF3E9+wbcS0WljmaSqN7HDZCpxz++/WPSJ295eGILRoGD6HD9I6O
 yuL/9vKNpbSAIL2jQhHfts3ZzuNYSacThOW65U1VpaIKTbm76hKMRCquDm6T2PfdhjTy
 jz8DqqCtdF6dQ8Cs+7q+pi5Pglv5uqP8odoEi+HqtdVBFkcdBKYcbJls3DOX4rLhcAQo
 rgnlwphjRZbBTr60TueuiLflscRnk56ZFZy6PSAGsy2BggSfFytmjTzy8itWjzJFCtTV
 blew==
X-Gm-Message-State: ACrzQf0HU8hWQuOyE/FIF3sYamZnf+lESMDjQiN8amUXFfyNulicvtwP
 peqTwWiOULnUXLzHycy4Yj9vJ6aE5XVUhd5wbKA=
X-Google-Smtp-Source: AMsMyM5X6/DItFtEw8gerGA8EOPWVc1cdntBBIEg6j5m/MxyYILJROR7Z0V2lBB7ubwrqBBfs2fFRB0gMWW3DN3WnLE=
X-Received: by 2002:a05:6214:21e9:b0:4bb:65c5:c989 with SMTP id
 p9-20020a05621421e900b004bb65c5c989mr18148818qvj.97.1666828902245; Wed, 26
 Oct 2022 17:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <Yz8rIxV7bVCcfZb0@kroah.com>
 <20221007013708.1946061-1-zyytlz.wz@163.com>
In-Reply-To: <20221007013708.1946061-1-zyytlz.wz@163.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 27 Oct 2022 10:01:29 +1000
Message-ID: <CAPM=9ty0+ouf+rQWhM=9XSKFOA2zxKfa00MsNBvwrQGPQm2uPQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
To: Zheng Wang <zyytlz.wz@163.com>
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
Cc: alex000young@gmail.com, security@kernel.org, airlied@linux.ie,
 gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 hackerzheng666@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 1002992920@qq.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Oct 2022 at 11:38, Zheng Wang <zyytlz.wz@163.com> wrote:
>
> If intel_gvt_dma_map_guest_page failed, it will call
> ppgtt_invalidate_spt, which will finally free the spt.
> But the caller does not notice that, it will free spt again in error path.
>
> Fix this by spliting invalidate and free in ppgtt_invalidate_spt.
> Only free spt when in good case.
>
> Reported-by: Zheng Wang <hackerzheng666@gmail.com>
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>

Has this landed in a tree yet, since it's a possible CVE, might be
good to merge it somewhere.

Dave.

> ---
> v3:
> - correct spelling mistake and remove unused variable suggested by Greg
>
> v2: https://lore.kernel.org/all/20221006165845.1735393-1-zyytlz.wz@163.com/
>
> v1: https://lore.kernel.org/all/20220928033340.1063949-1-zyytlz.wz@163.com/
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index ce0eb03709c3..865d33762e45 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -959,6 +959,7 @@ static inline int ppgtt_put_spt(struct intel_vgpu_ppgtt_spt *spt)
>         return atomic_dec_return(&spt->refcount);
>  }
>
> +static int ppgtt_invalidate_and_free_spt(struct intel_vgpu_ppgtt_spt *spt);
>  static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
>
>  static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
> @@ -995,7 +996,7 @@ static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
>                                 ops->get_pfn(e));
>                 return -ENXIO;
>         }
> -       return ppgtt_invalidate_spt(s);
> +       return ppgtt_invalidate_and_free_spt(s);
>  }
>
>  static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
> @@ -1016,18 +1017,30 @@ static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
>         intel_gvt_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
>  }
>
> -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
> +static int ppgtt_invalidate_and_free_spt(struct intel_vgpu_ppgtt_spt *spt)
>  {
> -       struct intel_vgpu *vgpu = spt->vgpu;
> -       struct intel_gvt_gtt_entry e;
> -       unsigned long index;
>         int ret;
>
>         trace_spt_change(spt->vgpu->id, "die", spt,
> -                       spt->guest_page.gfn, spt->shadow_page.type);
> -
> +               spt->guest_page.gfn, spt->shadow_page.type);
>         if (ppgtt_put_spt(spt) > 0)
>                 return 0;
> +       ret = ppgtt_invalidate_spt(spt);
> +       if (!ret) {
> +               trace_spt_change(spt->vgpu->id, "release", spt,
> +                        spt->guest_page.gfn, spt->shadow_page.type);
> +               ppgtt_free_spt(spt);
> +       }
> +
> +       return ret;
> +}
> +
> +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
> +{
> +       struct intel_vgpu *vgpu = spt->vgpu;
> +       struct intel_gvt_gtt_entry e;
> +       unsigned long index;
> +       int ret;
>
>         for_each_present_shadow_entry(spt, &e, index) {
>                 switch (e.type) {
> @@ -1059,9 +1072,6 @@ static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
>                 }
>         }
>
> -       trace_spt_change(spt->vgpu->id, "release", spt,
> -                        spt->guest_page.gfn, spt->shadow_page.type);
> -       ppgtt_free_spt(spt);
>         return 0;
>  fail:
>         gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
> @@ -1393,7 +1403,7 @@ static int ppgtt_handle_guest_entry_removal(struct intel_vgpu_ppgtt_spt *spt,
>                         ret = -ENXIO;
>                         goto fail;
>                 }
> -               ret = ppgtt_invalidate_spt(s);
> +               ret = ppgtt_invalidate_and_free_spt(s);
>                 if (ret)
>                         goto fail;
>         } else {
> --
> 2.25.1
>
