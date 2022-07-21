Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DCE57D28C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 19:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F5F18B1B5;
	Thu, 21 Jul 2022 17:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D3A18B109
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 17:29:02 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 378316601ABB;
 Thu, 21 Jul 2022 18:29:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658424541;
 bh=ZwBOqbXQCiDJrGaaYB3nSbHLVzztmKxAsw+KrM0BKjE=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=H4cpsF3fvmDf6Py8DbatCE8t/PKBhBzn+rpNJbPfCKhWbWJt429xCGiQroxcd/IXV
 vdBjvxCzc/7oXEcOzDFngg1PA9XuIwrWU2zFhYcuRlkYmPtcAtBDYG/1PvtdO2s7rK
 uIRCHpfMdCY7aP6HT6S9d5piuwtY71nMgB8svJokMwtel7+hnVr7knD20X85UOniuy
 TmW5SU4NAglwuyYv91c5/sYWV1nqS8ujxPjsCRGFqfNdeadrvqqvN+/chKN902CEBL
 aJmbJWkQqWgqTZFK4vZ14WrFJmDkZ0ZJhLg42CJ/eviX/atTknDZmL/WjFvIUvkykS
 TSLf0zx89wU4g==
Message-ID: <7a5b9c8a-f074-e6ce-d458-61068452e43f@collabora.com>
Date: Thu, 21 Jul 2022 19:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
 <1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com>
Content-Language: en-US
In-Reply-To: <1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/05/22 04:00, xinlei.lee@mediatek.com ha scritto:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> In order to match the changes of "Use the drm_panel_bridge API",
> the poweron/poweroff of dsi is extracted from enable/disable and
> defined as new funcs (atomic_pre_enable/atomic_post_disable).
> 
> Since dsi_poweron is moved from dsi_enable to pre_enable function, in
> order to avoid poweron failure, the operation of dsi register fails to
> cause bus hang. Therefore, the protection mechanism is added to the
> dsi_enable function.
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Hello Xinlei, CK, maintainers:

This patch is breaking machines that are using a DSI->DisplayPort bridge (like
the ANX7625 chip), but that's not the main issue.

----> I have never given a Reviewed-by tag for this commit <----

It's true I've given my tag for an older version [1] of this one, which was *not*
using atomic_* callbacks and that one worked fine (which is why I gave you
my R-b tag for it).

You have changed commits in this series to use atomic_(pre_)enable callbacks
but kept my tag, which is seriously wrong - and even more, because it's actually
breaking display support for a generous number of Chromebooks upstream.


Please be careful next time and ask for a new review when you make substantial
changes to your commits.


Anyway, I have already sent a fix for this situation, please look at [2].

Regards,
Angelo

[1]: 
https://patchwork.kernel.org/project/linux-mediatek/patch/1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com/

[2]: 
https://lore.kernel.org/lkml/20220721172727.14624-1-angelogioacchino.delregno@collabora.com/T/#u

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 53 +++++++++++++++++++-----------
>   1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index f880136cec09..d9a6b928dba8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -691,16 +691,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>   	if (--dsi->refcount != 0)
>   		return;
>   
> -	/*
> -	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> -	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
> -	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
> -	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
> -	 * after dsi is fully set.
> -	 */
> -	mtk_dsi_stop(dsi);
> -
> -	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
>   	mtk_dsi_reset_engine(dsi);
>   	mtk_dsi_lane0_ulp_mode_enter(dsi);
>   	mtk_dsi_clk_ulp_mode_enter(dsi);
> @@ -715,17 +705,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>   
>   static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
>   {
> -	int ret;
> -
>   	if (dsi->enabled)
>   		return;
>   
> -	ret = mtk_dsi_poweron(dsi);
> -	if (ret < 0) {
> -		DRM_ERROR("failed to power on dsi\n");
> -		return;
> -	}
> -
>   	mtk_dsi_set_mode(dsi);
>   	mtk_dsi_clk_hs_mode(dsi, 1);
>   
> @@ -739,7 +721,16 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
>   	if (!dsi->enabled)
>   		return;
>   
> -	mtk_dsi_poweroff(dsi);
> +	/*
> +	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> +	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
> +	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
> +	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
> +	 * after dsi is fully set.
> +	 */
> +	mtk_dsi_stop(dsi);
> +
> +	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
>   
>   	dsi->enabled = false;
>   }
> @@ -776,13 +767,37 @@ static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>   {
>   	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>   
> +	if (dsi->refcount == 0)
> +		return;
> +
>   	mtk_output_dsi_enable(dsi);
>   }
>   
> +static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					     struct drm_bridge_state *old_bridge_state)
> +{
> +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> +	int ret;
> +
> +	ret = mtk_dsi_poweron(dsi);
> +	if (ret < 0)
> +		DRM_ERROR("failed to power on dsi\n");
> +}
> +
> +static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +					       struct drm_bridge_state *old_bridge_state)
> +{
> +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	mtk_dsi_poweroff(dsi);
> +}
> +
>   static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>   	.attach = mtk_dsi_bridge_attach,
>   	.atomic_disable = mtk_dsi_bridge_atomic_disable,
>   	.atomic_enable = mtk_dsi_bridge_atomic_enable,
> +	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
> +	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
>   	.mode_set = mtk_dsi_bridge_mode_set,
>   };
>   
