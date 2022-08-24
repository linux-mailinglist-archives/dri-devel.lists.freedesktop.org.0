Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F35A01BB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94099C28C0;
	Wed, 24 Aug 2022 19:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13414C269B;
 Wed, 24 Aug 2022 19:01:55 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-11c896b879bso21998140fac.3; 
 Wed, 24 Aug 2022 12:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=BmUDAkEKs1QpgVs64aZzzQ45Z2VQd8OBs9xag8teZ5A=;
 b=hq301drIRDNXKLDjux5Dw7HOGWufL2ta4/DKG0n/S8UDdcDf8G6vX0gNBwWL4kfU4D
 l8aaI7AW8dcuYM77/3T9t/84xiLojrORAiIsE8vMyAe5brccsxj/rokbVEIROAMvx5Uc
 aaDqYj7esjRU9Yc6PA6fGDJ8V/qWKw/Umb9shFdTiap4MDV8s/BF3KqOJzKqR5sPRyh9
 /ZdCDk2yuadBFZqTh0lKHt6Q7K1IJ9I3NDH4MVLxIrSH9JPgTrCBqNr4nhIQqSbCGxrb
 BoRgPi11+3jOZPJU4Cmmg4ilmc19AAN/seMUEkemwVpvhg24ZxXAER5nPLrsDe6gtG49
 KF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=BmUDAkEKs1QpgVs64aZzzQ45Z2VQd8OBs9xag8teZ5A=;
 b=SBDnd5TF2c+NMQ4zguSI5kgIS8I52V9aQyms/KL+2wQAvJ20DvRKM9HnaZvJldORgC
 fxC+fORm71Z+kl/TyouymvDALclRy/nNRbolEBJbApLsQBOEQEOVdahi84oue7UZ2u9P
 bud8Rli978M7pKvBWDulVI5LoDoUjqxmaRWiDoE5aApXeDNU1mLF5j/+2irQmFG4ldFk
 IwtSuqyYXwIVEK1yT5mXQB/xmg0dcIet77NnVi4GW2NBG8I2QgZ3k0WHB7K/ZEHuRcUB
 a07PY9ax7q6JgX+/63MkK/RENEm938G+xutMXW505B0tAuU/1/xx/lswX0e+1xTxW6ua
 cTyw==
X-Gm-Message-State: ACgBeo14/cTF1YaWoupXxlIb4R6Y7xflAjBl0WY6QiKRRN9MkONxMZa9
 0XLhRMj+Lvvl/MemgcBIJ3Lw0PABNOjsVUOX8PK870a2
X-Google-Smtp-Source: AA6agR6utCAbb8FEE7KJ6XCRZJyWK6tahQl9cT49ap8xyT6ONQ04pMG8osXSVOG0kx+xHxkNzrDvp9mZYPzrJKAplBg=
X-Received: by 2002:a05:6870:b692:b0:11d:482f:3642 with SMTP id
 cy18-20020a056870b69200b0011d482f3642mr264476oab.38.1661367714607; Wed, 24
 Aug 2022 12:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220821181917.1188021-1-robdclark@gmail.com>
 <20220821181917.1188021-6-robdclark@gmail.com>
 <93ff00db-b5d0-350c-b192-e58b781bb1cf@quicinc.com>
In-Reply-To: <93ff00db-b5d0-350c-b192-e58b781bb1cf@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 24 Aug 2022 12:02:28 -0700
Message-ID: <CAF6AEGtBw5pgdpaF6F5sBJvn6Kief2jHnSbKXFJGZ_GeGVjafQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm: Skip tlbinv on unmap from non-current
 pgtables
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 10:46 AM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 8/21/2022 11:49 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > We can rely on the tlbinv done by CP_SMMU_TABLE_UPDATE in this case.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  6 ++++++
> >   drivers/gpu/drm/msm/msm_iommu.c       | 29 +++++++++++++++++++++++++++
> >   2 files changed, 35 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index c8ad8aeca777..1ba0ed629549 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1180,6 +1180,12 @@ static int hw_init(struct msm_gpu *gpu)
> >       /* Always come up on rb 0 */
> >       a6xx_gpu->cur_ring = gpu->rb[0];
> >
> > +     /*
> > +      * Note, we cannot assume anything about the state of the SMMU when
> > +      * coming back from power collapse, so force a CP_SMMU_TABLE_UPDATE
> > +      * on the first submit.  Also, msm_iommu_pagetable_unmap() relies on
> > +      * this behavior.
> > +      */
> >       gpu->cur_ctx_seqno = 0;
> >
> >       /* Enable the SQE_to start the CP engine */
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index 94c8c09980d1..218074a58081 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -45,8 +45,37 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
> >               size -= 4096;
> >       }
> >
> > +     /*
> > +      * A CP_SMMU_TABLE_UPDATE is always sent for the first
> > +      * submit after resume, and that does a TLB invalidate.
> > +      * So we can skip that if the device is not currently
> > +      * powered.
> > +      */
> > +     if (!pm_runtime_get_if_in_use(pagetable->parent->dev))
> > +             goto out;
> > +
> > +     /*
> > +      * If we are not the current pgtables, we can rely on the
> > +      * TLB invalidate done by CP_SMMU_TABLE_UPDATE.
> > +      *
> > +      * We'll always be racing with the GPU updating ttbr0,
> > +      * but there are only two cases:
> > +      *
> > +      *  + either we are not the the current pgtables and there
> > +      *    will be a tlbinv done by the GPU before we are again
> > +      *
> > +      *  + or we are.. there might have already been a tblinv
> > +      *    if we raced with the GPU, but we have to assume the
> > +      *    worse and do the tlbinv
> > +      */
> > +     if (adreno_smmu->get_ttbr0(adreno_smmu->cookie) != pagetable->ttbr)
> > +             goto out_put;
> > +
> >       adreno_smmu->tlb_inv_by_id(adreno_smmu->cookie, pagetable->asid);
> >
> > +out_put:
> > +     pm_runtime_put(pagetable->parent->dev);
> > +out:
> >       return (unmapped == size) ? 0 : -EINVAL;
> >   }
> >
> Asking because it is a *security issue* if we get this wrong:
> 1. Is there any measure benefit with this patch? I believe tlb
> invalidation doesn't contribute much to the unmap latency.

It turned out to not make a huge difference.. although I expect the
part about skipping the inv when runtime suspended is still useful
from a power standpoint (but don't have a great setup to measure that)

BR,
-R

> 2. We at least should insert a full memory barrier before reading the
> ttbr0 register to ensure that everything we did prior to that is visible
> to smmu. But then I guess the cost of the full barrier would be similar
> to the tlb invalidation.
>
> Because it could lead to security issues or other very hard to debug
> issues, I would prefer this optimization only if there is a significant
> measurable gain.
>
> -Akhil.
>
