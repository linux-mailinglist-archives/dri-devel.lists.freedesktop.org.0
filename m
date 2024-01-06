Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB06825D67
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 01:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E70410E076;
	Sat,  6 Jan 2024 00:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A8B10E076
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 00:39:09 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-dafe04717baso118530276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 16:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704501548; x=1705106348; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CWItgsviLevELUTQOy8l4EFaye3LXQAVmYfKWfZE4dg=;
 b=e5e8UJKyZAYzjcDGJSukwPugyaz7ikuDCd+09/+lqYvyf3SuVIS8UiC3/8Rf9Hv8oZ
 7qaXF3TdAQXS6m5tPhHYyYSlG4UEipcrYOHEEitD48ShR63X+BJlx0E/iTPvgrvYOnu7
 Gdv5+8y44tTYg2JY1TtEiE+thxj2eaIEfcp/Qro1Osi+hTlRs1Pj7UQ0CWE2T3xuWeoo
 BJsgHYtRtoEAOZ/uO35Ru40R262FSz5eAtxAl02JIzP5BD2Zm6hnZESOJszHLkPr9iwI
 /uNTPRiJ+sBTTcH2zpheWKpfcnuyTl8rG2IrwWYUXviJ5VLrORfMYly8i+yz9ZWCoiIh
 v93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704501548; x=1705106348;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CWItgsviLevELUTQOy8l4EFaye3LXQAVmYfKWfZE4dg=;
 b=ZyO7jQUMCrp/+gvCTEWzQYkal+cXeYrOOt9j8OjSn9d9Dy6yT5IqbHE9fl6rbInukM
 j3L1kIApPAQI5AGTDsRsamnAsh989P/M+HU/e+KFG3/cA3fGpFlHhMMzONZArbpb1ZjT
 +mtnDuLZQUrQVSweaHO2xoSQnSVTIt/4DZ4w+9ed6mgs9xongIYSTchKEVUM1G4mn+up
 RzeUEuxniHuRpg0UdF5CyfOWM/M0rev0ACFAf+hgALcaBZ1fHaiJAaqOitMvWouad9f2
 /uknqI6w75RYjWu/3fZBHgVMKI9FGdAnXoPdFFYqasHuya5zoKRK27CQ0zsiDfm0Wrw3
 bAYw==
X-Gm-Message-State: AOJu0YxMrdNfrk+NPQmhqJ/H0X2vtuuTmyAfG8rLlqY5rC5g90wI+yhP
 VrMGJ+vMmOJvCxYSxDPStD/a7/jrQuYYlqh7Eq/kl3g6UocMsg==
X-Google-Smtp-Source: AGHT+IGnvK2SJ9w6gTmUsRLVRNS3RTVaJ8/Pp4IUrvSHuf9v1HiVqYLlHIA28KAi30M1XBd80naFcN+Tklt5i2+a/aU=
X-Received: by 2002:a25:f624:0:b0:dbe:3500:a42b with SMTP id
 t36-20020a25f624000000b00dbe3500a42bmr135029ybd.42.1704501548600; Fri, 05 Jan
 2024 16:39:08 -0800 (PST)
MIME-Version: 1.0
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
 <20240106-fd-migrate-mdp5-v3-3-3d2750378063@linaro.org>
 <c8d6769b-eb28-337c-fa55-4dae86611da5@quicinc.com>
In-Reply-To: <c8d6769b-eb28-337c-fa55-4dae86611da5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 6 Jan 2024 02:38:57 +0200
Message-ID: <CAA8EJpoF3uKobGzjHbLMKYvcQbdqYzur7Mn1cNDPyc+wiiZ+SQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/msm: add a kernel param to select between MDP5
 and DPU drivers
