Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC1158F451
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 00:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080DA93A36;
	Wed, 10 Aug 2022 22:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF0A18A57C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 22:22:54 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10dc1b16c12so19528080fac.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 15:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=6ZXpeykwT3UcSDOHGtJfXAmbLhvIZVOoNhfE2nMEi9U=;
 b=fNj6bGWSepVNh9KUpmWHunpqN8Jhu3GMgOn+GPdB4erApMi1R65km8K1Kmq7Mej4Nq
 +A4fckaH0S/Wcj86Dko9ri0Rc+tf9fvc6osQfaJSsy13zB/TMANokZiR5NSjqI6ff4Tq
 1Az7Ym4yC5q6aCw2z+xVuxCZpPI193+UioaKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=6ZXpeykwT3UcSDOHGtJfXAmbLhvIZVOoNhfE2nMEi9U=;
 b=Kuc9JNjTiNa30HFScZwVhNu32aMSsbSegAWgAsJ7rQFvNG0m1u7bu32+r/WfW+WGJ/
 IYPZWNzH8SD5mt7glGiuLcRd2PYqqskERDey33H0K7SFIMI8vho37h8Pb1H/LdQYsJfy
 yW+6gdeRo5MOYOQLskPLEcCVnZDT7lOwRqsbiS6W/YPNY6LEmnX+54fS/nMy6T1KLPQ1
 cKuuYD12eSIBS4fPhMulZja11yTvKk7IfiesyIGoBjqo2TVdJQHbV3LHtBKVl3FvWLfa
 1r52OPMxyToW6FL8g3sAfaWpzbbdQp/17iHgzsEu/D9gw0RP7U+EaxgL03EUjZBbxnyw
 dBTg==
X-Gm-Message-State: ACgBeo3R26e35VPyRbDNHwspH7Gy5hQre1t/Ht4GCfaI4Q6Czb2Qs55Z
 HgrnsaqnHayVQyuNkwRA5HY7XUb0FFviw8LuJ9GD0w==
X-Google-Smtp-Source: AA6agR4tGznIvQwijtSDOPuLU9fc/WJ4b/gonUrK7uyKPVZ3I1QHlYY7Al1Vij85kOgI7HtbkFv2qGEbFQGqeEitqyg=
X-Received: by 2002:a05:6870:9a17:b0:e9:3d1:f91a with SMTP id
 fo23-20020a0568709a1700b000e903d1f91amr2438112oab.44.1660170173320; Wed, 10
 Aug 2022 15:22:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Aug 2022 17:22:52 -0500
MIME-Version: 1.0
In-Reply-To: <1660159551-13828-1-git-send-email-quic_khsieh@quicinc.com>
References: <1660159551-13828-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 10 Aug 2022 17:22:52 -0500
Message-ID: <CAE-0n533SUb3Bg=pR8Fhwo-M5qLWiti4nzLR-rSGVAsrXgEYNQ@mail.gmail.com>
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

Quoting Kuogee Hsieh (2022-08-10 12:25:51)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index b36f8b6..678289a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1729,10 +1729,20 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
>         struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
>         struct msm_dp *dp = dp_bridge->dp_display;
>         struct dp_display_private *dp_display;
> +       u32 state;
>
>         dp_display = container_of(dp, struct dp_display_private, dp_display);
>
> +       mutex_lock(&dp_display->event_mutex);
> +
> +       state = dp_display->hpd_state;
> +       if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {

It's concerning that we have to check this at all. Are we still
interjecting into the disable path when the cable is disconnected?

> +               mutex_unlock(&dp_display->event_mutex);
> +               return;
> +       }
> +
>         dp_ctrl_push_idle(dp_display->ctrl);
> +       mutex_unlock(&dp_display->event_mutex);
