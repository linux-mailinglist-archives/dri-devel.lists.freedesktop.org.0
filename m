Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8DF51E2C0
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 02:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FE910E063;
	Sat,  7 May 2022 00:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F23610E063
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 00:29:36 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q8so9225278oif.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 17:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=BfXIYuTjESdwCcwnM3M8fBVsvHWnXl3HX1TNkGVkeNM=;
 b=Hj7bOIh95GPwij//9n8NwUm1Iyp50iOpugsjgNphXDJgxGmxKiY0vlKUeyMxhIi2K2
 6VXze4xJSRJ2kDbt4uS7zYk6Qr7yImNb8t9GihFG4WjcRLbXWUEoPHYoi87oTDjtqQx/
 dOcVT7uJgYR1HQRorqxvT5KUTQxczWwGabjn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=BfXIYuTjESdwCcwnM3M8fBVsvHWnXl3HX1TNkGVkeNM=;
 b=cTM7wxSAMPdM4zuh+Z6ws4KpqNoLX58UGNNhlZLxoEfF9LoYDh+BulfemwBKw4KaFS
 jZUu2TgklhDt6yvaZ6hu8iio9PD/6RvigrLPqgklLChKY6NrBky9zP0Q/MYxlv6gVV0u
 y3f1cei9HzmO4KVcCyL0BdrJ1yMUPFmAs8Qs1Kh6ukOJWB2C1fALFWI73VQkUpkrf24O
 zbnf7JCjmEZV3JrEA+ZHuFDlbTB/k2mV1KIbORcgdZfdSHTBz+kwNsLh4U2bCAGxlM/z
 LlPZCdBo1e3ka4p3GiL1ndFTJ3mhnashk9MTsIF4RyiVnYtLyoO0muvLJxF4FTGvxgVz
 1ZUQ==
X-Gm-Message-State: AOAM5303zXwiRIDi5GuZJDR1U/neLjVujbk4fk7whcMGqaVOQVrDHlRA
 Xk9TahQ6cp0qA1Gn8lQcYiy1r1UwvdrPvRVDG7rafQ==
X-Google-Smtp-Source: ABdhPJxy2rjvHnXRgZkg73o/CmbSvZTI1SbRFqdP1g9gdFeFf/h84x2in8Rewwao0QtsPr/lxD+NoSJdi+JC2LVdHf4=
X-Received: by 2002:a05:6808:23ce:b0:326:6698:c271 with SMTP id
 bq14-20020a05680823ce00b003266698c271mr2647939oib.193.1651883375667; Fri, 06
 May 2022 17:29:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 May 2022 20:29:34 -0400
MIME-Version: 1.0
In-Reply-To: <1651873267-18220-1-git-send-email-quic_khsieh@quicinc.com>
References: <1651873267-18220-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 6 May 2022 20:29:34 -0400
Message-ID: <CAE-0n52HvhT_RFbJHhijKCCt8jQM70fo6ceAbnYEfOfO-dRxVA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Always clear mask bits to disable interrupts
 at dp_ctrl_reset_irq_ctrl()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-05-06 14:41:07)
> dp_catalog_ctrl_reset() will software reset DP controller. But it will
> not reset programmable registers to default value. DP driver still have
> to clear mask bits to interrupt status registers to disable interrupts
> after software reset of controller. This patch removes the enable flag
> condition checking to always clear mask bits of interrupt status
> registers to disable interrupts if enable flag is false.

Another paragraph is needed which is that this (partially?) fixes the
suspend path where we call dp_catalog_ctrl_reset() but the irq is still
unmasked and can come in while we're suspending. This leads to bus hangs
if the irq is handled after we power down the DP hardware because we run
the irq handler and access a device register assuming that no irq could
ever come in if we powered down the device. We don't know when the irq
will be handled though, so it's possible the irq is pending from before
we disable the irq in the hardware. Don't we need some irq synchronize
to make sure it doesn't run?

>
> Fixes: ba0a422be723 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 38026f2..cbf3399 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1379,8 +1379,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
>
>         dp_catalog_ctrl_reset(ctrl->catalog);
>
> -       if (enable)
> -               dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> +       /*
> +        * all dp controller programmable registers will not
> +        * be reset to default value after DP_SW_RESET
> +        * therefore interrupt mask bits have to be updated
> +        * to enable/disable interrupts
> +        */
> +       dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
>  }
>
>  void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
