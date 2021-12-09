Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D994A46EDF5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1C510E1FB;
	Thu,  9 Dec 2021 16:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF7E10E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 06:14:01 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso5126903otj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 22:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=1cPZqZQ5XXpMaeXUoSIDgfs6PiXbab5Qo1dirmlsOlA=;
 b=VzmkGZ3e4DQTeu+cm8+BfcJ+4iQ2lFk6VPcFAMJe0T5RRdo5W1M00anDghybC/iCRT
 DBplnY4kGe5ydtSRL6Pyhr+R7t/TnEa9Aw/NjHcScYFZ+jyk34ZF6O/fMLqb9KSFwtvJ
 f6HIqbOFwhGIhW9G0sSgIlUocZYE2nQCJQKf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=1cPZqZQ5XXpMaeXUoSIDgfs6PiXbab5Qo1dirmlsOlA=;
 b=oEWaQc8ovVNjl7/OJGC6qsmnlQxUmgVjidPzIar/Ut3cu4+m19fOF1MXBVUYZ9dZP7
 jw4gR48rB5lTe/mtLWDNZzkegdS1/ehXi/Pmy3AcZZV9XxZXIPWPm8afFiQYcKUYIfcq
 g5WxFj8YMdN6JM9k/di5m3Jmk1rYOanrSa/AJoyZRkGV+tD67SQkz/1Jmt8fnttGfqnY
 wi9wIFZ1/dZpwAo3KRT4Y7yPY/e1DvMWQ3UVbdfA/xfZ+o0Kw9kkHWSyPBDeO4yBlNR2
 odn3ulF1s8q1LEBjPmV1lzf7K0fj/QZ3zpMFjSMyLKgdAjE1Q57zyLy1U2+g9WDcHCNl
 yNGA==
X-Gm-Message-State: AOAM530uulungQeGYfOIGdhdDLtw0H+325PqUh/MKcdBBnnh89iWCy5d
 rObwXn57WRwYyArx5rN83TqjFH22tDdNIeeIsS1DcpUK/tQ=
X-Google-Smtp-Source: ABdhPJyoJSGOo1mM1QKF1JzR3sT6eRKKjdIs0+cvyUHpEHJf6dwy3NkEIFu8fRXaRrmyr7f1SsjvXyf4wwkyeLfUegc=
X-Received: by 2002:a05:6830:30b7:: with SMTP id
 g23mr3130288ots.159.1639019719943; 
 Wed, 08 Dec 2021 19:15:19 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Dec 2021 19:15:19 -0800
MIME-Version: 1.0
In-Reply-To: <1638995784-30187-1-git-send-email-quic_khsieh@quicinc.com>
References: <1638995784-30187-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 8 Dec 2021 19:15:19 -0800
Message-ID: <CAE-0n50pU9uuSvFNOJYksH=e6L_69JyA2V7Y8wiwp+qjTtk=tQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-12-08 12:36:24)
> Current DP drivers have regulators, clocks, irq and phy are grouped
> together within a function and executed not in a symmetric manner.
> This increase difficulty of code maintenance and limited code scalability.
> This patch divided the driver life cycle of operation into four states,

s/divided/divides/

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
>
> Changes in V2:
> -- removed unnecessary dp_ctrl NULL check
> -- removed unnecessary phy init_count and power_count DRM_DEBUG_DP logs
> -- remove flip parameter out of dp_ctrl_irq_enable()
> -- add fixes tag
>
> Changes in V3:
> -- call dp_display_host_phy_init() instead of dp_ctrl_phy_init() at
>         dp_display_host_init() for eDP
>
> Changes in V4:
> -- rewording commit text to match this commit changes
>
> Changes in V5:
> -- rebase on top of msm-next branch
>
> Changes in V6:
> -- delete flip variable
>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 87 ++++++++++++++++---------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 ++--
>  drivers/gpu/drm/msm/dp/dp_display.c | 81 ++++++++++++++++++++++++----------
>  3 files changed, 102 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index c724cb0..7f0d647 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1365,60 +1365,54 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
>         return ret;
>  }
>
> -int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
> +void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl)
> +{
> +       struct dp_ctrl_private *ctrl;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       dp_catalog_ctrl_reset(ctrl->catalog);
> +
> +       dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
> +}
> +
> +void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl)
> +{
> +       struct dp_ctrl_private *ctrl;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       dp_catalog_ctrl_reset(ctrl->catalog);
> +
> +       dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
> +}

