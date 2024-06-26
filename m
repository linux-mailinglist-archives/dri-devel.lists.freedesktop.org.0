Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C09187C3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199B910E960;
	Wed, 26 Jun 2024 16:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eLuFMH0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AF510E960
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:45:31 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ec61eeed8eso41628221fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719420329; x=1720025129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lz0cNwBgLN/q1pisbwzHSTSwITTngcdDir0qSu+izhw=;
 b=eLuFMH0k3+OudVQTSY5Jmy4CZRBkLpgAVYQCT4rmJyqRK+laX8WrXf5F/h78CN9so5
 /LgqT8UwhJXaK/ACJIIr1g6gVe2Vl5/B0CdDHBLzkpDJ2K2PH4LG0JihchlDXxU6hZzM
 Eio+uuezFGZQhSbsUN1XRl4lTfBXKR9hLG5aire7YeK55eJy5tEUKUnFCGvbkkY31bc1
 qXNxYS5JSMoEBfN7Acc79NGYNsUHevmIhNqBVrLZNKZOPPbtDw52XB+QSaSrPsYhTE4T
 N8FBLsrNhqU+ZeMIvMLaL1Xg9TIVTc0gpZ8/BKGYlcMYBJ+fsv3G7OCSU6M+xIHaP4cL
 ctAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719420329; x=1720025129;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lz0cNwBgLN/q1pisbwzHSTSwITTngcdDir0qSu+izhw=;
 b=Nt/yfsvgzGdKrYjWO39f9lbT3ufEEBSvSZdnpveW7Jp+2lLfr5HoUDJ0ORegvzewiO
 34x5odMJOoCpVTsMb7FrZvjUuVo4ZR6ixJ4BLENMdnTSAe7+WTzxxqptQHCDGgRCbsQ+
 UpQb4cXjCG6HuEF8DIZFWp+cSnQwvoTM2cfc0bv7Lo7J5njiA3wYaczRKgQVoR/1CbwL
 3BEi3sOgfu2Ffg1ev3Gjsd1vLbx+LYfx/vMH7cH4A9Wvpivzu4FcuWaDa3FI6UYfb6LI
 b3Ke+JtOQhNNQSEpM9tXJc3bAm9oJSDhqBkWplPoqnUnLJmqb3/7zAEMh9qZpIQolLw6
 7XMA==
X-Gm-Message-State: AOJu0YyQfKxQGULqFptckaAcYTOJgT6hvTuSDRhvzQX5rURlt5npa65I
 uTrUQiluk5ON9co32CYy6yZEE9wmUqQ0fjzhQv6ChONeEju5x8rfBmrzmXpVFBg=
X-Google-Smtp-Source: AGHT+IHZkdTYNY9XjPg8vTYUIU2x/RrHKqAmZArKRjfj6RPD4xbNZZAz/zyjT5CN9xjWCBkBDvABhw==
X-Received: by 2002:a05:651c:1991:b0:2ec:5bb2:c236 with SMTP id
 38308e7fff4ca-2ec5bb2c276mr86596561fa.33.1719420328949; 
 Wed, 26 Jun 2024 09:45:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c825f752sm31945865e9.20.2024.06.26.09.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:45:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Michael Walle <mwalle@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>
In-Reply-To: <20240626144433.3097793-1-mwalle@kernel.org>
References: <20240626144433.3097793-1-mwalle@kernel.org>
Subject: Re: [PATCH v2 0/2] drm/panel: initial support for the Ortustech
 COM35H3P70ULC
Message-Id: <171942032809.3067283.16387497426069805586.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 18:45:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 26 Jun 2024 16:44:31 +0200, Michael Walle wrote:
> Add initial support for the 480x640 DSI panel from Ortustech. The
> panel uses an Ilitek ILI9806E panel driver IC.
> 
> v2:
>  - use drm_connector_helper_get_modes_fixed(), thanks Dmitry.
>  - slight header files cleanup
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: add Ilitek ili9806e panel controller
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b7a0c0e9d80756da52d5c88f24b5253a08108724
[2/2] drm/panel: add Ilitek ILI9806E panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/baf272bac637d3275bb83c17ac849b44a4590655

-- 
Neil

