Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A786AEF0C3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578D710E520;
	Tue,  1 Jul 2025 08:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TvqyMYMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793A010E520
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751357970;
 bh=y0AZawpjHW7SFgMPWSFOKe+kD46e6DMDPvzNjsfdVTA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TvqyMYMOeFtk9c5luFAIOTQYoymrZh6POrfEkdvkrEea2RLvse4H9cNe81W7o8mG3
 7iWlKv3dvcvWSWvHnEa99BG8T+DSnOpTNtrUcpObdWi+0MHVjjgQfNu3RWbrCm9B20
 HiArf3fZ1rUANUhmwr8l3z1HW8rT1m1rlHz3Mel96+L2JqarpETFhwNQYUftllA85l
 qVZQBOG/X5kl3KQGWhpO98cqAD6G7adIMhA+KGgp1NDQIgeVOiju6gCK4GsBNXDSo3
 SeXkEbbeS0mypsAZKSMlfN8DmORL8AS1HpjwFoqeFXPQvK85jr4JCx4QFrwxTUWI6Z
 pxNOUOpqfBdRQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 66C8117E0342;
 Tue,  1 Jul 2025 10:19:29 +0200 (CEST)
Message-ID: <27b09cde-2da2-49cf-b872-31adf7b5c4e6@collabora.com>
Date: Tue, 1 Jul 2025 10:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: dsi: Fix DSI host and panel bridge
 pre-enable order
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 01/07/25 09:30, Louis-Alexis Eyraud ha scritto:
> Since commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> pre-enable and post-disable"), the bridge pre_enable callbacks are now
> called before crtc enable, and the bridge post_disable callbacks after
> the crtc disable.
> In the mediatek-drm driver, this change leads to transfer errors on
> mtk_dsi_host_transfer callback processing during the panel bridge
> pre-enable sequence because the DSI host bridge pre_enable and CRTC
> enable sequences, that are enabling the required clocks and PHY using
> mtk_dsi_poweron function, are called after.
> 
> So, in order to fix this call order issue, request the DSI host bridge
> be pre-enabled before panel bridge by setting pre_enable_prev_first
> flag on DSI device bridge in the mtk_dsi_host_attach function.
> 
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> This patch fixes an issue that can be observed on boards such as
> MediatekGenio 1200-EVK or 350-EVK with a kernel based on linux-next
> (tag: next-20250635) since commit c9b1150a68d9 ("drm/atomic-helper:
> Re-order bridge chain pre-enable and post-disable").
> In boot logs, there are multiples errors such as IRQ timeouts and
> panel init errors, leading the DSI panel not being enabled:
> 
> Example on Genio 1200-EVK:
> ```
> [drm] Wait DSI IRQ(0x00000002) Timeout
> panel-himax-hx8279 1c008000.dsi.0: sending generic data b0 05 failed:
>    -62
> [drm] Wait DSI IRQ(0x00000008) Timeout
> [drm:mtk_dsi_host_transfer [mediatek_drm]] *ERROR* failed to switch cmd
>   mode
> panel-himax-hx8279 1c008000.dsi.0: sending DCS SET_DISPLAY_ON failed:
>    -62
> ```
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d7726091819c4762698b41060b3d4d8d27940238..0e2bcd5f67b767d92f2697a5b8183f67ee178a38 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1002,6 +1002,12 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>   			return PTR_ERR(dsi->next_bridge);
>   	}
>   
> +	/*
> +	 * set flag to request the DSI host bridge be pre-enabled before device bridge
> +	 * in the chain, so the DSI host is ready when the device bridge is pre-enabled
> +	 */
> +	dsi->next_bridge->pre_enable_prev_first = true;
> +
>   	drm_bridge_add(&dsi->bridge);
>   
>   	ret = component_add(host->dev, &mtk_dsi_component_ops);
> 
> ---
> base-commit: c6a68d8f7b81a6ce8962885408cc2d0c1f8b9470
> change-id: 20250630-mediatek-drm-fix-dsi-panel-init-1a4b534c40a6
> 
> Best regards,


