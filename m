Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F6554FE88
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B131123D2;
	Fri, 17 Jun 2022 20:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2486C1123D2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:52:42 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id w16so6720322oie.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=zfdMPFQLtynymEdExqfgDNO6jYr15Yc2szC/qTvNqXc=;
 b=FLRtbfnbWLQS1vb5eeDTBn1ifXwUDQZG1/XVUVl1FLOIJykhQJyfn+uWbH2XnzdCz6
 Ad+r59Zb4HpRB9uujT3zdjbqaYFVz9zPIm0Jkmu6Zo6vvu5Ky7sa+FObdEm1jGb/itZG
 EU+O9JqCUuVSS8JRea+QvCWY70lIFU/BSv6Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=zfdMPFQLtynymEdExqfgDNO6jYr15Yc2szC/qTvNqXc=;
 b=xbfdTLie3TG5/2rKE4gyxxbYqYdQoLj7CB79mTGP+sDfVrB7IKtjoQoTEQVsDzjJx4
 d31oElHiZ7ic1dw2jq6V1nSHOkK+gu18WXtXiiQnfZZw2kXdQLjcQP0w/QqfObljzJfA
 +sJUYTuUdE4MgttnSI3GHe8HWdlPHBkC3VfLSR9RGpfCMy+S0/rbI7X++59awwsr4nZm
 cyq9kIzWWHCg5wJT+ZutHcdklRj7gq1zqf54X/5vXP+PTMC4vmyTsDx9StFfFTzm50Hn
 81C8ohFundmhAtBemvt9O5oZWOfd2aVdgGJYbDiq+NNhfPsgI1Abunwk72bhTlcR//5d
 33CA==
X-Gm-Message-State: AJIora9TIsG83jrQJDMb6tA2WW1S7BmFteOcL2xpgpDFAOPEDmdvFbE8
 mTdDXEKMseab/RTXkviEXJg2ZHx3Cn39CCTB/u7j+w==
X-Google-Smtp-Source: AGRyM1suSR453qA+5dSch0ZvpRtGfqRjnHNr1SDHaTA+0o2m1rKfJMVWy6hbx0LHhvgcM97D2zccNi9b/DSwV0+EihY=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr6052910oib.63.1655499161401; Fri, 17
 Jun 2022 13:52:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:52:40 -0700
MIME-Version: 1.0
In-Reply-To: <20220617191429.1087634-4-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
 <20220617191429.1087634-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:52:40 -0700
Message-ID: <CAE-0n51vBRdNNM3BH90uG5TH=Gr51rX9B527L4U2yXh1YXYiQQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm/msm: stop storing the array of CRTCs in struct
 msm_drm_private
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 12:14:29)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 44485363f37a..567e77dae43b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -427,20 +428,23 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>         ddev->mode_config.funcs = &mode_config_funcs;
>         ddev->mode_config.helper_private = &mode_config_helper_funcs;
>
> -       for (i = 0; i < priv->num_crtcs; i++) {
> +       drm_for_each_crtc(crtc, ddev) {
> +               struct msm_drm_thread *ev_thread;
> +
>                 /* initialize event thread */
> -               priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
> -               priv->event_thread[i].dev = ddev;
> -               priv->event_thread[i].worker = kthread_create_worker(0,
> -                       "crtc_event:%d", priv->event_thread[i].crtc_id);
> -               if (IS_ERR(priv->event_thread[i].worker)) {
> -                       ret = PTR_ERR(priv->event_thread[i].worker);
> +               ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
> +               ev_thread->crtc = crtc;
> +               ev_thread->dev = ddev;
> +               ev_thread->worker = kthread_create_worker(0,
> +                       "crtc_event:%d", ev_thread->crtc->base.id);
> +               if (IS_ERR(ev_thread->worker)) {
> +                       ret = PTR_ERR(ev_thread->worker);
>                         DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
> -                       ret = PTR_ERR(priv->event_thread[i].worker);
> +                       ev_thread->worker = NULL;

This wasn't set to NULL before, so is it necessary to set it to NULL
now?
