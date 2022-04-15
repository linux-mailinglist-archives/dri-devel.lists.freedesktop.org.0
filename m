Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB375031DD
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 01:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E7310E739;
	Fri, 15 Apr 2022 23:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4617A10E739
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 23:27:48 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ef5380669cso78500987b3.9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 16:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lw2ingGGS+gGAKFN9ab4kSIE68KwTs47CB5NmRh5IDI=;
 b=H160swL5Hq1YmXeDhx04qtBeyRhdvbytbtb0COmyZnBSiMX7T9dIZg/9BIM9Q+Mu7P
 vRwzQVxkSdj1fWHrJzqSNFBhylDSN+PIPrOcivA8Rs44M1JZiDffXTFefOHzlU19AoBC
 yelGEDFnLfMWJ2y0A1Msfsv6sanPxUdpnaSf6LW+MNqKFyHVPST2JfAoViyQNKIgmzrr
 VD5i0LD5UN9lBOz7M49OhW3VjTHWHYQOsZyFMITduTRX1vlF5W5mkBcBO+nyqF3Y3nn4
 ruyPow/CDxcyvIeDc1fxgSrHdAgChh48JmQS4SEdqTgfEMeH+4YTnEPNi7RQbwfjIrDC
 4BHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lw2ingGGS+gGAKFN9ab4kSIE68KwTs47CB5NmRh5IDI=;
 b=heeb0P3pIaPC+HW+wLYJ2oevlsHxjVWrb0YSxZKyuDKxUrVhpOpV9kXaiEHaIrYhYQ
 6P278yfDTbU0FspCWlF4OnSktAnml+9onKzcyc/JbsaxzLtFFzd/ppfzDjWlh7sQ+Siy
 gqYF/o/Sx2MTNfso+SzxjHXJue+KlxQ4RyuAPtgrxllbkpgwparL8PeNDvdO0Cdp4oSK
 BCZC15iIRNK3d/DSiJtMoOYFQLc8pL5WrskwRhWtdvlY2XeKiwduxbqS31DMsjsJjQtC
 y7ZDaYNkyRF0zzObdApDX9H+ts3rkUMl6qVQmLEKPvtsrH2Pntwbu0JUfEbP5qTirD3y
 dIDA==
X-Gm-Message-State: AOAM532xAwzeVvCpTEaPoeHKJAqiLhZjxyTCZSdW6UK7OTEQlPNgLnIE
 vi7wgLd4WsGyERRyaavf1j7gVXwM5m+7MSUQjIh7oQ==
X-Google-Smtp-Source: ABdhPJzgzZ+XLhcQBARtnDhsTaiU5NK/RDuIMe92k46YauSu6gt0ItlJUF4iIxOSzz3MagzklP74jI67icxw9csvDh8=
X-Received: by 2002:a81:753:0:b0:2eb:ebe9:ff4f with SMTP id
 80-20020a810753000000b002ebebe9ff4fmr1082658ywh.255.1650065267380; Fri, 15
 Apr 2022 16:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <1650062064-11838-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpopw4rh0ZkFd5F4zHVJQw6GUNq=+HKVycOx0bXd5OWizQ@mail.gmail.com>
 <f4bc072f-9ec6-d57e-28de-e3f7aba21cd7@quicinc.com>
In-Reply-To: <f4bc072f-9ec6-d57e-28de-e3f7aba21cd7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Apr 2022 02:27:36 +0300
Message-ID: <CAA8EJpr54Wrjv9+7H97n9i+2zPX6qNH3Vqf-92CRtayhQexhYQ@mail.gmail.com>
Subject: Re: [PATCH v7] drm/msm/dp: stop event kernel thread when DP unbind
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

