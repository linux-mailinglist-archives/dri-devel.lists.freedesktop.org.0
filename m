Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172AA7739F6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 13:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7531210E118;
	Tue,  8 Aug 2023 11:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C48010E118
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 11:55:20 +0000 (UTC)
Received: from [192.168.0.125] (unknown [82.76.24.202])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 916486607208;
 Tue,  8 Aug 2023 12:55:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691495719;
 bh=ZHAS+3Ex6HkMzLNH4hZADNVpGBBmv0IfwABrMBgoDZ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PDXykDxxTHok/w0WllFQUUwwKDR3XLFKsBeEAS+S3hAVI8H3LdawLENcP0RP47T1m
 5259KHy0EXGO3IoyKrq1WtWM1aje4aiTEOrO90WnHmdpZGKb5kvNIPRpMxLabYw586
 2SvP9cQpK+a6grvCu+3LkOZDdqtFxfiPsIx1DVzpEsRzg4mENKitwtcg4I8uilyidV
 zwAJZqftTGdSjz5fUm+yy9dEz4dST5wNPX+XCJ8MUuxxa66bL+KfJ/ArqRynuWxw1S
 NawmjA/NDKGop1hYAaFN37LIwHHOGELTw4ALtwCw/G2SLC3ch32TWsxmGfPuOM9aDZ
 s43zfGuZ/NdVw==
Message-ID: <02dc52cd-db64-af1c-0f07-5ef76b954c75@collabora.com>
Date: Tue, 8 Aug 2023 14:55:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v4 2/2] drm/mediatek: Fix iommu fault during crtc
 enabling
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230807015110.30579-1-jason-jh.lin@mediatek.com>
 <20230807015110.30579-3-jason-jh.lin@mediatek.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230807015110.30579-3-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

On 8/7/23 04:51, Jason-JH.Lin wrote:
> The plane_state of drm_atomic_state is not sync to the mtk_plane_state
> stored in mtk_crtc during crtc enabling.
> 
> So we need to update the mtk_plane_state stored in mtk_crtc by the
> drm_atomic_state carried from mtk_drm_crtc_atomic_enable().
> 
> While updating mtk_plane_state, OVL layer should be disabled when the fb
> in plane_state of drm_atomic_state is NULL.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Change in RESEND v4:
> Remove redundant plane_state assigning.
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 14 ++++++++++----
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 11 ++++++++---
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 ++
>   3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d40142842f85..7db4d6551da7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -328,7 +328,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>   }
>   #endif
>   
> -static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
> +static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc, struct drm_atomic_state *state)
>   {
>   	struct drm_crtc *crtc = &mtk_crtc->base;
>   	struct drm_connector *connector;
> @@ -405,11 +405,17 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>   	/* Initially configure all planes */
>   	for (i = 0; i < mtk_crtc->layer_nr; i++) {
>   		struct drm_plane *plane = &mtk_crtc->planes[i];
> -		struct mtk_plane_state *plane_state;
> +		struct drm_plane_state *new_state;
> +		struct mtk_plane_state *plane_state = to_mtk_plane_state(plane->state);
>   		struct mtk_ddp_comp *comp;
>   		unsigned int local_layer;
>   
> -		plane_state = to_mtk_plane_state(plane->state);

any reason why you moved the initialization of plane_state at the 
declaration phase ?

> +		/* sync the new plane state from drm_atomic_state */
> +		if (state->planes[i].ptr) {
> +			new_state = drm_atomic_get_new_plane_state(state, state->planes[i].ptr);
Can drm_atomic_get_new_plane_state fail ? and new_state becomes null ?

I see mtk_plane_update_new_state assumes new_state being a correct 
state/pointer.

Regards,

> +			mtk_plane_update_new_state(new_state, plane_state);
> +		}
> +
>   		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
>   		if (comp)
>   			mtk_ddp_comp_layer_config(comp, local_layer,
> @@ -687,7 +693,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>   		return;
>   	}
>   
> -	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
> +	ret = mtk_crtc_ddp_hw_init(mtk_crtc, state);
>   	if (ret) {
>   		pm_runtime_put(comp->dev);
>   		return;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index b1a918ffe457..ef4460f98c07 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -134,8 +134,8 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
>   						   true, true);
>   }
>   
> -static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
> -				       struct mtk_plane_state *mtk_plane_state)
> +void mtk_plane_update_new_state(struct drm_plane_state *new_state,
> +				struct mtk_plane_state *mtk_plane_state)
>   {
>   	struct drm_framebuffer *fb = new_state->fb;
>   	struct drm_gem_object *gem;
> @@ -146,6 +146,11 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
>   	dma_addr_t hdr_addr = 0;
>   	unsigned int hdr_pitch = 0;
>   
> +	if (!fb) {
> +		mtk_plane_state->pending.enable = false;
> +		return;
> +	}
> +
>   	gem = fb->obj[0];
>   	mtk_gem = to_mtk_gem_obj(gem);
>   	addr = mtk_gem->dma_addr;
> @@ -180,7 +185,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
>   		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
>   	}
>   
> -	mtk_plane_state->pending.enable = true;
> +	mtk_plane_state->pending.enable = new_state->visible;
>   	mtk_plane_state->pending.pitch = pitch;
>   	mtk_plane_state->pending.hdr_pitch = hdr_pitch;
>   	mtk_plane_state->pending.format = format;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> index 99aff7da0831..0a7d70d13e43 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -46,6 +46,8 @@ to_mtk_plane_state(struct drm_plane_state *state)
>   	return container_of(state, struct mtk_plane_state, base);
>   }
>   
> +void mtk_plane_update_new_state(struct drm_plane_state *new_state,
> +				struct mtk_plane_state *mtk_plane_state);
>   int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>   		   unsigned long possible_crtcs, enum drm_plane_type type,
>   		   unsigned int supported_rotations, const u32 *formats,

