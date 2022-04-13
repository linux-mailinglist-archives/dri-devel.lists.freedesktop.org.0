Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB01500273
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 01:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D2510F1E0;
	Wed, 13 Apr 2022 23:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0264B10F1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 23:19:59 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso2227291otp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 16:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=A76+qe6l2R4PjtaHOG75B4+IXG7YG12PDKm5b7n2jWs=;
 b=SHoATc0eEmqjjIwRKvexraebmX2kGeRzptDhV06lGjHycAYMT+TOpWHUuC00JxUOTj
 RHHtsMgFG+ZIU6axzwN0FQc7X9fdSEWHjTK8L/jGvPcI/8iNhZQrE7OwFAp/5b5lWymZ
 ZpFMog5M4McPKnPsUbvdTa8nAmF0nFb1cEDYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=A76+qe6l2R4PjtaHOG75B4+IXG7YG12PDKm5b7n2jWs=;
 b=Vx726YL92iQpKWAhi4LrAoLVGY9xgo0Jk4fbZYD9Mj9ZUs/qoxRDqS/iOsRWKWS+Mg
 lGz6ho9c2Ac6415Ifrwry7DklR1vESSA6HsGWgOgVyqFsH6yBlGmOKCBLa5kK7FatFHN
 qrBoxL9I+viP4xgg2SKt0x0abDViocXPdIHkMq4nD7T5zL4JTDORnC3Urpps6yNnjeeI
 OK4GF9IIB4ehBDrO/sT5JFpdnW7sl0Udg5dKMjynObaZJPOSk5ekY/H87V7o74RlhbLv
 7BYPKR99zcWtbv4vXJgUuMLkIlGUvVXAiJy1ZMa4MWB7Kw2T1MmR9Q0psmYVscExPB4W
 dI0Q==
X-Gm-Message-State: AOAM5312gZIz2mCicHa+ZwTzf1PkWCdF7VpYJy4MvT+S+LiyGSIsa11M
 QHPeFYq5r2tww6NiI7oZ/24/vyYW+Fcculat0VkG6Q==
X-Google-Smtp-Source: ABdhPJz4zQOvWO+Ka65MElptgAevAeXuKyDHAfQnJYr8K685AAWqQ2cIPgcN1VMnmhtkiEpddCxTwpmuwEtmVKjoZ5o=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr10346oth.77.1649891999102; Wed, 13 Apr
 2022 16:19:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Apr 2022 16:19:58 -0700
MIME-Version: 1.0
In-Reply-To: <1649883865-9012-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649883865-9012-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 13 Apr 2022 16:19:58 -0700
Message-ID: <CAE-0n5259qjMj12LXRp=7kQ7zT3bRMaHpSpwKMwZ8HL6rq7fbw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: stop event kernel thread when DP unbind
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

Quoting Kuogee Hsieh (2022-04-13 14:04:25)
> Current DP driver implementation, event thread is kept running
> after DP display is unbind. This patch fix this problem by disabling
> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>
> Changes in v2:
> -- start event thread at dp_display_bind()
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 40 +++++++++++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..943e4f1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -113,6 +113,7 @@ struct dp_display_private {
>         u32 hpd_state;
>         u32 event_pndx;
>         u32 event_gndx;
> +       struct task_struct *ev_tsk;
>         struct dp_event event_list[DP_EVENT_Q_MAX];
>         spinlock_t event_lock;
>
> @@ -230,6 +231,31 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>         complete_all(&dp->audio_comp);
>  }
>
> +static int hpd_event_thread(void *data);

Is there a reason why this is needed vs. defining the kthread start
function after hpd_event_thread()?

> +
> +static void dp_hpd_event_setup(struct dp_display_private *dp_priv)

Maybe dp_hpd_event_thread_start()?

> +{
> +       init_waitqueue_head(&dp_priv->event_q);
> +       spin_lock_init(&dp_priv->event_lock);
> +
> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +
> +       if (IS_ERR(dp_priv->ev_tsk))
> +               DRM_ERROR("failed to create DP event thread\n");

Can we return an error from this function?

> +}
> +
> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv)

Maybe dp_hpd_event_thread_stop()?

> +{
> +       if (IS_ERR(dp_priv->ev_tsk))
> +               return;

If we handled the error then this check becomes impossible.

> +
> +       kthread_stop(dp_priv->ev_tsk);
> +
> +       /* reset event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
> +}
> +
>  static int dp_display_bind(struct device *dev, struct device *master,
>                            void *data)
>  {
> @@ -269,6 +295,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         if (rc)
>                 DRM_ERROR("Audio registration Dp failed\n");
>
> +       dp_hpd_event_setup(dp); /* start event thread */

The comment is useless, please remove.

>  end:
>         return rc;
>  }
> @@ -280,6 +307,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
>
> +       disable_irq(dp->irq);

Is the disable_irq() necessary? It would be nicer to silence the
hardware and remove the disable_irq() so that we can reason about the
code assuming the irq is always enabled after it is requested.

> +       dp_hpd_event_stop(dp); /* stop event thread */
>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
>         priv->dp[dp->id] = NULL;
