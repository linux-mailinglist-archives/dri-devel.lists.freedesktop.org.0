Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74104B9EFD3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 13:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD4D89C2C;
	Thu, 25 Sep 2025 11:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="SRzPHQsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DD889C2C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:47:59 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250925114757euoutp0242a6d5776d2e26679f5239662c5ba07c~ohBRbF-Re1205612056euoutp02n
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 11:47:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250925114757euoutp0242a6d5776d2e26679f5239662c5ba07c~ohBRbF-Re1205612056euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1758800877;
 bh=VO8foP5H4Ue/tAyEyJtS1OR2a2W/sOXrHOqpxaP+dII=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=SRzPHQsYIpb94X4QWwQnypT60QLIs3LABHBgpPU6U+n+nJs5ug+56/MTP7OdLzH3O
 OMpYDFav8JCC6JX9hVPSs/ZwF/C8cg5AGP1N8Klmlt2OJ7EjPuOdJc6kETl+XP+BKS
 +Qk7CK09EqyusWIMdlERhYDvD+ae2Mv8H4qKK/vE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250925114756eucas1p2fb0d86888580decc59de7ca0e68b7953~ohBQ90IKZ2841528415eucas1p26;
 Thu, 25 Sep 2025 11:47:56 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250925114755eusmtip2d6fe84522c4c068a21975601caabe8dd~ohBPJeL_P1686816868eusmtip2k;
 Thu, 25 Sep 2025 11:47:54 +0000 (GMT)
Message-ID: <6c7cdef8-f912-4147-a4a2-641070a478e8@samsung.com>
Date: Thu, 25 Sep 2025 13:47:52 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH RFC 2/2] drm/bridge: samsung-dsim: move clk setup to enable
To: Jan Remmet <j.remmet@phytec.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya
 Bhatia <aradhya.bhatia@linux.dev>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-2-94f9f775ee62@phytec.de>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925114756eucas1p2fb0d86888580decc59de7ca0e68b7953
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250925113632eucas1p2c49ddb268d3e4e9d3ae226b87bd89c03
X-EPHeader: CA
X-CMS-RootMailID: 20250925113632eucas1p2c49ddb268d3e4e9d3ae226b87bd89c03
References: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-94f9f775ee62@phytec.de>
 <CGME20250925113632eucas1p2c49ddb268d3e4e9d3ae226b87bd89c03@eucas1p2.samsung.com>
 <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-2-94f9f775ee62@phytec.de>
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

On 25.09.2025 13:35, Jan Remmet wrote:
> Move the samsung_dsim_init and so samsung_dsim_enable_clock to
> samsung_dsim_atomic_enable.
>
> The base clocks may not be ready when pre_enable is called.
>
> commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
> and post-disable") points out that pre_enable hook definition says that
> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> will not yet be running when this callback is called".
>
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>

Isn't this similar to this 
patch https://lore.kernel.org/all/20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com/ 
?


> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index b5dd71f6a99057d98cf15090f6081d0460836ec5..53ce3228586ac0f6abfa252b7c15d9eba459c96c 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1460,6 +1460,14 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   	}
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
> +}
> +
> +static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> +				       struct drm_atomic_state *state)
> +{
> +	pr_debug("%s called from %pS\n", __func__, __builtin_return_address(0));
> +	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	int ret;
>   
>   	/*
>   	 * For Exynos-DSIM the downstream bridge, or panel are expecting
> @@ -1470,12 +1478,6 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   		if (ret)
>   			return;
>   	}
> -}
> -
> -static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> -				       struct drm_atomic_state *state)
> -{
> -	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>   
>   	samsung_dsim_set_display_mode(dsi);
>   	samsung_dsim_set_display_enable(dsi, true);
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

