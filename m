Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4975241C6
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 03:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485F610E9CF;
	Thu, 12 May 2022 01:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722E710E937
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 01:01:27 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id l16so4707233oil.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 18:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KkHNoGFNmm+2/TYi6ZuGQ2Cbch/NU3jA999yYTZ1GdU=;
 b=fYzBOmi9dwJ7uhGEEQdetvr/2AFRci4EDkcJ+KZ4B+gSnT+cHk2Pm1pkhFjrbcB3T+
 Y3opASV6+Ne+20FH4mpSkUXkQ4JlhKHQ6tUP4ApIu4HTBcUpCECgW42lJVCLg5d2CEkY
 dC0JUR0cHaatNLxem1o/Mcjv/tb6OqUIYZSeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KkHNoGFNmm+2/TYi6ZuGQ2Cbch/NU3jA999yYTZ1GdU=;
 b=2pF/whi9y+Wrg3NfRvswWMVfCaJGiraz3sMOk9dbZRRmOWBF3Y+UqKmySVmaVAJFV1
 eAbcmZSA1jTSNAq2341AZOzXsolifHTybnNEE6Wvlb+YTegYyWyb5/4WNpbKucEMLeyR
 6RRjLPuAEaGqCHuZfbMhXpID0jV5BSE6MFrAt1eVdgHlVGo80OtKkCDyU/+RR1TZwhDx
 qB03WByTWT+7mnad+e3twHeQeqdHsTp5Jb3baXsDH0RVrZM8NpFxkY8guF/ZisXWn3by
 VPNOKdGKTP/IOpZ8fwTGqEOxnB/aRiXO37ngp+BCT/t7bDpS2JEe56AO5z9i/FJxafag
 TBUg==
X-Gm-Message-State: AOAM531UcgVCJZsfEFDf2MD2WTO7HRM+vhvPal1Z5Z3aZ3PNAaQiaeF/
 wVcTXb1zNDoPec4+0DBpQua/nr+TmvtB5wX40TyIhg==
X-Google-Smtp-Source: ABdhPJyZyRcSyf1WMpHlbuM6TXip4xUs8zue+4HQsI+8TZq/afqmiMvK4becdP3jyYz88janNmHmpTvQeobO71GUPzw=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr3957420oib.63.1652317286569; Wed, 11
 May 2022 18:01:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 18:01:26 -0700
MIME-Version: 1.0
In-Reply-To: <e5c16697-5919-bafa-4ec5-294c94d7a740@linaro.org>
References: <1652313768-16286-1-git-send-email-quic_khsieh@quicinc.com>
 <e5c16697-5919-bafa-4ec5-294c94d7a740@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 11 May 2022 18:01:26 -0700
Message-ID: <CAE-0n53zHrczQAOWM5f_tafUVJxg7JU2NuC4sGcBZddwKr-dGA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 agross@kernel.org, airlied@linux.ie, bjorn.andersson@linaro.org, 
 daniel@ffwll.ch, dianders@chromium.org, robdclark@gmail.com, sean@poorly.run, 
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-05-11 17:41:50)
> On 12/05/2022 03:02, Kuogee Hsieh wrote:
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index af7a80c..f3e333e 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
> >
> >       dp_catalog_ctrl_reset(ctrl->catalog);
> >
> > -     if (enable)
> > -             dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> > +     /*
> > +      * all dp controller programmable registers will not
> > +      * be reset to default value after DP_SW_RESET
> > +      * therefore interrupt mask bits have to be updated
> > +      * to enable/disable interrupts
> > +      */
> > +     dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> >   }
> >
> >   void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index c388323..79439b8 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -98,6 +98,8 @@ struct dp_display_private {
> >       struct dp_ctrl    *ctrl;
> >       struct dp_debug   *debug;
> >
> > +     atomic_t suspended;
>
> I think it'd be better to protect it with event_lock rather than using
> atomics.

Agreed. I think the concern is that the event queue will have "stuff" in
it. If the event queue was all a threaded irq we could simply call
synchronize_irq() after disabling the irq bit in the DP hardware and
then we would know it is safe to power down the DP logic. Unfortunately
the event queue is a kthread so we can't do that and we have to rewrite
synchronize_irq() by checking that the event queue is empty and waiting
for it to empty out otherwise. It's not safe enough to simply do the
power operations underneath the event_lock because there's a queue in
the kthread that might be waiting to grab the event_lock to process.
