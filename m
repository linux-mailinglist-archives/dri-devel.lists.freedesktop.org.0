Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570ED3F93FA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 07:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C707D6E06D;
	Fri, 27 Aug 2021 05:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFD36E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 05:20:16 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 j11-20020a4a92cb000000b002902ae8cb10so1652929ooh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 22:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Bw4lKm4DRkGFFU7y4OaUt8e27BK/aybFhJJcTi57MKQ=;
 b=gCLbg1CxO2PIQr82hXvq5x3DCZzn0hCanazRdNlFzAq16ek7wRftRsq/Y57VmbYSkw
 0Enk78gHR96jzNxPHVxQVdKGlh0+VsTEs8xzxIQeKX0vAMOe3RHO6OJUlF9AbAzC0qwo
 IkH6kuatJ/i79Usj0jWz1RwrzL2ONPJBVlit0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Bw4lKm4DRkGFFU7y4OaUt8e27BK/aybFhJJcTi57MKQ=;
 b=BtdkRiKoawtCuccbn9CVteX3I27aeUk+5O4DjIbYrFGWYDdV+K9nW0iE4icfrBKzlp
 cdJ8Wgmvb0/y09/9txi24bE0gfs+tsfe/7xF8o+vOO2Ma12pM0X5LJH/SQEcLEt/+V4R
 DTU6s+a8sD/dBBujxmw4RTsSWaHp2wnPF5bveeRJO1xUxOwgHxSbI1zSBstO8NVN+1UR
 e3vSuGutYDVOVkFwI4345qwCiWbI9M3EeRJCDJ5DVHDkIHOX9Kc3ewQoTVCuqT9vADtI
 NwPdvsXtgpo2s+2Sy9X7hdWaD6zCRG70BoaLtsHJA3mekAAyubj4px0hOCmTqYZtyh0E
 9WkQ==
X-Gm-Message-State: AOAM533HBNpF8/nYHJ43zNjSSsVLxFyKPbW6UVX/ttKBjS91yRGfxSVf
 Kk6Y0ElfYskT2VUNvZBFtJfhOuaZYvRnExFqP8eNnw==
X-Google-Smtp-Source: ABdhPJyF/shA5tj4grc4XQr75ReQxmjvKFU7KCfjLGOgJoX6KU6XDNl7YbXOo50MZUzV4QTwzxU2ZFZpGDn7CFu9Li8=
X-Received: by 2002:a4a:96e1:: with SMTP id t30mr6124297ooi.16.1630041615566; 
 Thu, 26 Aug 2021 22:20:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 22:20:15 -0700
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-4-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 22:20:15 -0700
Message-ID: <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP controllers
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-08-25 16:42:31)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2c7de43f655a..4a6132c18e57 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -78,6 +78,8 @@ struct dp_display_private {
>         char *name;
>         int irq;
>
> +       int id;
> +
>         /* state variables */
>         bool core_initialized;
>         bool hpd_irq_on;
> @@ -115,8 +117,19 @@ struct dp_display_private {
>         struct dp_audio *audio;
>  };
>
> +
> +struct msm_dp_config {
> +       phys_addr_t io_start[3];

Can this be made into another struct, like msm_dp_desc, that also
indicates what type of DP connector it is, i.e. eDP vs DP? That would
help me understand in modetest and /sys/class/drm what sort of connector
is probing. dp_drm_connector_init() would need to pass the type of
connector appropriately. Right now, eDP connectors still show up as DP
instead of eDP in sysfs.

> +       size_t num_dp;
> +};
> +
> +static const struct msm_dp_config sc7180_dp_cfg = {
> +       .io_start = { 0x0ae90000 },
> +       .num_dp = 1,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
> -       {.compatible = "qcom,sc7180-dp"},
> +       { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>         {}
>  };
>
