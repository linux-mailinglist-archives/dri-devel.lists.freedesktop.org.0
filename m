Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE264BDA37
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2DA10E4A7;
	Mon, 21 Feb 2022 14:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC0C10E4A7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 14:31:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 62EB71F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453860;
 bh=uHyvQnRcX2j54qKQCC3UrIix0zhsBCTFiwo3BQ/UxV0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GSqvWgY2B6oVYyJDve3B5XxVuNeBu65AC7yHmuDp6GS2Mvt+I2fY3pTTLZ/xzBsgy
 GmSDLT+cNZO+FYzBBR2waHln4c4cJ24elj95PIuXEvU+PW+ApwrM1wKzaJ3SJFOVvt
 v1FY/5dNMhVVoQBQhFOh6kfYKMEl99vEMd6GeE5FztlaI07VaLmEmOiLvl4iUkwYSU
 7HlFPJlhoP+lZ1mRf8sYabVpPEjwD0xFNc6jCFvQZtTXdjjmZ/Mc3CC5g9ULH2H1GE
 CU/xbs9kw3SSFXz7ybdpLlYTVvCL/stu0B5Qja7oMQs//saJpoa0X4nllVGr6kCZYU
 I/CZv/0z7ycNQ==
Message-ID: <27d7af65-588d-9811-3d01-863fd0334298@collabora.com>
Date: Mon, 21 Feb 2022 15:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 08/19] drm/mediatek: dpi: move dimension mask to board
 config
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-9-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-9-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> Add flexibility by moving the dimension mask to the board config
> 

s/board/SoC/g


> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 454f8563efae4..8ca3455ed64ee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -127,6 +127,8 @@ struct mtk_dpi_conf {
>   	u32 num_output_fmts;
>   	bool is_ck_de_pol;
>   	bool swap_input_support;
> +	// Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift)

Also, C-style comments, please.

After the change,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



> +	u32 dimension_mask;
>   	const struct mtk_dpi_yc_limit *limit;
>   };
>   

