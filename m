Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BF44CC8F6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E9010E392;
	Thu,  3 Mar 2022 22:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC70B10E362
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 22:32:13 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so7463209ooi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 14:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aqHukTgau4IAvFi00RDl1B7HiBWVDHFl56OK28PMHW0=;
 b=IVmxY43aCeIX1Sbf2joZSulhij/7ZJfOsfW2ct8zFCjANbR9ljRuZIFKVy5W9n1ycu
 cZPe+i2/RpGClp2hAwhQ6i4nJ66ijPtZf4fDH12JPPUWIrIelgejMh2ieJ64xE8FZlMu
 0KgrAIWNyVggchJz8CU8kNPEMwijbzgnTzazk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aqHukTgau4IAvFi00RDl1B7HiBWVDHFl56OK28PMHW0=;
 b=zusglRiBVkVIX6zKR+A9ukFZm/15wjbPGoE6+P+0CldsALYVhhZgOaDDNQvBRow82h
 cydPn/4TU3O3mLdM1/ApM4yN73Dp13l8aBUTctRGOtl6iAPlLr6Iq6PVGw6bCyNkb8s9
 ip9jpWzYZAO4aq6IXeAE26KuLIJcD5YBL+Qw5GSD7CaqiVg28iWOtGnAOiVAr03ul5r5
 ljIoVXFT6Gm4XfddHIQCjuWV0Fp3gTVdOuvEfLjPPcN+MWFyIGybWP75Ug3ujN6XVBco
 Ige1fseJgu4CPSI01cjB69bCV0bItVolMTcB/iiuvD7f/yhyClXJyhHCoxGcZ/nu8/r+
 UhAw==
X-Gm-Message-State: AOAM531+Gh7PawwddFYKWw009dNkeDPsPw3qE/3Nf4gpEdV/vV8baJ4c
 mwJGAnPUHwMlPGm4B8qU2Yz005f9fxCXR5Ic5lEnbw==
X-Google-Smtp-Source: ABdhPJwMvqlFwnhs+sdOU8vYBeqkpQAJFIeV5g0NI9aFagfB5z15TsHZXR/x+aDGr8bjw4w7sdXlVyOqMAx/7wBdwfQ=
X-Received: by 2002:a4a:9821:0:b0:320:52bb:3806 with SMTP id
 y30-20020a4a9821000000b0032052bb3806mr6929333ooi.1.1646346733194; Thu, 03 Mar
 2022 14:32:13 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:32:12 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:32:12 -0800
Message-ID: <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> The only clock for which we set the rate is the "stream_pixel". Rather
> than storing the rate and then setting it by looping over all the
> clocks, set the clock rate directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[...]
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 07f6bf7e1acb..8e6361dedd77 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1315,7 +1315,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
>         DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
>
>         if (num)
> -               cfg->rate = rate;
> +               clk_set_rate(cfg->clk, rate);

This looks bad. From what I can tell we set the rate of the pixel clk
after enabling the phy and configuring it. See the order of operations
in dp_ctrl_enable_mainlink_clocks() and note how dp_power_clk_enable()
is the one that eventually sets a rate through dp_power_clk_set_rate()

        dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
                                        ctrl->link->link_params.rate * 1000);

        phy_configure(phy, &dp_io->phy_opts);
        phy_power_on(phy);

        ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);	

and I vaguely recall that the DP phy needs to be configured for some
frequency so that the pixel clk can use it when determining the rate to
set.

>         else
>                 DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
>                                 name, rate);
