Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F2961F670
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC5110E37D;
	Mon,  7 Nov 2022 14:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DB210E37E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:44:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id x21so16570809ljg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i0O2rk5E0cL+fm306yvacQlome9MWqlkSl0PtbnJ/Fk=;
 b=KGd9O5AMOGZXp+tE3f0j+hwAkW+8r8XE9RmQsXGMLtLEL+k0tlrOTlc9x3z6DY60pT
 hoRXvYOeD/Og/ka1ZIfwjHVVwiYkMECBdxL+qr6sOmlcw2M4myVgfy3mUcsg34OUY9JJ
 q2lBidE2ZbHrX8DY8H34jBlgMAfqbaTK5gWDjPBKRDyH0O/aQ5nkMbT7YyKZ1J3wKPKE
 g2HXUzVU7qAK/Wi5p4uk8UO+C3/OrXQtIeJ+BKMBSvKfMctlvCZ9EjPETJgknfSh0Eme
 qzAIsFJwkk2g1boA0NctS759r6L3DUzwJ6BMZO1g8SlxiYVglENC/U8KI+IphbjhOzQm
 oWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i0O2rk5E0cL+fm306yvacQlome9MWqlkSl0PtbnJ/Fk=;
 b=YTbQfrJaQ05PGz75gQf0QGAdN3c6QtcKnoFYvG5hVEs/LN8qMNJ3yETYDdAy5MYQ9s
 6SEAFbEM0HiNyEVMt9Af9p2KAbfKAHZS6zfS2SetuuSHyxjwE2mnZj/wUkqv+uxhW5Cr
 ylJqdBZIo6XTeKQmtcGQhDBFCr2JrPvu2Nqu+ZtOsOdTORJH7X+h1ABDVyuOGYHTwFXy
 w2YeWU/8AAI5Gqcr/1coh2dNftCeIKQ4ZdxaN+8h9nFbk3f8bsTzJf8GR26frC+JqB3N
 Sal0E+TWB28zZBsLd+e3d6cq19ffXNCmU047vhXI6guTQnuAbFuRpYLjfHoBKIUYOL/i
 sEkQ==
X-Gm-Message-State: ACrzQf3n6IqQctC3OBPhBF8H/FSiOzmrZbqhVl+qJsrd7Ck+iB5wfNnE
 rYjwWtQZQGKSmk53QyxoKJY78gJb/0gBrvdTwUCNeA==
X-Google-Smtp-Source: AMsMyM6xHORFjhVs0PnFDG1Q5hbXYVz1Gde1fVXPnnjTrXUg8FmzxrTbBpDXilPPBRiYEYQWH0D3yvUDzcEPlfT2y8I=
X-Received: by 2002:a2e:2e0c:0:b0:277:75bb:429e with SMTP id
 u12-20020a2e2e0c000000b0027775bb429emr9673388lju.314.1667832238908; Mon, 07
 Nov 2022 06:43:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Nov 2022 14:43:58 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-3-a803f2660127@baylibre.com>
 <05183178-32cb-98c0-4fcb-d5e78874e6c4@collabora.com>
In-Reply-To: <05183178-32cb-98c0-4fcb-d5e78874e6c4@collabora.com>
MIME-Version: 1.0
Date: Mon, 7 Nov 2022 14:43:58 +0000
Message-ID: <CABnWg9sZ29jnCbCjtJ-tLWn2s1JYjFVEEGkau72WJyukHWU9=Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] drm/mediatek: hdmi: use a regmap instead of iomem
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Nov 2022 12:20, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
>> To prepare support for newer chips that need to share their address
>> range with a dedicated ddc driver, use a regmap.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 43 +++++++++++--------------------------
>>   1 file changed, 13 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 4c80b6896dc3..9b02b30a193a 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -171,7 +171,7 @@ struct mtk_hdmi {
>>   	u32 ibias_up;
>>   	struct regmap *sys_regmap;
>>   	unsigned int sys_offset;
>> -	void __iomem *regs;
>> +	struct regmap *regs;
>>   	enum hdmi_colorspace csp;
>>   	struct hdmi_audio_param aud_param;
>>   	bool audio_enable;
>> @@ -187,44 +187,29 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
>>   	return container_of(b, struct mtk_hdmi, bridge);
>>   }
>>
>> -static u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
>> +static int mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset, u32 *val)
>>   {
>> -	return readl(hdmi->regs + offset);
>> +	return regmap_read(hdmi->regs, offset, val);
>>   }
>>
>>   static void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
>>   {
>> -	writel(val, hdmi->regs + offset);
>> +	regmap_write(hdmi->regs, offset, val);
>>   }
>>
>>   static void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
>
>You don't need these functions anymore, as these are now simply wrapping
>regmap calls, hence these don't contain any "real" logic anymore.
>
>Please remove them and use the regmap API directly.
>
>Thanks,
>Angelo
>

Agree with that, my intent was to minimize the change size so that it
would be easy to review.

My mistake, I'll remove the wrappers.

Thx,
Guillaume.
