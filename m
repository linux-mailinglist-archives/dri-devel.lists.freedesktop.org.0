Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFCC75B37C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 17:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20C010E162;
	Thu, 20 Jul 2023 15:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C86510E15D;
 Thu, 20 Jul 2023 15:53:04 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1b8eb69d641so728421fac.0; 
 Thu, 20 Jul 2023 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689868383; x=1690473183;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdiXWN9VKG2RHkdnGg3Y/QnT3CJ4DL70qJz+8ZNiP54=;
 b=ZM5wJbg3Wn+ja0lqtno0iVgh1AmYW9DxRkviEsoD8YTZwYwMYukTSE/VS8zFwngr9X
 YfMkvKCkJYETPkZ5Rm/N5DsfnpQ58GCwLBsrdctdufSM6U2VsO5znvhLK+VCk8Rh2mUa
 g1rNlQvPJ98A7T5vQCjTXdIyvZ+OEZcgAUQ5ImStpu75ADYlnW0XW1L6CVQFB2gi6JFR
 qRJ8JxRlzN2JDjIL4St/1THgLHds4XyLq2k3QBzGn2GZHyu76gYQ9Jm4uAn4BWslEKrY
 m64dJHe2vB5hnkQDsBGbLWct/wQX7qxgKRcCVlSxMI37QxNZ8rAYy3cr1DmgFVyD94lt
 V6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689868383; x=1690473183;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdiXWN9VKG2RHkdnGg3Y/QnT3CJ4DL70qJz+8ZNiP54=;
 b=TX6s/gUHOgFHaZx1j0FEAjqhqESpLtI/mCsl8lWKhIhhvCgYmQi9FYi66tw6ez8CHJ
 EGS13q3cBWOv7ul/7VpqCDtAs0aCb2DRX8+q+kHuhdUtmQ06vd2BE5nFrT+lSivrDRIJ
 c4GGvh7NlYHKsc235ZN3dkAIYH207VCOKgYHn9znMcG2S8m98zOaXg1xKknY3l/i0l1+
 eoWaRIJBlaKuqayFT8lcR38TfMOP+kiPKYzbDdR6NFUDCk2ODcKg6Zk+r9U077npLGV3
 Vngj+t148MshxhGX2lr6mgaWVJlxtlron5QQwk28iqohMKqtq6hUVBQLkWO80w10MPem
 cYxw==
X-Gm-Message-State: ABy/qLZecRjD8tg1xrPlgDMTcKs3FLQc5yU/OaVkJ4i4nqdb0pxYqP2I
 5RpVNDTUFhfo70DQWp/7blL8avBPgIlJ1BBo0Ys=
X-Google-Smtp-Source: APBJJlH0lI6SV0q3uzQ5wOTHpuTe0kfahtkJlagRdNlL6AL+4u/QZBZy5f1g6Q0U2mTOSQZ3x0BPwFzPGYBhIDa25kg=
X-Received: by 2002:a05:6870:2112:b0:1b0:5218:cf07 with SMTP id
 f18-20020a056870211200b001b05218cf07mr2609444oae.5.1689868383463; Thu, 20 Jul
 2023 08:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230309222049.4180579-1-jorcrous@amazon.com>
 <d73f6733-e605-0cf8-7909-8cced6e3b70d@linaro.org>
In-Reply-To: <d73f6733-e605-0cf8-7909-8cced6e3b70d@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Jul 2023 08:52:52 -0700
Message-ID: <CAF6AEGs89FRmFsENLkP-Dg1ZJN2LzCfxY2-+do9jH9b8L-XZxg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Check for the GPU IOMMU during bind
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, Jordan Crouse <jorcrous@amazon.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023 at 11:55=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 10/03/2023 00:20, Jordan Crouse wrote:
> > While booting with amd,imageon on a headless target the GPU probe was
> > failing with -ENOSPC in get_pages() from msm_gem.c.
> >
> > Investigation showed that the driver was using the default 16MB VRAM
> > carveout because msm_use_mmu() was returning false since headless devic=
es
> > use a dummy parent device. Avoid this by extending the existing is_a2xx
> > priv member to check the GPU IOMMU state on all platforms and use that
> > check in msm_use_mmu().
> >
> > This works for memory allocations but it doesn't prevent the VRAM carve=
out
> > from being created because that happens before we have a chance to chec=
k
> > the GPU IOMMU state in adreno_bind.
> >
> > There are a number of possible options to resolve this but none of them=
 are
