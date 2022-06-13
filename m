Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA96549F60
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EDF10ED67;
	Mon, 13 Jun 2022 20:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BB210ED67
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:34:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9210E83F6B;
 Mon, 13 Jun 2022 22:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655152466;
 bh=Aj+JbrXJ3Vb3rCubl4hX9PTSZr9yPYsFUxgC7bRlQFQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=0Pi6pVdOhyxfL2M5KnpeYvf6eLm2s2IY4L/3a7ATG9LhXIYR1XimXBRzOnLlMFUU6
 Vua5233Q9x7Di+6J6dAmlvmrvs1EkbBjNagbT0RxxAW777fvfab6aUHd0gOSvrvQiU
 C457bPA9xU20jPZQ+463h08REHgUBL2k2gHHpEFHkz/rBY9kXvY741i903M2TJCAqu
 FfrUMut0Ig4n1JzQyGlpDhf3LIgHP+9p/Ho9EwziJyWVy8T+jEoi+pfYDfjRnjiolk
 U+4ahveaLtJzUlIneyKmcs0p+yaaZWB+zxKewror36gU//vZJI7IIzDu1ECc1BFvUY
 E5aAH3/rd/w9g==
Message-ID: <3d758f49-74fa-d442-b176-bf1a1da8b88c@denx.de>
Date: Mon, 13 Jun 2022 22:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/bridge: tc358767: don't fixup mode polarity
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220610183902.268375-1-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220610183902.268375-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/10/22 20:39, Lucas Stach wrote:
> It doesn't always work, as there is just a single adjusted mode, so if
> parts of the display pipeline disagree on the required sync polarity
> it's possible to end up with a invalid config. However it also isn't
> necessary for this bridge chip, as the DPI interface has a configurable
> sync polarity, so we can just set it up to match the mode.

The commit message could use a rewrite, it's not easy to figure out what 
you're fixing here from the commit message.

[...]

> -static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 struct drm_display_mode *adj)
> -{
> -	/* Fixup sync polarities, both hsync and vsync are active low */
> -	adj->flags = mode->flags;
> -	adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> -	adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> -
> -	return true;
> -}

This is also called from tc_common_atomic_check() , remove it there too.
