Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E495067E2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 11:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF13010EE81;
	Tue, 19 Apr 2022 09:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785C410EE39
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:41:06 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u18so20508107eda.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6JkTFNkPUH1y1YWWGO1CLzZ7ViOlqld0+XR1aVK8Wck=;
 b=Xcn3fT2rZ/TrQLi7+1bw1AWRboyUNr++AAwaMsEL4Ht+Y6LftNqITRHBbeslC+HnnO
 01qwq5azEPKy8035FSxXuhhePZZiwPXyDw1VsOMCx1lhJ8T20mTGv7lIuwQQSGCaX0wt
 wAf7SdYQTaTA7UfXJk41zeKQglTMzfz8Jy5Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6JkTFNkPUH1y1YWWGO1CLzZ7ViOlqld0+XR1aVK8Wck=;
 b=gVjAnLczfwQChEVWR3uAY6W5dBywIjGCAhhl6h/51Bqz14tSufPsB54lesbaDk1g7s
 de4W+3DbACxOEwPeIuFJRHftvlXKrnwRAfyMj3zYUQkJ/VVF74CVvdX8GB+9cbA/IYK8
 769jjkxArnteYmJ69konVpiEAqQAoLPuAqUjxxErjmoGd0RYjByrZh8cQfMrdxHfCp+L
 t7SSnjyJ/+Sua3kIWg/xX5tz5YQwH69bOjQAs1EZ7jSntMxfQ3tXRtG8bYzJzH/Cwj0K
 srsrxcLP+UA+x43iUHtKdgiSwa9kEmmkYJUCvA2VPpkMBmdsRmn40grLzAIKlTnuJ9jJ
 dl1w==
X-Gm-Message-State: AOAM531uepy4IdtNto5x2U77S62B01La+ih0at82DS7TSdG5scmq8/Ip
 eGyfcFuuugHTqTAsUJpQl5+P7OtC8sDrmJyIWVpShQ==
X-Google-Smtp-Source: ABdhPJw53nC1Pyq++GLLrwLE/KOTg+4DW6Q6xA80Iq9EPIpNMkzDf0Vubr6Ec0Hl3tiTww6jM1ukxrVmNfzMvV4DWI0=
X-Received: by 2002:a05:6402:438c:b0:423:f57a:596f with SMTP id
 o12-20020a056402438c00b00423f57a596fmr5280479edc.367.1650361264961; Tue, 19
 Apr 2022 02:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c@eucas1p2.samsung.com>
 <20220419091422.4255-1-m.szyprowski@samsung.com>
In-Reply-To: <20220419091422.4255-1-m.szyprowski@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 19 Apr 2022 15:10:54 +0530
Message-ID: <CAMty3ZB31chzCfFkogx7otqH8rOZ0wEGDBuxLcG-PKQ-HBHy4w@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: panel: Register connector if DRM device is
 already registered
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 2:44 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> If panel_bridge_attach() happens after DRM device registration, the
> created connector will not be registered by the DRM core anymore. Fix
> this by registering it explicitely in such case.
>
> This fixes the following issue observed on Samsung Exynos4210-based Trats
> board with a DSI panel (the panel driver is registed after the Exynos DRM
> component device is bound):
>
> $ ./modetest -c -Mexynos
> could not get connector 56: No such file or directory
> Segmentation fault
>
> While touching this, move the connector reset() call also under the DRM
> device registered check, because otherwise it is not really needed.
>
> Fixes: 934aef885f9d ("drm: bridge: panel: Reset the connector state pointer")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Here is a bit more backgroud on this issue is available in this thread:
> https://lore.kernel.org/all/f0474a95-4ba3-a74f-d7de-ef7aab12bc86@samsung.com/
> ---
>  drivers/gpu/drm/bridge/panel.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index ff1c37b2e6e5..0ee563eb2b6f 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -83,8 +83,11 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>         drm_connector_attach_encoder(&panel_bridge->connector,
>                                           bridge->encoder);
>
> -       if (connector->funcs->reset)
> -               connector->funcs->reset(connector);
> +       if (bridge->dev->registered) {
> +               if (connector->funcs->reset)
> +                       connector->funcs->reset(connector);
> +               drm_connector_register(connector);
> +       }

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
