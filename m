Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDD78AD2D3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 18:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621A510F7C1;
	Mon, 22 Apr 2024 16:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NYCQiz2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521A110F701
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 16:57:52 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-34b1e35155aso1186031f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713805070; x=1714409870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFejkMe0OVlEaHFS27AO4JIPaFi1PczIDcBY/+c6L4w=;
 b=NYCQiz2aWZCSX9rlfxPR+nhUMyBKpDZLl44M+lvh/gJzv5+SNHMev5cNFsfbqbvCcO
 dixUhdC6SCcuVRG5BFIFpm+RcupKAp24075LQYh+vnUFKosz+EXIEMLJ7y3MgwAIoWot
 kTAb2Pubd1HcX36dKYiYrXSLGJtQ5Szy/Fi5cGdTZFEOWhGH6R4NYJcvq/VZt9rRHZw5
 /5fEWO324LsFdcohLZozrGq67qwwjSHzJFRkhAJ1u+bokw/gSdiqbrdmvw5raWCjfGo0
 RZxUnsU6/uRNE/bArvF2zXSII3btjtDAO+0fUBqRfj/1uDY3i4epwehJlUyXFEm/soi9
 8wOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713805070; x=1714409870;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFejkMe0OVlEaHFS27AO4JIPaFi1PczIDcBY/+c6L4w=;
 b=Qra1ZDn5IfQXqszXYhbbY8ozvSX5uuSt8WJqWJMJqrGjZJHeEObA5Ii2cqTJcVWySS
 LRUIH2wB426F8OYgeV/DOIsdT3RpFVfq6bc0tgx0dBtxzmYl8l2UhuCDG0eCVymvfaVE
 ygvwT0ooCihrG8V/L0IvjCHYRtAsVVcMH3Dz2wCS1u7rnxkYvgVcj85pdHJqvEghgx7k
 Wa0HMZEGYexH95zIjDWcnVXBDlHAe2sX89rkBFKysZSe6+3Tm0NXb9/AJvz39rdBtiXr
 qYg0pjkJD9e8f59f3cnaA0gmPU0uEWkb+hdYZpukPRTNiius+WaCdiO/inh0Os0IJy0r
 h1bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjTvvgJwi+NEjT/o2Q1kw/fstvmSC8oAHm7GlgNSRZMhbax8UCE8xVKcAwsW/GTCyKdb3o+aTmq8rchbnM6BaOb1VgKnTUeGpIxc/GWOS0
X-Gm-Message-State: AOJu0YxyjPtM17mgeUypmhjgXuG98hll6L1CL4PpoVpr4k9Gb6ekh3Bj
 KB1c2spKH0pIqjOVJmWx5L7JbyEPVxf78CSMvEka60Y4N9YKAFhhYXAq9zxSCp0=
X-Google-Smtp-Source: AGHT+IFPgoNY7jL28vA9FqUBo9t0jArnUgL+gophkF/W85BBll+VXJnnlKToYJDSJz0chYDGNDGGmw==
X-Received: by 2002:a5d:4082:0:b0:34a:2c89:8517 with SMTP id
 o2-20020a5d4082000000b0034a2c898517mr7612659wrp.10.1713805070257; 
 Mon, 22 Apr 2024 09:57:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a5d6207000000b00346f9071405sm12509330wru.21.2024.04.22.09.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:57:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
Subject: Re: (subset) [PATCH v12 0/7] drm/meson: add support for MIPI DSI
 Display
Message-Id: <171380506905.4152979.12753297685732463141.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 18:57:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Wed, 03 Apr 2024 09:46:31 +0200, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5 now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[4/7] drm/meson: gate px_clk when setting rate
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5c9837374ecf55a1fa3b7622d365a0456960270f

-- 
Neil

