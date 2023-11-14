Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869947EB353
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E8410E218;
	Tue, 14 Nov 2023 15:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660E710E218
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:20:07 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-41cbf31da84so32749311cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 07:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699975206; x=1700580006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BA7pnPzeobuo2moOM/02mtG2pcefll8ayuxU3397aJs=;
 b=ls+FYfbwnDzEulJOhb7AOPu+qPt/aSnyGczTkoP+lIVyBMfrtzCABHf6M1dc905+GR
 ZKImKkIMcz2l7wiMZrgICvsOIf30gUaeyrQ32bXguLab/yFK+h6OVo7aTyRXD4dXEhUd
 4+hYDKWeuBHz4kyvgRL2peeckVmY12Qr1ZMyujXMAXwDwiaKbz/rZ3gqspy+4mdIaA+O
 NQaF+Gp6bmVpedT5P6gDUuMN1xsTQErUM4Kxe0ukdRTJsTXcVOYswZZ1WPvJ8frHYqXh
 XcQiaEEh4eZngKlfPt5rVRLnfcVdiIfcTxobb8ZDl1K2tJDFEpxA2hM8d/TkhgYnULfS
 g4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699975206; x=1700580006;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BA7pnPzeobuo2moOM/02mtG2pcefll8ayuxU3397aJs=;
 b=JIlPkz2XzfgOch10x/jTBt1Fl7QHxEN2MKYuifZjqUywp1rHn3sW45AUVWwY6Vv5K9
 jBz8ub7smxIckeYBybvDmL0LdwiEycFOYQGDSEJc4A2UXouW/WHhazNmBPkl6wZjbOql
 JnLIkfADvId0jg3IJvRPpRVFYBbacxxqfzwKk92Rxqoj4Hand3VzP24VxDimZem2KSSJ
 Vbgm7NX47RRLtr/iWsgl0XT3Pnn62gd2Gj5ryc/SDOwy6QuYoi/oYvbkjkXFLLJeIFha
 LUK6kSbBZNXV13aP4lu67IviVm63lkvlRTtqz9GXvdeoj4Z+tJ+x3Rye3Tdb44X+CM2a
 /TaQ==
X-Gm-Message-State: AOJu0YzjSHNGJrSp8fMvnTLfHfIYlqWRqLHHG/6SrWBg0AYMlaFtsRyP
 clc9TAd9Y2i/i+GteeqwwccyeA==
X-Google-Smtp-Source: AGHT+IEadI/6/GH9NIUFNMeCr9T6NLwUprWeQImT3ovdsHFRg8kMWXk2T9gPr4vx6eENhu9WMgNH1g==
X-Received: by 2002:a05:622a:105:b0:41e:19d5:bdf5 with SMTP id
 u5-20020a05622a010500b0041e19d5bdf5mr2279660qtw.48.1699975206381; 
 Tue, 14 Nov 2023 07:20:06 -0800 (PST)
Received: from [127.0.1.1] ([12.186.190.2]) by smtp.gmail.com with ESMTPSA id
 l24-20020ac848d8000000b00419732075b4sm2806318qtr.84.2023.11.14.07.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 07:20:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 00/17] dt-bindings: samsung: add specific compatibles
 for existing SoC
Message-Id: <169997520487.6747.17671551558724027958.b4-ty@linaro.org>
Date: Tue, 14 Nov 2023 16:20:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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


On Wed, 08 Nov 2023 11:43:26 +0100, Krzysztof Kozlowski wrote:
> Merging
> =======
> I propose to take entire patchset through my tree (Samsung SoC), because:
> 1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAutov920), so
>    they will touch the same lines in some of the DT bindings (not all, though).
>    It is reasonable for me to take the bindings for the new SoCs, to have clean
>    `make dtbs_check` on the new DTS.
> 2. Having it together helps me to have clean `make dtbs_check` within my tree
>    on the existing DTS.
> 3. No drivers are affected by this change.
> 4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus expect
>    follow up patchsets.
> 
> [...]

Applied, thanks!

[01/17] dt-bindings: hwinfo: samsung,exynos-chipid: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/4be756fd983a0d91c258196b3206e9131e63d62d
[02/17] dt-bindings: i2c: exynos5: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/9da80ed69eb150617e8c72aeb7fdb9bfc7b97fba
[03/17] dt-bindings: i2c: samsung,s3c2410-i2c: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/c45860f6ee9b52b2e2f9b9255d93b9875e416cb0
[04/17] dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/5faf7e3d35b819cfa8de971f7e8ed84552c3a676
[05/17] dt-bindings: pinctrl: samsung: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/3e17c66d1aa322db1d68e842089bd639a88a88bf
[06/17] dt-bindings: rtc: s3c-rtc: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/b8029fbe90351d1fdd54dceb39b21c4062c94ce1
[07/17] dt-bindings: serial: samsung: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/6f52f8b78d319ba63ce7fae950d9395d376bb6bf
[08/17] dt-bindings: samsung: exynos-pmu: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/ed856d66b8c679ec1260c3151b2f4f3202aa213b
[09/17] dt-bindings: gpu: arm,mali-midgard: add specific compatibles for existing Exynos SoC
        https://git.kernel.org/krzk/linux/c/e47d571301460a214c6253c15ff79db20ea50389
[10/17] dt-bindings: iio: samsung,exynos-adc: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/bbe4d4bbacd7f11b601a0c912f3f6270558899d8
[11/17] ASoC: dt-bindings: samsung-i2s: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/4a559c3db839afea05dc0f471823d4401b4444fc
[12/17] dt-bindings: pwm: samsung: add specific compatibles for existing SoC
        https://git.kernel.org/krzk/linux/c/0b549b3f74e39f7b0e787f8ffdfd2cf67c0fdc4b
[13/17] arm64: dts: exynos5433: add specific compatibles to several blocks
        https://git.kernel.org/krzk/linux/c/e9a72a20acf7b620e48cd4e268d7c7a4d45e1930
[14/17] arm64: dts: exynos7: add specific compatibles to several blocks
        https://git.kernel.org/krzk/linux/c/a1c0d44441d35063b79f38120105b5f92ca40445
[15/17] arm64: dts: exynos7885: add specific compatibles to several blocks
        https://git.kernel.org/krzk/linux/c/050e7f7217e4d4d73dfcebfbc35b3eafbc36272a
[16/17] arm64: dts: exynos850: add specific compatibles to several blocks
        https://git.kernel.org/krzk/linux/c/bd3623def8a93cea94a8689514e557fd4522dd53
[17/17] arm64: dts: exynosautov9: add specific compatibles to several blocks
        https://git.kernel.org/krzk/linux/c/2a8ff4d56ef6cb4a7b2b4025ea4366178e4e8eaf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

