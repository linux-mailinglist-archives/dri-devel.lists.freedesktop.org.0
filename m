Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766B15241D2
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 03:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA7E10EC07;
	Thu, 12 May 2022 01:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFE510EC47
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 01:04:03 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f16645872fso40051117b3.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U6tK8GPMBaPnPvzJJPFEhM/26woZfEa9DJERPsRxEgc=;
 b=O54KDau0H299Yh1PZu6Xhrp359vgu0EaCOr0TEQ/1KQCZW7p1D709aynAaO927QN3S
 UZUfHNwwZrp+1CFeN4XNOMaaS5M6mpBErWA+N68xAb9L61s0Qp/IiL64JvVWglGzVIFz
 u+oaHgKD8xuQLQtOLAqgHXTMm9jBCWEeGEPkVi0UwcKJwx80WSC4Z14THJl68l/5Z5U/
 YTvzfMCTynwmLcMaTlC2OgUByA+dLsYoiDZYirgkTXD0ospQCc1hCH9gkxMNRdVV3NcT
 kVmF/hkBFaWumtIL1U6f4E3gIUXkxbLnMgoclRCuzEk5r1MCW9iaNOSVxoKsHrknhHtQ
 9+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U6tK8GPMBaPnPvzJJPFEhM/26woZfEa9DJERPsRxEgc=;
 b=zvLzbEZqDe1O9n8OCVhkwhWi2BfCiCHt/rbxOfzKhBXBA1gdbXcLWR+CQoXCwbpbgS
 kzfpV4E0NVIKdSNP5ky+iFqx7Vxs8JaD4+sWVHsmWqp++olA0EJ/8DHj2HaauTv7vxWW
 8G2bKocNwwM3HBXQOXg955VWF3HCjE50OVdPJKH3ZjZGLzyxVACpABcUYZvHbz5ZeTFp
 uqkF+jXZjIIEBdHFb7loVF/kfV7IkDaMmoAQYasnWfWAQCvkgzXbe3U82X6xpWo+qNPb
 WAuydzV8KgoZZNxfq2Umfgju+5vEHnnep5uWAt4HStIMuQmams+jFPvZ8rqLyEt1JfjF
 3kfw==
X-Gm-Message-State: AOAM531ingQbh9rH1QXMuz1HRtNdL9SOGH+MhoWpp+MtqT1jQfCqtN4t
 4QmPMKYwYalCpzNo7iJIWMQ41rg0NyvwBYUoFyIeUA==
X-Google-Smtp-Source: ABdhPJxcC7GLVrVLu5NCUf/TT8p1tHqKlLQAuai83vmfQMaboWPR/caZ0bZRwSbcggq7Pe9iZ8h/+m7oNv703gUkJgY=
X-Received: by 2002:a81:1d4e:0:b0:2f7:be8b:502e with SMTP id
 d75-20020a811d4e000000b002f7be8b502emr28547800ywd.278.1652317443088; Wed, 11
 May 2022 18:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <1652313768-16286-1-git-send-email-quic_khsieh@quicinc.com>
 <e5c16697-5919-bafa-4ec5-294c94d7a740@linaro.org>
 <CAE-0n53zHrczQAOWM5f_tafUVJxg7JU2NuC4sGcBZddwKr-dGA@mail.gmail.com>
In-Reply-To: <CAE-0n53zHrczQAOWM5f_tafUVJxg7JU2NuC4sGcBZddwKr-dGA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 May 2022 04:03:51 +0300
Message-ID: <CAA8EJppc9d+FjVzAX_KU2-akTc1vSmSHMeKr8dp2ynH2LLOyBQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 airlied@linux.ie, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 May 2022 at 04:01, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-05-11 17:41:50)
> > On 12/05/2022 03:02, Kuogee Hsieh wrote:
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index af7a80c..f3e333e 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
> > >
> > >       dp_catalog_ctrl_reset(ctrl->catalog);
> > >
> > > -     if (enable)
> > > -             dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> > > +     /*
> > > +      * all dp controller programmable registers will not
> > > +      * be reset to default value after DP_SW_RESET
> > > +      * therefore interrupt mask bits have to be updated
> > > +      * to enable/disable interrupts
> > > +      */
> > > +     dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> > >   }
> > >
> > >   void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index c388323..79439b8 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -98,6 +98,8 @@ struct dp_display_private {
> > >       struct dp_ctrl    *ctrl;
> > >       struct dp_debug   *debug;
> > >
> > > +     atomic_t suspended;
> >
> > I think it'd be better to protect it with event_lock rather than using
> > atomics.
>
> Agreed. I think the concern is that the event queue will have "stuff" in
> it. If the event queue was all a threaded irq we could simply call
> synchronize_irq() after disabling the irq bit in the DP hardware and
> then we would know it is safe to power down the DP logic. Unfortunately
> the event queue is a kthread so we can't do that and we have to rewrite
> synchronize_irq() by checking that the event queue is empty and waiting
> for it to empty out otherwise. It's not safe enough to simply do the
> power operations underneath the event_lock because there's a queue in
> the kthread that might be waiting to grab the event_lock to process.

This sounds like a good reason to rewrite event_thread to use
threaded_irq and/or workqueue.

-- 
With best wishes
Dmitry
