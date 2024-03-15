Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2814E87CFCA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 16:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6892310F582;
	Fri, 15 Mar 2024 15:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="itpA+87N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E18210FE76
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 15:05:26 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a45f257b81fso291482866b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710515124; x=1711119924;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=24MutwcHiBZkjQYCos7XDdDwAEGZOLUpdfO5OhJienA=;
 b=itpA+87No60rTJSw6VuM65/8xd2XNHVS22LkP8NLOQ5O1VaSqddlgj1ffW0nY4WbXO
 9Hbah3SDNHWfkSNPjbptVJcE9eTf/LRKUMULznRmPxXysGraiSlOexEiFQiRF0bJUbHv
 rCKWJ9aINfK1FK37Cq8/yUHJ9jYpfguEvwko0kK3FuZND/9A16sn4i7jCdcc6lMLIhVl
 xARuoWxSgtR8caRnTpHdpMa63i5pIfxVQptClbfnkSandu34x9k5AddiwWXaNxKSyvfh
 3a9q85XnuVDMnvgWwCp6KA+9x2A+TdAup1euI8sxp0Fd3RmwBt4vAtqDz0BU8oSY+YQQ
 ZcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710515124; x=1711119924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=24MutwcHiBZkjQYCos7XDdDwAEGZOLUpdfO5OhJienA=;
 b=u058ogk89be1giXibOK2eeQrJCTLhe01qeNNXI7dquPm5XPTHYcsN2jHsS55BsQKJu
 mtGURi+KdGVEF1IfZUwLWXY3nq3t29zjiC+05Iaorx1+rosbxmwSKpl2W2HvK9N4WrqN
 JOlIudz10jxwRS1Zo7mcvj/1G/llA5se7doMZVhVV8IO1ruy2C2EuKeYQz3HXh9PyJbI
 WKMY/9/TGy8TK2RQf4egNuw26MVHXGkoj8mGHCYYLEqKkzS/F3fQlkSPYcteh/FkoF/8
 NGWPf/AhZ1M8OrGKfjzouQoBV0pOtw+aLSJ3wcj2X6ZUeqDKLUIphRNijwMP+0oz1jA1
 I0/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzi51ZywxPEQFZJvR3mItpwGYrre3p2GSQZ50ctyhy4n1PNHqfu7mx0dBldTUWJIjQoK9GijJWKnHA0XY26q5hSDRKWDqh1PpT4ZL5ULiN
X-Gm-Message-State: AOJu0YzzCVu9tNBvLN2tzeK28yKkXhfuPxptiJq3ZXQBskRWkC/QC71q
 opASluH/MqrKgG/XhIK7t/8Yxk7PEH21aMgWQlgG0K6+zKq2UIbVB5xc/gTRtRo=
X-Google-Smtp-Source: AGHT+IEO2hyzf/1xUUR4DWAg0e4i1y4j4ET1cfOEMZuvZS0x8BJ0B3U9ZhIu1vGtdXCzcUUMUTMYUw==
X-Received: by 2002:a17:906:9c8c:b0:a3e:cdae:7aa2 with SMTP id
 fj12-20020a1709069c8c00b00a3ecdae7aa2mr4284674ejc.35.1710515123916; 
 Fri, 15 Mar 2024 08:05:23 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a170906051600b00a441a7a75b5sm1773189eja.209.2024.03.15.08.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 08:05:22 -0700 (PDT)
Message-ID: <fd53a0e7-fa70-4c0d-b578-393183487335@baylibre.com>
Date: Fri, 15 Mar 2024 16:05:21 +0100
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
 <dda0e6ba-4538-47a0-95e9-6adcfd4169a7@baylibre.com>
 <0d31ffb2-9df5-4c3e-a728-902b71a1a713@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <0d31ffb2-9df5-4c3e-a728-902b71a1a713@sirena.org.uk>
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



On 15/03/2024 15:30, Mark Brown wrote:
> On Fri, Mar 15, 2024 at 12:01:12PM +0100, Alexandre Mergnat wrote:
>> On 13/03/2024 18:23, Mark Brown wrote:
>>> On Tue, Mar 12, 2024 at 07:03:25PM +0100, Alexandre Mergnat wrote:
> 
>>>> Actually you must save the values because the gain selected by the user will
>>>> be override to do a ramp => volume_ramp(.....):
>>>> - When you switch on the HP, you start from gain=-40db to final_gain
>>>> (selected by user).
>>>> - When you switch off the HP, you start from final_gain (selected by user)
>>>> to gain=-40db.
> 
>>> You can just read the value back when you need to do a ramp?
> 
>> You can't. Because you will read -40db when HP isn't playing sound. That is
>> why the gain is saved into the struct.
> 
>> Let me know, when you change de gain to do a ramp down (start from user gain
>> to gain=-40db), next time for the ramp up, how/where do you find the user
>> gain ?
> 
> In the register.  You only need to reset the gain to -40dB at the start
> of the ramp.

Sorry but I don't understand your logic, I'm not able to implement it...
If I'm at -10dB and doing a ramp to reach -40dB, next time I will read 
the register the value will be -40dB.

This implementation is also done in other MTK audio codec drivers.

> 
>>>> Also, the microphone's gain change when it's enabled/disabled.
> 
>>> I don't understand what this means?
> 
>> When microphone isn't capturing, the gain read back from the register is
>> 0dB. I've put some logs in my code and do capture to show how it works:
> 
> Is this a property of the hardware or a property of your driver?

At the end of the capture, the gain is set to 0dB by the driver.
At the start of the capture, the gain is set to the setup gain.

AFAII from the comment in the code, it's done to avoid the "pop noises".

> 
>>>>>> +	/* ul channel swap */
>>>>>> +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),
> 
>>>>> On/off controls should end in Switch.
> 
>>>> Sorry, I don't understand your comment. Can you reword it please ?
> 
>>> See control-names.rst.  Run mixer-test on a card with this driver and
>>> fix all the issues it reports.
> 
>> Ok the name is the issue for you AFAII.
>> This control isn't for on/off but swap Left and Right.
>>  From the codec documentation:
>> "Swaps audio UL L/R channel before UL SRC"
>> This control is overkill, I will remove it
> 
> This is turning the swapping on and off.

-- 
Regards,
Alexandre
