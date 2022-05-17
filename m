Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EDC529C50
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 10:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D4610E725;
	Tue, 17 May 2022 08:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A39D10E8E1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 08:25:54 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id w130so21537276oig.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qFyj5figDGQVFNUWmIzfj4DH6eo/m3Ta43JA6WzvT2c=;
 b=O3ps97EHSIwu0IuHVUjVpLTmRF7nNzrP+6cR37aR9UAJOkAvkCNANY0qTFVPksvWkL
 flbsM7GACfhNRO9+HE3f5hQrZ80I8U+gm3r/y1CQMl9zlMqZGFYkcA4HF6K3GMXQwecn
 Qcf+MEJ7B5c1TEE/NB45C2BVnbNqH2suwpi7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qFyj5figDGQVFNUWmIzfj4DH6eo/m3Ta43JA6WzvT2c=;
 b=K1rtHSORpM0qbu0XJ1KyyYqLSM/t8sKtBqTeAi1gEQoDfadx5+1AnxnYcTRF0U43aG
 wUxksruVfFm/K5roJZbaksLGk/AxtGu7QnQ0zbsoFdmkrKKqEqFAL3ywdPtoEN7hJa+1
 KuRRkCTue9RbzZXVQq/3TmPxJZqQpqoc5cwb3OXwFgccAmNuTSdp486lCxOb56pWsCU8
 KTRZeeaKImp2ZmyEqbGOeWMq9SjXNP6ztiOkbmpMf9zIPxUP6fRD6b1oOpiMMzMQOCHM
 C+RheukTMCM6oM6UEF+c7hSZQGmNxv0sYTiZvzKBefFvF33VoFT8TnbfH3D6avjSA278
 JDLg==
X-Gm-Message-State: AOAM530p6Ohhz6lHhSoyvcTPBPq/lEEAaHSit2YjTOGsRuuUscuj5K3E
 suXGGekqXYj2vcV1FaIrFmnT76d3aRYcyFOi8YUodA==
X-Google-Smtp-Source: ABdhPJxs+1xc/Lw2u3NTSePNRBog18/DG6e9Xn3YMLc6OyuZxzAX8XTsp+t318WYkCDh7KJLL1WVJkbua4qZl8h/e38=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr9696354oiw.193.1652775953881; Tue, 17
 May 2022 01:25:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 May 2022 01:25:53 -0700
MIME-Version: 1.0
In-Reply-To: <1652384598-21586-1-git-send-email-quic_khsieh@quicinc.com>
References: <1652384598-21586-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 17 May 2022 01:25:53 -0700
Message-ID: <CAE-0n5277_-=ZYprmF6JcVfrnG0aZVXqXq092VS=mkDtrOB_wg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
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

Quoting Kuogee Hsieh (2022-05-12 12:43:18)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..f3e333e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
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

I think Dmitry requested that this part be split off to a different
patch. It's fixing the call to dp_ctrl_reset_irq_ctrl() for the disable
case.

>  }
>
>  void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..ab691aa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -98,6 +98,8 @@ struct dp_display_private {
>         struct dp_ctrl    *ctrl;
>         struct dp_debug   *debug;
>
> +       bool suspended;
> +

Can we not have this flag? I also don't understand how this patch waits
for the event queue to drain. There are now multiple places we check to
see if we've suspended, but is it even possible to be in those places
during suspend? What is wrong with moving to an irq thread? Is it
because we want to wait for a modeset (EV_USER_NOTIFICATION)?

>         struct dp_usbpd_cb usbpd_cb;
>         struct dp_display_mode dp_mode;
>         struct msm_dp dp_display;
