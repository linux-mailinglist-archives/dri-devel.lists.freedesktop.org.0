Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78DDAE3A8A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 11:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9307010E2B4;
	Mon, 23 Jun 2025 09:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="HPZdwypH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BCE10E1CA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 09:34:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250623093437euoutp01e81d0739df7d3ed227e7afba3d71b2a8~LokBIr0l01125811258euoutp01F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 09:34:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250623093437euoutp01e81d0739df7d3ed227e7afba3d71b2a8~LokBIr0l01125811258euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750671277;
 bh=nYEpGwnZMbECtjsZvt1Boiv4MwZb6CSkkD5NxWj9A7I=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=HPZdwypHmtuRAUGGskJFy0j8Y3Es2IndsZq6UazKbMHJZ7bIo+0gmI0ivL0slMEAb
 BUhYRb8A6YdXGwC8eW91ZsLhjegcoG4YWgyprni0p0JzzG5UitgGh6FWjBo9KVKvcg
 3EN87VqTmq3Tx7hBe911DWrhHpeRTsHkjyJ0rKIk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250623093436eucas1p1194fc9459153962b58adee7429703f07~LokAfNQnH1023710237eucas1p1i;
 Mon, 23 Jun 2025 09:34:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250623093435eusmtip26281fc2cb3e7c704b4e588b25a4cba1f~Loj-XweoN0371103711eusmtip2i;
 Mon, 23 Jun 2025 09:34:35 +0000 (GMT)
Message-ID: <e23e6192-6e13-41b4-acdd-2593f4f37895@samsung.com>
Date: Mon, 23 Jun 2025 11:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix init order
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Inki Dae
 <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry
 Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Hiago De
 Franco <hiagofranco@gmail.com>, Francesco Dolcini <francesco@dolcini.it>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250623093436eucas1p1194fc9459153962b58adee7429703f07
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250619122746eucas1p149ff73e78cb82dc06c19960a2bbd3d89
X-EPHeader: CA
X-CMS-RootMailID: 20250619122746eucas1p149ff73e78cb82dc06c19960a2bbd3d89
References: <CGME20250619122746eucas1p149ff73e78cb82dc06c19960a2bbd3d89@eucas1p1.samsung.com>
 <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
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

On 19.06.2025 14:27, Tomi Valkeinen wrote:
> The commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> pre-enable and post-disable") changed the order of enable/disable calls.
> Previously the calls (on imx8mm) were:
>
> mxsfb_crtc_atomic_enable()
> samsung_dsim_atomic_pre_enable()
> samsung_dsim_atomic_enable()
>
> now the order is:
>
> samsung_dsim_atomic_pre_enable()
> mxsfb_crtc_atomic_enable()
> samsung_dsim_atomic_enable()
>
> On imx8mm (possibly on imx8mp, and other platforms too) this causes two
> issues:
>
> 1. The DSI PLL setup depends on a refclk, but the DSI driver does not
> set the rate, just uses it with the rate it has. On imx8mm this refclk
> seems to be related to the LCD controller's video clock. So, when the
> mxsfb driver sets its video clock, DSI's refclk rate changes.
>
> Earlier this mxsfb_crtc_atomic_enable() set the video clock, so the PLL
> refclk rate was set (and didn't change) in the DSI enable calls. Now the
> rate changes between DSI's pre_enable() and enable(), but the driver
> configures the PLL in the pre_enable().
>
> Thus you get a black screen on a modeset. Doing the modeset again works,
> as the video clock rate stays the same.
>
> 2. The image on the screen is shifted/wrapped horizontally. I have not
> found the exact reason for this, but the documentation seems to hint
> that the LCD controller's pixel stream should be enabled first, before
> setting up the DSI. This would match the change, as now the pixel stream
> starts only after DSI driver's pre_enable().
>
> The main function related to this issue is samsung_dsim_init() which
> will do the clock and link configuration. samsung_dsim_init() is
> currently called from pre_enable(), but it is also called from
> samsung_dsim_host_transfer() to set up the link if the peripheral driver
> wants to send a DSI command.
>
> This patch fixes both issues by moving the samsung_dsim_init() call from
> pre_enable() to enable().
>
> However, to deal with the case where the samsung_dsim_init() has already
> been called from samsung_dsim_host_transfer() and the refclk rate has
> changed, we need to make sure we re-initialize the DSI with the new rate
> in enable(). This is achieved by clearing the DSIM_STATE_INITIALIZED
> flag and uninitializing the clocks and irqs before calling
> samsung_dsim_init().
>
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> Reported-by: Hiago De Franco <hiagofranco@gmail.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Seems to be working fine on all my Exynos based boards:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


BTW, it was a long discussion how to handle the dsim initialization and 
we agreed to keep calling samsung_dsim_init() on first dsi transfer for 
Exynos case and from pre-enable for others:

https://lore.kernel.org/all/20221209152343.180139-11-jagan@amarulasolutions.com/

I'm not sure if changing this won't break again something, especially 
the boards with DSI bridge or panel controlled via I2C instead of the 
DSI commands. This has to be tested on the all supported variants of 
this hardware.


> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 29 +++++++++++++++++++----------
>   1 file changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index f2f666b27d2d..cec383d8946d 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1473,22 +1473,31 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   	}
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
> -
> -	/*
> -	 * For Exynos-DSIM the downstream bridge, or panel are expecting
> -	 * the host initialization during DSI transfer.
> -	 */
> -	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> -		ret = samsung_dsim_init(dsi);
> -		if (ret)
> -			return;
> -	}
>   }
>   
>   static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>   				       struct drm_atomic_state *state)
>   {
>   	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	int ret;
> +
> +	/*
> +	 * The DSI bridge may have already been initialized in
> +	 * samsung_dsim_host_transfer(). It is possible that the refclk rate has
> +	 * changed after that due to the display controller configuration, and
> +	 * thus we need to reinitialize the DSI bridge to ensure the correct
> +	 * clock settings.
> +	 */
> +
> +	if (dsi->state & DSIM_STATE_INITIALIZED) {
> +		dsi->state &= ~DSIM_STATE_INITIALIZED;
> +		samsung_dsim_disable_clock(dsi);
> +		samsung_dsim_disable_irq(dsi);
> +	}
> +
> +	ret = samsung_dsim_init(dsi);
> +	if (ret)
> +		return;
>   
>   	samsung_dsim_set_display_mode(dsi);
>   	samsung_dsim_set_display_enable(dsi, true);
>
> ---
> base-commit: 7872997c048e989c7689c2995d230fdca7798000
> change-id: 20250619-samsung-dsim-fix-58c8ec8193e9
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

