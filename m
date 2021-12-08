Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C088646CCAA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 05:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD706E145;
	Wed,  8 Dec 2021 04:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317AA6E145
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 04:43:59 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id 7so2426844oip.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 20:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rd+j5j+A/ltOuK7rQ2SC4JfrJuxW264ZWQGgHOMWaxs=;
 b=EPFLc6hcqSLUoOeh+GNUVsfeJF00qoKKUuzB2uAZqd8AHEb+BtVBfmE8vVZZIgkiuM
 3KieSufO0fqA4B8cHdUS6NTshnydDBqQS0GbdRD0Fv6QtLJwmFONJ9RVwDTebWdurtUi
 jLHhP8qSQ6/arPzR7769MWq32PsXWVg0EgEqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rd+j5j+A/ltOuK7rQ2SC4JfrJuxW264ZWQGgHOMWaxs=;
 b=PO4IyEkXvQRw4nS2GsXVITn8b4VqK3SE9JjskLGQPhpqU7o6KGRXqPh7qvtuBnbbSm
 5FHt4iTQKFzWC31i2ECMqCvrt9DUfEGny1mNsnwc8v0NJJS34JiWSE4DhXKFh+SKT50S
 qg0bk7ma4VLWrnfeKokEwTkVZqDvdlW9ZFtgp+eKQ3AVz48wR+xmz0ImloBqz8rgGznT
 ItPi9pHoOot7R8j9kwps3W55F+2TqyNMgnBvjK+WZ+WCA70wG7NgQjOAGgTUiRLiCdTw
 09WcynDoXhQam6cJf5YNid1dzc7BFedEXlPibwOIXTimaPgUbOFpySy58m7rkra2oZqg
 dL7w==
X-Gm-Message-State: AOAM531NuVYJpXJY2oe4QMwOlw8o9ksimT4Kj22XvaFiswKR6CGEdoA+
 rSuckAKrRBL1CjN246bAFwKTbS7jWGh5HpgaZ3teig==
X-Google-Smtp-Source: ABdhPJxbPhPALpa9YOf2Yuk1/fk2GRgOHioOp0wS0T4qNd1uQnbM6dYNBdZUXWXxkz3w91sRMGI5pDArkPRWDBlG+jE=
X-Received: by 2002:a05:6808:211f:: with SMTP id
 r31mr9375277oiw.64.1638938638466; 
 Tue, 07 Dec 2021 20:43:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Dec 2021 23:43:58 -0500
MIME-Version: 1.0
In-Reply-To: <20211207215753.635841-1-robdclark@gmail.com>
References: <20211207215753.635841-1-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 7 Dec 2021 23:43:58 -0500
Message-ID: <CAE-0n52gbwsJXG7=hdQhcttTbucjBv9SBq+kng2Ansc=TyqCKg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: sn65dsi86: defer if there is no dsi host
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Clark (2021-12-07 13:57:52)
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
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

One more nit below

> v2: Drop DRM_ERROR() in favor of drm_err_probe() and shift around the
>     spot where we report the error
> v3: Add \n and cull error msgs a bit further
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 02b490671f8f..c2928a6409b1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -740,10 +736,8 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
>         pdata->dsi = dsi;
>
>         ret = devm_mipi_dsi_attach(dev, dsi);
> -       if (ret < 0) {
> -               DRM_ERROR("failed to attach dsi to host\n");
> +       if (ret < 0)
>                 return ret;
> -       }
>
>         return 0;

This can be simplified further to

	return devm_mipi_dsi_attach(dev, dsi);
