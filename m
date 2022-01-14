Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B548F214
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 22:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E759A10E236;
	Fri, 14 Jan 2022 21:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BBA10E23A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 21:41:45 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id i9so14068660oih.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 13:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EiF4kxaLYYslVsSU2sOxDU0qaE58YW7xc6wp1g7lJQQ=;
 b=aJyozUrkyudyCMwztwokNGSEAVnw6wQjjRztzVHW4JAvcr8WI07NRwpnWsK0diRUPt
 Fg6IeQRZP9g8Ds56ymeldBaTBbQqvfd81JsjFfxduSl/Fq9np23NPioUWZ99mkBngw4z
 XrI1d2GSV/i8mv1RJQoL4rGUg51B6kowqwvtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EiF4kxaLYYslVsSU2sOxDU0qaE58YW7xc6wp1g7lJQQ=;
 b=qYUo5LLMioeMav88Pkzcd/8crunWff8PY5gyUDjCY+3BbnlXZyRz7pf9u/1wa0Mk+c
 vFiLO6y8BgqLH+rlxD6WY9gMMK0Ogi53Alh3a8uypEKidTuNPfXvl9fco7Bo8JJTKABh
 8qvxwZnyWwf346DeLRw25aO/zV9hcjS+kmS1gwfevWGnuw/H3FQ/JBvF8rBsPLrDRgT2
 TvZxf3rSJ6vVuCt3X9XQWWenvXUaU+dJP3PDcHOUTkKA4wB07wBwjy+JG1aFvqONf7mo
 CaOjqT6BFxxue+5EBrS9ErJ51woBVs1b6ntqrgv4Vg+VEpP35v58uplwGNXxquqktKGW
 NPBg==
X-Gm-Message-State: AOAM532Hbo4gO4FufdrnISiOQ9E8MHyipOXlsVPRUoEa67Wz+EiSI/xK
 mlfKso6VPL24gY+ZDqAYHN+zOT/m3JC2XpOb4SNtRdRf7Zg=
X-Google-Smtp-Source: ABdhPJxqXjmHGTouafQMbaFEPOTUQrNELWzSofFuBmD0rN8FxXai9W9dtNego1w9Wr2rWHHHSY+XGSIvw1IVJXLBDn4=
X-Received: by 2002:aca:4382:: with SMTP id q124mr9068196oia.64.1642196504991; 
 Fri, 14 Jan 2022 13:41:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 15:41:44 -0600
MIME-Version: 1.0
In-Reply-To: <1642194710-2512-2-git-send-email-quic_khsieh@quicinc.com>
References: <1642194710-2512-1-git-send-email-quic_khsieh@quicinc.com>
 <1642194710-2512-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 14 Jan 2022 15:41:44 -0600
Message-ID: <CAE-0n52UYBajrqGFqppun5oK82V3ppjvQxANU27kL95gCZtURg@mail.gmail.com>
Subject: Re: [PATCH v15 1/4] drm/msm/dp: do not initialize phy until plugin
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

Quoting Kuogee Hsieh (2022-01-14 13:11:47)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21..7cd6222 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -696,12 +699,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>          * dp core (ahb/aux clks) must be initialized before
>          * irq_hpd be handled
>          */
> -       if (dp->core_initialized) {
> -               ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
> -               if (ret == -ECONNRESET) { /* cable unplugged */
> -                       dp->core_initialized = false;
> -               }
> -       }
> +       if (dp->core_initialized)

When is this condition false? The irq isn't unmasked until the core has
been initialized. On the resume path I suppose the irq is enabled in
dp_display_host_init() calling dp_ctrl_reset_irq_ctrl(), and then we
could immediately get the interrupt but it will block on the event_mutex
lock.

> +               dp_display_usbpd_attention_cb(&dp->pdev->dev);
> +
>         DRM_DEBUG_DP("hpd_state=%d\n", state);
>
>         mutex_unlock(&dp->event_mutex);
> @@ -1363,14 +1373,16 @@ static int dp_pm_suspend(struct device *dev)
>                 if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>                         dp_ctrl_off_link_stream(dp->ctrl);
>
> +               dp_display_host_phy_exit(dp);
> +
> +               /* host_init will be called at pm_resume */
>                 dp_display_host_deinit(dp);
> +       } else {
> +               dp_display_host_phy_exit(dp);

I fail to see where this condition happens. Can we suspend the device
without the irq being installed?

>         }
>
>         dp->hpd_state = ST_SUSPENDED;
>
> -       /* host_init will be called at pm_resume */
> -       dp->core_initialized = false;
> -
>         DRM_DEBUG_DP("After, core_inited=%d power_on=%d\n",
>                         dp->core_initialized, dp_display->power_on);
>
