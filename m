Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1E5502F5B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 21:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3973110E2DB;
	Fri, 15 Apr 2022 19:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7739E10E2DB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 19:43:09 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 p34-20020a4a95e5000000b003248d73d460so1516585ooi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 12:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=d8U0beeOnRgpffBKA26u/nuFILvGpJKtOOLZ6tEr+hI=;
 b=OubeX/VjHjycjXmUUBY+EXLYUTjpyMeN0CjFecikN3Os5nY3jnDY+L58kLzteBD8dX
 oqZ3xQmv29vpTtqEYXNB3e40dIGNWI+0MWGRrnEz0h4E1VFSePJpyva9XXw0HZl4abrM
 TLeEKUhj9bEmKU6XZ/q3dcpwQAZtzq+Kgl2Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=d8U0beeOnRgpffBKA26u/nuFILvGpJKtOOLZ6tEr+hI=;
 b=DIOV0WShXxREny7dbXeroItFYbG2APFqhzAirP1OnSXFHz8AWEACgWvMx7gmQia9qH
 XODOgb4E4wrVTo/nLioy++lO3drTktWjyqQwXqNlNq5xcZdU8Hag4k9UPXCrCjLegyv/
 Qh/snDSdcNm6ADcHqC+mX3JWnMCt7Ih03x1mLTricdgoo+YEnwAvShp8KS8uF5FNxvL/
 4Aw+oP2sDZb1VIoXZUYdUN6EbxeiYp3O5EEa6bjLIg32J5XLhZM92obSr1loR033gTk7
 0L1sWTa4QL9hOL78YOvuDjulnrh2/1s5ok2874p4Qz0iMHbbI+lpIjGt4OTJmybfbrI0
 fmtw==
X-Gm-Message-State: AOAM531czcuO2Rk9XP364WUW5gPERKiCQxFkrkjQs6WLk3fmJjOasoxJ
 831u6jikzTpQd+CpI0AJKG3l0l2jlXj7fgLU5hmDdA==
X-Google-Smtp-Source: ABdhPJwfzYrDMaHMqxqa+9iMCFn6F9al3KfQl7uVpDg7xlLlpCKzQ+uq2y0In5Wy24FshAbV42giP5SSmXcgRFrWLpY=
X-Received: by 2002:a4a:6b49:0:b0:329:99cd:4fb8 with SMTP id
 h9-20020a4a6b49000000b0032999cd4fb8mr196501oof.25.1650051788795; Fri, 15 Apr
 2022 12:43:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 Apr 2022 12:43:08 -0700
MIME-Version: 1.0
In-Reply-To: <1650037276-27812-1-git-send-email-quic_khsieh@quicinc.com>
References: <1650037276-27812-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 15 Apr 2022 12:43:08 -0700
Message-ID: <CAE-0n52aQdKUYojgGM+C-FEJeEzuRrHCNSBM8rUDxh+Qp-FUnA@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: stop event kernel thread when DP unbind
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

Quoting Kuogee Hsieh (2022-04-15 08:41:16)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..92c9819 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -230,6 +231,14 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>         complete_all(&dp->audio_comp);
>  }
>
> +static void dp_hpd_event_thread_stop(struct dp_display_private *dp_priv)
> +{
> +       kthread_stop(dp_priv->ev_tsk);
> +
> +}
> +
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv);
> +
>  static int dp_display_bind(struct device *dev, struct device *master,
>                            void *data)
>  {
> @@ -280,6 +290,9 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
>
> +       /* disable all HPD interrupts */
> +       dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +       dp_hpd_event_thread_stop(dp);

It's a one line function. How about just

	kthread_stop(dp->ev_tsk)

>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
>         priv->dp[dp->id] = NULL;
