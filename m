Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF364857AB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 18:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0435010E42D;
	Wed,  5 Jan 2022 17:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB8A10E42D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 17:51:18 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id g22so36133600pgn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 09:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=02jPdn5t6Ff/0d55zQvjcjTFcLTmmCYTOM0kxLOQ3iQ=;
 b=Cueq/b8lSSVzXegMttx9Vx8pSA/UhhD3m1o20cmLoHcVqhZ6XXgaaXVafKRtYqDlyj
 8IWvTSJ4pZRKFoIIksCwBB2tNfs2J0aGabT4tNvI3Hlm9znMm1dx0KTz0GpJYxFfRyHY
 jrH0+K1kTBtqfXd1eTy28XjLXNBnJl+uTMPKOOb+xyXPkVBi4JzW3e3Rcs83nN7N7//g
 6UgSi1nSCBXw0Gt5bX2BgStF2nDTix2tKCIs4SamDY8bgF/zCgAck1Z87gI1rkvMRt5m
 x9rAHWDk//z8+cJw72x+/WCoqS7t1n0w1qB+W9LfWPbidp95ahJF+UwGN3CcSJCWjYTp
 Okzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02jPdn5t6Ff/0d55zQvjcjTFcLTmmCYTOM0kxLOQ3iQ=;
 b=HYgtCqyf/5RpQgKEgY/TyR46kBXU56naLNRtsdVSWwRpDZQYdq5qovN2vVgVz48sQS
 NpZZPLSRRc1vvm16a50xq3EJmri7KObXrAFQtkXIGUEeg/7HYkcu5sGFWZ33a7nHYq8/
 FQa0rXkuir1E0u9UAImj0P61oxHzapQHy28IMkz8cagdgxPUx0BKnso49Maorio43doh
 kwbjlsnpgDmlU7/5LkvK0xs4qoKdQGYIU6AEG2jFql9qEYrph8RnMPwO65EL7gQgPgKE
 ONXfNSEU6+plyYqGdP4C2N04GbyL8JLJSAPfN3EXpekc5Mo67GBigYYWk1YPNoY5MNVb
 4uKA==
X-Gm-Message-State: AOAM531koGEK92iJs9aFIyPLbTyp6TH5fgZ/rx1X1cv74fh85yyWcyaI
 atp+e7oi/6XRO3ExhURRUkdh2PMS6hCbiZ58xgpkqg==
X-Google-Smtp-Source: ABdhPJzLGp9Lu53gKwRN5ecOY+UDsR90b4q8ivNS1uGwZU7RHIkl+SxX9b3LNJIDkOIJFrv+kyaNYuHnIMw14ADw3RU=
X-Received: by 2002:a63:854a:: with SMTP id u71mr48636668pgd.201.1641405078557; 
 Wed, 05 Jan 2022 09:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20220105104826.1418-1-linmq006@gmail.com>
In-Reply-To: <20220105104826.1418-1-linmq006@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 5 Jan 2022 18:51:07 +0100
Message-ID: <CAG3jFyvUcGgELW=N4OXwU_SVtV9YpyKQynTj2Oz77P_C1YMOkg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Fix PM disable depth imbalance in
 nwl_dsi_probe
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Chiras <robert.chiras@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Miaoqian,

Thanks for submitting this patch!

On Wed, 5 Jan 2022 at 11:48, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> The pm_runtime_enable will increase power disable depth.
> Thus a pairing decrement is needed on the error handling
> path to keep it balanced according to context.
>
> Fixes: 44cfc62 ("drm/bridge: Add NWL MIPI DSI host controller support")

In the future, please use 12 chars of the hash. I'll fix it this time,
but please use 12 characters going forward.

> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index a7389a0facfb..fc3ad9fab867 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -1206,6 +1206,7 @@ static int nwl_dsi_probe(struct platform_device *pdev)
>
>         ret = nwl_dsi_select_input(dsi);
>         if (ret < 0) {
> +               pm_runtime_disable(dev);
>                 mipi_dsi_host_unregister(&dsi->dsi_host);
>                 return ret;
>         }
> --
> 2.17.1
>

Fixed commit hash length, added my r-b and applied to drm-misc-next.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
