Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F246F8ABF9E
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 16:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2649F112499;
	Sun, 21 Apr 2024 14:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="ZO+Awh90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E4D1121DC
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 14:36:35 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1C99588195;
 Sun, 21 Apr 2024 16:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713710193;
 bh=YEoRSHwcuIoV9lvhxBb+yBEtm8sG36y0xSWgwI5ybKs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZO+Awh90Q/wSDpbLO1N3GxzLupRMxc5e9+b8AmpyMuFX9srK4IBdHiwOOSYAF7A7O
 1rWPb4Pe2Mi9dkFkQb6Q2oCHgEovzLnnzyeIy5wIaI+k1fKZJXl+JNEbSgC389LVxf
 36uHNkpMNjzrO8yT/K98FRFom+DyLmM5nrsoukkiRQdvEv+4MGurQ8jX4bdZ15R88x
 QSLsuryRul5BdAsnENwUqEiDwkXhK60x3yq8Wiov6s2dw6DDytT5GQcq9hWgU9xbiq
 dq5sgeW7sjY3k4vCQGJcmjX3+a90IObBF4aFq7HqWlt8Y1ncSQkT8Y46fb2/Rzy4Ox
 uVSc7Kmxy3DBQ==
Message-ID: <9c4a3bdd-fd57-4664-a908-ab1c8020e918@denx.de>
Date: Sun, 21 Apr 2024 16:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] drm/bridge: samsung-dsim: Set P divider based on
 min/max of fin pll
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org
References: <20240211230931.188194-1-aford173@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240211230931.188194-1-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/12/24 12:09 AM, Adam Ford wrote:
> The P divider should be set based on the min and max values of
> the fin pll which may vary between different platforms.
> These ranges are defined per platform, but hard-coded values
> were used instead which resulted in a smaller range available
> on the i.MX8M[MNP] than what was possible.
> 
> As noted by Frieder, there are descripencies between the reference
> manuals of the Mini, Nano and Plus, so I reached out to my NXP
> rep and got the following response regarding the varing notes
> in the documentation.
> 
> "Yes it is definitely wrong, the one that is part of the NOTE in
> MIPI_DPHY_M_PLLPMS register table against PMS_P, PMS_M and PMS_S is
> not correct. I will report this to Doc team, the one customer should
> be take into account is the Table 13-40 DPHY PLL Parameters and the
> Note above."
> 
> With this patch, the clock rates now match the values used in NXP's
> downstream kernel.
> 
> Fixes: 846307185f0f ("drm/bridge: samsung-dsim: update PLL reference clock")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> V2:  Only update the commit message to reflect why these values
>       were chosen.  No code change present
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 95fedc68b0ae..8476650c477c 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -574,8 +574,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
>   	u16 _m, best_m;
>   	u8 _s, best_s;
>   
> -	p_min = DIV_ROUND_UP(fin, (12 * MHZ));
> -	p_max = fin / (6 * MHZ);
> +	p_min = DIV_ROUND_UP(fin, (driver_data->pll_fin_max * MHZ));

The parenthesis around driver_data... are not needed.

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>
