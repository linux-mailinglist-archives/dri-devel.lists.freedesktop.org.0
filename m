Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4247890D383
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 16:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF29C10E0C3;
	Tue, 18 Jun 2024 14:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cvbxyy4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB54D10E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:07:02 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so64913531fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718719620; x=1719324420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3si6hS7kdezOYwXxr/YuIhrD0I+xKbIgHBoEok6r9As=;
 b=cvbxyy4yyzqSoj+2SofHYwOs7HoYlw7ts8dE4c243/XeWAOeKoLWMjVe+5jllhjr/g
 BnPzY2QfFdV5OQ0kWDXkEp2Gf5il1iEe80jxIQNNqDHs0tr6pNafM04TjvfEU6bUVEc/
 1ykv95CeM4H/U60RrV0tFpUn4HVuo8U2piOrdk+Xl2P5FB0WmbMlPx9G1ixr3x9T/mFF
 VWqagr91+nMVCsXZSjSqC0a3AfcpjLaby4Id+BsmzR7E4LTypfJ+N/YP9Anq91Z6fPf8
 Oz5oGRDILZs+YXIi8NZCAmZotdomvlxXJsrVMrBdv7n/R0ZETR9k1DsPc9W8iPRZwJAv
 Bk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719620; x=1719324420;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3si6hS7kdezOYwXxr/YuIhrD0I+xKbIgHBoEok6r9As=;
 b=BSSEOrf0U5e5LkEnsRDssNmXRuTUlY9re4QuucIyofOWly48Nd7G0oisGa8MQ/uo9D
 ioYG02okwTpllx1uRqZwILdZ+P2jCdxoCppSuCzprBxBqtNPQ2c0eh7VvD2tTM+JH63D
 FDShd0XSQIW8xMTdzMumlm+rtLFFQ1iTbRTSbvVq126SpJf5NiWU2evsVgpeWGYDByTZ
 2SgH509BnqqrHuqYV6On24eeXt3gBJ13IMPpU7rhPtrxSaFQyOHFxwM/Um0T2ywcE/0Z
 0yYuhRhTudalUebdE/P2NN0V58HMxaKR5QBdaLVXBLvaRx0JwycoAWqZieirRF52HOeq
 M6jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsCeIYIUsS7I+higMBhR08H6A6jUyoDq64hUVYFdXLshFy1VzsflRjMx7OkSMbZ0ZLYpuDib0cYmmxVF6if6wCGOliLh5p8SFfiVabtR8r
X-Gm-Message-State: AOJu0YyCteC7ewzr1NjWX+ZMypXxfTByObBLn0Yodb6EYLMzqoHAv0fI
 hBeeNCuJRQDvOuQhTOB3cZWeAiS6a5SjUy23JA9FGrrkCzSOWJCYG7EM+EOJ4q8=
X-Google-Smtp-Source: AGHT+IFJLofjUC4t74eowxJ2/hsKLGcRlwVabKgkrjURD4QDMFbmjNw63Vi/v4qqaIE7wwB4ATA/8w==
X-Received: by 2002:ac2:5de8:0:b0:52c:8289:e891 with SMTP id
 2adb3069b0e04-52ca6e56efamr9347270e87.6.1718719620233; 
 Tue, 18 Jun 2024 07:07:00 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca28723dcsm1517734e87.151.2024.06.18.07.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 07:06:59 -0700 (PDT)
Message-ID: <51ee3d59-cca9-45d0-8a0b-31bc707b22cd@linaro.org>
Date: Tue, 18 Jun 2024 16:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/23] arm64: dts: qcom: starqltechn: remove framebuffer
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
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
 phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-21-e3f6662017ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-21-e3f6662017ac@gmail.com>
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



On 6/18/24 15:59, Dzmitry Sankouski wrote:
> Remove framebuffer because a panel driver introduced.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Not sure if you want it gone, this still provides framebuffer output
for the first 1 second or so

Konrad
