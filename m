Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744D38B13A9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 21:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A12710FE1D;
	Wed, 24 Apr 2024 19:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B/OIo+og";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349B110FE1D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 19:39:01 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2dd6c14d000so2241001fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 12:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713987539; x=1714592339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eZYXf5FQbLErGRBPIZbwjjZKcA9SV/r7uJA19KAu/Yw=;
 b=B/OIo+og9jXPaZWxV3GUeFsR2JauYI7zvg+GJaWFugyKGJ9F9rcxMBd5VsMTa1X8Qp
 v2e3pA60rajjnB+7pY+8vSH9uhKYgZzRU5gASz5ZxQTBz1Kaj8PK5TEd19btNrfY5vrY
 nJup6xSZ1y18STkGtVB181ubHlWRjf6ZrpNV6Gxn+vIi16BZ6TV8hKorfyHJR1mlMK46
 pY7Dizg/4lG6FlfYgymaePEncI8rIJvLjUuNiuvf3IdUUm29HnrO5ENt4e6uDnD4zNqZ
 volWvM5CRYoOyQt5NDVZWanO/nUibUkSTDNKvVBmdQrl1pT1zwRvbIJO/91z4BGCbWTQ
 P0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713987539; x=1714592339;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eZYXf5FQbLErGRBPIZbwjjZKcA9SV/r7uJA19KAu/Yw=;
 b=mHNjZ3C5NLW0asWaxXyfN/g3UPg84e/noalS1JeSbNV1MX7ZPVw5+lyzdk11CwnsP0
 eoMkC3zQxl1iuaATj0GDqgfSoENy1OuwiWfFeE75b1MkbljWvo8kRinVKOO5RCGGLv65
 NC1YAmmf3Ak5vh8RJckwZ9Fy5jvixhWj8usJbK1b8TXNqP3wsBBXiZsLHNARgMAKgpUm
 l0ve6jVIXHuaHlVmKBivcEV4I/rEP7irvyCuGCW6ZqWEohETl61PQqH2jVGGQNNsjyhi
 XzKkmyAeE7KUXUKlxs44li48aURnd9Z9H67zapDrRUyewogUw0G1tjPrvvPhkU8sSKWY
 YBFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3OFZr6kE61DIMVePHp36GPESCkZ+MF6/HwAJa5uflol5Lzoymxa5XK1n2IkZricYjhgeniN1J+s409ZpOb6xOHyEUkRIuzVjrxjqLcSbo
X-Gm-Message-State: AOJu0YxDsx5rwB97Q7cjHEHFvDUGKI3hhos9ilCi/1fJDnWDub+pzgPw
 OjG5MSGStf+i/9Hvlsax4a0qxrqI5RalZM/nt4K3YJoGhvtmjzbXAdlgKbt9QtM=
X-Google-Smtp-Source: AGHT+IGSVxrR0Iz8DXzUJljexIWXhVudz/lf75SnOdPFt3EleNTKOAx41xfw4abru9MvTfCcXkSnsg==
X-Received: by 2002:a05:651c:10b3:b0:2dc:bf5c:9648 with SMTP id
 k19-20020a05651c10b300b002dcbf5c9648mr2007333ljn.19.1713987539078; 
 Wed, 24 Apr 2024 12:38:59 -0700 (PDT)
Received: from [172.30.204.223] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 k24-20020a05651c10b800b002de47101c98sm484229ljn.16.2024.04.24.12.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 12:38:58 -0700 (PDT)
Message-ID: <98c013ef-7d03-40ab-973d-cc1d674eef75@linaro.org>
Date: Wed, 24 Apr 2024 21:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] arm64: dts: qcom: pmk8550: Add PWM controller
To: wuxilin123@gmail.com, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-5-e0aa05c991fd@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240424-ayn-odin2-initial-v1-5-e0aa05c991fd@gmail.com>
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



On 4/24/24 17:29, Xilin Wu via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> Add the PWM function to the pmk8550 dtsi, which is usually used
> to control PWM backlight on platforms using this PMIC.
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
