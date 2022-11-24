Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6062637701
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 12:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB5B10E04F;
	Thu, 24 Nov 2022 11:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C19710E6F2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1669287653; x=1700823653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TKsmYGKYqQviZJozhSmWaRTpNKVgkOaOV5+wyTY4lf4=;
 b=ONcIwu8BkzPWoXS/K+DPhaT54ABBqAIf6krONh8mESHEb+LR9Vr6FyJ3
 QNrFIZobPZdus6IkRuWcA9mOon3C47f5XknfCu3I7ZB9Lk+4HNl2yS0kV
 ktcIZ01uFMdB3H6EFYZN1tlowAZ1zoO3fM9HVEdEnqnMv95imWRFt9kjP
 z5pXPKJHqaPW4XBCE4lX6sgOHExyZYumkvFwoaOF+rc7aiSPGXG1u+W/t
 81jHqUIrmLkav+Vp63+DkM6CnJ3Mhr2UdNCXSXG5ulQKhEgPqQT+tS6YM
 Xgj+pIT3u+dfeZMQdoVwoEmsOX9UgQIaFXPJt3y/ADE8Atk/3JokSSPDx w==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; d="scan'208";a="27559212"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 24 Nov 2022 12:00:50 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 24 Nov 2022 12:00:50 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 24 Nov 2022 12:00:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1669287650; x=1700823650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TKsmYGKYqQviZJozhSmWaRTpNKVgkOaOV5+wyTY4lf4=;
 b=lAvHyzOo6Pjn32Y9f9SKk7orxpl0h4UIhBVAXqEoUtTJixflj802qCxj
 51wxjUkLMoNdTsxouXcPmaNOy1RU3gumpOD0W2lR+9En+kOKMRs8aSY0F
 u8rAaz8FUpKZMB/eZaeFeVGy3mrr77ldOrSkM5HLg07eHMFph5ke1cCsh
 2TyedO30gaNur/3ECF5LwvvgKyWJFkdh6Q/Vaa1oWyZv6x4Xdx1YMRbtG
 tSOcqxA9BRGEwTSh7BBPnA8uk+fomj6s3EAaeC0sN8iCvosSuclsg8M9o
 mNPJZi6PBm8d11SKOOHzwwf32jvT1qwPCP9G5sJFfcJh6+m9DVVpn6IwU Q==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; d="scan'208";a="27559210"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 24 Nov 2022 12:00:50 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0B7B7280056;
 Thu, 24 Nov 2022 12:00:50 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Frieder Schrempf <frieder@fris.de>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Fix delay after reset deassert
 to match spec
Date: Thu, 24 Nov 2022 12:00:48 +0100
Message-ID: <9079928.rMLUfLXkoz@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122081219.20143-1-frieder@fris.de>
References: <20221122081219.20143-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?ISO-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 22. November 2022, 09:12:18 CET schrieb Frieder Schrempf:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The datasheet specifies a delay of 10 milliseconds, but the current
> driver only waits for 1 ms. Fix this to make sure the initialization
> sequence meets the spec.
> 
> Fixes: ceb515ba29ba ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
> SN65DSI84 driver") Signed-off-by: Frieder Schrempf
> <frieder.schrempf@kontron.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> b/drivers/gpu/drm/bridge/ti-sn65dsi83.c index 7ba9467fff12..047c14ddbbf1
> 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -346,7 +346,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge
> *bridge,
> 
>  	/* Deassert reset */
>  	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
> -	usleep_range(1000, 1100);
> +	usleep_range(10000, 11000);
> 
>  	/* Get the LVDS format from the bridge state. */
>  	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);

How about using fsleep?

Either way:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>