On Sat, 16 Apr 2022 at 02:10, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 4/15/2022 3:48 PM, Dmitry Baryshkov wrote:
> > On Sat, 16 Apr 2022 at 01:34, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> Current DP driver implementation, event thread is kept running
> >> after DP display is unbind. This patch fix this problem by disabling
> >> DP irq and stop event thread to exit gracefully at dp_display_unbind().
> >>
> >> Changes in v2:
> >> -- start event thread at dp_display_bind()
> >>
> >> Changes in v3:
> >> -- disable all HDP interrupts at unbind
> >> -- replace dp_hpd_event_setup() with dp_hpd_event_thread_start()
> >> -- replace dp_hpd_event_stop() with dp_hpd_event_thread_stop()
> >> -- move init_waitqueue_head(&dp->event_q) to probe()
> >> -- move spin_lock_init(&dp->event_lock) to probe()
> >>
> >> Changes in v4:
> >> -- relocate both dp_display_bind() and dp_display_unbind() to bottom of file
> >>
> >> Changes in v5:
> >> -- cancel relocation of both dp_display_bind() and dp_display_unbind()
> >>
> >> Changes in v6:
> >> -- move empty event q to dp_event_thread_start()
> >>
> >> Changes in v7:
> >> -- call ktheread_stop() directly instead of dp_hpd_event_thread_stop() function
> >>
> >> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 31 ++++++++++++++++++++++++-------
> >>   1 file changed, 24 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 01453db..680e500 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -113,6 +113,7 @@ struct dp_display_private {
> >>          u32 hpd_state;
> >>          u32 event_pndx;
> >>          u32 event_gndx;
> >> +       struct task_struct *ev_tsk;
> >>          struct dp_event event_list[DP_EVENT_Q_MAX];
> >>          spinlock_t event_lock;
> >>
> >> @@ -230,6 +231,8 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
> >>          complete_all(&dp->audio_comp);
> >>   }
> >>
> >> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv);
> >> +
> >>   static int dp_display_bind(struct device *dev, struct device *master,
> >>                             void *data)
> >>   {
> >> @@ -269,6 +272,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
> >>          if (rc)
> >>                  DRM_ERROR("Audio registration Dp failed\n");
> > I think I asked it in v3 and didn't get an answer:
> > Isn't 'goto end' missing here?
> I did follow you suggestion at v3 and made changes at
> dp_hpd_event_thread_start()

I'm asking about this place. Should we return an immediate error if
audio registration has failed or not?

> >> +       rc = dp_hpd_event_thread_start(dp);
> > if (rc) { DRM_ERROR(....); goto end; }
> > return 0;
> >
> > Please.
> This is at dp_display_bind(),  "end" is the next statement why goto needed?

To be explicit that this is a fatal error. Compare this to my question
regarding the audio registration failure.

> >>   end:
> >>          return rc;
> >>   }
> >> @@ -280,6 +284,11 @@ static void dp_display_unbind(struct device *dev, struct device *master,
> >>          struct drm_device *drm = dev_get_drvdata(master);
> >>          struct msm_drm_private *priv = drm->dev_private;
> >>
> >> +       /* disable all HPD interrupts */
> >> +       dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> >> +
> >> +       kthread_stop(dp->ev_tsk);
> >> +
> >>          dp_power_client_deinit(dp->power);
> >>          dp_aux_unregister(dp->aux);
> >>          priv->dp[dp->id] = NULL;
> >> @@ -1054,7 +1063,7 @@ static int hpd_event_thread(void *data)
> >>
> >>          dp_priv = (struct dp_display_private *)data;
> >>
> >> -       while (1) {
> >> +       while (!kthread_should_stop()) {
> >>                  if (timeout_mode) {
> >>                          wait_event_timeout(dp_priv->event_q,
> >>                                  (dp_priv->event_pndx == dp_priv->event_gndx),
> >> @@ -1132,12 +1141,19 @@ static int hpd_event_thread(void *data)
> >>          return 0;
> >>   }
> >>
> >> -static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> >> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
> >>   {
> >> -       init_waitqueue_head(&dp_priv->event_q);
> >> -       spin_lock_init(&dp_priv->event_lock);
> >> +       /* set event q to empty */
> >> +       dp_priv->event_gndx = 0;
> >> +       dp_priv->event_pndx = 0;
> >> +
> >> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> >> +       if (IS_ERR(dp_priv->ev_tsk)) {
> >> +               DRM_ERROR("failed to create DP event thread\n");
> >> +               return PTR_ERR(dp_priv->ev_tsk);
> >> +       }
> >>
> >> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> >> +       return 0;
> >>   }
> >>
> >>   static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
> >> @@ -1266,7 +1282,10 @@ static int dp_display_probe(struct platform_device *pdev)
> >>                  return -EPROBE_DEFER;
> >>          }
> >>
> >> +       /* setup event q */
> >>          mutex_init(&dp->event_mutex);
> >> +       init_waitqueue_head(&dp->event_q);
> >> +       spin_lock_init(&dp->event_lock);
> >>
> >>          /* Store DP audio handle inside DP display */
> >>          dp->dp_display.dp_audio = dp->audio;
> >> @@ -1441,8 +1460,6 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
> >>
> >>          dp = container_of(dp_display, struct dp_display_private, dp_display);
> >>
> >> -       dp_hpd_event_setup(dp);
> >> -
> >>          dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> >>   }
> >>
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >> a Linux Foundation Collaborative Project
> >>
> >



-- 
With best wishes
Dmitry
