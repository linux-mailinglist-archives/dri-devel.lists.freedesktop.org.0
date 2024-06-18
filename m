Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E9D90DBDD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 20:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3321310E6A3;
	Tue, 18 Jun 2024 18:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="piSVJ0qF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969E710E6A3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 18:51:00 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-35f2d723ef0so4862581f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718736659; x=1719341459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4NNuHMGJgaTKLiPOtfYsc30dpCZBTyvx+s6PAIySkOw=;
 b=piSVJ0qFWamvljhwPPwGRQq/C0GwFgqspaSVtm4g1jHuw8A91ITnXkGdWpUW5v7Hma
 8zlsadrOx8cZwM3U/NzFriCBs2mDTtWWsRKG2BPeicziE5oKvh1u8eCKq49lLCS5C7DS
 6oKSyukG8FcsJl0pJARE+voPLLuCyo/yF9IeNubKEYW0QzjL9jAZe8oz4fcE5G0PD+Po
 C4rOGRwKXZ9ku5l9C7sMNLKyB0/5vrXvdlVDbO2ZqxlKdC4vMCZwxtuxjTTKmum97wzt
 W/ktO1RGgejbxdA2U+HbNSOK29WqABzBGxTL8/WZaR96SKsR4d2Kxd+auTZjLwGLINbQ
 PUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718736659; x=1719341459;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4NNuHMGJgaTKLiPOtfYsc30dpCZBTyvx+s6PAIySkOw=;
 b=v378c4kkPQU9wVjtoB691dVWBNajkEZC9NLrh32/GKKBgCtAnR4XFv/aeOa0J7sZV/
 BN9t7EHfwJq6eWvJdqRmIlUJIBmLMv34kkRY6b72mF6Ipns0d9fkT2IcSFblSnJWGfFv
 N0oZBuR81+DGmwdDwzKQSvcp4HHIGb+a1j93i8Mu6LPaqSEZwGx4hdwUAnXN+HrJLKHj
 Yh8fL72VD076IvDO2oCrcgdVx6NVCh0BFUNTVU8SnZ1XMZ/0Jgk2n3Eak9AlEOvVwr55
 TjlCVR/vqdLmK5kgAra8A8JwIJZnKqjUllYOcnXC+mxRaOl4yItwGMSKuj2Gdhd4yw8e
 k/Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwU1DgAbrkvLwafoSIzjzoNWvBLpF2G1SmnoGathd3qY7AWpu0drr/jVuVIXMLn8Kke4Qcexth3OLHViZpx10aZf/frSv3H89ekZ8nQb7H
X-Gm-Message-State: AOJu0Yy70tzFrvl4NunBZUEAiRrEu4qY+duFv7Ylq/1UoEAUD/mmvMej
 ydZuy2VDrN8tLvnrst537eQGwzGHrRtXWOS+dXZfDF6CQkPKg3yJfBVMhKqLM5Y=
X-Google-Smtp-Source: AGHT+IEQ5dUal8MlXaC9EXR+oZ5/RpW012l22b3onGYiqW8pfuRDA//boP9uvD07m2VUMQn/ucFrhQ==
X-Received: by 2002:a05:6000:8:b0:35f:e0f:69a6 with SMTP id
 ffacd0b85a97d-363175b925cmr328399f8f.27.1718736658756; 
 Tue, 18 Jun 2024 11:50:58 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:5d11:7fa7:8997:f811?
 ([2a00:f41:9028:9df3:5d11:7fa7:8997:f811])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c8fbsm14732083f8f.43.2024.06.18.11.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 11:50:58 -0700 (PDT)
Message-ID: <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
Date: Tue, 18 Jun 2024 20:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
 <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
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



On 6/18/24 19:50, Dmitry Baryshkov wrote:
> On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
>> sdm845 has "General Purpose" clocks that can be muxed to
>> SoC pins.
>>
>> Those clocks may be used as e.g. PWM sources for external peripherals.
>> Add more frequencies to the table for those clocks so it's possible
>> for arbitrary peripherals to make use of them.
>>
>> See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)
> 
> Each time I look at the table attached to the GP CLK, I feel that it's
> plain wrong. In the end the GPCLK can in theory have arbitrary value
> depending on the usecase.
> 
> Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
> allow more flexibility than a default clk_rcg2_ops?

If we can somehow get max m/n/d values for all possible parents, sure

Konrad
