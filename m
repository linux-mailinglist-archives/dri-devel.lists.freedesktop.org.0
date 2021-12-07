Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F846C6DA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 22:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AEF6E0CE;
	Tue,  7 Dec 2021 21:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A5F6E0CE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 21:42:51 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b187so626965iof.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 13:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ld7GFu9I5ImAVII2taoKUmYqR/icJ65ORArYw4v0ttc=;
 b=nAZjM66YrDrs8HfAa2iTCYIWgi9qc/YsUgO5VAYK6/eQVvUw5DJAifluaZXeUqd1iF
 v0BFAkBj6IjQzFW0qnP8+30o9JfzzNyjPxxkAJp5859e/BduAVE136R8S7ATT6+5f4gn
 9J302+HRh1jPhAbGJ2IgovUoCD7uc7m2N3OSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ld7GFu9I5ImAVII2taoKUmYqR/icJ65ORArYw4v0ttc=;
 b=n/GzvYuGnRMRwe7bjJTE0URvrIHp0W3VtC16jLKQ2rynZZ3uOpWcinTMmgIDAMUxe6
 zl1tLTYqzl9gO2jCpMgrSydgK9mRZE/TScrHtCkmaiyB+4KeRnD6gVTH9ZKML8ca4pSk
 IBHzVtj8kEeBxHuTNh+9iSG+4t7S0ZCRQP+PmdqH9HFNRjtIvafo6CgyfTvMhzBkpWtb
 sWeLqSE9r9r5zNdvhtTnl66/2y6uHtek68D4fgWdSPpVOU+6nAozX/lH8YenBS3XdEn0
 AHdgc9kC4Pe7PAbC3PGWM55Ct6jSOKI9CLkD4htqvcJUFipHW6Gc5lwmUPxt6jRlGcua
 7kcw==
X-Gm-Message-State: AOAM532K2Pgr4+0lr89sO5MxhTaMmkgJgkbxVmp4fDobCKj66t+hfD0C
 XDubGk4KePCYjR7qpbdYQk6p5RJ1KSepiw==
X-Google-Smtp-Source: ABdhPJwEo13th7Va3rP2BSuJmfbRqfceKBPZDoxZFOapfY6tGUdr90wmyhduk9S4eJb1bVBSdSEXTg==
X-Received: by 2002:a6b:2cc5:: with SMTP id s188mr2300848ios.218.1638913370251; 
 Tue, 07 Dec 2021 13:42:50 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id x2sm580228iom.46.2021.12.07.13.42.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 13:42:49 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id m5so368575ilh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 13:42:49 -0800 (PST)
X-Received: by 2002:a92:ca0e:: with SMTP id j14mr2173215ils.27.1638913369355; 
 Tue, 07 Dec 2021 13:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20211207213830.625890-1-robdclark@gmail.com>
In-Reply-To: <20211207213830.625890-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Dec 2021 13:42:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VSRB45vFJZhVg7OTy2ZAv6UZ638YjQQiZemt9-AD1JXw@mail.gmail.com>
Message-ID: <CAD=FV=VSRB45vFJZhVg7OTy2ZAv6UZ638YjQQiZemt9-AD1JXw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: sn65dsi86: defer if there is no dsi host
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 7, 2021 at 1:33 PM Rob Clark <robdclark@gmail.com> wrote:
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
> v2: Drop DRM_ERROR() in favor of drm_err_probe() and shift around the
>     spot where we report the error
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 02b490671f8f..8f1321ca819e 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -714,10 +714,8 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
>         };
>
>         host = of_find_mipi_dsi_host_by_node(pdata->host_node);
> -       if (!host) {
> -               DRM_ERROR("failed to find dsi host\n");
> -               return -ENODEV;
> -       }
> +       if (!host)
> +               return -EPROBE_DEFER;
>
>         dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
>         if (IS_ERR(dsi)) {
> @@ -1267,8 +1265,10 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>         drm_bridge_add(&pdata->bridge);
>
>         ret = ti_sn_attach_host(pdata);
> -       if (ret)
> +       if (ret) {
> +               dev_err_probe(pdata->dev, ret, "failed to attach dsi host");

nit: Needs a "\n" at the end, doesn't it?


>                 goto err_remove_bridge;
> +       }

It's going to be a little funny now because if the
devm_mipi_dsi_attach() call fails you'll report "failed to attach dsi
host" twice (once using DRM_ERROR in ti_sn_attach_host() and once
here). Probably all the error messages could be removed from
ti_sn_attach_host() and you could rely on this new one because:
* devm_mipi_dsi_device_register_full() already appears plenty chatty.
* this is the same message that devm_mipi_dsi_attach() was printing out anyway.

In any case, it's not really a big deal, so with the "\n" added I'm
happy with my Reviewed-by.

I'm happy to apply this to to drm-misc-next tomorrow if there are no
objections. I can always add the "\n" myself unless you want to send a
v3 with it and/or want to remove more error messages. ;-)

-Doug
