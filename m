Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943357FEF7B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 13:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F1910E704;
	Thu, 30 Nov 2023 12:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7DD10E6FA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 12:47:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 481A6B84482;
 Thu, 30 Nov 2023 12:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523C8C433C8;
 Thu, 30 Nov 2023 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701348443;
 bh=ltZg2E6aTzAR6MTRF7EIVGqc75LpYNO0JU7AzaW5iyE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dabbuH3m0BMxxTaY01Bvmd8CjoKVWDsdJ3trvLLtZHMvWxtO98UkSGBXSaRG41gJr
 m/BQjiCuLYcL1m2FkM6QXjAOwrGUoYKN9NC36nO4WRBNrGUkZlSs12In95Lkx+xvoR
 dAjsNh2zPrxJeoQM/do0EwSMrtTvQLyUKT41KeUkFA3PPaVLnPQY7q7fbW3uCSQVln
 HgubtUFlcaheOCk9cI1Rm1VgNdi4pYYc4A9OWevdZw0N1HNpsL5QTtpNE6Baa9WrgN
 dS+TwakXM2RGDuD4HQ4exJ3lEKkfygHH/9o5/TotjzYfn0E8ynR9jTjx8V+FuXh0n7
 cH9vn1bphEkIw==
MIME-Version: 1.0
Date: Thu, 30 Nov 2023 13:47:17 +0100
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: Re: [PATCH 4/4] drm/mediatek: support the DSI0 output on the MT8195
 VDOSYS0
In-Reply-To: <20231123133749.2030661-5-mwalle@kernel.org>
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-5-mwalle@kernel.org>
Message-ID: <2d1bae2239626cb51977bf0803cec602@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> With the latest dynamic selection of the output component, we can now
> support different outputs. Move current output component into the
> dynamic routes array and add the new DSI0 output.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c 
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 2b0c35cacbc6..6fa88976376e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -222,7 +222,11 @@ static const unsigned int mt8195_mtk_ddp_main[] = 
> {
>  	DDP_COMPONENT_DITHER0,
>  	DDP_COMPONENT_DSC0,
>  	DDP_COMPONENT_MERGE0,
> -	DDP_COMPONENT_DP_INTF0,

Please disregard this patch (the others are ok). There must gone 
something
wrong during my testing. DDP_COMPONENT_MERGE0 won't work with
DDP_COMPONENT_DSI0. If anyone has more insights, I'm all ears.

-michael

> +};
> +
> +static const struct mtk_drm_route mt8195_mtk_ddp_main_routes[] = {
> +	{ 0, DDP_COMPONENT_DP_INTF0 },
> +	{ 0, DDP_COMPONENT_DSI0 },
>  };
> 
>  static const unsigned int mt8195_mtk_ddp_ext[] = {
> @@ -308,6 +312,8 @@ static const struct mtk_mmsys_driver_data 
> mt8192_mmsys_driver_data = {
>  static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = 
> {
>  	.main_path = mt8195_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
> +	.conn_routes = mt8195_mtk_ddp_main_routes,
> +	.num_conn_routes = ARRAY_SIZE(mt8195_mtk_ddp_main_routes),
>  	.mmsys_dev_num = 2,
>  };
