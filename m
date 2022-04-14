Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8425002E2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 02:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E339F10E1FB;
	Thu, 14 Apr 2022 00:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68CF10E1FB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 00:02:55 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s1so3760083oie.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 17:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=C7D4i18WnxrgBXf4shxFqYln81+Lfr4ATkdTNtqU2ck=;
 b=W/ZABInJ4czkJM0vDyGAwz3yEFAMCEvHtVtCMDXOfyAgDwS2wBCaP2hw7blb+saGYC
 k2L9RxkO1rbutRE9dOvAdtQOz46YmvYGCkUHPJp2yfGN9HPkVKSrcMZpIFFhahvFsC0j
 1g9Ny3Ibq+nxS9D+C4zgzsbe4tqNZ8PgNwzUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=C7D4i18WnxrgBXf4shxFqYln81+Lfr4ATkdTNtqU2ck=;
 b=EHAZ6CAurMK7yPiDdKxdDgJhzvhq9F8zoUB4w9zqOPo6bppjs+ZhHxpf1+lmk37wwY
 HRVpKBI0j9MwuG9j6fdyoSHXIKHBsz/xEBtPd+s4ZwDVdu/wJ1veFJQRDRyeYSa2t+nT
 lgtgnj8QUzCDBZlv88W3zTQqof55CMjjoszIcPUBoNwC4TUGOhnPxxB/noHy+euXj/UA
 d4ej7vH0OHNUN/EEZSUDRz7MmcR1DOqGoefdEn5z/F6PXOe45M/mR2RzDgHjHMwYzTIA
 u565+c+L3LK+TNyHv/+Fwy55KZZBKqsdyO0SK3tKQHM+McFrfFHhNP63/LIfZRKOLTU8
 abBQ==
X-Gm-Message-State: AOAM533hvhmeZhv+5Xv3q9ecpF+MsiudnBJiYOye8u+dv37c8h/H5SOb
 V/aGwh9U6yeAVirL9r4NazMpABo92nQ3ohzLLSQRDQ==
X-Google-Smtp-Source: ABdhPJzp2cTMSMi7Tz42NyDd50anioDt8Jea6q6Rz9Ad1fmvO4ymY/ZP6diGOQmXMoE+vv2JGFKQrFhNXF1AbVQ6YkY=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr265612oif.63.1649894574930; Wed, 13 Apr
 2022 17:02:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Apr 2022 17:02:54 -0700
MIME-Version: 1.0
In-Reply-To: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 13 Apr 2022 17:02:54 -0700
Message-ID: <CAE-0n511nbPrRCMx3E2De-htmR79vZr4ezSj13Gm1PbTGasC4A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
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

The subject is still misleading. It is fixing something. It may be
enhancing it as well but it is clearly fixing it first.

Quoting Kuogee Hsieh (2022-04-06 14:28:13)
> dp_hpd_plug_handle() is responsible for setting up main link and send
> uevent to notify user space framework to start video stream. Similarly,
> dp_hdp_unplug_handle is responsible to send uevent to notify user space
> framework to stop video stream and then tear down main link.
> However there are rare cases, such as in the middle of system suspending,
> that uevent could not be delivered to user space framework. Therefore
> some kind of recover mechanism armed by timer need to be in place in the
> case of user space framework does not respond to uevent.
>
> This patch have both dp_conenct_pending_timeout and
> dp_disconnect_pending_timeout are used to stop video stream and tear down
> main link and eventually restore DP driver state to known default
> DISCONNECTED state in the case of timer fired due to framework does not
> respond to uevent so that DP driver can recover itself gracefully at next
> dongle unplug followed by plugin event.
>
> Changes in v2:
> -- replace dp_display_usbpd_disconnect_cb with dp_display_notify_disconnect

I'd prefer this part to be a different patch. It can come after the fix
to ease backporting.

Also, is there any response to Dmitry's question yet? I haven't seen
anything.

> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 2433edb..ffafe17 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -22,6 +22,7 @@ struct dp_ctrl {
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
> +int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
>  void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
>  void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 178b774..a6200a5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -451,11 +451,14 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>
>  static int dp_display_usbpd_disconnect_cb(struct device *dev)

We shouldn't need to keep around an empty function.

>  {
> +       return 0;
> +}
> +
> +static void dp_display_notify_disconnect(struct device *dev)
> +{
>         struct dp_display_private *dp = dev_get_dp_display_private(dev);
>
>         dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> -
> -       return 0;
>  }
>
>  static void dp_display_handle_video_request(struct dp_display_private *dp)
> @@ -593,10 +596,16 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>
>         mutex_lock(&dp->event_mutex);
>
> +       /*
> +        * main link had been setup but video is not ready yet
> +        * only tear down main link
> +        */
>         state = dp->hpd_state;
>         if (state == ST_CONNECT_PENDING) {
> -               dp->hpd_state = ST_CONNECTED;
>                 DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
> +               dp_ctrl_off_link(dp->ctrl);
> +               dp_display_host_phy_exit(dp);
> +               dp->hpd_state = ST_DISCONNECTED;
>         }
>
>         mutex_unlock(&dp->event_mutex);
> @@ -645,6 +654,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>                 if (dp->link->sink_count == 0) {
>                         dp_display_host_phy_exit(dp);
>                 }
> +               dp_display_notify_disconnect(&dp->pdev->dev);
>                 mutex_unlock(&dp->event_mutex);
>                 return 0;
>         }
> @@ -661,19 +671,22 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>
> -       dp->hpd_state = ST_DISCONNECT_PENDING;
> -
>         /* disable HPD plug interrupts */
>         dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
>
>         /*
>          * We don't need separate work for disconnect as
>          * connect/attention interrupts are disabled
> -        */
> -       dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
> +       */

This comment end is wrong. It should be unchanged.

> +       dp_display_notify_disconnect(&dp->pdev->dev);
>
> -       /* start sentinel checking in case of missing uevent */
> -       dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
> +       if (state == ST_DISPLAY_OFF) {
> +               dp->hpd_state = ST_DISCONNECTED;
> +       } else {
> +               /* start sentinel checking in case of missing uevent */
> +               dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
> +               dp->hpd_state = ST_DISCONNECT_PENDING;
> +       }
>
>         /* signal the disconnect event early to ensure proper teardown */
>         dp_display_handle_plugged_change(&dp->dp_display, false);
> @@ -695,10 +708,16 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
>
>         mutex_lock(&dp->event_mutex);
>
> +       /*
> +        * main link had been set up and video is ready
> +        * tear down main link, video stream and phy
> +        */
>         state =  dp->hpd_state;
>         if (state == ST_DISCONNECT_PENDING) {
> -               dp->hpd_state = ST_DISCONNECTED;
>                 DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
> +               dp_ctrl_off(dp->ctrl);
> +               dp_display_host_phy_exit(dp);
> +               dp->hpd_state = ST_DISCONNECTED;
>         }
>
>         mutex_unlock(&dp->event_mutex);
