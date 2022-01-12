Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEA048CCB3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 21:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5767B10F262;
	Wed, 12 Jan 2022 20:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1B710F228
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 20:00:46 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 v10-20020a4a860a000000b002ddc59f8900so976285ooh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 12:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=zjUuqdvE4cKWjJfUmVXa2AhaKez7DZYDKHfpVKmchE8=;
 b=KkhQsRpfIgh8+h9tljWj4LPWmhHk4Qfehoi8pRRGhIYbMYuPDBSct9HftWeHHcKkxi
 mLErxeAdnbFfyANQe9Zm1kjkJMl4lcc7BWspcwYjV7+LDedxU90oc8x1B3yVp1ZVqfX6
 bG+k1IdzbaFpDBuQHoxjj4dm4RxgFJPFV+2uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=zjUuqdvE4cKWjJfUmVXa2AhaKez7DZYDKHfpVKmchE8=;
 b=R6jXYbrvI1rCXiu5BeOYGrc0XI7e51Q91mf+Kd9zApIlT2EzYXIzR9EEgIytW5IUnO
 uss+13gy6HKDZitKKzlr05AMPBpE0CQ8CPtAL9grp4WGF8neKTXx16uArMyVZcvRWQYK
 jW8GOfNv/VvHoRMsQGT7hCFaV1G+oN54NPRQr2v43NCkBps9kLp+tq3iD5fz/ZYi6cg7
 ZhGzNgFg72YQVaGvUh0AelBoZqFVX/DYGoChbY0lhpM0eum0ScwhG0rUCufbfQpN4m/3
 8G8tS302AIbCcIVxoOclfujVsUG7vxxOXoWtthzUDV3wx1+kZ9XaRaVWf9YjT/oQMshg
 5i5g==
X-Gm-Message-State: AOAM531L+efO6MA3w5+Og+wSoTLKnwOPLwHU/If54H9gjKByAU+z9eeb
 Gqv2BDkNZFJoqAapaWJ348U7FP9189CXu9cgwt5XHA==
X-Google-Smtp-Source: ABdhPJzLjhgwVK0UE9Yi9JBkWmC3y7WOIiS6b8sefkd91JcSBdS9dhs2hfta9KF6j1qRTXSeWCJ2shJzrnxnDEy8xAs=
X-Received: by 2002:a4a:d818:: with SMTP id f24mr778429oov.25.1642017645715;
 Wed, 12 Jan 2022 12:00:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Jan 2022 12:00:45 -0800
MIME-Version: 1.0
In-Reply-To: <1641926606-1012-2-git-send-email-quic_khsieh@quicinc.com>
References: <1641926606-1012-1-git-send-email-quic_khsieh@quicinc.com>
 <1641926606-1012-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 12 Jan 2022 12:00:45 -0800
Message-ID: <CAE-0n53hrPYR3ThwxM_+fzyRSB+6W1drFymW5n_RKmg_gf8z-w@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] drm/msm/dp: do not initialize phy until plugin
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

Quoting Kuogee Hsieh (2022-01-11 10:43:23)
> Current DP drivers have regulators, clocks, irq and phy are grouped
> together within a function and executed not in a symmetric manner.
> This increase difficulty of code maintenance and limited code scalability.
> This patch divides the driver life cycle of operation into four states,
> resume (including booting up), dongle plugin, dongle unplugged and suspend.
> Regulators, core clocks and irq are grouped together and enabled at resume
> (or booting up) so that the DP controller is armed and ready to receive HPD
> plugin interrupts. HPD plugin interrupt is generated when a dongle plugs
> into DUT (device under test). Once HPD plugin interrupt is received, DP
> controller will initialize phy so that dpcd read/write will function and
> following link training can be proceeded successfully. DP phy will be
> disabled after main link is teared down at end of unplugged HPD interrupt
> handle triggered by dongle unplugged out of DUT. Finally regulators, code
> clocks and irq are disabled at corresponding suspension.

I'll write out the various scenarios

#1
	dongle plugged in with HDMI cable attached
	driver probe

#2
	dongle unplugged
	driver probe

#3
	dongle plugged in without HDMI cable attached
	driver probe

#4
	driver probe
	dongle plugged in without HDMI cable attached


#5
	driver probe
	dongle plugged in with HDMI cable attached

#6
	driver probe
	dongle plugged in
	suspend
	resume

#7
	driver probe
	dongle plugged in
	suspend
	dongle unplugged
	resume

#8
	driver probe
	dongle plugged in without HDMI cable attached
	suspend
	resume

#9
	driver probe
	dongle plugged in without HDMI cable attached
	suspend
	HDMI cable attached during suspend
	resume

What's the state of the phy and core initialized variable at the end of
each of these scenarios? Please fill out the truth table.

		  +-----------------+------------------------
                  |    false        |       true            |
		  +-----------------+------------------------
 phy_initialized  |                 |                       |
		  +-----------------+------------------------
 core_initialized |                 | #1,                   |
		  +-----------------+------------------------

I guess we also need eDP scenarios, but that's probably simpler

#10
	eDP panel connected
	driver probe

#11
	eDP panel disconnected
	driver probe

#12
	eDP panel disconnected
	driver probe
	suspend
	resume

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21..f6bb4bc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -83,6 +83,7 @@ struct dp_display_private {
>
>         /* state variables */
>         bool core_initialized;
> +       bool phy_initialized;
>         bool hpd_irq_on;
>         bool audio_supported;
>
> @@ -372,21 +373,46 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
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
>                 DRM_DEBUG_DP("DP core already initialized\n");
>                 return;
>         }
>
> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
> -               flip = true;
> +       dp_power_init(dp->power, false);
> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
> +
> +       /*
> +        * eDP is the embedded primary display and has its own phy
> +        * initialize phy immediately

Question still stands why we can't wait for hpd high from the eDP panel.
Also, I think "has its own phy" means that it's not part of a combo
USB+DP phy? Can you please clarify?

> +        */
> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
> +               dp_display_host_phy_init(dp);
>
> -       dp_power_init(dp->power, flip);
> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
>         dp_aux_init(dp->aux);
>         dp->core_initialized = true;
>  }
> @@ -1306,20 +1330,23 @@ static int dp_pm_resume(struct device *dev)
>         dp->hpd_state = ST_DISCONNECTED;
>
>         /* turn on dp ctrl/phy */
> -       dp_display_host_init(dp, true);
> +       dp_display_host_init(dp);
>
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
> -       /*
> -        * set sink to normal operation mode -- D0
> -        * before dpcd read
> -        */
> -       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>
>         if (dp_catalog_link_is_connected(dp->catalog)) {
> +               /*
> +                * set sink to normal operation mode -- D0
> +                * before dpcd read
> +                */
> +               dp_display_host_phy_init(dp);
> +               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>                 sink_count = drm_dp_read_sink_count(dp->aux);
>                 if (sink_count < 0)
>                         sink_count = 0;
> +
> +               dp_display_host_phy_exit(dp);

Why is the phy exited on resume when the link is still connected? Is
this supposed to be done only when the sink_count is 0? And how does
this interact with eDP where the phy is initialized by the call to
dp_display_host_init() earlier in this function.

>         }
>
>         dp->link->sink_count = sink_count;
> @@ -1366,6 +1393,8 @@ static int dp_pm_suspend(struct device *dev)
>                 dp_display_host_deinit(dp);
>         }
>
> +       dp_display_host_phy_exit(dp);
> +
>         dp->hpd_state = ST_SUSPENDED;
>
>         /* host_init will be called at pm_resume */
