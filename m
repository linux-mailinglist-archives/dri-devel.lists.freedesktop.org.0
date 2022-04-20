Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F1E5092F6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 00:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBC710E34F;
	Wed, 20 Apr 2022 22:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2DA10E2CD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 22:38:28 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so3555763fac.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 15:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/rRRLR9kE0UsT6jhXgLECvjHWzInHv7i/Qn/WtRO8eU=;
 b=hK1r1BG7T0Nz6Vn2cw68wwOg6ikctBqlfOV9F+gJDmElgDZ4iZRG77Cw6YUCiRWwQA
 rs0ORNthVZDv3S/J3z0jPlLXrzuo+N7qnkTw8R3X8NWBtp7eK1MqfkT+UQkvhhnYY7I1
 bK2SUIwL2ZtsM8r02D9x+n4vIf25M2gYYqhaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/rRRLR9kE0UsT6jhXgLECvjHWzInHv7i/Qn/WtRO8eU=;
 b=YimNGTzKFlcP+g3KuALNdTxIOYMBUL98ijo8gyk+I1J6beF6ZV/VRroBvS0ylyAthI
 EtoOyLNVibCQ8MnjNKfafr2Ol/wdQYxLAuNioGQc3n+Lqfo1/uW0E1AEbgpqdL8vDJ4P
 kFFLzAn4vvj/h661pRqncDiQfmLUs2SAcRL5u5Jl5bp541r24ND+8p2rS9SWSkVofz2l
 m7/Dp39LCO41pArBis0W3XmjPuJQGxmAlxmaldFdjn/0TIMm8KjSXIs6iJJaQBeXxuvP
 Yzl3RDsPzp/kW1NiFU2yvgeMy7RmX21lwdmnPc3No/WQIvkj4wLNaB8laIP60pa3colV
 CptA==
X-Gm-Message-State: AOAM530uOlvINgXoUdtV/7O+zkkULnJZG9iFNq3SeUnEctdpmGKVLC9Q
 pi7pzInRnSckXXxggskjimx8C+r3iJh9+KyrFJuURA==
X-Google-Smtp-Source: ABdhPJwc+/m0+yq1Mgm3+YSVCSpplRV3ESAb28i5fAuMo4awoMqGV1hwY1Twa5AGi1Daxfb7lgwYR29LBqcIdF28l3Y=
X-Received: by 2002:a05:6870:d7a2:b0:de:a29c:2aa with SMTP id
 bd34-20020a056870d7a200b000dea29c02aamr2649398oab.121.1650494307865; Wed, 20
 Apr 2022 15:38:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Apr 2022 15:38:27 -0700
MIME-Version: 1.0
In-Reply-To: <1649970223-9522-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649970223-9522-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 20 Apr 2022 15:38:27 -0700
Message-ID: <CAE-0n51rp73v6tod98TX3Y_q8TuOppJVdm9Te_9kSNyqyFuoog@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: tear down main link at unplug handle
 immediately
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
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-14 14:03:43)
> Two stages are required to setup up main link to be ready to transmit
> video stream.
> Stage 1: dp_hpd_plug_handle() perform link training to set up main link
> stage 2: user space framework (msm_dp_display_enable()) to enable pixel
> clock and transfer main link to video ready state.
>
> At current implementation, when dongle unplugged dp_hdp_unplug_handle()
> has to wait until stage 2 completed before it can send link down uevent
> to user space framework to disable pixel clock followed by tearing down
> main link.  This introduce unnecessary latency if dongle unplugged happen
> after stage 1 and before stage 2. It also has possibility leave main link
> stay at ready state after dongle unplugged if framework does not response
> to link down uevent notification. This will prevent next dongle plug in
> from working. This scenario could possibly happen when dongle unplug while
> system in the middle of suspending.
>
> This patch allow unplug handle to tear down main link and notify
> framework link down immediately if dongle unplugged happen after
> stage 1 and before stage 2. With this approach, dp driver is much
> more resilient to any different scenarios. Also redundant both
> dp_connect_pending_timeout() and dp_disconnect_pending_timeout()
> are removed to reduce logic complexity.
>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Some questions below but doesn't seem like it will hold up this patch.

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..f5bd8f5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -615,24 +598,21 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>                 if (dp->link->sink_count == 0) {
>                         dp_display_host_phy_exit(dp);
>                 }
> +               dp_display_notify_disconnect(&dp->pdev->dev);
>                 mutex_unlock(&dp->event_mutex);
>                 return 0;
> -       }
> -
> -       if (state == ST_DISCONNECT_PENDING) {
> +       } else if (state == ST_DISCONNECT_PENDING) {
>                 mutex_unlock(&dp->event_mutex);
>                 return 0;
> -       }
> -
> -       if (state == ST_CONNECT_PENDING) {
> -               /* wait until CONNECTED */
> -               dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 1); /* delay = 1 */
> +       } else if (state == ST_CONNECT_PENDING) {

I take it that ST_CONNECT_PENDING is sort of like "userspace hasn't
handled the uevent yet and modeset hasn't been called but the link is
setup and now we want to tear it down". The state name may want to be
changed to something else.

> +               dp_ctrl_off_link(dp->ctrl);
> +               dp_display_host_phy_exit(dp);
> +               dp->hpd_state = ST_DISCONNECTED;
> +               dp_display_notify_disconnect(&dp->pdev->dev);
>                 mutex_unlock(&dp->event_mutex);
>                 return 0;
>         }
>
> -       dp->hpd_state = ST_DISCONNECT_PENDING;
> -
>         /* disable HPD plug interrupts */
>         dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
>
> @@ -640,10 +620,13 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>          * We don't need separate work for disconnect as
>          * connect/attention interrupts are disabled
>          */
> -       dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
> +       dp_display_notify_disconnect(&dp->pdev->dev);
>
> -       /* start sentinel checking in case of missing uevent */
> -       dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
> +       if (state == ST_DISPLAY_OFF) {
> +               dp->hpd_state = ST_DISCONNECTED;
> +       } else {
> +               dp->hpd_state = ST_DISCONNECT_PENDING;
> +       }

Nitpick: No braces needed for single line if clauses.

>
>         DRM_DEBUG_DP("hpd_state=%d\n", state);
>         /* signal the disconnect event early to ensure proper teardown */
> @@ -1529,8 +1480,11 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>
>         mutex_lock(&dp_display->event_mutex);
>
> -       /* stop sentinel checking */
> -       dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
> +       state = dp_display->hpd_state;
> +       if (state != ST_DISPLAY_OFF && state != ST_CONNECT_PENDING) {

Is this to guard against userspace doing an atomic commit when the
display isn't connected? Is that even possible?

> +               mutex_unlock(&dp_display->event_mutex);
> +               return rc;
> +       }
>
>         rc = dp_display_set_mode(dp, &dp_display->dp_mode);
>         if (rc) {
