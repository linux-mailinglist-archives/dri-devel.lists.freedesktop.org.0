Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4221D4FC935
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080A810E18C;
	Tue, 12 Apr 2022 00:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD55A10FA8F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:21:04 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id z8so17478273oix.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 17:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=y7Y1GROIPsSLxY9do07YZACd9MWDSI2F+M+lT+f9eTo=;
 b=HJgEFPK74D/NzNz5ewjQS1D3WZjnbn6QPFbqVtlhSvkdtZrvSBMTVSWXksPTipI0T0
 uIqntfRaCN+XM2SobWYamTU+fzXI4do20kvZmAFLXkApFfG0I0RWihEspBxiqL5Ohv9S
 RHrhVCX3aEVON9iRfWjDEisKAVzxYtFIOGtyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=y7Y1GROIPsSLxY9do07YZACd9MWDSI2F+M+lT+f9eTo=;
 b=eU4fjnPKTU03VKmt1CtI/WqFbEHX8MO+aB6Jm4xVohYSEvGTCOfqzQ1LHdkwpF19Zn
 QcagOQzqP4gwpMFGHcC91YDMBCC2PWdOIKDHql62l+JCeW6Hjc2W+nVDuiUMC+k1JUXi
 uHpJSCw0g67pAde8WODL5JmzPdcweQA6+7ZNmJSycjd0YS4t9XA86khlTvqY3QyFrmy2
 QZ185qrqqRtD8PgLwJPeCAtYHo3d4ZshTyBeqKFPCZysyPnHzxRSUpBeMioOcnTpABFv
 xIlfqUHBpVg3MLdM1NVEoZnzlaSPjzCSFNviMed1er/02+xl3kedGLcOVBJbWYyzN1UX
 dk0A==
X-Gm-Message-State: AOAM531Z1EkjixxarXxYbqfOXrglFr6gr9LKDh+7eNSyrkSZ69gjr3He
 LlVGLKEqlISVsb0FgN9RLRGkSWfWRtrSRW3cfKWa/A==
X-Google-Smtp-Source: ABdhPJw/3jAU3O/Kq+1TUpmeh35Qr9Tn/HpTVk9i7/UR2pAUgLJf83vv627lUOfEnAPl1s5WNjyIbdnff/jjSlRos9o=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr682476oif.63.1649722864112; Mon, 11 Apr
 2022 17:21:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Apr 2022 20:21:03 -0400
MIME-Version: 1.0
In-Reply-To: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 11 Apr 2022 20:21:03 -0400
Message-ID: <CAE-0n53zYpqJL9GCoqZRwMptCne+4Dk4thz-7rCDac7H98dm=A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: stop event kernel thread when DP unbind
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

Quoting Kuogee Hsieh (2022-04-11 17:08:49)
> Current DP driver implementation, event thread is kept running
> after DP display is unbind. This patch fix this problem by disabling
> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Should add a Reported-by tag from Dmitry here.

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..fa1ef8e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -273,6 +274,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         return rc;
>  }
>
> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv);

Why can't the function be defined here?

> +
>  static void dp_display_unbind(struct device *dev, struct device *master,
>                               void *data)
>  {
> @@ -280,6 +283,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
>
> +       disable_irq(dp->irq);
> +       dp_hpd_event_stop(dp);
>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
>         priv->dp[dp->id] = NULL;
> @@ -1054,7 +1059,7 @@ static int hpd_event_thread(void *data)
>
>         dp_priv = (struct dp_display_private *)data;
>
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 if (timeout_mode) {
>                         wait_event_timeout(dp_priv->event_q,
>                                 (dp_priv->event_pndx == dp_priv->event_gndx),
> @@ -1137,7 +1142,22 @@ static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
>         init_waitqueue_head(&dp_priv->event_q);
>         spin_lock_init(&dp_priv->event_lock);
>
> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +
> +       if (IS_ERR(dp_priv->ev_tsk))
> +               DRM_ERROR("failed to create DP event thread\n");

Why can't we error out? Why can't this kthread be started in probe?

> +}
> +
> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv)
> +{
> +       if (IS_ERR(dp_priv->ev_tsk))
> +               return;
> +
> +       kthread_stop(dp_priv->ev_tsk);
> +
> +       /* reset event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
>  }
>
