Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978204ED968
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 14:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BC910EF32;
	Thu, 31 Mar 2022 12:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A3610EFAE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 12:10:38 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id i11so11929404plg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ox4rz6YRVcfXWHpA6kKmHSGHY0QqUhO6Z39UNGdxpQ0=;
 b=yGT7RkHY+3cbsxmHlPY9UXbA3nfpydj9rRKHiwxCFUft9IQ4TzK4VfPGnhvwZuy5tS
 N/eDThHS3XsQ96o6x7vqFATDvaQOCmTZ7GW02plZ9tpJhUHTqn6/h7JQ5mIyuJ0qEy1g
 txD8GMzl+gqVBvnJ1qs30qWvMN86/BiLfK3NFsSouox2N07AInXGYBNVAcpSPls2rHWu
 m3qAZ0GHpB4kumhs5v9BOP01FJcKHzfsf8Q1yc3cUrjbgr1ioujHB6zeffRRtzzsha2f
 h5wB6eJ+W0rHqFOLu4WuFIXPeKPVm0F5HlsWiLphILQvTcssJ2elGgtVkfrkGuuGH9Q9
 jT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ox4rz6YRVcfXWHpA6kKmHSGHY0QqUhO6Z39UNGdxpQ0=;
 b=c46SrTHy8NiIxTfPazGspRu6KtCjDqkqZ4J0CEzOmMfogzJScB/peb7rCmE8I/TkjF
 K2zIFVfy7op19az1eI6IdcPFLrglQ2XQftIfZ7/qgU3jcFOAJcGs6nTjrcaP4lX5x+GM
 2pmY5lQLDE4HawPL7+lQfq2a4HF+i+uSdPWL1a0fMBvHd7n6Ce+wgQJKJf+61g69tTPH
 iZeSu72C+6sDdP6UQJl9KLdUlJRGgHPV2nVXRSLPi8iO/s98KTj7zN+xrdRoddv3soo1
 Ai4EH3iWbmOsEe/XjOIBFn7dhnpsIPGtXbGdV7uoDYCtY6pWzVFGw1WKZz4WlgBFKeKV
 XZWA==
X-Gm-Message-State: AOAM531BRd4YIzpt4/6b7HCUUNXo/Kg2lCqrmzOtic6VxH5s4pPnpdja
 OiSJvuv0Dk3QrXh6803JMTQs0nRLv2+/h6dNjvu/UA==
X-Google-Smtp-Source: ABdhPJwXRP6HA5dVyzIYWaJb5Rxiltx3tj8tf8rTjx1hpMujjCpjtDsk7GtvG6/jgaSv+GRlvEEQZljwd3IZLjwlrO8=
X-Received: by 2002:a17:903:30c4:b0:153:c102:8b9a with SMTP id
 s4-20020a17090330c400b00153c1028b9amr40913879plc.21.1648728637750; Thu, 31
 Mar 2022 05:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220321104705.2804423-1-l.stach@pengutronix.de>
In-Reply-To: <20220321104705.2804423-1-l.stach@pengutronix.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 14:10:26 +0200
Message-ID: <CAG3jFysVEO_MYi3TK1_y2Qh2H+adwtVyZ6sONA2JioE3L7hVuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: clean up CEC adapter when probe fails
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Mar 2022 at 11:47, Lucas Stach <l.stach@pengutronix.de> wrote:
>
> When the probe routine fails we also need to clean up the
> CEC adapter registered in adv7511_cec_init().
>
> Fixes: 3b1b975003e4 ("drm: adv7511/33: add HDMI CEC support")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> The "fixed" commit is not the one introducing the issue, it had been
> there as long as the driver supported CEC, but is the earliest commit
> that allows conflict free backporting.
> 864c49a31d6b ("drm/bridge: adv7511: Register and attach our DSI
> device at probe") made the issue much more likely to be hit, as the
> DSI attach may return -EPROBE_DEFER, so the cleanup path is exercised
> a lot more.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index f8e5da148599..370eb8d5d39b 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1298,6 +1298,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>         adv7511_audio_exit(adv7511);
>         drm_bridge_remove(&adv7511->bridge);
>  err_unregister_cec:
> +       cec_unregister_adapter(adv7511->cec_adap);
>         i2c_unregister_device(adv7511->i2c_cec);
>         clk_disable_unprepare(adv7511->cec_clk);
>  err_i2c_unregister_packet:
> --
> 2.34.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
