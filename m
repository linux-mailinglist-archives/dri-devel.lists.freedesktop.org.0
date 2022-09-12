Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1565B583D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 12:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE7810E336;
	Mon, 12 Sep 2022 10:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED7610E336
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 10:25:53 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F18E6601FD2;
 Mon, 12 Sep 2022 11:25:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662978351;
 bh=S2j6FckD5en6WxMDbzNsp0VoO6RaAb/LrcxvSl/+ggA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N1vZdOBOrPOkP2QC4pmbO5o5LLbhmyqOSOvJGNuSnHNuH2/7pXI38JjRXBB5iYYTd
 XUDvKvb1Mfjukws+gUgUlpp1vd/R4dmHsMFqwONVturlhnH6f/wClnzMs4Xfe0hjFG
 3QoezZJXJEeKSUuQKqP03Q0qmSx23UGfRlnf5rMFxsdrbFZcn4ie3IMKKawbweWnSJ
 hAbaxpNoYh5CoDwQLSDHOOxPEFIt02ilLiwF9vQPQPrYQGxJ6r9l6/GZFjRn40JN1a
 rFRXEzVpepeNREc2twwyGlOwAbun4a/xjeyIiCG0sxnHvEr6PrUvGGR7ZxI0ok/jYw
 E/DKCKznp8/EA==
Message-ID: <5419b691-1b89-9878-ac52-4c99fa3af322@collabora.com>
Date: Mon, 12 Sep 2022 12:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 5/9] drm/mediatek: Add gamma support different lut_bits
 for other SoC
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-6-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220911153734.24243-6-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> Add lut_bits in gamma driver data for each SoC and adjust the usage
> of lut_bits in mtk_drm_gamma_set_common().
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 36 ++++++++++++++++-------
>   1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index e69d0b205b9a..155fb5d94d79 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -25,11 +25,14 @@
>   
>   #define LUT_10BIT_MASK				0x03ff
>   #define LUT_SIZE_DEFAULT			512 /* for setting gamma lut from AAL */
> +#define LUT_BITS_DEFAULT			10
> +#define LUT_INPUT_BITS				16 /* input lut bit from application */
>   
>   struct mtk_disp_gamma_data {
>   	bool has_dither;
>   	bool lut_diff;
>   	u16 lut_size;
> +	u8 lut_bits;
>   };
>   
>   /*
> @@ -72,17 +75,23 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
>   	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>   	bool lut_diff = false;
>   	u16 lut_size = LUT_SIZE_DEFAULT;
> +	u8 lut_bits = LUT_BITS_DEFAULT;

Please fix this double assignment like shown in the comment for patch [4/9].

Thanks,
Angelo

