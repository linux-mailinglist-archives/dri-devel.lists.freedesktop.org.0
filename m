Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B66421B57
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 02:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C48B6EA4E;
	Tue,  5 Oct 2021 00:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741B86E2B8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 00:58:04 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 e66-20020a9d2ac8000000b0054da8bdf2aeso21670845otb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 17:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=05i/Uy6gH7QU48SgJKDCirwR+ez4PcUFTnCClwqtXkI=;
 b=B61+Xp8onNbuyRL6JL9Kxx4gC7m4sx0TwG+gx96gdFijZbZa2c6EJNfNtnOeQJOwXX
 eLTEkAB++Egb3OWnOCeMRLxZ200uG29IPQPtRxmdxhoPMiZ0Kzq4wjKcMiUzLVW7BtHg
 VGNt67VDZhoMZ3GAicFMm7CEiyGU80AfYNBWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=05i/Uy6gH7QU48SgJKDCirwR+ez4PcUFTnCClwqtXkI=;
 b=yAI8zWWU7ZuazYBdGQ872UrwhqkHP3ph2ZGO15Wob5TgLrVWx9CTe0DzlUu4teuoVg
 +a26h0uD+5w70GQpa+ZXb7KTYGnNZsv1ZivbKukYGZGXyeLOrILoJUDT2YLyzbsm/R3q
 gCkADVbH4CDIztGtRdqmM5NX6Lgq4ACVrdEeAv/2HA3h/Mxqtq2fIiHeHEcAguwLUr+p
 WXUPfpKqQ0KNG6frri2diMuaeAN1sea/f1xlKwiorh0yp1o8buoLvC5zuEqxqawfe5aw
 e8u5As1Nq5W05HE2ipC1ezbhyjjY2TRldYKzT4gjOccEXFUtmDykYigUDp0FoIZfJ5Ze
 hbdQ==
X-Gm-Message-State: AOAM530EpkucToQLXHkuJ9tg3hJ3QyNLODMzoxMMWtNtZlqMIgQR0Oxx
 +wZcldPR0NoQTobujEt8mtwQw0XZgrbma2KSedkS/A==
X-Google-Smtp-Source: ABdhPJx07aCTnqNwiD/0aa6rjlgcFB5P771OgnalRpLSTtV86//Yf7K4nDE2SG3vY/Lrmi1lOKT5dn1JO1kfvg1iC44=
X-Received: by 2002:a05:6830:358:: with SMTP id
 h24mr11371665ote.159.1633395483677; 
 Mon, 04 Oct 2021 17:58:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Oct 2021 20:58:03 -0400
MIME-Version: 1.0
In-Reply-To: <20211001180058.1021913-4-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
 <20211001180058.1021913-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 4 Oct 2021 20:58:03 -0400
Message-ID: <CAE-0n50=EWg1GKuTnRi=zA0ufO1Xg4mucYaqNUZ+wgYNDRcWLA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/msm/dp: Support up to 3 DP controllers
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-10-01 11:00:56)
> Based on the removal of the g_dp_display and the movement of the
> priv->dp lookup into the DP code it's now possible to have multiple
> DP instances.
>
> In line with the other controllers in the MSM driver, introduce a
> per-compatible list of base addresses which is used to resolve the
> "instance id" for the given DP controller. This instance id is used as
> index in the priv->dp[] array.
>
> Then extend the initialization code to initialize struct drm_encoder for
> each of the registered priv->dp[] and update the logic for associating
> each struct msm_dp with the struct dpu_encoder_virt.
>
> Lastly, bump the number of struct msm_dp instances carries by priv->dp
> to 3, the currently known maximum number of controllers found in a
> Qualcomm SoC.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Some nits below.

>
> Changes since v2:
> - Added MSM_DRM_DP_COUNT to link the two 3s
> - Moved NULL check for msm_dp_debugfs_init() to the call site
> - Made struct dp_display_private->id unsigned
>
> I also implemented added connector_type to each of the DP instances and
> propagated this to dp_drm_connector_init() but later dropped this again per
> Doug's suggestion that we'll base this on the presence/absence of a associated
> drm bridge or panel.

Sad but OK. We can take up that topic in another patch.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index f655adbc2421..875b07e7183d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -203,8 +204,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
>         dpu_debugfs_vbif_init(dpu_kms, entry);
>         dpu_debugfs_core_irq_init(dpu_kms, entry);
>
> -       if (priv->dp)
> -               msm_dp_debugfs_init(priv->dp, minor);
> +       for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
> +               if (priv->dp[i])
> +                       msm_dp_debugfs_init(priv->dp[i], minor);

This seems to cause a bunch of debugfs warnings when there are multiple
nodes created with the same name.

> +       }
>
>         return dpu_core_perf_debugfs_init(dpu_kms, entry);
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5d3ee5ef07c2..ff3477474c5d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1180,10 +1192,31 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>         return 0;
>  }
>
> +static int dp_display_find_id(struct platform_device *pdev)
> +{
> +       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> +       struct resource *res;
> +       int i;
> +
> +

Nitpick: Remove a newline here.

> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
> +
> +       for (i = 0; i < cfg->num_descs; i++) {
> +               if (cfg->io_start[i] == res->start)
> +                       return i;
> +       }

Nitpick: Drop braces on single line if inside for loop.

> +
> +       dev_err(&pdev->dev, "unknown displayport instance\n");
> +       return -EINVAL;
> +}
> +
