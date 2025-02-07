Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4984A2C5E2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CE710EB2A;
	Fri,  7 Feb 2025 14:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SKk9wMpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBEE10EB28
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:46:03 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38dc8b5bb0bso505002f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 06:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738939562; x=1739544362;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hv90/4Ii7oHU4TLhsDR0XOWXVnCVpBGLvijyzK1ZPiM=;
 b=SKk9wMpttm/lo0jl28jMzB9uBXxTYe60VvmwVX6yr7QaeOjsGLXrB7ERtJo4UKxz3m
 fmM66ryfPdgJeG4tLJJwtm9mFxHCgECeXwqzy/BZ4MXbOTuYbRpKjScAyJaMyAwRLKSo
 iynDdWu8MiyjjfYR/U28LFSybwnF9nZEtbzJzCcIF+6yD2xyv+AWxEJRWa3wAKYcz1Kp
 f6VkCtwxQujxgFlSVE9CSfMF3Lt0pW6uL+oIEr28I+gTFbH6cyDXFce9vhaPjExJIg9w
 kABpuJDyyq8wFwcSHISi+1F8VlKo/lIOHRYCZqIh/COugFNclU3GWgWpMIK1VC/6M4hy
 ndWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738939562; x=1739544362;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hv90/4Ii7oHU4TLhsDR0XOWXVnCVpBGLvijyzK1ZPiM=;
 b=BmEjEJdcIOtYG/JOSu1VQ+Pj8nI5HmjT7PY2zdolvCxSKlpt1lb+pS3kT7+pbV3IR2
 skctmhXQhnOXfOblj+amvfTndGyspRGmO8GHVbFhAOR8lpTFCtoj0wqpNp7sASy4CLgU
 Z7z2WOY+c9VnkF2sFiOCSvIVj6TlQHuhazmcML//kdI9y/Ayuncc92NVVlnRjhS+jtc5
 SpMgxTB+/A0QEyIeF8cVf9ytktN1Zj1iiqIV8cvIxS2zjx+xefWuGhbj6emBQzYZ00nF
 H3tUr0bZ/dNhcHBdfZsuD4BF31SI34at0LhU+h3S9Paz4d8d222h8ELIFQXDIaWZnExQ
 VZAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS2ENaSneE4ljKrq8UZI60y1nnrgvNQLVPeT553lwfmVBxpuqDO3i4QPVFGqygdbkL0cCsbMU0Tds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTEeNWi2stdzEjvEFlChSajQ1F1tSy+k6wTlc0vfRQC6+OpM97
 VUQbGX0ZCSojQT5vlutuLl1UbPenDsP+FGAJaxJHtulu4o7SC4n9lkSa4e0zuFk=
X-Gm-Gg: ASbGncuUHlesWdQefmE0BnWHn8+iNwbuY+4ceVsk0cb3O31u3r1oLBkE9OhBCmm294N
 ysTJ/7BP/FjxsQoLeD2njQOnZQOFFRGaAoP9ySNZrq9G3EcZhLWS0EgzoGY2cbGSPhOGtOrDfnn
 +0QMo7vPz2YQAXiHMPd06nVwRUsRfitfszm8TmAvb3mQ85tuJXs3K3ATba89QgzjQThX+5iSQax
 PAyWGVB4tIRiAc9irUZTbM7W32tllns99BUzMjWUJnw9rH0dVqQV5E8hDtCai3f3BU7Fmdg72lu
 HtBAm7EDAhIJheakALpIjuTXnrPZwPbZGp1d8daCHLx/1JHJIMWenc+SukUfaH0=
X-Google-Smtp-Source: AGHT+IHFc+CaRU85moSCDGrb/7WzOtXGy8Znz1lNZW2tGN9O7ngj6L2f+YkxFTgGpjCIR2UBQc+Nww==
X-Received: by 2002:a05:6000:188b:b0:38d:c58f:4ceb with SMTP id
 ffacd0b85a97d-38dc9374960mr2633679f8f.43.1738939561733; 
 Fri, 07 Feb 2025 06:46:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8?
 ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc5839877sm3206265f8f.3.2025.02.07.06.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 06:46:01 -0800 (PST)
Message-ID: <18fd9544-f9ef-4f58-9a8a-026737c26b94@baylibre.com>
Date: Fri, 7 Feb 2025 15:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/34] drm/mediatek: mtk_hdmi: Move CEC device parsing
 in new function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-22-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-22-angelogioacchino.delregno@collabora.com>
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



