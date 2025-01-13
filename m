Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE9BA0B729
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1B110E26A;
	Mon, 13 Jan 2025 12:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VC+R6ACb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D4E10E678
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736772107;
 bh=IPHpSM0gHK7uddhO4HkJ69FBlgIeHdL9qA0Mae2fHr4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VC+R6ACbOfUWrWeEV/dMVdMegVVfY293Z272WfnnP9gAAe5nGySUw7Ewsk/E3Mq1O
 R1fl+ysBGlkyUOzEBNvKO+NuPduRw2z+69b4EVq0ikhR+cjRZa0qwXJm/s3gd9p7Os
 MnD+yVax1J7MizNFBV5K4F9roF0QbZ+qfVV+HXTse9tcTVEoex06shQRq0NgOoDIZe
 XmFk/gS8WvyoY7+pcWKQFz4iMw5TB7KaElIzYhaNcLYlBN4JGvoMEdODEQ1qi2oyV1
 lGNVd+LyU7G6/RpQ14TausVzYeZZ3iI9LD9lAEvCRGwpKkZ3/EgVXgw18sEpm1bh9j
 MnzwmWE6zz56A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1160917E04AC;
 Mon, 13 Jan 2025 13:41:47 +0100 (CET)
Message-ID: <516d16e3-6fc6-49ba-a0ce-f451b65a6c1a@collabora.com>
Date: Mon, 13 Jan 2025 13:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
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

Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors on missing syscon
> argument, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.
> 

I agree with this change but can you please rebase it over [1]?

The same code got migrated to mtk_hdmi_common.c instead :-)

[1]: 
https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com

Thanks,
Angelo

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index ca82bc829cb9..4b0eb7dc25d8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1458,15 +1458,11 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
>   	 * registers it contains.
>   	 */
> -	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
> -	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
> -					 &hdmi->sys_offset);
> -	if (IS_ERR(regmap))
> -		ret = PTR_ERR(regmap);
> -	if (ret) {
> -		dev_err(dev,
> -			"Failed to get system configuration registers: %d\n",
> -			ret);
> +	regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
> +						      1, &hdmi->sys_offset);
> +	if (IS_ERR(regmap)) {
> +		ret = dev_err_probe(dev, PTR_ERR(regmap),
> +				    "Failed to get system configuration registers\n");
>   		goto put_device;
>   	}
>   	hdmi->sys_regmap = regmap;


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718
