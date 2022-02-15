Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139894B794B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 22:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D72510E38C;
	Tue, 15 Feb 2022 21:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20DF10E38C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 21:31:23 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id n5so15873660ilk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 13:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fele8naCnj1tSHRyG9Ogo68xWxTgJNE5hEc6t985U/Y=;
 b=LZbo2DiOH2tF8Tl/t20r4OjE/KvnsUs22LNv7+pZLZ5HIaTwZBqaF3RtAUUkAPDCOZ
 GumOIavgQoROuq7iGLNguigwifsX10SlH0/8Rh9RwLTK2Tp2DNoNJkJcc2FBrePaIk6L
 lbGzzlgNgGf7bUUma7sCUxDF7/TpqLm2sRqnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fele8naCnj1tSHRyG9Ogo68xWxTgJNE5hEc6t985U/Y=;
 b=QqYvPP7PfFXEJbElu/elvOuiwY5M/OktGxvqvEPsJDPBHs1EqsckQn2E+m1EWo0V+n
 FhDoMR23x2dMbkMiIHp6Paw4OLLhVSrhuHUhlGst1RIGjF3FHO1L+81oSnSQHX4mVmmL
 TjD5sK6e+r/m1TUNSLAyCLJTPxe2ef7pG/3epr9F41feNU/6i0EzoCI0FO4Zv1c14qvx
 uFfYd+gq+kAkR94wYBkZQKKcr4MkFk/Mly3Pt75zjlh4RSTLK8oebJKYlB5d+c/GwiMB
 lkfDstkbxzkSjRjpTw0duyO+FqwF21Y0LIQ+tk38tTjqUbSk+NUVrImeXNT/BOuxQsM+
 56WQ==
X-Gm-Message-State: AOAM531NhEx4u3JWXDpJMwyODHW+MifZatMDGcN9vs+u+Ruxxyx9ZEYE
 OQZfzuVSB0RY3Pit3/Bf8QSlZgWz2j7XjQ==
X-Google-Smtp-Source: ABdhPJynhcqJj5ec79GXxJZG0MJABRWP9C7aZVwYVAIvN/olaAh/BxCv9RK0buZSAbDXCvFhh3PB9w==
X-Received: by 2002:a05:6e02:19c9:: with SMTP id
 r9mr650515ill.172.1644960682775; 
 Tue, 15 Feb 2022 13:31:22 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170])
 by smtp.gmail.com with ESMTPSA id g21sm24459574iow.4.2022.02.15.13.31.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 13:31:21 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id p11so35033ils.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 13:31:21 -0800 (PST)
X-Received: by 2002:a05:6e02:1bef:: with SMTP id
 y15mr639379ilv.120.1644960680707; 
 Tue, 15 Feb 2022 13:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20211001144212.v2.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
In-Reply-To: <20211001144212.v2.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Feb 2022 13:31:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XU0bYVZk+-jPWZVoODW79QXOJ=NQy+RH=fYyX+LCZb2Q@mail.gmail.com>
Message-ID: <CAD=FV=XU0bYVZk+-jPWZVoODW79QXOJ=NQy+RH=fYyX+LCZb2Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Grab runtime PM reference for
 DP-AUX
To: Brian Norris <briannorris@chromium.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "# 4.0+" <stable@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Oct 1, 2021 at 2:50 PM Brian Norris <briannorris@chromium.org> wrote:
>
> If the display is not enable()d, then we aren't holding a runtime PM
> reference here. Thus, it's easy to accidentally cause a hang, if user
> space is poking around at /dev/drm_dp_aux0 at the "wrong" time.
>
> Let's get the panel and PM state right before trying to talk AUX.
>
> Fixes: 0d97ad03f422 ("drm/bridge: analogix_dp: Remove duplicated code")
> Cc: <stable@vger.kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> Changes in v2:
> - Fix spelling in Subject
> - DRM_DEV_ERROR() -> drm_err()
> - Propagate errors from un-analogix_dp_prepare_panel()
>
>  .../drm/bridge/analogix/analogix_dp_core.c    | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index b7d2e4449cfa..6fc46ac93ef8 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1632,8 +1632,27 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>                                        struct drm_dp_aux_msg *msg)
>  {
>         struct analogix_dp_device *dp = to_dp(aux);
> +       int ret, ret2;
>
> -       return analogix_dp_transfer(dp, msg);
> +       ret = analogix_dp_prepare_panel(dp, true, false);
> +       if (ret) {
> +               drm_err(dp->drm_dev, "Failed to prepare panel (%d)\n", ret);
> +               return ret;
> +       }
> +
> +       pm_runtime_get_sync(dp->dev);
> +       ret = analogix_dp_transfer(dp, msg);
> +       pm_runtime_put(dp->dev);

I've spent an unfortunate amount of time digging around the DP AUX bus
recently, so I can at least say that I have some experience and some
opinions here.

IMO:

1. Don't power the panel on. If the panel isn't powered on then the DP
AUX transfer will timeout. Tough nuggies. Think of yourself more like
an i2c controller and of this as an i2c transfer implementation. The
i2c controller isn't in charge of powering up the i2c devices on the
bus. If userspace does an "i2c detect" on an i2c bus and some of the
devices aren't powered then they won't be found. If you try to
read/write from a powered off device that won't work either.

2. In theory if the DP driver can read HPD (I haven't looked through
the analogix code to see how it handles it) then you can fail an AUX
transfer right away if HPD isn't asserted instead of timing out. If
this is hard, it's probably fine to just time out though.

3. Do the "pm_runtime" calls, but enable "autosuspend" with something
~1 second autosuspend delay. When using the AUX bus to read an EDID
the underlying code will call your function 16 times in quick
succession. If you're powering up and down constantly that'll be a bit
of a waste.


The above will help set us up for when someone goes through and
enables the "new" DP AUX bus and generic eDP panels on for
analogix-edp. See commit aeb33699fc2c ("drm: Introduce the DP AUX
bus"). In that case panels will actually be instantiated DP AUX
Endpoints instead of platform devices. They'll be given the DP AUX bus
and they'll be able to read the EDID over that. In this case, the
panel code turns itself on (it knows how to turn itself on enough to
read the EDID) and then calls the DP AUX transfer code. :-)


For a reference, you could look at
`drivers/gpu/drm/bridge/ti-sn65dsi86.c`. Also
`drivers/gpu/drm/bridge/parade-ps8640.c`

-Doug
