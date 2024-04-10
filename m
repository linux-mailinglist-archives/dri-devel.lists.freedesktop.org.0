Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A755C89EEC2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 11:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B23D10E9C7;
	Wed, 10 Apr 2024 09:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LUHMIba6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500AE10E989
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 09:29:15 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41739e4f8caso1625005e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712741353; x=1713346153;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z4kwkorErv8tb8SzoHtazPQP+BQoahujJfqdWOv/amk=;
 b=LUHMIba6rtFKwiGKW/Z7Xc+/mhd9pUTofQGKEwuW015YXI7inzm9lCnKBgqK9OZ7mE
 fdOl6pgaqYql+zrtBavDQ0cUcG/Y2ZGfQcMBrL9mgn6g2AuFXOUa4TLv0yB4kVD/TqiR
 rx0AJDivw1gRgxFPE8Q7FAkDesSF9Vw+380lSgtoG9Y3MYs00jY8uKrzeg5UEjKkEsTf
 Xw33rWcu5lY98giy7aetJ71IKslkQZxOrJMhIJ+NneT6MrYvmctTXz5ttRDGy0jhBcRy
 LCX2slE0iAjCQCFR0LCNyh7wy1zi5Po7BuFdWe0bnVsUXGhU2ixbQx0wq3dbm/Gat80i
 pIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712741353; x=1713346153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4kwkorErv8tb8SzoHtazPQP+BQoahujJfqdWOv/amk=;
 b=PDL07zX7QrnSrtHDDg6AWuqlE+LVsAimgCpdAd+nlgfMedhp/2ZQ3AHeI/q+BP3rsC
 WSvuEGWsFrw9B3MZw0WF+yeBoq11lV3ot8aQQxjHTF3Cb+vVLzmZ1gnvqzQpAUlcOKmn
 W1lcYwfRCF6yxa2uD9Evd7k7JBK1EZZ0M7CQkTq3xeLxilHkp+Ag1XLA4lpjsJ8GQLj7
 Df7UU8tW2PSY7cvSbl6tHwEY59GGFAYSR6vAYMG/g7fQmng/TYhOZyFHhg4SOgI3vU2Q
 gdP7W0aOK/1bSaVjxPYmFVzeFFesvG7yBvKFsK54ll3GlswYneXZN4E0rop+W0qY4vle
 autg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0Ew+I3m/yHxtrpABFZWKAwnuOGVha46nkhuhF2yq0MPfYowIUzYnTO5NoCOa/ZcJqSqLkQMYuAf+C8nOl50gaLvOBTdrqEPSJoRgxdb8i
X-Gm-Message-State: AOJu0YxT28BJsCmsGL5pb1U5SA6A5Ov19D0F2YXSmdV/sL8PGfavGQtW
 nklOb5XbLqfu/dszvmOtr53YELpLdjQBH6t36NkP2lHZWfn7gftBpHA/V4YghaQ=
X-Google-Smtp-Source: AGHT+IFvXyauqU6yE1hhXxe+82hSR7xjimh79oxs60By+238847k+6MrB7Ys5sLNSFw6IjHtaU72FA==
X-Received: by 2002:a05:600c:5252:b0:416:643c:8946 with SMTP id
 fc18-20020a05600c525200b00416643c8946mr1274626wmb.17.1712741353432; 
 Wed, 10 Apr 2024 02:29:13 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c19cf00b004168efc77d1sm1698186wmq.39.2024.04.10.02.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 02:29:13 -0700 (PDT)
Message-ID: <9ecf2158-10d1-47b3-a02f-54a4cddbf426@baylibre.com>
Date: Wed, 10 Apr 2024 11:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add
 audio afe document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
 <20240226-audio-i350-v3-1-16bb2c974c55@baylibre.com>
 <e0b48da7-b33c-45e4-b3f3-a6d71bb0afe2@linaro.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <e0b48da7-b33c-45e4-b3f3-a6d71bb0afe2@linaro.org>
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



On 09/04/2024 17:46, Krzysztof Kozlowski wrote:
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        afe@11220000 {
> Did you implement the comment or decided to keep afe?
> 

Though it was clear according to [1]:
"
Audio Front End, this is the same name used for other MTK SoC, to be
consistent.

Cook a new patch serie to change "afe" by "audio-controller" for all MTK
SoC would be great.
"

I want to keep it and fix it later with ALL other MTK SoC.
You didn't answer after that, I though it was ok for you...
So if you don't agree with that, just tell me to change it instead of 
let me think I've the choice.


> BTW, whatever "consistency" you have in mind, it does not really matter
> that much for that example. And for sure do not add incorrect code
> intentionally just to fix it in next patch.

I don't get your point.
What do you mean by "do not add incorrect code intentionally" please ???


My PoV: I implement my bindings aligned to ALL other MTK SoC, which have 
been validated by you in the past. I can understand the copied code is 
wrong, but I've suggested a solution and you didn't NACK it.

I fell like you bully me. Are you ok to stop insinuating bad things 
please and tell me directly if a fix is mandatory and if you are waiting 
for a specific one, tell me directly to avoid this kind of unpleasant 
talk and waste of time, I know maintainers are busy persons.

Beside that, thanks for your reviews.

[1]: 
https://lore.kernel.org/all/eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com/

-- 
Regards,
Alexandre
