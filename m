Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804CD4A4BE6
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 17:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A28310E15F;
	Mon, 31 Jan 2022 16:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6699010E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 16:25:34 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id i17so13247854pfq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 08:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tH4Dt4VfD+f2v5yRHdWa89N16xlCoMNOcH1dEff8QrA=;
 b=esoJHuFWJuRYH89Lq143BAKhwHoiqJwjnoXsYbx2bmRYpJFO180G1vxNSfZ+Icd7Bp
 M6a1pOoVNMGUZskUPl1PEDmx4Qmbo8woVamQs8dCEZvgserXopUfCrdPhk9W7eOLioaX
 1TgQmNv8RYLneEjejDfEZgFZFJLerQDzApiFlUk7J3G3UwEoQhhvV6bFcYSHFggWKefA
 HV0PDonrmnrk86JLcR0QIEZJ7RFBdWIHUvU+Ku+BLgEKZSoL9xpi0+K/9g35aWZ+Wij2
 0zKmOblDkVXxxsDqXQYmGvDC3ZV8vnJeQL2ebaNRabmYyOlTU2uVrkgCy36ln+vsP0Ns
 cDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tH4Dt4VfD+f2v5yRHdWa89N16xlCoMNOcH1dEff8QrA=;
 b=QB0tb3BZXuV/tFKOlkxaH0ldLOFOcCFwEoWuElYmNXuOooIeRJtw0QEfXs26ZzARw7
 4wlkADXbOExDbKDbOo01g0xFOxV5dr7xHb59pvPhy+ksiCDvNzk3UiN/gd6BOnjj+5x0
 xbaXaRtNAC6CtVh1zVTFKruDoSCPerSwqbund00vPEY2JTYkm+IvWmABAPAAQz6EY15T
 AxJQADSvnC8g1MbjsHaPNmJufz+pbNgO0rhUL/PereCdVfoxH2j+P2IOXW2KSVANO8+9
 ZFxK4OqJqPf1+h92T+GjZe6iw6b7xRMBfYIfml8ZNnXKZfQQ4silalOXrSRxSG8sHQhw
 KwJQ==
X-Gm-Message-State: AOAM532iaDGV5fmvgGZKf7KV3zTq+Q06k5hm7kQE8wcrwxT7V1759qMB
 qx9kqaSLqjXR4EA5NNXb9pQ+zuR1CRY3gQJHUTx04A==
X-Google-Smtp-Source: ABdhPJwENZbL1Q+TBrnar+Rgwvb0PPSNZUScFAwdzFtfG/EkQzbwzbSc1S0LLCdkRYee1cv7+KDyPaKyJ9FQMuMBAK0=
X-Received: by 2002:aa7:8490:: with SMTP id u16mr20808783pfn.1.1643646333972; 
 Mon, 31 Jan 2022 08:25:33 -0800 (PST)
MIME-Version: 1.0
References: <9c20eb74d42f6d4128e58e3e46aa320482472b77.1643468761.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <9c20eb74d42f6d4128e58e3e46aa320482472b77.1643468761.git.christophe.jaillet@wanadoo.fr>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 31 Jan 2022 17:25:22 +0100
Message-ID: <CAG3jFytrA4D2-JrABb+iG2kFQHVB5-_UQWoQyFJ3R=rfarre-A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt9611: Fix an error handling path in
 lt9611_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Christophe,

Thanks for submitting this fix.

On Sat, 29 Jan 2022 at 16:06, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If lt9611_audio_init() fails, some resources still need to be released
> before returning an error code.
>
> Add the missing goto the error handling path.
>
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index dafb1b47c15f..00597eb54661 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1164,7 +1164,11 @@ static int lt9611_probe(struct i2c_client *client,
>
>         lt9611_enable_hpd_interrupts(lt9611);
>
> -       return lt9611_audio_init(dev, lt9611);
> +       ret = lt9611_audio_init(dev, lt9611);
> +       if (ret)
> +               goto err_remove_bridge;
> +
> +       return 0;
>
>  err_remove_bridge:
>         drm_bridge_remove(&lt9611->bridge);
> --
> 2.32.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
