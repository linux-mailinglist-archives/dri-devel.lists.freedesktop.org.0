Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC27C1F7C6E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 19:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDF46EA1A;
	Fri, 12 Jun 2020 17:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4622F6EA17
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 17:22:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591982525; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=fWknkGYfbRq73n5akkvEQmXOR+Mhuj3iaaByL0gFj24=;
 b=gZ+mA8Cr9EUqJmllHZXN4r1v8QLylYrMG/WL/ltVZIW6ft7gWhN93bclWj6COFykgconkmmv
 PHjoNs0xRn/VDqLPkmcg0w5rq/7e2HuTBozIw5Oj+QWvLGgAJr07wMMMcdiUl3s2GptWc664
 b6bRpvBmebaHVbqz0m3rGzPcA2g=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5ee3b9b6bfb34e631c88d383 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 17:21:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 22C9FC433C8; Fri, 12 Jun 2020 17:21:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D60C1C43391;
 Fri, 12 Jun 2020 17:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D60C1C43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 12 Jun 2020 11:21:51 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 6/6] drm/msm/a6xx: Add support for per-instance pagetables
Message-ID: <20200612172151.GA12783@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>, 
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>,
 Sharat Masetty <smasetty@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200611222921.464-1-jcrouse@codeaurora.org>
 <20200611222921.464-7-jcrouse@codeaurora.org>
 <CAF6AEGuyqgYKZsnBPCii4W=jxPcFU7JYKn4NBd8JVq7Pt1kR_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGuyqgYKZsnBPCii4W=jxPcFU7JYKn4NBd8JVq7Pt1kR_Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 08:22:29PM -0700, Rob Clark wrote:
> On Thu, Jun 11, 2020 at 3:29 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > Add support for using per-instance pagetables if all the dependencies are
> > available.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 69 ++++++++++++++++++++++++++-
> >  drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
> >  2 files changed, 69 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index a1589e040c57..5e82b85d4d55 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -79,6 +79,58 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
> >         OUT_RING(ring, upper_32_bits(iova));
> >  }
> >
> > +static void a6xx_set_pagetable(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> > +               struct msm_file_private *ctx)
> > +{
> > +       phys_addr_t ttbr;
> > +       u32 asid;
> > +
> > +       if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> > +               return;
> > +
> > +       OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> > +       OUT_RING(ring, 0);
> > +
> > +       /* Turn on APIV mode to access critical regions */
> > +       OUT_PKT4(ring, REG_A6XX_CP_MISC_CNTL, 1);
> > +       OUT_RING(ring, 1);
> > +
> > +       /* Make sure the ME is synchronized before staring the update */
> > +       OUT_PKT7(ring, CP_WAIT_FOR_ME, 0);
> > +
> > +       /* Execute the table update */
> > +       OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
> > +       OUT_RING(ring, lower_32_bits(ttbr));
> > +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> > +       /* CONTEXTIDR is currently unused */
> > +       OUT_RING(ring, 0);
> > +       /* CONTEXTBANK is currently unused */
> > +       OUT_RING(ring, 0);
> 
> I can add this to xml (on userspace side, we've been describing packet
> payload in xml and using the generated builders), and update generated
> headers, if you agree to not add more open-coded pkt7 building ;-)

But open coding opcode is so much fun! :)  Its fine to put this in the XML. It
can only be executed from the ringbuffer FWIW.

> > +
> > +       /*
> > +        * Write the new TTBR0 to the memstore. This is good for debugging.
> > +        */
> > +       OUT_PKT7(ring, CP_MEM_WRITE, 4);
> > +       OUT_RING(ring, lower_32_bits(rbmemptr(ring, ttbr0)));
> > +       OUT_RING(ring, upper_32_bits(rbmemptr(ring, ttbr0)));
> > +       OUT_RING(ring, lower_32_bits(ttbr));
> > +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> > +
> > +       /* Invalidate the draw state so we start off fresh */
> > +       OUT_PKT7(ring, CP_SET_DRAW_STATE, 3);
> > +       OUT_RING(ring, 0x40000);
> > +       OUT_RING(ring, 1);
> > +       OUT_RING(ring, 0);
> 
> Ie, this would look like:
> 
>     OUT_PKT7(ring, CP_SET_DRAW_STATE, 3);
>     OUT_RING(ring, CP_SET_DRAW_STATE__0_COUNT(0) |
>             CP_SET_DRAW_STATE__0_DISABLE_ALL_GROUPS |
>             CP_SET_DRAW_STATE__0_GROUP_ID(0));
>     OUT_RING(ring, CP_SET_DRAW_STATE__1_ADDR_LO(1));
>     OUT_RING(ring, CP_SET_DRAW_STATE__2_ADDR_HI(0));
> 
> .. but written that way, I think you meant ADDR_LO to be zero?
> 
> (it is possible we need to regen headers for that to work, the kernel
> headers are somewhat out of date by now)

As we discussed on IRC this bit isn't needed because the CP_SMMU_TABLE_UPDATE
handles it for us.  I'll remove that.

> BR,
> -R

Jordan

> > +
> > +       /* Turn off APRIV */
> > +       OUT_PKT4(ring, REG_A6XX_CP_MISC_CNTL, 1);
> > +       OUT_RING(ring, 0);
> > +
> > +       /* Turn off protected mode */
> > +       OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> > +       OUT_RING(ring, 1);
> > +}
> > +
> >  static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> >         struct msm_file_private *ctx)
> >  {
> > @@ -89,6 +141,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> >         struct msm_ringbuffer *ring = submit->ring;
> >         unsigned int i;
> >
> > +       a6xx_set_pagetable(gpu, ring, ctx);
> > +
> >         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
> >                 rbmemptr_stats(ring, index, cpcycles_start));
> >
> > @@ -872,6 +926,18 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
> >         return (unsigned long)busy_time;
> >  }
> >
> > +struct msm_gem_address_space *a6xx_address_space_instance(struct msm_gpu *gpu)
> > +{
> > +       struct msm_mmu *mmu;
> > +
> > +       mmu = msm_iommu_pagetable_create(gpu->aspace->mmu);
> > +       if (IS_ERR(mmu))
> > +               return msm_gem_address_space_get(gpu->aspace);
> > +
> > +       return msm_gem_address_space_create(mmu,
> > +               "gpu", 0x100000000ULL, 0x1ffffffffULL);
> > +}
> > +
> >  static const struct adreno_gpu_funcs funcs = {
> >         .base = {
> >                 .get_param = adreno_get_param,
> > @@ -893,8 +959,9 @@ static const struct adreno_gpu_funcs funcs = {
> >  #if defined(CONFIG_DRM_MSM_GPU_STATE)
> >                 .gpu_state_get = a6xx_gpu_state_get,
> >                 .gpu_state_put = a6xx_gpu_state_put,
> > -               .create_address_space = adreno_iommu_create_address_space,
> >  #endif
> > +               .create_address_space = adreno_iommu_create_address_space,
> > +               .address_space_instance = a6xx_address_space_instance,
> >         },
> >         .get_timestamp = a6xx_get_timestamp,
> >  };
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > index 7764373d0ed2..0987d6bf848c 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
> >         volatile uint32_t fence;
> >
> >         volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
> > +       volatile u64 ttbr0;
> >  };
> >
> >  struct msm_ringbuffer {
> > --
> > 2.17.1
> >

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
