Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0355031E7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 01:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE2010E49F;
	Fri, 15 Apr 2022 23:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541BD10E541
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 23:40:42 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id m132so16688765ybm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8YKUw09FELNHdHoXG8C1HaoaiZdEDTwC86o2ZnFgkKU=;
 b=EtnRm9hXfFYzr/WZ+UUFlGBkzHsWZ37z67TAtAN58v8+mGS/KGKcjN6vMcxKqGOJMd
 5EsBp+hJVb8XSItbij9lZldXAk6AIvSh/2jVYhu5U4wi9jLQdrcjgZA691aX2KM03Lsf
 IwziwLzs4rgY5otH+KzKAuw7mLZliCmipsYS7/90lMiVaroETXBu4MLTdWT06hKBIN05
 gW1s7SNHkh30uX0+EQnmZwhq1YJyX8BCiS1X6tsUinpsCZtFztsXufZrP7qtni/5B3ol
 G2th6HVbl3aDLY6NJ2eWYJMrN7Y39vqufJTf6BVKRWrOTUQd2ITmhr1O1q2r8AbNUBDx
 Hidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8YKUw09FELNHdHoXG8C1HaoaiZdEDTwC86o2ZnFgkKU=;
 b=THE+3oSK/0FAKjE8yNAnkkF6iVVAJIW0cV/GI2KQU7PetZHC3Hm6ujyV0JgFCJWjGH
 kjaL6Mh1AMl82GTo9KR91t8r0ALvMVuqs2s5ubL2W1NJdc17WgeTX+CzRaAX5Ex79Uxp
 iV/qSVON90JJuJHDTYPnuuitks8p4toEOkcsmgCfuvCFfVx4KUza+yNB9IAreVefdtah
 R77CW+GSLkuoUlAPs4LVL8bjLXZZqeRLMURglhj38WQ+8F6DbyiyAI27CzACXVP/woAC
 BNkNzaMcbfDXsBzWZ0rhEvU0mKrBlh5J6kQb+27Qj9+yCeyToYHSxP7MCj3B3SBWtEMp
 IN9w==
X-Gm-Message-State: AOAM530qMawn9mn7agfnXjaTZ20y6xAtRRf/0kO3mGiVZdQFXmeNatQ4
 LrGEcKhYslxzzVK4DN0SKvukfBP1/tbm9oGufdwZXw==
X-Google-Smtp-Source: ABdhPJz2pl88UdGZiEdhSU0xxxQec+qB86gh5vbHEF7z72r27yOYsJNSJdME+O9OhInco0OSWpoSgxOMB4Drz6/96kU=
X-Received: by 2002:a05:6902:d:b0:629:213c:4937 with SMTP id
 l13-20020a056902000d00b00629213c4937mr1341121ybh.66.1650066041469; Fri, 15
 Apr 2022 16:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <1650065756-13520-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1650065756-13520-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Apr 2022 02:40:30 +0300
Message-ID: <CAA8EJpoOYmE-6SBvRqp4BXmHrGBZFiFTsKWjRS8SVZhQ0eH5PA@mail.gmail.com>
Subject: Re: [PATCH v8] drm/msm/dp: stop event kernel thread when DP unbind
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 Apr 2022 at 02:36, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Current DP driver implementation, event thread is kept running
> after DP display is unbind. This patch fix this problem by disabling
> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>
> Changes in v2:
> -- start event thread at dp_display_bind()
>
> Changes in v3:
> -- disable all HDP interrupts at unbind
> -- replace dp_hpd_event_setup() with dp_hpd_event_thread_start()
> -- replace dp_hpd_event_stop() with dp_hpd_event_thread_stop()
> -- move init_waitqueue_head(&dp->event_q) to probe()
> -- move spin_lock_init(&dp->event_lock) to probe()
>
> Changes in v4:
> -- relocate both dp_display_bind() and dp_display_unbind() to bottom of file
>
> Changes in v5:
> -- cancel relocation of both dp_display_bind() and dp_display_unbind()
>
> Changes in v6:
> -- move empty event q to dp_event_thread_start()
>
> Changes in v7:
> -- call ktheread_stop() directly instead of dp_hpd_event_thread_stop() function
>
> Changes in v8:
> -- return error immediately if audio registration failed.
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..590f90b 100644
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
> @@ -230,6 +231,8 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>         complete_all(&dp->audio_comp);
>  }
>
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv);
> +
>  static int dp_display_bind(struct device *dev, struct device *master,
>                            void *data)
>  {
> @@ -266,9 +269,12 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         }
>
>         rc = dp_register_audio_driver(dev, dp->audio);
> -       if (rc)
> +       if (rc) {
>                 DRM_ERROR("Audio registration Dp failed\n");
> +               goto end;
> +       }
>
> +       rc = dp_hpd_event_thread_start(dp);

At least a DRM_ERROR is missing here. And yes, I'd ask again for a
goto/return 0;

>  end:
>         return rc;
>  }
> @@ -280,6 +286,11 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
>
> +       /* disable all HPD interrupts */
> +       dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +
> +       kthread_stop(dp->ev_tsk);
> +
>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
>         priv->dp[dp->id] = NULL;
> @@ -1054,7 +1065,7 @@ static int hpd_event_thread(void *data)
>
>         dp_priv = (struct dp_display_private *)data;
>
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 if (timeout_mode) {
>                         wait_event_timeout(dp_priv->event_q,
>                                 (dp_priv->event_pndx == dp_priv->event_gndx),
> @@ -1132,12 +1143,19 @@ static int hpd_event_thread(void *data)
>         return 0;
>  }
>
> -static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
>  {
> -       init_waitqueue_head(&dp_priv->event_q);
> -       spin_lock_init(&dp_priv->event_lock);
> +       /* set event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
> +
> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       if (IS_ERR(dp_priv->ev_tsk)) {
> +               DRM_ERROR("failed to create DP event thread\n");
> +               return PTR_ERR(dp_priv->ev_tsk);
> +       }
>
> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       return 0;
>  }
>
>  static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
> @@ -1266,7 +1284,10 @@ static int dp_display_probe(struct platform_device *pdev)
>                 return -EPROBE_DEFER;
>         }
>
> +       /* setup event q */
>         mutex_init(&dp->event_mutex);
> +       init_waitqueue_head(&dp->event_q);
> +       spin_lock_init(&dp->event_lock);
>
>         /* Store DP audio handle inside DP display */
>         dp->dp_display.dp_audio = dp->audio;
> @@ -1441,8 +1462,6 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>
> -       dp_hpd_event_setup(dp);
> -
>         dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>  }
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
