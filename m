Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B3B3A79D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 19:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A2810E1E7;
	Thu, 28 Aug 2025 17:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oa+A/JKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE4F10E1E7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 17:19:04 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-244582738b5so10962575ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 10:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756401544; x=1757006344; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SS4pv8uyaXLZEUMjbC2GJgsLUt5PP91S4SC3iNr8JIE=;
 b=Oa+A/JKjPbJD5gBH9aWvnW4wsNeH8vTJg40PA1XPA3s/ZOGDuvKlJyhAVBjKydI8my
 rPAcicjaoMcj7yOjKrk7/Ehiqrw/JAKIU4UovTL1Es3QYqCXvovcBYeXyyWsD3R3VwsQ
 rPL76fcHt9tJz8AzbV2M1FERQd/czaVGMr+r5Jdq+OF6LQhcoS8eVsB33uEsi2appIsJ
 /WUIzt7TMB5nTwXgawwuKepkW4xeUyQo8ZZsuRJF+Ok0RjMi40OA0v4EjG586JpkDSEB
 1LxyHNegFpZDVSNlQue7oIzW7B6I/bqTfr7/hucA0de0D5Ik1nz1WfGr9F8ta1pxsaqm
 IViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756401544; x=1757006344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SS4pv8uyaXLZEUMjbC2GJgsLUt5PP91S4SC3iNr8JIE=;
 b=PqFJ8cE/X/yks3VM099xgfAiTAlRbb72J79i8EY9WXPDjZxpoZ8Ck7NqOzkxR2KufE
 KHQdRpayPENlK6Ie5CVwtZPhn+894Inueiy7uGVUaNqidbfoJaoXbiNBNXxHUt3YbxY9
 n+PpwQ3L8nkXdpzlRLczJLot2/eOg2EN+s6n7Jr+vLDljhS9jcHf1aDI6Z35UqcCUQ3t
 nefBo3mPToIHg7YBPH2PwW1J6HWBM8F70NoLUiVsewswjc7wzSNzPcm6YY0Br81a9g2c
 Ivamo90hIBXVKQlsHLxsQIE/nnV9sOK9PlRXRa4LU9VYh/jCSU+1ONcCUDXYuM2j3pvO
 7epg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6GWQ4bBjL2UiYOypHE8H379IUM7aXs82Ksg+DSF42NGE24e6MDhbgQHVB7+mw4y0qasW2WieNFDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLszLJVBtp4HNwCurbLG7MoedpdcnxxXZwQ9gy2uT+ZLnVagfc
 pn3iiH0N8AKWhael1wZvIc5eACZxAnGOidhke1pFrTzYbmIP3mJUgI3c
X-Gm-Gg: ASbGncv8TwLJNsCKUgjEPLavK0snWAoEZn9/XYxFRt4GvVk8evHy6R1Wfxqlscv778i
 oqQnprGvqKQMotJaEzcEOHBTivqNulmyxivGul0LkqVZ9/qNeVTZ61D43xQDnTJ/EtiJyEe0QM6
 xSn5EV3wxeqcETb34HmdirzH0icpfSMTOUtdmNtxa7DCWrKOHmmOS47tR2Zx2vxPtG2eJbUievM
 U2DWFDfTY6I2NRV/fp9qfzmqu7nUktIJgZGKeioqeTEfSNAA29QMQBYq0GOqP1oNlKNqVGSFTHl
 +GWgMDV1FCu+tnYOiNH6rhM3UYfIllnUF+KdUitz6H3jgL5z+K6qBJOwQlaJ5mDTJ/2joekB1dJ
 4FBBTprxoFEnMRGnKXw+hBWsJDGw5GoJuRA3ahxJfoRVkBx+epPxeWA==
X-Google-Smtp-Source: AGHT+IFPj3GBG1tXe0w52JDhOrrrStWKIT6zs8hpAEsM8UEVZqo8QCtKE2lg8olsPKFlf0oBzRgObQ==
X-Received: by 2002:a17:903:2391:b0:249:308:353 with SMTP id
 d9443c01a7336-2490308048fmr5489935ad.41.1756401543466; 
 Thu, 28 Aug 2025 10:19:03 -0700 (PDT)
Received: from [192.168.1.111] ([59.188.211.98])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24905da2f20sm739185ad.82.2025.08.28.10.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 10:19:02 -0700 (PDT)
Message-ID: <86ab9bd4-9a4f-4ae9-930f-5fb9ef69c963@gmail.com>
Date: Fri, 29 Aug 2025 01:18:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>,
 Lee Jones <lee@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <932e0085-c901-40f8-b0d5-67f8f0b934e6@gmail.com>
 <20250828165012.GC204299@robin.jannau.net>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250828165012.GC204299@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8
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


Janne Grunau 於 2025/8/29 凌晨12:50 寫道:
> On Fri, Aug 29, 2025 at 12:11:40AM +0800, Nick Chan wrote:
>> Janne Grunau 於 2025/8/28 晚上10:01 寫道:
>>> This series adds device trees for Apple's M2 Pro, Max and Ultra based
>>> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
>>> follow design of the t600x family so copy the structure of SoC *.dtsi
>>> files.
>> [...]
>>> After discussion with the devicetree maintainers we agreed to not extend
>>> lists with the generic compatibles anymore [1]. Instead either the first
>>> compatible SoC or t8103 is used as fallback compatible supported by the
>>> drivers. t8103 is used as default since most drivers and bindings were
>>> initially written for M1 based devices.
>>>
>>> The series adds those fallback compatibles to drivers where necessary,
>>> annotates the SoC lists for generic compatibles as "do not extend" and
>>> adds t6020 per-SoC compatibles.
>> The series is inconsistent about the use of generic fallback compatibles.
>>
>> "apple,aic2", "apple,s5l-fpwm", "apple,asc-mailbox-v4" is still used.
> Those are less generic than say "apple,spi". For "apple,aic2" especially
> it's clear which SoCs use it and the set is closed (ignoring iphone SoCs
> which very likely will never run linux). For the interrupt controller
> the fallout of not using the "apple,aic2" is larger since even m1n1
> expect that. irq driver is special in so far as it requires more than
> adding a compatible.
> I think "apple,s5l-fpwm" and "apple,asc-mailbox-v4" are specific enough
> and describe simple hardware so the will not cause issues unlike the
> complex firmware based "apple,nvme-ans2".

All of these compatibles has around the same specificity as "apple,nvme-ans2" which is
a mistake of using A11's version (ans2) to describe the M1 nvme (ans3). Though I do agree
"apple,asc-mailbox-v4", "apple,s5l-fpwm" and "apple,aic2" should be fine compatibility-wise.

Although AIC2 compatible should be fine that may not hold for later versions since Linux's
AIC driver is actually AIC + core complex FIQ stuff, so when you do add newer AICs it is
probably better to use SoC-specific compatible there.

>
> Janne
>
Best regards,
Nick Chan
