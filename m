Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7417F58F513
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 02:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3A2965C0;
	Thu, 11 Aug 2022 00:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7539796622
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 00:09:03 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id q184so19610067oif.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 17:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=C16lQ11m+Fol+4L80u44mbuXPnmczf0UX1lY5QRXlHs=;
 b=lnof+J9e73sWWV2P76DkdnT/flxhdLwzk6IjqWOzztc2OWwFBmRuRmO2scHgZk3CBq
 GRV169KOmILKU6IlpvWyXSKDwR7qOjbfJwa2NoYWM/DdvVcl/tQTqR2YaOqa4BF3SFQ9
 7NAdg4han2f2MPvoMjGoseen/7yjFmViBjY5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=C16lQ11m+Fol+4L80u44mbuXPnmczf0UX1lY5QRXlHs=;
 b=Txa8ayaxyAqDCQMKaRGmRE8Zbk3YGCgEjScP2yXH6xpBjpqU4tME0Zy0tLroGXq3FL
 afUHN0vowjWiDGbtQT5cUuc399rveYPFYtljT4aQQW5ifTn17k7CboxgutMWgSwKIxDF
 bukwl/xTxp0U8gsy1YWG+aha3H+OUaKY9hK16gqW/eR2qgXNsheJCv1h4y2EJrDLU1Df
 o70oj7dYo+hIvEaw7ngMNMu8WoGYVktsosxThMbvxwMDJUrBPJU9iGWvwkLVdTawkqZx
 fI70nookxpSxZGESxhUFVARYl9sLWgsBeOcAaa7Ms2FqGuFluuViFN0utCOAOCLJzBWj
 dviw==
X-Gm-Message-State: ACgBeo3i3mdpymNwEpCoReCAVWzIaony3ygQwCQMfoIUwsz9k/KHrPxW
 tNuQ8GXMy1b84AFPrT1sRDcMZBJNlXd4fbeyKDT/0g==
X-Google-Smtp-Source: AA6agR7F6LqzTmmYZL1w8+YTn3rn4S/SBFkTvVsA8yDgkZNAItYJ9GAkZkPgvUPtLX/4083aPvTD7sMBZqfcFrz/tj4=
X-Received: by 2002:a05:6808:1389:b0:33a:bd16:c4e4 with SMTP id
 c9-20020a056808138900b0033abd16c4e4mr2311696oiw.0.1660176542614; Wed, 10 Aug
 2022 17:09:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Aug 2022 19:09:02 -0500
MIME-Version: 1.0
In-Reply-To: <dbda8bce-2890-e5e3-4052-073a52eb06a6@quicinc.com>
References: <1660159551-13828-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n533SUb3Bg=pR8Fhwo-M5qLWiti4nzLR-rSGVAsrXgEYNQ@mail.gmail.com>
 <dbda8bce-2890-e5e3-4052-073a52eb06a6@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 10 Aug 2022 19:09:02 -0500
Message-ID: <CAE-0n51NyrP8CikcK_3wj4EEsurmmSZ4RY3pLhJJmkY2_8wNZw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: check hpd_state before push idle pattern
 at dp_bridge_disable()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
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

Quoting Kuogee Hsieh (2022-08-10 16:57:51)
>
> On 8/10/2022 3:22 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-08-10 12:25:51)
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index b36f8b6..678289a 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1729,10 +1729,20 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
> >>          struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
> >>          struct msm_dp *dp = dp_bridge->dp_display;
> >>          struct dp_display_private *dp_display;
> >> +       u32 state;
> >>
> >>          dp_display = container_of(dp, struct dp_display_private, dp_display);
> >>
> >> +       mutex_lock(&dp_display->event_mutex);
> >> +
> >> +       state = dp_display->hpd_state;
> >> +       if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {
> > It's concerning that we have to check this at all. Are we still
> > interjecting into the disable path when the cable is disconnected?
>
> yes,
>
> The problem is not from cable disconnected.
>
> There is a corner case that this function is called at drm shutdown
> (drm_release).
>
> At that time, mainlink is not enabled, hence dp_ctrl_push_idle() will
> cause system crash.

The mainlink is only disabled when the cable is disconnected though?

Let me put it this way, if we have to check that the state is
"connected" or "disconnected pending" in the disable path then there's
an issue where this driver is being called in unexpected ways. This
driver is fighting the drm core each time there's a state check. We
really need to get rid of the state tracking entirely, and make sure
that the drm core is calling into the driver at the right time, i.e.
bridge disable is only called when the mainlink is enabled, etc.
