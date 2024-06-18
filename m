Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E54890D37D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 16:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1927910E687;
	Tue, 18 Jun 2024 14:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SzKjKT1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659810E687
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:06:26 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52bc27cfb14so6802383e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718719584; x=1719324384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+So+e4AIxy5W1wf2KjSmogFgzVVYZd75IixT8YReE44=;
 b=SzKjKT1Hx9v85nSTFi2ksKETJ8mhdbTRIFe/FzhhbAFKhOENfuNQc0WCzb5qmL8p5r
 1RvJJeBffLgn9YS7f1bs5TEiPWU0u+jitCSubGFzGP5j2kwa29FaaHUZkmDdAAfFAW4X
 IkTrqQGgt89cCUOiS9uKLr5duqBw+3E8tGUYJwNErooCzvUpJ9YEIAWJbrXzBMCRU5r/
 7m5e8G6ladL7jjFuQF0PgH+9FMbvB5sKRVnFBtM2oiTNtOurKZxXirREWPLb9AkQY5Up
 ciXvuRJ2rTNCxxDAVHycpp6Kiitvq1KIuUi6kAEd0Qhhtr8IvBgSJrgtAlWBSxYa/fbk
 9yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719584; x=1719324384;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+So+e4AIxy5W1wf2KjSmogFgzVVYZd75IixT8YReE44=;
 b=va7ASeVvHTLkbyh1K7FNn1xDRy88x3gQ0n5Rx8FqBzUP1+zVlf+ktvn23JGwnPTipW
 zNrk68Lj8u2YNu5jZyG4R5c4yOot4nfF2QLDukamfwhJWOj0NOv0/x4JGfOXSA6yVnYH
 O9Kxnd9C/Xt7xDuQa9x68juLxGpCGOp8uHPEXhlreywXKtqfgvFZ9/KbxtUBJawP9YDE
 WVf7wGfDUT1nfOzHzr6HaiPH0aZZYGgzovgYreYX9Yul4YuCcdRq7JPsDbeWKFFMJqXL
 vt1XyFl+PY6J8+A/QYXXU+MUOjB4GPNNBxULWTNmdo8MfaSSvZvnEEw/67vVN5D2PRHX
 x+kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKessXjRG02iN/zuW/1+yijtJWRJnXlhDHSTPa9UyARCA0a6r3fPZZxpbt+9b2KzdGP9M//cJRKVaK+/yToBZndotosSn9PEZFXf598duU
X-Gm-Message-State: AOJu0YxRW0G9ZMzGVrakk4p+uNgNRyyaW+XueKzsrG67j5m/6TMiWljF
 +SfLkY/BNgZdJL/dG54D/8WNk6LdVz1gVbcLJlaQhOInD4rM867/rkBHDPGYkAY=
X-Google-Smtp-Source: AGHT+IGY5kISvhIt6rGqgfv/SlC1aIqmQbwMlMYxf3oPhg19EaPl7J618YwZRjbodQ1Ardwyi8neOw==
X-Received: by 2002:ac2:44a2:0:b0:52c:a5cc:27e7 with SMTP id
 2adb3069b0e04-52ca6e9dafcmr9013751e87.66.1718719584220; 
 Tue, 18 Jun 2024 07:06:24 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287ad4fsm1536033e87.201.2024.06.18.07.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 07:06:23 -0700 (PDT)
Message-ID: <31921e1d-da7f-4846-9d69-4e27d61cb464@linaro.org>
Date: Tue, 18 Jun 2024 16:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/23] arm64: dts: qcom: starqltechn: remove wifi
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
 <20240618-starqltechn_integration_upstream-v3-20-e3f6662017ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-20-e3f6662017ac@gmail.com>
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
> Starqltechn has broadcom chip for wifi, so sdm845 wifi part
> can be disabled.
> 
> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
