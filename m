Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA4F87CBCC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 12:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3358F10F346;
	Fri, 15 Mar 2024 11:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ApsBotS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D8410F346
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 11:01:19 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-430a65e973bso7787661cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710500478; x=1711105278;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5DsyBbYAZw/09Nakq0pDw/8yd9OC3IgRs2xlCXHLsrE=;
 b=ApsBotS5Ei/gmYUHhGx8WppoE/Xu89u7XVTFX0L0migCvs3kz2Bajl8lFH0zoJuZtz
 QA0yBl4sqmW8hL4fsdM/gqBxJqrcB+HKz0gd2W4xedm1pPCf8XE/aSVJtS3n7UCUbPvK
 T/EITZ8yko55f+WNWxouEGp2YOYW87Uf9Tg44N1C9pUvQIo33+WNeVWrDaICzgYjJ1jo
 Jo+nDnpn/gEs7Rj9y0GOA2x49sLbgqCVefFHRnVOvn2/ywUnZdopTWAz4MK6tU4sAw7c
 A+Xq/8UuiCsD/mMqq/3z33Pfg48O/6FvWFBICVinwMp3kAn29pkl+6E3rn88HlgW1oQt
 v03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710500478; x=1711105278;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5DsyBbYAZw/09Nakq0pDw/8yd9OC3IgRs2xlCXHLsrE=;
 b=w+VQHvOyv/QpVEd0V1kozVykunYQZxOPUIgaXcqSwImHZJuaG+b408MxnwYZgwF4kV
 vU3y9EcFJHvcOkthrhB2bEsSTjQmqb/YPObM96YCvqQkmz8nF/5F/U9xuA4aRz5dflPw
 H1kVswTg7I8fcDpJPYocl4jzo51t2SGx0QKJtlzNg28x0/OsMbhUlcjirTTExs8f/mgi
 dL+0wcOq+DPwX6+1fP1UEKwuhq+y1Wry2BMbelTN/12Y+QGZm0Dk4hCHnvx0OrCnVI/B
 fBp0SFNzVNF9D4Wjus2RzNl0ZioOXg9GrgEHM2pPE0QHT7oeyb8AG7/cBWBeyF0TCE6F
 OloA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAVkGk/krGYpdQXnQn6lGzSftFHkC2hqgftodRjY26p6uSdGpHwGLUr4pwaeNJCAhagtD4qBGyPye1PlvDpA/3q0nnZb5CleMePxdy6r5t
X-Gm-Message-State: AOJu0YzF2CLNjUjKVWLu/vQS060nlzHeRtT8Cuk7IWvOx3sLeaDc4mUc
 UGdQrYzB3+Z36bwsOk26Mx8FUpCMikoORIlO84OltSq+RsoBxjhkPI4/ft216kE=
X-Google-Smtp-Source: AGHT+IEVOOgZFoxsLMo3B/9DgMlPg+8mCIQzmFSjWr5NC1POGFlHlr6r0UtoZZxyVjffb0W7416VFg==
X-Received: by 2002:ac8:5783:0:b0:42e:b90c:c5a9 with SMTP id
 v3-20020ac85783000000b0042eb90cc5a9mr5156478qta.51.1710500478406; 
 Fri, 15 Mar 2024 04:01:18 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05622a00c300b0042ef88b7daesm1838670qtw.19.2024.03.15.04.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 04:01:17 -0700 (PDT)
Message-ID: <dda0e6ba-4538-47a0-95e9-6adcfd4169a7@baylibre.com>
Date: Fri, 15 Mar 2024 12:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
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
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
 <c441a132-b16b-4244-a712-8971c902d4d7@baylibre.com>
 <ff3d2db1-697b-42c6-a0f2-74276e9fc098@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ff3d2db1-697b-42c6-a0f2-74276e9fc098@sirena.org.uk>
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



On 13/03/2024 18:23, Mark Brown wrote:
> On Tue, Mar 12, 2024 at 07:03:25PM +0100, Alexandre Mergnat wrote:
>> On 26/02/2024 17:09, Mark Brown wrote:
> 
>>>> +	case MT6357_ZCD_CON2:
>>>> +		regmap_read(priv->regmap, MT6357_ZCD_CON2, &reg);
>>>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTL] =
>>>> +			(reg & AUD_HPL_GAIN_MASK) >> AUD_HPL_GAIN_SFT;
>>>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTR] =
>>>> +			(reg & AUD_HPR_GAIN_MASK) >> AUD_HPR_GAIN_SFT;
>>>> +		break;
> 
>>> It would probably be less code and would definitely be clearer and
>>> simpler to just read the values when we need them rather than constatly
>>> keeping a cache separate to the register cache.
> 
>> Actually you must save the values because the gain selected by the user will
>> be override to do a ramp => volume_ramp(.....):
>> - When you switch on the HP, you start from gain=-40db to final_gain
>> (selected by user).
>> - When you switch off the HP, you start from final_gain (selected by user)
>> to gain=-40db.
> 
> You can just read the value back when you need to do a ramp?

You can't. Because you will read -40db when HP isn't playing sound. That 
is why the gain is saved into the struct.

Let me know, when you change de gain to do a ramp down (start from user 
gain to gain=-40db), next time for the ramp up, how/where do you find 
the user gain ?


> 
>> Also, the microphone's gain change when it's enabled/disabled.
> 
> I don't understand what this means?

When microphone isn't capturing, the gain read back from the register is 
0dB. I've put some logs in my code and do capture to show how it works:

root@i350-evk:~# arecord -D hw:mt8365evk,2,0 -r 48000 -c2 -f s32_le -d 
10 recorded_file.wav
[Mar15 09:31] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_afe_fe_hw_params AWB period = 6000 rate = 48000 channels = 2
[  +0.000126] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_dai_int_adda_prepare 'Capture' rate = 48000
[  +0.107688] mt6357-sound mt6357-sound: TOTO set mic to stored value
[ +10.072648] mt6357-sound mt6357-sound: TOTO set mic to 0dB

root@i350-evk:~# arecord -D hw:mt8365evk,2,0 -r 48000 -c2 -f s32_le -d 
10 recorded_file.wav
[Mar15 09:32] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_afe_fe_hw_params AWB period = 6000 rate = 48000 channels = 2
[  +0.000133] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_dai_int_adda_prepare 'Capture' rate = 48000
[  +0.109418] mt6357-sound mt6357-sound: TOTO set mic to stored value
[ +10.164197] mt6357-sound mt6357-sound: TOTO set mic to 0dB


> 
>>>> +	/* ul channel swap */
>>>> +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),
> 
>>> On/off controls should end in Switch.
> 
>> Sorry, I don't understand your comment. Can you reword it please ?
> 
> See control-names.rst.  Run mixer-test on a card with this driver and
> fix all the issues it reports.

Ok the name is the issue for you AFAII.
This control isn't for on/off but swap Left and Right.
 From the codec documentation:
"Swaps audio UL L/R channel before UL SRC"
This control is overkill, I will remove it

I'm stuck to run mixer-test, please check the following message: 
https://lore.kernel.org/all/7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com/


-- 
Regards,
Alexandre
