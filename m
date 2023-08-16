Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05F077DB18
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 09:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7E210E2ED;
	Wed, 16 Aug 2023 07:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FDD10E2A8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 07:27:37 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-583a8596e2aso58954137b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 00:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692170857; x=1692775657;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SxcpWQGGsvXKRVaQmxo6aCUssS2kbI1VLGd3gkTsK3M=;
 b=D5Onr1ekvya8MTyI8sWR3upT0H4FtopHKS1JD29nqIWpphlnRHfHeA+hlqmF826h9e
 g5EdDxuQVawtLKUd+2Jg27eZOESQ47j6pIulyimj4GL+nD9qugt9O2yo/Jx1V3QxQDeG
 gWIRneb4h7FRgX+MRUnNKw/zwnjRRur5sDLAjy/+fwZyLC73PDMq4EMeV8CYIlWErzvl
 B91QW1lXhrRd/eKUdf/OPTjvV0WlVuqFHUyy6sduXe/oE3HgtMwtOjo9gFpEJ43cv9Jt
 F9SuKpa076A9rNzPI5MeelArn97X/DW+Ix/pDFwP5j30Lbb7MEORtgTcVdiL46HhLPjd
 +xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692170857; x=1692775657;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SxcpWQGGsvXKRVaQmxo6aCUssS2kbI1VLGd3gkTsK3M=;
 b=a9KgBmmD8DHC7BzQSh/LCrMg5enbIMLp2zjiFpBaQn8iLa200VBhFKTl4TjX9GWMAT
 A5rus1kAq8Yh8yiptms1R5UrtxejjHssRdJNVvgC0fSjM9j5WwWaGKPTwAvprysuIkMt
 oOPRce2k10g6V4+tS1lBstdCXrAz/m85HgOFM3tyHn/mSW26WnxK0d5SUaz1fu3ZwIpC
 IJ6uOfEHS+viWh5RnPJB8Jl2ZNkr7fgkbJ3WWx6/YU6JAPRlQe5+ZRoANX5HYAFt+fix
 gAyZHfwX5+FOP+aKQhbMtukfSBxaLEpZYwICnS5s5vHAFWMgoMM0qIA1XvPpIckvxRDb
 XKlQ==
X-Gm-Message-State: AOJu0YyYimSsBiLcuH95japem5jYFS1bgOMv/CRHyJaKlh1PHzXb/oSo
 yZuZH3M46WPiN7nvpOhFMXz2BcwblMgKGfJW8sB+/g==
X-Google-Smtp-Source: AGHT+IFX1EPd/m5YbFbdqy2uo1nuq3KWKj0+3PazzKku1AL1qo2++373ieN2NL/y5N17zNzSVlyrt+ajTCeqRYrWEwo=
X-Received: by 2002:a25:8751:0:b0:c5d:1407:f2bc with SMTP id
 e17-20020a258751000000b00c5d1407f2bcmr945122ybn.17.1692170856772; Wed, 16 Aug
 2023 00:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
 <20230730011920.354575-6-dmitry.baryshkov@linaro.org>
 <4212982a-e5fc-c7f2-1b4f-96f2e1848a74@quicinc.com>
In-Reply-To: <4212982a-e5fc-c7f2-1b4f-96f2e1848a74@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 16 Aug 2023 10:27:25 +0300
Message-ID: <CAA8EJpqENCCohr+GpiqWA_DzgKUoXRWe=+B8v51mLDFWweYp3Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] drm/msm/dpu: use devres-managed allocation for
 MDP TOP
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jessica,

On Tue, 15 Aug 2023 at 23:17, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 7/29/2023 6:19 PM, Dmitry Baryshkov wrote:
> > Use devm_kzalloc to create MDP TOP structure. This allows us to remove
> > corresponding kfree and drop dpu_hw_mdp_destroy() function.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 17 +++++++----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h |  8 +++++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  5 ++---
> >   3 files changed, 14 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > index cff48763ce25..481b373d9ccb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > @@ -2,6 +2,8 @@
> >   /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> >    */
> >
> > +#include <drm/drm_managed.h>
>
> Hi Dmitry,
>
> Is it possible to put this #include in a common header? Since it seems
> that this is a common change for a lot of patches in this series.

I personally do not like putting unused includes into common headers.
Each file should contain includes that are used by the particular file
only. Header should include only the files required to process
definitions in this header.

>
> Thanks,
>
> Jessica Zhang
>
> > +
> >   #include "dpu_hwio.h"
> >   #include "dpu_hw_catalog.h"
> >   #include "dpu_hw_top.h"
> > @@ -268,16 +270,17 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> >               ops->intf_audio_select = dpu_hw_intf_audio_select;
> >   }
> >
> > -struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
> > -             void __iomem *addr,
> > -             const struct dpu_mdss_cfg *m)
> > +struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
> > +                                   const struct dpu_mdp_cfg *cfg,
> > +                                   void __iomem *addr,
> > +                                   const struct dpu_mdss_cfg *m)
> >   {
> >       struct dpu_hw_mdp *mdp;
> >
> >       if (!addr)
> >               return ERR_PTR(-EINVAL);
> >
> > -     mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
> > +     mdp = drmm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
> >       if (!mdp)
> >               return ERR_PTR(-ENOMEM);
> >
> > @@ -292,9 +295,3 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
> >
> >       return mdp;
> >   }
> > -
> > -void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp)
> > -{
> > -     kfree(mdp);
> > -}
> > -
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > index 8b1463d2b2f0..6f3dc98087df 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > @@ -145,13 +145,15 @@ struct dpu_hw_mdp {
> >
> >   /**
> >    * dpu_hw_mdptop_init - initializes the top driver for the passed config
> > + * @dev:  Corresponding device for devres management
> >    * @cfg:  MDP TOP configuration from catalog
> >    * @addr: Mapped register io address of MDP
> >    * @m:    Pointer to mdss catalog data
> >    */
> > -struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
> > -             void __iomem *addr,
> > -             const struct dpu_mdss_cfg *m);
> > +struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
> > +                                   const struct dpu_mdp_cfg *cfg,
> > +                                   void __iomem *addr,
> > +                                   const struct dpu_mdss_cfg *m);
> >
> >   void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 6e0643ea4868..d4f4cb402663 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -820,8 +820,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
> >
> >       dpu_kms->catalog = NULL;
> >
> > -     if (dpu_kms->hw_mdp)
> > -             dpu_hw_mdp_destroy(dpu_kms->hw_mdp);
> >       dpu_kms->hw_mdp = NULL;
> >   }
> >
> > @@ -1091,7 +1089,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >
> >       dpu_kms->rm_init = true;
> >
> > -     dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->catalog->mdp,
> > +     dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
> > +                                          dpu_kms->catalog->mdp,
> >                                            dpu_kms->mmio,
> >                                            dpu_kms->catalog);
> >       if (IS_ERR(dpu_kms->hw_mdp)) {
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