The above could be one function with true/false for enable wrappers and
be a little shorter or the same length. It would also avoid problems if
the sequence needs to change. But speaking of that sequence, why doesn't
a dp_catalog_ctrl_reset() disable the irq automatically? I'd think we
could simply reset the whole controller for irq disable? But then,
shouldn't we only reset the controller on the enable path and only
disable the irq bits on irq_disable? If not, then the function name is
misleading. We're resetting the dp controller and enabling or disabling
irqs.

> +
> +void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>  {
>         struct dp_ctrl_private *ctrl;
>         struct dp_io *dp_io;
>         struct phy *phy;
>
> -       if (!dp_ctrl) {
> -               DRM_ERROR("Invalid input data\n");
> -               return -EINVAL;
> -       }
> -
>         ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>         dp_io = &ctrl->parser->io;
>         phy = dp_io->phy;
>
> -       ctrl->dp_ctrl.orientation = flip;
> -
> -       if (reset)
> -               dp_catalog_ctrl_reset(ctrl->catalog);
> -
> -       DRM_DEBUG_DP("flip=%d\n", flip);
>         dp_catalog_ctrl_phy_reset(ctrl->catalog);
>         phy_init(phy);
> -       dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
> -
> -       return 0;
>  }
>
[...]
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d44f18b..0a53066 100644
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
> @@ -375,21 +376,46 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
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

Does it turn on with the registers in some unknown state? It feels like
dp_power_init() turning on the regulators and clks would bring it into a
power on reset state, so the reset inside dp_ctrl_irq_enable() isn't
necessary.

> +       dp_ctrl_irq_enable(dp->ctrl);
> +
> +       /*
> +        * eDP is the embedded primary display and has its own phy
> +        * initialize phy immediately
> +        */
> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
> +               dp_display_host_phy_init(dp);
>
> -       dp_power_init(dp->power, flip);
> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
>         dp_aux_init(dp->aux);
>         dp->core_initialized = true;
>  }
> @@ -401,7 +427,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>                 return;
>         }
>
> -       dp_ctrl_host_deinit(dp->ctrl);
> +       dp_ctrl_irq_disable(dp->ctrl);
>         dp_aux_deinit(dp->aux);
>         dp_power_deinit(dp->power);
>
> @@ -412,7 +438,7 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>  {
>         struct dp_display_private *dp = dev_get_dp_display_private(dev);
>
> -       dp_display_host_init(dp, false);
> +       dp_display_host_phy_init(dp);
>
>         return dp_display_process_hpd_high(dp);
>  }
> @@ -536,7 +562,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>                 dp->hpd_state = ST_DISCONNECTED;
>
>                 if (ret == -ECONNRESET) { /* cable unplugged */
> -                       dp->core_initialized = false;
> +                       dp->phy_initialized = false;
>                 }
>
>         } else {
> @@ -698,7 +723,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>
>         ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>         if (ret == -ECONNRESET) { /* cable unplugged */
> -               dp->core_initialized = false;
> +               dp->phy_initialized = false;

Won't this conflict with
https://lore.kernel.org/r/1638985262-2072-1-git-send-email-quic_khsieh@quicinc.com
that was sent around the same time? Can you combine your outstanding
patches into one patch series and send them together so we don't get
conflicts?

>         }
>         DRM_DEBUG_DP("hpd_state=%d\n", state);
>
