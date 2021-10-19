Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA4E433278
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 11:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F186EB6B;
	Tue, 19 Oct 2021 09:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534A36EB6B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 09:38:23 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id g184so18808764pgc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FmZwwurzHUIgzog1mbj4L9gUB3DIhNbg7RscBTn6OoM=;
 b=WyH//UHrgcnR42KDwu/l6zEOk0qExpjbMQ0Pn5rH2+ifefhuNxf7Av9Jw8lJavvn3q
 zceyGUfXcu6kMhgdfnpYLK6Q3KgkMSdBNuHoOdBp/agB0LwXdgT3fR0qHqHxdNldStbn
 XtRjboBsRrCTUIEiNp7MTITB5Ugym/VxfL4iDoK4tBc2MxqA36VpzNxmTIrQ5u5CBVik
 laZp74RctWJ7lY59dTgvLyfqXFaXr/snUWMEAxOsa51zINI9ik6YvU7qUyQv/Q6ExUgN
 2/DTzH0jenlIjJUXED2SqNlA8OqG/DhCHa1Vv8LOqnl51Uw9Jhn5IIcOHUu8XAj7NVCT
 MNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FmZwwurzHUIgzog1mbj4L9gUB3DIhNbg7RscBTn6OoM=;
 b=iXOXYanXFBLEYtGhZkC7CSKrW90OMWf6cGTQnUqnd15fV7yKWAgBJhQBkVpscj6MrM
 mDGUw1NrBo+iU3IDpOzcT+qklgVUYEsKcxJRnY0/JbouEsIU3lae8m2GGcioyubV9R1E
 tVMXu6aqzefVchNxrVACf4iMrUbvgh7WITFI3fO5nZIjJ/If6/b/tBgQCL+p5XAYY9NW
 6NZ6vE8MBNU6quflAX9P/R3EXwGMwBNG+l8AAMAyNGzFO+KtxIsNO10Te/d1ShOTPert
 kbAdVZf0HMJ32cbECriCHuGNfLsj6rDICx853q1dB0bk4Q/eFk4yU9y2d70EdCdQaUnN
 R6nw==
X-Gm-Message-State: AOAM532nXGSrapIG4JjyDgbWyQ/6QgmEiuZgd9oMLjtTWGEnDcNS/zTL
 YaMzEy0laiToqi4JWAA2ENADcuxJ06YUmJ63GwI22Q==
X-Google-Smtp-Source: ABdhPJwAa5Tkb1+PY4gY9OfoU4QL7eAw3O6I0M/OFPLc5LvmUh3TBaJ+WIXX7r5Nq/4I0WZ4dUVwzv2cpAZw3WjZxWI=
X-Received: by 2002:a63:b708:: with SMTP id t8mr6585637pgf.410.1634636302940; 
 Tue, 19 Oct 2021 02:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211002233447.1105-1-digetx@gmail.com>
 <20211002233447.1105-6-digetx@gmail.com>
In-Reply-To: <20211002233447.1105-6-digetx@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Oct 2021 11:38:12 +0200
Message-ID: <CAG3jFytesDqy8B43VWL46_47sOWkisrp7ytF33X2aU6wP=mjoQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drm/bridge: tc358768: Correct BTACNTRL1 programming
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, linux-tegra@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> TXTAGOCNT and RXTASURECNT bitfields of BTACNTRL1 register are swapped in
> the code, correct them. Driver doesn't implement low power mode for now,
> so this change doesn't make a practical difference yet.
>
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index cfceba5ef3b8..fd585bf925fe 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -790,7 +790,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>         val = tc358768_ns_to_cnt(val, dsibclk_nsk) - 1;
>         val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk),
>                                   dsibclk_nsk) - 2;
> -       val |= val2 << 16;
> +       val = val << 16 | val2;
>         dev_dbg(priv->dev, "BTACNTRL1: 0x%x\n", val);
>         tc358768_write(priv, TC358768_BTACNTRL1, val);
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
