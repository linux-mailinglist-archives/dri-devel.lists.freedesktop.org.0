Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C58CBDB2
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 11:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86E810F2EB;
	Wed, 22 May 2024 09:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Pm/vEshT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00F410E148
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 09:23:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4200ee78f34so4814155e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 02:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716369812; x=1716974612;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JRjtoycu6QiYQPIcHAZ506CIemzizife0bP7oo/LEUE=;
 b=Pm/vEshTE5VPxqmmog7L/goVcnlUS/obUHfBY/zXsa39cfJQUSv6SZVBWKPIkXAwcf
 yqM9IG6FoThOd9cI4KkRjvS7NDQwm7YWi2yH1w53rHtdpgcnbZsZ6G32VX2hha9Ay5ue
 O/adpY7HOE4aZas7iort+uPDb6+1g+ExkCmbYksiRUqyctArgpGZdciTkLJ77rDGu3tc
 NOI97rvahR5WuZ8qLmsG6qqryfXvO9RMjC0tUwF1VA4vyoXmG34lRD+jIB8JzdBEzuDH
 vY8FdCwSH7sjKaiHSPsk1YVqUMMBh9USAwvxTPWwVx1kr8UtFVM2iIH2+TqWH1/hm9ws
 sBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716369812; x=1716974612;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JRjtoycu6QiYQPIcHAZ506CIemzizife0bP7oo/LEUE=;
 b=qGieT0g2VqeiM49GkYr7ZmF0awnXTyZ/98sHEbMsIIkYrxat8t+oe5mdFCt+dsc1MS
 7SEPIVPxor3d9ISBmx7F9QyhfthlPZ9eA8nQMdjpffIA/9jBbcfQb4y0SBoFI+IX8W5O
 YuimzVlbWqsrLrWCuTbqx5+f4M9PVWsqCC96mteuN+ZeYxRjowdbX5V4abtULjwqZFwJ
 QGs/xw+z0Ktjp/Tj9AyLbt0gHcUvxDbGqe61ARLXtv3JMA34uPCx7YGINxdA9zT+PmnM
 TfHz+ABQyxe8Ce7hZumDq6diA7oJi1NoFO8k0CL7NWZhyMi2Jnd7rOoVujxh8+FQfKOO
 8IYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcZU46oQSGNpBRphp9riYnQloIS1WLZi8/PBVB/AVSIjs9hwgpmsbOHFXW2h4KMRO9iJtwRKObFjmK6z2fGUDfDcMAcafWNH+E2BaTipWG
X-Gm-Message-State: AOJu0YzGBAFUFxAPuKrBNaDZxKPhBwLw9cWyG0GLf1J2TLLRQ3wfZZUU
 +1jSxRuppP/oNSGdHVrbk1xfcyCZKx5qwPylZvsKsl20C1b/HrcL+oDOaOgfXyc=
X-Google-Smtp-Source: AGHT+IGBRKl5DCZ+kljNpjZnc9YzdCw1hs2bWkudIcHS/AaEdVRmj8bHA3gNsPb+/c/8i/lsYuEbJQ==
X-Received: by 2002:a05:600c:ac1:b0:41b:f359:2b53 with SMTP id
 5b1f17b1804b1-420fd37f2f5mr9924295e9.37.1716369811860; 
 Wed, 22 May 2024 02:23:31 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42011d91edfsm402874715e9.44.2024.05.22.02.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 02:23:31 -0700 (PDT)
Message-ID: <e9b8a423-9ee3-4f5d-a0a2-374603762127@baylibre.com>
Date: Wed, 22 May 2024 11:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/16] ASoC: mediatek: mt8365: Add ADDA DAI support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-7-082b22186d4c@baylibre.com>
 <a693b696-92cf-48cf-8c9d-17aa7f182d98@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <a693b696-92cf-48cf-8c9d-17aa7f182d98@collabora.com>
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



On 20/05/2024 12:27, AngeloGioacchino Del Regno wrote:
>> +int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
>> +{
>> +    unsigned long flags;
>> +    struct mt8365_afe_private *afe_priv = afe->platform_priv;
>> +
>> +    spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
>> +
>> +    adda_afe_on_ref_cnt--;
>> +    if (adda_afe_on_ref_cnt == 0)
>> +        regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
>> +                   AFE_ADDA_UL_DL_ADDA_AFE_ON,
>> +                   ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
>> +    else if (adda_afe_on_ref_cnt < 0)
>> +        adda_afe_on_ref_cnt = 0;
> 
> Should we dev_warn() here? The refcount should never be less than zero - if it is,
> then there's some issue somewhere that must be solved.

Ok to add dev_warn, but I also want to keep "adda_afe_on_ref_cnt = 0;" for robustness, even if it 
shouldn't reach this case.

-- 
Regards,
Alexandre
