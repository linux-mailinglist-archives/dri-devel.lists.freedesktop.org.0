Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF60518578
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 15:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B08112015;
	Tue,  3 May 2022 13:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCB9112016
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 13:30:31 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2f7c424c66cso179978917b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 06:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DEwNIo+Pz7RRZFde8CJHAcgP3NyV5yH+qthsh7W7UVM=;
 b=ylAoRRbBQV62t52BjLMRTDNGurM9jcjY/Kx120h/40nkAHBKGy8AZKqK6BJ6/3Isod
 wMah7lIljnH2V8PgUDzy7QtedDlTOllpCKyFYb2mZ98dBOLlBlQ09X8X9w02szuI0Vn4
 NipBEjw3a5EpKZ5BU58npcWSHh1tJCwa2yB4+d1G5Rjj36KG1U+1JgsZavbjwuHZgvAM
 7hdY83YLCh5jMqOg8c+WZTdIpzCdyCBYXn1DooqEScvdu5oRsLE1J75LMCCyjlWIDmSO
 s8vP5DIq3QnVZbRsWw/8WA7Hu9Lzo8St1vA8K3Y3L6RWMoTCKT5U12I1LJPI7dff69un
 PpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DEwNIo+Pz7RRZFde8CJHAcgP3NyV5yH+qthsh7W7UVM=;
 b=nNlOBr7PYJ5CYxlIHymmm6b9Dt1EhWnwtJtnQn4G5NULQ6swWXFv1V6VsEkS0ctz0u
 H/aFOqr+LKhPh/2rMJPHJkxySrNCyLeLcuOEeJis6KWaKvoxxc5Cx9di2UXXxl7n31Rh
 iH6dwYH/nCNwSPd+Pwji8ixG+qwCxZvjTDc7WGjruBesJWankPs2c2DLm3lvrO+Kr253
 hQRJNhfj85LH0nLG1ho5bWNrNDJTDFjOnmyqRBhGhxbBjLQojjDYgopGVKM00HzNgkUt
 MkdFuOGoXG3mofiZ1ruP5Mv2miXPTsERkXgBi91VSNrgP9FN7UEbwN2gamQ+rCQ2Y72Q
 ncAg==
X-Gm-Message-State: AOAM530+X/tXG+0HSpYVdnM13j505mhNwQxKNqI+RSzzx1STOlTo79Il
 3yfcyq/ikJRxFao5uyujnEWnIiQSXRMEZvkffwrxJ9kuEGk=
X-Google-Smtp-Source: ABdhPJzmiX0VxglOj7bg/PQKBuv0kkjgrk/o3zj8hFL51/Wn97YHyTUtRISv7kLN3ctk9vJhe4wEcYfJgP0o5ftOFqI=
X-Received: by 2002:a81:4c11:0:b0:2d1:1925:cd70 with SMTP id
 z17-20020a814c11000000b002d11925cd70mr14931433ywa.101.1651584630578; Tue, 03
 May 2022 06:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
 <20220501101022.3931295-3-dmitry.baryshkov@linaro.org>
 <20803530-822d-86fa-d418-b4b7756aac0c@arm.com>