> > very clean. The easiest way is to likely specify vram=3D0 as module par=
ameter
> > on headless devices so that the memory doesn't get wasted.
>
> This patch was on my plate for quite a while, please excuse me for
> taking it so long.
>
> I see the following problem with the current code. We have two different
> instances than can access memory: MDP/DPU and GPU. And each of them can
> either have or miss the MMU.
>
> For some time I toyed with the idea of determining whether the allocated
> BO is going to be used by display or by GPU, but then I abandoned it. We
> can have display BOs being filled by GPU, so handling it this way would
> complicate things a lot.

There is MSM_BO_SCANOUT .. but it wouldn't completely surprise me if
it isn't used in some place where it should somewhere or other.  But
that is the hint that contiguous allocation should be used if the
display doesn't support some sort of iommu.  (Using a GPU without some
sort of mmu/iommu isn't something sane to do.. the only reason the
support for that exists at all is to aid bringup.  I wouldn't call
that a "supported" configuration.)

> This actually rings a tiny bell in my head with the idea of splitting
> the display and GPU parts to two different drivers, but I'm not sure
> what would be the overall impact.

Userspace does have better support for split display/gpu these days
than it did when drm/msm was first merged.  It _might_ just work if
one device only advertised DRIVER_RENDER and the other
MODESET/ATOMIC.. but I'd be a bit concerned about breaking things.  I
guess you could try some sort of kconfig knob to have two "msm"
devices and see what breaks, but I'm a bit skeptical that we could
make this the default anytime soon.

For now, just addressing the only-display and only-gpu cases
(continuing with the single device arrangement when you have both
display and gpu), maybe split up drm_dev_alloc() and drm_dev_init() so
that we could use drm_device::driver_features to mask out
DRIVER_RENDER if needed.

BR,
-R

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
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index 36f062c7582f..4f19da28f80f 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -539,7 +539,11 @@ static int adreno_bind(struct device *dev, struct =
device *master, void *data)
> >       DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
> >               config.rev.minor, config.rev.patchid);
> >
> > -     priv->is_a2xx =3D config.rev.core =3D=3D 2;
> > +     /*
> > +      * A2xx has a built in IOMMU and all other IOMMU enabled targets =
will
> > +      * have an ARM IOMMU attached
> > +      */
> > +     priv->has_gpu_iommu =3D config.rev.core =3D=3D 2 || device_iommu_=
mapped(dev);
> >       priv->has_cached_coherent =3D config.rev.core >=3D 6;
> >
> >       gpu =3D info->init(drm);
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index aca48c868c14..a125a351ec90 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -318,11 +318,10 @@ bool msm_use_mmu(struct drm_device *dev)
> >       struct msm_drm_private *priv =3D dev->dev_private;
> >
> >       /*
> > -      * a2xx comes with its own MMU
> > -      * On other platforms IOMMU can be declared specified either for =
the
> > -      * MDP/DPU device or for its parent, MDSS device.
> > +      * Return true if the GPU or the MDP/DPU or parent MDSS device ha=
s an
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
>   if (!gpu_has_iommu)
>     return false;
>
>   if (have_display_part && !display_has_mmu())
>     return false;
>
>   return true;
> }
>
> What do you think.
>
> >   }
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_dr=
v.h
> > index 9f0c184b02a0..f33f94acd1b9 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -126,7 +126,7 @@ struct msm_drm_private {
> >       struct msm_gpu *gpu;
> >
> >       /* gpu is only set on open(), but we need this info earlier */
> > -     bool is_a2xx;
> > +     bool has_gpu_iommu;
> >       bool has_cached_coherent;
> >
> >       struct drm_fb_helper *fbdev;
>
> --
> With best wishes
> Dmitry
>
