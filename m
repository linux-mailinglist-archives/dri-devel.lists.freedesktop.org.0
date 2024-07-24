Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7193B653
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 19:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7286910E788;
	Wed, 24 Jul 2024 17:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="iXqkZy2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D439B10E788
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:59:24 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-368440b073bso83409f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721843963; x=1722448763;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bB2QAOI7VV4nz4PEqDaYS/ujHUAYYtna7nIFDg5mVV8=;
 b=iXqkZy2wwB3HOI+suBfHT1HEqUcEB0oGN6kTL0rYiyKMt9wbmlt5jo3Qqw7qcqiN8G
 5HSogXaofJc7aXa1MA1ifuCnfznWfhJP78gCCAtLZWk7uUtzOdcNzZp8OkJjbUbah1F0
 HcClXF7iUrqJH4K1hgnsB/FuYsJ2VC6A8M5Wq8mlzJNXo8uwlZU/BwTi9UvZrrokRc9Y
 c4/y5pex+Is9nrPPZICmLYVNQl55S7Eqd3cvzEyLTDnp75ogCOVBp7F/4JuqoJyKhX99
 4nghD1dyzwaB9a244zan550mwgUj7CdV+9OGJyBoPw57LtxUJi9gUhe683ow9Zfe1+0e
 2/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721843963; x=1722448763;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bB2QAOI7VV4nz4PEqDaYS/ujHUAYYtna7nIFDg5mVV8=;
 b=kMeDxFLo+OHPr+eYbsyiEdgDWYrkytGjtmA1CyS5HVxrzctNQgQ1IXWNJFjaBPfeWj
 0uKrAd32Ub8dqRR1vuT/WIZaZrHsrH5RekTqQf1gzJGdKD1QgbFzkMVY6T68iMj9x25U
 iaY0inmKbJs1FGMbP5RGpj0YxrmaHSAmPey2e3jPFW0YJJripz9Qqh6Hl7CRTdIEuOif
 r59DfKN1pHsgEi2AbkKowZKgmJU3G1PEApM5OZfI3YR3l42cQMH146CrVIQAaS4TsEnk
 RJHQaAuXJ68daFjBqtbTWj/MiwQV0iLVNjfRjgSIbM8iwgPOw39y//90HuQhiCVTK3Dy
 9iCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxL1uaZwetcp1dqA1UdqbWWRaHwS4fKnIQi0L2ZA+CkpX4Je92loe9Ar0tPNrtU/fOD4vWTPEBP7P9wQna2mMY5lMCqBLhKuIrG8fImFbl
X-Gm-Message-State: AOJu0YzUj/LavvZoRVWwd4WIET668I2DhmdJo09oN+op2KnC9Vjf8BW7
 xvXcB5NSLa+ZB/xLYEBUPbjVck4rxCDlOE6SuLaFILWTvwBmos/dvaD/8g4kPl4=
X-Google-Smtp-Source: AGHT+IFYzshvY6vOeAFXLV3Aba9jnBfSJVOk5zJI9cgMfhJjkemmfOUrnmKShd36XZ2Mek+kPAuwhQ==
X-Received: by 2002:adf:e001:0:b0:368:6bb:f79e with SMTP id
 ffacd0b85a97d-36b31b3092dmr333633f8f.4.1721843962600; 
 Wed, 24 Jul 2024 10:59:22 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8?
 ([2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787eda2fsm15265721f8f.108.2024.07.24.10.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 10:59:22 -0700 (PDT)
Message-ID: <c302bc47-6492-44af-86a1-3ff6a815e314@freebox.fr>
Date: Wed, 24 Jul 2024 19:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e55d0f0e-a104-4790-b832-120dbddd93ad@freebox.fr>
 <20240715-stirring-purple-toad-7de58c@houat>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240715-stirring-purple-toad-7de58c@houat>
Content-Type: text/plain; charset=UTF-8
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

On 15/07/2024 16:40, Maxime Ripard wrote:
> On Thu, Jul 04, 2024 at 07:04:41PM GMT, Marc Gonzalez wrote:
>> On 01/07/2024 15:50, Maxime Ripard wrote:
>>
>>> The i2c register access (and the whole behaviour of the device) is
>>> constrained on the I2C_EN pin status, and you can't read it from the
>>> device, so it's also something we need to have in the DT.
>>
>> I think the purpose of the I2C_EN pin might have been misunderstood.
>>
>> I2C_EN is not meant to be toggled, ever, by anyone from this planet.
> 
> Toggled, probably not. Connected to a GPIO and the kernel has to assert
> a level at boot, I've seen worse hardware design already.
> 
>> I2C_EN is a layout-time setting, decided by a board manufacturer:
>>
>> - If the TDP158 is fully configured once-and-for-all at layout-time,
>> then no I2C bus is required, and I2C_EN is pulled down forever.
>>
>> - If the board manufacturer wants to keep open the possibility
>> to adjust some parameters at run-time, then they must connect
>> the device to an I2C bus, and I2C_EN is pulled up forever.
> 
> How do you express both cases in your current binding?

It's not that I'm ignoring your question.

It's that I don't understand what you're asking.

SITUATION 1
tdp158 is pin strapped.
Device node is child of root node.
Properties in proposed binding are valid (regulators and power-on pin)
Can be supported via module_platform_driver.

SITUATION 2
tdp158 is sitting on I2C bus.
Device node is child of i2c bus node.
(robh said missing reg prop would be flagged by the compiler)
Properties in proposed binding are valid (regulators and power-on pin)
Supported via module_i2c_driver.


If some settings-specific properties are added later, like skew,
they would only be valid for the I2C programmable mode, obviously.

Regards

