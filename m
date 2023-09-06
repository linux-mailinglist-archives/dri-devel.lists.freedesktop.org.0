Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 353B179457E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 23:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754C410E733;
	Wed,  6 Sep 2023 21:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7B10E72C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 21:56:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4ff8f2630e3so414489e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 14:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037406; x=1694642206;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=0doNA+N+ip+sYWWL2XBTw81yVKdo/qeOq59PcF949xs=;
 b=Z4jtRtWZeDKdrD6EN11P4MvHf/1XlyuRT1p3hQhH1xg/nrYCAg+9iHGvc//pJPKyz8
 cCZ1kuoIszv21Fnp6cXjgYCWcw/KFhKYq875524Pb9pxbm5ipLQJOhmh8E8JgC6FgkgN
 7qOSXiD+bDdDo6fBAP9sDoT0HVO2eol721Lls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037406; x=1694642206;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0doNA+N+ip+sYWWL2XBTw81yVKdo/qeOq59PcF949xs=;
 b=Gn0FKmcm9516J8bxGi+5XSP7ZsLbgu4HPL9EMyJkAe1w91EKrdcbP7Fimu2PRI5l/o
 zTbSgQKAtM9HZhxStDxJIJfd1kehRM2n0KHC/RrZ2+i3v+rN6eh6kTrUSsgPPhnziIBi
 hBUBiLMvovcarHQBydFr8HqOBWk0lJNJgIbe2xZMF3mzMPr9Y8Ezt5yjUMohDGdK03YO
 Syj9FCBmkhEFxjx1Dzz9LGhCIrJpbmWW55oK8NqqAWUUdYe8JrizyVT8uLOxxBp/3cvk
 quXJiJlge5NuvSe0XSe6pu/vn/bcuBN6nMikUuj7MH79ZXYdwHFxKv6T4Sa+Y/c6nGTM
 A5OQ==
X-Gm-Message-State: AOJu0YyI8kqCYYF5Hzf5y4XlyQEjXhSI9CWxY9egK37JMq8OiT9q4WWY
 YHmTNpFeEe6MP90teoh7H2jPLuNn4vlXmHITnRqS3g==
X-Google-Smtp-Source: AGHT+IEOR6WnFPSLkXOVzLfWyRQdEUQ5wG1/6vCzixejVuPlV0AHADuXMTZ3djwPjmNdkgs6D1BULLIrFCoK3LvKKoo=
X-Received: by 2002:a05:6512:3442:b0:500:bb9a:7e11 with SMTP id
 j2-20020a056512344200b00500bb9a7e11mr2792395lfr.48.1694037405762; Wed, 06 Sep
 2023 14:56:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:56:45 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-5-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 16:56:45 -0500
Message-ID: <CAE-0n51kkZ4ne0qFo7cXNWUZ8M6amGR4UXK5u9fBDJpnuzz5DQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/msm/dpu: inline _setup_intf_ops()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:50)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 8ec6505d9e78..dd67686f5403 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -524,31 +524,6 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
[...]
> -               ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
> -       }
> -
> -       if (mdss_rev->core_major_ver >= 7)
> -               ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
> -}
> -
>  struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>                 void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
>  {
> @@ -571,7 +546,28 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>          */
>         c->idx = cfg->id;
>         c->cap = cfg;
> -       _setup_intf_ops(&c->ops, c->cap->features, mdss_rev);
> +
> +       c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;

Maybe grow a local variable 'ops' that can be assigned to so the code
doesn't change at all, only the location does.

> +       c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
> +       c->ops.get_status = dpu_hw_intf_get_status;
