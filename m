Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFDE48F1A0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 21:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C668910E21A;
	Fri, 14 Jan 2022 20:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B22410E21A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:41:49 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id y14so13841783oia.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 12:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=w8eYRN8DvaWrfxZ2Wz3wjJHXZl1sXzUmVItZvQrcpIU=;
 b=OKa3qW6WIsuRKuwVZNQaoh+x0FXafWzSaIVMiOJybsAilmpEY6W3EOaW9x2UgT2rw5
 7Z6ixaS6ITqghZ1bGqvYEroKq3/zGqHGcf6lImK8zDJvW3Mf+P2/aLm6KsTE0F3P8quV
 5MzfzisWUjGUiPZu535FQWvgGlcTrhsR26KJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=w8eYRN8DvaWrfxZ2Wz3wjJHXZl1sXzUmVItZvQrcpIU=;
 b=ZvXV8NZXKvqUuCUL8fiYCM3ybm7n2jiMBgwGmwHK3X3gOTQENA6EzBL7FpGzbl9keo
 30rPkm+koShjZlaW50RrEuYQt1K/fg7CCfHcxifSuyULvJmL+UtwqF2YgsABnaEW91iY
 ElEQ/p2/xlvvGR7VzZ9KzR1BNRcQc0KEv/+4QqZq0Xh/2iNJUxSyRkUB/+p5h0o1sWp8
 PkPYmffu63twsSmgLw/N8zmA4QOVZT9MmOAH2+Z0/AW1Hoc2CHqgCjS/Nj62jBImqMvV
 poACKY/YhzybkUvJtu9T9SQHB/wLRtvamS737ujb2mEvJKa02reKQwEhxVCs12392nLR
 foiQ==
X-Gm-Message-State: AOAM532ovvVDe6LRQwF5GUL5hovMm95LWXW3a+AeBVHnGj2I6SobIyo0
 aLPefrDW1WeP9p7cYAQ4GhMtN3Zu0aZezG++JhACUA==
X-Google-Smtp-Source: ABdhPJyJdhcMkqImaSUxZ1WkeHPyT3tbME4n66V0rAr6S+Pk6ZlC3B9/0q6DsTjh/bqpzaqTLFTgaIaDVy4htwfjrno=
X-Received: by 2002:aca:4382:: with SMTP id q124mr8893398oia.64.1642192908901; 
 Fri, 14 Jan 2022 12:41:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 14:41:48 -0600
MIME-Version: 1.0
In-Reply-To: <1642182874-27296-2-git-send-email-quic_khsieh@quicinc.com>
References: <1642182874-27296-1-git-send-email-quic_khsieh@quicinc.com>
 <1642182874-27296-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 14 Jan 2022 14:41:48 -0600
Message-ID: <CAE-0n52UntroUk9hzPorUOvkVty1=V5B2oznYghi_DM6=zyzrw@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-14 09:54:31)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21..2616f7b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -372,21 +373,38 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>         return rc;
>  }
>
> -static void dp_display_host_init(struct dp_display_private *dp, int reset)
> +static void dp_display_host_phy_init(struct dp_display_private *dp)
>  {
> -       bool flip = false;
> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +                       dp->core_initialized, dp->phy_initialized);
>
> +       if (!dp->phy_initialized) {
> +               dp_ctrl_phy_init(dp->ctrl);
> +               dp->phy_initialized = true;
> +       }
> +}
> +
> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
> +{
> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +                       dp->core_initialized, dp->phy_initialized);
> +
> +       if (dp->phy_initialized) {
> +               dp_ctrl_phy_exit(dp->ctrl);
> +               dp->phy_initialized = false;
> +       }
> +}
> +
> +static void dp_display_host_init(struct dp_display_private *dp)
> +{
>         DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
>         if (dp->core_initialized) {

Can you remove this if condition too? I don't see how it ever happens.

>                 DRM_DEBUG_DP("DP core already initialized\n");
>                 return;
>         }
>
> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
> -               flip = true;
> -
> -       dp_power_init(dp->power, flip);
> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
> +       dp_power_init(dp->power, false);
> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>         dp_aux_init(dp->aux);
>         dp->core_initialized = true;
>  }
