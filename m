Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C491846C4B4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B6C6EC18;
	Tue,  7 Dec 2021 20:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF936EC18
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 20:34:03 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id m9so539102iop.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 12:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8JlKV57a9V9sennPSYrTCjGTKh7q+B4XLkSCRyp0vI=;
 b=OyGGu7hDrNO24qeRpn0VzEiM2XdNfaluplhUq7WJQBiujEgb4/TREnIV8iBagDU5p7
 QASEKmnW0keiTwY9shZye/JhmIPsRdveSJX8ZK1d7EgAPI3fgLsqyR+0mgRg37okek52
 BEYSA5oYOq0+9DrS+y3nspapqAJUqL3DTFuoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8JlKV57a9V9sennPSYrTCjGTKh7q+B4XLkSCRyp0vI=;
 b=Yji3U+oDHpSfF8dPijYOCuoTPlKKo/LwT777elx4Lxvy5wr8pGEV9AA6Rz1p8A89Pd
 tJsz/EIipbCJTsnFFohi3Wf4TlSK+9pBIRNj/Nq/8uBcQM18mhD3AKb5046t7FS6TEzG
 ykf4jud4fesEZmGGQJNto2lyfu+AoMll/xEgtmZ70tIHJ/SVTn2VDzFYU7OARtTZthW7
 sMEx5Maek0BpeP3FATTf4Tx5EomINMxRXbcGNZJE+OPdMK3IPk6J4KyMTzeem+GBeDrT
 r8N6zcPelmbLs1saRSpKFYbkfT6E4rwYy01EFarmEikT5oiDJhoCNGf8j89c21z9rr+F
 gybw==
X-Gm-Message-State: AOAM533iMXUlUguaODMhlBNx1/it+fVGCA00nx3iSeP2MHO9K93d7bsL
 y5FOOcf0HcEUGtSoo28gnaW56pstTvPRBA==
X-Google-Smtp-Source: ABdhPJxJjVdrPcfLEfilpLJ8yiD/I0QpVfncZFFU/P21wvw3ayZu3rZjJ0CsV7bjFzM0MPOSj5es1Q==
X-Received: by 2002:a05:6638:3711:: with SMTP id
 k17mr53386119jav.72.1638909242895; 
 Tue, 07 Dec 2021 12:34:02 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id l1sm443362ioj.29.2021.12.07.12.34.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 12:34:02 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id c3so458226iob.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 12:34:02 -0800 (PST)
X-Received: by 2002:a05:6602:2c45:: with SMTP id
 x5mr1821503iov.98.1638908823019; 
 Tue, 07 Dec 2021 12:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20211207200906.609673-1-robdclark@gmail.com>
In-Reply-To: <20211207200906.609673-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Dec 2021 12:26:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X81r4eBPYz_v6vju8bpUJX+HWS1vUuO+oC0AJUWsnCRg@mail.gmail.com>
Message-ID: <CAD=FV=X81r4eBPYz_v6vju8bpUJX+HWS1vUuO+oC0AJUWsnCRg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: sn65dsi86: defer if there is no dsi host
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 7, 2021 at 12:03 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Otherwise we don't get another shot at it if the bridge probes before
> the dsi host is registered.  It seems like this is what *most* (but not
> all) of the other bridges do.
>
> It looks like this was missed in the conversion to attach dsi host at
> probe time.
>
> Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 02b490671f8f..3684e12fbac3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -716,7 +716,7 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
>         host = of_find_mipi_dsi_host_by_node(pdata->host_node);
>         if (!host) {
>                 DRM_ERROR("failed to find dsi host\n");
> -               return -ENODEV;
> +               return -EPROBE_DEFER;

Can you delete the DRM_ERROR line?

Thanks!

-Doug
