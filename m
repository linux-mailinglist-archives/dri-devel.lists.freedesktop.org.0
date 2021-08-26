Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061FC3F7FC6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 03:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E026E45D;
	Thu, 26 Aug 2021 01:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA33B6E45D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 01:21:52 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id c79so2064530oib.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 18:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6nXlei/Gzl2kgJrjUypJPJMbLWWtXj8x5vv2RmtYCFk=;
 b=Fl2zoS01SxGzy75oar1XNbzccL+NIMw8VXIazGxrv9mtTk3t4A/gX5nocJDAK3e4ym
 2pJb0fRgXs3r/GgRnsO6IFoFzOoWgEeImeTfwI2gd+1179p6Qf16ndE5pC9YsWH29gW2
 /n2x2Y+ste2OcTlK787bUn/Hyv9BIubrPaq7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6nXlei/Gzl2kgJrjUypJPJMbLWWtXj8x5vv2RmtYCFk=;
 b=n6zwjvy9aL9rbkVZ7wE+hfD0UJWaH4J4yt1wMtNYO3J9/kSvmt+glFkYBJX72tDI9y
 GMaYS7nUDv63Y7o7+sBHTspOw+vTYMT+b/Ay7Owe0ds/gs1WB0K4IciAzw37Mqri4Ht9
 WOWNr5n1ImRpW2HMDkbtjMi/HE+bWiaP5Pp0NA/QV0ElPPLzLREfi2SyUhGkorMSdxT4
 AA/weI1aBNoI7kMqW5p7mZP65j27buJ9rV5b+kqS8kMjWvaCvKloVOtDvibjDhMooD5o
 NC73Um1eZ9Q/RZizk+Qdel+ieRBGngrpIQ7cadL+wE72Ud5jo/5R6+xnYlptR98xjvEC
 TxTg==
X-Gm-Message-State: AOAM53193dSaoD3LkA5HCB6fjH7/SFPy6J8eFY5oZXV5NSatJjyl9LFg
 aW7CjABl4BQ6X2igOzvjLJZZZpKjGDP3mDZ35seWqA==
X-Google-Smtp-Source: ABdhPJz1PrTQ46AFZgnsHo3RwaOgObBPJwNmVa81VCkWSx1FhF7a08m5xnynvSJw6aQm8FOE9v9zVAEx6nn1AokhkX4=
X-Received: by 2002:a05:6808:181a:: with SMTP id
 bh26mr9465358oib.166.1629940912164; 
 Wed, 25 Aug 2021 18:21:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 01:21:51 +0000
MIME-Version: 1.0
In-Reply-To: <20210825222557.1499104-5-bjorn.andersson@linaro.org>
References: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
 <20210825222557.1499104-5-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 01:21:51 +0000
Message-ID: <CAE-0n53EySs6UbKrcE1x1n0S22CtzneRm4fx328UzMDy5eHADA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/msm/dp: Store each subblock in the io region
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Bjorn Andersson (2021-08-25 15:25:56)
> Not all platforms has DP_P0 at offset 0x1000 from the beginning of the
> DP block. So split the dss_io_data memory region into a set of
> sub-regions, to make it possible in the next patch to specify each of
> the sub-regions individually.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

One nit below:

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index dc62e70b1640..a95b05dbb11c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -25,9 +25,16 @@ enum dp_pm_type {
>         DP_MAX_PM
>  };
>
> -struct dss_io_data {
> -       size_t len;
> +struct dss_io_region {
>         void __iomem *base;
> +       size_t len;

It flip flops here. Would be nice to the diff if len was where it really
wanted to be.

> +};
> +
> +struct dss_io_data {
> +       struct dss_io_region ahb;
> +       struct dss_io_region aux;
> +       struct dss_io_region link;
> +       struct dss_io_region p0;
>  };
