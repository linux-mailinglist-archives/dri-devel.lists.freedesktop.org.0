Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBFAD177B3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABFB10E483;
	Tue, 13 Jan 2026 09:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ewBLMIUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B188410E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:06:07 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-47755de027eso41891375e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768295166; x=1768899966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GwNEb3LQLMo8imJ7VMEa6yN/R9/2JX2cEE8MIs3WRVg=;
 b=ewBLMIUmXrjgBjpkT3wnQ7K06ymBkUbRg+x7dhUID8pw64kEmfSfEeHey7MqLntWlI
 pusmIcYboGVzp6Bp0FaPE2GJaM2k5MjqZ23zuFD1UMUdJaEqYoZyPHX5d2TfqHDXVw5S
 YhxMv9rlyw7SjjaEJRcLdq2XaW+E8J5Gt65wOlSOJY08AliH/1IdoRJo4ppSdt656GKC
 03Lvh8pB/pubKhzEP0EM/hjFkJR+JXYuMLlP5StfYgjQJ+ugCzMxXIRA8KzVNqIKeZkv
 WWEGnNx04fmG3RuN1FG+w+CuSVbpUiFvmVIXYgyxxnUoCrzJsdu4g04xgxKVpOZSE1XC
 VyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295166; x=1768899966;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GwNEb3LQLMo8imJ7VMEa6yN/R9/2JX2cEE8MIs3WRVg=;
 b=iwpQp679hJKOgGar6w+aiMmWRH7LQjFurxwBWawgRy/wjwAhzkVZklmC3GDL2rXFFf
 XQTvIV4MuWaabn3jN+QA/YAN6GWyRA2SvHtr+uqaqqgyQqqDQ66CzIpLaHrSMimhEuqv
 so4maKWBa6f0DvnMqgUULZdvD2uX7ExFVCLQMHck/ZC0iefuDqoCayffsxZT+QihnRVd
 EiiXYd7YXXRhxqc4IIdTeHRXyvTd2dxb3TZ/4g0y5hC2poIkJCDT3E5aet2wL8HmluGB
 9tKROQVT6ZjPI+FthG/hVT+vYmw12ZQ7LknalbhZOLOmt/SsbR3BH0EMQiuSvBHPmD6X
 i7Mw==
X-Gm-Message-State: AOJu0Yx8zTpy0aXX5slH8HSgQqRH6y6itLnsVfwvGu+2+CVtta1SaCNP
 TVx6ryISPJYARpPna5Y/T5RVnbRr9/9979/N3y3HWkn5SlX/P7Tdt9tM+QxGgUoud5Q=
X-Gm-Gg: AY/fxX7qr589I2LkSDt9ju6ok9AsXbqV3yBwrbCnX6cFuV0THsQXU1Pm59qMEX375Fz
 X0iukMyrVFWG6cXfjhT99+5N2XIk+Oqw7/Jn6NoHb7KggHdYTfl14cDRzUOJgmzBeW0MbKa7zXQ
 kXl25j3g2c+hWbxue13kDdC9MXU1bbn0YROqcIocvV8m12PniXkTD2feDuFFUGlByPE7xlYwt3y
 92/jh0EPCBy88OaOQrIcbeUlylmG7qVzcXf6svzQUWUeMDk3UWdFncj94XnL+2cYDVwgtXSiXql
 +hjjAwoGWaL5STCy5Cep83to5nFTnTc5oiWz/lG1ro+1RAqiRsjXYeT6gEt0lJvINwh6iIjLxSh
 8n/KRfWFZOPmk7g/iXQr8aZ5j3f9mmr1Rp0/DV3lx2bRw9nyNyljn+99DpZOqUt5jkWH4/dIjDz
 FwWBhkcpvDLiq0eKgYOxU=
X-Google-Smtp-Source: AGHT+IFTsSsAvkGISPTEuC38L64Wym2rKYPexAbnCwSYfMjdchJnY/RVyoVWKtIiVU7s2aPS+Ux0tw==
X-Received: by 2002:a05:600c:a102:b0:477:7a53:f493 with SMTP id
 5b1f17b1804b1-47d84b32793mr208905215e9.23.1768295166202; 
 Tue, 13 Jan 2026 01:06:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::17ad:35a9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ed9fe7ac3sm11118635e9.4.2026.01.13.01.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:06:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260105193220.3166778-1-robh@kernel.org>
References: <20260105193220.3166778-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: panel-simple: Allow
 "data-mapping" for "yes-optoelectronics,ytc700tlag-05-201c"
Message-Id: <176829516546.3839584.710833770035842126.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 10:06:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

Hi,

On Mon, 05 Jan 2026 13:32:19 -0600, Rob Herring (Arm) wrote:
> The "data-mapping" property is in use already with the
> "yes-optoelectronics,ytc700tlag-05-201c" panel, so allow it in the
> schema.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: display: panel-simple: Allow "data-mapping" for "yes-optoelectronics,ytc700tlag-05-201c"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/94ccf742309be5373314a865a7d6512b9665eae4

-- 
Neil

