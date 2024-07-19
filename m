Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C8F9374A8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 10:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C19410EB00;
	Fri, 19 Jul 2024 08:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qNqzFnCP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B367710EB17
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 08:03:11 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a77baa87743so186583066b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 01:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721376190; x=1721980990;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z+V9iTvENoLkDMcxv1MaALvsWBKCPdjEAwX/SNQRJv8=;
 b=qNqzFnCP8J3J6Vlbkex3KfmDN1WErHHa/Fn+GDuz7PZlc/FYC8pfn0S5Nl5iVNcteX
 Yde5J5KIvrzaRq6wzLcGuniIfXrUM/dhEW8aA+n9n1LDTPswNWuhA/AVOYibnn08zzbS
 Ly8Vs7rp13kHURaU22lnliBHsSCbiz5TO9S/PehtqSGRBMldDWTaAVSsmV4Wlkl+yx1L
 Zt0m35So4oJBZVqK0QRi8zNSL6im4Sayt44sQAE637ISpnsAp3NYVj5OihbQkrcE7DTw
 7O5ZQ6pPwqbn3UVn41XrfzYmuG+uq5DTali0U5OIxeSX9edRHcHJlnjxkwLAAE5S9pXt
 bz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721376190; x=1721980990;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z+V9iTvENoLkDMcxv1MaALvsWBKCPdjEAwX/SNQRJv8=;
 b=UDRGy8BN453XykP5PHycdzre+8M+PeETTWD5qrEThlq+Pk0iIoPyC4CYEDKPJUNXRb
 W8WKUFlfppRT+rKUPVsFXu4w8QVbqAS3fH0JaURUnyM6Xrg4OPIWzFYMnoyy/NlXfBoL
 yLrzj44zFbzkiEqXGXu2PDH77rLIboszrjWF67hE2JdB6YypvysgdjHoaLnLYDrdrBaZ
 w45rkD0cNY2z2w8xZbD8g/AoRrQ5TfZVFDQbQHLqvsf7LS5L9Y8TuSAqXqHnZ8NTBb1Y
 ZsSNOwp7JY3e+b8zf0PAZ1k5WljBzbBjROeW5zgu97lOwFittUWhZQ+kDzlTLciQ9QLE
 Xa1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcDkuWyOLal2gQ5Xe//mfG7xzZ6y0oCSwXq/cHPpkg4sh5KiggqUhSJnH3CwMG787oTl2ggZCdhXqmlpES4DWKUXsbOthAyQDLzbQpqeYY
X-Gm-Message-State: AOJu0YwfyrIguA3Z092jIZLDJZ6a9fhS30Y0h1pEA2jyMRhl8EPYXBE6
 vT8VSaFX7eb9h8FL/rc5FAR+NoE+v9QWu/cfo6rQPzBjyBESsET3iplUIb9Bu/I=
X-Google-Smtp-Source: AGHT+IFSI/urq3kgCZ03qW/7Cfy3KmDoz5hvQStjC02N5fU8bds0AoRqbPquZ19VCIFBWcFmrd5RIA==
X-Received: by 2002:a17:906:ae84:b0:a75:2495:a6a3 with SMTP id
 a640c23a62f3a-a7a013c0f56mr554702166b.67.1721376189891; 
 Fri, 19 Jul 2024 01:03:09 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a33ad4bfdsm72480666b.85.2024.07.19.01.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 01:03:09 -0700 (PDT)
Message-ID: <45b4a493-875a-4c9c-aa45-a6f32f74b865@baylibre.com>
Date: Fri, 19 Jul 2024 10:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] ASoC: codecs: add MT6357 support
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
 <1ca27c79-a83a-42a7-9e9b-766da0064c73@sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <1ca27c79-a83a-42a7-9e9b-766da0064c73@sirena.org.uk>
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



On 21/06/2024 14:44, Mark Brown wrote:
> On Wed, Jun 19, 2024 at 04:46:48PM +0200, amergnat@baylibre.com wrote:
> 
>> +	/* gain default values*/
>> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, MT6357_AUDPREAMPLGAIN_MASK,
>> +			   UL_GAIN_0DB << MT6357_AUDPREAMPLGAIN_SFT);
>> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1, MT6357_AUDPREAMPRGAIN_MASK,
>> +			   UL_GAIN_0DB << MT6357_AUDPREAMPRGAIN_SFT);
>> +
>> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON1,
>> +			   MT6357_AUD_LOL_GAIN_MASK |
>> +			   MT6357_AUD_LOR_GAIN_MASK,
>> +			   DL_GAIN_0DB << MT6357_AUD_LOL_GAIN_SFT |
>> +			   DL_GAIN_0DB << MT6357_AUD_LOR_GAIN_SFT);
>> +
>> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON2,
>> +			   MT6357_AUD_HPL_GAIN_MASK |
>> +			   MT6357_AUD_HPR_GAIN_MASK,
>> +			   DL_GAIN_0DB << MT6357_AUD_HPL_GAIN_SFT |
>> +			   DL_GAIN_0DB << MT6357_AUD_HPR_GAIN_SFT);
>> +
>> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON3,
>> +			   MT6357_AUD_HS_GAIN_MASK, DL_GAIN_0DB);
> 
> We generally leave everything at chip defaults, why is this different?

Ok, after test, it isn't a problem to leave at chip defaults.

> 
>> +static int mt6357_codec_probe(struct snd_soc_component *codec)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +
>> +	mt6357_codec_init(priv);
>> +	return 0;
>> +}
> 
> Why not just inline mt6357_codec_init() into the one user?

You're right.

> 
>> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +	unsigned int val;
>> +
>> +	regmap_read(priv->regmap, reg, &val);
>> +	return val;
>> +}
>> +
>> +static int mt6357_write(struct snd_soc_component *codec, unsigned int reg, unsigned int value)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +
>> +	return regmap_update_bits(priv->regmap, reg, 0xffff, value);
>> +}
> 
> Why open code these, the core has standard adaptors for regmap?

You're right. snd_soc_component_write/read should be used instead

> 
>> +static const u32 micbias_values[MT6357_MICBIAS_ARRAY_SIZE] = {
>> +	1700000, 1800000, 1900000, 2000000,
>> +	2100000, 2500000, 2600000, 2700000
>> +};
> 
> Just use ARRAY_SIZE() for the size then the number can't be out of sync.
>
You're right.

-- 
Regards,
Alexandre