To: Carl Vanderlip <quic_carlv@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 6 Jan 2024 at 02:04, Carl Vanderlip <quic_carlv@quicinc.com> wrote:
>
>
> On 1/5/2024 3:34 PM, Dmitry Baryshkov wrote:
> > For some of the platforms (e.g. SDM660, SDM630, MSM8996, etc.) it is
> > possible to support this platform via the DPU driver (e.g. to provide
> > support for DP, multirect, etc). Add a modparam to be able to switch
> > between these two drivers.
> >
> > All platforms supported by both drivers are by default handled by the
> > MDP5 driver. To let them be handled by the DPU driver pass the
> > `msm.prefer_mdp5=false` kernel param.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  3 +++
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 +++
> >   drivers/gpu/drm/msm/msm_drv.c            | 31 +++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/msm_drv.h            |  1 +
> >   4 files changed, 38 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index aa9e0ad33ebb..8f11a98491a1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1276,6 +1276,9 @@ static int dpu_dev_probe(struct platform_device *pdev)
> >       int irq;
> >       int ret = 0;
> >
> > +     if (!msm_disp_drv_should_bind(&pdev->dev, true))
> > +             return -ENODEV;
> > +
> >       dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
> >       if (!dpu_kms)
> >               return -ENOMEM;
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > index 0827634664ae..43d05851c54d 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -866,6 +866,9 @@ static int mdp5_dev_probe(struct platform_device *pdev)
> >
> >       DBG("");
> >
> > +     if (!msm_disp_drv_should_bind(&pdev->dev, false))
> > +             return -ENODEV;
> > +
> >       mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
> >       if (!mdp5_kms)
> >               return -ENOMEM;
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 50b65ffc24b1..ef57586fbeca 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -969,6 +969,37 @@ static int add_components_mdp(struct device *master_dev,
> >       return 0;
> >   }
> >
> > +#if !IS_REACHABLE(CONFIG_DRM_MSM_MDP5) || !IS_REACHABLE(CONFIG_DRM_MSM_DPU)
> > +bool msm_disp_drv_should_bind(struct device *dev, bool mdp5_driver)
>
> s/mdp5_driver/dpu_driver/

Well, ignored_driver, but your suggestion is better.

>
> > +{
> > +     /* If just a single driver is enabled, use it no matter what */
> > +     return true;
> > +}
>
> This will cause both MDP/DPU probes to return -ENODEV, rather than
> select the enabled one.

No. The code (e.g. for DPU) is:

       if (!msm_disp_drv_should_bind(&pdev->dev, true))
                return -ENODEV;

So the driver returns -ENODEV if msm_disp_drv_should_bind() returns
false. Which is logical from the function name point of view.

>
> > +#else
> > +
> > +static bool prefer_mdp5 = true;
> > +MODULE_PARM_DESC(prefer_mdp5, "Select whether MDP5 or DPU driver should be preferred");
> > +module_param(prefer_mdp5, bool, 0444);
> > +
> > +/* list all platforms supported by both mdp5 and dpu drivers */
> > +static const char *const msm_mdp5_dpu_migration[] = {
> > +     NULL,
> > +};
> > +
> > +bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
> > +{
> > +     /* If it is not an MDP5 device, do not try MDP5 driver */
> > +     if (!of_device_is_compatible(dev->of_node, "qcom,mdp5"))
> > +             return dpu_driver;
> > +
> > +     /* If it is not in the migration list, use MDP5 */
> > +     if (!of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migration))
> > +             return !dpu_driver;
> > +
> > +     return prefer_mdp5 ? !dpu_driver : dpu_driver;
> > +}
> > +#endif
> > +
> >   /*
> >    * We don't know what's the best binding to link the gpu with the drm device.
> >    * Fow now, we just hunt for all the possible gpus that we support, and add them
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index 01e783130054..762e13e2df74 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -563,5 +563,6 @@ int msm_drv_probe(struct device *dev,
> >       struct msm_kms *kms);
> >   void msm_kms_shutdown(struct platform_device *pdev);
> >
> > +bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
> >
> >   #endif /* __MSM_DRV_H__ */
> >



-- 
With best wishes
Dmitry
