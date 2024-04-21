Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8048ABFA2
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 16:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFBF11249D;
	Sun, 21 Apr 2024 14:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="vG8yyUS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512651121DC
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 14:36:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 45001881E5;
 Sun, 21 Apr 2024 16:36:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713710194;
 bh=RPV0Iz8yy+LInEIx4qwiC7zvbeZKL5hgL5XRaRhSxPA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vG8yyUS5eItl3QcJPKS9Dpaio8o/QryYvAULFuI7W7vrBY54u21latTBVHDd5DkJL
 3KCxJSmdg4RK0mag1Ey0XNZpsqAcVGS4OWH+s36Z8pfwSfafdzEJMCnDX8/sTIsh+3
 PdpIcZQCn0z24lTNWr99tBmtRFCh4oRNzAtGJe8/kBWTpNCOCY5qKvUC7dMtTlPQjk
 nPuN5b4aZp3wVg6eBPPbTHq1n5pb3CfIMoBZBfhA6rfOHW1aiRa2eLE3aWHVD1ZdAO
 D/M9oVd+XuKQbPbtpf8d2Vyyy6UMelVgh44UkwrEGlx9jEPShzHfrU0YtdlEPGDUUJ
 3yQ1IANnjSlng==
Message-ID: <6111fe04-4ecb-428e-9a0c-dc02cadfe3e7@denx.de>
Date: Sun, 21 Apr 2024 16:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
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
 <20240211230931.188194-2-aford173@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240211230931.188194-2-aford173@gmail.com>
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
> When using video sync pulses, the HFP, HBP, and HSA are divided between
> the available lanes if there is more than one lane.  For certain
> timings and lane configurations, the HFP may not be evenly divisible.
> If the HFP is rounded down, it ends up being too small which can cause
> some monitors to not sync properly. In these instances, adjust htotal
> and hsync to round the HFP up, and recalculate the htotal.
> 
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.MX8MM with HDMI monitor
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  No changes
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 8476650c477c..52939211fe93 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1606,6 +1606,27 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
>   		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>   	}
>   
> +	/*
> +	 * When using video sync pulses, the HFP, HBP, and HSA are divided between
> +	 * the available lanes if there is more than one lane.  For certain
> +	 * timings and lane configurations, the HFP may not be evenly divisible.
> +	 * If the HFP is rounded down, it ends up being too small which can cause
> +	 * some monitors to not sync properly. In these instances, adjust htotal
> +	 * and hsync to round the HFP up, and recalculate the htotal. Through trial
> +	 * and error, it appears that the HBP and HSA do not appearto need the same
> +	 * correction that HFP does.
> +	 */
> +	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->lanes > 1) {

Does this also apply to mode with sync events (I suspect it does), so 
the condition here should likely be if (!...burst mode) , right ?