On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
> Move the CEC device parsing logic to a new function called
> mtk_hdmi_get_cec_dev(), and move the parsing action to the end
> of mtk_hdmi_dt_parse_pdata(), allowing to remove gotos in this
> function, reducing code size and improving readability.

Why CEC device parsing logic isn't done mtk_cec.c driver ? Then add "mtk_cec_get_dev" function to 
mtk_cec.c too. Finally, call this new function in mtk_hdmi_probe after mtk_hdmi_dt_parse_pdata().

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 84 ++++++++++++++---------------
>   1 file changed, 40 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 48c37294dcbb..eb285ec394a3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1367,24 +1367,16 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
>   	.edid_read = mtk_hdmi_bridge_edid_read,
>   };
>   
> -static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
> -				   struct platform_device *pdev)
> +static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
>   {
> -	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
> -	struct device_node *remote, *i2c_np;
>   	struct platform_device *cec_pdev;
> -	struct regmap *regmap;
> +	struct device_node *cec_np;
>   	int ret;
>   
> -	ret = mtk_hdmi_get_all_clk(hdmi, np);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to get clocks\n");
> -
>   	/* The CEC module handles HDMI hotplug detection */
>   	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");

If it's done in mtk_cec.c, the hardcoded compatible string method will be replaced by of_match_table 
(mtk_cec_of_ids), which is scalable and consistent.

>   	if (!cec_np)
> -		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
> +		return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");
>   
>   	cec_pdev = of_find_device_by_node(cec_np);
>   	if (!cec_pdev) {
> @@ -1393,65 +1385,69 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   		return -EPROBE_DEFER;
>   	}
>   	of_node_put(cec_np);
> -	hdmi->cec_dev = &cec_pdev->dev;
>   
>   	/*
>   	 * The mediatek,syscon-hdmi property contains a phandle link to the
>   	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
>   	 * registers it contains.
>   	 */
> -	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
> -	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
> -					 &hdmi->sys_offset);
> -	if (IS_ERR(regmap))
> -		ret = PTR_ERR(regmap);
> -	if (ret) {
> -		dev_err_probe(dev, ret,
> -			      "Failed to get system configuration registers\n");
> -		goto put_device;
> -	}
> -	hdmi->sys_regmap = regmap;
> +	hdmi->sys_regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
> +	if (IS_ERR(hdmi->sys_regmap))
> +		return PTR_ERR(hdmi->sys_regmap);
> +
> +	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get system configuration registers\n");
> +
> +	hdmi->cec_dev = &cec_pdev->dev;
> +	return 0;
> +}
> +
> +static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
> +				   struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *remote, *i2c_np;
> +	int ret;
> +
> +	ret = mtk_hdmi_get_all_clk(hdmi, np);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
>   
>   	hdmi->regs = device_node_to_regmap(dev->of_node);
> -	if (IS_ERR(hdmi->regs)) {
> -		ret = PTR_ERR(hdmi->regs);
> -		goto put_device;
> -	}
> +	if (IS_ERR(hdmi->regs))
> +		return PTR_ERR(hdmi->regs);
>   
>   	remote = of_graph_get_remote_node(np, 1, 0);
> -	if (!remote) {
> -		ret = -EINVAL;
> -		goto put_device;
> -	}
> +	if (!remote)
> +		return -EINVAL;
>   
>   	if (!of_device_is_compatible(remote, "hdmi-connector")) {
>   		hdmi->next_bridge = of_drm_find_bridge(remote);
>   		if (!hdmi->next_bridge) {
>   			dev_err(dev, "Waiting for external bridge\n");
>   			of_node_put(remote);
> -			ret = -EPROBE_DEFER;
> -			goto put_device;
> +			return -EPROBE_DEFER;
>   		}
>   	}
>   
>   	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
>   	of_node_put(remote);
> -	if (!i2c_np) {
> -		ret = dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
> -		goto put_device;
> -	}
> +	if (!i2c_np)
> +		return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
>   
>   	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
>   	of_node_put(i2c_np);
> -	if (!hdmi->ddc_adpt) {
> -		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
> -		goto put_device;
> -	}
> +	if (!hdmi->ddc_adpt)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
> +
> +	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
> +	if (ret)
> +		return ret;
>   
>   	return 0;
> -put_device:
> -	put_device(hdmi->cec_dev);
> -	return ret;
>   }
>   
>   /*

-- 
Regards,
Alexandre
