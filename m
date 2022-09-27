Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F8D5EC397
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4217710E920;
	Tue, 27 Sep 2022 13:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E8910E92C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 13:06:07 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id iw17so9065016plb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 06:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=tVImipPJ55LLlj3hxov+6J9Uas9BlzTbH/QBaoiYcnE=;
 b=AeFiLZSELiOLu0C/WY7j3qNn2XbPtZX/1DfSK5wxjFb2rqwPO7CvvZtAFF5v6/7J26
 ahCqqp2F9wNI5OYX7qy/ObhCyFoh9fcBwqqwDTOmQ3Szz628RGrS+W9AFjoVJocXlWki
 VC0GYuee8hoFp6tnnZjb+BQvkFkX4acVrRZQaXEcy3Crna/0t54Jbazxa/CYEy/0/zFu
 2lndzQwEpvpkb26lSSoBm5VVsMti9KIfqB8rnh9R4Sn70IUDgJCGjP5FzkG0xZM/8Ujz
 ktOS6zIlcVHVVfda96Denge0ZrYEMhecJgtt3RQnWSFrUZInrw19D5HLdT/lXGWs6zAx
 AlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=tVImipPJ55LLlj3hxov+6J9Uas9BlzTbH/QBaoiYcnE=;
 b=oSrc1SKW3LxVX3iicPf1ARVzoefCZEAjD+icRJ48mLyW6F5iMzwQxEXsips38KxATX
 cQGDirAOQvhVKX+Rk5oFiIF4AclDXFhCDERTD/7Ag6qginm7jnwBSyKab1OBJBNN7y8r
 uE6qi0JuhFm3wIK1Mr1eSu0wEEXyF+EX7YG/4AvW5ReeovvqdkZAgXcUkp+6EKqf3uLA
 U7Ndk2XKy+ROruQu0eL8BnY6ISu5f1rAWQ/VdnYj2YfG3MOYY14TNHcrlpQUr6ibc2s2
 6Rk0wPMpIbToQZmttkpFJOv8kWxdEnDpkBaz3i28jx1zHdE4VwDVeQJrqLCRmI2y99xD
 FTmA==
X-Gm-Message-State: ACrzQf25bXzMU2EaVC39bUBNtwVZ44LDvsZCKkLgZ8mEnk9pyqaVAYKY
 NON3hB4IB+Zccr1c8q0cIcSElGTuDPTcBYjmyursPQ==
X-Google-Smtp-Source: AMsMyM6iYfFfRkY7ZCfN7iH6SfIok108DtV5xTUiUrfRhR4EUYS3wDXnryle8l6ZhFGMR+ScZmNr7PCxr1+tKvPRj2I=
X-Received: by 2002:a17:90b:2643:b0:205:bd0d:bdff with SMTP id
 pa3-20020a17090b264300b00205bd0dbdffmr4399905pjb.99.1664283966835; Tue, 27
 Sep 2022 06:06:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:06:06 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-5-4844816c9808@baylibre.com>
 <32c4822a-a094-5fa3-c2af-e515bf897937@collabora.com>
In-Reply-To: <32c4822a-a094-5fa3-c2af-e515bf897937@collabora.com>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:06:06 -0700
Message-ID: <CABnWg9vsd7Lk4kR4j-XrgJXAX+sEd3J+oz3hFc4sEuCGRRy8qw@mail.gmail.com>
Subject: Re: [PATCH v1 05/17] drm/mediatek: hdmi: use a syscon/regmap instead
 of iomem
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Sep 2022 12:18, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> To prepare support for newer chips that need to share their address
>> range with a dedicated ddc driver, move to a syscon.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 3196189429bc..5cd05d4fe1a9 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>
>..snip..
>
>> @@ -1428,7 +1413,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>>   	struct device_node *cec_np, *remote, *i2c_np;
>>   	struct platform_device *cec_pdev;
>>   	struct regmap *regmap;
>> -	struct resource *mem;
>>   	int ret;
>>
>>   	ret = mtk_hdmi_get_all_clk(hdmi, np);
>> @@ -1474,8 +1458,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>>   	}
>>   	hdmi->sys_regmap = regmap;
>>
>> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	hdmi->regs = devm_ioremap_resource(dev, mem);
>> +	hdmi->regs = syscon_node_to_regmap(dev->of_node);
>
>Nack. You're breaking ABI, this will force everyone to add syscon to devicetree,
>hence this breaks retrocompatibility with old devicetrees.
>
>Hint: not here, device_node_to_regmap()

Hi Angelo,

I'm sorry, I didn't think device tree retro compatibility was a thing.

I'll drop the requirement for the module to be a syscon.
Thx for the hint.

Thx,
Guillaume.

>
>Regards,
>Angelo
>
>>   	if (IS_ERR(hdmi->regs)) {
>>   		ret = PTR_ERR(hdmi->regs);
>>   		goto put_device;
>
>
