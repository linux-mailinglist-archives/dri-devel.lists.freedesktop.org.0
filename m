Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1C31D5BD5
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 23:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2706ED57;
	Fri, 15 May 2020 21:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6719E6ED57
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 21:49:30 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id se13so3439946ejb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 14:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hpbnK4RqqNcZZa0YjQ9eRujRX3tECBLfwP3DAbNQUT4=;
 b=bC2YW/FwplFbWLCWambsxkLu8KVFHwMsi1FN0fqeZ4jIEGGBPIiMvZqCgJ6EZ7Y82x
 Vy7G9gP6FqSXY7LqWVvfnyF+SGCn21icOVYZbO1W2hMni8j+idsw+8iQbKPkVcdUrzvu
 028oAle2Y8JwqirTv16Tu/ipfj++/9KrNVwLeXyNACfxLzjNi+DWyr/D51yR8V1iRJl8
 4K0S9MuYLaQQxXnIahvlLDvctVnxLrK9GD3PFzA+P0W3e0H3x8Do0zgx/Rw+91wxRhIp
 c3scnsELejcLjPZjEmG+iinUuk1JgNL9VTtkcwUbB8/E23j4cymDCoS7lLdMrgGUoUBU
 zU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hpbnK4RqqNcZZa0YjQ9eRujRX3tECBLfwP3DAbNQUT4=;
 b=WKt3Kjc71OQxNjHiAwtgK8AnHnCt91cU5ecUHZaCvT7jRFHn6m5JdiRWxFjHGTyAHl
 mit8Qai3NCRQCpy6N3icscx7ChAYiXlC/XWuoXx/iK7xGwhnj51gTC3k5Ynch6B/SnHp
 AR10AlbmuTxA8xoZe8B2Q4QnbbVnESearioTe/8lmmbSMmsdrrvi+bpYDDAfQZlBQxiu
 LmX0ut/O/HML9IfKR4L3t/zpdupui+Yk7XJAuyjyb4u8EJiDhHn5y0l/dEvTJmjxojHc
 1z9uZowctxE3V+yyFmYx/Rrm/jYdMI6zV+A31EDNu5mgETSBGTrwdtS2TfYLjpifQYpQ
 OI7Q==
X-Gm-Message-State: AOAM5300LmhWcKG0SP6LsvZu1k3d6u0M+bG4jaChusiikJh6kw15i1Aw
 Rtyu184lFdmwq+c0nV3W3VOYHoKrdMdwoReXN8l5BBhd
X-Google-Smtp-Source: ABdhPJxcOwuGB+qvjzbZYGfKzm25WDG8YmHx8jHmhDT9TWZ/bEKwEi5IfEnAbBzkagwaGEu5tLe0BjDXT69eoxYbszA=
X-Received: by 2002:a17:906:29d3:: with SMTP id
 y19mr4804200eje.258.1589579369030; 
 Fri, 15 May 2020 14:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
In-Reply-To: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 May 2020 14:49:48 -0700
Message-ID: <CAF6AEGs0qpzgGW8rYdmFqKW=QBbRxxzCWjO0LXsbm6hA0AJNyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix off-by-one error in clock
 choice
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 4, 2020 at 9:32 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> If the rate in our table is _equal_ to the rate we want then it's OK
> to pick it.  It doesn't need to be greater than the one we want.
>
> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 6ad688b320ae..be000b0ca56b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -475,7 +475,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
>                                    1000 * pdata->dp_lanes * DP_CLK_FUDGE_DEN);
>
>         for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
> -               if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
> +               if (ti_sn_bridge_dp_rate_lut[i] >= dp_rate_mhz)
>                         break;
>
>         return i;
> --
> 2.26.2.526.g744177e7f7-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