In-Reply-To: <20803530-822d-86fa-d418-b4b7756aac0c@arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 May 2022 16:30:19 +0300
Message-ID: <CAA8EJpo2cdP-FmbhhWO-cUDQf_jKXLuoqP=UgLnzCymeHNV+qA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/mdp5: move iommu_domain_alloc() call close to
 its usage
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 May 2022 at 13:57, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-05-01 11:10, Dmitry Baryshkov wrote:
> > Move iommu_domain_alloc() in front of adress space/IOMMU initialization.
> > This allows us to drop final bits of struct mdp5_cfg_platform which
> > remained from the pre-DT days.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 ----------------
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ------
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  6 ++++--
> >   3 files changed, 4 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > index 1bf9ff5dbabc..714effb967ff 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > @@ -1248,8 +1248,6 @@ static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
> >       { .revision = 3, .config = { .hw = &sdm630_config } },
> >   };
> >
> > -static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev);
> > -
> >   const struct mdp5_cfg_hw *mdp5_cfg_get_hw_config(struct mdp5_cfg_handler *cfg_handler)
> >   {
> >       return cfg_handler->config.hw;
> > @@ -1274,10 +1272,8 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
> >               uint32_t major, uint32_t minor)
> >   {
> >       struct drm_device *dev = mdp5_kms->dev;
> > -     struct platform_device *pdev = to_platform_device(dev->dev);
> >       struct mdp5_cfg_handler *cfg_handler;
> >       const struct mdp5_cfg_handler *cfg_handlers;
> > -     struct mdp5_cfg_platform *pconfig;
> >       int i, ret = 0, num_handlers;
> >
> >       cfg_handler = kzalloc(sizeof(*cfg_handler), GFP_KERNEL);
> > @@ -1320,9 +1316,6 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
> >       cfg_handler->revision = minor;
> >       cfg_handler->config.hw = mdp5_cfg;
> >
> > -     pconfig = mdp5_get_config(pdev);
> > -     memcpy(&cfg_handler->config.platform, pconfig, sizeof(*pconfig));
> > -
> >       DBG("MDP5: %s hw config selected", mdp5_cfg->name);
> >
> >       return cfg_handler;
> > @@ -1333,12 +1326,3 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
> >
> >       return ERR_PTR(ret);
> >   }
> > -
> > -static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev)
> > -{
> > -     static struct mdp5_cfg_platform config = {};
> > -
> > -     config.iommu = iommu_domain_alloc(&platform_bus_type);
> > -
> > -     return &config;
> > -}
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
> > index 6b03d7899309..c2502cc33864 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
> > @@ -104,14 +104,8 @@ struct mdp5_cfg_hw {
> >       uint32_t max_clk;
> >   };
> >
> > -/* platform config data (ie. from DT, or pdata) */
> > -struct mdp5_cfg_platform {
> > -     struct iommu_domain *iommu;
> > -};
> > -
> >   struct mdp5_cfg {
> >       const struct mdp5_cfg_hw *hw;
> > -     struct mdp5_cfg_platform platform;
> >   };
> >
> >   struct mdp5_kms;
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > index 9b7bbc3adb97..1c67c2c828cd 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -558,6 +558,7 @@ static int mdp5_kms_init(struct drm_device *dev)
> >       struct msm_gem_address_space *aspace;
> >       int irq, i, ret;
> >       struct device *iommu_dev;
> > +     struct iommu_domain *iommu;
> >
> >       ret = mdp5_init(to_platform_device(dev->dev), dev);
> >
> > @@ -601,14 +602,15 @@ static int mdp5_kms_init(struct drm_device *dev)
> >       }
> >       mdelay(16);
> >
> > -     if (config->platform.iommu) {
> > +     iommu = iommu_domain_alloc(&platform_bus_type);
>
> To preempt the next change down the line as well, could this be
> rearranged to work as iommu_domain_alloc(iommu_dev->bus)?

I'd prefer to split this into the separate change, if you don't mind.

>
> > +     if (iommu) {
> >               struct msm_mmu *mmu;
> >
> >               iommu_dev = &pdev->dev;
> >               if (!dev_iommu_fwspec_get(iommu_dev))
>
> The fwspec helpers are more of an internal thing between the IOMMU
> drivers and the respective firmware code - I'd rather that external API
> users stuck consistently to using device_iommu_mapped() (it should give
> the same result).

Let me check that it works correctly and spin a v2 afterwards.

>
> Otherwise, thanks for sorting this out!
>
> Robin.
>
> >                       iommu_dev = iommu_dev->parent;
> >
> > -             mmu = msm_iommu_new(iommu_dev, config->platform.iommu);
> > +             mmu = msm_iommu_new(iommu_dev, iommu);
> >
> >               aspace = msm_gem_address_space_create(mmu, "mdp5",
> >                       0x1000, 0x100000000 - 0x1000);



-- 
With best wishes
Dmitry
