Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D7914385
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7084210E37E;
	Mon, 24 Jun 2024 07:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Bo9CMcEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1DF10E377
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:22:41 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-57d1679ee83so4012421a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 00:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719213759; x=1719818559;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P49JDi1xXPAYpLbhrU13RiWekT68KiQTL8uhFa+r3Dc=;
 b=Bo9CMcEG3xNKqgGd2PwEPJv+JOiZpu5EdrqCN9QQN1eYLtUGESGvZsGud2i6O9YFJ8
 D8AqzZxec4usEyeBjafXSiU7UcTqACcra3B/U6Tb4cMFOD8t7vvShVHsbEc/ruhCeCWE
 PAPvga43f91dj3dsS8dbTX3eMC/UrQxOlfb+Aw83CleO1yrKh99MhCm7hU3v+skcpRhH
 un9zg8Kr9dHwfrXw9Mei3YPrzgHb5x4zZWwWXRmjQTYD8OVy5OgO+zITUNGpkLqmXrPs
 MGa//bPig81kxeENTnEx4KPYZJb/G8WP22/PmyLuJzCKAZ9vaQb6tNeOqXSn0nTtPP3q
 hqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719213759; x=1719818559;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P49JDi1xXPAYpLbhrU13RiWekT68KiQTL8uhFa+r3Dc=;
 b=o8zcnxcKyQnRAd7DhgSOL1QS7JnLCe0vkkQvQRv5bVxU/unucXs9KkDbWzKUQAZ/tn
 0ZzHAtVGKvqhWtYMh4wV0D0mKXXcBvGbDXIV2BfDrrrRFb4PNNYek1l6w5jsD8hRTDjC
 RAlgx22fipz3fAeYn0Vef3cjW2pctBM02ijjf5S8RU46NYE1LdnasWYY0VWAPdcBW1cE
 Gz23sjOyG9FIfuQSnpZ2QGyvadRI2jnPHmYCsi8dRh8wcSKLeharMuj7JgWVTXWfeP6h
 PbZFLNWDsrf6B0I4hnGKbDg5bymkerKJYJGWTpmBr5Nmp1iZKzjFFTtW2eyhXgtuHjM8
 tbog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNdUaL553d3I9SfVDcqmByuaSqHUevUvQjXinkL47yhukNfQ9djCXYN+HRhSxvlQINRV0n43SyOZIzvsTmLQ+CP9QZYabYo3XwwJGPaxQ/
X-Gm-Message-State: AOJu0YyJ9T0/heOZ8WBd9SxtLhpvGVVEHw9iONvz1jHEjoZaq30Nu21G
 JnKBuY7VXA/F+HEd8KElY1Yk2AXJc/9d6+T6gxnU6J2/4Woimi9zBBjalxq0eg8=
X-Google-Smtp-Source: AGHT+IEMa8s/IzqM0+yHmNkv5YbQAah63TcfDGwvHHxW+U4X+runaXjbqEZ9o5SWB9bNGeVYIuUvmA==
X-Received: by 2002:a17:906:9c96:b0:a72:5598:f03d with SMTP id
 a640c23a62f3a-a725598f1dfmr116904766b.59.1719213759525; 
 Mon, 24 Jun 2024 00:22:39 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a710595adedsm238162166b.214.2024.06.24.00.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 00:22:39 -0700 (PDT)
Message-ID: <cc50cb9e-cbae-43dc-8845-da11a6fb7074@baylibre.com>
Date: Mon, 24 Jun 2024 09:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] drm/mediatek: add MT8365 SoC support
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-12-ed82eb168fb1@baylibre.com>
 <CAAOTY__ZLjuJHnGsVLvGkFK0WhJJ6r=miqewRHsPCJhqO=8qoA@mail.gmail.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <CAAOTY__ZLjuJHnGsVLvGkFK0WhJJ6r=miqewRHsPCJhqO=8qoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 21/06/2024 17:24, Chun-Kuang Hu wrote:
> Hi, Alexandre:
> 
> <amergnat@baylibre.com>  於 2024年5月23日 週四 下午8:49寫道：
>> From: Fabien Parent<fparent@baylibre.com>
>>
>> Add DRM support for MT8365 SoC.
>>
>> Signed-off-by: Fabien Parent<fparent@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Alexandre Mergnat<amergnat@baylibre.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index ce8f3cc6e853..e1c3281651ae 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -318,6 +318,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>>          .mmsys_dev_num = 2,
>>   };
>>
>> +static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>> +       .mmsys_dev_num = 1,
> You do not describe the pipeline information here. I think display
> function would not work.

Hi Chun-Kuang,

I don't describe the pipeline information here because I do it
in the DTS thanks to the OF graphs Angelo's serie [1].
I've tested DSI and DPI display, they work correctly ;)

[1] https://lore.kernel.org/all/20240618101726.110416-1-angelogioacchino.delregno@collabora.com/

-- 
Regards,
Alexandre
