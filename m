Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B474B393
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 17:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E05A10E5AA;
	Fri,  7 Jul 2023 15:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B3C10E5AA;
 Fri,  7 Jul 2023 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1688742194; x=1720278194;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4zMRrGRQ9dofsSjrjKdEiubhrk+NqzyaExLwV19ZqVg=;
 b=BHMHSoz9sbWppq/k8+U3do25K5zSgYNtSxrluZQhKB7y7dZ4RBwfs3vx
 03RnbspDLVXx52wdHxVJF7x4w0X2m2fyUh5+1KZGPimmNURjkkAPCp9WI
 d3OYsMOXg25V8jSL1PkQzpc/6V3uWlrA8yx8Im4akL43sK1ohf4WxUC9Y Y=;
X-IronPort-AV: E=Sophos;i="6.01,189,1684800000"; d="scan'208";a="14932592"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-cadc3fbd.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 15:03:12 +0000
Received: from EX19MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2b-m6i4x-cadc3fbd.us-west-2.amazon.com (Postfix)
 with ESMTPS id ADCA8A0B25; Fri,  7 Jul 2023 15:03:11 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 7 Jul 2023 15:03:11 +0000
Received: from amazon.com (10.187.171.27) by EX19D047UWB002.ant.amazon.com
 (10.13.138.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 7 Jul
 2023 15:03:10 +0000
Date: Fri, 7 Jul 2023 09:03:07 -0600
From: Jordan Crouse <jorcrous@amazon.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm: Check for the GPU IOMMU during bind
Message-ID: <20230707150307.vb4otu5e6hwoadyf@amazon.com>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ricardo Ribalda <ribalda@chromium.org>,
 "Joel Fernandes (Google)" <joel@joelfernandes.org>,
 David Airlie <airlied@gmail.com>
References: <20230309222049.4180579-1-jorcrous@amazon.com>
 <d73f6733-e605-0cf8-7909-8cced6e3b70d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d73f6733-e605-0cf8-7909-8cced6e3b70d@linaro.org>
X-Originating-IP: [10.187.171.27]
X-ClientProxiedBy: EX19D032UWB002.ant.amazon.com (10.13.139.190) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
Precedence: Bulk
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 Ricardo Ribalda <ribalda@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan
 Chancellor <nathan@kernel.org>, linux-arm-msm@vger.kernel.org, "Joel
 Fernandes \(Google\)" <joel@joelfernandes.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 06, 2023 at 09:55:13PM +0300, Dmitry Baryshkov wrote:
> 
> On 10/03/2023 00:20, Jordan Crouse wrote:
> > While booting with amd,imageon on a headless target the GPU probe was
> > failing with -ENOSPC in get_pages() from msm_gem.c.
> > 
> > Investigation showed that the driver was using the default 16MB VRAM
> > carveout because msm_use_mmu() was returning false since headless devices
> > use a dummy parent device. Avoid this by extending the existing is_a2xx
> > priv member to check the GPU IOMMU state on all platforms and use that
> > check in msm_use_mmu().
> > 
> > This works for memory allocations but it doesn't prevent the VRAM carveout
> > from being created because that happens before we have a chance to check
> > the GPU IOMMU state in adreno_bind.
> > 
> > There are a number of possible options to resolve this but none of them are
> > very clean. The easiest way is to likely specify vram=0 as module parameter
> > on headless devices so that the memory doesn't get wasted.
> 
> This patch was on my plate for quite a while, please excuse me for
> taking it so long.

No worries. I'm also chasing a bunch of other stuff too.

> I see the following problem with the current code. We have two different
> instances than can access memory: MDP/DPU and GPU. And each of them can
> either have or miss the MMU.
> 
> For some time I toyed with the idea of determining whether the allocated
> BO is going to be used by display or by GPU, but then I abandoned it. We
> can have display BOs being filled by GPU, so handling it this way would
> complicate things a lot.
> 
> This actually rings a tiny bell in my head with the idea of splitting
> the display and GPU parts to two different drivers, but I'm not sure
> what would be the overall impact.

As I now exclusively work on headless devices I would be 100% for this,
but I'm sure that our laptop friends might not agree :)

> More on the msm_use_mmu() below.
> 
> > 
> > Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> > ---
> > 
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 6 +++++-
> >   drivers/gpu/drm/msm/msm_drv.c              | 7 +++----
> >   drivers/gpu/drm/msm/msm_drv.h              | 2 +-
> >   3 files changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 36f062c7582f..4f19da28f80f 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -539,7 +539,11 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
> >       DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
> >               config.rev.minor, config.rev.patchid);
> > 
> > -     priv->is_a2xx = config.rev.core == 2;
> > +     /*
> > +      * A2xx has a built in IOMMU and all other IOMMU enabled targets will
> > +      * have an ARM IOMMU attached
> > +      */
> > +     priv->has_gpu_iommu = config.rev.core == 2 || device_iommu_mapped(dev);
> >       priv->has_cached_coherent = config.rev.core >= 6;
> > 
> >       gpu = info->init(drm);
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index aca48c868c14..a125a351ec90 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -318,11 +318,10 @@ bool msm_use_mmu(struct drm_device *dev)
> >       struct msm_drm_private *priv = dev->dev_private;
> > 
> >       /*
> > -      * a2xx comes with its own MMU
> > -      * On other platforms IOMMU can be declared specified either for the
> > -      * MDP/DPU device or for its parent, MDSS device.
> > +      * Return true if the GPU or the MDP/DPU or parent MDSS device has an
> > +      * IOMMU
> >        */
> > -     return priv->is_a2xx ||
> > +     return priv->has_gpu_iommu ||
> >               device_iommu_mapped(dev->dev) ||
> >               device_iommu_mapped(dev->dev->parent);
> 
> I have a generic feeling that both old an new code is not fully correct.
> Please correct me if I'm wrong:
> 
> We should be using VRAM, if either of the blocks can not use remapped
> memory. So this should have been:
> 
> bool msm_use_mmu()
> {
>  if (!gpu_has_iommu)
>    return false;
> 
>  if (have_display_part && !display_has_mmu())
>    return false;
> 
>  return true;
> }
> 
> What do you think.

I would have to see (and try) the real code but that seems like it might
be reasonable. I would like to hear from some of the a2xx users too
because this mostly affects them. On 3xx and newer you've always had the
option of not having a MMU for GPU or display but I can't think of any
use cases where you wouldn't want it.

> --
> With best wishes
> Dmitry
> 

Jordan
