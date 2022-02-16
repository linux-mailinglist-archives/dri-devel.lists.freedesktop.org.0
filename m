Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFAC4B7D7C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB14210E60F;
	Wed, 16 Feb 2022 02:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946FF10E60F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:31:57 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id q8so1038110oiw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=hUg/o9QQhWbhspmlcIp23bDnzJOJG3aQ5GoAVdX8hOM=;
 b=f9qRjcip1axnB3gsByayybsK2LUKhi3YC+5I8hPNWYz6Dq2oILdp9UBT/UtbbY1G6L
 xIfZ0+QkOMs82ifVOLbQ/sYS6IJn8zSrkH1nuz2EU9qf3QDTCzvH3WK5zX0TS5/ugxUr
 3fPAtiy0aQcdYmPaZjbe5RmoiyJvHigmR1Zm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=hUg/o9QQhWbhspmlcIp23bDnzJOJG3aQ5GoAVdX8hOM=;
 b=WciKB5fXdm0DH42Npi8N1S83IzLOEeQ1QUf0Xmt8LrxfzMe3byU9dVwXsXaTatuvlE
 CvOmTV6YYVwz6f9FPXokM1AIFLZQqsMW8OfofiBvI/O5g4gdlVsW+HMVzE8nHwZTgNBH
 V7DYGGgy7SqM50z6H0a+HgHnjsljlsftuOk1C91ZXmFvV55Dk58msGunON/AVnlu7Jmv
 6m2RTxOjfzoKr+Cflys6npvGQ0aj1UHk6V2uDKa2pRWpJmf/HxdXaAse6+1RLiOuxup+
 fYyiRX4tEB5hclTVrMITfn4rUdmIKyYh0e3MJFKOhfi4EUrTdeFXU2HWvtB53CKvbmoc
 MtbA==
X-Gm-Message-State: AOAM530QaCZSMbzKoRtyJHTdIVrt6MDhpV9RrL/LWxUrXay0rjycwZMz
 Pv5xF2Ysd+tgq548Hgmy68N+SKmlvTixJsFkTp2CVA==
X-Google-Smtp-Source: ABdhPJyDbvUvZ6RkYHBL3/aUIR1aZh7KmHgpodA7AcbRXrRAGWGGpOYV87YtSNdxv0zicH+MiICs9s/7a1UNaneOVZg=
X-Received: by 2002:a05:6808:b2f:b0:2cf:9af3:1687 with SMTP id
 t15-20020a0568080b2f00b002cf9af31687mr337010oij.112.1644978716695; Tue, 15
 Feb 2022 18:31:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:31:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220131210513.2177652-2-dmitry.baryshkov@linaro.org>
References: <20220131210513.2177652-1-dmitry.baryshkov@linaro.org>
 <20220131210513.2177652-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:31:55 -0800
Message-ID: <CAE-0n520mZdGaMWwjBEb7SSbLf31Sd7t3pe9dJ5FLVnsSVJZFg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/msm/dpu: simplify clocks handling
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-31 13:05:12)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 60fe06018581..4d184122d63e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -405,10 +394,11 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>
>                 trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
>
> -               ret = _dpu_core_perf_set_core_clk_rate(kms, clk_rate);
> +               if (clk_rate > kms->perf.max_core_clk_rate)
> +                       clk_rate = kms->perf.max_core_clk_rate;

Using

	clk_rate = min(clk_rate, kms->perf.max_core_clk_rate)

would be type safer. And min_t() would be explicit if the types don't
match, but we should try to make them be compatible.

> +               ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
>                 if (ret) {
> -                       DPU_ERROR("failed to set %s clock rate %llu\n",
> -                                       kms->perf.core_clk->clk_name, clk_rate);
> +                       DPU_ERROR("failed to set core clock rate %llu\n", clk_rate);
>                         return ret;
>                 }
>
> @@ -529,13 +519,13 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
>  int dpu_core_perf_init(struct dpu_core_perf *perf,
>                 struct drm_device *dev,
>                 struct dpu_mdss_cfg *catalog,
> -               struct dss_clk *core_clk)
> +               struct clk *core_clk)
>  {
>         perf->dev = dev;
>         perf->catalog = catalog;
>         perf->core_clk = core_clk;
>
> -       perf->max_core_clk_rate = core_clk->max_rate;
> +       perf->max_core_clk_rate = clk_get_rate(core_clk);
>         if (!perf->max_core_clk_rate) {
>                 DPU_DEBUG("optional max core clk rate, use default\n");
>                 perf->max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 2d385b4b7f5e..5f562413bb63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -21,7 +21,6 @@
>  #include "dpu_hw_lm.h"
>  #include "dpu_hw_interrupts.h"
>  #include "dpu_hw_top.h"
> -#include "dpu_io_util.h"
>  #include "dpu_rm.h"
>  #include "dpu_core_perf.h"
>
> @@ -113,7 +112,8 @@ struct dpu_kms {
>         struct platform_device *pdev;
>         bool rpm_enabled;
>
> -       struct dss_module_power mp;
> +       struct clk_bulk_data *clocks;
> +       int num_clocks;

size_t?

>
>         /* reference count bandwidth requests, so we know when we can
>          * release bandwidth.  Each atomic update increments, and frame-
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index 131c1f1a869c..8c038416e119 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -29,7 +29,8 @@ struct dpu_irq_controller {
>  struct dpu_mdss {
>         struct msm_mdss base;
>         void __iomem *mmio;
> -       struct dss_module_power mp;
> +       struct clk_bulk_data *clocks;
> +       int num_clocks;

size_t?

>         struct dpu_irq_controller irq_controller;
>  };
>
